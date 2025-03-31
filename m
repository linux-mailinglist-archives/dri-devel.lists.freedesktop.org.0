Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF8A76B5C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1BF10E435;
	Mon, 31 Mar 2025 15:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ecnURH+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C071410E435
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:56:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D699742D46;
 Mon, 31 Mar 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1743436591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2abXrR4+mWG+w1ZabCiucgs7zJIV275nfqlxRz+6dpk=;
 b=ecnURH+EgrNOfJqAbCnbQ0EtR5oarltkIX5/pZWQ7qgT7Jw6L3V3y9/D7+hZEseUKp7vwK
 XIUQOTwmd8ow4qiwEh+MU41cxdl4pJTgUlV5TMoq2ELiMU2hEo2I4oU7s/hJOCJi6UsLpj
 kD3xKkaPDxgwvVmNZzuNR//+rWOVLDQDR43v4TEY5xhPAd1bld5/Qk+SsRLGQpjzJTcuOs
 USwgVecUeg/IfVzaCR/saQAejx08g2jWPMa3/6ThcZZovUFd9SWtzkTXcT73gROSqma5s9
 oAvj/kjEemN+yJdyi7wh1n3ioPOamBvl8A+/AHUdF4n9oY29DwGxOHv1z9GJqg==
Date: Mon, 31 Mar 2025 17:56:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation
 in place of devm_kzalloc()
Message-ID: <20250331175625.505d616e@booty>
In-Reply-To: <CAN9Xe3SzU0AohuBnyJtE0UWFkrW0iMGKH1F8cuUZYLZ-vbfkpw@mail.gmail.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
 <20250328095351.7bac2d4d@booty>
 <CAN9Xe3SzU0AohuBnyJtE0UWFkrW0iMGKH1F8cuUZYLZ-vbfkpw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekieegtefhgeelieehhefgtdekffevgfegvdeggeelkeehjeetteethfevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeekrddvtdelrdejfedrudelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejkedrvddtledrjeefrdduleeipdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhin
 hhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
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

On Fri, 28 Mar 2025 12:09:08 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> On Fri, Mar 28, 2025 at 4:54=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com>
> wrote:
>=20
> > On Thu, 27 Mar 2025 10:55:42 -0400
> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> > =20
> > > Start using the new helper that does the refcounted
> > > allocations.
> > >
> > > v2: check error condition (Luca) =20
> >
> > Here as well, when you resend, move the changelog after the '---' line.
> >
> > =20
> Hadn't noticed this. Saw some other series that do follow this method. I
> will make this change.

That's the general rule [0], even though not all maintainers are strict
about this, so they sometimes get through.

[0] https://docs.kernel.org/process/submitting-patches.html#commentary

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
