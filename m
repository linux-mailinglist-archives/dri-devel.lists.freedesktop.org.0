Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E078C96E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86010E3C8;
	Tue, 29 Aug 2023 16:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469C810E3C9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:15:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 82FBB6607214;
 Tue, 29 Aug 2023 17:15:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693325738;
 bh=OGy37lSq5335ufEgMDXvh2W8e5QgeSsr7onfE+bXH7Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ONIUxt3V56i4ecrI+8hKTaJFN/2gl/Rp2t36YVZn4PhUAZwSDZozWyXE/lP4YeFuo
 Ys4me1mN6hV6ofc1LZlWjHrgWorJSvE95aqbTBbfgGN88xB7UNPan8Pm5pi8PAzlkV
 wKdoWSIlXF1oa48VELQrlYDgynzAxlIqb75xRgZCas+Hfg5/U2GHcycyfcG6wd+Kct
 1hYX+neeuURphcEDPBc0bw8QV68CddlesZdEoXpwszQgmdsexrbr0TS8lqggHNfeSM
 xN9u2A1N93LuglCcyVZdPG+1qa9FHoITwPMMvJ3HtMrJ9RYsPTlco3uG3dLNRSGFXD
 uWCK782ltBuuA==
Date: Tue, 29 Aug 2023 18:15:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 09/15] drm/panthor: Add the FW logical block
Message-ID: <20230829181535.40d0ab98@collabora.com>
In-Reply-To: <1a3467e4-16d8-f43a-38ea-fcbff6ad36d0@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-10-boris.brezillon@collabora.com>
 <1a3467e4-16d8-f43a-38ea-fcbff6ad36d0@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Aug 2023 17:01:56 +0100
Steven Price <steven.price@arm.com> wrote:

