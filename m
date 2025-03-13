Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5914A5F958
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 16:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD210E8E1;
	Thu, 13 Mar 2025 15:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WoqK02lK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43810E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 15:14:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55B084421A;
 Thu, 13 Mar 2025 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741878855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9luUN/dEXHB6yOQaOu/R2VJ4c9o/k4HnO8bdSVrfaX8=;
 b=WoqK02lKedHD6pknpCYD3wUB4cb9WBWsuwqfmbaKjvYll+hAiPLQmsK6HdnqxeRBw0G+F/
 2Vm4bYCBgcp+gcP45FoiM+iSwf3GJKg7st/NGTxFgxI/19ZdFWH/jUfNSt2b0lZXoggZcE
 KzKYF67mIrT703ucVzNH/d7+o9VZyV8PPDYzJSloqiHkdz2TRzUroJDdPTFqoR0QXRwmY8
 eBVkyPZ4wThW7j4SCO8112nd/u05O6RelraW+/8LQd+cvXsx1kv2STr7wCd8RyPSs0YH+V
 /fRWGqn3nj9tWiihFo16iNAFzAXf/SETaUAVOcJ7Atd1rO1aulo8ojcvl2RqYA==
Date: Thu, 13 Mar 2025 16:14:11 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Michael Trimarchi
 <michael@amarulasolutions.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
Message-ID: <20250313161411.4604a1a1@booty>
In-Reply-To: <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
References: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
 <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgdttddvmedusggrjeemgeekfhejmedulegtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgdttddvmedusggrjeemgeekfhejmedulegthedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmrghrvgigseguvghngidruggvpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehmrggrr
 hhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
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

Hello Thomas,

On Thu, 13 Mar 2025 15:40:43 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> > @@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pdev)
> >   	 * located anywhere in RAM
> >   	 */
> >   	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
> > -	if (ret)
> > -		return dev_err_probe(&pdev->dev, ret,
> > -				     "can't kick out existing framebuffers\n");
> > +	if (ret) {
> > +		dev_err_probe(&pdev->dev, ret, "can't kick out existing framebuffers\n");
> > +		goto err_unload;
> > +	}  
> 
> I must have missed that when I reviewed the patch. But this call should 
> happen much earlier. right at the top of the probe function before 
> drm_dev_alloc(). Conflicting drivers need to be kicked out before 
> setting up DRM. Could you please send a patch to move the call to the 
> top? No extra cleanup would be required then.

Sure, sending v2 in a moment.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
