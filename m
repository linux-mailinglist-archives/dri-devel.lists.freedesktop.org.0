Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99801A90D7F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 22:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B2410E130;
	Wed, 16 Apr 2025 20:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="C+RKc3Cy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EED010E130
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 20:58:35 +0000 (UTC)
Date: Wed, 16 Apr 2025 16:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744837105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NdQpuGRR10gNQcv5XLfg3fsBASs65X0pcBvFcqE6/LE=;
 b=C+RKc3Cyt6ZV+BMa/0RtEY3HqPur3LQD8icOfxhuqQNLmhiWx3NvihKurNpw43u2uaf4Xw
 NqZX232XuZSMvk+OuXQRr/2Nbk5hGswcUFoIUiOUFfxc5zAakPfvgKw2ExzSPn7fJiBP4g
 s70w5NOHg2Bk3kuIL8+8K+tXNkykG7NRg1LuSkuHmVndwDWfs9aoxkFL6S6m/kdQr3Zrbt
 b+rn2NS5kD9zlu6hWjVc2GdisDQNm1shJpAkri7KLLYlG58UUDx067YidANCT4JZ1EPd5r
 Pi8nH4z/yOGKXOTNWGq6KaMA9QJ9UpkRMVNuotQbxRLzhEUQU6AgLla7zbBCcw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm: adp: Handle drm_crtc_vblank_get() errors
Message-ID: <aAAZ6iIUtYcfpcdm@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-2-772699f13293@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-drm_adp_fixes-v1-2-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT
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

> -	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>  	if (crtc->state->event) {
> -		drm_crtc_vblank_get(crtc);
> -		adp->event = crtc->state->event;
> +		spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +
> +		if (drm_crtc_vblank_get(crtc) != 0)
> +			drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		else
> +			adp->event = crtc->state->event;
> +
> +		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  	}
>  	crtc->state->event = NULL;
> -	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);

Kind of confused about

>  	crtc->state->event = NULL;

now being out of the lock. Should we set to NULL in the if, since
if we don't take the if, we know event is already NULL? Or should we
hold the lock for the whole time, the way the code did before your
change? I'm not sure between the two, but the in-between here smells
wrong.
