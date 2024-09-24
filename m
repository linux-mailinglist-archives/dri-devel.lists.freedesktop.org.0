Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52276984075
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773710E68A;
	Tue, 24 Sep 2024 08:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dpzPVbjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C7B10E689
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:26:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so6293795a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727166403; x=1727771203; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wz3T46c2ahOoUBUtoABo2mrI5DgKwPOYDtFBCOD3S3w=;
 b=dpzPVbjgp7X/eaU3R22R3nh06ZO8LaVfgHEwgHhxpmbILaqpBBfDayqFagPoj0nPP1
 nCjzgfZSpFxVxNtev8ZUaPQ4w51rzJgsxUgd+z2VlI/md2EQh1MufTBbXyZD2bM7QHNQ
 WhALorR3vjb8qNuzPmkFZpcn7JK0vPi6QQrBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727166403; x=1727771203;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wz3T46c2ahOoUBUtoABo2mrI5DgKwPOYDtFBCOD3S3w=;
 b=OrSfhNj9lddMQ3uYKvg7IZFtFYdX3sccmbc2vfmHh9nnRrK6hS7MkvL8x6kcQQ0BvE
 uLkjtoYMHxaIWn39vMHV2tUoyKVZJ2qfhTbUNv56cVBJzuiGaFIfiXC/h5duggQSwvij
 65waGxanvDiNb6lWW8InC5OZZpEm3VbyMfbT+lwa4yeJWwTKty72yeMzWXcE1ed+llxT
 qPW2uZBdHoecm8kcMq0+2LyIDji43d42o9Iws7SWJ8gX5P6ZLDU/whkRXP1j8JqPyLPd
 2Ke7f46YyD5E9aSqlEqWnLJJFvtiprZza9u+kj+Cezz900vdSIhtJgL6VoVBjSy6ffrE
 VI0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9cbqk5P07bZROlh5xK7RLzwdxNpEvA2KkiA5Zw/o03Z1KUJBqQ6/fuiBXw6Jen0+5JkGthXDyfTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKxrLKIETS1ssWF7HQs9h4+6AXSY0WeGv7wVzJ9hlsdI9G2sL6
 1id6/ZZwjz2NO923GHXZRvoyRSqMHWiVGM9dmNKrmRGWF6nn16yMMvjaZ+T9d5w=
X-Google-Smtp-Source: AGHT+IHDwePKqWzDkjvluRHbh0eyYPxg0TCm7k2qC0ZBhi6ffqJyj8iob2hIBR+ouAsT8NiAaO4nSA==
X-Received: by 2002:a05:6402:5216:b0:5c3:d908:98f0 with SMTP id
 4fb4d7f45d1cf-5c464daab65mr10953338a12.3.1727166402162; 
 Tue, 24 Sep 2024 01:26:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c315sm498924a12.15.2024.09.24.01.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 01:26:40 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:26:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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
Message-ID: <ZvJ3vUCLsowLr_Mv@phenom.ffwll.local>
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
 <ZkYIeWzYyxkURS79@phenom.ffwll.local>
 <20240520140148.26b91240@booty>
 <ZkyND17TGj6y0Wjq@phenom.ffwll.local>
 <20240823123903.1c793c4b@booty>
 <Zs4AuPPHaFY0WzBZ@phenom.ffwll.local>
 <20240909152604.1dd27605@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240909152604.1dd27605@booty>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Mon, Sep 09, 2024 at 03:26:04PM +0200, Luca Ceresoli wrote:
> Hello Sima,
> 
> again thanks for your feedback, and again I'm afraid I'm having a hard
> time in understanding large parts of your e-mail. Below I'm trying to
> focus on one fundamental aspect only, which I need to understand the
> overall approach you are suggesting.

Sorry for the late reply, was a bit distracted last weeks ...

