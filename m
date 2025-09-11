Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F96B53341
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAB210EB3B;
	Thu, 11 Sep 2025 13:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BgrVqnrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D19A10EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:09:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A99B11A0DD2;
 Thu, 11 Sep 2025 13:09:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AB1560630;
 Thu, 11 Sep 2025 13:09:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B426102F28C0; 
 Thu, 11 Sep 2025 15:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757596196; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gBN2nTMeD6i5ODZAJyp6omgQEcD75ChSVNi/z0zbMTc=;
 b=BgrVqnrn3NvMb/IQkkFntbxca04UWnqHUa9XhaflCUsia671bsNwisWxEnChrV5+/m6lp3
 j/SZ7a3yMcoFv7qo5I5+SV8E2xoJSLrS0XD+W+5F1ywXcC6Gc1dEA7OGZUSpyFGRqTNOYR
 ipSSoJk/yVbeWcvipTGBJKev9cnRbdmZkgC2FyPOQnK+2z4n1knU9LNjAHnMj29hz0NJEE
 e5qPxm9lT1+dOOyoJbnGlGfj1XyMkSepJmApr3MAYd8VrQB24nSl5NtHXaZ0Ht6AHFPzgr
 KHpFC+nRGtMZ5LE0JhvYk3+ssNVpwOizTfnYPwJo6dHrhGbWgwCD5ko6qfs8Eg==
Date: Thu, 11 Sep 2025 15:09:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20250911150933.52a0416d@booty>
In-Reply-To: <20250911-adept-vengeful-jacamar-15f2a0@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty> <20250908154901.64f1a639@booty>
 <20250910-amazing-camouflaged-barracuda-bb79cb@houat>
 <20250910183440.3fe50fac@booty>
 <20250911-adept-vengeful-jacamar-15f2a0@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Maxime,

On Thu, 11 Sep 2025 08:44:34 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> > > > Option 2: have a function to unconditionally do the cleanups:
> > > > 
> > > > sn65dsi83_cleanups()
> > > > {
> > > > 	/* the same cleanups (no if) */
> > > > }
> > > > 
> > > > And then:
> > > >  * in atomic_pre_enable, instead of setting the flag
> > > >    add a devres action to call sn65dsi83_cleanups()
> > > >  * in atomic_disable, instead of clearing the flag
> > > >    remove the devres action
> > > > 
> > > > Even this option looks like more complicated and less readable code
> > > > to do the same thing.
> > > > 
> > > > Do you have in mind a better option that I haven't figured out?    
> > > 
> > > Would using devm_add_action in atomic_pre_enable, and
> > > devm_release_action in atomic_post_disable work?
> > > 
> > > That way, if you have a typical enable / disable cycle, the action will
> > > get registered and executed properly, and if you only have an enable but
> > > no matching disable, it will be collected after remove.  
> > 
> > So you're OK with option 2. I just implemented it, works well and the
> > resulting code is a bit cleaner. Queued for v2.  
> 
> Kind of, but you shouldn't remove but release it, and it doesn't have to
> be a single action / function.

Released instead of removed: yes.

Doesn't have to be a single function: I currently implemented a single
function with the 3 actions that are currently done in atomic_disable.
I think you propose to add 3 different devres actions, one for each,
but it would be more code and a little more resources used and I don't
see the advantage.

I think it makes sense that I send my current version and we can
continue discussion based on the code. I'm waiting a bit before
sending it, in case you have feedback about the other branch of this
discussion (placement of drm_bridge_unplug()).

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
