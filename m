Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5D969B52
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB8910E481;
	Tue,  3 Sep 2024 11:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LIaRof0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9810E481
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:14:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso1099443f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725362094; x=1725966894; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cdCqagRRve1pn7bDH687tOJrmKhVSUgMhrDqEyO6mmM=;
 b=LIaRof0LkwsTNwdH+Hxb7hiXthPJR4PejL2JjDvUscKSZVyXRJV3PIgC8cOEsvAnVa
 CnGg6f7fLAzuJiu5eqsOb9mNtPVrry3dqaeqB4lOtVY6r0kt+yiyQI9WMZ7UTOl0qeE8
 kVipCkYmw/INRULClo/Im+lInx0JUbLZzyl1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362094; x=1725966894;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cdCqagRRve1pn7bDH687tOJrmKhVSUgMhrDqEyO6mmM=;
 b=UYdcrKj7vCkQ5yUr3lPunP2ruHgeWJ8DHws9iqt+MNVA193tjsjn5LP+h1ht0DadaX
 oWwGna/PkjYB3OwKpWQACY9z0UEjKSLiv8pTkksGkhC7ChtQJ7MPmX1ez1+FpkclhjCx
 3Idez4ED8nelvIQ7mJ+TrkcW1OCfj97mOXVHRT8kNs5Kkoiyy/1DRXka/FTMYO8qvVC8
 J09FzgEev85NXz5jROyeIhfiWfQVGFm+cTkVxetX6FFJ5oUkSDZcVKjpBj1TyrCtJwhc
 Pg2ylV6iONHlO2RfXJZwBzzcf9SXF9GZ+p532XvIZRzCpoiQeWbC8fdvrzgaCWUo5vB5
 nLiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+lVrQhhBRUtrVZumbY67te9vtcqYf4m7RyfhGxR0qBKbapFAqFHU+b4LtbtPn4QeMQ3TUrBkCTH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVC2iO+wVQp7v3UWwRKZECUtydLti1kiK7Y3BuyAgc+EpO3z5j
 S5zW2PY/o3IPJpRwBLwgQat0rR2Op4dyx6iKKOAo4pgJvr2xD6+BwybN75KXDDI=
X-Google-Smtp-Source: AGHT+IGXnh9eICRCDvm5xsPyEv1JHnkDfOBah/OfSMsZXxsdMT44GKcTawk+mOXQ026wjP0B4u4S6A==
X-Received: by 2002:a05:6000:210e:b0:374:cf83:23dd with SMTP id
 ffacd0b85a97d-374cf83267cmr3361725f8f.2.1725362094035; 
 Tue, 03 Sep 2024 04:14:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b67ff88dsm11019597f8f.26.2024.09.03.04.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:14:53 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:14:51 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <Ztbvq8XI9HOfRZfn@phenom.ffwll.local>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
 <20240702-bold-exotic-mamba-fdbba4@houat>
 <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
 <20240725-natural-giga-crane-d54067@houat>
 <4ed3791f-bc5a-46f1-88e1-2441c7f9c8d4@ideasonboard.com>
 <20240902-refined-smooth-mammoth-fbee81@houat>
 <ZtWYWuqhqvdWd0Q7@phenom.ffwll.local>
 <d411e79f-a22e-48e9-b135-5d7a0afa3cf3@ideasonboard.com>
 <Zta9h9QiL_OsV3FO@phenom.ffwll.local>
 <d58f5dad-3f60-424f-bed4-460e2ac4b022@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d58f5dad-3f60-424f-bed4-460e2ac4b022@ideasonboard.com>
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

