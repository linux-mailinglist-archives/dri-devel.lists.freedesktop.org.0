Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D2ACC1AA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 10:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FD510E69F;
	Tue,  3 Jun 2025 08:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 570 seconds by postgrey-1.36 at gabe;
 Tue, 03 Jun 2025 08:05:45 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73CF210E69F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 08:05:45 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 409E4E74071; Tue,  3 Jun 2025 09:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from [192.168.178.25] (a89-182-71-6.net-htp.de [89.182.71.6])
 by lynxeye.de (Postfix) with ESMTPSA id 4D19BE74067;
 Tue,  3 Jun 2025 09:56:04 +0200 (CEST)
Message-ID: <38974e3c6c7933166c19fb8d93bf20020e159a81.camel@lynxeye.de>
Subject: Re: ttm vs aarch64 mappings
From: Lucas Stach <dev@lynxeye.de>
To: Dave Airlie <airlied@gmail.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Will
 Deacon <will@kernel.org>
Date: Tue, 03 Jun 2025 09:56:04 +0200
In-Reply-To: <CAPM=9ty3STCUsa=a06RzNvHD+SbTONPVqpA9UEp6=tgt9+fYHg@mail.gmail.com>
References: <CAPM=9tx++LWvKMfS556+CDcw-bWxf6vD6JtiwpAjspuc7Qeh_A@mail.gmail.com>
 <c2571f57-3be4-4f8a-b442-b8f01dc5979f@amd.com>
 <CAPM=9ty3STCUsa=a06RzNvHD+SbTONPVqpA9UEp6=tgt9+fYHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
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

Am Dienstag, dem 03.06.2025 um 06:37 +1000 schrieb Dave Airlie:
> On Mon, 2 Jun 2025 at 21:51, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>=20
> [...]
> >=20
> > > Has anyone else come across this problem with TTM on aarch64? or
> > > understand if I'm missing something.
> >=20
> > If I'm not completely mistaken both pgprot_dmacoherent and pgprot_write=
combine map to MT_NORMAL_NC because there is no such thing as uncached syst=
em memory without write combining on aarch64.
> >=20
> > I mean why would you want to do this except for getting the MMIO write =
ordering right? Avoiding write memory barriers?
>=20
> I'm not 100% sure why tegra does it in the first place, I suspect
> working around lack of knowledge on what is correct and just hey this
> works, so move on.
>=20
As long as you directly map the pages in RAM writecombine is absolutely
fine for Tegra. However, at some point the Tegra implementation did map
BOs through the "VRAM" access BAR of the GPU, which isn't able to deal
with bufferable mappings for some reason (at least that was the case on
GK20A). I'm not sure how things are working right now, it's a long time
since I last looked into this code.

Regards,
Lucas
