Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539E738A70
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57710E102;
	Wed, 21 Jun 2023 16:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1824 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jun 2023 16:07:26 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0270C10E102;
 Wed, 21 Jun 2023 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=UNTcJ7CGT1Lez3ibsb1q0hENK9CgDCucVIYKxGl3TOA=; b=kX5Xr6VI87reS7/GA49etmzzJa
 8UkZZawMQsboaJaBH0eNpIzk1bR3EcbBbU0KF6jAsbQhofPO8pHw+ovgkoxLGGJjfHxE1vVFC+buE
 dyHRIxHy1ZMVaryyek2UvdEHqUuLiwmWXnN8UhABnjwmxx9ilAZZaPSduE0A55vaKMZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qBzsX-00H9mp-GK; Wed, 21 Jun 2023 17:36:17 +0200
Date: Wed, 21 Jun 2023 17:36:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621054603.1262299-2-evan.quan@amd.com>
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
 tzimmermann@suse.de, alexander.deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 01:45:56PM +0800, Evan Quan wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
> 
> To mitigate this, AMD has introduced an ACPI based mechanism that
> devices can use to notify active use of particular frequencies so
> that devices can make relative internal adjustments as necessary
> to avoid this resonance.

Do only ACPI based systems have:

   interference of relatively high-powered harmonics of the (G-)DDR
   memory clocks with local radio module frequency bands used by
   Wifi 6/6e/7."

Could Device Tree based systems not experience this problem?

> +/**
> + * APIs needed by drivers/subsystems for contributing frequencies:
> + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
> + * If adding frequencies, then call `wbrf_add_exclusion` with the
> + * start and end points specified for the frequency ranges added.
> + * If removing frequencies, then call `wbrf_remove_exclusion` with
> + * start and end points specified for the frequency ranges added.
> + */
> +bool wbrf_supported_producer(struct acpi_device *adev);
> +int wbrf_add_exclusion(struct acpi_device *adev,
> +		       struct wbrf_ranges_in *in);
> +int wbrf_remove_exclusion(struct acpi_device *adev,
> +			  struct wbrf_ranges_in *in);

Could struct device be used here, to make the API agnostic to where
the information is coming from? That would then allow somebody in the
future to implement a device tree based information provider.

       Andrew
