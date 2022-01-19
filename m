Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB2493553
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 08:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103F810E160;
	Wed, 19 Jan 2022 07:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0240D10E15E;
 Wed, 19 Jan 2022 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642576748; x=1674112748;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:cc:from:to:message-id:date;
 bh=U11FsSd+RcmsuMCjzedMUZHCqkxwlu7stIB+AIRW0FE=;
 b=GyC7rmI09yluM5cWQcrgycSfTJICL98CkQl9DT6LVTBaLi8Ah+0eZA8+
 NLG1qul90BmcanfUK+bnkYLWWvA9iBusfZrc4lhclTk+80YJZelU7CAJF
 5H9xTeT4VqY5mD5yKMGhLp78T/w0R36bP9tC4j7S1AnBrZ+KxpOBEgMEl
 cpaCs/SLIfyzPYZ7s/Sdd2o+Mt7rlOnpJx7tz2hnqKPnrLzeABXxR4SM0
 07bnOvZKq5eHiMOEFrR0LVPGt5Z8JsL4Hz/2i5MOmzJaPTLWEtUNMLl1C
 TVASN+LWHkKGWYjceOj+LtfDdxnIlEytYsJ8d37olmAabFzTwXxamaMFj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245200558"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="245200558"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:19:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="492937839"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.254.207])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:19:02 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ccbd6b7b-49ef-677f-ca3a-0e99c449f35d@linux.intel.com>
References: <20220117150910.231889-1-andi.shyti@linux.intel.com>
 <20220117150910.231889-3-andi.shyti@linux.intel.com>
 <ccbd6b7b-49ef-677f-ca3a-0e99c449f35d@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/gt: make a gt sysfs group and
 move power management files
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <164257674010.4293.7082663050451897157@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 19 Jan 2022 09:19:00 +0200
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2022-01-17 18:02:50)
>=20
> On 17/01/2022 15:09, Andi Shyti wrote:
> > The GT has its own properties and in sysfs they should be grouped
> > in the 'gt/' directory.
> >=20
> > Create a 'gt/' directory in sysfs which will contain gt0...gtN
> > directories related to each tile configured in the GPU. Move the
> > power management files inside those directories.
> >=20
> > The previous power management files are kept in their original
> > root directory to avoid breaking the ABI. They point to the tile
> > '0' and a warning message is printed whenever accessed to.

This is wrong. They should act as multiplexers to all the tiles.

Needs to be fixed before merging.

> > The
> > deprecated interface needs for the CONFIG_SYSFS_DEPRECATED_V2
> > flag in order to be generated.
>=20
> CONFIG_SYSFS_DEPRECATED_V2 idea was abandoned, no? This patch at least=20
> does not appear to contain it so please update the commit message to=20
> reflect current state.
>=20
> Adding Joonas to help address the question of how strict are userspace=20
> requirements for sysfs additions. Personally sysadmin use sounds fine to =

> me, although it needs to be mentioned/documented as Matt requested, but=20
> I fear it may not be enough to upstream. Is Level0 at the stage where we =

> can upstream for it I am also not sure.

Sysadmin usage is fine for the simple interfaces that can truly be used
from the command line. This patch seems to just expose the existing
interface in per-tile manner, so should not be a concern.

However, the controls not under gt directories, need to be converted to
apply to all tiles. (I've definitely given that feedback multiple
times). Otherwise it will be very unexpected to the end user when what
previously applied to whole device would only apply to part of it.

Regards, Joonas