> On 09/08/2023 17:53, Boris Brezillon wrote:
> > Contains everything that's FW related, that includes the code dealing
> > with the microcontroller unit (MCU) that's running the FW, and anything
> > related to allocating memory shared between the FW and the CPU.
> >=20
> > A few global FW events are processed in the IRQ handler, the rest is
> > forwarded to the scheduler, since scheduling is the primary reason for
> > the FW existence, and also the main source of FW <-> kernel
> > interactions.
> >=20
> > v2:
> > - Rename the driver (pancsf -> panthor)
> > - Rename the file (_mcu -> _fw)
> > - Change the license (GPL2 -> MIT + GPL2)
> > - Split the driver addition commit
> > - Document the code
> > - Use drm_dev_{unplug,enter,exit}() to provide safe device removal
> > - Use the panthor_irq layer to manage/process IRQs
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c | 1417 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_fw.h |  505 +++++++++
> >  2 files changed, 1922 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/pan=
thor/panthor_fw.c
> > new file mode 100644
> > index 000000000000..359a68f7af03
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -0,0 +1,1417 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +/* Copyright 2023 Collabora ltd. */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/firmware.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/iosys-map.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_managed.h>
> > +
> > +#include "panthor_device.h"
> > +#include "panthor_gem.h"
> > +#include "panthor_gpu.h"
> > +#include "panthor_regs.h"
> > +#include "panthor_fw.h"
> > +#include "panthor_mmu.h"
> > +#include "panthor_sched.h"
> > +
> > +#define CSF_FW_NAME "mali_csffw.bin"
> > +
> > +#define PING_INTERVAL_MS			12000
> > +#define PROGRESS_TIMEOUT_CYCLES			(5ull * 500 * 1024 * 1024)
> > +#define PROGRESS_TIMEOUT_SCALE_SHIFT		10
> > +#define IDLE_HYSTERESIS_US			800
> > +#define PWROFF_HYSTERESIS_US			10000
> > +
> > +/**
> > + * struct panthor_fw_mem - FW memory
> > + */
> > +struct panthor_fw_mem {
> > +	/** @bo: Buffer object backing the FW memory. */
> > +	struct panthor_gem_object *bo;
> > +
> > +	/** @kmap: Kernel CPU mapping of the FW memory. */
> > +	void *kmap;
> > +
> > +	/** @va: MCU mapping of the FW memory. */
> > +	u64 va;
> > +};
> > +
> > +/**
> > + * struct panthor_fw_binary_hdr - Firmware binary header.
> > + */
> > +struct panthor_fw_binary_hdr {
> > +	/** @magic: Magic value to check binary validity. */
> > +	u32 magic;
> > +#define CSF_FW_BINARY_HEADER_MAGIC		0xc3f13a6e
> > +
> > +	/** @minor: Minor FW version. */
> > +	u8 minor;
> > +
> > +	/** @major: Major FW version. */
> > +	u8 major;
> > +#define CSF_FW_BINARY_HEADER_MAJOR_MAX		0
> > +
> > +	/** @padding1: MBZ. */
> > +	u16 padding1;
> > +
> > +	/** @version_hash: FW version hash. */
> > +	u32 version_hash;
> > +
> > +	/** @padding2: MBZ. */
> > +	u32 padding2;
> > +
> > +	/** @size: FW binary size. */
> > +	u32 size;
> > +};
> > +
> > +/**
> > + * enum panthor_fw_binary_entry_type - Firmware binary entry type
> > + */
> > +enum panthor_fw_binary_entry_type {
> > +	/** @CSF_FW_BINARY_ENTRY_TYPE_IFACE: Host <-> FW interface. */
> > +	CSF_FW_BINARY_ENTRY_TYPE_IFACE =3D 0,
> > +
> > +	/** @CSF_FW_BINARY_ENTRY_TYPE_CONFIG: FW config. */
> > +	CSF_FW_BINARY_ENTRY_TYPE_CONFIG =3D 1,
> > +
> > +	/** @CSF_FW_BINARY_ENTRY_TYPE_FUTF_TEST: Unit-tests. */
> > +	CSF_FW_BINARY_ENTRY_TYPE_FUTF_TEST =3D 2,
> > +
> > +	/** @CSF_FW_BINARY_ENTRY_TYPE_TRACE_BUFFER: Trace buffer interface. */
> > +	CSF_FW_BINARY_ENTRY_TYPE_TRACE_BUFFER =3D 3,
> > +
> > +	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata in=
terface. */
> > +	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA =3D 4,
> > +};
> > +
> > +#define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
> > +#define CSF_FW_BINARY_ENTRY_SIZE(ehdr)					(((ehdr) >> 8) & 0xff)
> > +#define CSF_FW_BINARY_ENTRY_UPDATE					BIT(30)
> > +#define CSF_FW_BINARY_ENTRY_OPTIONAL					BIT(31)
> > +
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_RD					BIT(0)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_WR					BIT(1)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_EX					BIT(2)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_NONE			(0 << 3)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED			(1 << 3)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_UNCACHED_COHERENT	(2 <=
< 3)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED_COHERENT		(3 <<=
 3)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK			GENMASK(4, 3)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_PROT				BIT(5)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED				BIT(30)
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO				BIT(31)
> > +
> > +#define CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS			\
> > +	(CSF_FW_BINARY_IFACE_ENTRY_RD_RD |				\
> > +	 CSF_FW_BINARY_IFACE_ENTRY_RD_WR |				\
> > +	 CSF_FW_BINARY_IFACE_ENTRY_RD_EX |				\
> > +	 CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK |			\
> > +	 CSF_FW_BINARY_IFACE_ENTRY_RD_PROT |				\
> > +	 CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED  |				\
> > +	 CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO)
> > +
> > +/**
> > + * struct panthor_fw_binary_section_entry_hdr - Describes a section of=
 FW binary
> > + */
> > +struct panthor_fw_binary_section_entry_hdr {
> > +	/** @flags: Section flags. */
> > +	u32 flags;
> > +
> > +	/** @va: MCU virtual range to map this binary section to. */
> > +	struct {
> > +		/** @start: Start address. */
> > +		u32 start;
> > +
> > +		/** @end: End address. */
> > +		u32 end;
> > +	} va;
> > +
> > +	/** @data: Data to initialize the FW section with. */
> > +	struct {
> > +		/** @start: Start offset in the FW binary. */
> > +		u32 start;
> > +
> > +		/** @end: End offset in the FW binary. */
> > +		u32 end;
> > +	} data;
> > +};
> > +
> > +/**
> > + * struct panthor_fw_binary_iter - Firmware binary iterator
> > + *
> > + * Used to parse a firmware binary.
> > + */
> > +struct panthor_fw_binary_iter {
> > +	/** @data: FW binary data. */
> > +	const void *data;
> > +
> > +	/** @size: FW binary size. */
> > +	size_t size;
> > +
> > +	/** @offset: Iterator offset. */
> > +	size_t offset;
> > +};
> > +
> > +/**
> > + * struct panthor_fw_section - FW section
> > + */
> > +struct panthor_fw_section {
> > +	/** @node: Used to keep track of FW sections. */
> > +	struct list_head node;
> > +
> > +	/** @flags: Section flags, as encoded in the FW binary. */
> > +	u32 flags;
> > +
> > +	/** @mem: Section memory. */
> > +	struct panthor_fw_mem *mem;
> > +
> > +	/**
> > +	 * @name: Name of the section, as specified in the binary.
> > +	 *
> > +	 * Can be NULL.
> > +	 */
> > +	const char *name;
> > +
> > +	/**
> > +	 * @data: Initial data copied to the FW memory.
> > +	 *
> > +	 * We keep data around so we can reload sections after a reset.
> > +	 */
> > +	struct {
> > +		/** @buf: Buffed used to store init data. */
> > +		const void *buf;
> > +
> > +		/** @size: Size of @buf in bytes. */
> > +		size_t size;
> > +	} data;
> > +};
> > +
> > +#define CSF_MCU_SHARED_REGION_START		0x04000000ULL
> > +#define CSF_MCU_SHARED_REGION_SIZE		0x04000000ULL
> > +
> > +#define MIN_CS_PER_CSG				8
> > +#define MIN_CSGS				3
> > +#define MAX_CSG_PRIO				0xf
> > +
> > +#define CSF_IFACE_VERSION(major, minor, patch)	\
> > +	(((major) << 24) | ((minor) << 16) | (patch))
> > +#define CSF_IFACE_VERSION_MAJOR(v)		((v) >> 24)
> > +#define CSF_IFACE_VERSION_MINOR(v)		(((v) >> 16) & 0xff)
> > +#define CSF_IFACE_VERSION_PATCH(v)		((v) & 0xffff)
> > +
> > +#define CSF_GROUP_CONTROL_OFFSET		0x1000
> > +#define CSF_STREAM_CONTROL_OFFSET		0x40
> > +#define CSF_UNPRESERVED_REG_COUNT		4
> > +
> > +/**
> > + * struct panthor_fw_iface - FW interfaces
> > + */
> > +struct panthor_fw_iface {
> > +	/** @global: Global interface. */
> > +	struct panthor_fw_global_iface global;
> > +
> > +	/** @groups: Group slot interfaces. */
> > +	struct panthor_fw_csg_iface groups[MAX_CSGS];
> > +
> > +	/** @streams: Command stream slot interfaces. */
> > +	struct panthor_fw_cs_iface streams[MAX_CSGS][MAX_CS_PER_CSG];
> > +};
> > +
> > +/**
> > + * struct panthor_fw - Firmware management
> > + */
> > +struct panthor_fw {
> > +	/** @vm: MCU VM. */
> > +	struct panthor_vm *vm;
> > +
> > +	/** @sections: List of FW sections. */
> > +	struct list_head sections;
> > +
> > +	/** @shared_section: The section containing the FW interfaces. */
> > +	struct panthor_fw_section *shared_section;
> > +
> > +	/** @iface: FW interfaces. */
> > +	struct panthor_fw_iface iface;
> > +
> > +	/** @watchdog: Collection of fields relating to the FW watchdog. */
> > +	struct {
> > +		/** @ping_work: Delayed work used to ping the FW. */
> > +		struct delayed_work ping_work;
> > +	} watchdog;
> > +
> > +	/**
> > +	 * @waitqueues: Request waitqueues.
> > +	 *
> > +	 * Everytime a request is sent to a command stream group or the global
> > +	 * interface, the caller will first busy wait for the request to be
> > +	 * acknowledged, and then fallback to a sleeping wait.
> > +	 *
> > +	 * Those wait queues are here to support the sleeping wait flavor.
> > +	 *
> > +	 * Entry 31 is the global waitqueue, the other ones are the command
> > +	 * stream group slot waitqueues.
> > +	 */
> > +	wait_queue_head_t waitqueues[32];
> > +
> > +	/** @booted: True is the FW is booted */
> > +	bool booted;
> > +
> > +	/**
> > +	 * @fast_reset: True if the post_reset logic can proceed with a fast =
reset.
> > +	 *
> > +	 * A fast reset is just a reset where the driver doesn't reload the F=
W sections.
> > +	 *
> > +	 * Any time the firmware is properly suspended, a fast reset can take=
 place.
> > +	 * On the other hand, if the halt operation failed, the driver will r=
eload
> > +	 * all sections to make sure we start from a fresh state.
> > +	 */
> > +	bool fast_reset;
> > +
> > +	/** @irq: Job irq data. */
> > +	struct panthor_irq irq;
> > +};
> > +
> > +/**
> > + * panthor_fw_get_glb_iface() - Get the global interface
> > + * @ptdev: Device.
> > + *
> > + * Return: The global interface.
> > + */
> > +struct panthor_fw_global_iface *
> > +panthor_fw_get_glb_iface(struct panthor_device *ptdev)
> > +{
> > +	return &ptdev->fw->iface.global;
> > +}
> > +
> > +/**
> > + * panthor_fw_get_glb_iface() - Get a command stream group slot interf=
ace
> > + * @ptdev: Device.
> > + * @csg_slot: Index of the command stream group slot.
> > + *
> > + * Return: The command stream group slot interface.
> > + */
> > +struct panthor_fw_csg_iface *
> > +panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot)
> > +{
> > +	if (drm_WARN_ON(&ptdev->base, csg_slot >=3D MAX_CSGS))
> > +		return NULL;
> > +
> > +	return &ptdev->fw->iface.groups[csg_slot];
> > +}
> > +
> > +/**
> > + * panthor_fw_get_glb_iface() - Get a command stream slot interface
> > + * @ptdev: Device.
> > + * @csg_slot: Index of the command stream group slot.
> > + * @cs_slot: Index of the command stream slot.
> > + *
> > + * Return: The command stream slot interface.
> > + */
> > +struct panthor_fw_cs_iface *
> > +panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u3=
2 cs_slot)
> > +{
> > +	if (drm_WARN_ON(&ptdev->base, csg_slot >=3D MAX_CSGS || cs_slot > MAX=
_CS_PER_CSG))
> > +		return NULL;
> > +
> > +	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
> > +}
> > +
> > +/**
> > + * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
> > + * @ptdev: Device.
> > + * @timeout_us: Timeout expressed in micro-seconds.
> > + *
> > + * The FW has two timer sources: the GPU counter or arch-timer. We need
> > + * to express timeouts in term of number of cycles and specify which
> > + * timer source should be used.
> > + *
> > + * Return: A value suitable for timeout fields in the global interface.
> > + */
> > +static u32 panthor_fw_conv_timeout(struct panthor_device *ptdev, u32 t=
imeout_us)
> > +{
> > +	bool use_cycle_counter =3D false;
> > +	u32 timer_rate =3D 0;
> > +	u64 cycles;
> > +
> > +#ifdef CONFIG_ARM_ARCH_TIMER
> > +	timer_rate =3D arch_timer_get_cntfrq();
> > +#endif
> > +
> > +	if (!timer_rate) {
> > +		use_cycle_counter =3D true;
> > +		timer_rate =3D clk_get_rate(ptdev->clks.core);
> > +	}
> > +
> > +	if (drm_WARN_ON(&ptdev->base, !timer_rate)) {
> > +		/* We couldn't get a valid clock rate, let's just pick the
> > +		 * maximum value so the FW still handles the core
> > +		 * power on/off requests.
> > +		 */
> > +		return GLB_TIMER_VAL(0x7fffffff) | =20
>=20
> NIT: This feels like a magic number that could be included in the
> header. Or it could be rewritten as GLB_TIMER_VAL(~0) to more clearly
> represent 'maximum'.

I'll go for the latter, after checking GLB_TIMER_VAL() has a valid mask
operation.

>=20
> > +		       GLB_TIMER_SOURCE_GPU_COUNTER;
> > +	}
> > +
> > +	cycles =3D DIV_ROUND_UP_ULL((u64)timeout_us * timer_rate, 1000000);
> > +	return GLB_TIMER_VAL(cycles >> 10) | =20
>=20
> NIT: This isn't quite as ideal as it could be. The round up is done
> before the shift. Plus it's technically possible to overflow the 31 bits
> available (although that requires a several minute timeout and the
> fastest possible clock).
>=20
> I'd be tempted to rewrite as:
>=20
> 	mod_cycles =3D DIV_ROUND_UP_ULL((u64)timeout_us * timer_rate,
> 				      1000000 << 10);
>=20
> I'm not sure if the theorectical overflow is worth considering, but it
> can be handled as:
>=20
> 	if (drm_WARN_ON(&ptdev->base, mod_cycles >=3D (1 << 31)))
> 		mod_cycles =3D (1 << 31) - 1;
>=20
> or following the style I suggested above:
>=20
> 	if (drm_WARN_ON(&ptdev->base, mod_cycles > GLB_TIMER_VAL(~0)))
> 		mod_cycles =3D GFB_TIMER_VAL(~0);

Ack.

>=20
> > +	       (use_cycle_counter ? GLB_TIMER_SOURCE_GPU_COUNTER : 0);
> > +}
> > +