On Tue, Sep 03, 2024 at 11:27:23AM +0300, Tomi Valkeinen wrote:
> On 03/09/2024 10:40, Simona Vetter wrote:
> > On Mon, Sep 02, 2024 at 03:31:28PM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 02/09/2024 13:50, Daniel Vetter wrote:
> > > > On Mon, Sep 02, 2024 at 11:26:11AM +0200, Maxime Ripard wrote:
> > > > > Hi,
> > > > > 
> > > > > On Wed, Aug 07, 2024 at 03:19:23PM GMT, Tomi Valkeinen wrote:
> > > > > > On 25/07/2024 14:28, Maxime Ripard wrote:
> > > > > > > On Mon, Jul 15, 2024 at 11:32:34AM GMT, Tomi Valkeinen wrote:
> > > > > > > > On 02/07/2024 14:43, Maxime Ripard wrote:
> > > > > > > > > Hi Tomi,
> > > > > > > > > 
> > > > > > > > > On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
> > > > > > > > > > On 26/06/2024 18:07, Maxime Ripard wrote:
> > > > > > > > > > > On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
> > > > > > > > > > > > On 26/06/2024 11:49, Maxime Ripard wrote:
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> > > > > > > > > > > > > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > When a bridge driver uses devm_mipi_dsi_device_register_full() or
> > > > > > > > > > > > > > devm_mipi_dsi_attach(), the resource management is moved to devres,
> > > > > > > > > > > > > > which releases the resource automatically when the bridge driver is
> > > > > > > > > > > > > > unbound.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > However, if the DSI host goes away first, the host unregistration code
> > > > > > > > > > > > > > will automatically detach and unregister any DSI peripherals, without
> > > > > > > > > > > > > > notifying the devres about it. So when the bridge driver later is
> > > > > > > > > > > > > > unbound, the resources are released a second time, leading to crash.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > That's super surprising. mipi_dsi_device_unregister calls
> > > > > > > > > > > > > device_unregister, which calls device_del, which in turn calls
> > > > > > > > > > > > > devres_release_all.
> > > > > > > > > > > > 
> > > > > > > > > > > > Hmm, right.
> > > > > > > > > > > > 
> > > > > > > > > > > > > If that doesn't work like that, then it's what needs to be fixed, and
> > > > > > > > > > > > > not worked around in the MIPI-DSI bus.
> > > > > > > > > > > > 
> > > > > > > > > > > > Well, something causes a crash for both the device register/unregister case
> > > > > > > > > > > > and the attach/detach case, and the call stacks and debug prints showed a
> > > > > > > > > > > > double unregister/detach...
> > > > > > > > > > > > 
> > > > > > > > > > > > I need to dig up the board and check again why the devres_release_all() in
> > > > > > > > > > > > device_del() doesn't solve this. But I can probably only get back to this in
> > > > > > > > > > > > August, so it's perhaps best to ignore this patch for now.
> > > > > > > > > > > > 
> > > > > > > > > > > > However, the attach/detach case is still valid? I see no devres calls in the
> > > > > > > > > > > > detach paths.
> > > > > > > > > > > 
> > > > > > > > > > > I'm not sure what you mean by the attach/detach case. Do you expect
> > > > > > > > > > > device resources allocated in attach to be freed when detach run?
> > > > > > > > > > 
> > > > > > > > > > Ah, never mind, the devres_release_all() would of course deal with that too.
> > > > > > > > > > 
> > > > > > > > > > However, I just realized/remembered why it crashes.
> > > > > > > > > > 
> > > > > > > > > > devm_mipi_dsi_device_register_full() and devm_mipi_dsi_attach() are given a
> > > > > > > > > > device which is used for the devres. This device is probably always the
> > > > > > > > > > bridge device. So when the bridge device goes away, so do those resources.
> > > > > > > > > > 
> > > > > > > > > > The mipi_dsi_device_unregister() call deals with a DSI device, which was
> > > > > > > > > > created in devm_mipi_dsi_device_register_full(). Unregistering that DSI
> > > > > > > > > > device, which does happen when the DSI host is removed, does not affect the
> > > > > > > > > > devres of the bridge.
> > > > > > > > > > 
> > > > > > > > > > So, unloading the DSI host driver causes mipi_dsi_device_unregister() and
> > > > > > > > > > mipi_dsi_detach() to be called (as part of mipi_dsi_host_unregister()), and
> > > > > > > > > > unloading the bridge driver causes them to be called again via devres.
> > > > > > > > > 
> > > > > > > > > Sorry, that's one of the things I don't quite get. Both functions are
> > > > > > > > > exclusively(?) called from I2C bridges, so the device passed there
> > > > > > > > > should be a i2c_client instance, and thus the MIPI-DSI host going away
> > > > > > > > > will not remove those i2c devices, only the MIPI-DSI ones, right?
> > > > > > > > 
> > > > > > > > Yes.
> > > > > > > > 
> > > > > > > > > So if we remove the host, the MIPI-DSI device will be detached and
> > > > > > > > > removed through the path you were explaing with the i2c client lingering
> > > > > > > > > around. And if we remove the I2C device, then devm will kick in and will
> > > > > > > > > detach and remove the MIPI-DSI device.
> > > > > > > > 
> > > > > > > > Right.
> > > > > > > > 
> > > > > > > > > Or is it the other way around? That if you remove the host, the device
> > > > > > > > > is properly detached and removed, but there's still the devm actions
> > > > > > > > > lingering around in the i2c device with pointers to the mipi_dsi_device
> > > > > > > > > that was first created, but since destroyed?
> > > > > > > > > 
> > > > > > > > > And thus, if the i2c device ever goes away, we get a use-after-free?
> > > > > > > > 
> > > > > > > > Hmm, I'm not sure I understand what you mean here... Aren't you describing
> > > > > > > > the same thing in both of these cases?
> > > > > > > > 
> > > > > > > > In any case, to expand the description a bit, module unloading is quite
> > > > > > > > fragile. I do get a crash if I first unload the i2c bridge module, and only
> > > > > > > > then go and unload the other ones in the DRM pipeline. But I think module
> > > > > > > > unloading will very easily crash, whatever the DRM drivers being used are,
> > > > > > > > so it's not related to this particular issue.
> > > > > > > > 
> > > > > > > > In my view, the unload sequence that should be supported (for development
> > > > > > > > purposes, not for production) is to start the unload from the display
> > > > > > > > controller module, which tears down the DRM pipeline, and going from there
> > > > > > > > towards the panels/connectors.
> > > > > > > > 
> > > > > > > > Of course, it would be very nice if the module unloading worked perfectly,
> > > > > > > > but afaics fixing all that's related to module unloading would be a
> > > > > > > > multi-year project... So, I just want to keep the sequence I described above
> > > > > > > > working, which allows using modules while doing driver development.
> > > > > > > 
> > > > > > > FTR, I'm all for supporting module unloading. The discussion above was
> > > > > > > about what is broken exactly, so we can come up with a good solution.
> > > > > > 
> > > > > > Does that mean that you're ok with the patch, or that something should be
> > > > > > improved?
> > > > > 
> > > > > No, I meant that at the very least the commit log needs to be updated to
> > > > > reflect what is actually going on, because at least my understanding of
> > > > > it doesn't match what actually happens.
> > > > > 
> > > > > We want a solution to the problem you're facing, but it's not clear to
> > > > > me what the problem is exactly at this point, so it's hard to review a
> > > > > solution.
> > > > 
> > > > So I haven't looked at the full thing, but I think the proper fix is to
> > > > make both detach and unregister cope with being called multiple times. I
> > > > think devm_ here is a red herring, the underlying issues is that we can
> > > > unregister/detach from two sides:
> > > > 
> > > > - when the host dsi goes away
> > > > - when individual dsi devices on a given host go away
> > > > 
> > > > So there needs to be book-keeping and locking to make sure no matter which
> > > > order things disappear, we don't try to unregister/detach a dsi device
> > > > twice.
> > > 
> > > I think that is what my patch does (for devm_).
> > 
> > Yep, except I think you should just do it for everyone, not just for the
> > special case where one of the calls is done through devm.
> > 
> > > Some vocabulary first:
> > > 
> > > dsi peripheral device - The device that represents the DSI peripheral. It is
> > > a bridge or a panel, and (usually) an i2c or platform device.
> > > 
> > > dsi peripheral driver - The driver handling the dsi peripheral device.
> > > 
> > > dsi device - Runtime created device instance that represents the DSI
> > > peripheral. So in my case we have the i2c bridge device, and a dsi device is
> > > created for it in the setup code.
> > > 
> > > dsi controller device - A device that has a DSI bus (usually a platform or
> > > i2c device, I would guess).
> > > 
> > > dsi controller driver - A driver for the dsi controller device. Creates the
> > > dsi host.
> > > 
> > > dsi host - represents the DSI host side, owned by the dsi controller driver.
> > > 
> > > When a dsi peripheral driver uses devm_mipi_dsi_device_register_full() or
> > > devm_mipi_dsi_attach(), the dsi device is created and attached to the dsi
> > > host. When the dsi peripheral device-driver is unbound, devres will call
> > > unregister and detach are called automatically. This works fine.
> > > 
> > > But when the device-driver for the dsi controller is unbound, the dsi
> > > controller driver will unregister the dsi host, and the unregistration will
> > > also unregister and detach the dsi device. But the devres is not told about
> > > that. So when the dsi peripheral is later unbound, its devres will again
> > > unregister and detach.
> > > 
> > > To fix that this patch uses devm_remove_action() to remove the devres action
> > > when the host side goes away first.
> > > 
> > > Now, after writing the above, I realized that all this won't help with the
> > > non-devm versions: the host side has unregistered and detached the dsi
> > > device, but if the dsi peripheral driver calls mipi_dsi_detach() or
> > > mipi_dsi_device_unregister(), it will again crash.
> > > 
> > > Handling the attach/detach should be quite easy, and in fact the code
> > > already handles it, but it uses WARN_ON() there so that has to go. But
> > > attach/detach will crash anyway if the dsi device has already been freed,
> > > which happens when the dsi controller driver calls
> > > mipi_dsi_device_unregister().
> > 
> > Hm I thought we have a full struct device, so refcounted, and also with
> > struct device unregister should be separate from the final kfree when the
> > last reference drops away. Hence I thought this should just work.
> > 
> > We might need to grab a reference in attach/detach to sort this out?
> 
> I think there's a bit more to it. A non-dsi-device bridge driver would do:
> 
> (devm_)mipi_dsi_device_register_full()
> ...
> (devm_)mipi_dsi_attach()
> 
> The DSI host side could unregister and free the dsi_device right after the
> call to mipi_dsi_device_register_full(), and mipi_dsi_attach() would
> probably just crash.
> 
> If I understand this correctly, the main issue is that the bridge driver
> doesn't own an exclusive reference to the dsi_device, even if it looks like
> it does, but rather both the dsi host and the bridge driver share the same
> reference. So, we could get an extra reference, so that each side has its
> own.
> 
> But I think there's more. The bridge driver will call
> mipi_dsi_device_unregister() (manually or via devres), and that does
> device_unregister(). However, the dsi host will also call
> mipi_dsi_device_unregister() when tearing down, which would result in
> another device_unregister().
> 
> The above is not a problem if the bridge does away first, as then the dsi
> bus won't contain the dsi_device anymore, and the dsi host will not
> unregister it. But if it's the other way around, the dsi host will do
> device_unregister, and later the bridge will do it too as it thinks it owns
> the dsi_device.
> 
> I presume that can be solved by tracking whether we have unregistered the
> dsi_device or not. However, what would happen if the bridge driver calls any
> of the other mipi_dsi_* functions with the dsi_device that has already been
> unregistered by the dsi host? Nothing good, probably. So all those functions
> should start to fail graciously when the dsi_device has been unregistered.
> Or the bridge driver should somehow get a notification about the
> unregistration so that it knows not to call those functions.

