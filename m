Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F26969B14
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7972410E46C;
	Tue,  3 Sep 2024 11:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b5ERbfNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0AA10E414
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:40:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42bbd0a40faso31604625e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725349258; x=1725954058; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMtzG51zKHZoVN1/Pcfak1pmz3Pvr89qQwm3/0Grk8I=;
 b=b5ERbfNdgsjp9r5Yj5W6uTlb9TSYu3bT/N7kpHIGrMQ/St4gLXMm8WEBKVC+NthLqd
 d9IZF2vitP5wPLNEjUedbbaITP2DDcEfEZ+UuM9WztbOR+vvvTQDEsOEHzYDlksrmuer
 gxa9o4kR8XVG1jxh5V87NQgqa77oEHR/Ux7wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349258; x=1725954058;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMtzG51zKHZoVN1/Pcfak1pmz3Pvr89qQwm3/0Grk8I=;
 b=aZB1QcfibEGzoH3ydYgCSFzsCT1QSXh8OyBe+KjnSkI0E8IEOAW8X/q9fCbysEX+kU
 uEZ66UYV0ADS023g0ltlbyWsnXLBeII4kuWhbSTyC3+sTUt+acGnFlKeNyP+JlJeRTsu
 uOmFbH6eUmtQ/XEvALXz9okD86YzaVP5sDk2sV0PlPTnJG7dK2GEVaQ0QpcV4kr33XOj
 1o/NXaoSQOfSj/GNrSD3/nzpVFxN1e4o0Mz04ib8d4OqRcFsHTFWbNVgQB9lRGNogah+
 8MBRXYjUpL+Eufi0XNjGdfkKd4FTxv/3ugwxB7xy7UQXf3F45JzS4weSeXGTU25DfN7Z
 k50Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtCAiauj2MC0MFg3RGV1CaILh45x5GOCW87M7eNioMx99X7ZrNDZ0CrJqmBkjj+Bta6CvGErL576E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBWYx2Ty8JCs4AsgyMCzWnCEBNylPmckWrRnddRicNfn1JzF3N
 kJGtPmJ35ubmJvdRxGh96V5EQnkyllGUQy1kKyZc+GhHSdWHw+VtyHCCb+jQVzE=
X-Google-Smtp-Source: AGHT+IE7lf/PsBeMaHxuA3HCNwLS+x0evb9Y1nn3WfhNWQ14zto+VolcRHJeCo0RU+K3mY0Z6nry5g==
X-Received: by 2002:adf:e84a:0:b0:371:8c61:577c with SMTP id
 ffacd0b85a97d-374ecc8f32cmr1837988f8f.26.1725349257578; 
 Tue, 03 Sep 2024 00:40:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0f41sm160749155e9.19.2024.09.03.00.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 00:40:57 -0700 (PDT)
Date: Tue, 3 Sep 2024 09:40:55 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <Zta9h9QiL_OsV3FO@phenom.ffwll.local>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
 <20240626-warping-nondescript-mustang-bfce27@houat>
 <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
 <20240702-bold-exotic-mamba-fdbba4@houat>
 <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
 <20240725-natural-giga-crane-d54067@houat>
 <4ed3791f-bc5a-46f1-88e1-2441c7f9c8d4@ideasonboard.com>
 <20240902-refined-smooth-mammoth-fbee81@houat>
 <ZtWYWuqhqvdWd0Q7@phenom.ffwll.local>
 <d411e79f-a22e-48e9-b135-5d7a0afa3cf3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d411e79f-a22e-48e9-b135-5d7a0afa3cf3@ideasonboard.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
X-Mailman-Approved-At: Tue, 03 Sep 2024 11:01:31 +0000
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

