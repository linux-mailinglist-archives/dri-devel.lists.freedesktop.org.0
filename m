Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3BB1E90D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951ED10E1E2;
	Fri,  8 Aug 2025 13:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fvOSvMgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6409310E1E2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:20:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 627BA441D4;
 Fri,  8 Aug 2025 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754659206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MFaYjuMvPc+yjhDDlL5Aq7jSveHku0tAPcxe2cWz9A=;
 b=fvOSvMgM5/kK4KjIhA86U+TQ6n1X7JfrhyqJAZBJkY/GITyhtsUah91NVXwpS6d82d/45p
 JZCoXOAr3imsikcVU6ZHHv2auRsk9oQg4ffSyKRIsAoN9Y1gFFBj/xVJA30/LUDis/y19+
 GFXJUw+KNfSCmdod6HH2pjgyLDOyxlkmrXSXSecYg457+dlbFbtMBRl5+e4vD7vKgl3iAX
 S3Qa7Pp6Dx4QzpX9Ycz9kyt+MpV/rSgcTPoTSgqD6Ys7o1McUKtHwVMS2TcB0SrLojqiTY
 GrJletqndo4LGQojby+nTUAGEbVlXZ7+OfjuIA8a8PCbz5Pn/kyIEuCjgXUEAA==
Date: Fri, 8 Aug 2025 15:20:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
Message-ID: <20250808152001.122f2da6@booty>
In-Reply-To: <20250731-tactful-jellyfish-of-perspective-cb0324@houat>
References: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
 <20250728-diligent-brainy-hyena-109dde@houat>
 <20250728194430.082f9952@booty>
 <20250731-tactful-jellyfish-of-perspective-cb0324@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelueejffefieehvedttdffjeeiiedvfeekuefggefftddtfeefveffuddvtedvnecuffhomhgrihhnpehlphgtrdgvvhgvnhhtshdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeejkedrvdduvddrvdejrdduudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeekrddvuddvrddvjedrudduhedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsr
 ghmshhunhhgrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
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

