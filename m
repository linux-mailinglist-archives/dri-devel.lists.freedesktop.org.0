Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DBACF698
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C2F10E2D7;
	Thu,  5 Jun 2025 18:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HknfJRJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7910E83D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F068943A44;
 Thu,  5 Jun 2025 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749148322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPZNF5bEHba9k6vIOW/VukHg1eq0fNfZYGtVAdLeg+g=;
 b=HknfJRJGzx8XPl8qn4PYSCthquzFJMwaozl0rT0LwbSM7P0U2fYePSF0VhijC3QRVPEUHD
 eKd2cwPK9GEVAaQ0WR9JzJbGpIKVx1OibtDrNpdyHoih7jf0S/2Zz33kSUya31mUjOsVW2
 JQ6yR6gxWkRRlPrRWkYp385G9LEuzF6V2kKCjJfsjtHTnOe2fRj6nGUowDkXY0qcOSUnaI
 NKq6I6ARt3lfStzlpnvWmyuFQI798gUi2dzAF36P/833U5VEyne8ALgqymJg6woZlEQzFl
 zpCwX69S1glyfLqkF89B0ZWhzmyqp27JBPJlDpUpvTXbFj07asF6Gbnk8ozWjA==
Date: Thu, 5 Jun 2025 20:31:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] drm/tests: bridge: add KUnit tests for
 devm_drm_bridge_alloc()
Message-ID: <20250605203158.0846e8de@booty>
In-Reply-To: <20250527-smiling-peacock-from-uranus-dc032f@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-3-7e356fd58ba5@bootlin.com>
 <20250527-smiling-peacock-from-uranus-dc032f@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmo
 hhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
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

Hello Maxime,

thanks for reviewing this series.

On Tue, 27 May 2025 18:10:31 +0200
Maxime Ripard <mripard@kernel.org> wrote:

[...]

> > @@ -422,11 +424,93 @@ static struct kunit_suite drm_bridge_helper_reset_crtc_test_suite = {
> >  	.test_cases = drm_bridge_helper_reset_crtc_tests,
> >  };
> >  
> > +struct drm_bridge_alloc_test_ctx {  
> 
> drm_bridge_alloc_priv
> 
> > +	struct device *dev;
> > +	struct dummy_drm_bridge *dummy_br;
> > +	bool destroyed;  
> 
> This can be in drm_bridge_priv

Not really, because drm_bridge_priv will be freed just after calling
.destroy, and we need .destroyed after the free happened.

[...]

> > +static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
> > +	.destroy = dummy_drm_bridge_destroy,
> > +};  
> 
> And same here, you don't need to create yet another function set, just
> add it to the existing ones.

OK, but it implies further changes.

In this version of this patch, the alloc tests being introduced use
drm_bridge_alloc_priv, while the other tests using the existing
function sets rely on drm_bridge_init_priv which has different fields.
So if all tests will call .destroy, we always need a valid struct
pointer for drm_bridge_priv.data.

Based on this, I think the only solution is to not introduce
drm_bridge_alloc_priv, and instead put its members (struct device *dev and bool
destroyed) to drm_bridge_init_priv, and then use drm_bridge_init_priv
for all tests.

The change is not very invasive, and perhaps even a cleanup, thus I'm
going to send as above in v9.


I'm OK with all the other changes you proposed. All queued for v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
