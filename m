Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA6A5BAD0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB66E10E52B;
	Tue, 11 Mar 2025 08:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fl9CboID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFE710E52F;
 Tue, 11 Mar 2025 08:28:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCC355C4A94;
 Tue, 11 Mar 2025 08:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43464C4CEEB;
 Tue, 11 Mar 2025 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741681708;
 bh=7ZwpmjJZnpXO5LGEbzV1r/EFTliKGVJ1yxIMUn7Wtik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fl9CboIDc/cKyNQHJ2awS1S6wbFQGeZmp6w12zghNyj+TjyihMuXMKhWJHk7YhxUe
 EGYTz/gteoipus7eSqlmrhaSQxW+3SZH3MgnFjn3FIZP3oJCP6jCEE/P7gNlyLhytz
 IlPJWtWuCCoeJLJeoWOTiD2httqwg3jchVIGI01ZWAFWo5XgG3Ynv3BdFLA8sXkMGz
 ATZCqG5Ok7Sg7Q+zGtqB5ZgEIbPkWWDvAvCTYK3tbxj+8i35TDZ/CqiyeSej4o2jr+
 SEDvjM/RgkmQgOUzX920ZTfYnLBcaTCBpj995q7vezHkRjr4NHIL1djyYyd3GqQWmE
 fTqXZzslbriAw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1truyM-000000004Mn-2Dgn;
 Tue, 11 Mar 2025 09:28:23 +0100
Date: Tue, 11 Mar 2025 09:28:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org
Subject: Re: [PATCH v1 2/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Message-ID: <Z8_0JuNTDpgani-d@hovoldconsulting.com>
References: <20250310211039.29843-1-alex.vinarskis@gmail.com>
 <20250310211039.29843-3-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310211039.29843-3-alex.vinarskis@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aleksandrs,

Just a drive-by comment.

On Mon, Mar 10, 2025 at 10:05:52PM +0100, Aleksandrs Vinarskis wrote:

> @@ -1084,10 +1091,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>  }
>  
>  static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
> -		u8 pattern)
> +		u8 pattern, enum drm_dp_phy dp_phy)
>  {
>  	u8 buf;
>  	int ret = 0;
> +	int reg = dp_phy == DP_PHY_DPRX ?
> +			    DP_TRAINING_PATTERN_SET :
> +			    DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);

This is hardly readable; avoid using the ternary operator and split
declaration from non-trivial initialisation.

Johan
