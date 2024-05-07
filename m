Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF18BE3A5
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7EC112484;
	Tue,  7 May 2024 13:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C39F9112484
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:21:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8596D106F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 06:22:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D5433F793
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 06:21:52 -0700 (PDT)
Date: Tue, 7 May 2024 14:21:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/arm/comeda: don't use confusing 'timeout'
 variable name
Message-ID: <Zjoq7oEuCu4H8eJa@e110455-lin.cambridge.arm.com>
References: <20240507090200.7936-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507090200.7936-2-wsa+renesas@sang-engineering.com>
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

On Tue, May 07, 2024 at 11:02:01AM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Check the return value directly to drop
> 'timeout'  which also fixes its wrong type.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

I will change the subject line to s/comeda/komeda/ when merging it.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 2c661f28410e..9bec59cf9c06 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -294,7 +294,6 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
>  	struct komeda_dev *mdev = kcrtc->master->mdev;
>  	struct completion *flip_done;
>  	struct completion temp;
> -	int timeout;
>  
>  	/* if caller doesn't send a flip_done, use a private flip_done */
>  	if (input_flip_done) {
> @@ -308,8 +307,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
>  	mdev->funcs->flush(mdev, kcrtc->master->id, 0);
>  
>  	/* wait the flip take affect.*/
> -	timeout = wait_for_completion_timeout(flip_done, HZ);
> -	if (timeout == 0) {
> +	if (wait_for_completion_timeout(flip_done, HZ) == 0) {
>  		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
>  		if (!input_flip_done) {
>  			unsigned long flags;
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
