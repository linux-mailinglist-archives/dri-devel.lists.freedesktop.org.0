Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711FC4557C6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5E96EC5B;
	Thu, 18 Nov 2021 09:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233AC6EC5B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:11:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w1so23924895edc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 01:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QkqxWMDsvN+P23g2Vr3tHKA/mnYeEdLijc5oXocAuag=;
 b=H7jDpze6B7QcBScr5Mu4AqD2wpMlhf0WRFo22E46nti0Gc425M7MnfXWPshb+xe+T0
 H2a5rWBMonjDtDyQLRGWV2WuHjszutuL78qNCGjYWJoeT5i08vnx3zdqnsyOqnN19Yne
 u87GioEOayWdUKqK45twkE/bSX0V+G4u0txfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QkqxWMDsvN+P23g2Vr3tHKA/mnYeEdLijc5oXocAuag=;
 b=SFr3fjh/5EQkMzX3soJmFiQ17/L9Nqotj2Xa14agOV79sex54kO8UUgQ4FYbtAtQf+
 osJ4+SJo/z7PofwtDJa3WFeAp5U+8mUZsFwFgG1G5UrJF1T9GhON0hLXxrzIG/DZGR7W
 UZ90bA/gOFGG+SEFGIPUdA7VrEMau/XDv/7tcr8s/ERu/pZaDH4xE/OciZPWrNtYZYrA
 IKAqM9LE376v76AFoGwIShJvxmuZqjGrlQ9IvueW03m+QKG/rtWREw7GHx2brBX9/CqM
 bCGS5rBu6VYDqqL6+mIEQ6FbElK9CbTnfZX1bR/fyJ9Bv4j/1EapIa6cov7ClYR7KLsq
 Vt9A==
X-Gm-Message-State: AOAM532iE5hzOlvPOh5Uc+EDtsm1BM3dUC73f31YD/FxP2ogfpuZwixR
 iC2az34drVGyTcYTU+OVNe5CGw==
X-Google-Smtp-Source: ABdhPJxV0vJnovWJaqnFdeo0W0lmvgZcM8zSBDvqJL1NzPEdp1/qnhsTMWnzFlifjRhLOeTbbBeyHQ==
X-Received: by 2002:a17:907:7e91:: with SMTP id
 qb17mr32447796ejc.449.1637226713532; 
 Thu, 18 Nov 2021 01:11:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l16sm340440edb.59.2021.11.18.01.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:11:53 -0800 (PST)
Date: Thu, 18 Nov 2021 10:11:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/self_refresh: Disable self-refresh on input
 events
Message-ID: <YZYY13UvX6VHauxS@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117144807.v2.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 02:48:41PM -0800, Brian Norris wrote:
> To improve panel self-refresh exit latency, we speculatively start
> exiting when we
> receive input events. Occasionally, this may lead to false positives,
> but most of the time we get a head start on coming out of PSR. Depending
> on how userspace takes to produce a new frame in response to the event,
> this can completely hide the exit latency.
> 
> In local tests on Chrome OS (Rockchip RK3399 eDP), we've found that the
> input notifier gives us about a 50ms head start over the
> fb-update-initiated exit.
> 
> Leverage a new drm_input_helper library to get easy access to
> likely-relevant input event callbacks.
> 
> Inspired-by: Kristian H. Kristensen <hoegsberg@google.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> This was in part picked up from:
> 
>   https://lore.kernel.org/all/20180405095000.9756-25-enric.balletbo@collabora.com/
>   [PATCH v6 24/30] drm/rockchip: Disable PSR on input events
> 
> with significant rewrites/reworks:
> 
>  - moved to common drm_input_helper and drm_self_refresh_helper
>    implementation
>  - track state only through crtc->state->self_refresh_active
> 
> Note that I'm relatively unfamiliar with DRM locking expectations, but I
> believe access to drm_crtc->state (which helps us track redundant
> transitions) is OK under the locking provided by
> drm_atomic_get_crtc_state().
> 
> Changes in v2:
>  - Delay PSR re-entry, when already disabled
>  - Allow default configuration via Kconfig and modparam
>  - Replace void* with container_of()

Please include this kind of context in the commit message so it's not
lost. It all looks like relevant information (yes other subsystems insist
the patch changelog is outside of the commit message, ime more is lost
information than gained in clarity with that).

> 
>  drivers/gpu/drm/Kconfig                   | 16 ++++
>  drivers/gpu/drm/drm_self_refresh_helper.c | 98 +++++++++++++++++++----
>  2 files changed, 100 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 381476b10a9d..698924ed9b6b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -84,6 +84,22 @@ config DRM_INPUT_HELPER
>  	depends on DRM_KMS_HELPER
>  	depends on INPUT
>  
> +config DRM_SELF_REFRESH_INPUT_BOOST_DEFAULT
> +	bool "Preemptively exit panel self-refresh on input device activity" if EXPERT
> +	default y
> +	depends on DRM_INPUT_HELPER

