Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A20B14157
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 19:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEAF10E555;
	Mon, 28 Jul 2025 17:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IdfU6ZAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90CA10E555
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 17:44:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2E44430D1;
 Mon, 28 Jul 2025 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753724674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WofW9M6HdnQTRJah1TC+0LjDvwdUiZOFZ6xWlfFRkcQ=;
 b=IdfU6ZAfvmA1YBvKoWPIV1aAq8sYZnCs4iahjokEH/Uu1kNKMEh2B2gWINpZm8zeV+D9Nk
 hilJODy77duzSw17mAXup58rLSBDKioY4WYXtJxZUEOaIebqyTJqN3anfK6sp2L9AhnEcM
 F9cZJDwS4iTX5lO0uGCQVEHZwAoCHEdxsUl/z3+qBGsqznbOEdNui0EX3L+BIOxoeRc55c
 7Qj4VLQi0ix1p9RJtVzuGFgJd74cXAHjk7WqSJrjcVc3nG/yJUYKSid4KXTlOT9tk7oT7Q
 NXXnYaH7I0JeyDlOqIE2GyMQlg7GedxwHCPSIofYGqj2eMeDp6VJCpYxS+DDrA==
Date: Mon, 28 Jul 2025 19:44:30 +0200
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
Message-ID: <20250728194430.082f9952@booty>
In-Reply-To: <20250728-diligent-brainy-hyena-109dde@houat>
References: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
 <20250728-diligent-brainy-hyena-109dde@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelvdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekleeujefffeeiheevtddtffejieeivdefkeeugfegffdttdeffeevffduvdetvdenucffohhmrghinheplhhptgdrvghvvghnthhspdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehjr
 ghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
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

thanks for the quick feedback.

On Mon, 28 Jul 2025 10:10:38 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Fri, Jul 25, 2025 at 05:28:03PM +0200, Luca Ceresoli wrote:
> > This bridge driver calls drm_bridge_add() in the DSI host .attach callback
> > instead of in the probe function. This looks strange, even though
> > apparently not a problem for currently supported use cases.
> > 
> > However it is a problem for supporting hotplug of DRM bridges, which is in
> > the works [0][1][2]. The problematic case is when this DSI host is always
> > present while its DSI device is hot-pluggable. In such case with the
> > current code the DRM card will not be populated until after the DSI device
> > attaches to the host, and which could happen a very long time after
> > booting, or even not happen at all.
> > 
> > Supporting hotplug in the latest public draft is based on an ugly
> > workaround in the hotplug-bridge driver code. This is visible in the
> > hotplug_bridge_dsi_attach implementation and documentation in [3] (but
> > keeping in mind that workaround is complicated as it is also circumventing
> > another problem: updating the DSI host format when the DSI device gets
> > connected).
> > 
> > As a preliminary step to supporting hotplug in a proper way, and also make
> > this driver cleaner, move drm_bridge_add() at probe time, so that the
> > bridge is available during boot.
> > 
> > However simply moving drm_bridge_add() prevents populating the whole card
> > when the hot-pluggable addon is not present at boot, for another
> > reason. The reason is:
> > 
> >  * now the encoder driver finds this bridge instead of getting
> >    -EPROBE_DEFER as before
> >  * but it cannot attach it because the bridge attach function in turn tries
> >    to attach to the following bridge, which has not yet been hot-plugged
> > 
> > This needs to be fixed in the bridge attach function by simply returning
> > -EPROBE_DEFER ifs the following bridge (i.e. the DSI device) is not yet
> > present.
> > 
> > [0] https://lpc.events/event/18/contributions/1750/
> > [1] https://lore.kernel.org/lkml/20240924174254.711c7138@booty/
> > [2] https://lore.kernel.org/lkml/20250723-drm-bridge-alloc-getput-for_each_bridge-v1-0-be8f4ae006e9@bootlin.com/
> > [3] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-4-bc4dfee61be6@bootlin.com/
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> There's many things lacking from that commit log to evaluate whether
> it's a good solution or not:

Before answering your questions: I realized my patch is incomplete, it
should also move drm_bridge_remove() to samsung_dsim_remove() for
symmetry. This is a trivial change and it's done and tested locally:

@@ -1825,8 +1825,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 
 	samsung_dsim_unregister_te_irq(dsi);
 
-	drm_bridge_remove(&dsi->bridge);
-
 	return 0;
 }
 
@@ -2069,6 +2067,8 @@ void samsung_dsim_remove(struct platform_device *pdev)
 {
 	struct samsung_dsim *dsi = platform_get_drvdata(pdev);
 
+	drm_bridge_remove(&dsi->bridge);
+
 	pm_runtime_disable(&pdev->dev);
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_host)


Let me reorder your questions so the replies follow a step-by-step
path.

> - What is the next bridge in your case? Did you try with a device
>   controlled through DCS, or with a bridge connected through I2C/SPI
>   that would typically have a lifetime disconnected from the DSI host.

