Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490744B1773
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 22:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FF010E38C;
	Thu, 10 Feb 2022 21:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082AC10E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 21:12:45 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id c189so6224085qkg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 13:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eGKgAJz2dJO294+be78C8+dB47Cw1SR8HtZpqoI4u6E=;
 b=rf6aHwLhBkB3nt1N9g+QnhYv5tVOz8GsX7FTsawdB0VluhGjCoaJkkxxBiv4qxeolR
 vE1TmQf9qSA1iIQomxULfXBZ9GV7TzCO8Iwuavufb+ca1fSUrzSXm8juhUB/GI/mFW0C
 9TOFfA89ucniP01YY5BNQAh12PPWjgbELaw/cmDhCMtz0x4WcppiwG7JZx6GIyjEUdCV
 RKWJct1L2mx+RNJ349Ayy/l+WE2cz81CJ/HWNPO3By4ayydhzS0rUwkyGrJEeRRFBnXG
 EXS0hKNH6txc/MR5jz3DZR5IRd2nbF1/UQ0nYAXGBjkFIPayEMPH7YuUsq/yppjlkGA/
 38FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGKgAJz2dJO294+be78C8+dB47Cw1SR8HtZpqoI4u6E=;
 b=YSAiRQdPuG6ExiLSg9C/xWRoHWLx2qcB9kKd2aEwaChY2LXMULXhiXKUWBiDx0VORM
 LEZKm2FJsoWLjb03jXq96458XTt7LNDurJKcC8w7sz2ZexorZ53i5uERsi2k+tQWQ1qN
 V7LLu0WtXy0aMN9k58BpE2Zp3LHGmsiLr1pfQAc/eILjewI4vK/7WaKdXmQYgMDogIQN
 EIsg8LRACsdidZfgKhXhFU/geE78bBAvJh3jSXR2gbyZAuLi94QIphmr/TG1EoSmN+R+
 ihyaIExM4FMuF4WzPbVaVOeDhSChu+MJHxzyk8p+YdpTpE7e+htgxZI39OUguPgC9PhQ
 6zBw==
X-Gm-Message-State: AOAM531BUsiqVsYPfNPzUCtLLXd1oqzbBKL4V3+iZGwI3u8r86J04Ae6
 8ffY6wY3/GNShVrSlKscrRqvbetdgURFbT1HdTzT2Q==
X-Google-Smtp-Source: ABdhPJy+IHLLg+lum0l64VChU98w1V7sQgvluKp2fObOY2Y+7zq6S7LI5qBIbU+kQcI2lns5avDNyi64Irumie2mSQI=
X-Received: by 2002:a05:620a:75b:: with SMTP id
 i27mr4757700qki.593.1644527563819; 
 Thu, 10 Feb 2022 13:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20220208044328.588860-1-bjorn.andersson@linaro.org>
 <YgJISIIacBnFyTLq@kroah.com> <YgV8GyK9G0gbWAaq@ripper>
In-Reply-To: <YgV8GyK9G0gbWAaq@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Feb 2022 00:12:32 +0300
Message-ID: <CAA8EJppkZTRApQbuEUACw=r2kBH+321_f1ZqRf_-veEuwB56zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Feb 2022 at 23:54, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 08 Feb 02:39 PST 2022, Greg Kroah-Hartman wrote:
>
> > On Mon, Feb 07, 2022 at 08:43:27PM -0800, Bjorn Andersson wrote:
> > > In some implementations, such as the Qualcomm platforms, the display
> > > driver has no way to query the current HPD state and as such it's
> > > impossible to distinguish between disconnect and attention events.
> > >
> > > Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
> > > state.
> > >
> > > Also push the test for unchanged state in the displayport altmode driver
> > > into the i915 driver, to allow other drivers to act upon each update.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Note that the Intel driver has only been compile tested with this patch.
> > >
> > >  drivers/gpu/drm/drm_connector.c          |  6 ++++--
> > >  drivers/gpu/drm/i915/display/intel_dp.c  | 14 +++++++++++---
> > >  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
> > >  drivers/usb/typec/altmodes/displayport.c |  9 ++-------
> > >  include/drm/drm_connector.h              |  5 +++--
> > >  5 files changed, 23 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index a50c82bc2b2f..ad7295597c0f 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -2825,6 +2825,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > >  /**
> > >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > >   * @connector_fwnode: fwnode_handle to report the event on
> > > + * @hpd_state: number of data lanes available
> >
> > "number"?
> >
> > >   *
> > >   * On some hardware a hotplug event notification may come from outside the display
> > >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > > @@ -2834,7 +2835,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > >   * This function can be used to report these out-of-band events after obtaining
> > >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > >   */
> > > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> > > +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > +                                bool hpd_state)
> >
> > This is a boolean, how can it be a number?
> >
>
> The kerneldoc wasn't appropriately updated as this went from being
> "number of data lanes" to "the hot plug detect (hpd) state".
>
> > And having a "flag" like this is a pain, how do you know what the
> > parameter really means?
> >
>
> You're right, "state" isn't a boolean property, let's rename it
> "hpd_high" to clarify it.

