Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE938C7781
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D56710ED16;
	Thu, 16 May 2024 13:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cc5maFBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336D10ED16
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:22:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5750954fe30so154436a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715865725; x=1716470525; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nbQzqHxIP6KG/lZzEJaOb6JfbxQkJJtK+amOHat2cF0=;
 b=Cc5maFBO1J9zwAR2WqNB5YsIl3HxL4yWWCacw17x+ezbqu9OYHu6NyoARm1uslftne
 UyAVy01Ylcuy8lvLGFcTz89wVved+LjfeGDCmvNiprfuWu9dvSLdlFBBx3i0lmU7Nyjz
 ZYsZR7RZkW8zi2k0c0hMWNs3UgN31tXJvCHNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715865725; x=1716470525;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nbQzqHxIP6KG/lZzEJaOb6JfbxQkJJtK+amOHat2cF0=;
 b=Xgir6b66ua1unvFNeSMdF7vaaJ9bivuy5DWGqQt5zMNBdeFU19KrV7fadnIN/PXO+e
 gxq8/ts2Cp1vAnYKbN7SUQLl8oVdfNG1657dBKO8g7NWE4lgcbj3+8AG7wzldpaCq9DG
 o1PZ8/DVtXUYEbt/qMp8F3+NozC9iQe74i+vheCTanUtCBarmwaKSatywVIsS1FZpbdq
 WZ+ZqHynMWOWs+8mDtXCrvQrmU0ZVFRFhoEDQKbItZM8mkbr1ljS5Lqsgg5c9Tvx1hwE
 tIPokqKeTOfLg/GxlK1OgkSUfwab1s0yvDkcrIJsKcuaXw+5lGe8DwgUiizXvUnd3hBU
 h3Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqMsDG/RfThKnDciRfapTj3rWgp2Leh8IPf8UzTkknqDB8OxgpSLANzTbPQqJU25V1dNBFID8L3ixBMLQo+2JtJHGd3Yvj8gxalkuUkqZf
X-Gm-Message-State: AOJu0Yy2LoVmxRAauHetCpblwYCoBNbd6jg7XdO7eFPp5iZvd4aCNPMi
 N8b0sRn+VRyKsCwOxRlbO1UrMsE9VGtBQgH4LDCFl7Yswp1NYp7mU8HElVCCoxU=
X-Google-Smtp-Source: AGHT+IG/GbdAA1hnZI5HX8ckZhx9yyUo5RCiVYZCkkh9dmJJkpcbYE9NbAPi4OkErRr7QoWUCfwebQ==
X-Received: by 2002:a50:fb16:0:b0:572:5a35:4824 with SMTP id
 4fb4d7f45d1cf-5734d441a2bmr11951080a12.0.1715865724828; 
 Thu, 16 May 2024 06:22:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-575058cd7casm1219130a12.65.2024.05.16.06.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 06:22:03 -0700 (PDT)
Date: Thu, 16 May 2024 15:22:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <ZkYIeWzYyxkURS79@phenom.ffwll.local>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

Apologies for missing v1 ...

On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote:
> DRM hotplug bridge driver
> =========================
> 
> DRM natively supports pipelines whose display can be removed, but all the
> components preceding it (all the display controller and any bridges) are
> assumed to be fixed and cannot be plugged, removed or modified at runtime.
> 
> This series adds support for DRM pipelines having a removable part after
> the encoder, thus also allowing bridges to be removed and reconnected at
> runtime, possibly with different components.
> 
> This picture summarizes the  DRM structure implemented by this series:
> 
>  .------------------------.
>  |   DISPLAY CONTROLLER   |
>  | .---------.   .------. |
>  | | ENCODER |<--| CRTC | |
>  | '---------'   '------' |
>  '------|-----------------'
>         |
>         |DSI            HOTPLUG
>         V              CONNECTOR
>    .---------.        .--.    .-.        .---------.         .-------.
>    | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
>    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
>    |         |        |  |    | |        |         |         |       |
>    '---------'        '--'    '-'        '---------'         '-------'
> 
>  [--- fixed components --]  [----------- removable add-on -----------]
> 
> Fixed components include:
> 
>  * all components up to the DRM encoder, usually part of the SoC
>  * optionally some bridges, in the SoC and/or as external chips
> 
> Components on the removable add-on include:
> 
>  * one or more bridges
>  * a fixed connector (not one natively supporting hotplug such as HDMI)
>  * the panel