[...]

> > +/**
> > + * panthor_fw_mem_alloc() - Allocate a FW memory object and map it to =
the MCU VM.
> > + * @ptdev: Device.
> > + * @size: Size of the memory block.
> > + * @bo_flags: BO flags.
> > + * @vm_map_flags: VM_MAP flags.
> > + * @va: Virtual address of the MCU mapping.
> > + * Set to PANTHOR_GEM_ALLOC_VA for automatic VA-assignment. In that ca=
se, the
> > + * VA will be allocated in the shared VA space.
> > + *
> > + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
> > + */
> > +static struct panthor_fw_mem *
> > +panthor_fw_mem_alloc(struct panthor_device *ptdev, size_t size,
> > +		     u32 bo_flags, u32 vm_map_flags, u64 va)
> > +{
> > +	struct panthor_fw_mem *mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
> > +	int ret;
> > +
> > +	if (!mem)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	mem->bo =3D panthor_gem_create_and_map(ptdev, ptdev->fw->vm,
> > +					     size, bo_flags, vm_map_flags,
> > +					     &va, NULL);
> > +	if (IS_ERR(mem->bo)) {
> > +		ret =3D PTR_ERR(mem->bo);
> > +		mem->bo =3D NULL;
> > +		goto err_free_mem;
> > +	}
> > +
> > +	mem->va =3D va;
> > +	return mem;
> > +
> > +err_free_mem:
> > +	panthor_fw_mem_free(ptdev, mem);
> > +	return ERR_PTR(ret); =20
>=20
> The error handling seems more complex than needed, how about:
>=20
> 	struct panthor_fw_mem *mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
> 	struct panthor_gem_object *bo;
> 	int ret;
>=20
> 	if (!mem)
> 		return ERR_PTR(-ENOMEM);
>=20
> 	bo =3D panthor_gem_create_and_map(ptdev, ptdev->fw->vm,
> 					size, bo_flags, vm_map_flags,
> 					&va, NULL);
>=20
> 	if (IS_ERR(bo)) {
> 		kfree(mem);
> 		return ERR_CAST(bo);
> 	}
>=20
> 	mem->bo =3D bo;
> 	mem->va =3D va;
> 	return mem;
> =09
> Which I think also means we don't need the "if (mem->bo)" case in
> panthor_fw_mem_free().

Not so sure about that one. I've been adding code to existing functions
and having a structured error path, with free functions that can deal
with partially initialized object makes code addition less error-prone.
I agree on the local bo variable to avoid mem->bo re-initialization
though.

>=20
> > +}
> > +

[...]

> > +/**
> > + * panthor_fw_alloc_suspend_buf_mem() - Allocate a suspend buffer for =
a command stream group.
> > + * @ptdev: Device.
> > + * @size: Size of the suspend buffer.
> > + *
> > + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
> > + */
> > +struct panthor_fw_mem *
> > +panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t =
size)
> > +{
> > +	return panthor_fw_mem_alloc(ptdev, size,
> > +				    DRM_PANTHOR_BO_NO_MMAP,
> > +				    DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> > +				    PANTHOR_GEM_ALLOC_VA);
> > +}
> > +
> > +static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> > +					 const struct firmware *fw,
> > +					 struct panthor_fw_binary_iter *iter,
> > +					 u32 ehdr)
> > +{
> > +	struct panthor_fw_binary_section_entry_hdr hdr;
> > +	struct panthor_fw_section *section;
> > +	u32 section_size;
> > +	u32 name_len;
> > +	int ret;
> > +
> > +	ret =3D panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (hdr.data.end < hdr.data.start) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, data.end < data.start (0x=
%x < 0x%x)\n",
> > +			hdr.data.end, hdr.data.start);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.va.end < hdr.va.start) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, hdr.va.end < hdr.va.start=
 (0x%x < 0x%x)\n",