The pipeline is the following:

|--------------------- fixed components --------------------|     |-------- hot-pluggable addon --------| 
|--------------- i.MX8MP ------------|                       

+----------------+    +------------+     +------------------+     +-------------------+      +----------+
|                |    |samsung-dsim|     |hotplug DSI bridge|     |   TI SN65DSI84    |      |LVDS panel|
|fsl,imx8mp-lcdif| A  |            |  B  |                  |  C  |                   |  D   |          |
|                +--->|    DSI host+---->|device        host+---->|DSI host   LVDS out+----->|LVDS in   |
+----------------+    +------------+ DSI +------------------+ DSI +-------------------+ LVDS +----------+
                                                                           ^
                                                                      I2C -'

This is a device tree based system (i.MX8MP, ARM64).

This is the only hot-pluggable hardware I have access to and there is no
DCS.

In the hardware the next bridge after the samsung-dsim is the sn65dsi84
(ti-sn65dsi83.c driver), and there the hotplug connector is between
them.

In the software implementation the next bridge is currently the
hotplug-bridge, which "represents" the hotplug connector (!= DRM
connector). As discussed in the past, the hotplug-bridge may be removed
in future implementations but at the current stage of my work on DRM it
is still needed.

The hotplug-bridge is not (yet?) in mainline, and so aren't some other
bits. However they haven't changed much since my old v4 series [0].

Also, I expect this patch to be mostly valid regardless of whether the
hotplug-bridge will or not be in the final design.

> - What is the typical sequence of probe / attach on your board?

The probe/attach sequence before this patch is the following. This is
in the case the hotpluggable addon is not connected during boot, which
is the most problematic one.

 1) The lcdif starts probing, but probe is deferred until (6.)
    because the samsung-dsim has not probed yet.
    Code path: lcdif_probe() -> lcdif_load() -> lcdif_attach_bridge() ->
               devm_drm_of_get_bridge() -> -EPROBE_DEFER
 2) samsung-dsim probes, but does not drm_bridge_add() itself, so the
    lcdif driver cannot find it
 3) lcdif tries to probe again
    A) it does not find the next bridge and returns -EPROBE_DEFER
 4) hotplug-bridge probes, including:
    A) drm_bridge_add()
    B) mipi_dsi_attach() to register as a "fake" DSI device to
       the samsung-dsim DSI host
       - this registration is fake, meaning it has a fake format;
         it's needed or the samsung-dsim driver would not
         drm_bridge_add() itself and the lcdif would not populate the
         DRM card
    C) look for the next bridge but in the typical case the TI bridge
       has not probed yet; this is not fatal by design of the
       hotplug-bridge (that's its goal indeed)
 5) reacting to 4.B, in the samsung_dsim_host_attach() func does, among
    other things, drm_bridge_add() itself
 6) lcdif tries to probe again
    A) this triggers a chain of drm_bridge_attach:
       * lcdif calls drm_bridge_attach() on the samsung-dsim
       * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
    B) the DRM card is populated and accessible to userspace

When the addon is connected (can be hours later or even never):

 7) the TI SN65DSI84 driver probes, including:
    * drm_bridge_add()
       - thanks to notifiers ([0] patch 2) the hotplug bridge is
         informed and takes note of its next_bridge
    * does mipi_dsi_attach() on its host (hotplug bridge)
 8) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() from
    the TI DSI device by calling:
    * mipi_dsi_detach() on the samsung-dsim to remove the
      fake registration
    * mipi_dsi_attach() with the correct format from the sn65dsi84

Note: after 5) the global bridge_list has a samsung-dsim bridge, while
after an addon insertion/removal there is no samsung-dsim in there
anymore. This is due to the fake registration, which happens only the
first time: at every addon removal samsung_dsim_host_detach() will
drm_bridge_remove() itself.

With the patch applied the sequence would become:

 1) The lcdif starts probing multiple times, but probe is deferred
    until (5.) because the samsung-dsim has not probed yet.
    (so far no changes)
 2) samsung-dsim probes, _and_ does drm_bridge_add() itself
 3) lcdif tries to probe again
    A) this triggers a lcdif probe and a chain of drm_bridge_attach:
       * lcdif calls drm_bridge_attach() on the samsung-dsim
       * samsung-dsim returns -EPROBE_DEFER because there is no next
         bridge yet (with another error the lcdif would fail without
         further deferral)
 4) the hotplug-bridge probes
 5) lcdif tries to probe again
    A) this triggers a lcdif probe and a chain of drm_bridge_attach:
       * lcdif calls drm_bridge_attach() on the samsung-dsim
       * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
    B) the DRM card is populated and accessible to userspace

