Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6279A27A98
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C669E10E6F6;
	Tue,  4 Feb 2025 18:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LONWoFqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE16C10E6EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 18:52:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D809442E2;
 Tue,  4 Feb 2025 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738695163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmkV0M5tSaBkfkdW5TH/VkRVdrbjyw8oYC6hyHccU6Q=;
 b=LONWoFqq8exCDRqfbXLlfaNWFe3Y5fbtzXoZOOetmeJjB+K+iRa3KW3HcCRNbysg0m72KP
 OS4juv0oHk0Z2GydTsf4i5Vk5WD1vXrJeHs37Vh0TNIxS7TBX7SDgZOf9e5mQnedJoIuoU
 Buoi6IK7yZqVcaSxUakvyghzgWkarR84SUk1qiGYpuO8+d4kNOUVwbpzpYremK2fenJrbH
 143AsT81Q1CZk1rOmZzQP8h335YDldKrxNnHyk4zsvg8iQ9DoH1NGGsmB4B3HKJM543Anf
 zdSPh69ndZjGhBRp3xQT9ZMxg/Qo+9tDIHIvaodxM7x0gODmSK9sS5n2OxVGgw==
Date: Tue, 4 Feb 2025 19:52:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut
 <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Chauvet
 <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250204195240.005603b7@bootlin.com>
In-Reply-To: <20250204-crouching-alligator-of-success-ab52f8@houat>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <20250108101907.410456-4-herve.codina@bootlin.com>
 <20250114-juicy-authentic-mushroom-cfcdfb@houat>
 <20250114135456.5366eb2a@bootlin.com>
 <20250116-archetypal-bulldog-of-expression-fcc937@houat>
 <20250117091213.647bf0e6@bootlin.com>
 <20250204-chocolate-lionfish-of-luck-10ebb8@houat>
 <20250204163404.0a6b6526@bootlin.com>
 <20250204-crouching-alligator-of-success-ab52f8@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetieeutefffffffeevgefgudejvdeggfefudefueektdehjeegtefgtddvgfegtdenucffohhmrghinheptghrthgtrdihohhupdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhnghesl
 hhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
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

