Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B45738A94
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5067910E20F;
	Wed, 21 Jun 2023 16:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C8810E20F;
 Wed, 21 Jun 2023 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ik7rJHaj1qzSs2X3MBG7iKEMNpHmxnSx/M+1Kzp2joY=; b=otdvDzqfkar6RS4pYFoDbzEzpq
 JiN4CSjoBZNtghkEbKsI1RX5gmvM6tiW/Dr566PB7PEyCctqx8zFajPymPf5MymYszlRGwSq3Tc3g
 GxqLybgBqao4pj6kJIszUNHKhsoeVIC/m4p07vccvLnZp/FBUW1D6/54RdI4ADtXNYW8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qC0T5-00HA64-GG; Wed, 21 Jun 2023 18:14:03 +0200
Date: Wed, 21 Jun 2023 18:14:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
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

> > Do only ACPI based systems have:
> > 
> >    interference of relatively high-powered harmonics of the (G-)DDR
> >    memory clocks with local radio module frequency bands used by
> >    Wifi 6/6e/7."
> > 
> > Could Device Tree based systems not experience this problem?
> 
> They could, of course, but they'd need some other driver to change
> _something_ in the system? I don't even know what this is doing
> precisely under the hood in the ACPI BIOS

If you don't know what it is actually doing, it suggests the API is
not very well defined. Is there even enough details that ARM64 ACPI
BIOS could implement this? 

> > > +/**
> > > + * APIs needed by drivers/subsystems for contributing frequencies:
> > > + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
> > > + * If adding frequencies, then call `wbrf_add_exclusion` with the
> > > + * start and end points specified for the frequency ranges added.
> > > + * If removing frequencies, then call `wbrf_remove_exclusion` with
> > > + * start and end points specified for the frequency ranges added.
> > > + */
> > > +bool wbrf_supported_producer(struct acpi_device *adev);
> > > +int wbrf_add_exclusion(struct acpi_device *adev,
> > > +		       struct wbrf_ranges_in *in);
> > > +int wbrf_remove_exclusion(struct acpi_device *adev,
> > > +			  struct wbrf_ranges_in *in);
> > 
> > Could struct device be used here, to make the API agnostic to where
> > the information is coming from? That would then allow somebody in the
> > future to implement a device tree based information provider.
> 
> That does make sense, and it wouldn't even be that much harder if we
> assume in a given platform there's only one provider

That seems like a very reasonable assumption. It is theoretically
possible to build an ACPI + DT hybrid, but i've never seen it actually
done.

If an ARM64 ACPI BIOS could implement this, then i would guess the low
level bits would be solved, i guess jumping into the EL1
firmware. Putting DT on top instead should not be too hard.

	Andrew
