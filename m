Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B4AAD6F1
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABCD10E751;
	Wed,  7 May 2025 07:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fAKAXuZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EBE10E154;
 Wed,  7 May 2025 07:12:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0550B438F2;
 Wed,  7 May 2025 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746601970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYAyvJHL12oT6BGBWrmzXRLHiSyv5UkdfdbxyEq+wzE=;
 b=fAKAXuZnSS3eGpzPhDcjGsacbbVKiGgoN1+hKvLf8W9LVvJ4q/yN8mvMPuPltCTDbXMASe
 lHtfyjGut/XmC/xrpKXVchctm+xWS0nliJAHS7g61Md9sxN7YRtopQtlivvhd8mGnFfnK1
 zLHPF0YGiRFpUlXubh1ep5E4ewLXUZtHVVNtabxb5GJkslE1cAx6oSWctsvQExum3J+p+E
 G4ikcxIyCXqyCiM2jQxJjrh9Kx946k992iKwtXwwTIyGamjbbizyN66uuoDV6SDsxQtsCc
 zjoWTyHHf75l2ZvLTS0zTK/WEP7psTFLBKbj64q26m1zvV+GCXrw3FgTUMGpzQ==
Date: Wed, 7 May 2025 09:12:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250507091244.32865a71@booty>
In-Reply-To: <a1abf31a-7a4a-4f8d-bf48-6b826aa01197@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
 <20250506224720.5cbcf3e1@booty>
 <a1abf31a-7a4a-4f8d-bf48-6b826aa01197@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
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

Hello Liu,

