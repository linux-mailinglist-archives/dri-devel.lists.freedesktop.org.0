Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D568975143B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F1410E5EE;
	Wed, 12 Jul 2023 23:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A86910E5EE;
 Wed, 12 Jul 2023 23:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Y5SzVlzKIJDGUT9EANNyQG9MJsCdwH/wBupzje6OdiM=; b=qhP8b1q/52VMiBvnIqhcAYbjNx
 zbmKTamtufBzg+FG6s1+PVEzoqOJ204eV2UElZ37KrbQLYVyDSiK3GxXP0qars3wTrekPxYD75yqo
 /kzmMYfzIweYsm5sAkfnZyOWVOglsadzHxqCcH5EKZlU5o7VwRpv0YvWNw5bim8GYR/E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qJj08-001BOI-Go; Thu, 13 Jul 2023 01:12:04 +0200
Date: Thu, 13 Jul 2023 01:12:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
Message-ID: <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
References: <20230710083641.2132264-1-evan.quan@amd.com>
 <20230710083641.2132264-2-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710083641.2132264-2-evan.quan@amd.com>
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
 trix@redhat.com, Lijo.Lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com, Mario.Limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, Christian.Koenig@amd.com,
 tzimmermann@suse.de, Alexander.Deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +/**
> + * wbrf_supported_producer - Determine if the device can report frequencies
> + *
> + * @dev: device pointer
> + *
> + * WBRF is used to mitigate devices that cause harmonic interference.
> + * This function will determine if this device needs to report such frequencies.

How is the WBRF core supposed to answer this question? That it knows
there is at least one device which has registered with WBRF saying it
can change its behaviour to avoid causing interference?

Rather than "Determine if the device can report frequencies" should it be
"Determine if the device should report frequencies"

A WiFi device can always report frequencies, since it knows what
frequency is it currently using. However, it is pointless making such
reports if there is no device which can actually make use of the
information. 

> +bool wbrf_supported_producer(struct device *dev)
> +{
> +	return true;
> +}

I found the default implementation of true being odd. It makes me
wounder, what is the point of this call. I would expect this to see if
a linked list is empty or not.

> +/**
> + * wbrf_supported_consumer - Determine if the device can react to frequencies

This again seems odd. A device should know if it can react to
frequencies or not. WBRF core should not need to tell it. What makes
more sense to me is that this call is about a device telling the WBRF
core it is able to react to frequencies. The WBRF core then can give a
good answer to wbrf_supported_producer(), yes, i know of some other
device who might be able to do something to avoid causing interference
to you, so please do tell me about frequencies you want to use.

What is missing here in this API is policy information. The WBRF core
knows it has zero or more devices which can report what frequencies
they are using, and it has zero or more devices which maybe can do
something. But then you need policy to say this particular board needs
any registered devices to actually do something because of poor
shielding. Should this policy be as simple as a bool, or should it
actually say the board has shielding issues for a list of frequencies?
I think the answer to what will depend on the cost of taking action
when no action is actually required.

> + * wbrf_register_notifier - Register for notifications of frequency changes
> + *
> + * @nb: driver notifier block
> + *
> + * WBRF is used to mitigate devices that cause harmonic interference.
> + * This function will allow consumers to register for frequency notifications.
> + */
> +int wbrf_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&wbrf_chain_head, nb);
> +}

What are the timing requirements for the handler? Should the handler
block until the device has finished doing what it needs to do and the
frequency response has settled? We don't want the WiFi device doing a
SNR measurement until we know local noise is at a minimum. I think it
would be good to document things like this here.

> +struct wbrf_ranges_out {
> +	u32			num_of_ranges;
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +} __packed;

Seems odd using packed here. It is the only structure which is
packed. I would also move the u32 after the struct so it is naturally
aligned on 64 bit systems.

	Andrew
