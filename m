Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946BABEAEB
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E0210E0FD;
	Wed, 21 May 2025 04:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UqLAT7GQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEB510E0FD;
 Wed, 21 May 2025 04:18:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDBBA44966;
 Wed, 21 May 2025 04:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16311C4CEE4;
 Wed, 21 May 2025 04:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1747801092;
 bh=DB6VT8aKMtNP9KOm3UMQ4Jm/jRsL35dYO+8TqZEQAqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UqLAT7GQEac+NN8TnTVMZpwpLPeKu9UYJ/HbKyFwY/STWKIzH/drSnuedbW5WxkJh
 2SdbnbXyx+xJPzwNHCLITv6jrtwWt+OAffvzXpHEEXR48AdMZd2GwNvuWvg11Ntb54
 wYsf6IXJpOSFtX+EtThYAy9SIsIX+fl/IHEeP1hM=
Date: Wed, 21 May 2025 06:18:09 +0200
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
Subject: Re: [PATCH 6.1.y v2 1/2] drm/msm/disp/dpu: use atomic enable/disable
 callbacks for encoder functions
Message-ID: <2025052142-wind-chatty-63e5@gregkh>
References: <20250521012109.1977775-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521012109.1977775-1-jianqi.ren.cn@windriver.com>
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

On Wed, May 21, 2025 at 09:21:09AM +0800, jianqi.ren.cn@windriver.com wrote:
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

Please see:
	https://lore.kernel.org/r/2025052021-freebee-clever-8fef@gregkh

for why I am not taking any windriver backports until you fix your
development process.  Again.

{sigh}

greg k-h
