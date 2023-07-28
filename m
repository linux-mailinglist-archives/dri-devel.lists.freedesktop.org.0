Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA69766D53
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52BC10E207;
	Fri, 28 Jul 2023 12:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8027010E207
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z6APCt3gRuY5NrvaD5iCXRokqS67h2ymdQK4EiPRCqQ=; b=jTfl1n+e7Jn1vGl3ssL/I3GzKy
 b4F2ayVhBF+GK6p+09cQNYClimyLH0HGvI35WpX57FZdQieBOkfvZM0iVgMsz7j9je/MHhIYLF/hl
 Tz7N7PbPnIVVeVKLGaj3PoGWypirlPxnOEKAYA/gpIf6vIyvRORfEkTn1kFp5XHH7BGmtlc7jYnWn
 C1zBXtL3RPLicO5HuNXKd07yqnHlvRFSGyW+H2bgH5W8WRlbIVMfi9NCrYb1fbWi8lqxmh5eJs1/+
 aFoGod7IsFceJp67e8TyCdzUzrdgIF3LSuFltJOy2dy1bQX33BTcP6piGKm9myWnx8Ix1cn00eLXs
 tr8f30yw==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qPMgy-005Au0-Nl; Fri, 28 Jul 2023 14:35:36 +0200
Message-ID: <9cca9112-eb87-02e1-af3c-d18a5002dce8@igalia.com>
Date: Fri, 28 Jul 2023 09:35:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/vkms: Fix race-condition between the hrtimer and
 the atomic commit
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230523123207.173976-1-mcanal@igalia.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230523123207.173976-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 5/23/23 09:32, Maíra Canal wrote:
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
>      * Create a new mutex and keep the spinlock across the atomic commit in
>        order to avoid interrupts that could result in deadlocks.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Applied to drm-misc/drm-misc-next.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 9 +++++++--
>   drivers/gpu/drm/vkms/vkms_crtc.c     | 9 +++++----
>   drivers/gpu/drm/vkms/vkms_drv.h      | 4 +++-
>   3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 906d3df40cdb..b12188fd6b38 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -320,10 +320,15 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
>   	if (enabled)
>   		drm_crtc_vblank_get(&out->crtc);
>   
> -	spin_lock_irq(&out->lock);
> +	mutex_lock(&out->enabled_lock);
>   	old_enabled = out->composer_enabled;
>   	out->composer_enabled = enabled;
> -	spin_unlock_irq(&out->lock);
> +
> +	/* the composition wasn't enabled, so unlock the lock to make sure the lock
> +	 * will be balanced even if we have a failed commit
> +	 */
> +	if (!out->composer_enabled)
> +		mutex_unlock(&out->enabled_lock);
>   
>   	if (old_enabled)
>   		drm_crtc_vblank_put(&out->crtc);
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 515f6772b866..3079013c8b32 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   	struct drm_crtc *crtc = &output->crtc;
>   	struct vkms_crtc_state *state;
>   	u64 ret_overrun;
> -	bool ret, fence_cookie;
> +	bool ret, fence_cookie, composer_enabled;
>   
>   	fence_cookie = dma_fence_begin_signalling();
>   
> @@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   	if (ret_overrun != 1)
>   		pr_warn("%s: vblank timer overrun\n", __func__);
>   
> -	spin_lock(&output->lock);
>   	ret = drm_crtc_handle_vblank(crtc);
>   	if (!ret)
>   		DRM_ERROR("vkms failure on handling vblank");
>   
>   	state = output->composer_state;
> -	spin_unlock(&output->lock);
> +	composer_enabled = output->composer_enabled;
> +	mutex_unlock(&output->enabled_lock);
>   
> -	if (state && output->composer_enabled) {
> +	if (state && composer_enabled) {
>   		u64 frame = drm_crtc_accurate_vblank_count(crtc);
>   
>   		/* update frame_start only if a queued vkms_composer_worker()
> @@ -292,6 +292,7 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   
>   	spin_lock_init(&vkms_out->lock);
>   	spin_lock_init(&vkms_out->composer_lock);
> +	mutex_init(&vkms_out->enabled_lock);
>   
>   	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
>   	if (!vkms_out->composer_workq)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5f1a0a44a78c..dcf4e302fb4d 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -100,8 +100,10 @@ struct vkms_output {
>   	struct workqueue_struct *composer_workq;
>   	/* protects concurrent access to composer */
>   	spinlock_t lock;
> +	/* guarantees that if the composer is enabled, a job will be queued */
> +	struct mutex enabled_lock;
>   
> -	/* protected by @lock */
> +	/* protected by @enabled_lock */
>   	bool composer_enabled;
>   	struct vkms_crtc_state *composer_state;
>   