On Thu, 31 Jul 2025 12:05:27 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Jul 28, 2025 at 07:44:30PM +0200, Luca Ceresoli wrote:
> > Hi Maxime,
> > 
> > thanks for the quick feedback.
> > 
> > On Mon, 28 Jul 2025 10:10:38 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Fri, Jul 25, 2025 at 05:28:03PM +0200, Luca Ceresoli wrote:  
> > > > This bridge driver calls drm_bridge_add() in the DSI host .attach callback
> > > > instead of in the probe function. This looks strange, even though
> > > > apparently not a problem for currently supported use cases.
> > > > 
> > > > However it is a problem for supporting hotplug of DRM bridges, which is in
> > > > the works [0][1][2]. The problematic case is when this DSI host is always
> > > > present while its DSI device is hot-pluggable. In such case with the
> > > > current code the DRM card will not be populated until after the DSI device
> > > > attaches to the host, and which could happen a very long time after
> > > > booting, or even not happen at all.
> > > > 
> > > > Supporting hotplug in the latest public draft is based on an ugly
> > > > workaround in the hotplug-bridge driver code. This is visible in the
> > > > hotplug_bridge_dsi_attach implementation and documentation in [3] (but
> > > > keeping in mind that workaround is complicated as it is also circumventing
> > > > another problem: updating the DSI host format when the DSI device gets
> > > > connected).
> > > > 
> > > > As a preliminary step to supporting hotplug in a proper way, and also make
> > > > this driver cleaner, move drm_bridge_add() at probe time, so that the
> > > > bridge is available during boot.
> > > > 
> > > > However simply moving drm_bridge_add() prevents populating the whole card
> > > > when the hot-pluggable addon is not present at boot, for another
> > > > reason. The reason is:
> > > > 
> > > >  * now the encoder driver finds this bridge instead of getting
> > > >    -EPROBE_DEFER as before
> > > >  * but it cannot attach it because the bridge attach function in turn tries
> > > >    to attach to the following bridge, which has not yet been hot-plugged
> > > > 
> > > > This needs to be fixed in the bridge attach function by simply returning
> > > > -EPROBE_DEFER ifs the following bridge (i.e. the DSI device) is not yet
> > > > present.
> > > > 
> > > > [0] https://lpc.events/event/18/contributions/1750/
> > > > [1] https://lore.kernel.org/lkml/20240924174254.711c7138@booty/
> > > > [2] https://lore.kernel.org/lkml/20250723-drm-bridge-alloc-getput-for_each_bridge-v1-0-be8f4ae006e9@bootlin.com/
> > > > [3] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-4-bc4dfee61be6@bootlin.com/
> > > > 
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> > > 
> > > There's many things lacking from that commit log to evaluate whether
> > > it's a good solution or not:  
> > 
> > Before answering your questions: I realized my patch is incomplete, it
> > should also move drm_bridge_remove() to samsung_dsim_remove() for
> > symmetry. This is a trivial change and it's done and tested locally:
> > 
> > @@ -1825,8 +1825,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
> >  
> >  	samsung_dsim_unregister_te_irq(dsi);
> >  
> > -	drm_bridge_remove(&dsi->bridge);
> > -
> >  	return 0;
> >  }
> >  
> > @@ -2069,6 +2067,8 @@ void samsung_dsim_remove(struct platform_device *pdev)
> >  {
> >  	struct samsung_dsim *dsi = platform_get_drvdata(pdev);
> >  
> > +	drm_bridge_remove(&dsi->bridge);
> > +
> >  	pm_runtime_disable(&pdev->dev);
> >  
> >  	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_host)
> > 
> > 
> > Let me reorder your questions so the replies follow a step-by-step
> > path.
> >   
> > > - What is the next bridge in your case? Did you try with a device
> > >   controlled through DCS, or with a bridge connected through I2C/SPI
> > >   that would typically have a lifetime disconnected from the DSI host.  
> > 
> > The pipeline is the following:
> > 
> > |--------------------- fixed components --------------------|     |-------- hot-pluggable addon --------| 
> > |--------------- i.MX8MP ------------|                       
> > 
> > +----------------+    +------------+     +------------------+     +-------------------+      +----------+
> > |                |    |samsung-dsim|     |hotplug DSI bridge|     |   TI SN65DSI84    |      |LVDS panel|
> > |fsl,imx8mp-lcdif| A  |            |  B  |                  |  C  |                   |  D   |          |
> > |                +--->|    DSI host+---->|device        host+---->|DSI host   LVDS out+----->|LVDS in   |
> > +----------------+    +------------+ DSI +------------------+ DSI +-------------------+ LVDS +----------+
> >                                                                            ^
> >                                                                       I2C -'
> >
> > This is a device tree based system (i.MX8MP, ARM64).
> > 
> > This is the only hot-pluggable hardware I have access to and there is no
> > DCS.
> > 
> > In the hardware the next bridge after the samsung-dsim is the sn65dsi84
> > (ti-sn65dsi83.c driver), and there the hotplug connector is between
> > them.
> > 
> > In the software implementation the next bridge is currently the
> > hotplug-bridge, which "represents" the hotplug connector (!= DRM
> > connector). As discussed in the past, the hotplug-bridge may be removed
> > in future implementations but at the current stage of my work on DRM it
> > is still needed.
> > 
> > The hotplug-bridge is not (yet?) in mainline, and so aren't some other
> > bits. However they haven't changed much since my old v4 series [0].  
> 
> I'd like to take the hotplug DSI bridge out of the equation for now.
> Does this issue happen without it?
> 
> > Also, I expect this patch to be mostly valid regardless of whether the
> > hotplug-bridge will or not be in the final design.
> >   
> > > - What is the typical sequence of probe / attach on your board?  
> > 
> > The probe/attach sequence before this patch is the following. This is
> > in the case the hotpluggable addon is not connected during boot, which
> > is the most problematic one.
> > 
> >  1) The lcdif starts probing, but probe is deferred until (6.)
> >     because the samsung-dsim has not probed yet.
> >     Code path: lcdif_probe() -> lcdif_load() -> lcdif_attach_bridge() ->
> >                devm_drm_of_get_bridge() -> -EPROBE_DEFER
> >  2) samsung-dsim probes, but does not drm_bridge_add() itself, so the
> >     lcdif driver cannot find it
> >  3) lcdif tries to probe again
> >     A) it does not find the next bridge and returns -EPROBE_DEFER