>=20
> While I am here I also left some nits below (not full review).
>=20
> >=20
> > The new sysfs structure will have a similar layout for the 4 tile
> > case:
> >=20
> > /sys/.../card0
> >           \u251c\u2500\u2500 gt
> >           \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 gt0
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 id
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rc6_=
enable
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rc6_=
residency_ms
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
act_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
boost_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
cur_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
max_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
min_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
RP0_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rps_=
RP1_freq_mhz
> >           \u2502=C2=A0=C2=A0 \u2502=C2=A0  \u2514\u2500\u2500 rps_RPn_f=
req_mhz
> >        .   .
> >        .   .
> >        .   .
> >           \u2502=C2=A0=C2=A0 \u2514\u2500\u2500 gt3
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 id
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rc6_enable
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rc6_residency_ms
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_act_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_boost_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_cur_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_max_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_min_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_RP0_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rps_RP1_freq_mhz
> >           \u2502=C2=A0=C2=A0     \u2514\u2500\u2500 rps_RPn_freq_mhz
> >           \u251c\u2500\u2500 gt_act_freq_mhz   -+
> >           \u251c\u2500\u2500 gt_boost_freq_mhz  |
> >           \u251c\u2500\u2500 gt_cur_freq_mhz    |    Original interface
> >           \u251c\u2500\u2500 gt_max_freq_mhz    +\u2500-> kept as exist=
ing ABI;
> >           \u251c\u2500\u2500 gt_min_freq_mhz    |    it points to gt0/
> >           \u251c\u2500\u2500 gt_RP0_freq_mhz    |
> >           \u2514\u2500\u2500 gt_RP1_freq_mhz    |
> >           \u2514\u2500\u2500 gt_RPn_freq_mhz   -+
> >=20
> > As soon as multitile platforms will start being supported, this
> > interface will allow to control the power (either manually or
> > with tools) on each tile, instead of affecting only tile 0 and
> > getting incomplete results.
> >=20
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > ---
> >   drivers/gpu/drm/i915/Makefile         |   4 +-
> >   drivers/gpu/drm/i915/gt/intel_gt.c    |   2 +
> >   drivers/gpu/drm/i915/gt/sysfs_gt.c    | 126 +++++++++
> >   drivers/gpu/drm/i915/gt/sysfs_gt.h    |  44 +++
> >   drivers/gpu/drm/i915/gt/sysfs_gt_pm.c | 393 ++++++++++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/sysfs_gt_pm.h |  16 ++
> >   drivers/gpu/drm/i915/i915_drv.h       |   2 +
> >   drivers/gpu/drm/i915/i915_reg.h       |   1 +
> >   drivers/gpu/drm/i915/i915_sysfs.c     | 315 +--------------------
> >   drivers/gpu/drm/i915/i915_sysfs.h     |   3 +
> >   10 files changed, 600 insertions(+), 306 deletions(-)
> >   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.c
> >   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.h
> >   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
> >   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.h
> >=20
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makef=
ile
> > index aa86ac33effc..5fd203c626fc 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -121,7 +121,9 @@ gt-y +=3D \
> >       gt/intel_timeline.o \
> >       gt/intel_workarounds.o \
> >       gt/shmem_utils.o \
> > -     gt/sysfs_engines.o
> > +     gt/sysfs_engines.o \
> > +     gt/sysfs_gt.o \
> > +     gt/sysfs_gt_pm.o
> >   # autogenerated null render state
> >   gt-y +=3D \
> >       gt/gen6_renderstate.o \
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/=
gt/intel_gt.c
> > index 17927da9e23e..2584c51c1c14 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -25,6 +25,7 @@
> >   #include "intel_rps.h"
> >   #include "intel_uncore.h"
> >   #include "shmem_utils.h"
> > +#include "sysfs_gt.h"
> >   #include "pxp/intel_pxp.h"
> >  =20
> >   static void
> > @@ -453,6 +454,7 @@ void intel_gt_driver_register(struct intel_gt *gt)
> >       intel_rps_driver_register(&gt->rps);
> >  =20
> >       intel_gt_debugfs_register(gt);
> > +     intel_gt_sysfs_register(gt);
> >   }
> >  =20
> >   static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int si=
ze)
> > diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt.c b/drivers/gpu/drm/i915/=
gt/sysfs_gt.c
> > new file mode 100644
> > index 000000000000..46cf033a53ec
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/gt/sysfs_gt.c
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2020 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_device.h>
> > +#include <linux/device.h>
> > +#include <linux/kobject.h>
> > +#include <linux/printk.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include "i915_drv.h"
> > +#include "i915_sysfs.h"
> > +#include "intel_gt.h"
> > +#include "intel_gt_types.h"
> > +#include "intel_rc6.h"
> > +
> > +#include "sysfs_gt.h"
> > +#include "sysfs_gt_pm.h"
> > +
> > +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> > +                                         const char *name)
> > +{
> > +     struct kobject *kobj =3D &dev->kobj;
> > +
> > +     /*
> > +      * We are interested at knowing from where the interface
> > +      * has been called, whether it's called from gt/ or from
> > +      * the parent directory.
> > +      * From the interface position it depends also the value of
> > +      * the private data.
> > +      * If the interface is called from gt/ then private data is
> > +      * of the "struct intel_gt *" type, otherwise it's * a
> > +      * "struct drm_i915_private *" type.
> > +      */
> > +     if (!is_object_gt(kobj)) {
> > +             struct drm_i915_private *i915 =3D kdev_minor_to_i915(dev);
> > +
> > +             pr_devel_ratelimited(DEPRECATED
> > +                     "%s (pid %d) is trying to access deprecated %s "
> > +                     "sysfs control, please use gt/gt<n>/%s instead\n",
>=20
> Maybe reword "is trying to access" to "is accesing" to remove any doubt=20
> whether something is failing or not?
>=20
> > +                     current->comm, task_pid_nr(current), name, name);
> > +             return to_gt(i915);
> > +     }
> > +
> > +     return kobj_to_gt(kobj);
> > +}
> > +
> > +static struct kobject *gt_get_parent_obj(struct intel_gt *gt)
> > +{
> > +     return &gt->i915->drm.primary->kdev->kobj;
> > +}
> > +
> > +static ssize_t id_show(struct device *dev,
> > +                    struct device_attribute *attr,
> > +                    char *buf)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +
> > +     return sysfs_emit(buf, "%u\n", gt->info.id);
> > +}
> > +
> > +static DEVICE_ATTR_RO(id);
> > +
> > +static void kobj_gt_release(struct kobject *kobj)
> > +{
> > +     kfree(kobj);
> > +}
> > +
> > +static struct kobj_type kobj_gt_type =3D {
> > +     .release =3D kobj_gt_release,
> > +     .sysfs_ops =3D &kobj_sysfs_ops
> > +};
> > +
> > +struct kobject *
> > +intel_gt_create_kobj(struct intel_gt *gt, struct kobject *dir, const c=
har *name)
> > +{
> > +     struct kobj_gt *kg;
> > +
> > +     kg =3D kzalloc(sizeof(*kg), GFP_KERNEL);
> > +     if (!kg)
> > +             return NULL;
> > +
> > +     kobject_init(&kg->base, &kobj_gt_type);
> > +     kg->gt =3D gt;
> > +
> > +     /* xfer ownership to sysfs tree */
> > +     if (kobject_add(&kg->base, dir, "%s", name)) {
> > +             kobject_put(&kg->base);
> > +             return NULL;
> > +     }
> > +
> > +     return &kg->base; /* borrowed ref */
> > +}
> > +
> > +void intel_gt_sysfs_register(struct intel_gt *gt)
> > +{
> > +     struct kobject *dir;
> > +     char name[80];
> > +
> > +     /*
> > +      * We need to make things right with the
> > +      * ABI compatibility. The files were originally
> > +      * generated under the parent directory.
> > +      *
> > +      * We generate the files only for gt 0
> > +      * to avoid duplicates.
> > +      */
> > +     if (!gt->info.id)
> > +             intel_gt_sysfs_pm_init(gt, gt_get_parent_obj(gt));
> > +
> > +     snprintf(name, sizeof(name), "gt%d", gt->info.id);
> > +
> > +     dir =3D intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
> > +     if (!dir) {
> > +             drm_err(&gt->i915->drm,
> > +                     "failed to initialize %s sysfs root\n", name);
> > +             return;
> > +     }
> > +
> > +     if (sysfs_create_file(dir, &dev_attr_id.attr))
> > +             drm_err(&gt->i915->drm,
> > +                     "failed to create sysfs %s info files\n", name);
>=20
> These drm_err could maybe be warn or notice, to reflect the fact driver=20
> is most likely completely functional? But only maybe since I haven't=20
> checked what we do for other sysfs failures. If rest are drm_err then I=20
> guess consistency trumps it.
>=20
> > +
> > +     intel_gt_sysfs_pm_init(gt, dir);
> > +}
> > diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt.h b/drivers/gpu/drm/i915/=
gt/sysfs_gt.h
> > new file mode 100644
> > index 000000000000..cd80a14bb14d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/gt/sysfs_gt.h
> > @@ -0,0 +1,44 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2020 Intel Corporation
> > + */
> > +
> > +#ifndef __SYSFS_GT_H__
> > +#define __SYSFS_GT_H__
> > +
> > +#include <linux/ctype.h>
> > +#include <linux/kobject.h>
> > +
> > +#include "i915_gem.h" /* GEM_BUG_ON() */
> > +
> > +struct intel_gt;
> > +
> > +struct kobj_gt {
> > +     struct kobject base;
> > +     struct intel_gt *gt;
> > +};
> > +
> > +static inline bool is_object_gt(struct kobject *kobj)
> > +{
> > +     bool b =3D !strncmp(kobj->name, "gt", 2);
> > +
> > +     GEM_BUG_ON(b && !isdigit(kobj->name[2]));
>=20
> 1)
> Not sure what is the point of this GEM_BUG_ON? Checking strncmp works=20
> feels like an overkill.
>=20
> 2)
> With the recent trend of "static inline considered harmful" perhaps=20
> consider moving it out of line.
>=20
> > +
> > +     return b;
> > +}
> > +
> > +struct kobject *
> > +intel_gt_create_kobj(struct intel_gt *gt,
> > +                  struct kobject *dir,
> > +                  const char *name);
> > +
> > +static inline struct intel_gt *kobj_to_gt(struct kobject *kobj)
> > +{
> > +     return container_of(kobj, struct kobj_gt, base)->gt;
> > +}
> > +
> > +void intel_gt_sysfs_register(struct intel_gt *gt);
> > +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> > +                                         const char *name);
> > +
> > +#endif /* SYSFS_GT_H */
> > diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt_pm.c b/drivers/gpu/drm/i9=
15/gt/sysfs_gt_pm.c
> > new file mode 100644
> > index 000000000000..6f4424be42d1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
> > @@ -0,0 +1,393 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2020 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_device.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/printk.h>
> > +
> > +#include "i915_drv.h"
> > +#include "intel_gt.h"
> > +#include "intel_rc6.h"
> > +#include "intel_rps.h"
> > +#include "sysfs_gt.h"
> > +#include "sysfs_gt_pm.h"
> > +
> > +#ifdef CONFIG_PM
> > +static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
> > +{
> > +     intel_wakeref_t wakeref;
> > +     u64 res =3D 0;
> > +
> > +     with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> > +             res =3D intel_rc6_residency_us(&gt->rc6, reg);
> > +
> > +     return DIV_ROUND_CLOSEST_ULL(res, 1000);
> > +}
> > +
> > +static ssize_t rc6_enable_show(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     u8 mask =3D 0;
> > +
> > +     if (HAS_RC6(gt->i915))
> > +             mask |=3D BIT(0);
> > +     if (HAS_RC6p(gt->i915))
> > +             mask |=3D BIT(1);
> > +     if (HAS_RC6pp(gt->i915))
> > +             mask |=3D BIT(2);
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%x\n", mask);
> > +}
> > +
> > +static ssize_t rc6_residency_ms_show(struct device *dev,
> > +                                  struct device_attribute *attr,
> > +                                  char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     u32 rc6_residency =3D get_residency(gt, GEN6_GT_GFX_RC6);
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%u\n", rc6_residency);
> > +}
> > +
> > +static ssize_t rc6p_residency_ms_show(struct device *dev,
> > +                                   struct device_attribute *attr,
> > +                                   char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     u32 rc6p_residency =3D get_residency(gt, GEN6_GT_GFX_RC6p);
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%u\n", rc6p_residency);
> > +}
> > +
> > +static ssize_t rc6pp_residency_ms_show(struct device *dev,
> > +                                    struct device_attribute *attr,
> > +                                    char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     u32 rc6pp_residency =3D get_residency(gt, GEN6_GT_GFX_RC6pp);
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%u\n", rc6pp_residency);
> > +}
> > +
> > +static ssize_t media_rc6_residency_ms_show(struct device *dev,
> > +                                        struct device_attribute *attr,
> > +                                        char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     u32 rc6_residency =3D get_residency(gt, VLV_GT_MEDIA_RC6);
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%u\n", rc6_residency);
> > +}
> > +
> > +static DEVICE_ATTR_RO(rc6_enable);
> > +static DEVICE_ATTR_RO(rc6_residency_ms);
> > +static DEVICE_ATTR_RO(rc6p_residency_ms);
> > +static DEVICE_ATTR_RO(rc6pp_residency_ms);
> > +static DEVICE_ATTR_RO(media_rc6_residency_ms);
> > +
> > +static struct attribute *rc6_attrs[] =3D {
> > +     &dev_attr_rc6_enable.attr,
> > +     &dev_attr_rc6_residency_ms.attr,
> > +     NULL
> > +};
> > +
> > +static struct attribute *rc6p_attrs[] =3D {
> > +     &dev_attr_rc6p_residency_ms.attr,
> > +     &dev_attr_rc6pp_residency_ms.attr,
> > +     NULL
> > +};
> > +
> > +static struct attribute *media_rc6_attrs[] =3D {
> > +     &dev_attr_media_rc6_residency_ms.attr,
> > +     NULL
> > +};
> > +
> > +static const struct attribute_group rc6_attr_group[] =3D {
> > +     { .name =3D power_group_name, .attrs =3D rc6_attrs },
> > +     { .attrs =3D rc6_attrs }
> > +};
> > +
> > +static const struct attribute_group rc6p_attr_group[] =3D {
> > +     { .name =3D power_group_name, .attrs =3D rc6p_attrs },
> > +     { .attrs =3D rc6p_attrs }
> > +};
> > +
> > +static const struct attribute_group media_rc6_attr_group[] =3D {
> > +     { .name =3D power_group_name, .attrs =3D media_rc6_attrs },
> > +     { .attrs =3D media_rc6_attrs }
> > +};
> > +
> > +static int __intel_gt_sysfs_create_group(struct kobject *kobj,
> > +                                      const struct attribute_group *gr=
p)
> > +{
> > +     int i =3D is_object_gt(kobj);
>=20
> Is_object_gt returns a bool so can I be pedantic? :) Maybe just omit the =

