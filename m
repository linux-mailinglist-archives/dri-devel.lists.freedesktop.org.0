Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8911EAE8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 20:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548B26EC2E;
	Fri, 13 Dec 2019 19:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E736EC23
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 19:04:43 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id u139so244558ywf.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yTUJ0LPuGEKIOFhEYQWIDMDEJafGql48OWMcUM1VHk0=;
 b=H1H5IV4AAiCxMpeU7BUhtqVcN+2+VEf6AgZMKoLjH03bHbRQlEUU6r8DeyOJjxw+nd
 ep/twPdYrEp1ozbg5skDLwa/X2tX+0IIUASP14mjmocO7J6IbI64iU/Hw7AfMsN18keo
 ywHths21k4cDRIu4WJwyut7g9S6Z4//Usyg5wHMcft0cZlX3iB82YPS0N8x3zTWY/qHQ
 55T9lG/aEY5SBQWPzJZlHTEBfaYrhtwpO/4hP490cMqLJNHUE7yVAo9tq6+XnI9HqM8w
 pC7qsAw8lsNcYvxIVDfzQG/ojj/dNVic9GZ+ZKYHhB7TZVW06zGusL7dI1mYwYqLuKp/
 j5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yTUJ0LPuGEKIOFhEYQWIDMDEJafGql48OWMcUM1VHk0=;
 b=BAZUi9uSPIgET5cgPcL0HL+L++8StvvOResnOeWuLTX6tYUwWyHacY4REylTAbsFbu
 70sknLUU4WNfReQHut+hSmn89Xc2wwFhbwKTnNnd9knlo6chVA2pZIIJAUUJ9gquEgoo
 UDuM1viIi0MmX7OTG5bEcBavdIxZAPKMMNkGgWh5pm2eyoKYvMnFjUDJLIGjxxhbm4yB
 sSfgHTpgzkzug0zDizH7a/pHWlmYiT+/ZxtqGS2WorkcOvHmf3PLjaMuif9UO9AWQiqG
 K5V+myajwIT2x7sSnLt8m3DC9KnBh/vck09UybTMGBZKhDAfmdnP1XmxpM+o4LcmT79q
 szyA==
X-Gm-Message-State: APjAAAX2gCqeXRbGGtEebWvaLWrqjlB/FmyhiQR5OxAqPPpvRAtWOHEM
 Mp3hzuo4Ud9TcSB/WvTUd9Rzmw==
X-Google-Smtp-Source: APXvYqyg/KzHy/OZNBR3rlGaGGSnkMjRiD4SJwJv3D0CogI+WetUGRc5U3jWsPXZHV0DMUAPSQCreg==
X-Received: by 2002:a81:7841:: with SMTP id t62mr9825193ywc.140.1576263882275; 
 Fri, 13 Dec 2019 11:04:42 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id g190sm4401442ywf.41.2019.12.13.11.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 11:04:41 -0800 (PST)
Date: Fri, 13 Dec 2019 14:04:41 -0500
From: Sean Paul <sean@poorly.run>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v2 07/12] drm/i915: Protect workers against disappearing
 connectors
Message-ID: <20191213190441.GF41609@art_vandelay>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-8-sean@poorly.run>
 <20191213111033.GF3829@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213111033.GF3829@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 04:40:33PM +0530, Ramalingam C wrote:
> On 2019-12-12 at 14:02:25 -0500, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch adds some protection against connectors being destroyed
> > before the HDCP workers are finished.
> > 
> > For check_work, we do a synchronous cancel after the connector is
> > unregistered which will ensure that it is finished before destruction.
> > 
> > In the case of prop_work, we can't do a synchronous wait since it needs
> > to take connection_mutex which could cause deadlock. Instead, we'll take
> > a reference on the connector when scheduling prop_work and give it up
> > once we're done.
> > 
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Will there be an instance where prop_work is scheduled but before
> execution cancelled from the queue itself? This will leak the connector
> reference.

No, prop_work is really quite simple, it just grabs some locks and updates the
property value. 

> 
> Atleast hdcp stack is not requesting for such action. So Looks good to me.
> 
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

Thanks, I'm going to dig into what we should do when hdcp_cleanup is called from
connector_init failure paths and revise this patch.

> > 
> > Changes in v2:
> > - Added to the set
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 38 ++++++++++++++++++++---
> >  1 file changed, 33 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 798e7e1a19fc..c79dca2c74d1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -863,8 +863,10 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
> >  		return;
> >  
> >  	hdcp->value = value;
> > -	if (update_property)
> > +	if (update_property) {
> > +		drm_connector_get(&connector->base);
> >  		schedule_work(&hdcp->prop_work);
> > +	}
> >  }
> >  
> >  /* Implements Part 3 of the HDCP authorization procedure */
> > @@ -954,6 +956,8 @@ static void intel_hdcp_prop_work(struct work_struct *work)
> >  
> >  	mutex_unlock(&hdcp->mutex);
> >  	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> > +
> > +	drm_connector_put(&connector->base);
> >  }
> >  
> >  bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
> > @@ -1802,6 +1806,9 @@ static void intel_hdcp_check_work(struct work_struct *work)
> >  					       check_work);
> >  	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
> >  
> > +	if (drm_connector_is_unregistered(&connector->base))
> > +		return;
> > +
> >  	if (!intel_hdcp2_check_link(connector))
> >  		schedule_delayed_work(&hdcp->check_work,
> >  				      DRM_HDCP2_CHECK_PERIOD_MS);
> > @@ -2076,12 +2083,33 @@ void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
> >  
> >  void intel_hdcp_cleanup(struct intel_connector *connector)
> >  {
> > -	if (!connector->hdcp.shim)
> > +	struct intel_hdcp *hdcp = &connector->hdcp;
> > +
> > +	if (!hdcp->shim)
> >  		return;
> >  
> > -	mutex_lock(&connector->hdcp.mutex);
> > -	kfree(connector->hdcp.port_data.streams);
> > -	mutex_unlock(&connector->hdcp.mutex);
> > +	WARN_ON(!drm_connector_is_unregistered(&connector->base));
> > +
> > +	/*
> > +	 * Now that the connector is unregistered, check_work won't be run, but
> > +	 * cancel any outstanding instances of it
> > +	 */
> > +	cancel_delayed_work_sync(&hdcp->check_work);
> > +
> > +	/*
> > +	 * We don't cancel prop_work in the same way as check_work since it
> > +	 * requires connection_mutex which could be held while calling this
> > +	 * function. Instead, we rely on the connector references grabbed before
> > +	 * scheduling prop_work to ensure the connector is alive when prop_work
> > +	 * is run. So if we're in the destroy path (which is where this
> > +	 * function should be called), we're "guaranteed" that prop_work is not
> > +	 * active (tl;dr This Should Never Happen).
> > +	 */
> > +	WARN_ON(work_pending(&hdcp->prop_work));
> > +
> > +	mutex_lock(&hdcp->mutex);
> > +	kfree(hdcp->port_data.streams);
> > +	mutex_unlock(&hdcp->mutex);
> >  }
> >  
> >  void intel_hdcp_atomic_check(struct drm_connector *connector,
> > -- 
> > Sean Paul, Software Engineer, Google / Chromium OS
> > 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