> On Tue, 27 Aug 2024 18:37:12 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > On Fri, Aug 23, 2024 at 12:39:03PM +0200, Luca Ceresoli wrote:
> > > Hello Sima,
> > > 
> > > these days I started looking in more detail into some of the topics you
> > > had mentioned in your v2 review. I have questions about those I have
> > > investigated, see below.
> > > 
> > > On Tue, 21 May 2024 14:01:19 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   
> > > > On Mon, May 20, 2024 at 02:01:48PM +0200, Luca Ceresoli wrote:  
> > > > > Hello Daniel,
> > > > > 
> > > > > On Thu, 16 May 2024 15:22:01 +0200
> > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >     
> > > > > > Apologies for missing v1 ...
> > > > > > 
> > > > > > On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote:    
> > > > > > > DRM hotplug bridge driver
> > > > > > > =========================
> > > > > > > 
> > > > > > > DRM natively supports pipelines whose display can be removed, but all the
> > > > > > > components preceding it (all the display controller and any bridges) are
> > > > > > > assumed to be fixed and cannot be plugged, removed or modified at runtime.
> > > > > > > 
> > > > > > > This series adds support for DRM pipelines having a removable part after
> > > > > > > the encoder, thus also allowing bridges to be removed and reconnected at
> > > > > > > runtime, possibly with different components.
> > > > > > > 
> > > > > > > This picture summarizes the  DRM structure implemented by this series:
> > > > > > > 
> > > > > > >  .------------------------.
> > > > > > >  |   DISPLAY CONTROLLER   |
> > > > > > >  | .---------.   .------. |
> > > > > > >  | | ENCODER |<--| CRTC | |
> > > > > > >  | '---------'   '------' |
> > > > > > >  '------|-----------------'
> > > > > > >         |
> > > > > > >         |DSI            HOTPLUG
> > > > > > >         V              CONNECTOR
> > > > > > >    .---------.        .--.    .-.        .---------.         .-------.
> > > > > > >    | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
> > > > > > >    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
> > > > > > >    |         |        |  |    | |        |         |         |       |
> > > > > > >    '---------'        '--'    '-'        '---------'         '-------'
> > > > > > > 
> > > > > > >  [--- fixed components --]  [----------- removable add-on -----------]
> > > > > > > 
> > > > > > > Fixed components include:
> > > > > > > 
> > > > > > >  * all components up to the DRM encoder, usually part of the SoC
> > > > > > >  * optionally some bridges, in the SoC and/or as external chips
> > > > > > > 
> > > > > > > Components on the removable add-on include:
> > > > > > > 
> > > > > > >  * one or more bridges
> > > > > > >  * a fixed connector (not one natively supporting hotplug such as HDMI)
> > > > > > >  * the panel      
> > > > > > 
> > > > > > So I think at a high level this design approach makes sense,    
> > > > > 
> > > > > Good starting point :)
> > > > >     
> > > > > > but the
> > > > > > implementation needs some serious thought. One big thing upfront though,
> > > > > > we need to have a clear plan for the overlay hotunload issues, otherwise
> > > > > > trying to make drm bridges hotpluggable makes no sense to me. Hotunload is
> > > > > > very, very tricky, full of lifetime issues, and those need to be sorted
> > > > > > out first or we're just trying to build a castle on quicksand.
> > > > > > 
> > > > > > For bridges itself I don't think the current locking works. You're trying
> > > > > > to really cleverly hide it all behind a normal-looking bridge driver, but
> > > > > > there's many things beyond that which will blow up if bridges just
> > > > > > disappear. Most importantly the bridge states part of an atomic update.    
> > > > > 
> > > > > Surely possible as atomic updates are definitely not stimulated in my
> > > > > use case. Can you recommend any testing tools to be able to trigger any
> > > > > issues?    
> > > > 
> > > > Uh really hard ... You'd need to create an atomic commit that's blocked on
> > > > a sync_file in-fence (so that you can extend the race window). And then
> > > > hotunplug the bridge chain _before_ you signal that fence.
> > > > 
> > > > That's not going to cover all possible races, but at least a large chunk
> > > > of the really big ones.
> > > >   
> > > > > The main setups I used for my testing so far are 'modetest -s' for my
> > > > > daily work and a simple weston setup to periodically test a complete
> > > > > user space stack.
> > > > >     
> > > > > > Now in drm we have drm_connector as the only hotunpluggable thing, and it
> > > > > > took years to sort out all the issues. I think we should either model the
> > > > > > bridge hotunplug locking after that, or just outright reuse the connector
> > > > > > locking and lifetime rules. I much prefer the latter personally.
> > > > > > 
> > > > > > Anyway the big issues:
> > > > > > 
> > > > > > - We need to refcount the hotpluggable bridges, because software (like
> > > > > >   atomic state updates) might hang onto pointers for longer than the
> > > > > >   bridge physically exists. Assuming that you can all tear it down
> > > > > >   synchronously will not work.
> > > > > > 
> > > > > >   If we reuse connector locking/lifetime then we could put the
> > > > > >   hotpluggable part of the bridge chain into the drm_connector, since that
> > > > > >   already has refcounting as needed. It would mean that finding the next
> > > > > >   bridge in the chain becomes a lot more tricky though. With that model
> > > > > >   we'd create a new connector every time the bridge is hotplugged, which I
> > > > > >   think is also the cleaner model (because you might plug in a hdmi
> > > > > >   connector after a panel, so things like the connector type change).  
> > > 
> > > So, based on your dp__mst hint I added connector creation/removal in the
> > > v3 I sent a few days ago. All other aspects in your list are unchanged
> > > from the v2 you have reviewed.
> > > 
> > > Now I'm trying to tackle some other of the items you mentioned here,
> > > and locking/lifetime is the hardest one for me to understand at the
> > > moment.
> > > 
> > > If I get you right, you suggest making all the removable bridges
> > > "owned" by the connector that gets hotplugged, the reason being that
> > > locking and lifetime issues for the hotplug connectors have already
> > > been sorted out, while that has not been done for bridges.
> > > 
> > > Correct?  
> > 
> > Yes.
> > 
> > > Assuming the above is correct, I'm wondering whether this would be a
> > > correct design or rather a shortcut to leverage the connector locking
> > > instead of implementing bridge locking/lifetime. Note I'm not
> > > criticizing, I'm really asking myself this question and I'd like to
> > > know your position about that.
> > > 
> > > Again about putting the removable bridges inside the hotplug connector,
> > > I'm trying to understand how that may happen in the device tree case.
> > > The hot-pluggable bridge is populated starting from the DT code
> > > (through i2c-core-of in my case being an I2C chip), and that code is
> > > not aware that it is being instantiating a DRM device. So there is
> > > nothing we can do before the bridge probe is called. The bridge probe
> > > then does know much about any connectors. It also does not know about
> > > hotplug: this is a design decision I made to make the regular bridge
> > > drivers reusable without edits for the hotplug case, but it can be
> > > waived if needed.
> > > 
> > > So the only way I currently to move the bridge inside the connector is
> > > to catch it in the hotplug-bridge driver, when it gets notified about
> > > the new bridge having appeared (was a notifier, I'm changing that, see
> > > below). So the hotplug-bridge would need a function line
> > > drm_connector_add_bridge(conn, br) to make the association.
> > > 
> > > Is this the direction of development you had in mind?  
> > 
> > Not quite. The issue is that while bridges are getting hotplugged, you
> > don't yet have a connector. So there's nothing you can attach to. What I
> > had in mind is more:
> > 
> 
> There is a fundamental question where your position is not clear to me.
> Based on this:
> 
> > - The last fixed bridges knows that all subsequent bridges are hotplugged.
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   Which means instead of just asking for the next bridge, it needs to ask
> >   for the fully formed bridge chain, including the connector.
> > 
> 
> and this:
> 
> > - The hotplug bridge connector code checks every time a new bridge shows
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   up whether the chain is now complete. Once that is the case, it creates
> >   the connector (with the new bridge design this is no longer the job of
> >   the last bridge in the chain, so we need to require that for
> >   hotpluggable bridges). Then it can attach all the bridges to that
> >   connector, and hand the entire fully formed chain to the last fixed
> >   bridge to hotplug insert and register.
> 
> The question is: do you think the hotplug-bridge driver should be
> present, or not? To me the two above sentences appear to contradict each
> other.
> 
> The reason we decided to implement a hotplug DRM bridge is it allows to
> decouple the fixed and the remote segments of the pipeline, in such a
> way that all the regular bridge drivers don't need any special handling
> to support hotplug.
> 
> In my work the upstream bridge driver is samsung-dsim.c and the
> downstream one is ti-sn65dsi83.c and none of them needed a single line
> changed to support hotplug. I think this is useful: virtually any
> physical bridge with pins can be used in a hotplug setup, either in the
> fixed or in the removable section, so not needing to modify them is
> valuable.
> 
> OTOH in various parts of this and other e-mails you seem to imply that
> there should be no hotplug-bridge (not as a struct drm_bridge, not as
> a driver, or both). Except for the fact that there is no chip
> implementing such a bridge (there is a physical connector though) I do
> not see many reasons.