(**), see below

> >  4) hotplug-bridge probes, including:
> >     A) drm_bridge_add()
> >     B) mipi_dsi_attach() to register as a "fake" DSI device to
> >        the samsung-dsim DSI host
> >        - this registration is fake, meaning it has a fake format;
> >          it's needed or the samsung-dsim driver would not
> >          drm_bridge_add() itself and the lcdif would not populate the
> >          DRM card
> >     C) look for the next bridge but in the typical case the TI bridge
> >        has not probed yet; this is not fatal by design of the
> >        hotplug-bridge (that's its goal indeed)
> >  5) reacting to 4.B, in the samsung_dsim_host_attach() func does, among
> >     other things, drm_bridge_add() itself
> >  6) lcdif tries to probe again
> >     A) this triggers a chain of drm_bridge_attach:
> >        * lcdif calls drm_bridge_attach() on the samsung-dsim
> >        * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
> >     B) the DRM card is populated and accessible to userspace
> > 
> > When the addon is connected (can be hours later or even never):
> > 
> >  7) the TI SN65DSI84 driver probes, including:
> >     * drm_bridge_add()
> >        - thanks to notifiers ([0] patch 2) the hotplug bridge is
> >          informed and takes note of its next_bridge
> >     * does mipi_dsi_attach() on its host (hotplug bridge)
> >  8) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() from
> >     the TI DSI device by calling:
> >     * mipi_dsi_detach() on the samsung-dsim to remove the
> >       fake registration
> >     * mipi_dsi_attach() with the correct format from the sn65dsi84
> > 
> > Note: after 5) the global bridge_list has a samsung-dsim bridge, while
> > after an addon insertion/removal there is no samsung-dsim in there
> > anymore. This is due to the fake registration, which happens only the
> > first time: at every addon removal samsung_dsim_host_detach() will
> > drm_bridge_remove() itself.

[...]

> Thanks for the writeup. I'd still like to know what it looks like
> without the hotplug-bridge in there.

Thanks for this discussion. It's useful in that it is shaking some ideas
here, but that unavoidably takes time to experiment.

Removing the hotplug-bridge is the big challenge, it would ideally
happen at the end of the work, when the DRM subsystem is ready to
handle hotplug on its own. However I plan to do some experiment soon,
at least to gather a better understanding of what it is doing that is
not [yet] done by the DRM subsystem.

I think the first thing that will break when removing the hotplug-bridge
is that we get stuck at (**) above: the DRM card will never probe
without the add-on connected because the last bridge before the hotplug
connector (samsung-dsim here) will always return -EPROBE_DEFER in its
.attach callback.

> > > - Why moving the call to drm_bridge_attach helps?  
> > 
> > You mean _from_ drm_bridge_attach, I guess.
> > 
> > Some drawbacks of current code are because at every DSI attach/detach,
> > the samsung-dsim does drm_bridge_add/remove() itself:
> > 
> >  * To me this looks like a bad design, the samsung-dsim is always
> >    present and not hotpluggable, so why should it add/remove itself?
> > 
> >  * I have a debugfs patch to show in $BUDUGFS/dri/bridges_removed all
> >    the removes bridges: bridges after drm_bridge_remove() but not yet
> >    freed because refcount still > 0. But it causes crashes due to the
> >    samsung-dsim going backwards from "removed" to "added", and further
> >    hacks are needed to avoid this crash.
> > 
> >  * At LPC 2024 we had discussed the idea of a ".gone" flag in struct
> >    drm_bridge, and drm_bridge_enter/exit() macros similar to
> >    drm_dev_enter/exit() to avoid races between bridge removal and bridge
> >    usage. I drafted something, but the samsung-dsim would be "ungone"
> >    when it does a drm_bridge_remove/add() sequence, so more flags and
> >    hacks would be needed for the .gone flag to work correctly.  
> 
> Gone would be based on the dsim platform_device being there or not, I'm
> not sure how it relates to whether a child DSI device has been attached
> or not?

