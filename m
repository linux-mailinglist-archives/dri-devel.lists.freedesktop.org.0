Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F74D9050
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8847610E09A;
	Mon, 14 Mar 2022 23:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365A310E184
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 23:26:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 379461F433AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647300370;
 bh=x8lO7dndy69NlEFUnZVKtUz8PSJBYw2u9qurEt77Vsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T+dcmDZCNTDph2K+zp5okl/Ae4m+f/HMMa4eOTa7hDDJW0Ns/dkJY4eFiEVciL7lD
 aVoGX1VRUERwLeiXVd8iipVskwhB67RogoQp2Q9MMrVV3dWWqb958m+DUIq9haf0/U
 /wdOQGxOXhdjCh+kBLVNEujv45EZXyHQy414JOqgcJ+8uVDHg16AGf6bqc5QdvBe0B
 2hkUjdk3EVqHua4taq3f0w/j8zRnRCoh8yVuH0WDF60ljaCssnrcZJo14eQc685dzK
 hUAJYrb8c6PFlooACVb4xJ+IAvgGDbGWoe/XcIA/tLih9GM6grNdxYzZdXvQHfZIHy
 f5zYTAOFRmevg==
Date: Mon, 14 Mar 2022 19:26:00 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
Message-ID: <Yi/PCCQqvxA6aHzA@maud>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314224253.236359-9-dmitry.osipenko@collabora.com>
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 01:42:53AM +0300, Dmitry Osipenko wrote:
> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/Makefile          |  1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h |  4 ----
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 19 ++-------------
>  drivers/gpu/drm/panfrost/panfrost_gem.c    | 27 ++++++++++++++--------
>  drivers/gpu/drm/panfrost/panfrost_gem.h    |  9 --------
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 22 +++++++++++++++++-
>  6 files changed, 40 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index b71935862417..ecf0864cb515 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -5,7 +5,6 @@ panfrost-y := \
>  	panfrost_device.o \
>  	panfrost_devfreq.o \
>  	panfrost_gem.o \
> -	panfrost_gem_shrinker.o \
>  	panfrost_gpu.o \
>  	panfrost_job.o \
>  	panfrost_mmu.o \

I'm not sure you actually deleted gem_shrinker anywhere in this patch?
Diff stat is too small.
