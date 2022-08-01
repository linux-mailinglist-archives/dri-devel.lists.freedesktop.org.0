Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBF5867A9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 12:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098B610E7F9;
	Mon,  1 Aug 2022 10:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E08E10EB4A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 10:26:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C47CB139F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 03:26:42 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98F53F67D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 03:26:41 -0700 (PDT)
Message-ID: <64c77d71-e73a-be7c-ac80-2e24cb5afede@foss.arm.com>
Date: Mon, 1 Aug 2022 11:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/komeda: Fix handling of atomic commits in the
 atomic_commit_tail hook
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220722122139.288486-1-liviu.dudau@arm.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <20220722122139.288486-1-liviu.dudau@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Looks good to me - as per log.

On 7/22/22 13:21, Liviu Dudau wrote:
> Komeda driver relies on the generic DRM atomic helper functions to handle
> commits. It only implements an atomic_commit_tail hook for the
> mode_config_helper_funcs and even that one is pretty close to the generic
> implementation with the exception of additional dma_fence signalling.
> 
> What the generic helper framework doesn't do is waiting for the actual
> hardware to signal that the commit parameters have been written into the
> appropriate registers. As we signal CRTC events only on the irq handlers,
> we need to flush the configuration and wait for the hardware to respond.
> 
> Add the Komeda specific implementation for atomic_commit_hw_done() that
> flushes and waits for flip done before calling drm_atomic_helper_commit_hw_done().
> 
> The fix was prompted by a patch from Carsten Haitzler where he was trying to
> solve the same issue but in a different way that I think can lead to wrong
> event signaling to userspace.
> 
> Reported-by: Carsten Haitzler <carsten.haitzler@arm.com>
> Tested-by: Carsten Haitzler <carsten.haitzler@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>   .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  4 ++--
>   .../gpu/drm/arm/display/komeda/komeda_kms.c   | 21 ++++++++++++++++++-
>   .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 ++
>   3 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 59172acb9738..292f533d8cf0 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -235,7 +235,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>   			crtc->state->event = NULL;
>   			drm_crtc_send_vblank_event(crtc, event);
>   		} else {
> -			DRM_WARN("CRTC[%d]: FLIP happen but no pending commit.\n",
> +			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
>   				 drm_crtc_index(&kcrtc->base));
>   		}
>   		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> @@ -286,7 +286,7 @@ komeda_crtc_atomic_enable(struct drm_crtc *crtc,
>   	komeda_crtc_do_flush(crtc, old);
>   }
>   
> -static void
> +void
>   komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
>   					 struct completion *input_flip_done)
>   {
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 93b7f09b96ca..327051bba5b6 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -69,6 +69,25 @@ static const struct drm_driver komeda_kms_driver = {
>   	.minor = 1,
>   };
>   
> +static void komeda_kms_atomic_commit_hw_done(struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = state->dev;
> +	struct komeda_kms_dev *kms = to_kdev(dev);
> +	int i;
> +
> +	for (i = 0; i < kms->n_crtcs; i++) {
> +		struct komeda_crtc *kcrtc = &kms->crtcs[i];
> +
> +		if (kcrtc->base.state->active) {
> +			struct completion *flip_done = NULL;
> +			if (kcrtc->base.state->event)
> +				flip_done = kcrtc->base.state->event->base.completion;
> +			komeda_crtc_flush_and_wait_for_flip_done(kcrtc, flip_done);
> +		}
> +	}
> +	drm_atomic_helper_commit_hw_done(state);
> +}
> +
>   static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
>   {
>   	struct drm_device *dev = old_state->dev;
> @@ -81,7 +100,7 @@ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
>   
>   	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>   
> -	drm_atomic_helper_commit_hw_done(old_state);
> +	komeda_kms_atomic_commit_hw_done(old_state);
>   
>   	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>   
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> index 7889e380ab23..7339339ef6b8 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> @@ -183,6 +183,8 @@ void komeda_kms_cleanup_private_objs(struct komeda_kms_dev *kms);
>   
>   void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>   			      struct komeda_events *evts);
> +void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
> +					      struct completion *input_flip_done);
>   
>   struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
>   void komeda_kms_detach(struct komeda_kms_dev *kms);
