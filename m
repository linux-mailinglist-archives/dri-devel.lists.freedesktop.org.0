Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3074457E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 02:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CAA10E504;
	Sat,  1 Jul 2023 00:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E4710E500;
 Sat,  1 Jul 2023 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=RSoC/5hYUUQ3sGJr52lBB+aV7IzoV8b72rkry2pxCQg=; b=yAyplwTga+cJQhNVxS4WCa0avC
 XATcUdMc7wgQTO46g7k9dcH2lTxfJGRCofunObU6mN+84w113eNMP2VoKVQEFW1R1wTRQT0i64hLW
 KT9C9WzHFOqZAlNELVDobW+4G2P/rybEr2j3erhGyjDcrRq59amX2UprnR8BcrFLmzDQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qFOKp-000LM8-66; Sat, 01 Jul 2023 02:19:31 +0200
Date: Sat, 1 Jul 2023 02:19:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Message-ID: <7e7db6eb-4f46-407a-8d1f-16688554ad80@lunn.ch>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630103240.1557100-2-evan.quan@amd.com>
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

> Drivers/subsystems contributing frequencies:
> 
> 1) During probe, check `wbrf_supported_producer` to see if WBRF supported
>    for the device.

What is the purpose of this stage? Why would it not be supported for
this device?

> +#ifdef CONFIG_WBRF
> +bool wbrf_supported_producer(struct device *dev);
> +int wbrf_add_exclusion(struct device *adev,
> +		       struct wbrf_ranges_in *in);
> +int wbrf_remove_exclusion(struct device *dev,
> +			  struct wbrf_ranges_in *in);
> +int wbrf_retrieve_exclusions(struct device *dev,
> +			     struct wbrf_ranges_out *out);
> +bool wbrf_supported_consumer(struct device *dev);
> +
> +int wbrf_register_notifier(struct notifier_block *nb);
> +int wbrf_unregister_notifier(struct notifier_block *nb);
> +#else
> +static inline bool wbrf_supported_producer(struct device *dev) { return false; }
> +static inline int wbrf_add_exclusion(struct device *adev,
> +				     struct wbrf_ranges_in *in) { return -ENODEV; }
> +static inline int wbrf_remove_exclusion(struct device *dev,
> +					struct wbrf_ranges_in *in) { return -ENODEV; }

The normal aim of stubs is that so long as it is not expected to be
fatal if the functionality is missing, the caller should not care if
it is missing. So i would expect these to return 0, indicating
everything worked as expected.

> +static inline int wbrf_retrieve_exclusions(struct device *dev,
> +					   struct wbrf_ranges_out *out) { return -ENODEV; }

This is more complex. Ideally you want to return an empty set, so
there is nothing to do. So i think the stub probably wants to do a
memset and then return 0.

> +static inline bool wbrf_supported_consumer(struct device *dev) { return false; }
> +static inline int wbrf_register_notifier(struct notifier_block *nb) { return -ENODEV; }
> +static inline int wbrf_unregister_notifier(struct notifier_block *nb) { return -ENODEV; }

And these can just return 0.

    Andrew
