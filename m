Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6DAE1F99
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 17:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A413610E233;
	Fri, 20 Jun 2025 15:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VxGZ3Exc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1C10E233
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:57:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 879E5433D4;
 Fri, 20 Jun 2025 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750435074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IihbOFtvzPM1DEENhBrqCNWKLexIYZNuk39SeKESMMc=;
 b=VxGZ3ExcoSlVTfgh5X/Zm/lpf6TgM2TRym9/vkCwrondDiKWindQnBZinB6BXFPweTyzMJ
 bS8cl2JSQ1n9lBzYT/+Eeti4AL+cL68YsuSBMdBriEQR22iSk7or3nO4SDyQRMgR0DdbSX
 cTTNKfkpXryJgcMSnWB2+mlISqYEWcMrsdzfsITKM9xgad9IIOVsMgKOtjykF/E/yvPO/i
 e3+k5h90Pcq359GuLHHrKQHk4bIbOpjjEoHcwrvnoL7/XqMPZEVWll69QuSA0rM+S7otoL
 ps6DR+vQfzCQQk+6YO0xNnoFlJfKG5LAM8prQWJnXqPTW0bXECWLrsujoozKmw==
Date: Fri, 20 Jun 2025 17:57:50 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Anusha Srivatsa <asrivats@redhat.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
Message-ID: <20250620175750.2e8e5203@booty>
In-Reply-To: <20250620-adaptable-loutish-oryx-fee75c@houat>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-3-bad7eba5d117@bootlin.com>
 <20250620-adaptable-loutish-oryx-fee75c@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhor
 dhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

On Fri, 20 Jun 2025 13:41:48 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Luca,
> 
> On Fri, Jun 20, 2025 at 11:32:08AM +0200, Luca Ceresoli wrote:
> > To the best of my knowledge, all drivers in the mainline kernel adding a
> > DRM bridge are now converted to using devm_drm_bridge_alloc() for
> > allocation and initialization. Among others this ensures initialization of
> > the bridge refcount, allowing dynamic allocation lifetime.
> > 
> > devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
> > the old pattern ([devm_]kzalloc + filling the struct fields +
> > drm_bridge_add) is not allowed anymore.
> > 
> > Any drivers that might have been missed during the conversion, patches in
> > flight towards mainline and out-of-tre drivers still using the old pattern
> > will already be caught by a warning looking like:
> > 
> >   ------------[ cut here ]------------
> >   refcount_t: addition on 0; use-after-free.
> >   WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
> >   [...]
> >   Call trace:
> >    refcount_warn_saturate+0x120/0x148 (P)
> >    drm_bridge_get.part.0+0x70/0x98 [drm]
> >    drm_bridge_add+0x34/0x108 [drm]
> >    sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
> >    [...]
> > 
> > This warning comes from the refcount code and happens because
> > drm_bridge_add() is increasing the refcount, which is uninitialized and
> > thus initially zero.
> > 
> > Having a warning and the corresponding stack trace is surely useful, but
> > the warning text does not clarify the root problem nor how to fix it.
> > 
> > Add a DRM_WARN() just before increasing the refcount, so the log will be
> > much more readable:
> > 
> >   [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
> >   ------------[ cut here ]------------
> >   refcount_t: addition on 0; use-after-free.
> >   [...etc...]
> > 
> > A DRM_WARN is used because drm_warn and drm_WARN require a struct
> > drm_device pointer which is not yet available when adding a bridge.
> > 
> > Do not print the dev_name() in the warning because struct drm_bridge has no
> > pointer to the struct device. The affected driver should be easy to catch
> > based on the following stack trace however.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v8
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..7d511c28608f1d8ea8fbb81d00efa9e227b02a13 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> >   */
> >  void drm_bridge_add(struct drm_bridge *bridge)
> >  {
> > +	if (kref_read(&bridge->refcount) == 0)
> > +		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
> > +  
> 
> I'm fine with it on principle, but I wonder if using bridge->container
> is set wouldn't be a more obvious way to check it?

Good point. Indeed the refcount check is potentially fragile because by
its own nature the refcount gets changed at various moments by various
parts of the kernel, unlike the container which is supposed to be never
modified after allocation.

I'll change this for v9.

Ouch, I just realized this does not show as v8 as it should (see cover
letter). Sorry about that, I messed up with my b4 branches, fixing both
things in, well, v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
