Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A05756BD1F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 18:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0510E823;
	Fri,  8 Jul 2022 16:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A542810E823
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 16:02:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1451063
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:02:30 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0FA83F66F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:02:29 -0700 (PDT)
Date: Fri, 8 Jul 2022 17:02:28 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH 3/3] drm/komeda - Fix handling of pending crtc state
 commit to avoid lock-up
Message-ID: <YshVFKbiz/7FrkKT@e110455-lin.cambridge.arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
 <20220606114714.175499-3-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606114714.175499-3-carsten.haitzler@foss.arm.com>
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

On Mon, Jun 06, 2022 at 12:47:14PM +0100, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>

Hi Carsten,

> 
> Sometimes there is an extra dcm crtc state in the pipeline whose
> penting vblank event has not been handled yet. We would previously
> throw this out and the vblank event never triggers leading to hard
> lockups higher up the stack where an expected vlank event never comes
> back (screen freezes).
> 
> This fixes that by tracking a pending crtc state that needs handling
> and handle it producing a vlank event next vblank if it had not
> laready been handled before. This fixes the hangs and ensures our
> display keeps updating seamlessly and is certainly a much better state
> to be in than after some time ending up with a mysteriously frozen
> screen and a lot of kernle messages complaining about this too.

Sorry it took me so long to review and reply to this patch, but I had this nagging
feeling that the patch is not actually correct so I've tried to track the actual
issue. It turns out that the problem is easy to reproduce in a different setup with
Mali D71 and it comes from the fact that Komeda doesn't properly wait for the
hardware to signal acceptance of config valid on setting new commits. I have created
a new patch that I would be happy if you can test to try to fix the actual issue.

--8<---------------------------------------------------------------------------

From 76f9e5fed216a815e9eb56152f85454521079f10 Mon Sep 17 00:00:00 2001
From: Liviu Dudau <liviu.dudau@arm.com>
Date: Fri, 8 Jul 2022 16:39:21 +0100
Subject: [PATCH] drm/komeda: Fix handling of atomic commits in the
 atomic_commit_tail hook

Komeda driver relies on the generic DRM atomic helper functions to handle
commits. It only implements an atomic_commit_tail hook for the
mode_config_helper_funcs and even that one is pretty close to the generic
implementation with the exception of additional dma_fence signalling.

What the generic helper framework doesn't do is waiting for the actual
hardware to signal that the commit parameters have been written into the
appropriate registers. As we signal CRTC events only on the irq handlers,
we need to flush the configuration and wait for the hardware to respond.

Add the Komeda specific implementation for atomic_commit_hw_done() that
flushes and waits for flip done before calling drm_atomic_helper_commit_hw_done().

The fix was prompted by a patch from Carsten Haitzler where he was trying to
solve the same issue but in a different way that I think can lead to wrong
event signaling to userspace.

Reported-by: Carsten Haitzler <carsten.haitzler@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  4 ++--
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 20 ++++++++++++++++++-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 ++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 59172acb973803d..292f533d8cf0de6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -235,7 +235,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			crtc->state->event = NULL;
 			drm_crtc_send_vblank_event(crtc, event);
 		} else {
-			DRM_WARN("CRTC[%d]: FLIP happen but no pending commit.\n",
+			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
 				 drm_crtc_index(&kcrtc->base));
 		}
 		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
@@ -286,7 +286,7 @@ komeda_crtc_atomic_enable(struct drm_crtc *crtc,
 	komeda_crtc_do_flush(crtc, old);
 }
 
-static void
+void
 komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 					 struct completion *input_flip_done)
 {
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 93b7f09b96ca950..1a53bd87e81d8ad 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -69,6 +69,24 @@ static const struct drm_driver komeda_kms_driver = {
 	.minor = 1,
 };
 
+static void komeda_kms_atomic_commit_hw_done(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+	struct komeda_kms_dev *kms = to_kdev(dev);
+
+	for (int i = 0; i < kms->n_crtcs; i++) {
+		struct komeda_crtc *kcrtc = &kms->crtcs[i];
+
+		if (kcrtc->base.state->active) {
+			struct completion *flip_done = NULL;
+			if (kcrtc->base.state->event)
+				flip_done = kcrtc->base.state->event->base.completion;
+			komeda_crtc_flush_and_wait_for_flip_done(kcrtc, flip_done);
+		}
+	}
+	drm_atomic_helper_commit_hw_done(state);
+}
+
 static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
@@ -81,7 +99,7 @@ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
-	drm_atomic_helper_commit_hw_done(old_state);
+	komeda_kms_atomic_commit_hw_done(old_state);
 
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 456f3c435719317..bf6e8fba5061335 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -182,6 +182,8 @@ void komeda_kms_cleanup_private_objs(struct komeda_kms_dev *kms);
 
 void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			      struct komeda_events *evts);
+void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
+					      struct completion *input_flip_done);
 
 struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
 void komeda_kms_detach(struct komeda_kms_dev *kms);
-- 
2.37.0

-->8---------------------------------------------------------------------------

Best regards,
Liviu


> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 10 ++++++++++
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   | 19 ++++++++++++++++++-
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 59172acb9738..b7f0a5f97222 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -227,6 +227,16 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>  			complete_all(kcrtc->disable_done);
>  			kcrtc->disable_done = NULL;
>  		} else if (crtc->state->event) {
> +			if (kcrtc->state_needs_handling) {
> +				event = kcrtc->state_needs_handling->event;
> +				if (event) {
> +					kcrtc->state_needs_handling->event = NULL;
> +					kcrtc->state_needs_handling = NULL;
> +					drm_crtc_send_vblank_event(crtc, event);
> +				} else {
> +					kcrtc->state_needs_handling = NULL;
> +				}
> +			}
>  			event = crtc->state->event;
>  			/*
>  			 * Consume event before notifying drm core that flip
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 93b7f09b96ca..bbc051a1896a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -226,10 +226,27 @@ static int komeda_kms_check(struct drm_device *dev,
>  	return 0;
>  }
>  
> +static int komeda_kms_commit(struct drm_device *drm,
> +                             struct drm_atomic_state *state,
> +                             bool nonblock)
> +{
> +	int i;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct komeda_crtc *kcrtc;
> +
> +	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
> +				      new_crtc_state, i) {
> +		kcrtc = to_kcrtc(crtc);
> +		kcrtc->state_needs_handling = crtc->state;
> +	}
> +	return drm_atomic_helper_commit(drm, state, nonblock);
> +}
> +
>  static const struct drm_mode_config_funcs komeda_mode_config_funcs = {
>  	.fb_create		= komeda_fb_create,
>  	.atomic_check		= komeda_kms_check,
> -	.atomic_commit		= drm_atomic_helper_commit,
> +	.atomic_commit		= komeda_kms_commit,
>  };
>  
>  static void komeda_kms_mode_config_init(struct komeda_kms_dev *kms,
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> index 456f3c435719..8ff3ad04dfe4 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> @@ -84,6 +84,9 @@ struct komeda_crtc {
>  
>  	/** @disable_done: this flip_done is for tracing the disable */
>  	struct completion *disable_done;
> +
> +	/** @state_needs_handling: Has not had it's vblank event handled yet */
> +	struct drm_crtc_state *state_needs_handling;
>  };
>  
>  /**
> -- 
> 2.32.0
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