Yeah no that doesn't work. First I really don't like tunables, and second
much less as Kconfig.

The driver should know this somehow and set it correctly. Maybe
auto-derived from panel timings + knowledge of how long a sr exit takes?


> +	help
> +	  Allows the generic DRM panel self-refresh helpers to factor in user
> +	  input activity to preemptively exit panel self-refresh, in order to
> +	  reduce potentially-visible latency when displaying new display
> +	  content. This is an optimization which often will do the right thing,
> +	  but can be disabled for experimentation or similar.
> +
> +	  Saying Y enables the feature by default; this can also be configured
> +	  by module parameter, drm_kms_helper.self_refresh_input_boost.
> +
> +	  If in doubt, say "Y".
> +
>  config DRM_KMS_HELPER
>  	tristate
>  	depends on DRM
> diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
> index dd33fec5aabd..ba4881e683b7 100644
> --- a/drivers/gpu/drm/drm_self_refresh_helper.c
> +++ b/drivers/gpu/drm/drm_self_refresh_helper.c
> @@ -8,6 +8,7 @@
>  #include <linux/average.h>
>  #include <linux/bitops.h>
>  #include <linux/slab.h>
> +#include <linux/stringify.h>
>  #include <linux/workqueue.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -15,6 +16,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_input_helper.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_modeset_lock.h>
>  #include <drm/drm_print.h>
> @@ -58,17 +60,41 @@ DECLARE_EWMA(psr_time, 4, 4)
>  struct drm_self_refresh_data {
>  	struct drm_crtc *crtc;
>  	struct delayed_work entry_work;
> +	struct work_struct exit_work;
> +	struct drm_input_handler input_handler;
> +	bool input_handler_registered;
>  
>  	struct mutex avg_mutex;
>  	struct ewma_psr_time entry_avg_ms;
>  	struct ewma_psr_time exit_avg_ms;
>  };
>  
> -static void drm_self_refresh_helper_entry_work(struct work_struct *work)
> +static bool self_refresh_input_boost =
> +	IS_ENABLED(CONFIG_DRM_SELF_REFRESH_INPUT_BOOST_DEFAULT);
> +#if defined(CONFIG_DRM_INPUT_HELPER)
> +module_param(self_refresh_input_boost, bool, 0644);
> +MODULE_PARM_DESC(self_refresh_input_boost,
> +		 "Enable panel self-refresh input boost [default="
> +		 __stringify(CONFIG_DRM_SELF_REFRESH_INPUT_BOOST_DEFAULT) "]");
> +#endif /* CONFIG_DRM_INPUT_HELPER */
> +
> +
> +static void drm_self_refresh_reschedule(struct drm_self_refresh_data *sr_data)
> +{
> +	unsigned int delay;
> +
> +	mutex_lock(&sr_data->avg_mutex);
> +	delay = (ewma_psr_time_read(&sr_data->entry_avg_ms) +
> +		 ewma_psr_time_read(&sr_data->exit_avg_ms)) * 2;
> +	mutex_unlock(&sr_data->avg_mutex);
> +
> +	mod_delayed_work(system_wq, &sr_data->entry_work,
> +			 msecs_to_jiffies(delay));
> +}
> +
> +static void drm_self_refresh_transition(struct drm_self_refresh_data *sr_data,
> +					bool enable)
>  {
> -	struct drm_self_refresh_data *sr_data = container_of(
> -				to_delayed_work(work),
> -				struct drm_self_refresh_data, entry_work);
>  	struct drm_crtc *crtc = sr_data->crtc;
>  	struct drm_device *dev = crtc->dev;
>  	struct drm_modeset_acquire_ctx ctx;
> @@ -95,6 +121,14 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
>  		goto out;
>  	}
>  
> +	if (crtc->state->self_refresh_active == enable) {
> +		/* Exiting SR; delay re-entry for at least one more cycle. */
> +		if (!enable)
> +			drm_self_refresh_reschedule(sr_data);
> +
> +		goto out;
> +	}
> +
>  	if (!crtc_state->enable)
>  		goto out;
>  
> @@ -107,8 +141,8 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
>  			goto out;
>  	}
>  
> -	crtc_state->active = false;
> -	crtc_state->self_refresh_active = true;
> +	crtc_state->active = !enable;
> +	crtc_state->self_refresh_active = enable;
>  
>  	ret = drm_atomic_commit(state);
>  	if (ret)
> @@ -129,6 +163,15 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
>  	drm_modeset_acquire_fini(&ctx);
>  }
>  
> +static void drm_self_refresh_helper_entry_work(struct work_struct *work)
> +{
> +	struct drm_self_refresh_data *sr_data = container_of(
> +				to_delayed_work(work),
> +				struct drm_self_refresh_data, entry_work);
> +
> +	drm_self_refresh_transition(sr_data, true);
> +}
> +
>  /**
>   * drm_self_refresh_helper_update_avg_times - Updates a crtc's SR time averages
>   * @state: the state which has just been applied to hardware
> @@ -202,7 +245,6 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
>  
>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>  		struct drm_self_refresh_data *sr_data;
> -		unsigned int delay;
>  
>  		/* Don't trigger the entry timer when we're already in SR */
>  		if (crtc_state->self_refresh_active)
> @@ -212,17 +254,26 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
>  		if (!sr_data)
>  			continue;
>  
> -		mutex_lock(&sr_data->avg_mutex);
> -		delay = (ewma_psr_time_read(&sr_data->entry_avg_ms) +
> -			 ewma_psr_time_read(&sr_data->exit_avg_ms)) * 2;
> -		mutex_unlock(&sr_data->avg_mutex);
> -
> -		mod_delayed_work(system_wq, &sr_data->entry_work,
> -				 msecs_to_jiffies(delay));
> +		drm_self_refresh_reschedule(sr_data);
>  	}
>  }
>  EXPORT_SYMBOL(drm_self_refresh_helper_alter_state);
>  
> +static void drm_self_refresh_helper_exit_work(struct work_struct *work)
> +{
> +	struct drm_self_refresh_data *sr_data = container_of(
> +			work, struct drm_self_refresh_data, exit_work);
> +
> +	drm_self_refresh_transition(sr_data, false);
> +}
> +
> +static void drm_self_refresh_input_event(struct drm_input_handler *handler)
> +{
> +	struct drm_self_refresh_data *sr_data = container_of(
> +			handler, struct drm_self_refresh_data, input_handler);
> +
> +	schedule_work(&sr_data->exit_work);

Single worker with single state would also make it clear that we need to
cancel the sr enter work here (or delay it at least), otherwise this wont'
do much good when you try to exit right before we try to enter sr.

Also, exiting sr means a full atomic flip, so full frame upload generally,
and that can take its sweet time. Won't that increase input -> output
latency because we're guaranteed to miss a frame (at least on some
hardware). How does this work? This might also tie into the "how to
correctly tune this" question.

