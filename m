Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D79738CED
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A5A10E08B;
	Wed, 21 Jun 2023 17:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F2310E08B;
 Wed, 21 Jun 2023 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=xnUasspDrFh2JWpGqcDGD0SKHtZoehpVCtmFhJIxYiY=; b=aKQt3noraRaWZVrPLRFixFgDyF
 doLwBueYpIG4MOV+mgf9YgWlBBG2MzoCYzjDCdbHJLL0/GDopxL7uOPzCNq5iT+ghXm25qqhepAkk
 GZT/IuvRUl0B8HzrNqPhg3sL1OLk/dZE/c7AujarJ1ypiRLAwJUBDPAwkWgEDJfpjNYo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qC1VK-00HAZS-8l; Wed, 21 Jun 2023 19:20:26 +0200
Date: Wed, 21 Jun 2023 19:20:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <4aad8dfa-2eaa-4268-8c52-f0ec209e18f9@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
 <98c858e6-fb18-d50f-6eea-eddc63ba136f@amd.com>
 <9435a928-04c4-442f-89f2-e76713c908a5@lunn.ch>
 <d1e01e52-df5f-a595-eaa1-95466f7b4ff8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1e01e52-df5f-a595-eaa1-95466f7b4ff8@amd.com>
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

> Think a little more about what a non-ACPI implementation
> would look like:
> 
> 1) Would producers and consumers still need you to set CONFIG_ACPI_WBRF?

I would expect there to be an CONFIG_WBRF, and then under that a
CONFIG_WBRF_ACPI, CONFIG_WBRF_DT, CONFIG_WBRF_FOOBAR, each indicating
they are mutual exclusive to the other.

> 2) How would you indicate you need WBRF support?

As far as i understand it, you have something in ACPI which indicates
it? Could that not also be a DT property?

> 3) How would notifications from one device to another work?

Linux notified chains? This is something which happens a lot in
networking. A physical interface goes down and needs to tell
team/bonding interface stack on top of it that its status has
changed. It just calls a notification chain.

> I don't think those are trivial problems that can be solved by
> just making the pointer 'struct device' particularly as with the
> ACPI implementation consumers are expecting the notification from
> ACPI.

Do consumers really care who the notification is from? Isn't the event
and its content what matters, not who sent it?

But I agree, i don't expect it is trivial. But it is going to get
harder and harder to make abstract as more and more users are
added. So we need to consider, do you want to do that work now, or
later? Do we want to merge something we know is limited and not using
the generic kernel abstractions?

     Andrew