On Tue, 4 Feb 2025 18:11:01 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Tue, Feb 04, 2025 at 04:34:04PM +0100, Herve Codina wrote:
> > On Tue, 4 Feb 2025 16:17:10 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Fri, Jan 17, 2025 at 09:12:13AM +0100, Herve Codina wrote:  
> > > > Hi Maxime,
> > > > 
> > > > On Thu, 16 Jan 2025 09:38:45 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >     
> > > > > On Tue, Jan 14, 2025 at 01:54:56PM +0100, Herve Codina wrote:    
> > > > > > Hi Maxime,
> > > > > > 
> > > > > > On Tue, 14 Jan 2025 08:40:51 +0100
> > > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > 
> > > > > > ...
> > > > > >       
> > > > > > > >  
> > > > > > > > +static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
> > > > > > > > +{
> > > > > > > > +	struct drm_atomic_state *state = ERR_PTR(-EINVAL);
> > > > > > > > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > > > > > > > +	struct drm_connector_state *connector_state;
> > > > > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > > > > +	struct drm_connector *connector;
> > > > > > > > +	int err;
> > > > > > > > +
> > > > > > > > +	/*
> > > > > > > > +	 * Reset active outputs of the related CRTC.
> > > > > > > > +	 *
> > > > > > > > +	 * This way, drm core will reconfigure each components in the CRTC
> > > > > > > > +	 * outputs path. In our case, this will force the previous component to
> > > > > > > > +	 * go back in LP11 mode and so allow the reconfiguration of SN64DSI83
> > > > > > > > +	 * bridge.
> > > > > > > > +	 *
> > > > > > > > +	 * Keep the lock during the whole operation to be atomic.
> > > > > > > > +	 */
> > > > > > > > +
> > > > > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > > > > +
> > > > > > > > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > > > > +	if (IS_ERR(state)) {
> > > > > > > > +		err = PTR_ERR(state);
> > > > > > > > +		goto unlock;
> > > > > > > > +	}        
> > > > > > > 
> > > > > > > No, you must not allocate a new state for this, you need to reuse the
> > > > > > > existing state. You'll find it in bridge->base.state->state.      
> > > > > > 
> > > > > > Thanks for pointing that. I didn't know about bridge->base.state->state.
> > > > > > 
> > > > > > I will use that if using the state is still relevant (see next comment).
> > > > > >       
> > > > > > >       
> > > > > > > > +	state->acquire_ctx = &ctx;
> > > > > > > > +
> > > > > > > > +	connector = drm_atomic_get_old_connector_for_encoder(state,
> > > > > > > > +							     sn65dsi83->bridge.encoder);
> > > > > > > > +	if (!connector) {
> > > > > > > > +		err = -EINVAL;
> > > > > > > > +		goto unlock;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	connector_state = drm_atomic_get_connector_state(state, connector);
> > > > > > > > +	if (IS_ERR(connector_state)) {
> > > > > > > > +		err = PTR_ERR(connector_state);
> > > > > > > > +		goto unlock;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	err = drm_atomic_helper_reset_pipe(connector_state->crtc, &ctx);
> > > > > > > > +	if (err < 0)
> > > > > > > > +		goto unlock;        
> > > > > > > 
> > > > > > > And you'll find the crtc in bridge->encoder->crtc.      
> > > > > > 
> > > > > > I am a bit confused. I looked at the drm_encoder structure [1] and the crtc
> > > > > > field available in this structure should not be used by atomic drivers. They
> > > > > > should rely on &drm_connector_state.crtc.      
> > > > > 
> > > > > You're right, it's deprecated but used by most bridges anyway.
> > > > > 
> > > > > I made a series of changes after reviewing your series to address some
> > > > > issues with the current bridge API, most notably
> > > > > 
> > > > > https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org/    
> > > > 
> > > > Thanks for pointing that, indeed, it clarify many things!
> > > >     
> > > > >     
> > > > > > In my case, I have the feeling that I should get the ctrc from the current
> > > > > > state (i.e. bridge->base.state->state) using the sequence provided in this
> > > > > > current patch:
> > > > > >   Retrieve the connector with drm_atomic_get_old_connector_for_encoder()      
> > > > > 
> > > > > Retrieving the old connector makes no sense though. It's the connector
> > > > > that was formerly associated with your encoder. It might work, it might
> > > > > not, it's not what you're looking for.
> > > > >     
> > > > > >   Retrieve the connector state with drm_atomic_get_connector_state()      
> > > > > 
> > > > > drm_atomic_get_connector_state will allocate and pull the connector
> > > > > state into the drm_atomic_state, even if it wasn't part of it before, so
> > > > > it's not great. And you don't need it in the first place, you only need
> > > > > the current active CRTC.    
> > > > 
> > > > Yes, I agree with that, I only need the active CRTC.
> > > > 
> > > > I tried to get the current atomic_state from:
> > > >   1) bridge->base.state->state
> > > >   2) drm_bridge_state->base.state
> > > > 
> > > > In both cases, it is NULL. Looking at Sima's reply in your series
> > > > explained that:
> > > >   https://lore.kernel.org/dri-devel/Z4juJy7kKPbI2BDb@phenom.ffwll.local/
> > > > 
> > > > If I understood correctly those pointers are explicitly cleared.
> > > > 
> > > > So, with all of that, either:
> > > >   a) I wait for your series to be applied in order to use your the crtc field from
> > > >      drm_bridge_state added by:
> > > >        https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org/#t
> > > >   b) I use the old school bridge->encoder->crtc for the moment
> > > > 
> > > > Do you mind if I use the bridge->encoder->crtc way for the next iteration of
> > > > my series?    
> > > 
> > > Yeah, it makes sense.  
> > 
> > I already send a wrong v4 (sorry) and a correct v5 with modifications in
> > this way :)
> >   
> > > 
> > > Still, it would be great if you could test my series on your setup and see if it helps :)  
> > 
> > Of course, I can test updated version of your series.
> > 
> > I already try to get the current atomic_state exactly the same way as you do
> > in your series and the pointer is NULL in my case.  
> 
> I sent a second version today, let me know if it works.
> 

Tried your v2 series and...:
   # modetest -s 39:1920x1080
   trying to open device 'i915'...failed
   ...
   trying to open device 'imx-lcdif'...done
   [   28.310476] ------------[ cut here ]------------
   [   28.310494] WARNING: CPU: 3 PID: 449 at drivers/gpu/drm/drm_bridge.c:943 drm_atomic_bridge_chain_check+0x24c/0x310 [drm]
