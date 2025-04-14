Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF5A87B57
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 11:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3956610E4F4;
	Mon, 14 Apr 2025 09:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="h2ibYs9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E72110E4F4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 09:03:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 22F365840A4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:17:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 490B54314D;
 Mon, 14 Apr 2025 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744618651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaJd3GfmIN1FF9Nfj5/3nKeIWUdNKoVByIZIbP92ZZs=;
 b=h2ibYs9nUqdmwXSfBkha5wwKX89e0Na2JsReubQd38M98wrSVDTX/1v18O9D0IcbkD7Iv2
 VifJvoIxVm7C7tmQF2yeF7Wgtwn/b3JU9zuvcf5G+uh6U2PSbw0AO3Iv0DcJeMzdIDGDk/
 5Z7ZiRu9YzVaDmeh/Z8+YQCFutv458m3+AuAb0xY+YX9vmG5cH43GwfyKIbt5s/jxfnAkv
 +OrMIlZTEvrEIP9y1m8wUyyWwZ2iAiZBs/ahOy2+3ujAaZ+znrW6SRtYyCRrv9zp+8lV79
 gxvpZn8Vueb7yhZIDxZ3lMMrjxkw4yP43zpdNcKf/bXgU2fUfUoHtM3x1aKDjg==
Date: Mon, 14 Apr 2025 10:17:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <20250414101729.598c1422@windsurf>
In-Reply-To: <45bbee88-0446-4773-a4b6-d19a1747c43f@amd.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
 <20250410214307.361e373f@windsurf>
 <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
 <60e2d844-418a-4bde-b6ef-76d10448d5ec@bootlin.com>
 <45bbee88-0446-4773-a4b6-d19a1747c43f@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddttdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
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

Hello Christian,

On Fri, 11 Apr 2025 14:41:56 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> But anyway please note that when you want to create new UAPI you need
> to provide an open source user of it. E.g. link to a repository or
> something similar in the covert letter should do it.

Could you clarify what is the "reference" user-space user of UIO that
exists today?

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