> > +			hdr.va.end, hdr.va.start);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.data.end > fw->size) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, file truncated? data_end=
=3D0x%x > fw size=3D0x%zx\n",
> > +			hdr.data.end, fw->size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if ((hdr.va.start & ~PAGE_MASK) !=3D 0 ||
> > +	    (hdr.va.end & ~PAGE_MASK) !=3D 0) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not pag=
e aligned: 0x%x-0x%x\n",
> > +			hdr.va.start, hdr.va.end);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.flags & ~CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS) {
> > +		drm_err(&ptdev->base, "Firmware contains interface with unsupported =
flags (0x%x)\n",
> > +			hdr.flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_PROT) {
> > +		drm_warn(&ptdev->base,
> > +			 "Firmware protected mode entry not be supported, ignoring");
> > +		return 0;
> > +	}
> > +
> > +	if (hdr.va.start =3D=3D CSF_MCU_SHARED_REGION_START &&
> > +	    !(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED)) {
> > +		drm_err(&ptdev->base,
> > +			"Interface at 0x%llx must be shared", CSF_MCU_SHARED_REGION_START);
> > +		return -EINVAL;
> > +	}
> > +
> > +	name_len =3D iter->size - iter->offset;
> > +
> > +	section =3D drmm_kzalloc(&ptdev->base, sizeof(*section), GFP_KERNEL);
> > +	if (!section)
> > +		return -ENOMEM;
> > +
> > +	list_add_tail(&section->node, &ptdev->fw->sections);
> > +	section->flags =3D hdr.flags;
> > +	section->data.size =3D hdr.data.end - hdr.data.start;
> > +
> > +	if (section->data.size > 0) {
> > +		void *data =3D drmm_kmalloc(&ptdev->base, section->data.size, GFP_KE=
RNEL);
> > +
> > +		if (!data)
> > +			return -ENOMEM;
> > +
> > +		memcpy(data, fw->data + hdr.data.start, section->data.size);
> > +		section->data.buf =3D data;
> > +	}
> > +
> > +	if (name_len > 0) {
> > +		char *name =3D drmm_kmalloc(&ptdev->base, name_len + 1, GFP_KERNEL);
> > +
> > +		if (!name)
> > +			return -ENOMEM;
> > +
> > +		memcpy(name, iter->data + iter->offset, name_len);
> > +		name[name_len] =3D '\0';
> > +		section->name =3D name;
> > +	}
> > +
> > +	section_size =3D hdr.va.end - hdr.va.start;
> > +	if (section_size) {
> > +		u32 cache_mode =3D hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MO=
DE_MASK;
> > +		u32 vm_map_flags =3D 0;
> > +		struct sg_table *sgt;
> > +		u64 va =3D hdr.va.start;
> > +
> > +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
> > +			vm_map_flags |=3D DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
> > +
> > +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_EX))
> > +			vm_map_flags |=3D DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
> > +
> > +		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_*_COHERENT are mapp=
ed to
> > +		 * non-cacheable for now. We might want to introduce a new
> > +		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
> > +		 * memory and is currently not used by our driver) for
> > +		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
> > +		 * of IO-coherent systems.
> > +		 */
> > +		if (cache_mode !=3D CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
> > +			vm_map_flags |=3D DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
> > +
> > +		/* Shared section is in the auto-VA range. We need to
> > +		 * reserve the VA range so it's not allocated to someone else.
> > +		 */
> > +		if (va >=3D CSF_MCU_SHARED_REGION_START &&
> > +		    va < CSF_MCU_SHARED_REGION_START + CSF_MCU_SHARED_REGION_SIZE)
> > +			va =3D PANTHOR_GEM_ALLOC_VA;
> > +
> > +		section->mem =3D panthor_fw_mem_alloc(ptdev, section_size,
> > +						    DRM_PANTHOR_BO_NO_MMAP,
> > +						    vm_map_flags, va);
> > +		if (IS_ERR(section->mem))
> > +			return PTR_ERR(section->mem);
> > +
> > +		if (drm_WARN_ON(&ptdev->base, section->mem->va !=3D hdr.va.start))
> > +			return -EINVAL;
> > +
> > +		panthor_fw_init_section_mem(ptdev, section);
> > +
> > +		sgt =3D drm_gem_shmem_get_pages_sgt(&section->mem->bo->base);
> > +		if (IS_ERR(sgt))
> > +			return PTR_ERR(section->mem);
> > +
> > +		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> > +
> > +		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED) {
> > +			if (!panthor_fw_mem_vmap(section->mem)) =20
>=20
> Moving this before panthor_fw_init_section_mem() would avoid an
> unnecessary unmap/remap - althought this isn't exactly a performance path=
...

Sure, I can do that.

>=20
> > +				return -ENOMEM;
> > +		}
> > +	}
> > +
> > +	if (hdr.va.start =3D=3D CSF_MCU_SHARED_REGION_START)
> > +		ptdev->fw->shared_section =3D section;
> > +
> > +	return 0;
> > +}
> > +
> > +static void
> > +panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_rel=
oad)
> > +{
> > +	struct panthor_fw_section *section;
> > +
> > +	list_for_each_entry(section, &ptdev->fw->sections, node) {
> > +		struct sg_table *sgt;
> > +
> > +		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_=
WR))
> > +			continue;
> > +
> > +		panthor_fw_init_section_mem(ptdev, section);
> > +		sgt =3D drm_gem_shmem_get_pages_sgt(&section->mem->bo->base);
> > +		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
> > +			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> > +	}
> > +}
> > +
> > +static int panthor_fw_load_entry(struct panthor_device *ptdev,
> > +				 const struct firmware *fw,
> > +				 struct panthor_fw_binary_iter *iter)
> > +{
> > +	struct panthor_fw_binary_iter eiter;
> > +	u32 ehdr;
> > +	int ret;
> > +
> > +	ret =3D panthor_fw_binary_iter_read(ptdev, iter, &ehdr, sizeof(ehdr));
> > +	if (ret)
> > +		return ret;
> > +
> > +	if ((iter->offset % sizeof(u32)) ||
> > +	    (CSF_FW_BINARY_ENTRY_SIZE(ehdr) % sizeof(u32))) {
> > +		drm_err(&ptdev->base, "Firmware entry isn't 32 bit aligned, offset=
=3D0x%x size=3D0x%x\n",
> > +			(u32)(iter->offset - sizeof(u32)), CSF_FW_BINARY_ENTRY_SIZE(ehdr));
> > +		return -EINVAL;
> > +	}
> > +
> > +	eiter.offset =3D 0;
> > +	eiter.data =3D iter->data + iter->offset;
> > +	eiter.size =3D CSF_FW_BINARY_ENTRY_SIZE(ehdr) - sizeof(ehdr);
> > +	iter->offset +=3D eiter.size; =20
>=20
> There should really be a check like:
>=20
> 	if (iter->offset < eiter.size)
> 		return -EINVAL;

Uh, I thought I had added size checks everywhere, but I apparently
missed some places.

>=20
> otherwise I think it's possible for a corrupt firmware to cause us to
> run off the end of the buffer. Ideally the check would look something
> more like the one in panthor_fw_binary_iter_read() (dealing with
> potential overflow). I'm wondering if it makes sense to allow
> panthor_fw_binary_iter_read() with a NULL 'out' and check the return
> value. That way we can replace "iter->offset +=3D eiter.size" with:
>=20
> 	ret =3D panthor_fw_binary_iter_read(ptdev, iter, NULL,
> 					  eiter.size);
> 	if (ret)
> 		return ret;
>=20
> (or have a new _skip() function)

Might make sense to add a panthor_fw_binary_sub_iter_init() helper that
would take care of doing the size check on the main iter, Unless you
see other places requiring a size check that are not expressed as
sub-iterators.

>=20
> > +
> > +	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
> > +	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
> > +		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
> > +
> > +	/* FIXME: handle those entry types? */
> > +	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:
> > +	case CSF_FW_BINARY_ENTRY_TYPE_FUTF_TEST:
> > +	case CSF_FW_BINARY_ENTRY_TYPE_TRACE_BUFFER:
> > +	case CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA:
> > +		return 0;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	if (ehdr & CSF_FW_BINARY_ENTRY_OPTIONAL)
> > +		return 0;
> > +
> > +	drm_err(&ptdev->base,
> > +		"Unsupported non-optional entry type %u in firmware\n",
> > +		CSF_FW_BINARY_ENTRY_TYPE(ehdr));
> > +	return -EINVAL;
> > +}

[...]

