Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E5240388
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C426E3AE;
	Mon, 10 Aug 2020 08:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 486 seconds by postgrey-1.36 at gabe;
 Mon, 10 Aug 2020 08:46:07 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E990889FDD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 08:46:07 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 2DF09100E4178;
 Mon, 10 Aug 2020 10:37:58 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id D567F34F184; Mon, 10 Aug 2020 10:37:57 +0200 (CEST)
Date: Mon, 10 Aug 2020 10:37:57 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v3] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
Message-ID: <20200810083757.2jbwebbvocqe5rle@wunner.de>
References: <0850ac9a-3d60-053d-1d70-5f20ce621b24@nvidia.com>
 <20200729210557.9195-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729210557.9195-1-ddadap@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 pobrn@protonmail.com, peter@lekensteyn.nl, dvhart@infradead.org,
 andy@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 04:05:57PM -0500, Daniel Dadap wrote:
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses>.

This boilerplate is unnecessary, the SPDX identifier is sufficient.

> +static int mxds_gmux_switchto(enum vga_switcheroo_client_id);
> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(struct pci_dev *);
> +
> +static const struct vga_switcheroo_handler handler = {
> +	.switchto = mxds_gmux_switchto,
> +	.get_client_id = mxds_gmux_get_client_id,
> +};

Move the handler struct further down to avoid the forward declarations.

> + * Call MXDS with bit 0 set to change the current state.
> + * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
[...]
> +enum mux_state_command {
> +	MUX_STATE_GET = 0,
> +	MUX_STATE_SET_IGPU = 0x01,
> +	MUX_STATE_SET_DGPU = 0x11,
> +};

It looks like the code comment is wrong and bit 1 (instead of bit 4) is
used to select the GPU.

> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method method,
> +				acpi_integer action)
> +{
> +	union acpi_object arg;
> +	struct acpi_object_list in = {.count = 1, .pointer = &arg};
> +	acpi_integer ret;
> +	acpi_status status;
> +
> +	arg.integer.type = ACPI_TYPE_INTEGER;
> +	arg.integer.value = action;

Hm, why not use an initializer for "arg", as you do for "in"?

> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
> +	struct pci_dev *dev)
> +{
> +	if (dev) {
> +		if (ig_dev && dev->vendor == ig_dev->vendor)
> +			return VGA_SWITCHEROO_IGD;
> +		if (dg_dev && dev->vendor == dg_dev->vendor)
> +			return VGA_SWITCHEROO_DIS;
> +	}

That's a little odd.  Why not use "ig_dev == dev" and "dg_dev == dev"?

> +static acpi_status find_acpi_methods(
> +	acpi_handle object, u32 nesting_level, void *context,
> +	void **return_value)
> +{
> +	acpi_handle search;
> +
> +	/* If either MXDM or MXDS is missing, we can't use this object */
> +	if (acpi_get_handle(object, "MXDM", &search))
> +		return 0;

Since this function returns an acpi_status, all the return statements
should use AE_OK intead of 0.

Otherwise LGTM.

Please cc dri-devel when respinning since this concerns vga_switcheroo.

I'm also cc'ing Peter Wu who has lots of experience with hybrid graphics
through his involvement with Bumblebee, hence might be interested.
Searching through his collection of ACPI dumps, it seems MXDS and MXMX
have been present for years, but not MXDM:

https://github.com/search?q=user%3ALekensteyn+MXDS&type=Code

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
