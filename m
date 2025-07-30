Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF274B162D3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7F410E6AB;
	Wed, 30 Jul 2025 14:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E3610E6AB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:30:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uh7pE-0006Et-41; Wed, 30 Jul 2025 16:30:36 +0200
Message-ID: <e58546c244fcea7d418879edf8d899393f6bd5bb.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: Fix flush sequence logic
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Russell King
 <linux+etnaviv@armlinux.org.uk>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,  Guido
 =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Date: Wed, 30 Jul 2025 16:30:34 +0200
In-Reply-To: <CAH9NwWfMCYKFF6Z+XiV9=4BANeyPk6bgNV_8FYM0cGwXuyDSxw@mail.gmail.com>
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
 <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
 <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
 <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
 <CAH9NwWfMCYKFF6Z+XiV9=4BANeyPk6bgNV_8FYM0cGwXuyDSxw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Christian,

Am Montag, dem 28.07.2025 um 00:28 +0200 schrieb Christian Gmeiner:
> Hi Lucas,
>=20
> > > > We should be comparing the last submitted sequence number with that=
 of
> > > > the address space we may be switching to.
> > > >=20
> > > This isn't the relevant change here though: if we switch the address
> > > space, the comparison is moot, as we do a full flush on AS switch
> > > anyway. The relevant change is that with the old code we would record
> > > the flush sequence of the AS we switch away from as the current flush
> > > sequence, so we might miss a necessary flush on the next submission i=
f
> > > that one doesn't require a AS switch, but would only flush based on
> > > sequence mismatch.
> >=20
> > Ah, you are right.
> >=20
> > > Mind if I rewrite the commit message along those lines while applying=
?
> >=20
>=20
> Now that v6.16 has been tagged, I was wondering why this patch didn=E2=80=
=99t make
> it into this release. From the timeline, it seemed like there was
> enough time for it
> to be included, so I=E2=80=99m just trying to understand if it was overlo=
oked
> or deferred for a reason.
>=20
That's 100% on me. I've applied the patch with the reworded commit
message into my repo, but then didn't push it out as I was planning on
batching this with some other patches. This didn't happen due to other
tasks pushing this down in my priority list.

> I also haven=E2=80=99t seen any recent activity at
> https://git.pengutronix.de/cgit/lst/linux/, which
> made me unsure about the current status of patch queue handling.
>=20
Yea, the current workflow of funneling things through this repository
doesn't work too well for the occasional small fix/patch. It works okay
as long as there are some more patches queued, but small patches tend
to get deferred for too long.
I'm pondering the idea of applying small fixes directly into drm-misc
to get them on a more predictable schedule to upstream. This will
require some changes to my workflow and I'll probably announce this via
a appropriate change to MAINTAINERS, as soon as I'm ready to make the
switch.

Regards,
Lucas