> local and solve it like that.
>=20
> > +
> > +     return i ? sysfs_create_group(kobj, &grp[i]) :
> > +                sysfs_merge_group(kobj, &grp[i]);
> > +}
> > +
> > +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *=
kobj)
> > +{
> > +     int ret;
> > +
> > +     if (!HAS_RC6(gt->i915))
> > +             return;
> > +
> > +     ret =3D __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
> > +     if (ret)
> > +             drm_err(&gt->i915->drm,
> > +                     "failed to create gt%u RC6 sysfs files\n", gt->in=
fo.id);
> > +
> > +     if (HAS_RC6p(gt->i915)) {
> > +             ret =3D __intel_gt_sysfs_create_group(kobj, rc6p_attr_gro=
up);
> > +             if (ret)
> > +                     drm_err(&gt->i915->drm,
> > +                             "failed to create gt%u RC6p sysfs files\n=
",
> > +                             gt->info.id);
> > +     }
> > +
> > +     if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915)) {
> > +             ret =3D __intel_gt_sysfs_create_group(kobj, media_rc6_att=
r_group);
> > +             if (ret)
> > +                     drm_err(&gt->i915->drm,
> > +                             "failed to create media %u RC6 sysfs file=
s\n",
> > +                             gt->info.id);
> > +     }
> > +}
> > +#else
> > +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *=
kobj)
> > +{
> > +}
> > +#endif /* CONFIG_PM */
> > +
> > +static ssize_t act_freq_mhz_show(struct device *dev,
> > +                              struct device_attribute *attr, char *buf=
f)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%d\n",
> > +                     intel_rps_read_actual_frequency(&gt->rps));
> > +}
> > +
> > +static ssize_t cur_freq_mhz_show(struct device *dev,
> > +                              struct device_attribute *attr, char *buf=
f)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%d\n",
> > +                      intel_rps_get_requested_frequency(rps));
> > +}
> > +
> > +static ssize_t boost_freq_mhz_show(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%d\n",
> > +                      intel_rps_get_boost_frequency(rps));
> > +}
> > +
> > +static ssize_t boost_freq_mhz_store(struct device *dev,
> > +                                 struct device_attribute *attr,
> > +                                 const char *buff, size_t count)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +     bool boost =3D false;
> > +     ssize_t ret;
> > +     u32 val;
> > +
> > +     ret =3D kstrtou32(buff, 0, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Validate against (static) hardware limits */
> > +     val =3D intel_freq_opcode(rps, val);
> > +     if (val < rps->min_freq || val > rps->max_freq)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&rps->lock);
> > +     if (val !=3D rps->boost_freq) {
> > +             rps->boost_freq =3D val;
> > +             boost =3D atomic_read(&rps->num_waiters);
> > +     }
> > +     mutex_unlock(&rps->lock);
> > +     if (boost)
> > +             schedule_work(&rps->work);
> > +
> > +     return count;
> > +}
> > +
> > +static ssize_t vlv_rpe_freq_mhz_show(struct device *dev,
> > +                                  struct device_attribute *attr, char =
*buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%d\n",
> > +                     intel_gpu_freq(rps, rps->efficient_freq));
> > +}
> > +
> > +static ssize_t max_freq_mhz_show(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +
> > +     return sysfs_emit(buff, "%d\n", intel_rps_get_max_frequency(rps));
> > +}
> > +
> > +static ssize_t max_freq_mhz_store(struct device *dev,
> > +                               struct device_attribute *attr,
> > +                               const char *buff, size_t count)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +     ssize_t ret;
> > +     u32 val;
> > +
> > +     ret =3D kstrtou32(buff, 0, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D intel_rps_set_max_frequency(rps, val);
> > +
> > +     return ret ?: count;
> > +}
> > +
> > +static ssize_t min_freq_mhz_show(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +
> > +     return sysfs_emit(buff, "%d\n", intel_rps_get_min_frequency(rps));
> > +}
> > +
> > +static ssize_t min_freq_mhz_store(struct device *dev,
> > +                               struct device_attribute *attr,
> > +                               const char *buff, size_t count)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +     ssize_t ret;
> > +     u32 val;
> > +
> > +     ret =3D kstrtou32(buff, 0, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D intel_rps_set_min_frequency(rps, val);
> > +
> > +     return ret ?: count;
> > +}
> > +
> > +#define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
> > +     struct device_attribute dev_attr_gt_##_name =3D __ATTR(gt_##_name=
, _mode, _show, _store); \
> > +     struct device_attribute dev_attr_rps_##_name =3D __ATTR(rps_##_na=
me, _mode, _show, _store)
> > +
> > +#define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)                            \
> > +             INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
> > +#define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)                            \
> > +             INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name#=
#_store)
> > +
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
> > +static INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
> > +
> > +static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
> > +
> > +static ssize_t rps_rp_mhz_show(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            char *buff);
> > +
> > +static INTEL_GT_RPS_SYSFS_ATTR(RP0_freq_mhz, 0444, rps_rp_mhz_show, NU=
LL);
> > +static INTEL_GT_RPS_SYSFS_ATTR(RP1_freq_mhz, 0444, rps_rp_mhz_show, NU=
LL);
> > +static INTEL_GT_RPS_SYSFS_ATTR(RPn_freq_mhz, 0444, rps_rp_mhz_show, NU=
LL);
> > +
> > +#define GEN6_ATTR(s) { \
> > +             &dev_attr_##s##_act_freq_mhz.attr, \
> > +             &dev_attr_##s##_cur_freq_mhz.attr, \
> > +             &dev_attr_##s##_boost_freq_mhz.attr, \
> > +             &dev_attr_##s##_max_freq_mhz.attr, \
> > +             &dev_attr_##s##_min_freq_mhz.attr, \
> > +             &dev_attr_##s##_RP0_freq_mhz.attr, \
> > +             &dev_attr_##s##_RP1_freq_mhz.attr, \
> > +             &dev_attr_##s##_RPn_freq_mhz.attr, \
> > +             NULL, \
> > +     }
> > +
> > +#define GEN6_RPS_ATTR GEN6_ATTR(rps)
> > +#define GEN6_GT_ATTR  GEN6_ATTR(gt)
> > +
> > +/* For now we have a static number of RP states */
> > +static ssize_t rps_rp_mhz_show(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            char *buff)
> > +{
> > +     struct intel_gt *gt =3D intel_gt_sysfs_get_drvdata(dev, attr->att=
r.name);
> > +     struct intel_rps *rps =3D &gt->rps;
> > +     u32 val;
> > +
> > +     if (attr =3D=3D &dev_attr_gt_RP0_freq_mhz ||
> > +         attr =3D=3D &dev_attr_rps_RP0_freq_mhz) {
> > +             val =3D intel_rps_get_rp0_frequency(rps);
> > +     } else if (attr =3D=3D &dev_attr_gt_RP1_freq_mhz ||
> > +                attr =3D=3D &dev_attr_rps_RP1_freq_mhz) {
> > +                val =3D intel_rps_get_rp1_frequency(rps);
> > +     } else if (attr =3D=3D &dev_attr_gt_RPn_freq_mhz ||
> > +                attr =3D=3D &dev_attr_rps_RPn_freq_mhz) {
> > +                val =3D intel_rps_get_rpn_frequency(rps);
> > +     } else {
> > +             GEM_WARN_ON(1);
> > +             return -ENODEV;
> > +     }
> > +
> > +     return scnprintf(buff, PAGE_SIZE, "%d\n", val);
> > +}
> > +
> > +static const struct attribute * const gen6_rps_attrs[] =3D GEN6_RPS_AT=
TR;
> > +static const struct attribute * const gen6_gt_attrs[]  =3D GEN6_GT_ATT=
R;
> > +
> > +static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *k=
obj,
> > +                             const struct attribute * const *attrs)
> > +{
> > +     int ret;
> > +
> > +     if (GRAPHICS_VER(gt->i915) < 6)
> > +             return 0;
> > +
> > +     ret =3D sysfs_create_files(kobj, attrs);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915))
> > +             ret =3D sysfs_create_file(kobj, &dev_attr_vlv_rpe_freq_mh=
z.attr);
> > +
> > +     return ret;
> > +}
> > +
> > +void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
> > +{
> > +     int ret;
> > +
> > +     intel_sysfs_rc6_init(gt, kobj);
> > +
> > +     ret =3D is_object_gt(kobj) ?
> > +           intel_sysfs_rps_init(gt, kobj, gen6_rps_attrs) :
> > +           intel_sysfs_rps_init(gt, kobj, gen6_gt_attrs);
> > +     if (ret)
> > +             drm_err(&gt->i915->drm,
> > +                     "failed to create gt%u RPS sysfs files", gt->info=
.id);
> > +}
> > diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt_pm.h b/drivers/gpu/drm/i9=
15/gt/sysfs_gt_pm.h
> > new file mode 100644
> > index 000000000000..18c60d929e6d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/gt/sysfs_gt_pm.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2020 Intel Corporation
> > + */
> > +
> > +#ifndef __SYSFS_GT_PM_H__
> > +#define __SYSFS_GT_PM_H__
> > +
> > +#include <linux/kobject.h>
> > +
> > +#include "intel_gt_types.h"
> > +
> > +void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj);
> > +void intel_gt_sysfs_pm_remove(struct intel_gt *gt, struct kobject *kob=
j);
> > +
> > +#endif /* SYSFS_RC6_H */
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
> > index ec76011366fb..f11acbc0990b 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -989,6 +989,8 @@ struct drm_i915_private {
> >   #define I915_MAX_GT 4
> >       struct intel_gt *gt[I915_MAX_GT];
> >  =20
> > +     struct kobject *sysfs_gt;
> > +
> >       struct {
> >               struct i915_gem_contexts {
> >                       spinlock_t lock; /* locks list */
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i91=
5_reg.h
> > index ef6bc8180073..5153b3ff41e9 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -8480,6 +8480,7 @@ enum {
> >   #define   GEN6_AGGRESSIVE_TURBO                     (0 << 15)
> >   #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT   23
> >   #define   GEN9_IGNORE_SLICE_RATIO           (0 << 0)
> > +#define   GEN12_SW_REQ_UNSLICE_RATIO_SHIFT   23
>=20
> Stray something?
>=20
> >  =20
> >   #define GEN6_RC_VIDEO_FREQ                  _MMIO(0xA00C)
> >   #define GEN6_RC_CONTROL                             _MMIO(0xA090)
> > diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i=
915_sysfs.c
> > index fae4d1f4f275..d6687e33f29d 100644
> > --- a/drivers/gpu/drm/i915/i915_sysfs.c
> > +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> > @@ -38,113 +38,12 @@
> >   #include "i915_sysfs.h"
> >   #include "intel_pm.h"
> >  =20
> > -static inline struct drm_i915_private *kdev_minor_to_i915(struct devic=
e *kdev)
> > +struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
> >   {
> >       struct drm_minor *minor =3D dev_get_drvdata(kdev);
> >       return to_i915(minor->dev);
> >   }
> >  =20
> > -#ifdef CONFIG_PM
> > -static u32 calc_residency(struct drm_i915_private *dev_priv,
> > -                       i915_reg_t reg)
> > -{
> > -     intel_wakeref_t wakeref;
> > -     u64 res =3D 0;
> > -
> > -     with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
> > -             res =3D intel_rc6_residency_us(&to_gt(dev_priv)->rc6, reg=
);
> > -
> > -     return DIV_ROUND_CLOSEST_ULL(res, 1000);
> > -}
> > -
> > -static ssize_t rc6_enable_show(struct device *kdev,
> > -                            struct device_attribute *attr, char *buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     unsigned int mask;
> > -
> > -     mask =3D 0;
> > -     if (HAS_RC6(dev_priv))
> > -             mask |=3D BIT(0);
> > -     if (HAS_RC6p(dev_priv))
> > -             mask |=3D BIT(1);
> > -     if (HAS_RC6pp(dev_priv))
> > -             mask |=3D BIT(2);
> > -
> > -     return sysfs_emit(buf, "%x\n", mask);
> > -}
> > -
> > -static ssize_t rc6_residency_ms_show(struct device *kdev,
> > -                                  struct device_attribute *attr, char =
*buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     u32 rc6_residency =3D calc_residency(dev_priv, GEN6_GT_GFX_RC6);
> > -     return sysfs_emit(buf, "%u\n", rc6_residency);
> > -}
> > -
> > -static ssize_t rc6p_residency_ms_show(struct device *kdev,
> > -                                   struct device_attribute *attr, char=
 *buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     u32 rc6p_residency =3D calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
> > -     return sysfs_emit(buf, "%u\n", rc6p_residency);
> > -}
> > -
> > -static ssize_t rc6pp_residency_ms_show(struct device *kdev,
> > -                                    struct device_attribute *attr, cha=
r *buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     u32 rc6pp_residency =3D calc_residency(dev_priv, GEN6_GT_GFX_RC6p=
p);
> > -     return sysfs_emit(buf, "%u\n", rc6pp_residency);
> > -}
> > -
> > -static ssize_t media_rc6_residency_ms_show(struct device *kdev,
> > -                                        struct device_attribute *attr,=
 char *buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     u32 rc6_residency =3D calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
> > -     return sysfs_emit(buf, "%u\n", rc6_residency);
> > -}
> > -
> > -static DEVICE_ATTR_RO(rc6_enable);
> > -static DEVICE_ATTR_RO(rc6_residency_ms);
> > -static DEVICE_ATTR_RO(rc6p_residency_ms);
> > -static DEVICE_ATTR_RO(rc6pp_residency_ms);
> > -static DEVICE_ATTR_RO(media_rc6_residency_ms);
> > -
> > -static struct attribute *rc6_attrs[] =3D {
> > -     &dev_attr_rc6_enable.attr,
> > -     &dev_attr_rc6_residency_ms.attr,
> > -     NULL
> > -};
> > -
> > -static const struct attribute_group rc6_attr_group =3D {
> > -     .name =3D power_group_name,
> > -     .attrs =3D  rc6_attrs
> > -};
> > -
> > -static struct attribute *rc6p_attrs[] =3D {
> > -     &dev_attr_rc6p_residency_ms.attr,
> > -     &dev_attr_rc6pp_residency_ms.attr,
> > -     NULL
> > -};
> > -
> > -static const struct attribute_group rc6p_attr_group =3D {
> > -     .name =3D power_group_name,
> > -     .attrs =3D  rc6p_attrs
> > -};
> > -
> > -static struct attribute *media_rc6_attrs[] =3D {
> > -     &dev_attr_media_rc6_residency_ms.attr,
> > -     NULL
> > -};
> > -
> > -static const struct attribute_group media_rc6_attr_group =3D {
> > -     .name =3D power_group_name,
> > -     .attrs =3D  media_rc6_attrs
> > -};
> > -#endif
> > -
> >   static int l3_access_valid(struct drm_i915_private *i915, loff_t offs=
et)
> >   {
> >       if (!HAS_L3_DPF(i915))
> > @@ -256,171 +155,6 @@ static const struct bin_attribute dpf_attrs_1 =3D=
 {
> >       .private =3D (void *)1
> >   };
> >  =20
> > -static ssize_t gt_act_freq_mhz_show(struct device *kdev,
> > -                                 struct device_attribute *attr, char *=
buf)
> > -{
> > -     struct drm_i915_private *i915 =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(i915)->rps;
> > -
> > -     return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rp=
s));
> > -}
> > -
> > -static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
> > -                                 struct device_attribute *attr, char *=
buf)
> > -{
> > -     struct drm_i915_private *i915 =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(i915)->rps;
> > -
> > -     return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(=
rps));
> > -}
> > -
> > -static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct devi=
ce_attribute *attr, char *buf)
> > -{
> > -     struct drm_i915_private *i915 =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(i915)->rps;
> > -
> > -     return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps)=
);
> > -}
> > -
> > -static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
> > -                                    struct device_attribute *attr,
> > -                                    const char *buf, size_t count)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(dev_priv)->rps;
> > -     ssize_t ret;
> > -     u32 val;
> > -
> > -     ret =3D kstrtou32(buf, 0, &val);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D intel_rps_set_boost_frequency(rps, val);
> > -
> > -     return ret ?: count;
> > -}
> > -
> > -static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
> > -                                  struct device_attribute *attr, char =
*buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(dev_priv)->rps;
> > -
> > -     return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient=
_freq));
> > -}
> > -
> > -static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device=
_attribute *attr, char *buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     struct intel_gt *gt =3D to_gt(dev_priv);
> > -     struct intel_rps *rps =3D &gt->rps;
> > -
> > -     return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
> > -}
> > -
> > -static ssize_t gt_max_freq_mhz_store(struct device *kdev,
> > -                                  struct device_attribute *attr,
> > -                                  const char *buf, size_t count)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     struct intel_gt *gt =3D to_gt(dev_priv);
> > -     struct intel_rps *rps =3D &gt->rps;
> > -     ssize_t ret;
> > -     u32 val;
> > -
> > -     ret =3D kstrtou32(buf, 0, &val);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D intel_rps_set_max_frequency(rps, val);
> > -
> > -     return ret ?: count;
> > -}
> > -
> > -static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device=
_attribute *attr, char *buf)
> > -{
> > -     struct drm_i915_private *i915 =3D kdev_minor_to_i915(kdev);
> > -     struct intel_gt *gt =3D to_gt(i915);
> > -     struct intel_rps *rps =3D &gt->rps;
> > -
> > -     return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
> > -}
> > -
> > -static ssize_t gt_min_freq_mhz_store(struct device *kdev,
> > -                                  struct device_attribute *attr,
> > -                                  const char *buf, size_t count)
> > -{
> > -     struct drm_i915_private *i915 =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(i915)->rps;
> > -     ssize_t ret;
> > -     u32 val;
> > -
> > -     ret =3D kstrtou32(buf, 0, &val);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D intel_rps_set_min_frequency(rps, val);
> > -
> > -     return ret ?: count;
> > -}
> > -
> > -static DEVICE_ATTR_RO(gt_act_freq_mhz);
> > -static DEVICE_ATTR_RO(gt_cur_freq_mhz);
> > -static DEVICE_ATTR_RW(gt_boost_freq_mhz);
> > -static DEVICE_ATTR_RW(gt_max_freq_mhz);
> > -static DEVICE_ATTR_RW(gt_min_freq_mhz);
> > -
> > -static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
> > -
> > -static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attri=
bute *attr, char *buf);
> > -static DEVICE_ATTR(gt_RP0_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> > -static DEVICE_ATTR(gt_RP1_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> > -static DEVICE_ATTR(gt_RPn_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> > -
> > -/* For now we have a static number of RP states */
> > -static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attri=
bute *attr, char *buf)
> > -{
> > -     struct drm_i915_private *dev_priv =3D kdev_minor_to_i915(kdev);
> > -     struct intel_rps *rps =3D &to_gt(dev_priv)->rps;
> > -     u32 val;
> > -
> > -     if (attr =3D=3D &dev_attr_gt_RP0_freq_mhz)
> > -             val =3D intel_rps_get_rp0_frequency(rps);
> > -     else if (attr =3D=3D &dev_attr_gt_RP1_freq_mhz)
> > -             val =3D intel_rps_get_rp1_frequency(rps);
> > -     else if (attr =3D=3D &dev_attr_gt_RPn_freq_mhz)
> > -             val =3D intel_rps_get_rpn_frequency(rps);
> > -     else
> > -             BUG();
> > -
> > -     return sysfs_emit(buf, "%d\n", val);
> > -}
> > -
> > -static const struct attribute * const gen6_attrs[] =3D {
> > -     &dev_attr_gt_act_freq_mhz.attr,
> > -     &dev_attr_gt_cur_freq_mhz.attr,
> > -     &dev_attr_gt_boost_freq_mhz.attr,
> > -     &dev_attr_gt_max_freq_mhz.attr,
> > -     &dev_attr_gt_min_freq_mhz.attr,
> > -     &dev_attr_gt_RP0_freq_mhz.attr,
> > -     &dev_attr_gt_RP1_freq_mhz.attr,
> > -     &dev_attr_gt_RPn_freq_mhz.attr,
> > -     NULL,
> > -};
> > -
> > -static const struct attribute * const vlv_attrs[] =3D {
> > -     &dev_attr_gt_act_freq_mhz.attr,
> > -     &dev_attr_gt_cur_freq_mhz.attr,
> > -     &dev_attr_gt_boost_freq_mhz.attr,
> > -     &dev_attr_gt_max_freq_mhz.attr,
> > -     &dev_attr_gt_min_freq_mhz.attr,
> > -     &dev_attr_gt_RP0_freq_mhz.attr,
> > -     &dev_attr_gt_RP1_freq_mhz.attr,
> > -     &dev_attr_gt_RPn_freq_mhz.attr,
> > -     &dev_attr_vlv_rpe_freq_mhz.attr,
> > -     NULL,
> > -};
> > -
> >   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> >  =20
> >   static ssize_t error_state_read(struct file *filp, struct kobject *ko=
bj,
> > @@ -486,34 +220,16 @@ static void i915_setup_error_capture(struct devic=
e *kdev) {}
> >   static void i915_teardown_error_capture(struct device *kdev) {}
> >   #endif
> >  =20
> > +static struct kobject *i915_setup_gt_sysfs(struct kobject *parent)
> > +{
> > +     return kobject_create_and_add("gt", parent);
> > +}
> > +
> >   void i915_setup_sysfs(struct drm_i915_private *dev_priv)
> >   {
> >       struct device *kdev =3D dev_priv->drm.primary->kdev;
> >       int ret;
> >  =20
> > -#ifdef CONFIG_PM
> > -     if (HAS_RC6(dev_priv)) {
> > -             ret =3D sysfs_merge_group(&kdev->kobj,
> > -                                     &rc6_attr_group);
> > -             if (ret)
> > -                     drm_err(&dev_priv->drm,
> > -                             "RC6 residency sysfs setup failed\n");
> > -     }
> > -     if (HAS_RC6p(dev_priv)) {
> > -             ret =3D sysfs_merge_group(&kdev->kobj,
> > -                                     &rc6p_attr_group);
> > -             if (ret)
> > -                     drm_err(&dev_priv->drm,
> > -                             "RC6p residency sysfs setup failed\n");
> > -     }
> > -     if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
> > -             ret =3D sysfs_merge_group(&kdev->kobj,
> > -                                     &media_rc6_attr_group);
> > -             if (ret)
> > -                     drm_err(&dev_priv->drm,
> > -                             "Media RC6 residency sysfs setup failed\n=
");
> > -     }
> > -#endif
> >       if (HAS_L3_DPF(dev_priv)) {
> >               ret =3D device_create_bin_file(kdev, &dpf_attrs);
> >               if (ret)
> > @@ -529,13 +245,10 @@ void i915_setup_sysfs(struct drm_i915_private *de=
v_priv)
> >               }
> >       }
> >  =20
> > -     ret =3D 0;
> > -     if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
> > -             ret =3D sysfs_create_files(&kdev->kobj, vlv_attrs);
> > -     else if (GRAPHICS_VER(dev_priv) >=3D 6)
> > -             ret =3D sysfs_create_files(&kdev->kobj, gen6_attrs);
> > -     if (ret)
> > -             drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
> > +     dev_priv->sysfs_gt =3D i915_setup_gt_sysfs(&kdev->kobj);
> > +     if (!dev_priv->sysfs_gt)
> > +             drm_err(&dev_priv->drm,
> > +                     "failed to register GT sysfs directory\n");
> >  =20
> >       i915_setup_error_capture(kdev);
> >  =20
> > @@ -548,14 +261,6 @@ void i915_teardown_sysfs(struct drm_i915_private *=
dev_priv)
> >  =20
> >       i915_teardown_error_capture(kdev);
> >  =20
> > -     if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
> > -             sysfs_remove_files(&kdev->kobj, vlv_attrs);
> > -     else
> > -             sysfs_remove_files(&kdev->kobj, gen6_attrs);
> >       device_remove_bin_file(kdev,  &dpf_attrs_1);
> >       device_remove_bin_file(kdev,  &dpf_attrs);
> > -#ifdef CONFIG_PM
> > -     sysfs_unmerge_group(&kdev->kobj, &rc6_attr_group);
> > -     sysfs_unmerge_group(&kdev->kobj, &rc6p_attr_group);
> > -#endif
> >   }
> > diff --git a/drivers/gpu/drm/i915/i915_sysfs.h b/drivers/gpu/drm/i915/i=
915_sysfs.h
> > index 41afd4366416..243a17741e3f 100644
> > --- a/drivers/gpu/drm/i915/i915_sysfs.h
> > +++ b/drivers/gpu/drm/i915/i915_sysfs.h
> > @@ -6,8 +6,11 @@
> >   #ifndef __I915_SYSFS_H__
> >   #define __I915_SYSFS_H__
> >  =20
> > +struct device;
> >   struct drm_i915_private;
> >  =20
> > +struct drm_i915_private *kdev_minor_to_i915(struct device *kdev);
> > +
> >   void i915_setup_sysfs(struct drm_i915_private *i915);
> >   void i915_teardown_sysfs(struct drm_i915_private *i915);
> >  =20
> >=20
>=20
> Regards,
>=20
> Tvrtko
