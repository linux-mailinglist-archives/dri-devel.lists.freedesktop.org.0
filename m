Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7AD738DF0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5EE10E122;
	Wed, 21 Jun 2023 17:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4778910E122
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 17:58:42 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QmWTF3Z6zz9tKv;
 Wed, 21 Jun 2023 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687370321; bh=2jWGAPdWUwaxVJK+ZBjdAoh2WFHRVQopPAYZ/X2thNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pw6FJQTIyQjlWMtNmfYxoou895kxRRVwvYtjYCaqpp0piYZ0KVmYdBYBgCvlxT2xu
 hTtTnOCvvKZInC45+ZUKxV0RMtmgDlE5hQtAAxGnfXpAYigQutCwyIMkC3AqafMRmk
 k79ybOR70I3EMSB5mZ2uDgXtXqYbQIlpDOkPUkxc=
X-Riseup-User-ID: 6F5E01901793FAA868099AF47EE44BF67661D2C7992AC941DB02F1F75ED889DC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QmWT01wXwzJp1M;
 Wed, 21 Jun 2023 17:58:27 +0000 (UTC)
Message-ID: <5ffa4aef-70eb-a2b9-b3e2-7ba00d706e16@riseup.net>
Date: Wed, 21 Jun 2023 14:58:23 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/vkms: Fix race-condition between the hrtimer and
 the atomic commit
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230523123207.173976-1-mcanal@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230523123207.173976-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/05/23 09:32, Maíra Canal wrote:
> Currently, it is possible for the composer to be set as enabled and then
> as disabled without a proper call for the vkms_vblank_simulate(). This
> is problematic, because the driver would skip one CRC output, causing CRC
> tests to fail. Therefore, we need to make sure that, for each time the
> composer is set as enabled, a composer job is added to the queue.
> 
> In order to provide this guarantee, add a mutex that will lock before
> the composer is set as enabled and will unlock only after the composer
> job is added to the queue. This way, we can have a guarantee that the
> driver won't skip a CRC entry.
> 
> This race-condition is affecting the IGT test "writeback-check-output",
> making the test fail and also, leaking writeback framebuffers, as the
> writeback job is queued, but it is not signaled. This patch avoids both
> problems.
> 
> [v2]:
>     * Create a new mutex and keep the spinlock across the atomic commit in
>       order to avoid interrupts that could result in deadlocks.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Great catch!

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 9 +++++++--
>  drivers/gpu/drm/vkms/vkms_crtc.c     | 9 +++++----
>  drivers/gpu/drm/vkms/vkms_drv.h      | 4 +++-
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 906d3df40cdb..b12188fd6b38 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -320,10 +320,15 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
>  	if (enabled)
>  		drm_crtc_vblank_get(&out->crtc);
>  
> -	spin_lock_irq(&out->lock);
> +	mutex_lock(&out->enabled_lock);
>  	old_enabled = out->composer_enabled;
>  	out->composer_enabled = enabled;
> -	spin_unlock_irq(&out->lock);
> +
> +	/* the composition wasn't enabled, so unlock the lock to make sure the lock
> +	 * will be balanced even if we have a failed commit
> +	 */
> +	if (!out->composer_enabled)
> +		mutex_unlock(&out->enabled_lock);
>  
>  	if (old_enabled)
>  		drm_crtc_vblank_put(&out->crtc);
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 515f6772b866..3079013c8b32 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  	struct drm_crtc *crtc = &output->crtc;
>  	struct vkms_crtc_state *state;
>  	u64 ret_overrun;
> -	bool ret, fence_cookie;
> +	bool ret, fence_cookie, composer_enabled;
>  
>  	fence_cookie = dma_fence_begin_signalling();
>  
> @@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  	if (ret_overrun != 1)
>  		pr_warn("%s: vblank timer overrun\n", __func__);
>  
> -	spin_lock(&output->lock);
>  	ret = drm_crtc_handle_vblank(crtc);
>  	if (!ret)
>  		DRM_ERROR("vkms failure on handling vblank");
>  
>  	state = output->composer_state;
> -	spin_unlock(&output->lock);
> +	composer_enabled = output->composer_enabled;
> +	mutex_unlock(&output->enabled_lock);
>  
> -	if (state && output->composer_enabled) {
> +	if (state && composer_enabled) {
>  		u64 frame = drm_crtc_accurate_vblank_count(crtc);
>  
>  		/* update frame_start only if a queued vkms_composer_worker()
> @@ -292,6 +292,7 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
> +	mutex_init(&vkms_out->enabled_lock);
>  
>  	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
>  	if (!vkms_out->composer_workq)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5f1a0a44a78c..dcf4e302fb4d 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -100,8 +100,10 @@ struct vkms_output {
>  	struct workqueue_struct *composer_workq;
>  	/* protects concurrent access to composer */
>  	spinlock_t lock;
> +	/* guarantees that if the composer is enabled, a job will be queued */
> +	struct mutex enabled_lock;
>  
> -	/* protected by @lock */
> +	/* protected by @enabled_lock */
>  	bool composer_enabled;
>  	struct vkms_crtc_state *composer_state;
>  
