Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA49287E9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B1E10EB1D;
	Fri,  5 Jul 2024 11:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rMY2NsS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF6510E1DD;
 Fri,  5 Jul 2024 11:26:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7D19CE3B6B;
 Fri,  5 Jul 2024 11:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751FDC116B1;
 Fri,  5 Jul 2024 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720178805;
 bh=yl5XDJkF2mnEPH4zD2PEULxDkOPHGf+X7s1caWCPjhY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=rMY2NsS5nigIKmNbS4DxsqjjBdla8LJ6TDcCVhIhj3FbW61V/3gFaXUW3CjO9+8NF
 qYoUNNORvvvmpqXjv2SwZuHhHuldEX5zXPPDPiYt00CJ1BG4JG1CSwaGP023gsz1ml
 3rGDA4H/Usn46787110+PzyvTfIO7pbnx89HJ3UBpomhLaxYD99t4qp0PcyKSFDPTy
 mZdufRCyvJm2cLGAVx4Xe1VkZnawX9TPEa2ktFTZ/SNufbS33iC0J1I3rT5miXDIBE
 CYKveKNVXD6QTjTWyHQQBZmXPf64kjEO1AW1EbysanTgEYubBfraXOX7VsMLNZQ8p7
 I2/xV5PGlj1ww==
Message-ID: <f509590f5b9721368382dd82a142e965@kernel.org>
Date: Fri, 05 Jul 2024 11:26:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6] drm/display: split DSC helpers from DP helpers
In-Reply-To: <20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org>
References: <20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob
 Clark" <robdclark@gmail.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sean
 Paul" <sean@poorly.run>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
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

On Thu, 4 Jul 2024 22:17:08 +0300, Dmitry Baryshkov wrote:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
