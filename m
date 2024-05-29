Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130A8D3BD7
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 18:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B076113EEF;
	Wed, 29 May 2024 16:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="eHBxF7Fo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD87113EC1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:06:45 +0000 (UTC)
X-Envelope-To: geert+renesas@glider.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716998802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0B0orRSVXeRsISQcfG64605/nqIQ5aF+rELBmkvuJc=;
 b=eHBxF7FoYnQeIJdXyrbp9wXAwXze6wqtzgUmOrfal4uvv7S2DWwITXkGQbLw5p+PWGLsWu
 mLj7UsNfX2ozuBS5aWD1eHvxtq6EtsZORZozhm3JFO/JKgK2yQgdmjvIv6LS8KG0vHUKLs
 +aWnDv3fsTqCMA82Crl7Y6Vb+4FsXA8=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-renesas-soc@vger.kernel.org
X-Envelope-To: dianders@chromium.org
Message-ID: <170bf071-fc33-4892-bf65-b52eddd796b0@linux.dev>
Date: Thu, 30 May 2024 00:03:59 +0800
MIME-Version: 1.0
Subject: Re: [resend,v2] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,


On 2024/5/29 20:16, Geert Uytterhoeven wrote:
> From: Douglas Anderson <dianders@chromium.org>
>
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_helper_force_disable_all() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case of
> OS shutdown comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.


True, looks safer.


> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
> [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Best regards,
Sui

