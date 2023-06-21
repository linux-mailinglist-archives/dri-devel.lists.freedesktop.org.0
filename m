Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FB738B3C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0144B10E0FD;
	Wed, 21 Jun 2023 16:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CD910E0FD;
 Wed, 21 Jun 2023 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5dBxOnSqaP3QLEUj6Sd6hECMtB3+CNTVZ5h451XFYfA=; b=mL1RtX6Vd70D+UhrlC6/uRbPqV
 nt/7qe4B7Y10bRL5lxVeYQTGDr+wBCm+40cCVy6RFNrxk1KRRMEXzE1Eew42L0zBNv6Hchyluk12e
 R0KdVeO5Zb8bZKZRR/CK+3VfbY3f7MsCYNrBriSlwJipifTOZ5skrp77J3JSthSZtkFQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qC0jY-00HAET-Fg; Wed, 21 Jun 2023 18:31:04 +0200
Date: Wed, 21 Jun 2023 18:31:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <9435a928-04c4-442f-89f2-e76713c908a5@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
 <98c858e6-fb18-d50f-6eea-eddc63ba136f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98c858e6-fb18-d50f-6eea-eddc63ba136f@amd.com>
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
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I think there is enough details for this to happen. It's done
> so that either the AML can natively behave as a consumer or a
> driver can behave as a consumer.

> > > > > +/**
> > > > > + * APIs needed by drivers/subsystems for contributing frequencies:
> > > > > + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
> > > > > + * If adding frequencies, then call `wbrf_add_exclusion` with the
> > > > > + * start and end points specified for the frequency ranges added.
> > > > > + * If removing frequencies, then call `wbrf_remove_exclusion` with
> > > > > + * start and end points specified for the frequency ranges added.
> > > > > + */
> > > > > +bool wbrf_supported_producer(struct acpi_device *adev);
> > > > > +int wbrf_add_exclusion(struct acpi_device *adev,
> > > > > +		       struct wbrf_ranges_in *in);
> > > > > +int wbrf_remove_exclusion(struct acpi_device *adev,
> > > > > +			  struct wbrf_ranges_in *in);
> > > > Could struct device be used here, to make the API agnostic to where
> > > > the information is coming from? That would then allow somebody in the
> > > > future to implement a device tree based information provider.
> > > That does make sense, and it wouldn't even be that much harder if we
> > > assume in a given platform there's only one provider
> > That seems like a very reasonable assumption. It is theoretically
> > possible to build an ACPI + DT hybrid, but i've never seen it actually
> > done.
> > 
> > If an ARM64 ACPI BIOS could implement this, then i would guess the low
> > level bits would be solved, i guess jumping into the EL1
> > firmware. Putting DT on top instead should not be too hard.
> > 
> > 	Andrew
> 
> To make life easier I'll ask whether we can include snippets of
> the matching ASL for this first implementation as part of the
> public ACPI spec that matches this code when we release it.

So it sounds like you are pretty open about this, there should be
enough information for independent implementations. So please do make
the APIs between the providers and the consumers abstract, struct
device, not an ACPI object.

	Andrew
