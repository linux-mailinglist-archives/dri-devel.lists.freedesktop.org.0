Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA398D028
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C113A10E6DB;
	Wed,  2 Oct 2024 09:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="QuJwwvjC";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zj8iDjWg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2024 09:31:13 UTC
Received: from flow-a5-smtp.messagingengine.com
 (flow-a5-smtp.messagingengine.com [103.168.172.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89810E6DB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:31:13 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailflow.phl.internal (Postfix) with ESMTP id E8846200A49;
 Wed,  2 Oct 2024 05:23:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 02 Oct 2024 05:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1727861038;
 x=1727868238; bh=1wPBV2CtAfCxsHt6vXI1u7/VDJf3lNbwZEi9inaErLs=; b=
 QuJwwvjCXMBstSyTt2ibEcamIo2+Gkt90Ah/ZbVHiRDstxzJJXbaBPREgIPVQtDu
 2IQiferN53Cm6St7whHPmdOCIlFeTyrYcZh/Jq5IaR4X2z0nLmCCK2vvAbrFN9rt
 lT/tFrFbm+KWuL247BtXQUEfIGOPGehSxO+9/ABynpifTYx+GAksIzfxFLCQ54R1
 s5QxcZ2/UqX2aXxtCNwx4tq6XiUlKOTGLG+BOT4jkGtCdhQbyX2DsgpgmxSpF/Ve
 QAKm1uce+DWccvFZOglfv8Ox/9gYmH4BTuJzVG9yK+UiPTcNGfGvVt5tVhSSd0e8
 B7Ekv3pmNSUowCLWbXl46A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727861038; x=
 1727868238; bh=1wPBV2CtAfCxsHt6vXI1u7/VDJf3lNbwZEi9inaErLs=; b=Z
 j8iDjWgaTEBk3vDijGRlGTVogBTQiUXXfbABiYMbBTTwj53/TxFN6jMfBAjEpT0b
 3Lo4uFHvEZwkNx00/qRGgjmM2pDH4DCzosU7CI7FDnVbtKCEUi6F5hmwD0DqLY5L
 U7/OTcXTNl3aV9mcgutaovqICSjQv0nHnZP0CKfDwceqJo0YX5BpcgWmkgDeyfod
 KSTzeTNoiyddV08Tom4/QXVInro66UeWqW0yjiUAJtF+ZVFGZbRNpCcp5qJ+pF/O
 5rX5MIpFo6tEi9gmu4xvqdbtcGa7Iv/O+uSvcoxbjI1/abVZDhLPwGhZRpKzZ9cI
 qVGJK+VbypI97CYT/ArJw==
X-ME-Sender: <xms:LRH9Zsk_WXCJbPDRc2vNMGPlguniQZhgwM-wdwKir_XUfkd0zKe-Uw>
 <xme:LRH9Zr3akGgxBjqqxq3WB0wyBxE2Y4Xru-zWIcrO-2kxO6nmcGOMy9asyMHh6TAif
 aviRRCyts7heQ>
X-ME-Received: <xmr:LRH9ZqpIzy1iQYkrdNhrVZ-Nq_saUdDrSpOUkyPCIlq6QbFdVss64OeuNNPkw6g1qGyhL9gosugMwpIFHtjUaFCdl98zqbJ28fgkoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
 necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
 frrghtthgvrhhnpeehfffftdehkeevfeeujeduhefggfetffeijefgkeelffdtjeefhedt
 tdfffeffueenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtgho
 mhdpnhgspghrtghpthhtohepgedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
 hmrghrkhhushdrvghlfhhrihhnghesfigvsgdruggvpdhrtghpthhtoheplhgrnhiirghn
 ohdrrghlvgigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgvhhguihdrughjrghith
 essghoohhtlhhinhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhs
 rdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
 hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphifmhesvhhg
 vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmh
 gvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgt
 phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnh
 hivghlsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:LRH9ZokYJmotGcGhC28P1JQ0SfIfGOhWrLJ4ei_uog9Hep3W-u2ZVA>
 <xmx:LRH9Zq1M0xTfph_85-Qn3YiyB140f5sId7AuT9Atf4uE0fREMzbOHQ>
 <xmx:LRH9ZvuvPeu2RSpNdmtow7zR36WzX-imbT-NLcyUAbF6GvPvpMicFA>
 <xmx:LRH9ZmUBYe0IbYVvg1kRfj_5jZOkQEHBGaO113FTK9qTPjORkr3QcQ>
 <xmx:LhH9ZgVnyXxYwMI2ap2i61BR4vYQUGzIXKqLe69Xv4COkBz9kONmCKLb>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:23:56 -0400 (EDT)
Date: Wed, 2 Oct 2024 11:23:54 +0200
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v8 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <2024100246-gladly-overfed-75b9@gregkh>
References: <20241002033807.682177-3-lanzano.alex@gmail.com>
 <b671e4d2-e969-4b9a-a7ff-b3b688689ee8@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b671e4d2-e969-4b9a-a7ff-b3b688689ee8@web.de>
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

On Wed, Oct 02, 2024 at 10:56:42AM +0200, Markus Elfring wrote:
> …
> > +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> > @@ -0,0 +1,681 @@
> …
> > +static int sharp_memory_maintain_display(struct sharp_memory_device *smd)
> > +{
> …
> > +	u8 *tx_buffer = smd->tx_buffer;
> > +
> > +	mutex_lock(&smd->tx_mutex);
> …
> > +	mutex_unlock(&smd->tx_mutex);
> > +
> > +	return ret;
> > +}
> …
> 
> Will development interests grow for the application of a statement
> like “guard(mutex)(&smd->tx_mutex);”?
> https://elixir.bootlin.com/linux/v6.12-rc1/source/include/linux/mutex.h#L201


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
