Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63409738D09
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB3A10E33D;
	Wed, 21 Jun 2023 17:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2340A10E33D;
 Wed, 21 Jun 2023 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=NF4zBEcDJi5tK0sppmgQglo0yCtgkMekDJXsqP9rEWE=; b=Bj
 wtzUPDYzEuK/cPE63zmLaBg+84ZmbmNgB6BNQFl+zDi7yR3PBotkqT5cO0Rw4Zs01JumJhGvsda8M
 hfsFwp2aUhIyOyM/tKJcRB1AH20PAn3ZFxI0O58LMFr0UKnetCw5PNAO7I7RWUWS48DtfqURQaQji
 ngzUFUlEIePNV/o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qC1ar-00HAax-FK; Wed, 21 Jun 2023 19:26:09 +0200
Date: Wed, 21 Jun 2023 19:26:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
 <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
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

> I think what you're asking for is another layer of indirection
> like CONFIG_WBRF in addition to CONFIG_ACPI_WBRF.
> 
> Producers would call functions like wbrf_supported_producer()
> where the source file is not guarded behind CONFIG_ACPI_WBRF,
> but instead by CONFIG_WBRF and locally use CONFIG_ACPI_WBRF within
> it.  So a producer could look like this:
> 
> bool wbrf_supported_producer(struct device *dev)
> {
> #ifdef CONFIG_ACPI_WBRF
>     struct acpi_device *adev = ACPI_COMPANION(dev);
> 
>     if (adev)
>         return check_acpi_wbrf(adev->handle,
>                        WBRF_REVISION,
>                        1ULL << WBRF_RECORD);
> #endif
>     return -ENODEV;
> 
> }
> EXPORT_SYMBOL_GPL(wbrf_supported_producer);
> 
> And then adding/removing could look something like this
> 
> int wbrf_add_exclusion(struct device *dev,
>                struct wbrf_ranges_in *in)
> {
> #ifdef CONFIG_ACPI_WBRF
>     struct acpi_device *adev = ACPI_COMPANION(dev);
> 
>     if (adev)
>         return wbrf_record(adev, WBRF_RECORD_ADD, in);
> #endif
>     return -ENODEV;
> }
> EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
> 
> int wbrf_remove_exclusion(struct device *dev,
>                struct wbrf_ranges_in *in)
> {
> #ifdef CONFIG_ACPI_WBRF
>     struct acpi_device *adev = ACPI_COMPANION(dev);
> 
>     if (adev)
>         return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
> #endif
>     return -ENODEV;
> }
> EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);

Yes, this looks a lot better.

But what about notifications?

    Andrew
