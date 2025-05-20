Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C7ABD4FB
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2601910E207;
	Tue, 20 May 2025 10:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tjX2seFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0906010E207;
 Tue, 20 May 2025 10:32:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38DF149EC5;
 Tue, 20 May 2025 10:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692E5C4CEE9;
 Tue, 20 May 2025 10:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1747737157;
 bh=zDpmgNIk0KgV9mLpwYhAEJqLphnW13jDgqbiqxHvUZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tjX2seFj28kVM1MCXRY+f4rM7a6JeGQTg5sZWiT7PoHTMpa7d71V2Vyq6JSvj9t8a
 E5o3GukKw7ov8CeHsC+2FgCmGihirW/DYnQRdJxylygaMBXon3pi+ttHqJWjCT5fCY
 SBHmeb4L7oIBVDXPiE2VyuQ3avQck5Tm14PYsAWs=
Date: Tue, 20 May 2025 12:32:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, airlied@gmail.com, daniel@ffwll.ch,
 sashal@kernel.org, quic_vpolimer@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 quic_kalyant@quicinc.com
Subject: Re: [PATCH 6.1.y 1/2] drm/msm/disp/dpu: use atomic enable/disable
 callbacks for encoder functions
Message-ID: <2025052007-penalize-gummy-61e2@gregkh>
References: <20250512033116.3331668-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512033116.3331668-1-jianqi.ren.cn@windriver.com>
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

On Mon, May 12, 2025 at 11:31:16AM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> [ Upstream commit c0cd12a5d29fa36a8e2ebac7b8bec50c1a41fb57 ]
> 
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Patchwork: https://patchwork.freedesktop.org/patch/524738/
> Link: https://lore.kernel.org/r/1677774797-31063-12-git-send-email-quic_vpolimer@quicinc.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> Verified the build test
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

If patches are ment to be in a series, please properly send them as a
series, not as individual emails like you did here :(

Please fix up and resend.

thanks,

greg k-h
