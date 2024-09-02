Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED2968538
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D346210E0C1;
	Mon,  2 Sep 2024 10:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZUU0VbH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78A010E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:50:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so352559666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725274206; x=1725879006; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xr9YCSspbcSij3+b7hb0dq3GP5E8jc6fk1x9iA3r84Q=;
 b=ZUU0VbH7gDgAnzw+X27z0vkm8D6UJhbdThu76/xhCC9P2pzpinmrQ1zQ5066kwe5l2
 PH0Z0isd74V+kvoHoD1QBUkmhb6YA7EaMo1rub+JFTRWYOkkJLI3ItC5/bx7n65OTdX7
 YE1thB/NAbMORkUY07o/byUyjwsb4LjB0/60c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725274206; x=1725879006;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xr9YCSspbcSij3+b7hb0dq3GP5E8jc6fk1x9iA3r84Q=;
 b=iHN7bXsUakn4z4r3NrBU+axA2bDAa859B2khI92t1aGQ9qLbhp7mav6BBbSQjedpJc
 3Yw5lv+s6uRtjzEwTaQie0/KBGHqg43+sbpTJOmQHogbb3TZmrIlIeIBWRWFCEMraU57
 JHZ442M5y2iwGg099bJvpvdVTnqWXYALXn8mXKCZAHSlxAWLpcHZfXAoZUqWqxAM5+yO
 Ml186EGmumf7F4WtB5r0luwVWhe9yM++Ja8Dw1yXy2HCE/e4SU6zX6DBTXkjXpOFGfBu
 3+FrJXzP/SlsrG/7GpIr/YwYfKfDpV5A/2WQy0GXdxcJztAdipDP6AdXeLZTDBgf/yht
 PrrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd0yIE99B9hF75bUh67CMIINvvSHTEDkgn3K8eagOH9aLGqGreLOJV79ZMJdEq4U7RmzpbnIe60P8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCJ4A2tL/oHeWts0yYE7AtJbWcjHBl93K+yJTqcrUt3rn0SEWd
 yVMXyoy2lK3Ox2f9hjgeadR8GA0YFtTOcNCN+BSRuNpGexKf9ZXLPGbmbxr+oTk=
X-Google-Smtp-Source: AGHT+IFVtjO3rxEJoxZ8Ol8wRxyxMhjd5TS0M8YB9xrAr1FFmFAKJqbtjMM+vvz2K07lZkjFS1ZrDA==
X-Received: by 2002:a17:907:1c22:b0:a86:963f:ea8d with SMTP id
 a640c23a62f3a-a89fafad957mr248551066b.64.1725274205682; 
 Mon, 02 Sep 2024 03:50:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196773sm544308066b.109.2024.09.02.03.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:50:05 -0700 (PDT)
Date: Mon, 2 Sep 2024 12:50:02 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <ZtWYWuqhqvdWd0Q7@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240619-dsi-devres-fix-v1-1-a5c59310a52e@ideasonboard.com>
 <20240626-gabby-ladybug-of-freedom-08e6eb@houat>
 <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
 <20240626-warping-nondescript-mustang-bfce27@houat>
 <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
 <20240702-bold-exotic-mamba-fdbba4@houat>
 <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
 <20240725-natural-giga-crane-d54067@houat>
 <4ed3791f-bc5a-46f1-88e1-2441c7f9c8d4@ideasonboard.com>
 <20240902-refined-smooth-mammoth-fbee81@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-refined-smooth-mammoth-fbee81@houat>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Sep 02, 2024 at 11:26:11AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Aug 07, 2024 at 03:19:23PM GMT, Tomi Valkeinen wrote:
