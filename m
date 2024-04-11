Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99318A1A4A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 18:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0712210F21E;
	Thu, 11 Apr 2024 16:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="grh4jBWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E8910F222
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 16:45:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D162E0002;
 Thu, 11 Apr 2024 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712853955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGS9UFJvB6INMsQL2N/uv5nxLkUjHaniFpZl0Oeq4Eg=;
 b=grh4jBWYb7zuVyICONUx6Ou1qN3vXf1keaNOV+2neFaVc/J4oL0qXYTTMCHzAiNIQH6rDK
 2iRPdGZz7JPUS0LpVUL/5b6oX+CMxhGTUXY6OWvMJDAfjD9GgDa1gtR6S6CHNaaCvRPo9C
 KIa0hwHlA61Pz/U59Uf8e/qwUN0R/tDTLA3qohCtmV4BfY9a5OCtRYylsCzUF9o5GhWE6t
 qoNuY8wbX8IL4Ca+8o329xSzpzfDGGZ8jQCr3tH5FduUOX8LJqUO/vMlPUqZUcgKD6ZzBZ
 eyvayM21UlOTjwoI0uU1iWfsPvQRBXr8dtuTT61BOV9HY39X8elMPLFBRIK1/g==
Date: Thu, 11 Apr 2024 18:45:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?He?=
 =?UTF-8?Q?rv=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 4/4] drm/bridge: hotplug-bridge: add driver to support
 hot-pluggable DSI bridges
Message-ID: <20240411184551.317184ba@booty>
In-Reply-To: <20240327170849.0c14728d@booty>
References: <20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com>
 <20240326-hotplug-drm-bridge-v1-4-4b51b5eb75d5@bootlin.com>
 <20240327-radiant-cherry-myna-25afc4@houat>
 <20240327170849.0c14728d@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

On Wed, 27 Mar 2024 17:08:49 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

[...]

> > There's several additional hurdles there:
> > 
> >  - You mentioned the connector in your ideal scenario. But as soon as
> >    you remove the last bridge, the connector will probably go away too.
> >    There's two scenarii here then:
> > 
> >    - The driver is ok, and it will stay there until the last user its to
> >      the main DRM device. Which means that if you create a new one,
> >      you'll have the old one and the new one together, but you can't
> >      tell which one you're supposed to use.
> > 
> >    - If the driver isn't ok, the connector will be freed immediately.
> >      There's plenty of lingering pointers in the framework, and
> >      especially the states though, leading to use-after-free errors.
> > 
> >  - So far, we told everyone that the graphics pipeline wasn't going to
> >    change. How do you expect applications to deal with a connector going
> >    away without any regression? I guess the natural thing here would be
> >    to emit a uevent just like we do when the connection status change,
> >    but the thing is: we're doing that for the connector, and the
> >    connector is gone.  
> 
> Thanks for your feedback. I probably should have discussed this aspect
> in my cover letter, sorry about that, let me amend now.
> 
> I think there are two possible approaches.
> 
> The first approach is based on removing the drm_connector. My laptop
> uses the i915 driver, and I have observed that attaching/removing a
> USB-C dock with an HDMI connector connected to a monitor, a new
> drm_connector appears/disappears for the card. User space gets notified
> and the external monitor is enabled/disabled, just the way a desktop
> user would expect, so this is possible. I had a look at the driver but
> how this magic happens was not clear to me honestly.
> 
> The second approach is simpler and based on keeping the drm_connector
> always instantiated, and it is what this driver does. The drm_connector
> is added by the hotplug-bridge driver in the drm_bridge_funcs.attach op,
> which happens initially, and only removed by drm_bridge_funcs.detach,
> so it is never removed when detaching the _following_ part of the
> pipeline (which the card is unaware of). So the encoder always has a
> drm_connector.
> 
> Note when attaching to the downstream bridge we pass the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, which _should_ prevent creation of a
> second connector. I'd expect some drivers to not honour that flag, but
> they can be fixed if needed.
> 
> When the tail of the pipeline is connected/removed, the
> hpb->next_bridge pointer becomes valid/NULL. And
> hotplug_bridge_detect() looks at exactly that pointer to return a
> connected or disconnected status.
> 
> The result is that when the add-on is connected, 'modetest -c' shows:
> 
>   Connectors:
>   id      encoder status          name            size (mm)       modes   encoders
>   37      0       connected       DSI-1           293x165         1       36
>     modes:
>           index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
>     #0 1920x1080 60.00 1920 1978 2020 2108 1080 1088 1102 1116 141140 flags: ; type: preferred, driver
>     props:
>   ...
> 
> and when it is disconnected, it shows:
> 
>   Connectors:
>   id      encoder status          name            size (mm)       modes   encoders
>   37      0       disconnected    DSI-1           0x0             0       36
>     props:
>   ...
> 
> weston detects the HPD events from the connector and starts/stops using
> the removable display correctly.
> 
> Does this clarify the approach?
> 
> I could be missing some aspects of course, especially in case of more
> complex hardware setups than the one I have. However the code in this
> series has been tested for a long time and no memory-safety issue has
> appeared.
> 
> > Between the userspace expectations and the memory-safety issue plaguing
> > way too many drivers, I'm not sure this approach can work.
> > 
> > I guess one way to somewhat achieve what you're trying to do would be to
> > introduce the connection status at the bridge level, reflect the
> > aggregate connection status of all bridges on the connector, and make
> > each bridge driver probe its device in the connect hook through DCS or
> > I2C.  
> 
> I think you mean: keeping all the bridge drivers instantiated, even
> when the physical chip is removed.
> 
> This is of course another possible approach. However it would be more
> invasive, forcing bridge drivers to change their current behaviour. And
> it would violate the design that a driver is probed when a device is
> there, and removed when the hardware goes away.
> 
> The approach I took firstly allows to have zero modifications to
> existing bridge drivers -- not necessarily the right thing to do, but I
> didn't find any good reason to require that.
> 
> Additionally, it is designed to allow removing an add-on having bridge
> XYZ and then plugging in another add-on with bridge ABC, having a
> different driver. Keeping alive the XYZ driver on unplug would not make
> sense in such a case. This is not a tested scenario as I have no
> hardware allowing that, but it is part of the design goals and I see no
> obvious reason it wouldn't work with this patch as is, since the
> downstream bridge driver is removed on disconnect and probed on connect
> for whatever bridge will be connected.

Did you have a chance to think about this? I was wondering whether my
comments addresses some of your concerns, and whether these additional
clarifications make my approach look reasonable to you.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