Yeah you can have a dummy hotplug-bridge driver which just represents the
hotplug connector, I don't see an issue with that. And sounds like a
reasonable idea if it helps modelling with DT and all that.

What I described above was just focused on the interaction between bridge
drivers and the hotplug support code. I think you absolutely need the last
bridge driver to be aware that the entire subsequent chain is hotplugged,
otherwise it wont work. That last bridge driver can be a special
hotplug driver, but it doesn't need to be the case.

> > - Hotunplug is the same, but on inverse: The entire chain including the
> >   connector gets removed in it's entirety, before it gets dissassembled
> >   and freed (once the last refcount to the connector is dropped).
> > 
> > There is a _lot_ of handwaving in this on the driver model side, but with
> > this the drm side should be clear and clean at least.
> > 
> > > > > I have been investigating the option of adding/removing a connector
> > > > > based on hot-plug/unplug events initially, see my reply to Maxime after
> > > > > v1 [0]:
> > > > >     
> > > > > > The first approach is based on removing the drm_connector. My laptop
> > > > > > uses the i915 driver, and I have observed that attaching/removing a
> > > > > > USB-C dock with an HDMI connector connected to a monitor, a new
> > > > > > drm_connector appears/disappears for the card. User space gets notified
> > > > > > and the external monitor is enabled/disabled, just the way a desktop
> > > > > > user would expect, so this is possible. I had a look at the driver but
> > > > > > how this magic happens was not clear to me honestly.    
> > > > > 
> > > > > So if you could point to where/how this is done, I would certainly
> > > > > reconsider that.    
> > > > 
> > > > Right now only the dp mst code uses hotplug/unplug (like you've observed
> > > > in your testing with i915, usb-c docks are generally all dp mst). For code
> > > > reading it might be best to start with the i915 dp mst code and then go
> > > > through the helpers.
> > > >   
> > > > > > - No notifiers please. The create a locking mess with inversions, and
> > > > > >   especially for hotunplug they create the illusion that you can
> > > > > >   synchronously keep up to date with hardware state. That's not possible.
> > > > > >   Fundamentally all bridge drivers which might be hotunplugged need to be
> > > > > >   able to cope with the hardware disappearing any momemnt.    
> > > > > 
> > > > > Can you clarify this point? I'm sorry I fail to understand the
> > > > > relationship between the use of notifiers and the ability of bridge
> > > > > drivers to cope with hardware disappearing.
> > > > > 
> > > > > In this patch, the hotplug-bridge uses notifiers to be informed when
> > > > > the following bridge is disappearing: which other way would you suggest
> > > > > to make the hotplug-bridge aware of that? OTOH the hotplug-bridge is
> > > > > not meant to disappear, and it has no actual hardware that can go away,
> > > > > being just a mechanical connector.    
> > > > 
> > > > Yeah you need code to handle that. My point is that using a notifier is
> > > > the wrong design, because the notifier has it's own locking. Which tends
> > > > to get in the way.  
> > > 
> > > I went into this subject to see how drm_bridge_add() could inform the
> > > interested bridges using a DRM-specific mechanism instead of standard
> > > notifiers.
> > > 
> > > However I think to inform *the interested* bridges, at least in the
> > > device tree case, there is a fundamental issue: DRM core has no idea
> > > about the topology. Definitely not at drm_bridge_add() time, way before
> > > drm_bridge_attach() where the 'previous' pointer introduces a minimum
> > > of topology awareness in the DRM core.  
> > 
> > Yeah we need special functions, which the last fixed bridge needs to call
> > instead of the current set of functions. So instead of of_drm_find_bridge
> > we need something like of_drm_register_hotplug_source_bridge or similar.
> 
> Continuing on the above topic, are you suggesting that there should be
> no hotplug-bridge, and that every bridge that can be used as the "last
> fixed bridge" should handle the hotplug case individually?
> 
> If that is the case, we'd need to modify any bridge driver that people
> want to use as "last fixed bridge" to:
> 
>  1. know they are the "last fixed bridge" (via device tree?)
>  2. use of_drm_register_hotplug_source_bridge()
>     instead of of_drm_find_bridge() accordingly