When the addon is connected (can be hours later or even never):

 6) the TI SN65DSI84 driver probes, including:
    A) drm_bridge_add()
       - thanks to notifiers ([0] patch 2) the hotplug bridge is
         informed and takes note of its next_bridge
    B) does mipi_dsi_attach() on its host (hotplug bridge)
    (so far no changes)
 7) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() from
    the TI DSI device without detaching/attaching from/to the
    samsung-dsim, but only by notifying to samsung-dsim the new format;
    for this my current draft adds a .format_changed op to struct
    mipi_dsi_host_ops, so the hotplug bridge can inform about the new
    format, but in the end we might as well get rid of the hotplug
    bridge entirely

> - Why moving the call to drm_bridge_attach helps?

You mean _from_ drm_bridge_attach, I guess.

Some drawbacks of current code are because at every DSI attach/detach,
the samsung-dsim does drm_bridge_add/remove() itself:

 * To me this looks like a bad design, the samsung-dsim is always
   present and not hotpluggable, so why should it add/remove itself?

 * I have a debugfs patch to show in $BUDUGFS/dri/bridges_removed all
   the removes bridges: bridges after drm_bridge_remove() but not yet
   freed because refcount still > 0. But it causes crashes due to the
   samsung-dsim going backwards from "removed" to "added", and further
   hacks are needed to avoid this crash.

 * At LPC 2024 we had discussed the idea of a ".gone" flag in struct
   drm_bridge, and drm_bridge_enter/exit() macros similar to
   drm_dev_enter/exit() to avoid races between bridge removal and bridge
   usage. I drafted something, but the samsung-dsim would be "ungone"
   when it does a drm_bridge_remove/add() sequence, so more flags and
   hacks would be needed for the .gone flag to work correctly.

Additionally this patch removes the need for a fake registration to get
a DRM card up. The fake registration has many drawbacks:

 * It's a horrible hack to start with, as guaranteed by its author O:-)
   (see the code in [0] patch 4 -> hotplug_bridge_dsi_attach).

 * This hack is better not done by all bridge drivers, to it must stay
   in the hotplug-bridge, preventing the idea of its removal.

 * The samsung-dsim appears present in the global bridge_list after
   initial probe, but absent after a hotplug+hotunplug sequence (as
   described in the Note above)

> - If you think it's a pattern that is generic enough, we must document
>   it. If you don't, we must find something else.

Intuitively it looks to me that a bridge driver should drm_bridge_add()
itself wen probing: I probe, ergo I exist, ergo I add myself to the
global bridge_list.

But that's not too relevant, code is not necessarily intuitive, I know. :)

However if we want to support a DSI device that is pluggable while the
DSI host is always present, we need to support multiple
mipi_dsi_host_attach/detach cycles for the same DSI host instance. So
we have two options:

 1. the DSI host bridge does drm_bridge_add/remove() in probe as this
    patch proposes, so it is "stable" regardless of how many
    dsi_attach/detach cycles it gets:

    xyz_probe
    drm_bridge_add
    N x {
       dsi_attach
       dsi_remove
    }
    drm_bridge_remove
    xyz_remove

 2. we support devices that can be drm_device_add/remove() themselves
    multiple times during the lifetime of a single instance:

    xyz_probe
    N x {
       drm_bridge_add
       dsi_attach
       dsi_remove
       drm_bridge_remove
    } x N
    xyz_remove

As mentioned above, supporting case 2 would introduce problems in many
areas, including the ".gone" flag which seems fundamental. I'm
obviously biased in favor of option 1, at the moment, but open to
discussion.

So it boils down to what is the meaning of "add" and "remove". I'm
giving up on my intuitive interpretation and waiting for your point of
view here. :)

> - Why returning EPROBE_DEFER from the attach callback helps? Also, this
>   is an undocumented behaviour, so if it does, we must document that
>   it's acceptable.

(Note: this question is surely relevant but I think it is a side topic,
not affecting the reasoning about whether drm_bridge_add() should be
called in probe or in dsi_host.attach)

After your question I'm not sure returning -EPROBE_DEFER is the correct
approach indeed.

It currently works well because it means for the samsung-dsim driver:
"there is no hotplug-bridge yet, so I'll ask the lcdif to try again
later". Later the hotplug-bridge will be present and it will take care
of "pretending" the bridge chain is complete (its .attach knows the next
bridge might be absent) and can be fully attached.

However this might not be the most generic solution in the case we want
to support hotplug without the hotplug-bridge (which I think is
something you'd prefer). In such case we need to allow an encoder to
continue probing the card when the encoder chain is not yet complete.
So a bridge that fails attaching the next bridge must not make the
previous bridge fail. This looks like a relevant change to the current
design, where the hotplug-bridge makes things simpler as it lets other
components continue working as they always did.

I'm not sure about the best way to do this. Thinking out loud, we may
introduce a return value from .attach funcs that means "I, the invoked
bridge, did successfully perform attach operations correctly on myself,
but the following bridge is not found so I cannot attach to it as of
now". In such case the previous element (bridge or encoder) knows it
can continue successfully. A bridge may come later on to complete the
encoder chain.

[0] https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
