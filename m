Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF09B738B8B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676D10E31C;
	Wed, 21 Jun 2023 16:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAC110E31C;
 Wed, 21 Jun 2023 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=OdFzun0L0/e6r02A+DrKv3kwszx3coOMwNXnVWRuYqM=; 
 t=1687365483; x=1688575083; b=CiZlMYI5eodDhOCG8uQfP+FzDma6nTHFGTs0na7tZp0TFqi
 ONYi1bECR0aFttbp7BmzYpYMYYBSpeYp0WF+A22BanUWS+x9Sb6YRjJfgXBv2w4YZD822cj7hcQUL
 ECy3DN4kpRyMGP14HqT66lA4JEdzd2rGWVA9sktV3iBAoNslklxuQChMlbtGlENcxxu1lpXmP0Hk4
 BhwCACzCBPrv2HaXyv1OkXotnp+NYE3iWM0bjwcPnMbQIe10blYe+VG0PQ4yyTxwiFrzDl4FZaJFe
 XLuz9xyxmb1k5bm7t1sKuENe2F8AkvCELVg9GHaKpGqYnRSsicpESeRtRHgmkbbg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qC0pt-00Dltw-2s; Wed, 21 Jun 2023 18:37:38 +0200
Message-ID: <aca10d753183508672739e8b6668d41ce2cdaf80.camel@sipsolutions.net>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
From: Johannes Berg <johannes@sipsolutions.net>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 21 Jun 2023 18:37:36 +0200
In-Reply-To: <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-06-21 at 18:14 +0200, Andrew Lunn wrote:
> > > Do only ACPI based systems have:
> > >=20
> > > =C2=A0=C2=A0=C2=A0interference of relatively high-powered harmonics o=
f the (G-)DDR
> > > =C2=A0=C2=A0=C2=A0memory clocks with local radio module frequency ban=
ds used by
> > > =C2=A0=C2=A0=C2=A0Wifi 6/6e/7."
> > >=20
> > > Could Device Tree based systems not experience this problem?
> >=20
> > They could, of course, but they'd need some other driver to change
> > _something_ in the system? I don't even know what this is doing
> > precisely under the hood in the ACPI BIOS
>=20
> If you don't know what it is actually doing, it suggests the API is
> not very well defined.

I wouldn't say that. At the level it's defined now, the API is very
clear: the wifi subsystem tells the other side what channels it's
operating on right now.

> Is there even enough details that ARM64 ACPI
> BIOS could implement this?=20

This, in itself? No. You'd have to know about the physical
characteristics of the system, what is actually causing interference and
at what frequencies and of course what you can actually do to mitigate
(such as adjusting clock frequencies.)

But as an API? I'd think yes, since WiFi can't really move off a
frequency, other than disconnect, anyway.


> > > > +bool wbrf_supported_producer(struct acpi_device *adev);
> > > > +int wbrf_add_exclusion(struct acpi_device *adev,
> > > > +		       struct wbrf_ranges_in *in);
> > > > +int wbrf_remove_exclusion(struct acpi_device *adev,
> > > > +			  struct wbrf_ranges_in *in);
> > >=20
> > > Could struct device be used here, to make the API agnostic to where
> > > the information is coming from? That would then allow somebody in the
> > > future to implement a device tree based information provider.
> >=20
> > That does make sense, and it wouldn't even be that much harder if we
> > assume in a given platform there's only one provider
>=20
> That seems like a very reasonable assumption. It is theoretically
> possible to build an ACPI + DT hybrid, but i've never seen it actually
> done.

OK.

> If an ARM64 ACPI BIOS could implement this, then i would guess the low
> level bits would be solved, i guess jumping into the EL1
> firmware. Putting DT on top instead should not be too hard.

Right.


Maybe then this really shouldn't be called "wbrf", but maybe naming
doesn't matter that much :)

johannes