Ah yeah I got confused, I thought attach/detach was for the dsi_device,
not the dsi_host. But it's all ok, because mipi_dsi_driver is a full-blown
driver, so if we unregister the device all the drivers will be unbound,
which means they should first detach and stop using the mipi_dsi_device.
If they continue to do that, they're busted.

Where things fall apart is for the non-dsi drivers which call
mipi_dsi_attach directly, after having called
mipi_dsi_device_register_full, bypassing the driver model. Those just blow
up, and I don't think you can fix that without using the driver model
properly.

With that you should have all the pieces:

- No matter who calls unregister, the driver gets unbound and can clean up
  the mess. After the unregister call there should be nothing attached
  anymore, so we can make that a WARN_ON.

- mipi_dsi_device_register_full needs to be changed to not transfer the
  reference, meaning using device_register instead of device_add. This way
  the non-dsi drivers retain a reference of their own.

- the non-dsi driver in it's non-dsi remove hook needs to call
  mipi_dsi_unregister and then mipi_dsi_put (which is just a device_put).

- we need some locking around mipi_dsi_unregister to make sure it's not
  called twice and cannot race between a non-dsi driver and a bridge
  driver.

> I have to say I feel a bit uncertain about the whole ownership model here.

Yeah I misunderstood a few things too, but I think now it's clearer for
me. Essentially unless you have a guarantee that both the host and
dsi-device will be removed in the same order always (by both being
instantiated from one probe hook like with pci drivers) you have to use a
full dsi_driver even for non-dsi cases. Otherwise you won't get the
->remove hook and things will blow up.

Also the manual call to mipi_dsi_detach in mipi_dsi_remove_device_fn is a
bug and should be replaced by a WARN_ON(dsi->attached) after we've called
mipi_dsi_device_unregister:

- For the case of a native driver we've called that driver's ->remove hook
  as part of unregister, which should have called mipi_dsi_detach. If it
  didn't, it's a bug in that drivers ->remove hook

  Aside: we should have a devm_mipi_dsi_attach to make this easier, which
  also checks that you only call this on a mipi_dsi_device and nothing
  else (because anything else is a bug).

- for the case of a non-dsi driver that also registers the host (the only
  case which does not result in lifetime bugs on removal) that non-dsi
  driver's remove function should make sure it's nuking everything in the
  right order. So first explicit dsi_device unregister, then explicit
  dsi_host_unregister. Otherwise it will at least look buggy.

It's a bit of work, but I think this should be solid and we should be able
to get there in fairly small steps.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
