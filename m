Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D07445B5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 02:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8938910E50D;
	Sat,  1 Jul 2023 00:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731F910E50D;
 Sat,  1 Jul 2023 00:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=q5d9fk0Kq4PVVfrVMmslbF5d31U7oc6/SS2DxBc28Hc=; b=vs8MTtvSbbgjYrbJogrzb1pxKW
 JK+3fztnoVP53vLCXM0f7H6wjh4BpPRl3jsGz6wJhz7u2qPekaJMCnkf1U7Sfv33U2UCDK/9LE3wh
 HdIAvAfxZ2goU2mx+r47OvElcUZKdaYBNRqpXI070OqEfM85L31oqAhbxqcWH7y0fOUQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qFOpe-000LRM-Vz; Sat, 01 Jul 2023 02:51:22 +0200
Date: Sat, 1 Jul 2023 02:51:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V5 2/9] driver core: add ACPI based WBRF mechanism
 introduced by AMD
Message-ID: <4b2d5e30-1962-40f4-8c36-bfc35eba503c@lunn.ch>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-3-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630103240.1557100-3-evan.quan@amd.com>
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

> +	argv4 = kzalloc(sizeof(*argv4) * (2 * num_of_ranges + 2 + 1), GFP_KERNEL);
> +	if (!argv4)
> +		return -ENOMEM;
> +
> +	argv4[arg_idx].package.type = ACPI_TYPE_PACKAGE;
> +	argv4[arg_idx].package.count = 2 + 2 * num_of_ranges;
> +	argv4[arg_idx++].package.elements = &argv4[1];
> +	argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> +	argv4[arg_idx++].integer.value = num_of_ranges;
> +	argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> +	argv4[arg_idx++].integer.value = action;

There is a lot of magic numbers in that kzalloc. It is being used as
an array, kcalloc() would be a good start to make it more readable.
Can some #define's be used to explain what the other numbers mean?

> +	/*
> +	 * Bit 0 indicates whether there's support for any functions other than
> +	 * function 0.
> +	 */

Please make use of the BIT macro to give the different bits
informative names.

> +	if ((mask & 0x1) && (mask & funcs) == funcs)
> +		return true;
> +
> +	return false;
> +}
> +

> +int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> +				      struct wbrf_ranges_out *out)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	union acpi_object *obj;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	obj = acpi_evaluate_wbrf(adev->handle,
> +				 WBRF_REVISION,
> +				 WBRF_RETRIEVE);
> +	if (!obj)
> +		return -EINVAL;
> +
> +	WARN(obj->buffer.length != sizeof(*out),
> +		"Unexpected buffer length");
> +	memcpy(out, obj->buffer.pointer, obj->buffer.length);

You WARN, and then overwrite whatever i passed the end of out?  Please
at least use min(obj->buffer.length, sizeof(*out)), but better still:

   if (obj->buffer.length != sizeof(*out)) {
         dev_err(dev, "BIOS FUBAR, ignoring wrong sized WBRT information");
	 return -EINVAL;
   }

> +#if defined(CONFIG_WBRF_GENERIC)
>  static struct exclusion_range_pool wbrf_pool;
>  
>  static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in)
> @@ -89,6 +92,7 @@ static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
>  
>  	return 0;
>  }
> +#endif

I was expecting you would keep these tables, and then call into the
BIOS as well. Having this table in debugfs seems like a useful thing
to have for debugging the BIOS.

> +#ifdef CONFIG_WBRF_AMD_ACPI
> +#else
> +static inline bool
> +acpi_amd_wbrf_supported_consumer(struct device *dev) { return false; }
> +static inline bool
> +acpi_amd_wbrf_supported_producer(struct device *dev) {return false; }
> +static inline int
> +acpi_amd_wbrf_remove_exclusion(struct device *dev,
> +			       struct wbrf_ranges_in *in) { return -ENODEV; }
> +static inline int
> +acpi_amd_wbrf_add_exclusion(struct device *dev,
> +			    struct wbrf_ranges_in *in) { return -ENODEV; }
> +static inline int
> +acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> +				  struct wbrf_ranges_out *out) { return -ENODEV; }

Do you actually need these stub versions?

	Andrew