> +}
>  /**
>   * drm_self_refresh_helper_init - Initializes self refresh helpers for a crtc
>   * @crtc: the crtc which supports self refresh supported displays
> @@ -232,6 +283,7 @@ EXPORT_SYMBOL(drm_self_refresh_helper_alter_state);
>  int drm_self_refresh_helper_init(struct drm_crtc *crtc)
>  {
>  	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
> +	int ret;
>  
>  	/* Helper is already initialized */
>  	if (WARN_ON(sr_data))
> @@ -243,6 +295,7 @@ int drm_self_refresh_helper_init(struct drm_crtc *crtc)
>  
>  	INIT_DELAYED_WORK(&sr_data->entry_work,
>  			  drm_self_refresh_helper_entry_work);
> +	INIT_WORK(&sr_data->exit_work, drm_self_refresh_helper_exit_work);

Won't this result in all kinds of awkward synchronization issues when the
two workers run in parallel?

I was expecting one worker here, and maybe some irqsafe spinlock protect
state to drive state changes.

>  	sr_data->crtc = crtc;
>  	mutex_init(&sr_data->avg_mutex);
>  	ewma_psr_time_init(&sr_data->entry_avg_ms);
> @@ -256,8 +309,22 @@ int drm_self_refresh_helper_init(struct drm_crtc *crtc)
>  	ewma_psr_time_add(&sr_data->entry_avg_ms, SELF_REFRESH_AVG_SEED_MS);
>  	ewma_psr_time_add(&sr_data->exit_avg_ms, SELF_REFRESH_AVG_SEED_MS);
>  
> +	if (self_refresh_input_boost) {
> +		sr_data->input_handler.callback = drm_self_refresh_input_event;
> +		ret = drm_input_handle_register(crtc->dev,
> +						&sr_data->input_handler);
> +		if (ret)
> +			goto err;
> +		sr_data->input_handler_registered = true;
> +	}
> +
>  	crtc->self_refresh_data = sr_data;
> +
>  	return 0;
> +
> +err:
> +	kfree(sr_data);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_self_refresh_helper_init);
>  
> @@ -275,7 +342,10 @@ void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
>  
>  	crtc->self_refresh_data = NULL;
>  
> +	if (sr_data->input_handler_registered)

Could we not push this check into the helper?

> +		drm_input_handle_unregister(&sr_data->input_handler);
>  	cancel_delayed_work_sync(&sr_data->entry_work);
> +	cancel_work_sync(&sr_data->exit_work);
>  	kfree(sr_data);
>  }
>  EXPORT_SYMBOL(drm_self_refresh_helper_cleanup);
> -- 
> 2.34.0.rc1.387.gb447b232ab-goog

Anyway by&large definitely something we want to support in upstream and sr
helpers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