On Wed, 7 May 2025 10:10:53 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 05/07/2025, Luca Ceresoli wrote:
> > Hello Liu,  
> 
> Hi Luca,
> 
> > 
> > thanks for your further feedback.
> > 
> > On Tue, 6 May 2025 10:24:18 +0800
> > Liu Ying <victor.liu@nxp.com> wrote:
> >   
> >> On 04/30/2025, Luca Ceresoli wrote:  
> >>> Hello Liu,    
> >>
> >> Hi Luca,
> >>  
> >>>
> >>> On Tue, 29 Apr 2025 10:10:55 +0800
> >>> Liu Ying <victor.liu@nxp.com> wrote:
> >>>     
> >>>> Hi,
> >>>>
> >>>> On 04/25/2025, Luca Ceresoli wrote:    
> >>>>> This is the new API for allocating DRM bridges.
> >>>>>
> >>>>> This driver embeds an array of channels in the main struct, and each
> >>>>> channel embeds a drm_bridge. This prevents dynamic, refcount-based
> >>>>> deallocation of the bridges.
> >>>>>
> >>>>> To make the new, dynamic bridge allocation possible:
> >>>>>
> >>>>>  * change the array of channels into an array of channel pointers
> >>>>>  * allocate each channel using devm_drm_bridge_alloc()
> >>>>>  * adapt the code wherever using the channels
> >>>>>
> >>>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> >>>
> >>> [...]
> >>>     
> >>>>> @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> >>>>>  free_child:
> >>>>>  	of_node_put(child);
> >>>>>  
> >>>>> -	if (i == 1 && pc->ch[0].next_bridge)
> >>>>> -		drm_bridge_remove(&pc->ch[0].bridge);
> >>>>> +	if (i == 1 && pc->ch[0]->next_bridge)      
> >>>>
> >>>> Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
> >>>> pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
> >>>> dereference here...    
> >>>
> >>> See below for this.
> >>>     
> >>>>> +		drm_bridge_remove(&pc->ch[0]->bridge);
> >>>>>  
> >>>>>  	pm_runtime_disable(dev);
> >>>>>  	return ret;
> >>>>> @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
> >>>>>  	int i;
> >>>>>  
> >>>>>  	for (i = 0; i < 2; i++) {
> >>>>> -		ch = &pc->ch[i];
> >>>>> +		ch = pc->ch[i];
> >>>>>  
> >>>>>  		if (!ch->is_available)      
> >>>>
> >>>> ...and here too.    
> >>>
> >>> This is indeed a bug, I should have checked the pointer for being
> >>> non-NULL.
> >>>
> >>> Looking at that more closely, I think the is_available flag can be
> >>> entirely removed now. The allocation itself (ch != NULL) now is
> >>> equivalent. Do you think my reasoning is correct?
> >>>
> >>> Ouch! After writing the previous paragraph I realized you proposed this
> >>> a few lines below! OK, removing is_available. :)
> >>>
> >>> [...]
> >>>     
> >>>> On top of this patch series, this issue doesn't happen if I apply the below
> >>>> change:    
> >>>
> >>> [...]
> >>>     
> >>>> @@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> >>>>  free_child:
> >>>>         of_node_put(child);
> >>>>  
> >>>> -       if (i == 1 && pc->ch[0]->next_bridge)
> >>>> +       if (i == 1 && pc->ch[0])
> >>>>                 drm_bridge_remove(&pc->ch[0]->bridge);    
> >>>
> >>> Unrelated to this patch, but as I looked at it more in depth now, I'm
> >>> not sure this whole logic is robust, even in the original code.
> >>>
> >>> The 'i == 1' check here seems to mean "if some error happened when
> >>> handling channel@1, that means channel@0 was successfully initialized,
> >>> so let's clean up channel 0".
> >>>
> >>> However my understanding of the bindings is that device tree is allowed
> >>> to have the channel@1 node before the channel@0 node (or even channel@1
> >>> without channel@0, but that's less problematic here).
> >>>
> >>> In such case (channel@1 before channel@0), this would happen:
> >>>
> >>>  1. alloc and init ch[1], all OK
> >>>  2. alloc and init ch[0], an error happens
> >>>     (e.g. of_graph_get_remote_node() fails)
> >>>
> >>> So we'd reach the free_child: label, and we should call
> >>> drm_bridge_remove() for ch[1]->bridge, but there's no code to do that.
> >>>
> >>> To be robust in such a case, I think both channels need to be checked
> >>> independently, as the status of one does not imply the status of the
> >>> other. E.g.:
> >>>
> >>>   for (i = 0; i < 2; i++)
> >>>       if (pc->ch[i] && pc->ch[i]->next_bridge)
> >>>           drm_bridge_remove(&pc->ch[i]->bridge);
> >>>
> >>> (which is similar to what .remove() does after the changes discussed in
> >>> this thread, and which I have queued for v3)
> >>>
> >>> What's your opinion? Do you think I missed anything?    
> >>
> >> The pixel combiner DT node would be added in imx8-ss-dc{0,1}.dtsi, please
> >> see the case for imx8-ss-dc0.dtsi introduced by an in-flight patch[1].  As
> >> channel@{0,1} child nodes always exist(DT overlay cannot effectively delete
> >> any of them) and channel@0 always comes first, there is no problematic case.  
> > 
> > I'm not questioning what existing and future dts files (will) contain,
> > and surely I don't see a good reason someone would write channel@1
> > before channel@0.
> > 
> > My point is:
> > 
> >  - the bindings _allow_ channel1 before channel@0
> >  - the error management code after the free_child label won't work
> >    correctly if channel1 is before channel@0 in the device tree
> > 
> > IOW the driver is not robust against all legal device tree descriptions,
> > and it could be easily made robust using the example code in my
> > previous e-mail (quoted a few lines above).
> > 
> > If you agree about this I'll be happy to send a patch doing that change.
> > If you think I'm wrong, I won't fight a battle. This topic is
> > orthogonal to the change I'm introducing in this patch, and I can
> > continue the conversion independently from this discussion.  
> 
> I don't think it is necessary to do that change for now.  When someone
> really comes across this issue, we may make the error management code
> robust.
> 
> >   
> >>> Thanks for taking the time to dig into this!    
> >>
> >> After looking into this patch and patch 31(though I've already provided my A-b)
> >> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
> >> should have the same life time with the embedded DRM bridges, because for
> >> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
> >> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
> >> the life time for the embedded channel/bridge structures only, but not for the
> >> main structures.  What do you think ?  
> > 
> > I see you concern, but I'm sure the change I'm introducing is not
> > creating the problem you are concerned about.
> > 
> > The key aspect is that my patch is merely changing the lifetime of the
> > _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
> > the bridge is removed from its encoder chain and it is completely not
> > reachable, both before and after my patch. With my patch it is not
> > freed immediately, but it's just a piece of "wasted" memory that is
> > still allocated until elsewhere in the kernel there are pointers to it,
> > to avoid use-after-free.
> > 
> > With this explanation, do you think my patch is correct (after fixing
> > the bug we already discussed of course)?  
> 
> I tend to say your patch is not correct because we'll eventually make sure
> that removing a bridge module is safe when doing atomic commit,

I think your sentence can be rephrased as "your patch is correct with
the current code base where bridges are not (yet) removable, but there
will be a problem when they start to actually be removable".

Is my understanding correct? If it is, I agree on that sentence.

The work to have removable bridges is massive and non-trivial, so it
will need to be tackled in steps. The grand plan [0] is:

 1. add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices 
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

I am at step 1 right now. Removal during atomic updates is step 2,
ideas about how to implement that are already being discussed [1],
there's a practical plan proposed by Maxime with the goal of reaching
removable bridges without breaking things along the path.

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/
[1] https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/

> which means
> the main structures should have the same life time with the DRM bridges.

The word "lifetime" mean two things for bridges:

 * the time span during which memory is allocated for a struct
   drm_bridge (along with the embedding struct)
 * the time span during which a DRM bridge is active/used/usable as
   part of a card
   - i.e. when it is part of an encoder chain
   - i.e. when drm_bridge_funcs callbacks can be called
   - i.e. from drm_bridge_add() to drm_bridge_remove()

These two lifetimes used to be nearly the same. Now the "memory
allocation lifetime" is extended, but the "bridge existence" is
unchanged: drm_bridge_add() to drm_bridge_remove() are called in the
same place and do the same things, so the bridge will stop being in any
encoder chain at the exact same time. now we are just keeping a piece of
memory allocated for a longer time.

Seen in another way, the events used to be:

 * probe:
   - allocate bridge
   - drm_bridge_add()

 * remove
   - drm_bridge_remove()
   - now the bridge is not used, it's just some dead memory [*]
   - kfree bridge (either in .remove() or just after by devm)

Now it becomes:

 * probe:
   - allocate bridge
   - drm_bridge_add()

 * remove
   - drm_bridge_remove()
   - now the bridge is not used, it's just some dead memory [*]
   - maybe some more time, possibly long, until the last put [*]
   - kfree bridge (by devm)

The duration of the [*] steps changes, but it's harmless because the
bridge is not used at all. No change except for memory allocation.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
