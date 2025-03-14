Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC8A6110C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622FF10E9E8;
	Fri, 14 Mar 2025 12:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="U9zxT969";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E16A10E371
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:27:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E543442ED;
 Fri, 14 Mar 2025 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741955232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWos/lt+uMlzaLTSvHgq990LURjtMSjT7rOx+Xb5F2I=;
 b=U9zxT969s4vNZP+vaN0mLnyNm5VXd5KZq658rtO0Ev9Lihaa8hN1VRPWmzZxgT9itdelyF
 sl9VVkzd1LQFs1pQeRdrcOXwmCzdczSzGXhiNoQzHygLLM11iQAaNxIyGUoi5ayWE3hMR3
 jq8rbExdmaNQYpfjGD8HvHtin3gmr7vUT9iPsaHjF6ATc6rMLo3OFrNchGm9Ggz7p5x36G
 z5MeVrY2m3jKCR7BvX0mSggNa/7Pt163aEI0voJQJwv+W5qbod50h/W9Z1BrjGupXbo5AV
 6lkbewIQy4wY6lCuR8iU7V7pcBxUAVKM1toQodne7cGlNEU8oEugfM0FNVQyZg==
Date: Fri, 14 Mar 2025 13:27:09 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250314132709.16a38692@booty>
In-Reply-To: <CAN9Xe3TeKTZtcMPtae7h33H=B-veGW93z8nMpHK+pEuNdh4=2A@mail.gmail.com>
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-1-e99cd69f6136@redhat.com>
 <20250313110944.1c1f7e4e@booty>
 <CAN9Xe3TeKTZtcMPtae7h33H=B-veGW93z8nMpHK+pEuNdh4=2A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhit
 ggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
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

Hello Anusha,

On Thu, 13 Mar 2025 16:34:45 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t  
> > offset,  
> > > +                          const struct drm_panel_funcs *funcs)
> > > +{
> > > +     void *container;
> > > +     struct drm_panel *panel;
> > > +     int err;
> > > +
> > > +     if (!funcs) {
> > > +             dev_warn(dev, "Missing funcs pointer\n");
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     container = kzalloc(size, GFP_KERNEL);
> > > +     if (!container)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     panel = container + offset;
> > > +     panel->container_offset = offset;
> > > +     panel->funcs = funcs;
> > > +     kref_init(&panel->refcount);
> > > +
> > > +     err = devm_add_action_or_reset(dev, drm_panel_put_void, panel);
> > > +     if (err)
> > > +             return ERR_PTR(err);
> > > +
> > > +     drm_panel_init(panel, dev, funcs, panel->connector_type);  
> >
> > panel->connector_type here is uninitialized. You are passing
> > panel->connector_type to drm_panel_init(), which will then copy it into
> > panel->connector_type itself.
> >
> > So you mean I pass connector_type from the driver calling the helper, so  
> there is access to the connector type here?

I'm not a panel expert, but I think it makes sense that to create the
panel you need to know the connection type, and that is what Maxime
suggested.

> > > +     /**
> > > +      * @container_offset: Offset of this struct within the container
> > > +      * struct embedding it. Used for refcounted panels to free the
> > > +      * embeddeing struct when the refcount drops to zero.
> > > +      */
> > > +     size_t container_offset;  
> >
> > While storing the offset obviously works, and that's what I had
> > implemented in my latest bridge refcounting series, after some
> > discussion with Maxime we agreed storing a container pointer instead of
> > the offset is cleaner. I think it would be good here as well.
> >
> > See:
> > https://lore.kernel.org/lkml/20250227-macho-convivial-tody-cea7dc@houat/
> >  
> 
> so just void *container instead of size_t container_offset.

Exactly. You can have a look at the patch I sent earlier today:
https://lore.kernel.org/lkml/20250314-drm-bridge-refcount-v7-2-152571f8c694@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
