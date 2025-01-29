Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFCDA21D08
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDED10E7E1;
	Wed, 29 Jan 2025 12:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mf5T0Pnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE99310E7E0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:22:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so7452736e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738153354; x=1738758154; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eRDMdrR73gUJ1Q4/o40XdsAUzR8OCpfjUSMlmEuWmLc=;
 b=mf5T0PnkzvAPwDyz5XA4IYRQH0+Cy1c/kPthyUQBx7xnOG3DgsJ0hoEz0p3fgrJitH
 MOkCeJe5uQlDP1g3WIRSEKbq03SC/ywHMLNReSwf+W0xjiFv+RDZAH6CZerE/9F7Luek
 54ngdNTBd3wtWe60txx3S5uswHX5iyThZCNBs5g9iU+hPRIsnBP/4TyDZwm6Cx54Qghq
 NjazcZPHejBLqDAfBcYzGPp2njyOemdW8PH3po6QGDNeYC9ywWiSHeuTvMjkix9pMGTv
 5nVxv/iCbvMD/uHiQryIm8WHOwuk1q8AFvxLERr2+MnThjrMO/oyecy/2wC3yNP45+bG
 vZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738153354; x=1738758154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRDMdrR73gUJ1Q4/o40XdsAUzR8OCpfjUSMlmEuWmLc=;
 b=bj3lU5kJRXB74kkees01WlxtkNqLSQloIDCXgerxZDbrMkdd1m9Ahsl+6cSwW7hxN3
 ph+onJHtSzNQJ5WVtGMD2AlWLDyKSJXOuYSMRV/YKORrjY9Jfb4roAQtfDLKivHgVU+O
 QIJXh5OyHE456MMia8LAbugONTpL8mkNVLeDEE9NsQjTktQCN9RI6/9pjEUT/DHLpqAZ
 khSjolcB3aFBJsdlOXrKY44q2sfGB04KAoWdWsr9TlttlM1PW3HMQg4uyug/OotG0cgH
 q/qVIF0etQzVTnRbjDsGvS4DAj3EiKAbdTZY2e2BGZHt/Hi9c3UxQ2a3dgKA2O6mA/4R
 JudQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7eH3ppPozMK82joR7xzPTHeEfbG4+6dY2n/CEds3qebCKf8qcIUnF+MrTK3ge3mTCoN42p8uO0Is=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxskOQp83Aq1wGcEd095XgD3siEEe3AcN7b/pOgWxXz9VyNGigV
 NsgpQYj28L53cggwLCOXIioYCKB8pB9uXyjzhl8B+CX96FjHytx6ghCbBotm+1s=
X-Gm-Gg: ASbGncssacPDD4kfpqN8JA1ouXyKlqKwgQOxm44chqqLT5GY+517Eft6fZB6tyXbVqQ
 tTnz8Gbl8X+muGKQhZY5qHZIG2ysv+B5oBN1bcERgvTytZwWxknj+rABJiv1ABZA8X4hSr2UotM
 5kqSObD+jbYFVxSKl48Yv8eYF0OEpwCyaY9Z44sJK6ZgvrnTNkHjx9RCEfT5jPI/9UFNOmugZPP
 AgYQZBRqAFNDdzksEEoIx3ngptfNQT3/wRrYnK+GniEOUVis+q9YBNOI9vBF7FKsMs7BjJIE3V/
 dwjlJKKajM9pm5yfIyJzZ9bkfHNIcmQ5ovkiuXNaV7/JwUkVLgSjaWRCqnLfEYhPni4+sIE=
X-Google-Smtp-Source: AGHT+IGvBOgV2ZaaEvAbq6mS1qgCJfJWEc+POw07Pf84KnH6OU2QSM8Lwr3ZtXvI91MJz/jrtziZ1w==
X-Received: by 2002:ac2:4e08:0:b0:542:2a29:88ed with SMTP id
 2adb3069b0e04-543e4c3c238mr992245e87.44.1738153353797; 
 Wed, 29 Jan 2025 04:22:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8228943sm1973304e87.33.2025.01.29.04.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 04:22:32 -0800 (PST)