On Mon, Sep 02, 2024 at 03:31:28PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/09/2024 13:50, Daniel Vetter wrote:
> > On Mon, Sep 02, 2024 at 11:26:11AM +0200, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Wed, Aug 07, 2024 at 03:19:23PM GMT, Tomi Valkeinen wrote:
> > > > On 25/07/2024 14:28, Maxime Ripard wrote:
> > > > > On Mon, Jul 15, 2024 at 11:32:34AM GMT, Tomi Valkeinen wrote:
> > > > > > On 02/07/2024 14:43, Maxime Ripard wrote:
> > > > > > > Hi Tomi,
> > > > > > > 
> > > > > > > On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
> > > > > > > > On 26/06/2024 18:07, Maxime Ripard wrote:
> > > > > > > > > On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
> > > > > > > > > > On 26/06/2024 11:49, Maxime Ripard wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > 
> > > > > > > > > > > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> > > > > > > > > > > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > > > > > > > > 
> > > > > > > > > > > > When a bridge driver uses devm_mipi_dsi_device_register_full() or
> > > > > > > > > > > > devm_mipi_dsi_attach(), the resource management is moved to devres,
> > > > > > > > > > > > which releases the resource automatically when the bridge driver is
> > > > > > > > > > > > unbound.
> > > > > > > > > > > > 
> > > > > > > > > > > > However, if the DSI host goes away first, the host unregistration code
> > > > > > > > > > > > will automatically detach and unregister any DSI peripherals, without
> > > > > > > > > > > > notifying the devres about it. So when the bridge driver later is
> > > > > > > > > > > > unbound, the resources are released a second time, leading to crash.
> > > > > > > > > > > 
> > > > > > > > > > > That's super surprising. mipi_dsi_device_unregister calls
> > > > > > > > > > > device_unregister, which calls device_del, which in turn calls
> > > > > > > > > > > devres_release_all.
> > > > > > > > > > 
> > > > > > > > > > Hmm, right.
> > > > > > > > > > 
> > > > > > > > > > > If that doesn't work like that, then it's what needs to be fixed, and
> > > > > > > > > > > not worked around in the MIPI-DSI bus.
> > > > > > > > > > 
> > > > > > > > > > Well, something causes a crash for both the device register/unregister case
> > > > > > > > > > and the attach/detach case, and the call stacks and debug prints showed a
> > > > > > > > > > double unregister/detach...
> > > > > > > > > > 
> > > > > > > > > > I need to dig up the board and check again why the devres_release_all() in
> > > > > > > > > > device_del() doesn't solve this. But I can probably only get back to this in
> > > > > > > > > > August, so it's perhaps best to ignore this patch for now.
> > > > > > > > > > 
> > > > > > > > > > However, the attach/detach case is still valid? I see no devres calls in the
> > > > > > > > > > detach paths.
> > > > > > > > > 
> > > > > > > > > I'm not sure what you mean by the attach/detach case. Do you expect
> > > > > > > > > device resources allocated in attach to be freed when detach run?
> > > > > > > > 
> > > > > > > > Ah, never mind, the devres_release_all() would of course deal with that too.
> > > > > > > > 
> > > > > > > > However, I just realized/remembered why it crashes.
> > > > > > > > 
> > > > > > > > devm_mipi_dsi_device_register_full() and devm_mipi_dsi_attach() are given a
> > > > > > > > device which is used for the devres. This device is probably always the
> > > > > > > > bridge device. So when the bridge device goes away, so do those resources.
> > > > > > > > 
> > > > > > > > The mipi_dsi_device_unregister() call deals with a DSI device, which was
> > > > > > > > created in devm_mipi_dsi_device_register_full(). Unregistering that DSI
> > > > > > > > device, which does happen when the DSI host is removed, does not affect the
> > > > > > > > devres of the bridge.
> > > > > > > > 
> > > > > > > > So, unloading the DSI host driver causes mipi_dsi_device_unregister() and
> > > > > > > > mipi_dsi_detach() to be called (as part of mipi_dsi_host_unregister()), and
> > > > > > > > unloading the bridge driver causes them to be called again via devres.
> > > > > > > 
> > > > > > > Sorry, that's one of the things I don't quite get. Both functions are
> > > > > > > exclusively(?) called from I2C bridges, so the device passed there
> > > > > > > should be a i2c_client instance, and thus the MIPI-DSI host going away
> > > > > > > will not remove those i2c devices, only the MIPI-DSI ones, right?
> > > > > > 
> > > > > > Yes.
> > > > > > 
> > > > > > > So if we remove the host, the MIPI-DSI device will be detached and
> > > > > > > removed through the path you were explaing with the i2c client lingering
> > > > > > > around. And if we remove the I2C device, then devm will kick in and will
> > > > > > > detach and remove the MIPI-DSI device.
> > > > > > 
> > > > > > Right.
> > > > > > 
> > > > > > > Or is it the other way around? That if you remove the host, the device
> > > > > > > is properly detached and removed, but there's still the devm actions
> > > > > > > lingering around in the i2c device with pointers to the mipi_dsi_device
> > > > > > > that was first created, but since destroyed?
> > > > > > > 
> > > > > > > And thus, if the i2c device ever goes away, we get a use-after-free?
> > > > > > 
> > > > > > Hmm, I'm not sure I understand what you mean here... Aren't you describing
> > > > > > the same thing in both of these cases?
> > > > > > 
> > > > > > In any case, to expand the description a bit, module unloading is quite
> > > > > > fragile. I do get a crash if I first unload the i2c bridge module, and only
> > > > > > then go and unload the other ones in the DRM pipeline. But I think module
> > > > > > unloading will very easily crash, whatever the DRM drivers being used are,
> > > > > > so it's not related to this particular issue.
> > > > > > 
> > > > > > In my view, the unload sequence that should be supported (for development
> > > > > > purposes, not for production) is to start the unload from the display
> > > > > > controller module, which tears down the DRM pipeline, and going from there
> > > > > > towards the panels/connectors.
> > > > > > 
> > > > > > Of course, it would be very nice if the module unloading worked perfectly,
> > > > > > but afaics fixing all that's related to module unloading would be a
> > > > > > multi-year project... So, I just want to keep the sequence I described above
> > > > > > working, which allows using modules while doing driver development.
> > > > > 
> > > > > FTR, I'm all for supporting module unloading. The discussion above was
> > > > > about what is broken exactly, so we can come up with a good solution.
> > > > 
> > > > Does that mean that you're ok with the patch, or that something should be
> > > > improved?
> > > 
> > > No, I meant that at the very least the commit log needs to be updated to
> > > reflect what is actually going on, because at least my understanding of
> > > it doesn't match what actually happens.
> > > 
> > > We want a solution to the problem you're facing, but it's not clear to
> > > me what the problem is exactly at this point, so it's hard to review a
> > > solution.
> > 
> > So I haven't looked at the full thing, but I think the proper fix is to
> > make both detach and unregister cope with being called multiple times. I
> > think devm_ here is a red herring, the underlying issues is that we can
> > unregister/detach from two sides:
> > 
> > - when the host dsi goes away
> > - when individual dsi devices on a given host go away
> > 
> > So there needs to be book-keeping and locking to make sure no matter which
> > order things disappear, we don't try to unregister/detach a dsi device
> > twice.
> 
> I think that is what my patch does (for devm_).