> > On 25/07/2024 14:28, Maxime Ripard wrote:
> > > On Mon, Jul 15, 2024 at 11:32:34AM GMT, Tomi Valkeinen wrote:
> > > > On 02/07/2024 14:43, Maxime Ripard wrote:
> > > > > Hi Tomi,
> > > > > 
> > > > > On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
> > > > > > On 26/06/2024 18:07, Maxime Ripard wrote:
> > > > > > > On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
> > > > > > > > On 26/06/2024 11:49, Maxime Ripard wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> > > > > > > > > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > > > > > > 
> > > > > > > > > > When a bridge driver uses devm_mipi_dsi_device_register_full() or
> > > > > > > > > > devm_mipi_dsi_attach(), the resource management is moved to devres,
> > > > > > > > > > which releases the resource automatically when the bridge driver is
> > > > > > > > > > unbound.
> > > > > > > > > > 
> > > > > > > > > > However, if the DSI host goes away first, the host unregistration code
> > > > > > > > > > will automatically detach and unregister any DSI peripherals, without
> > > > > > > > > > notifying the devres about it. So when the bridge driver later is
> > > > > > > > > > unbound, the resources are released a second time, leading to crash.
> > > > > > > > > 
> > > > > > > > > That's super surprising. mipi_dsi_device_unregister calls
> > > > > > > > > device_unregister, which calls device_del, which in turn calls
> > > > > > > > > devres_release_all.
> > > > > > > > 
> > > > > > > > Hmm, right.
> > > > > > > > 
> > > > > > > > > If that doesn't work like that, then it's what needs to be fixed, and
> > > > > > > > > not worked around in the MIPI-DSI bus.
> > > > > > > > 
> > > > > > > > Well, something causes a crash for both the device register/unregister case
> > > > > > > > and the attach/detach case, and the call stacks and debug prints showed a
> > > > > > > > double unregister/detach...
> > > > > > > > 
> > > > > > > > I need to dig up the board and check again why the devres_release_all() in
> > > > > > > > device_del() doesn't solve this. But I can probably only get back to this in
> > > > > > > > August, so it's perhaps best to ignore this patch for now.
> > > > > > > > 
> > > > > > > > However, the attach/detach case is still valid? I see no devres calls in the
> > > > > > > > detach paths.
> > > > > > > 
> > > > > > > I'm not sure what you mean by the attach/detach case. Do you expect
> > > > > > > device resources allocated in attach to be freed when detach run?
> > > > > > 
> > > > > > Ah, never mind, the devres_release_all() would of course deal with that too.
> > > > > > 
> > > > > > However, I just realized/remembered why it crashes.
> > > > > > 
> > > > > > devm_mipi_dsi_device_register_full() and devm_mipi_dsi_attach() are given a
> > > > > > device which is used for the devres. This device is probably always the
> > > > > > bridge device. So when the bridge device goes away, so do those resources.
> > > > > > 
> > > > > > The mipi_dsi_device_unregister() call deals with a DSI device, which was
> > > > > > created in devm_mipi_dsi_device_register_full(). Unregistering that DSI
> > > > > > device, which does happen when the DSI host is removed, does not affect the
> > > > > > devres of the bridge.
> > > > > > 
> > > > > > So, unloading the DSI host driver causes mipi_dsi_device_unregister() and
> > > > > > mipi_dsi_detach() to be called (as part of mipi_dsi_host_unregister()), and
> > > > > > unloading the bridge driver causes them to be called again via devres.
> > > > > 
> > > > > Sorry, that's one of the things I don't quite get. Both functions are
> > > > > exclusively(?) called from I2C bridges, so the device passed there
> > > > > should be a i2c_client instance, and thus the MIPI-DSI host going away
> > > > > will not remove those i2c devices, only the MIPI-DSI ones, right?
> > > > 
> > > > Yes.
> > > > 
> > > > > So if we remove the host, the MIPI-DSI device will be detached and
> > > > > removed through the path you were explaing with the i2c client lingering
> > > > > around. And if we remove the I2C device, then devm will kick in and will
> > > > > detach and remove the MIPI-DSI device.
> > > > 
> > > > Right.
> > > > 
> > > > > Or is it the other way around? That if you remove the host, the device
> > > > > is properly detached and removed, but there's still the devm actions
> > > > > lingering around in the i2c device with pointers to the mipi_dsi_device
> > > > > that was first created, but since destroyed?
> > > > > 
> > > > > And thus, if the i2c device ever goes away, we get a use-after-free?
> > > > 
> > > > Hmm, I'm not sure I understand what you mean here... Aren't you describing
> > > > the same thing in both of these cases?
> > > > 
> > > > In any case, to expand the description a bit, module unloading is quite
> > > > fragile. I do get a crash if I first unload the i2c bridge module, and only
> > > > then go and unload the other ones in the DRM pipeline. But I think module
> > > > unloading will very easily crash, whatever the DRM drivers being used are,
> > > > so it's not related to this particular issue.
> > > > 
> > > > In my view, the unload sequence that should be supported (for development
> > > > purposes, not for production) is to start the unload from the display
> > > > controller module, which tears down the DRM pipeline, and going from there
> > > > towards the panels/connectors.
> > > > 
> > > > Of course, it would be very nice if the module unloading worked perfectly,
> > > > but afaics fixing all that's related to module unloading would be a
> > > > multi-year project... So, I just want to keep the sequence I described above
> > > > working, which allows using modules while doing driver development.
> > > 
> > > FTR, I'm all for supporting module unloading. The discussion above was
> > > about what is broken exactly, so we can come up with a good solution.
> > 
> > Does that mean that you're ok with the patch, or that something should be
> > improved?
> 
> No, I meant that at the very least the commit log needs to be updated to
> reflect what is actually going on, because at least my understanding of
> it doesn't match what actually happens.
> 
> We want a solution to the problem you're facing, but it's not clear to
> me what the problem is exactly at this point, so it's hard to review a
> solution.

So I haven't looked at the full thing, but I think the proper fix is to
make both detach and unregister cope with being called multiple times. I
think devm_ here is a red herring, the underlying issues is that we can
unregister/detach from two sides:

- when the host dsi goes away
- when individual dsi devices on a given host go away

So there needs to be book-keeping and locking to make sure no matter which
order things disappear, we don't try to unregister/detach a dsi device
twice.

Now whether that device model is correct is maybe a different question,
but I think it's entirely orthogonal issue too.

Or maybe I'm just wrong ...

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
