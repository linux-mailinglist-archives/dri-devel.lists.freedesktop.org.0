Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CB7389D3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B039410E4CD;
	Wed, 21 Jun 2023 15:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D4310E4CD;
 Wed, 21 Jun 2023 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=OhDuVypSV/dK9LdiPPdtSdnbSPSPgh1jOUoeh6hEOp4=; 
 t=1687362019; x=1688571619; b=lV9pdqOMVwcSnUVUpLlZELz6dVFTPhSEH25y2NWVNimkHe4
 mHSbnjPyR9JdW2KfKfXNxogU5f1CgtQY6XfMyjxBVHFyHM1J5AovIkmLjCXqr9qHUgNUTbBZ3yFw1
 9rOUQ5/ph1VbmBPUTEdtAGOP+O3LPz8xJ+kpUXMtf1j1sxAxWywl9VTZe8cKn93/FRqAPfdtvvKZn
 uRj+jlaShBKSU1b3JcE3tNvpdiBWi3dH2YRpuyBMNMb5656Hwc/N+SGCOrCXZmWmcFj7zQpODPBuV
 WnY21ZlLAZq7FI987Nq/x/ypSI9iA7iPzOZkquAhZotJQfmFb2h9mnSAXt4waozQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qBzvq-00DkED-2Q; Wed, 21 Jun 2023 17:39:42 +0200
Message-ID: <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
From: Johannes Berg <johannes@sipsolutions.net>
To: Andrew Lunn <andrew@lunn.ch>, Evan Quan <evan.quan@amd.com>
Date: Wed, 21 Jun 2023 17:39:41 +0200
In-Reply-To: <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
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
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, christian.koenig@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-06-21 at 17:36 +0200, Andrew Lunn wrote:
> On Wed, Jun 21, 2023 at 01:45:56PM +0800, Evan Quan wrote:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> >=20
> > Due to electrical and mechanical constraints in certain platform design=
s
> > there may be likely interference of relatively high-powered harmonics o=
f
> > the (G-)DDR memory clocks with local radio module frequency bands used
> > by Wifi 6/6e/7.
> >=20
> > To mitigate this, AMD has introduced an ACPI based mechanism that
> > devices can use to notify active use of particular frequencies so
> > that devices can make relative internal adjustments as necessary
> > to avoid this resonance.
>=20
> Do only ACPI based systems have:
>=20
>    interference of relatively high-powered harmonics of the (G-)DDR
>    memory clocks with local radio module frequency bands used by
>    Wifi 6/6e/7."
>=20
> Could Device Tree based systems not experience this problem?

They could, of course, but they'd need some other driver to change
_something_ in the system? I don't even know what this is doing
precisely under the hood in the ACPI BIOS, perhaps it adjusts the DDR
memory clock frequency in response to WiFi using a frequency that will
cause interference with harmonics.


> > +/**
> > + * APIs needed by drivers/subsystems for contributing frequencies:
> > + * During probe, check `wbrf_supported_producer` to see if WBRF is sup=
ported.
> > + * If adding frequencies, then call `wbrf_add_exclusion` with the
> > + * start and end points specified for the frequency ranges added.
> > + * If removing frequencies, then call `wbrf_remove_exclusion` with
> > + * start and end points specified for the frequency ranges added.
> > + */
> > +bool wbrf_supported_producer(struct acpi_device *adev);
> > +int wbrf_add_exclusion(struct acpi_device *adev,
> > +		       struct wbrf_ranges_in *in);
> > +int wbrf_remove_exclusion(struct acpi_device *adev,
> > +			  struct wbrf_ranges_in *in);
>=20
> Could struct device be used here, to make the API agnostic to where
> the information is coming from? That would then allow somebody in the
> future to implement a device tree based information provider.

That does make sense, and it wouldn't even be that much harder if we
assume in a given platform there's only one provider - but once you go
beyond that these would need to call function pointers I guess? Though
that could be left for "future improvement" too.

johannes