setting mode 1920x1080-60.00Hz on[   28.326058] Modules linked in: fsl_ldb imx8mp_interconnect imx_interconnect imx_cpufreq_dt imx8mm_thermal lm75 tmp103 rtc_snvs leds_pca963x snvs_pwrkey rtc_rs5c372 pwm_imx27 st_pressure_spi st_sensors_spi regmap_spi gpio_charger st_pressure_i2c st_pressure st_sensors_i2c industrialio_triggered_buffer kfifo_buf st_sensors led_bl panel_simple opt3001 iio_hwmon governor_userspace imx_bus imx8mp_hdmi_tx dw_hdmi dwmac_imx stmmac_platform stmmac pcs_xpcs phylink samsung_dsim imx_sdma imx_lcdif drm_dma_helper imx8mp_hdmi_pvi fsl_imx8_ddr_perf exc3000 caam ti_sn65dsi83 error hotplug_bridge pwm_bl drm_display_helper drm_kms_helper drm drm_panel_orientation_quirks backlight gehc_sunh_connector ltc2497 ltc2497_core
   [   28.391264] CPU: 3 UID: 0 PID: 449 Comm: modetest Not tainted 6.14.0-rc1+ #18
   [   28.398404] Hardware name: GE HealthCare Supernova Patient Hub v1 (DT)
   [   28.404933] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   [   28.411896] pc : drm_atomic_bridge_chain_check+0x24c/0x310 [drm]
   [   28.417940] lr : drm_atomic_bridge_chain_check+0x134/0x310 [drm]
   [   28.423983] sp : ffff8000823eb860
   [   28.427299] x29: ffff8000823eb860 x28: ffff000000ac1e00 x27: ffff00007b27ea18
   [   28.434445] x26: ffff00007b27ea90 x25: ffff00007b106170 x24: ffff00007a5d6ed8
   [   28.441587] x23: ffff00007bb4b8a0 x22: ffff00007b27e800 x21: ffff00007b27ea00
   [   28.448732] x20: 0000000000000000 x19: ffff00007b106008 x18: 0000000000000000
   [   28.455876] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
   [   28.463021] x14: 0000000000000000 x13: ffff00007a7c4ec0 x12: ffff000006dcb440
   [   28.470165] x11: ffff00007a7c4ec0 x10: ffff000079ee5200 x9 : ffff8000798e1aec
   [   28.477311] x8 : ffff00007a63f190 x7 : 0000000000000000 x6 : ffff800079954110
   [   28.484455] x5 : 0000000000000000 x4 : 0000000000000020 x3 : ffff000079a12d80
   [   28.491601] x2 : ffff00007b107000 x1 : ffff00007b106008 x0 : 0000000000000000
   [   28.498747] Call trace:
   [   28.501195]  drm_atomic_bridge_chain_check+0x24c/0x310 [drm] (P)
   [   28.507241]  drm_atomic_helper_check_modeset+0xa1c/0xca0 [drm_kms_helper]
   [   28.514046]  drm_atomic_helper_check+0x28/0xb8 [drm_kms_helper]
   [   28.519980]  drm_atomic_check_only+0x4bc/0x990 [drm]
   [   28.524982]  drm_atomic_commit+0x50/0xd8 [drm]
   [   28.529463]  drm_atomic_helper_set_config+0xe4/0x128 [drm_kms_helper]
   [   28.535919]  drm_mode_setcrtc+0x1cc/0x7b0 [drm]
   [   28.540486]  drm_ioctl_kernel+0xc0/0x140 [drm]
   [   28.544965]  drm_ioctl+0x210/0x4e8 [drm]
   [   28.548926]  __arm64_sys_ioctl+0xa4/0xe8
   [   28.552860]  invoke_syscall+0x50/0x120
   [   28.556619]  el0_svc_common.constprop.0+0x48/0xf8
   [   28.561330]  do_el0_svc+0x28/0x40
   [   28.564653]  el0_svc+0x30/0xd0
   [   28.567713]  el0t_64_sync_handler+0x144/0x168
   [   28.572075]  el0t_64_sync+0x198/0x1a0
   [   28.575746] ---[ end trace 0000000000000000 ]---
    connectors 39, crtc 36
   failed to set mode: Function not implemented


Without your series applied, modetest -s works correctly.

Due to the failure, I couldn't test your drm_bridge_get_current_state() to
see if I can retrieve the drm_bridge_state from my sn65dsi83_reset_pipe()
function.

Also, I have some local commits related to Luca's work about DRM bridge
hot-pluggin stuff on my test branch.

It will not be easy for me to test your series without them as my TI
sn65dsi83 bridge is behind a connector and I need some Luca's modification
to have a functional system. Sorry about that.

Hope that the kernel WARN log provided here will ring you a bell.

Feel free to ask for more information if needed.

Best regards,
Hervé