Date: Wed, 29 Jan 2025 14:22:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <yipjwosmkqsadvhulzh76ydqbfvv5npdafl3yzdjmikfa2yq4y@j7nj4audwxl7>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
 <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
 <20250122171230.30cf9b97@booty>
 <jiwexbvzcrq7hywl5t25cojrgjnyv5q2wnb2kvgriucal6764w@hhrefcftcjza>
 <20250129125153.35d0487a@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129125153.35d0487a@booty>
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

On Wed, Jan 29, 2025 at 12:51:53PM +0100, Luca Ceresoli wrote:
> Hi Maxime,
> 
> On Tue, 28 Jan 2025 15:49:23 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > Hi,
> > 
> > On Wed, Jan 22, 2025 at 05:12:30PM +0100, Luca Ceresoli wrote:
> > > On Wed, 8 Jan 2025 17:02:04 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > > 
> > > [...]
> > >   
> > > > > > > And we'll also need some flag in drm_bridge to indicate that the device
> > > > > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > > > > because now your bridge driver sticks around for much longer than your
> > > > > > > device so the expectation that your device managed resources (clocks,
> > > > > > > registers, etc.) are always going to be around.      
> > > > > 
> > > > > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > > > > drm_bridge.c will need to be sprinkled with them I guess.    
> > > > 
> > > > The users would be the drivers, most likely. There's not much we can do
> > > > at the framework level, unfortunately.  
> > > 
> > > Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
> > > be consistent with the struct drm_device naming, and
> > > drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
> > > a question.
> > > 
> > > In case:
> > > 
> > >   a) there is a notification callback to inform about bridges
> > >      being removed, and
> > >   b) all entities owning a struct drm_bridge pointer stop using
> > >      that pointer when notified
> > > 
> > > 
> > > With the above, there should be no need for
> > > drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
> > > a bridge that is being removed.
> > > 
> > > Now, about a), patch 1 in this series implements such a mechanism to
> > > inform all bridges when a bridge is being removed. Note that the
> > > "unplugged" flag would be set immediately after the notifier callback
> > > is currently called: "unplugged == true" will never happen before the
> > > callback, and after the callback there will be no pointer at all.
> > > 
> > > Patch 1 however is only notifying bridges, so other entities (e.g.
> > > encoders) cannot be notified with this implementation. However a
> > > different notification mechanism can be implemented. E.g. until v3 this
> > > series was using a generic struct notifier_block for this goal [0], so
> > > any part of the kernel can be notified.
> > > 
> > > About b), the notification appears simpler to implement in the various
> > > drivers as it needs to be added in one place per driver. Also adding
> > > drm_bridge_enter()/exit() can be trickier to get right for non-trivial
> > > functions.
> > > 
> > > Do you see any drawback in using a notification mechanism instead of
> > > drm_bridge_enter()/exit() + unplugged flag?  
> > 
> > Yeah, because we're not considering the same thing :)
> > 
> > The issue you're talking about is that you want to be notified that the
> > next bridge has been removed and you shouldn't use the drm_bridge
> > pointer anymore.
> > 
> > A notification mechanism sounds like a good solution there.
> > 
> > The other issue we have is that now, we will have the drm_bridge pointer
> > still allocated and valid after its device has been removed.
> > 
> > In which case, you need to be able to tell the bridge driver whose
> > device got removed that the devm resources aren't there anymore, and it
> > shouldn't try to access them.
> > 
> > That's what drm_bridge_enter()/exit is here for.
> 
> Let me rephrase to check I got what you mean.
> 
> A) On bridge removal, use a notifier to notify all consumers of that
> bridge that they have to stop using the pointer to the bridge about to
> be removed.
> 
> B) Internally in the bridge driver (provider) use
> drm_bridge_enter()/exit() to forbid access to resources when the
> hardware is unplugged.
> 
> And also: bridge consumers won't need to use drm_bridge_enter()/exit()
> as they will clear their pointer before setting the unplugged flag.
> 
> Is my understanding of your idea correct?
> 
> If it is, I tend to agree, and I like it.
> 
> I like it, except for one point  I'm afraid. Why do we need enter/exit
> inside the driver (provider) code? At driver release, the driver
> instance won't exist anymore. Sure the private struct embedding a
> struct drm_bridge will be still allocated for some time, but the struct
> device will not exist, and the device driver instance as well.

You have to sync several possible kinds of events: bridge calls from DRM
core, from HDMI audio, CEC, DP AUX _and_ completely async device
'remove' / unbind callbacks.

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