I decided to give this a try before experimenting without the
hotplug-bridge. Turns out you are right, and the .unplugged flag does
not interfere with the samsung-dsim drm_bridge_remove/add() behaviour.

So I'm sending my first attempt at drm_bridge_enter/exit() in a moment.
To me, that would untangle one bit of the whole gordian knot.

> > Additionally this patch removes the need for a fake registration to get
> > a DRM card up. The fake registration has many drawbacks:
> > 
> >  * It's a horrible hack to start with, as guaranteed by its author O:-)
> >    (see the code in [0] patch 4 -> hotplug_bridge_dsi_attach).
> > 
> >  * This hack is better not done by all bridge drivers, to it must stay
> >    in the hotplug-bridge, preventing the idea of its removal.
> > 
> >  * The samsung-dsim appears present in the global bridge_list after
> >    initial probe, but absent after a hotplug+hotunplug sequence (as
> >    described in the Note above)
> >   
> > > - If you think it's a pattern that is generic enough, we must document
> > >   it. If you don't, we must find something else.  
> > 
> > Intuitively it looks to me that a bridge driver should drm_bridge_add()
> > itself wen probing: I probe, ergo I exist, ergo I add myself to the
> > global bridge_list.
> > 
> > But that's not too relevant, code is not necessarily intuitive, I know. :)  
> 
> I largely agree with your intuition,

Good to know! :-)

> but then there's also many moving
> parts: The two stage bridge probing (between probe and attach),
> sometimes the component framework adds an extra step, then you have
> devices that probes right after the DSI host (DSI devices), some that
> probes with a sequence completely uncorrelated (I2C devices), etc.
> 
> It's hard to test, reason about, and we do have to have some workaround
> sometimes.
> 
> > However if we want to support a DSI device that is pluggable while the
> > DSI host is always present, we need to support multiple
> > mipi_dsi_host_attach/detach cycles for the same DSI host instance. So
> > we have two options:
> > 
> >  1. the DSI host bridge does drm_bridge_add/remove() in probe as this
> >     patch proposes, so it is "stable" regardless of how many
> >     dsi_attach/detach cycles it gets:
> > 
> >     xyz_probe
> >     drm_bridge_add
> >     N x {
> >        dsi_attach
> >        dsi_remove
> >     }
> >     drm_bridge_remove
> >     xyz_remove
> > 
> >  2. we support devices that can be drm_device_add/remove() themselves
> >     multiple times during the lifetime of a single instance:
> > 
> >     xyz_probe
> >     N x {
> >        drm_bridge_add
> >        dsi_attach
> >        dsi_remove
> >        drm_bridge_remove
> >     } x N
> >     xyz_remove
> > 
> > As mentioned above, supporting case 2 would introduce problems in many
> > areas, including the ".gone" flag which seems fundamental. I'm
> > obviously biased in favor of option 1, at the moment, but open to
> > discussion.  
> 
> I really think we should stop discussing future work. It might be clear
> to you, but it really isn't for everybody else because that works is
> mostly off list and hasn't been reviewed right now.

"mostly off list" is not correct, at least formally. The hotplug-bridge
work has been sent [0], and code hasn't changed significantly. However I
fully understand it's hard to have the big picture for anyone but me,
at the moment.

Do you think sending a new RFC-like series with the entire work
(including the hotplug-bridge, unless it cannot be removed right now)
would help the discussion?

> So can you please frame the problem on what happens upstream, right now.

I surely understand you request, and I'm striving to achieve it. There's
unfortunately a chicken-egg problem: presenting the big picture needs
fixing the issues at the lower levels, which in turn require the big
picture to be understood.

[0] https://lore.kernel.org/lkml/20241231-hotplug-drm-bridge-v5-10-173065a1ece1@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