This depends upon the dt design. If the dt design has a separate distinct
hotplug node, then we could bind a hotplug bridge against that, which is
aware.

But I think for some case (maybe dsi nodes) the dt design would be more an
attribute somewhere plus a link to the first hotplugged element. And in
that case the last physical bridge driver needs to be aware of that - we
simply don't have any dt node we can bind the hotplug bridge driver
against. I think the generic bridge hotplug design should not make an
assumption about how the dt is designed here and allow both.

Also if the dt design for the approach without a separate hotplug
connector is standardized, we can have a of_drm_handle_next_bridge
function which does the right thing for both cases automatically. I think
that way the impact on existing bridge drivers is minimal.

> > > Option 1 is to iterate over all the ports and endpoints and for every
> > > remote-endpoint pointing to a bridge, inform the remote bridge about
> > > that via a new optional callback in drm_bridge_funcs. That means likely
> > > informing more bridges than needed, so when they get informed the
> > > bridges will still have to check whether they are interested or not.
> > > 
> > > Pseudocode:
> > > 
> > >   void drm_bridge_add(struct drm_bridge *new_bridge)
> > >   {
> > >      // existing code unchanged
> > > 
> > > +    if (bridge->of_node) {
> > > +       for_each_remote_endpoint(bridge->of_node) {
> > > +          br = of_drm_find_bridge(remote_endpoint);
> > > +          if (br && br->funcs.bridge_event_notify)
> > > +              br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD,
> > > +                                             new_bridge);
> > > +       }
> > > +    }
> > >   }
> > > 
> > > That means informing both upstream and downstream bridges, which could
> > > even be useful, but anyway there is no reliable way to pick only the
> > > sink or source ports. It also implies having lots of of_*() calls which
> > > iterate over the tree, which is not optimal, but it happens only at
> > > add/removal so it's fine I guess.
> > > 
> > > Option 2 is be to just inform all the bridges (using the global
> > > bridge_list). Pros and cons:
> > > 
> > >  * less of_*() calls to crawl around the remote-endpoints
> > >  * simpler code
> > >  * more bridges than needed would be informed, could be be an issue
> > >    if many implement the .bridge_event_notify()
> > >  * notifies even in the non-OF case too, not sure it's useful
> > > 
> > > What are your thoughts about these two options?  
> > 
> > I'm not sure why you need to inform bridges? Currently for fixed bridges
> > we retry with EPROBE_DEFER if the subsequent bridge isn't there yet, which
> > means we only add the bridge when the entire chain exists. I think
> > hotplugged bridge chains should work the same, which means you only ever
> > need to watch the first element shows up. Then you create the connector
> > for the entire chain and through special callbacks inform the bridge that
> > called of_drm_register_hotplug_source_bridge that it now has a connector.
> > 
> > All the other bridges can be ignored I think, even when they're part of
> > the hotplug chain.
> > 
> > I just realized that means we need at least a refcount on hotpluggable
> > bridges, because otherwise drm_bridge_remove will result in use-after-free
> > issues. So should probably rename those from drm_bridge_add/remove to
> > drm_bridge_register/unregister.
> > 
> > For fixed bridges no one else should ever increment the refcount, so
> > should work exactly the same.
> > 
> > > > Instead I think that code should be directly in core bridge code (I don't
> > > > see the benefit of having this entirely in a separate driver), using drm
> > > > locking to make sure there's no races.  
> > > 
> > > Not sure I got what you mean here. Which one of the following?
> > > 
> > >  1. The entire hotplug-bridge driver should not exist, and the DRM
> > >     core should handle it all (seems not doable, this driver has lots of
> > >     device-specific details)
> > >  2. The hotplug-driver should exist, but the code to attach/detach the
> > >     pipeline on hotplug/unplug should be moved to the core, with the
> > >     hotplug-driver providing callbacks for the device-specific aspects
> > >  3. Same as 2, but additionally the hotplug-bridge should become a
> > >     connector driver (hotplug-connector.c?) -- not sure it can decouple
> > >     the two sides without a bridge however
> > >  4. None of the above  
> > 
> > 3, roughly. The connector creation must be in core bridge code, or things
> > will go boom.
> 
> Based on this I think you mean:
> 
>  1. the hotplug-*something* driver should exist

