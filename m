Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DCD13E257
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE7E6EDF9;
	Thu, 16 Jan 2020 16:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA116EDF9;
 Thu, 16 Jan 2020 16:55:59 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 08:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="274079776"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 16 Jan 2020 08:55:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Jan 2020 18:55:53 +0200
Date: Thu, 16 Jan 2020 18:55:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH v2 2/2] drm/i915/gen7: Clear all EU/L3
 residual contexts
Message-ID: <20200116165553.GI13686@intel.com>
References: <20200114174549.74643-1-akeem.g.abodunrin@intel.com>
 <20200114174549.74643-3-akeem.g.abodunrin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114174549.74643-3-akeem.g.abodunrin@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: tony.luck@intel.com, d.scott.phillips@intel.com, omer.aran@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 david.c.stewart@intel.com, dri-devel@lists.freedesktop.org,
 sudeep.dutt@intel.com, pragyansri.pathi@intel.com, jon.bloomfield@intel.com,
 chris.p.wilson@intel.com, joonas.lahtinen@intel.com,
 francesco.balestrieri@intel.com, daniel.vetter@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 09:45:48AM -0800, Akeem G Abodunrin wrote:
> From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> =

> On gen7 and gen7.5 devices, there could be leftover data residuals in
> EU/L3 from the retiring context. This patch introduces workaround to clear
> that residual contexts, by submitting a batch buffer with dedicated HW
> context to the GPU with ring allocation for each context switching.
> =

> V2: Addressed comments about unused code, code formatting, and include
> additional debug code
> =

> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Balestrieri Francesco <francesco.balestrieri@intel.com>
> Cc: Bloomfield Jon <jon.bloomfield@intel.com>
> Cc: Dutt Sudeep <sudeep.dutt@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gt/gen7_renderclear.c    | 515 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/gen7_renderclear.h    |  16 +
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  17 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   3 +-
>  drivers/gpu/drm/i915/i915_utils.h             |   5 +
>  6 files changed, 553 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/gen7_renderclear.c
>  create mode 100644 drivers/gpu/drm/i915/gt/gen7_renderclear.h
> =

> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index b8c5f8934dbd..e5386871f015 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -75,6 +75,7 @@ gt-y +=3D \
>  	gt/debugfs_gt.o \
>  	gt/debugfs_gt_pm.o \
>  	gt/gen6_ppgtt.o \
> +	gt/gen7_renderclear.o \
>  	gt/gen8_ppgtt.o \
>  	gt/intel_breadcrumbs.o \
>  	gt/intel_context.o \
> diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm=
/i915/gt/gen7_renderclear.c
> new file mode 100644
> index 000000000000..6fe2a6fcbddd
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
> @@ -0,0 +1,515 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2019 Intel Corporation
> + */
> +
> +#include "gen7_renderclear.h"
> +#include "i915_drv.h"
> +#include "i915_utils.h"
> +#include "intel_gpu_commands.h"
> +
> +#define MAX_URB_ENTRIES 64
> +#define STATE_SIZE (4 * 1024)
> +#define GT3_INLINE_DATA_DELAYS 0x1E00
> +
> +/* Media CB Kernel for gen7 devices */
> +static const u32 cb7_kernel[][4] =3D {
> +	{ 0x00000001, 0x26020128, 0x00000024, 0x00000000 },
> +	{ 0x00000040, 0x20280c21, 0x00000028, 0x00000001 },
> +	{ 0x01000010, 0x20000c20, 0x0000002c, 0x00000000 },
> +	{ 0x00010220, 0x34001c00, 0x00001400, 0x0000002c },
> +	{ 0x00600001, 0x20600061, 0x00000000, 0x00000000 },
> +	{ 0x00000008, 0x20601c85, 0x00000e00, 0x0000000c },
> +	{ 0x00000005, 0x20601ca5, 0x00000060, 0x00000001 },
> +	{ 0x00000008, 0x20641c85, 0x00000e00, 0x0000000d },
> +	{ 0x00000005, 0x20641ca5, 0x00000064, 0x00000003 },
> +	{ 0x00000041, 0x207424a5, 0x00000064, 0x00000034 },
> +	{ 0x00000040, 0x206014a5, 0x00000060, 0x00000074 },
> +	{ 0x00000008, 0x20681c85, 0x00000e00, 0x00000008 },
> +	{ 0x00000005, 0x20681ca5, 0x00000068, 0x0000000f },
> +	{ 0x00000041, 0x20701ca5, 0x00000060, 0x00000010 },
> +	{ 0x00000040, 0x206814a5, 0x00000068, 0x00000070 },
> +	{ 0x00600001, 0x20a00061, 0x00000000, 0x00000000 },
> +	{ 0x00000005, 0x206c1c85, 0x00000e00, 0x00000007 },
> +	{ 0x00000041, 0x206c1ca5, 0x0000006c, 0x00000004 },
> +	{ 0x00600001, 0x20800021, 0x008d0000, 0x00000000 },
> +	{ 0x00000001, 0x20800021, 0x0000006c, 0x00000000 },
> +	{ 0x00000001, 0x20840021, 0x00000068, 0x00000000 },
> +	{ 0x00000001, 0x20880061, 0x00000000, 0x00000003 },
> +	{ 0x00000005, 0x208c0d21, 0x00000086, 0xffffffff },
> +	{ 0x05600032, 0x20a01fa1, 0x008d0080, 0x02190001 },
> +	{ 0x00000040, 0x20a01ca5, 0x000000a0, 0x00000001 },
> +	{ 0x05600032, 0x20a01fa1, 0x008d0080, 0x040a8001 },
> +	{ 0x02000040, 0x20281c21, 0x00000028, 0xffffffff },
> +	{ 0x00010220, 0x34001c00, 0x00001400, 0xfffffffc },
> +	{ 0x00000001, 0x26020128, 0x00000024, 0x00000000 },
> +	{ 0x00000001, 0x220000e4, 0x00000000, 0x00000000 },
> +	{ 0x00000001, 0x220801ec, 0x00000000, 0x007f007f },
> +	{ 0x00600001, 0x20400021, 0x008d0000, 0x00000000 },
> +	{ 0x00600001, 0x2fe00021, 0x008d0000, 0x00000000 },
> +	{ 0x00200001, 0x20400121, 0x00450020, 0x00000000 },
> +	{ 0x00000001, 0x20480061, 0x00000000, 0x000f000f },
> +	{ 0x00000005, 0x204c0d21, 0x00000046, 0xffffffef },
> +	{ 0x00800001, 0x20600061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x20800061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x20a00061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x20c00061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x20e00061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x21000061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x21200061, 0x00000000, 0x00000000 },
> +	{ 0x00800001, 0x21400061, 0x00000000, 0x00000000 },
> +	{ 0x05600032, 0x20001fa0, 0x008d0040, 0x120a8000 },
> +	{ 0x00000040, 0x20402d21, 0x00000020, 0x00100010 },
> +	{ 0x05600032, 0x20001fa0, 0x008d0040, 0x120a8000 },
> +	{ 0x02000040, 0x22083d8c, 0x00000208, 0xffffffff },
> +	{ 0x00800001, 0xa0000109, 0x00000602, 0x00000000 },
> +	{ 0x00000040, 0x22001c84, 0x00000200, 0x00000020 },
> +	{ 0x00010220, 0x34001c00, 0x00001400, 0xfffffff8 },
> +	{ 0x07600032, 0x20001fa0, 0x008d0fe0, 0x82000010 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +	{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
> +};

Where's the asm/whatever source for these kernels?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
