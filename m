Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0A56BE89
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42AC10EAB5;
	Fri,  8 Jul 2022 18:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C024310EB14
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:03:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63261063;
 Fri,  8 Jul 2022 11:03:47 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF4033F70D;
 Fri,  8 Jul 2022 11:03:46 -0700 (PDT)
Message-ID: <af1d56b5-a999-6806-1aa6-593eb0e9380a@foss.arm.com>
Date: Fri, 8 Jul 2022 19:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] drm/komeda - Fix handling of pending crtc state
 commit to avoid lock-up
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
 <20220606114714.175499-3-carsten.haitzler@foss.arm.com>
 <YshVFKbiz/7FrkKT@e110455-lin.cambridge.arm.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <YshVFKbiz/7FrkKT@e110455-lin.cambridge.arm.com>
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
Cc: dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/22 17:02, Liviu Dudau wrote:
> On Mon, Jun 06, 2022 at 12:47:14PM +0100, carsten.haitzler@foss.arm.com wrote:
>> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> Hi Carsten,
> 
>>
>> Sometimes there is an extra dcm crtc state in the pipeline whose
>> penting vblank event has not been handled yet. We would previously
>> throw this out and the vblank event never triggers leading to hard
>> lockups higher up the stack where an expected vlank event never comes
>> back (screen freezes).
>>
>> This fixes that by tracking a pending crtc state that needs handling
>> and handle it producing a vlank event next vblank if it had not
>> laready been handled before. This fixes the hangs and ensures our
>> display keeps updating seamlessly and is certainly a much better state
>> to be in than after some time ending up with a mysteriously frozen
>> screen and a lot of kernle messages complaining about this too.
> 
> Sorry it took me so long to review and reply to this patch, but I had this nagging

No worries. :)

> feeling that the patch is not actually correct so I've tried to track the actual
> issue. It turns out that the problem is easy to reproduce in a different setup with
> Mali D71 and it comes from the fact that Komeda doesn't properly wait for the
> hardware to signal acceptance of config valid on setting new commits. I have created
> a new patch that I would be happy if you can test to try to fix the actual issue.

This works (tested). One errant "flip without commit":

[    9.402559] fbcon: Taking over console
[    9.525373] [drm:komeda_print_events [komeda]] *ERROR* err detect: 
gcu: MERR, pipes[0]: FLIP, pipes[1]: None
[    9.525455] [drm] CRTC[0]: FLIP happened but no pending commit.
[    9.542215] Console: switching to colour frame buffer device 240x67

But nothing worrying. It does work, though doesn't compile due to:

drivers/gpu/drm/arm/display/komeda/komeda_kms.c: In function 
‘komeda_kms_atomic_commit_hw_done’:
drivers/gpu/drm/arm/display/komeda/komeda_kms.c:77:9: error: ‘for’ loop 
initial declarations are only allowed in C99 or C11 mode
    77 |         for (int i = 0; i < kms->n_crtcs; i++) {
       |         ^~~
drivers/gpu/drm/arm/display/komeda/komeda_kms.c:77:9: note: use option 
‘-std=c9
’, ‘-std=gnu99’, ‘-std=c11’ or ‘-std=gnu11’ to compile your code

but that was a trivial fixup.

Your commit handler does sit and wait. I guess I avoided that and had it 
still deferred and handled next time the vblank interrupt fires. Yours 
is a bit shorter and less complex so it wins. :)

> --8<---------------------------------------------------------------------------
> 
>  From 76f9e5fed216a815e9eb56152f85454521079f10 Mon Sep 17 00:00:00 2001
> From: Liviu Dudau <liviu.dudau@arm.com>
> Date: Fri, 8 Jul 2022 16:39:21 +0100
> Subject: [PATCH] drm/komeda: Fix handling of atomic commits in the
>   atomic_commit_tail hook
> 
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
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>   .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  4 ++--
>   .../gpu/drm/arm/display/komeda/komeda_kms.c   | 20 ++++++++++++++++++-
>   .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 ++
>   3 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 59172acb973803d..292f533d8cf0de6 100644
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
> index 93b7f09b96ca950..1a53bd87e81d8ad 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -69,6 +69,24 @@ static const struct drm_driver komeda_kms_driver = {
>   	.minor = 1,
>   };
>   
> +static void komeda_kms_atomic_commit_hw_done(struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = state->dev;
> +	struct komeda_kms_dev *kms = to_kdev(dev);
> +
> +	for (int i = 0; i < kms->n_crtcs; i++) {
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
> @@ -81,7 +99,7 @@ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
>   
>   	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>   
> -	drm_atomic_helper_commit_hw_done(old_state);
> +	komeda_kms_atomic_commit_hw_done(old_state);
>   
>   	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>   
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> index 456f3c435719317..bf6e8fba5061335 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> @@ -182,6 +182,8 @@ void komeda_kms_cleanup_private_objs(struct komeda_kms_dev *kms);
>   
>   void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>   			      struct komeda_events *evts);
> +void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
> +					      struct completion *input_flip_done);
>   
>   struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
>   void komeda_kms_detach(struct komeda_kms_dev *kms);
