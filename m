Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A974B0754C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0B210E2A5;
	Wed, 16 Jul 2025 12:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uTBThkP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4038510E2A5;
 Wed, 16 Jul 2025 12:07:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CF89614A0;
 Wed, 16 Jul 2025 12:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABC4C4CEF0;
 Wed, 16 Jul 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752667674;
 bh=5XxmMpiNivgy5x7EwQrHsjMsktIGZJhPZWumYq2AU+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTBThkP5kbGoAl5tVL0SZsHkdjjbLYbpaq5ysOZ4VCpd2jhzXv+eFYzB0P05KCyeL
 k6gUqUmoJQUFn+cbq71ORbL/6fY1CCwgZ5VSmRAmev548WWTbaobb0g5TEfvbPx7FR
 uW99833h7YVJ8EVUYDADQ5tN0zw0kiFjtkKZVdTE=
Date: Wed, 16 Jul 2025 14:07:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver
Message-ID: <2025071603-guide-definite-70e3@gregkh>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-13-rodrigo.vivi@intel.com>
 <2025071611-decode-hastiness-df63@gregkh>
 <CY5PR11MB63666310C54B48FB3624D9E0ED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63666310C54B48FB3624D9E0ED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 16, 2025 at 11:58:19AM +0000, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver
> > 
> > On Thu, Jul 10, 2025 at 11:08:33AM -0400, Rodrigo Vivi wrote:
> > > From: Alexander Usyskin <alexander.usyskin@intel.com>
> > >
> > > Introduce a new MEI client driver to support Late Binding firmware
> > > upload/update for Intel discrete graphics platforms.
> > >
> > > Late Binding is a runtime firmware upload/update mechanism that allows
> > > payloads, such as fan control and voltage regulator, to be securely
> > > delivered and applied without requiring SPI flash updates or
> > > system reboots. This driver enables the Xe graphics driver and other
> > > user-space tools to push such firmware blobs to the authentication
> > > firmware via the MEI interface.
> > >
> > > The driver handles authentication, versioning, and communication
> > > with the authentication firmware, which in turn coordinates with
> > > the PUnit/PCODE to apply the payload.
> > >
> > > This is a foundational component for enabling dynamic, secure,
> > > and re-entrant configuration updates on platforms like Battlemage.
> > >
> > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >
> > > Changes in this revision:
> > > - Proper commit message
> > > - Proper explanation of 'Late Binding' on Kconfig help and doc
> > > - Consistency in naming:
> > >   + mei_ prefix where it makes sense
> > >   + use 'lb' for short of 'Late Binding' instead of 'late_bind'
> > >     Including s/CONFIG_INTEL_MEI_LATE_BIND/CONFIG_INTEL_MEI_LB
> > >   + remove stray 'struct module'
> > >   + Fix structs and enum documentation style and fields
> > >   + Remove 'CSC' to avoid yet another acronym. 'Authentication firmware' it
> > is.
> > >   + specify size unit
> > >   + s/push_config/push_payload
> > >
> > >  drivers/misc/mei/Kconfig                   |  13 +
> > >  drivers/misc/mei/Makefile                  |   1 +
> > >  drivers/misc/mei/mei_lb.c                  | 315 +++++++++++++++++++++
> > >  include/drm/intel/i915_component.h         |   1 +
> > >  include/drm/intel/intel_lb_mei_interface.h |  70 +++++
> > >  5 files changed, 400 insertions(+)
> > >  create mode 100644 drivers/misc/mei/mei_lb.c
> > >  create mode 100644 include/drm/intel/intel_lb_mei_interface.h
> > >
> > > diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
> > > index 7575fee96cc6..f8b04e49e4ba 100644
> > > --- a/drivers/misc/mei/Kconfig
> > > +++ b/drivers/misc/mei/Kconfig
> > > @@ -81,6 +81,19 @@ config INTEL_MEI_VSC
> > >  	  This driver can also be built as a module. If so, the module
> > >  	  will be called mei-vsc.
> > >
> > > +config INTEL_MEI_LB
> > > +	tristate "Intel Late Binding (LB) support on ME Interface"
> > > +	depends on INTEL_MEI_ME
> > > +	depends on DRM_XE
> > > +	help
> > > +	  Enable support for Intel Late Binding (LB) via the MEI interface.
> > > +
> > > +	  Late Binding is a method for applying firmware updates at runtime,
> > > +	  allowing the Intel Xe driver to load firmware payloads such as
> > > +	  fan controller or voltage regulator. These firmware updates are
> > > +	  authenticated and versioned, and do not require firmware flashing
> > > +	  or system reboot.
> > > +
> > >  source "drivers/misc/mei/hdcp/Kconfig"
> > >  source "drivers/misc/mei/pxp/Kconfig"
> > >  source "drivers/misc/mei/gsc_proxy/Kconfig"
> > > diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
> > > index 6f9fdbf1a495..a203ed766b33 100644
> > > --- a/drivers/misc/mei/Makefile
> > > +++ b/drivers/misc/mei/Makefile
> > > @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
> > >  obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
> > >  obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
> > >  obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
> > > +obj-$(CONFIG_INTEL_MEI_LB) += mei_lb.o
> > >
> > >  obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o
> > >  mei-vsc-hw-y := vsc-tp.o
> > > diff --git a/drivers/misc/mei/mei_lb.c b/drivers/misc/mei/mei_lb.c
> > > new file mode 100644
> > > index 000000000000..fddef862712d
> > > --- /dev/null
> > > +++ b/drivers/misc/mei/mei_lb.c
> > > @@ -0,0 +1,315 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2025 Intel Corporation
> > > + */
> > > +#include <drm/intel/i915_component.h>
> > > +#include <drm/intel/intel_lb_mei_interface.h>
> > > +#include <linux/component.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/mei_cl_bus.h>
> > > +#include <linux/module.h>
> > > +#include <linux/overflow.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/uuid.h>
> > > +
> > > +#include "mkhi.h"
> > > +
> > > +/**
> > > + * DOC: Late Binding Firmware Update/Upload
> > > + *
> > > + * Late Binding is a firmware update/upload mechanism that allows
> > configuration
> > > + * payloads to be securely delivered and applied at runtime, rather than
> > > + * being embedded in the system firmware image (e.g., IFWI or SPI flash).
> > > + *
> > > + * This mechanism is used to update device-level configuration such as:
> > > + * - Fan controller
> > > + * - Voltage regulator (VR)
> > > + *
> > > + * Key Characteristics:
> > > + * ---------------------
> > > + * - Runtime Delivery:
> > > + *   Firmware blobs are loaded by the host driver (e.g., Xe KMD)
> > > + *   after the GPU or SoC has booted.
> > > + *
> > > + * - Secure and Authenticated:
> > > + *   All payloads are signed and verified by the authentication firmware.
> > > + *
> > > + * - No Firmware Flashing Required:
> > > + *   Updates are applied in volatile memory and do not require SPI flash
> > > + *   modification or system reboot.
> > > + *
> > > + * - Re-entrant:
> > > + *   Multiple updates of the same or different types can be applied
> > > + *   sequentially within a single boot session.
> > > + *
> > > + * - Version Controlled:
> > > + *   Each payload includes version and security version number (SVN)
> > > + *   metadata to support anti-rollback enforcement.
> > > + *
> > > + * Upload Flow:
> > > + * ------------
> > > + * 1. Host driver (KMD or user-space tool) loads the late binding firmware.
> > > + * 2. Firmware is passed to the MEI interface and forwarded to
> > > + *    authentication firmware.
> > > + * 3. Authentication firmware authenticates the payload and extracts
> > > + *    command and data arrays.
> > > + * 4. Authentication firmware delivers the configuration to PUnit/PCODE.
> > > + * 5. Status is returned back to the host via MEI.
> > > + */
> > > +
> > > +#define INTEL_LB_CMD 0x12
> > > +#define INTEL_LB_RSP (INTEL_LB_CMD | 0x80)
> > > +
> > > +#define INTEL_LB_SEND_TIMEOUT_MSEC 3000
> > > +#define INTEL_LB_RECV_TIMEOUT_MSEC 3000
> > > +
> > > +/**
> > > + * struct mei_lb_req - Late Binding request structure
> > > + * @header: MKHI message header (see struct mkhi_msg_hdr)
> > > + * @type: Type of the Late Binding payload
> > > + * @flags: Flags to be passed to the authentication firmware (e.g.
> > %INTEL_LB_FLAGS_IS_PERSISTENT)
> > > + * @reserved: Reserved for future use by authentication firmware, must be
> > set to 0
> > > + * @payload_size: Size of the payload data in bytes
> > > + * @payload: Payload data to be sent to the authentication firmware
> > > + */
> > > +struct mei_lb_req {
> > > +	struct mkhi_msg_hdr header;
> > > +	__le32 type;
> > > +	__le32 flags;
> > > +	__le32 reserved[2];
> > > +	__le32 payload_size;
> > > +	u8  payload[] __counted_by(payload_size);
> > > +} __packed;
> > > +
> > > +/**
> > > + * struct mei_lb_rsp - Late Binding response structure
> > > + * @header: MKHI message header (see struct mkhi_msg_hdr)
> > > + * @type: Type of the Late Binding payload
> > > + * @reserved: Reserved for future use by authentication firmware, must be
> > set to 0
> > > + * @status: Status returned by authentication firmware (see enum
> > intel_lb_status)
> > > + */
> > > +struct mei_lb_rsp {
> > > +	struct mkhi_msg_hdr header;
> > > +	__le32 type;
> > > +	__le32 reserved[2];
> > > +	__le32 status;
> > > +} __packed;
> > > +
> > > +static int mei_lb_check_response(const struct device *dev, const struct
> > mkhi_msg_hdr *hdr)
> > > +{
> > > +	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
> > > +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
> > > +			hdr->group_id, MKHI_GROUP_ID_GFX);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (hdr->command != INTEL_LB_RSP) {
> > > +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
> > > +			hdr->command, INTEL_LB_RSP);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (hdr->result) {
> > > +		dev_err(dev, "Error in result: 0x%x\n", hdr->result);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mei_lb_push_payload(struct device *dev,
> > > +			       enum intel_lb_type type, u32 flags,
> > > +			       const void *payload, size_t payload_size)
> > > +{
> > > +	struct mei_cl_device *cldev;
> > > +	struct mei_lb_req *req = NULL;
> > > +	struct mei_lb_rsp rsp;
> > > +	size_t req_size;
> > > +	ssize_t bytes;
> > > +	int ret;
> > > +
> > > +	cldev = to_mei_cl_device(dev);
> > > +
> > > +	ret = mei_cldev_enable(cldev);
> > > +	if (ret) {
> > > +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	req_size = struct_size(req, payload, payload_size);
> > > +	if (req_size > mei_cldev_mtu(cldev)) {
> > > +		dev_err(dev, "Payload is too big %zu\n", payload_size);
> > > +		ret = -EMSGSIZE;
> > > +		goto end;
> > > +	}
> > > +
> > > +	req = kmalloc(req_size, GFP_KERNEL);
> > > +	if (!req) {
> > > +		ret = -ENOMEM;
> > > +		goto end;
> > > +	}
> > > +
> > > +	req->header.group_id = MKHI_GROUP_ID_GFX;
> > > +	req->header.command = INTEL_LB_CMD;
> > > +	req->type = cpu_to_le32(type);
> > > +	req->flags = cpu_to_le32(flags);
> > > +	req->reserved[0] = 0;
> > > +	req->reserved[1] = 0;
> > > +	req->payload_size = cpu_to_le32(payload_size);
> > > +	memcpy(req->payload, payload, payload_size);
> > > +
> > > +	bytes = mei_cldev_send_timeout(cldev,
> > > +				       (void *)req, req_size,
> > INTEL_LB_SEND_TIMEOUT_MSEC);
> > > +	if (bytes < 0) {
> > > +		dev_err(dev, "mei_cldev_send failed. %zd\n", bytes);
> > > +		ret = bytes;
> > > +		goto end;
> > > +	}
> > > +
> > > +	bytes = mei_cldev_recv_timeout(cldev,
> > > +				       (void *)&rsp, sizeof(rsp),
> > INTEL_LB_RECV_TIMEOUT_MSEC);
> > > +	if (bytes < 0) {
> > > +		dev_err(dev, "mei_cldev_recv failed. %zd\n", bytes);
> > > +		ret = bytes;
> > > +		goto end;
> > > +	}
> > > +	if (bytes < sizeof(rsp.header)) {
> > > +		dev_err(dev, "bad response header from the firmware: size
> > %zd < %zu\n",
> > > +			bytes, sizeof(rsp.header));
> > > +		ret = -EPROTO;
> > > +		goto end;
> > > +	}
> > > +	if (mei_lb_check_response(dev, &rsp.header)) {
> > > +		dev_err(dev, "bad result response from the firmware:
> > 0x%x\n",
> > > +			*(uint32_t *)&rsp.header);
> > 
> > What exactly are you printing out to userspace here?  A pointer?  Or a
> > random value from the firmware?  Why?
> We've checked this data for validity and check is failed.
> Sometimes whole header needed to debug the issue, so we are printing it here.
> 
> > 
> > > +		ret = -EPROTO;
> > > +		goto end;
> > > +	}
> > 
> > You forgot to check the type and reserved fields of the rsp structure :(
> You are right, better to check type too.
> Should reserved bits be checked for 0? Or it will be overkill?

The reserved bytes HAVE TO BE CHECKED, otherwise you can NEVER use them
in the future.  You say so in your documentation for the structure :)

> > > +	if (bytes < sizeof(rsp)) {
> > > +		dev_err(dev, "bad response from the firmware: size %zd <
> > %zu\n",
> > > +			bytes, sizeof(rsp));
> > > +		ret = -EPROTO;
> > > +		goto end;
> > > +	}
> > 
> > Why not check this above when you check against the size of the header?
> > You only need one size check, not 2.
> Firmware may return only header with result field set without the data.

Then the firmware is broken :)

> We are parsing the header first and then starting to parse data.
> If we check for whole message size at the beginning we'll miss the result data.

You mean you will make it harder to debug the firmware, as you will not
be printing out the header information?  Or something else?  The
bytes variable HAS to match the full structure size, not just the header
size, according to this code.  So just test for that and be done with
it!

thanks,

greg k-h