This part I'm not sure is required, see my comments above. I think it
depends upon how the dt design ultimately will look like, and I don't have
an input on that.

>  2. it should add the fixed connector (DSI in my case) on probe
>  3. it should add/remove the removable connector (LVDS) on hot(un)plug

The new bridge design is that bridges do _not_ create connectors
themselves. Instead the driver does that, using the bridge code as helpers
to make sure things work correctly.

But aside from that I think this sounds good. I'm not sure you need the
connector from step 2, but it shouldn't hurt either. With dp mst we create
that connector because dp can also be driven directly without mst, so
there we need that connector to be able to do modesets from userspace.

>  4. it should add _no_ bridge (in the sense of struct drm_bridge)
>     [not sure it can still decouple the fixed VS addon pipeline parts]

Yeah that's the tricky part, but definitely those hotplugged bridges
should not be part of the currently existing bridge chain, because that
cannot cope with hotplugs.

Cheers, Sima

> 
> Could you please clearly state your position about the above points?
> 
> Best regards,
> Luca
> 
> > If you also want to keep the current lifetime model for bridge (without a
> > refcount, meaning drm_bridge_remove removes the bridge from all use right
> > away) there's also additional locking and tricks you need in in that
> > bridge connector code, including the entire bridge chain. Meaning those
> > hotplugged bridges must not be visible at all to the wider driver.
> > 
> > Or you refcount bridges and make them like driver model struct kobj (or
> > kobj directly), but that's a pile of work too. That would be the other
> > design approach, instead of only relying on drm_connector. We might need
> > both, I haven't dug into the details enough to be sure here.
> > 
> > Cheers, Sima
> > 
> > 
> > > > > On the opposite side, the following bridges are physically removable
> > > > > and so their drivers will have to be fixed (if needed) to work when
> > > > > removal happens, but I don't see how that relates to the DRM core
> > > > > emitting a notification of such bridges being removed.    
> > > > 
> > > > Yeah it's not directly related, just my experience that people assume
> > > > notifiers provide you more synchronization and race-preventation than they
> > > > really do. So it's better to hand-roll to make it all really explicit.
> > > >   
> > > > > > - Related to this: You're not allowed to shut down hardware behind the
> > > > > >   user's back with drm_atomic_helper_shutdown. We've tried that approach
> > > > > >   with dp mst, it really pisses off userspace when a page_flip that it
> > > > > >   expected to work doesn't work.
> > > > > > 
> > > > > > - There's also the design aspect that in atomic, only atomic_check is
> > > > > >   allowed to fail, atomic_commit must succeed, even when the hardware is
> > > > > >   gone. Using connectors and their refcounting should help with that.    
> > > > > 
> > > > > IIUC here you are suggesting again to remove the connector instead of
> > > > > marking it "disconnected". So, as above, pointers on how that is
> > > > > achieved would be helpful.    
> > > > 
> > > > See dp mst code. It's complex unfortunately, so there's some reading
> > > > involved :-/  
> > > > >    
> > > > > > - Somewhat aside, but I noticed that the bridge->atomic_reset is in
> > > > > >   drm_bridge_attach, and that's kinda the wrong place. It should be in
> > > > > >   drm_mode_config_reset, like all the other ->atomic_reset hooks. That
> > > > > >   would make it a lot clearer that we need to figure out who/when    
> > > > > >   ->atomic_reset should be called for hotplugged bridges, maybe as part of      
> > > > > >   connector registration when the entire bridge and it's new connector is
> > > > > >   assembled?
> > > > > > 
> > > > > > - Finally this very much means we need to rethink who/how the connector
> > > > > >   for a bridge is created. The new design is that the main driver creates
> > > > > >   this connector, once the entire bridge exists. But with hotplugging this
> > > > > >   gets a lot more complicated, so we might want to extract a pile of that
> > > > > >   encoder related code from drivers (same way dp mst helpers take care of
> > > > > >   connector creation too, it's just too much of a mess otherwise).
> > > > > > 
> > > > > >   The current bridge chaining infrastructure requires a lot of hand-rolled
> > > > > >   code in each bridge driver and the encoder, so that might be a good
> > > > > >   thing anyway.
> > > > > > 
> > > > > > - Finally I think the entire bridge hotplug infrastructure should be
> > > > > >   irrespective of the underlying bus. Which means for the mipi dsi case we
> > > > > >   might also want to look into what's missing to make mipi dsi
> > > > > >   hotunpluggable, at least for the case where it's a proper driver. I
> > > > > >   think we should ignore the old bridge model where driver's stitched it
> > > > > >   all toghether using the component framework, in my opinion that approach
> > > > > >   should be deprecated.    
> > > > > 
> > > > > The DSI side was one of my headaches on writing this driver, and I
> > > > > must say I dislike the code in hotplug_bridge_dsi_attach(), with the
> > > > > need for an initial "dummy" attach and detach the first time. At first
> > > > > sight I think we need a .update_format callback in struct
> > > > > mipi_dsi_host_ops so the DSI host is aware of a format change.
> > > > > 
> > > > > Right now there are DSI host drivers which keep a copy of the struct
> > > > > mipi_dsi_device pointer and read the format from there when starting a
> > > > > stream (e.g. the tc358768.c driver [1]). That somewhat provides a way
> > > > > to react to format changes, but keeping a pointer is bad when the DSI
> > > > > device hot-unplugs, and the new format won't be seen until a
> > > > > disable/enable cycle. So a new callback looks more robust overall.
> > > > > 
> > > > > Any opinion about this?    
> > > > 
> > > > Yeah I don't like the code either.
> > > > 
> > > > What might help for prototyping is if you start with a hotpluggeable
> > > > bridge where the bridge is a i2c device. That way I think we should be
> > > > able to benefit from the driver bind/unbind code that exists already.
> > > > Although there's going to be issues with i2c hotunplug too in i2c core
> > > > code.
> > > > 
> > > > Then lift whatever we learn there to our dsi code. But essentially I think
> > > > we should model the driver core model a lot more, so I guess you could use
> > > > any hotunplug capable bus as a template. Usb might be closest, since
> > > > that's also a packet/message based interface, mostly at least?
> > > >   
> > > > > > - Finally I think we should have a lot of safety checks, like only bridges
> > > > > >   which declare themselve to be hotunplug safe should be allowed as a part
> > > > > >   of the hotpluggable bridge chain part. All others must still be attached
> > > > > >   before the entire driver is registered with drm_dev_register.    
> > > > > 
> > > > > I'm fine with the principle of a "HOTPLUG" flag.
> > > > > 
> > > > > I wonder how that should be implemented, though. Based on my (surely
> > > > > simplistic) understanding, right now bridges can be both added and
> > > > > removed, but only in a specific sequence:
> > > > > 
> > > > >  1. add all bridges
> > > > >  2. use the card
> > > > >  3. remove all bridges
> > > > >  4. EOF
> > > > > 
> > > > > We'd need to change to allow:
> > > > > 
> > > > >  1. add fixed bridges (including hotplug-bridge)
> > > > >  2. add bridges on removable add-on
> > > > >  3. use card
> > > > >  4. remove bridges on removable add-on
> > > > >  5. optionally goto 2
> > > > >  6. remove fixed bridges (including hotplug-bridge)
> > > > >  7. EOF
> > > > > 
> > > > > One naïve idea is that the DRM core keeps a flag whenever any fixed
> > > > > bridge (no HOTLPUG flag) is removed and when that happens forbid adding
> > > > > bridges as we are now at line 5.    
> > > > 
> > > > If a fixed bridge is removed while the driver is still in use (i.e. before
> > > > drm_dev_unregister is called), that's a driver bug. Would be good to catch
> > > > that, which is why I think a lot of all the bridge hotplug handling should
> > > > be in core bridge code and not the separate hotplug driver, so that we can
> > > > enforce all these constraints.
> > > > 
> > > > Also conceptually 3 can happen before 2 (but also before), and that's how
> > > > dp mst works too. It does add all kinds of complications though ...
> > > >   
> > > > > Aside for tons of subtleties I'm surely missing, does this look a
> > > > > proper approach? I'd not be surprised if there is something better and
> > > > > more solid.    
> > > > 
> > > > Yeah roughly. If you look through dp mst code then that also adds all
> > > > kinds of structures (since dp mst is a routed network really), not just
> > > > the connectors. They also all come with refcounts (because the network is
> > > > a tree), but like I said I think for your case we can avoid the per-bridge
> > > > refcounts by relying on the connector refcount we have already.
> > > > 
> > > > But I might be overlooking something, and we need refcounting for each
> > > > bridge like dp mst also needs refcounting for all its internal structures
> > > > that map the entire hotpluggable display chain. If you want to read some
> > > > dp mst code, these internal structures are ports/branches with struct
> > > > drm_dp_mst_branch/port.
> > > >   
> > > > > >   Or that we only allow bridges with the NO_CONNECTOR flag for
> > > > > >   drm_bridge_attach.
> > > > > > 
> > > > > > There's probably a pile more fundamental issues I've missed, but this
> > > > > > should get a good discussion started.    
> > > > > 
> > > > > Sure, I think it has.
> > > > > 
> > > > > Bottom line, I'm clearly not seeing some issues that need to be
> > > > > considered, and that do not show up for my use case. Based on my
> > > > > limited DRM knowledge, this was expected, and I'm glad to work on those
> > > > > issues with some practical indications about the path forward.    
> > > > 
> > > > Yeah for learning I think dp mst is best. It's a bit complex, but since
> > > > you have a dock you should be able to play around and experiment with the
> > > > code with some real hardware.
> > > > 
> > > > That should help to get a bit a feel for the complexity, since lots of
> > > > opportunities for you to ask why/how locking/refcounting is used and
> > > > against which potential issue they protect.
> > > > 
> > > > Cheers, Sima  
> > > 
> > > Luca
> > > 
> > > -- 
> > > Luca Ceresoli, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com  
> > 
> 
> 
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