"connected" ?

>
> > >  {
> > >     struct drm_connector *connector;
> > >
> > > @@ -2843,7 +2845,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> > >             return;
> > >
> > >     if (connector->funcs->oob_hotplug_event)
> > > -           connector->funcs->oob_hotplug_event(connector);
> > > +           connector->funcs->oob_hotplug_event(connector, hpd_state);
> > >
> > >     drm_connector_put(connector);
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 146b83916005..00520867d37b 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -4816,15 +4816,23 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
> > >     return intel_modeset_synced_crtcs(state, conn);
> > >  }
> > >
> > > -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
> > > +static void intel_dp_oob_hotplug_event(struct drm_connector *connector, bool hpd_state)
> > >  {
> > >     struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
> > >     struct drm_i915_private *i915 = to_i915(connector->dev);
> > > +   bool need_work = false;
> > >
> > >     spin_lock_irq(&i915->irq_lock);
> > > -   i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> > > +   if (hpd_state != i915->hotplug.oob_hotplug_state) {
> > > +           i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> > > +
> > > +           i915->hotplug.oob_hotplug_state = hpd_state;
> > > +           need_work = true;
> > > +   }
> > >     spin_unlock_irq(&i915->irq_lock);
> > > -   queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> > > +
> > > +   if (need_work)
> > > +           queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> > >  }
> > >
> > >  static const struct drm_connector_funcs intel_dp_connector_funcs = {
> > > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > > index 8c1706fd81f9..543ebf1cfcf4 100644
> > > --- a/drivers/gpu/drm/i915/i915_drv.h
> > > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > > @@ -149,6 +149,9 @@ struct i915_hotplug {
> > >     /* Whether or not to count short HPD IRQs in HPD storms */
> > >     u8 hpd_short_storm_enabled;
> > >
> > > +   /* Last state reported by oob_hotplug_event */
> > > +   bool oob_hotplug_state;
> > > +
> > >     /*
> > >      * if we get a HPD irq from DP and a HPD irq from non-DP
> > >      * the non-DP HPD could block the workqueue on a mode config
> > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > > index c1d8c23baa39..a4596be4d34a 100644
> > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > @@ -59,7 +59,6 @@ struct dp_altmode {
> > >     struct typec_displayport_data data;
> > >
> > >     enum dp_state state;
> > > -   bool hpd;
> > >
> > >     struct mutex lock; /* device lock */
> > >     struct work_struct work;
> > > @@ -143,10 +142,7 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> > >             if (!ret)
> > >                     dp->state = DP_STATE_CONFIGURE;
> > >     } else {
> > > -           if (dp->hpd != hpd) {
> > > -                   drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > > -                   dp->hpd = hpd;
> > > -           }
> > > +           drm_connector_oob_hotplug_event(dp->connector_fwnode, hpd);
> > >     }
> > >
> > >     return ret;
> > > @@ -573,8 +569,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
> > >     cancel_work_sync(&dp->work);
> > >
> > >     if (dp->connector_fwnode) {
> > > -           if (dp->hpd)
> > > -                   drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > > +           drm_connector_oob_hotplug_event(dp->connector_fwnode, false);
> >
> > See, what does "false" here mean?
> >
> > Name the function for what it does, do not have random flags as
> > parameters, that makes it impossible to understand what the code is
> > doing when you are reading it, without having to jump around and figure
> > out what the flags are saying.
> >
> > And here they just don't even seem to be right :(
> >
>
> Both the old and new code will signal to the DRM driver that the cable
> was removed, the change is that we're carrying the level in the call
> rather than just indicating that the state has changed.
>
> We could introduce some HPD_HIGH/HPD_LOW defines to make it easier to
> read. But the various places I'm looking at just represented the hpd
> state as a bool.
>
> Regards,
> Bjorn



-- 
With best wishes
Dmitry