So I think at a high level this design approach makes sense, but the
implementation needs some serious thought. One big thing upfront though,
we need to have a clear plan for the overlay hotunload issues, otherwise
trying to make drm bridges hotpluggable makes no sense to me. Hotunload is
very, very tricky, full of lifetime issues, and those need to be sorted
out first or we're just trying to build a castle on quicksand.

For bridges itself I don't think the current locking works. You're trying
to really cleverly hide it all behind a normal-looking bridge driver, but
there's many things beyond that which will blow up if bridges just
disappear. Most importantly the bridge states part of an atomic update.

Now in drm we have drm_connector as the only hotunpluggable thing, and it
took years to sort out all the issues. I think we should either model the
bridge hotunplug locking after that, or just outright reuse the connector
locking and lifetime rules. I much prefer the latter personally.

Anyway the big issues:

- We need to refcount the hotpluggable bridges, because software (like
  atomic state updates) might hang onto pointers for longer than the
  bridge physically exists. Assuming that you can all tear it down
  synchronously will not work.

  If we reuse connector locking/lifetime then we could put the
  hotpluggable part of the bridge chain into the drm_connector, since that
  already has refcounting as needed. It would mean that finding the next
  bridge in the chain becomes a lot more tricky though. With that model
  we'd create a new connector every time the bridge is hotplugged, which I
  think is also the cleaner model (because you might plug in a hdmi
  connector after a panel, so things like the connector type change).
  
- No notifiers please. The create a locking mess with inversions, and
  especially for hotunplug they create the illusion that you can
  synchronously keep up to date with hardware state. That's not possible.
  Fundamentally all bridge drivers which might be hotunplugged need to be
  able to cope with the hardware disappearing any momemnt.

  Most likely changes/fixes we need to make overlay hotunload work will
  impact how exactly this works all ...

  Also note that the entire dance around correctly stopping userspace from
  doing modesets on, see all the relevant changes in
  update_connector_routing(). Relying on hotplugging connectors will sort
  out a lot of these issues in a consistent way.

- Related to this: You're not allowed to shut down hardware behind the
  user's back with drm_atomic_helper_shutdown. We've tried that approach
  with dp mst, it really pisses off userspace when a page_flip that it
  expected to work doesn't work.

- There's also the design aspect that in atomic, only atomic_check is
  allowed to fail, atomic_commit must succeed, even when the hardware is
  gone. Using connectors and their refcounting should help with that.

- Somewhat aside, but I noticed that the bridge->atomic_reset is in
  drm_bridge_attach, and that's kinda the wrong place. It should be in
  drm_mode_config_reset, like all the other ->atomic_reset hooks. That
  would make it a lot clearer that we need to figure out who/when
  ->atomic_reset should be called for hotplugged bridges, maybe as part of
  connector registration when the entire bridge and it's new connector is
  assembled?

- Finally this very much means we need to rethink who/how the connector
  for a bridge is created. The new design is that the main driver creates
  this connector, once the entire bridge exists. But with hotplugging this
  gets a lot more complicated, so we might want to extract a pile of that
  encoder related code from drivers (same way dp mst helpers take care of
  connector creation too, it's just too much of a mess otherwise).

  The current bridge chaining infrastructure requires a lot of hand-rolled
  code in each bridge driver and the encoder, so that might be a good
  thing anyway.

- Finally I think the entire bridge hotplug infrastructure should be
  irrespective of the underlying bus. Which means for the mipi dsi case we
  might also want to look into what's missing to make mipi dsi
  hotunpluggable, at least for the case where it's a proper driver. I
  think we should ignore the old bridge model where driver's stitched it
  all toghether using the component framework, in my opinion that approach
  should be deprecated.

- Finally I think we should have a lot of safety checks, like only bridges
  which declare themselve to be hotunplug safe should be allowed as a part
  of the hotpluggable bridge chain part. All others must still be attached
  before the entire driver is registered with drm_dev_register.

  Or that we only allow bridges with the NO_CONNECTOR flag for
  drm_bridge_attach.

There's probably a pile more fundamental issues I've missed, but this
should get a good discussion started.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