Yep, except I think you should just do it for everyone, not just for the
special case where one of the calls is done through devm.

> Some vocabulary first:
> 
> dsi peripheral device - The device that represents the DSI peripheral. It is
> a bridge or a panel, and (usually) an i2c or platform device.
> 
> dsi peripheral driver - The driver handling the dsi peripheral device.
> 
> dsi device - Runtime created device instance that represents the DSI
> peripheral. So in my case we have the i2c bridge device, and a dsi device is
> created for it in the setup code.
> 
> dsi controller device - A device that has a DSI bus (usually a platform or
> i2c device, I would guess).
> 
> dsi controller driver - A driver for the dsi controller device. Creates the
> dsi host.
> 
> dsi host - represents the DSI host side, owned by the dsi controller driver.
> 
> When a dsi peripheral driver uses devm_mipi_dsi_device_register_full() or
> devm_mipi_dsi_attach(), the dsi device is created and attached to the dsi
> host. When the dsi peripheral device-driver is unbound, devres will call
> unregister and detach are called automatically. This works fine.
> 
> But when the device-driver for the dsi controller is unbound, the dsi
> controller driver will unregister the dsi host, and the unregistration will
> also unregister and detach the dsi device. But the devres is not told about
> that. So when the dsi peripheral is later unbound, its devres will again
> unregister and detach.
> 
> To fix that this patch uses devm_remove_action() to remove the devres action
> when the host side goes away first.
> 
> Now, after writing the above, I realized that all this won't help with the
> non-devm versions: the host side has unregistered and detached the dsi
> device, but if the dsi peripheral driver calls mipi_dsi_detach() or
> mipi_dsi_device_unregister(), it will again crash.
> 
> Handling the attach/detach should be quite easy, and in fact the code
> already handles it, but it uses WARN_ON() there so that has to go. But
> attach/detach will crash anyway if the dsi device has already been freed,
> which happens when the dsi controller driver calls
> mipi_dsi_device_unregister().

Hm I thought we have a full struct device, so refcounted, and also with
struct device unregister should be separate from the final kfree when the
last reference drops away. Hence I thought this should just work.

We might need to grab a reference in attach/detach to sort this out?

> So... The dsi peripheral driver should keep a reference to the dsi device,
> with get_device()? And then do a put_device() after calling
> mipi_dsi_device_unregister()?

Yeah I think so.

> But we don't free the dsi device, it has essentially been disabled without
> telling the dsi peripheral driver about it, which might cause problems.
> 
> I don't know... This doesn't sound correct to me. Probably my patch is just
> new wrong on top of old wrong. Or maybe I don't quite grasp how this works.

_unregister calls ->detach, so I think we're fine. Essentially what we're
doing here is hand-rolling a device/driver bind model, instead of using
the one from the core driver model. But all the pieces are there:

- register/unregister: Adding/removing a device, after unregister the
  physical device cannot be accessed anymore (the host driver might be
  gone), but the struct device will stick around.

- attach/detach: binding/unbinding a driver to a dsi peripheral

> Oh, I now realized/remembered that we can also have "real" dsi devices, when
> the dsi peripheral is a child of the dsi bus device, and controlled via DSI
> commands (i.e. not via i2c or memory mapped registers). Perhaps all/some of
> this confusion in the code comes from the use of dsi device for both "real"
> dsi devices and as a "dsi client", created by i2c/platform devices.

I think for more complicated topology device links should help. Of course
the dev links will not know about our hand-rolled driver binding, so maybe
we need to fix that to make it work perfectly. But I don't think that's
the case here.

> With a "real" dsi device things work fine, as the driver only attaches and
> detaches, and the device (un)registration is handled by the dsi host.
> 
> Well, this turned out to be a bit of a rambling email... I don't have a
> clear solution in mind.

I think aside from maybe a missing device_get/put for attach/detach we
have all the pieces, and it just needs a little bit of polish? We're
almost 90% at a clean device driver model implementation, adding the last
few bits is I think all we need?

Or is there a catch?

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