> > +static int panthor_init_cs_iface(struct panthor_device *ptdev,
> > +				 unsigned int csg_idx, unsigned int cs_idx)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +	struct panthor_fw_csg_iface *csg_iface =3D panthor_fw_get_csg_iface(p=
tdev, csg_idx);
> > +	struct panthor_fw_cs_iface *cs_iface =3D &ptdev->fw->iface.streams[cs=
g_idx][cs_idx];
> > +	u64 shared_section_sz =3D ptdev->fw->shared_section->mem->bo->base.ba=
se.size;
> > +	u32 iface_offset =3D CSF_GROUP_CONTROL_OFFSET +
> > +			   (csg_idx * glb_iface->control->group_stride) +
> > +			   CSF_STREAM_CONTROL_OFFSET +
> > +			   (cs_idx * csg_iface->control->stream_stride);
> > +
> > +	if (iface_offset + sizeof(*cs_iface) >=3D shared_section_sz)
> > +		return -EINVAL;
> > +
> > +	spin_lock_init(&cs_iface->lock);
> > +	cs_iface->control =3D ptdev->fw->shared_section->mem->kmap + iface_of=
fset;
> > +	cs_iface->input =3D iface_fw_to_cpu_addr(ptdev, cs_iface->control->in=
put_va);
> > +	cs_iface->output =3D iface_fw_to_cpu_addr(ptdev, cs_iface->control->o=
utput_va);
> > +
> > +	if (!cs_iface->input || !cs_iface->output) {
> > +		drm_err(&ptdev->base, "Invalid stream control interface input/output=
 VA");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (csg_idx > 0 || cs_idx > 0) {
> > +		struct panthor_fw_cs_iface *first_cs_iface =3D
> > +			panthor_fw_get_cs_iface(ptdev, 0, 0);
> > +
> > +		if (cs_iface->control->features !=3D first_cs_iface->control->featur=
es) {
> > +			drm_err(&ptdev->base, "Expecting identical CS slots");
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		u32 reg_count =3D CS_FEATURES_WORK_REGS(cs_iface->control->features);
> > +
> > +		ptdev->csif_info.cs_reg_count =3D reg_count;
> > +		ptdev->csif_info.unpreserved_cs_reg_count =3D CSF_UNPRESERVED_REG_CO=
UNT;
> > +	} =20
>=20
> Minor NIT: Both of these could be made unconditional. I feel the neatest
> thing could be to move the 'else' part to panthor_fw_init_ifaces()
> rather than including it as a special case here.
>=20
> The conditional could be left as is, removed, or maybe the below is clear=
er?
>=20
> 	struct panthor_fw_cs_iface *first_cs_iface =3D
> 			panthor_fw_get_cs_iface(ptdev, 0, 0);
>=20
> 	if (cs_iface !=3D first_cs_iface) {
> 		if (cs_iface->control->features !=3D
> 		    first_cs_iface->control->features) {
>=20
> I've no strong views, it's just this bit of code looks very clunky to me.

No objection.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int panthor_init_csg_iface(struct panthor_device *ptdev,
> > +				  unsigned int csg_idx)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +	struct panthor_fw_csg_iface *csg_iface =3D &ptdev->fw->iface.groups[c=
sg_idx];
> > +	u64 shared_section_sz =3D ptdev->fw->shared_section->mem->bo->base.ba=
se.size;
> > +	u32 iface_offset =3D CSF_GROUP_CONTROL_OFFSET + (csg_idx * glb_iface-=
>control->group_stride);
> > +	unsigned int i;
> > +
> > +	if (iface_offset + sizeof(*csg_iface) >=3D shared_section_sz)
> > +		return -EINVAL;
> > +
> > +	spin_lock_init(&csg_iface->lock);
> > +	csg_iface->control =3D ptdev->fw->shared_section->mem->kmap + iface_o=
ffset;
> > +	csg_iface->input =3D iface_fw_to_cpu_addr(ptdev, csg_iface->control->=
input_va);
> > +	csg_iface->output =3D iface_fw_to_cpu_addr(ptdev, csg_iface->control-=
>output_va);
> > +
> > +	if (csg_iface->control->stream_num < MIN_CS_PER_CSG ||
> > +	    csg_iface->control->stream_num > MAX_CS_PER_CSG)
> > +		return -EINVAL;
> > +
> > +	if (!csg_iface->input || !csg_iface->output) {
> > +		drm_err(&ptdev->base, "Invalid group control interface input/output =
VA");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (csg_idx > 0) {
> > +		struct panthor_fw_csg_iface *first_csg_iface =3D
> > +			panthor_fw_get_csg_iface(ptdev, 0);
> > +		u32 first_protm_suspend_size =3D first_csg_iface->control->protm_sus=
pend_size;
> > +
> > +		if (first_csg_iface->control->features !=3D csg_iface->control->feat=
ures ||
> > +		    first_csg_iface->control->suspend_size !=3D csg_iface->control->=
suspend_size ||
> > +		    first_protm_suspend_size !=3D csg_iface->control->protm_suspend_=
size ||
> > +		    first_csg_iface->control->stream_num !=3D csg_iface->control->st=
ream_num) {
> > +			drm_err(&ptdev->base, "Expecting identical CSG slots");
> > +			return -EINVAL;
> > +		} =20
>=20
> As above, I also wonder whether factoring out a "compare_csg()" function
> could make this mode readable - it could take the "->control" members to
> keep the line length in check. The special case for
> "first_protm_suspend_size" is somewhat ugly.

Sure, I can do that.

>=20
> > +	}
> > +
> > +	for (i =3D 0; i < csg_iface->control->stream_num; i++) {
> > +		int ret =3D panthor_init_cs_iface(ptdev, csg_idx, i);
> > +
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static u32 panthor_get_instr_features(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +
> > +	if (glb_iface->control->version < CSF_IFACE_VERSION(1, 1, 0))
> > +		return 0;
> > +
> > +	return glb_iface->control->instr_features;
> > +}
> > +
> > +static int panthor_fw_init_ifaces(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D &ptdev->fw->iface.globa=
l;
> > +	unsigned int i;
> > +
> > +	if (!ptdev->fw->shared_section->mem->kmap)
> > +		return -EINVAL;
> > +
> > +	spin_lock_init(&glb_iface->lock);
> > +	glb_iface->control =3D ptdev->fw->shared_section->mem->kmap;
> > +
> > +	if (!glb_iface->control->version) {
> > +		drm_err(&ptdev->base, "Invalid CSF interface version %d.%d.%d (%x)",
> > +			CSF_IFACE_VERSION_MAJOR(glb_iface->control->version),
> > +			CSF_IFACE_VERSION_MINOR(glb_iface->control->version),
> > +			CSF_IFACE_VERSION_PATCH(glb_iface->control->version),
> > +			glb_iface->control->version); =20
>=20
> This looks wrong - we print this message only with version =3D=3D 0, so t=
he
> version number isn't very interesting ;)
>=20
> I see kbase has this message: "Version check failed. Firmware may have
> failed to boot." Which seems much more informative.

Makes sense.

>=20
> > +		return -EINVAL;
> > +	}
> > +
> > +	glb_iface->input =3D iface_fw_to_cpu_addr(ptdev, glb_iface->control->=
input_va);
> > +	glb_iface->output =3D iface_fw_to_cpu_addr(ptdev, glb_iface->control-=
>output_va);
> > +	if (!glb_iface->input || !glb_iface->output) {
> > +		drm_err(&ptdev->base, "Invalid global control interface input/output=
 VA");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (glb_iface->control->group_num > MAX_CSGS ||
> > +	    glb_iface->control->group_num < MIN_CSGS) {
> > +		drm_err(&ptdev->base, "Invalid number of control groups");
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i =3D 0; i < glb_iface->control->group_num; i++) {
> > +		int ret =3D panthor_init_csg_iface(ptdev, i);
> > +
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	drm_info(&ptdev->base, "CSF FW v%d.%d.%d, Features %x Instrumentation=
 features %x", =20
>=20
> NIT: Prefix %x with 0x (or use %#x).

Will do.

>=20
> > +		 CSF_IFACE_VERSION_MAJOR(glb_iface->control->version),
> > +		 CSF_IFACE_VERSION_MINOR(glb_iface->control->version),
> > +		 CSF_IFACE_VERSION_PATCH(glb_iface->control->version),
> > +		 glb_iface->control->features,
> > +		 panthor_get_instr_features(ptdev));
> > +	return 0;
> > +}
> > +
> > +static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +
> > +	/* Enable all cores. */
> > +	glb_iface->input->core_en_mask =3D ptdev->gpu_info.shader_present;
> > +
> > +	/* Setup timers. */
> > +	glb_iface->input->poweroff_timer =3D panthor_fw_conv_timeout(ptdev, P=
WROFF_HYSTERESIS_US);
> > +	glb_iface->input->progress_timer =3D PROGRESS_TIMEOUT_CYCLES >> PROGR=
ESS_TIMEOUT_SCALE_SHIFT;
> > +	glb_iface->input->idle_timer =3D panthor_fw_conv_timeout(ptdev, IDLE_=
HYSTERESIS_US);
> > +
> > +	/* Enable interrupts we care about. */
> > +	glb_iface->input->ack_irq_mask =3D GLB_CFG_ALLOC_EN |
> > +					 GLB_PING |
> > +					 GLB_CFG_PROGRESS_TIMER |
> > +					 GLB_CFG_POWEROFF_TIMER |
> > +					 GLB_IDLE_EN |
> > +					 GLB_IDLE;
> > +
> > +	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
> > +	panthor_fw_toggle_reqs(glb_iface, req, ack,
> > +			       GLB_CFG_ALLOC_EN |
> > +			       GLB_CFG_POWEROFF_TIMER |
> > +			       GLB_CFG_PROGRESS_TIMER);
> > +
> > +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> > +
> > +	/* Kick the watchdog. */
> > +	mod_delayed_work(ptdev->reset.wq, &ptdev->fw->watchdog.ping_work,
> > +			 msecs_to_jiffies(PING_INTERVAL_MS));
> > +}
> > +
> > +static void panthor_fw_process_global_irq(struct panthor_device *ptdev)
> > +{
> > +	/* If the FW is not booted, don't process IRQs, just flag the FW as b=
ooted. */
> > +	if (!ptdev->fw->booted)
> > +		ptdev->fw->booted =3D true;
> > +	else
> > +		panthor_sched_process_global_irq(ptdev);
> > +
> > +	wake_up_all(&ptdev->fw->waitqueues[31]);
> > +}
> > +
> > +static void panthor_fw_process_csg_irq(struct panthor_device *ptdev, u=
32 csg_slot)
> > +{
> > +	panthor_sched_process_csg_irq(ptdev, csg_slot);
> > +	wake_up_all(&ptdev->fw->waitqueues[csg_slot]);
> > +}
> > +
> > +static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 =
status)
> > +{
> > +	if (status & JOB_INT_GLOBAL_IF) {
> > +		panthor_fw_process_global_irq(ptdev);
> > +		status &=3D ~JOB_INT_GLOBAL_IF;
> > +	}
> > +
> > +	while (status) {
> > +		u32 csg_id =3D ffs(status) - 1;
> > +
> > +		panthor_fw_process_csg_irq(ptdev, csg_id);
> > +		status &=3D ~BIT(csg_id); =20
>=20
> NIT: s/BIT/JOB_INT_CSG_IF/ (since it exists...)

Will use JOB_INT_CSG_IF here.

>=20
> > +	}
> > +}
> > +PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
> > +
> > +static int panthor_fw_start(struct panthor_device *ptdev)
> > +{
> > +	bool timedout =3D false;
> > +
> > +	ptdev->fw->booted =3D false;
> > +	panthor_job_irq_resume(&ptdev->fw->irq, ~0);
> > +	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_AUTO);
> > +
> > +	if (!wait_event_timeout(ptdev->fw->waitqueues[31],
> > +				ptdev->fw->booted,
> > +				msecs_to_jiffies(1000))) {
> > +		if (!ptdev->fw->booted &&
> > +		    !(gpu_read(ptdev, JOB_INT_STAT) & JOB_INT_GLOBAL_IF))
> > +			timedout =3D true;
> > +	}
> > +
> > +	if (timedout) {
> > +		drm_err(&ptdev->base, "Failed to boot MCU");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void panthor_fw_stop(struct panthor_device *ptdev)
> > +{
> > +	u32 status;
> > +
> > +	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
> > +	if (readl_poll_timeout(ptdev->iomem + MCU_CONTROL, status,
> > +			       status =3D=3D MCU_CONTROL_DISABLE, 10, 100000)) =20
>=20
> I suspect this should be checking MCU_STATUS not MCU_CONTROL

Yes, it should.

>=20
> > +		drm_err(&ptdev->base, "Failed to stop MCU");
> > +}
> > +
> > +/**
> > + * panthor_fw_pre_reset() - Call before a reset.
> > + * @ptdev: Device.
> > + * @on_hang: true if the reset was triggered on a GPU hang.
> > + *
> > + * If the reset is not triggered on a hang, we try to gracefully halt =
the
> > + * MCU, so we can do a fast-reset when panthor_fw_post_reset() is call=
ed.
> > + */
> > +void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
> > +{
> > +	/* Make sure we won't be woken up by a ping. */
> > +	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
> > +
> > +	ptdev->fw->fast_reset =3D false;
> > +
> > +	if (!on_hang) {
> > +		struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifa=
ce(ptdev);
> > +		u32 status;
> > +
> > +		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
> > +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> > +		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> > +					status =3D=3D MCU_STATUS_HALT, 10, 100000) &&
> > +		    glb_iface->output->halt_status =3D=3D PANTHOR_FW_HALT_OK) {
> > +			ptdev->fw->fast_reset =3D true;
> > +		} else {
> > +			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
> > +		}
> > +
> > +		/* The FW detects 0 -> 1 transitions. Make sure we reset
> > +		 * the HALT bit before the FW is rebooted.
> > +		 */
> > +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> > +	}
> > +
> > +	panthor_job_irq_suspend(&ptdev->fw->irq);
> > +}
> > +
> > +/**
> > + * panthor_fw_post_reset() - Call after a reset.
> > + * @ptdev: Device.
> > + *
> > + * Start the FW. If this is not a fast reset, all FW sections are relo=
aded to
> > + * make sure we can recover from a memory corruption.
> > + */
> > +int panthor_fw_post_reset(struct panthor_device *ptdev)
> > +{
> > +	int ret;
> > +
> > +	/* Make the MCU VM active. */
> > +	ret =3D panthor_vm_active(ptdev->fw->vm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Reload all sections, including RO ones. We're not supposed
> > +	 * to end up here anyway, let's just assume the overhead of
> > +	 * reloading everything is acceptable.
> > +	 */
> > +	if (!ptdev->fw->fast_reset)
> > +		panthor_reload_fw_sections(ptdev, true);
> > +
> > +	ret =3D panthor_fw_start(ptdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* We must re-initialize the global interface even on fast-reset. */
> > +	panthor_fw_init_global_iface(ptdev);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * panthor_fw_unplug() - Called when the device is unplugged.
> > + * @ptdev: Device.
> > + *
> > + * This function must make sure all pending operations are flushed bef=
ore
> > + * will release device resources, thus preventing any interaction with
> > + * the HW.
> > + *
> > + * If there are still FW-relates works running after this function ret=
urns, =20
>=20
> s/relates/related/ or maybe even "If there is still FW-related work"

Will fix.

>=20
> > + * they must use drm_dev_{enter,exit}() and skip any HW access when
> > + * drm_dev_enter() returns false.
> > + */
> > +void panthor_fw_unplug(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw_section *section;
> > +
> > +	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
> > +
> > +	/* Make sure the IRQ handler can be called after that point. */
> > +	if (ptdev->fw->irq.irq)
> > +		panthor_job_irq_suspend(&ptdev->fw->irq);
> > +
> > +	panthor_fw_stop(ptdev);
> > +
> > +	if (ptdev->fw->vm)
> > +		panthor_vm_idle(ptdev->fw->vm);
> > +
> > +	list_for_each_entry(section, &ptdev->fw->sections, node) {
> > +		panthor_fw_mem_free(ptdev, section->mem);
> > +	}
> > +
> > +	panthor_vm_put(ptdev->fw->vm);
> > +
> > +	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> > +}
> > +
> > +/**
> > + * panthor_fw_wait_acks() - Wait for requests to be acknowledged by th=
e FW.
> > + * @req_ptr: Pointer to the req register.
> > + * @ack_ptr: Pointer to the ack register.
> > + * @wq: Wait queue to use for the sleeping wait.
> > + * @req_mask: Mask of requests to wait for.
> > + * @acked: Pointer to field that's updated with the acked requests.
> > + * If the function returns 0, *acked =3D=3D req_mask.
> > + * @timeout_ms: Timeout expressed in milliseconds.
> > + *
> > + * Return: 0 on success, -ETIMEDOUT otherwise.
> > + */
> > +static int panthor_fw_wait_acks(const u32 *req_ptr, const u32 *ack_ptr,
> > +				wait_queue_head_t *wq,
> > +				u32 req_mask, u32 *acked,
> > +				u32 timeout_ms)
> > +{
> > +	u32 ack, req =3D READ_ONCE(*req_ptr) & req_mask;
> > +	int ret;
> > +
> > +	/* Busy wait for a few =C2=B5secs before falling back to a sleeping w=
ait. */
> > +	*acked =3D req_mask;
> > +	ret =3D read_poll_timeout_atomic(READ_ONCE, ack,
> > +				       (ack & req_mask) =3D=3D req,
> > +				       0, 10, 0,
> > +				       *ack_ptr);
> > +	if (!ret)
> > +		return 0;
> > +
> > +	if (wait_event_timeout(*wq, (READ_ONCE(*ack_ptr) & req_mask) =3D=3D r=
eq,
> > +			       msecs_to_jiffies(timeout_ms)))
> > +		return 0;
> > +
> > +	/* Check one last time, in case we were not woken up for some reason.=
 */
> > +	ack =3D READ_ONCE(*ack_ptr);
> > +	if ((ack & req_mask) =3D=3D req)
> > +		return 0;
> > +
> > +	*acked =3D ~(req ^ ack) & req_mask;
> > +	return -ETIMEDOUT;
> > +}
> > +
> > +/**
> > + * panthor_fw_glb_wait_acks() - Wait for global requests to be acknowl=
edged.
> > + * @ptdev: Device.
> > + * @req_mask: Mask of requests to wait for.
> > + * @acked: Pointer to field that's updated with the acked requests.
> > + * If the function returns 0, *acked =3D=3D req_mask.
> > + * @timeout_ms: Timeout expressed in milliseconds.
> > + *
> > + * Return: 0 on success, -ETIMEDOUT otherwise.
> > + */
> > +int panthor_fw_glb_wait_acks(struct panthor_device *ptdev,
> > +			     u32 req_mask, u32 *acked,
> > +			     u32 timeout_ms)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +
> > +	/* GLB_HALT doesn't get acked through the FW interface. */
> > +	if (drm_WARN_ON(&ptdev->base, req_mask & (~GLB_REQ_MASK | GLB_HALT)))
> > +		return -EINVAL;
> > +
> > +	return panthor_fw_wait_acks(&glb_iface->input->req,
> > +				    &glb_iface->output->ack,
> > +				    &ptdev->fw->waitqueues[31],
> > +				    req_mask, acked, timeout_ms);
> > +}
> > +
> > +/**
> > + * panthor_fw_glb_wait_acks() - Wait for command stream group requests=
 to be acknowledged.
> > + * @ptdev: Device.
> > + * @req_mask: Mask of requests to wait for.
> > + * @acked: Pointer to field that's updated with the acked requests.
> > + * If the function returns 0, *acked =3D=3D req_mask.
> > + * @timeout_ms: Timeout expressed in milliseconds.
> > + *
> > + * Return: 0 on success, -ETIMEDOUT otherwise.
> > + */
> > +int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_slo=
t,
> > +			     u32 req_mask, u32 *acked, u32 timeout_ms)
> > +{
> > +	struct panthor_fw_csg_iface *csg_iface =3D panthor_fw_get_csg_iface(p=
tdev, csg_slot);
> > +	int ret;
> > +
> > +	if (drm_WARN_ON(&ptdev->base, req_mask & ~CSG_REQ_MASK))
> > +		return -EINVAL;
> > +
> > +	ret =3D panthor_fw_wait_acks(&csg_iface->input->req,
> > +				   &csg_iface->output->ack,
> > +				   &ptdev->fw->waitqueues[csg_slot],
> > +				   req_mask, acked, timeout_ms);
> > +
> > +	if (ret && (*acked & CSG_STATE_MASK) !=3D CSG_STATE_MASK)
> > +		*acked &=3D ~CSG_STATE_MASK; =20
>=20
> I think this could do with a comment, it took me a while to work out
> what this was about. If I understand correctly this is attempting to
> check that all the bits in the STATE field were updated, and if any
> mismatch then clearing all those bits in the 'acked' mask. This enables
> code to do a "acked & CSG_STATE_MASK" check and get the right value
> (rather than having to do "(acked & CSG_STATE_MASK) =3D=3D CSG_STATE_MASK=
").

Right. I'll add a comment.

>=20
> AFAICT the "ret &&" part is also redundant.

Indeed, I'll drop it.

>=20
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * panthor_fw_ring_csg_doorbells() - Ring command stream group doorbel=
ls.
> > + * @ptdev: Device.
> > + * @csg_mask: Bitmask encoding the command stream group doorbells to r=
ing.
> > + *
> > + * This function is toggling bits in the doorbell_req and ringing the
> > + * global doorbell. It doesn't require a user doorbell to be attached =
to
> > + * the group.
> > + */
> > +void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 c=
sg_mask)
> > +{
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +
> > +	panthor_fw_toggle_reqs(glb_iface, doorbell_req, doorbell_ack, csg_mas=
k);
> > +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> > +}
> > +
> > +static void panthor_fw_ping_work(struct work_struct *work)
> > +{
> > +	struct panthor_fw *fw =3D container_of(work, struct panthor_fw, watch=
dog.ping_work.work);
> > +	struct panthor_device *ptdev =3D fw->irq.ptdev;
> > +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_ifac=
e(ptdev);
> > +	u32 acked;
> > +	int ret;
> > +
> > +	if (panthor_device_reset_is_pending(ptdev))
> > +		return;
> > +
> > +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PING);
> > +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> > +
> > +	ret =3D panthor_fw_glb_wait_acks(ptdev, GLB_PING, &acked, 100);
> > +	if (ret) {
> > +		panthor_device_schedule_reset(ptdev);
> > +		drm_err(&ptdev->base, "FW ping timeout, scheduling a reset");
> > +	} else {
> > +		mod_delayed_work(ptdev->reset.wq, &fw->watchdog.ping_work,
> > +				 msecs_to_jiffies(PING_INTERVAL_MS));
> > +	}
> > +}
> > +
> > +/**
> > + * panthor_fw_init() - Initialize FW related data.
> > + * @ptdev: Device.
> > + *
> > + * Return: 0 on success, a negative error code otherwise.
> > + */
> > +int panthor_fw_init(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw *fw;
> > +	int ret, irq;
> > +
> > +	fw =3D drmm_kzalloc(&ptdev->base, sizeof(*fw), GFP_KERNEL);
> > +	if (!fw)
> > +		return -ENOMEM;
> > +
> > +	ptdev->fw =3D fw;
> > +	for (u32 i =3D 0; i < ARRAY_SIZE(fw->waitqueues); i++)
> > +		init_waitqueue_head(&fw->waitqueues[i]);
> > +
> > +	INIT_LIST_HEAD(&fw->sections);
> > +	INIT_DELAYED_WORK(&fw->watchdog.ping_work, panthor_fw_ping_work);
> > +
> > +	irq =3D platform_get_irq_byname(to_platform_device(ptdev->base.dev), =
"job");
> > +	if (irq <=3D 0)
> > +		return -ENODEV;
> > +
> > +	ret =3D panthor_request_job_irq(ptdev, &fw->irq, irq, 0);
> > +	if (ret) {
> > +		drm_err(&ptdev->base, "failed to request job irq");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D panthor_gpu_l2_power_on(ptdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	fw->vm =3D panthor_vm_create(ptdev, true,
> > +				   CSF_MCU_SHARED_REGION_START,
> > +				   CSF_MCU_SHARED_REGION_SIZE);
> > +	if (IS_ERR(fw->vm)) {
> > +		ret =3D PTR_ERR(fw->vm);
> > +		fw->vm =3D NULL;
> > +		goto err_unplug_fw;
> > +	}
> > +
> > +	ret =3D panthor_fw_load(ptdev);
> > +	if (ret)
> > +		goto err_unplug_fw;
> > +
> > +	ret =3D panthor_vm_active(fw->vm);
> > +	if (ret)
> > +		goto err_unplug_fw;
> > +
> > +	ret =3D panthor_fw_start(ptdev);
> > +	if (ret)
> > +		goto err_unplug_fw;
> > +
> > +	ret =3D panthor_fw_init_ifaces(ptdev);
> > +	if (ret)
> > +		goto err_unplug_fw;
> > +
> > +	panthor_fw_init_global_iface(ptdev);
> > +	return 0;
> > +
> > +err_unplug_fw:
> > +	panthor_fw_unplug(ptdev);
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/pan=
thor/panthor_fw.h
> > new file mode 100644
> > index 000000000000..929760c2a46b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> > @@ -0,0 +1,505 @@
> > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > +/* Copyright 2023 Collabora ltd. */
> > +
> > +#ifndef __PANTHOR_MCU_H__
> > +#define __PANTHOR_MCU_H__
> > +
> > +#include <linux/types.h>
> > +
> > +#include "panthor_device.h"
> > +
> > +struct panthor_fw_mem;
> > +
> > +#define MAX_CSGS				31
> > +#define MAX_CS_PER_CSG                          32
> > +
> > +struct panthor_fw_ringbuf_input_iface {
> > +	u64 insert;
> > +	u64 extract;
> > +} __packed;
> > +
> > +struct panthor_fw_ringbuf_output_iface {
> > +	u64 extract;
> > +	u32 active;
> > +} __packed; =20
>=20
> Is there a good reason for these to be marked '__packed'? They are
> naturally aligned so there's no padding, and we guarantee they are page
> aligned. The compiler might have more freedom if they are not marked
> __packed.

Nope, no good reason.

>=20
> > +
> > +struct panthor_fw_cs_control_iface {
> > +#define CS_FEATURES_WORK_REGS(x)		(((x) & GENMASK(7, 0)) + 1)
> > +#define CS_FEATURES_SCOREBOARDS(x)		(((x) & GENMASK(15, 8)) >> 8)
> > +#define CS_FEATURES_COMPUTE			BIT(16)
> > +#define CS_FEATURES_FRAGMENT			BIT(17)
> > +#define CS_FEATURES_TILER			BIT(18)
> > +	u32 features;
> > +	u32 input_va;
> > +	u32 output_va;
> > +} __packed; =20
>=20
> Here I have to admit I can't find a statement in the spec saying that
> the stride must be a multiple of 4 bytes... but kbase makes that assumpti=
on.

The stride of?

>=20
> > +
> > +struct panthor_fw_cs_input_iface {
> > +#define CS_STATE_MASK				GENMASK(2, 0)
> > +#define CS_STATE_STOP				0
> > +#define CS_STATE_START				1
> > +#define CS_EXTRACT_EVENT			BIT(4)
> > +#define CS_IDLE_SYNC_WAIT			BIT(8)
> > +#define CS_IDLE_PROTM_PENDING			BIT(9)
> > +#define CS_IDLE_EMPTY				BIT(10)
> > +#define CS_IDLE_RESOURCE_REQ			BIT(11)
> > +#define CS_TILER_OOM				BIT(26)
> > +#define CS_PROTM_PENDING			BIT(27)
> > +#define CS_FATAL				BIT(30)
> > +#define CS_FAULT				BIT(31)
> > +#define CS_REQ_MASK				(CS_STATE_MASK | \
> > +						 CS_EXTRACT_EVENT | \
> > +						 CS_IDLE_SYNC_WAIT | \
> > +						 CS_IDLE_PROTM_PENDING | \
> > +						 CS_IDLE_EMPTY | \
> > +						 CS_IDLE_RESOURCE_REQ)
> > +#define CS_EVT_MASK				(CS_TILER_OOM | \
> > +						 CS_PROTM_PENDING | \
> > +						 CS_FATAL | \
> > +						 CS_FAULT)
> > +	u32 req;
> > +
> > +#define CS_CONFIG_PRIORITY(x)			((x) & GENMASK(3, 0))
> > +#define CS_CONFIG_DOORBELL(x)			(((x) << 8) & GENMASK(15, 8))
> > +	u32 config;
> > +	u32 reserved1;
> > +	u32 ack_irq_mask;
> > +	u64 ringbuf_base;
> > +	u32 ringbuf_size;
> > +	u32 reserved2;
> > +	u64 heap_start;
> > +	u64 heap_end;
> > +	u64 ringbuf_input;
> > +	u64 ringbuf_output;
> > +	u32 instr_config;
> > +	u32 instrbuf_size;
> > +	u64 instrbuf_base;
> > +	u64 instrbuf_offset_ptr;
> > +} __packed; =20
>=20
> The spec says this has a minimal alignment of 64 bytes. Although I guess
> the code should check this if we remove __packed and rely on it.

The allocation granularity is 4k, and we're not even in control of the
offset inside the FW interface section. So yes, we can check it when
parsing the FW sections, but there's no point adding __aligned() here.

>=20
> > +
> > +struct panthor_fw_cs_output_iface {
> > +	u32 ack;
> > +	u32 reserved1[15];
> > +	u64 status_cmd_ptr;
> > +
> > +#define CS_STATUS_WAIT_SB_MASK			GENMASK(15, 0)
> > +#define CS_STATUS_WAIT_SB_SRC_MASK		GENMASK(19, 16)
> > +#define CS_STATUS_WAIT_SB_SRC_NONE		(0 << 16)
> > +#define CS_STATUS_WAIT_SB_SRC_WAIT		(8 << 16)
> > +#define CS_STATUS_WAIT_SYNC_COND_LE		(0 << 24)
> > +#define CS_STATUS_WAIT_SYNC_COND_GT		(1 << 24)
> > +#define CS_STATUS_WAIT_SYNC_COND_MASK		GENMASK(27, 24)
> > +#define CS_STATUS_WAIT_PROGRESS			BIT(28)
> > +#define CS_STATUS_WAIT_PROTM			BIT(29)
> > +#define CS_STATUS_WAIT_SYNC_64B			BIT(30)
> > +#define CS_STATUS_WAIT_SYNC			BIT(31)
> > +	u32 status_wait;
> > +	u32 status_req_resource;
> > +	u64 status_wait_sync_ptr;
> > +	u32 status_wait_sync_value;
> > +	u32 status_scoreboards;
> > +
> > +#define CS_STATUS_BLOCKED_REASON_UNBLOCKED	0
> > +#define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
> > +#define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
> > +#define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
> > +#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
> > +#define CS_STATUS_BLOCKED_REASON_RES		6
> > +#define CS_STATUS_BLOCKED_REASON_FLUSH		7
> > +#define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
> > +	u32 status_blocked_reason;
> > +	u32 status_wait_sync_value_hi;
> > +	u32 reserved2[6];
> > +
> > +#define CS_EXCEPTION_TYPE(x)			((x) & GENMASK(7, 0))
> > +#define CS_EXCEPTION_DATA(x)			(((x) >> 8) & GENMASK(23, 0))
> > +	u32 fault;
> > +	u32 fatal;
> > +	u64 fault_info;
> > +	u64 fatal_info;
> > +	u32 reserved3[10];
> > +	u32 heap_vt_start;
> > +	u32 heap_vt_end;
> > +	u32 reserved4;
> > +	u32 heap_frag_end;
> > +	u64 heap_address;
> > +} __packed; =20
>=20
> output is the same as input.

You mean in term of alignment?

>=20
> > +
> > +struct panthor_fw_csg_control_iface {
> > +	u32 features;
> > +	u32 input_va;
> > +	u32 output_va;
> > +	u32 suspend_size;
> > +	u32 protm_suspend_size;
> > +	u32 stream_num;
> > +	u32 stream_stride;
> > +} __packed; =20
>=20
> The spec is ambigious here. It one place it states the stride is 256
> bytes, but in another that you need to look at the GLB_GROUP_STRIDE
> value. In practice we can rely on 4 byte alignment.
>=20
> I'm beginning to wonder if it's worth worrying about, I think I'll stop
> here ;)

Hehe. I'll add checks where I can in the parsing logic. I guess having
things naturally aligned and making sure there's no overlap with other
interfaces is a minimum.
