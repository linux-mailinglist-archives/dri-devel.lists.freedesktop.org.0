Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04A3EB1FA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 09:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D486E544;
	Fri, 13 Aug 2021 07:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3D96E544;
 Fri, 13 Aug 2021 07:51:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="215250267"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="215250267"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 00:51:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="517943978"
Received: from cgearing-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.226])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 00:51:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 01/15] drm/i915/pxp: Define PXP component
 interface
In-Reply-To: <20210729020106.18346-2-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210729020106.18346-1-daniele.ceraolospurio@intel.com>
 <20210729020106.18346-2-daniele.ceraolospurio@intel.com>
Date: Fri, 13 Aug 2021 10:51:34 +0300
Message-ID: <87y295lr3t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Jul 2021, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.co=
m> wrote:
> This will be used for communication between the i915 driver and the mei
> one. Defining it in a stand-alone patch to avoid circualr dependedencies
> between the patches modifying the 2 drivers.
>
> Split out from an original patch from  Huang, Sean Z
>
> v2: rename the component struct (Rodrigo)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm/i915_component.h         |  1 +
>  include/drm/i915_pxp_tee_interface.h | 45 ++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/drm/i915_pxp_tee_interface.h
>
> diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
> index 55c3b123581b..c1e2a43d2d1e 100644
> --- a/include/drm/i915_component.h
> +++ b/include/drm/i915_component.h
> @@ -29,6 +29,7 @@
>  enum i915_component_type {
>  	I915_COMPONENT_AUDIO =3D 1,
>  	I915_COMPONENT_HDCP,
> +	I915_COMPONENT_PXP
>  };
>=20=20
>  /* MAX_PORT is the number of port
> diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_=
tee_interface.h
> new file mode 100644
> index 000000000000..09b8389152af
> --- /dev/null
> +++ b/include/drm/i915_pxp_tee_interface.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2020 Intel Corporation
> + *
> + * Authors:
> + * Vitaly Lubart <vitaly.lubart@intel.com>

IMO we should avoid adding new authors lists in code comments. Git log
provides accurate and up-to-date information, and I don't want patches
where people add their names to authors lists.

BR,
Jani.


> + */
> +
> +#ifndef _I915_PXP_TEE_INTERFACE_H_
> +#define _I915_PXP_TEE_INTERFACE_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/device.h>
> +
> +/**
> + * struct i915_pxp_component_ops - ops for PXP services.
> + * @owner: Module providing the ops
> + * @send: sends data to PXP
> + * @receive: receives data from PXP
> + */
> +struct i915_pxp_component_ops {
> +	/**
> +	 * @owner: owner of the module provding the ops
> +	 */
> +	struct module *owner;
> +
> +	int (*send)(struct device *dev, const void *message, size_t size);
> +	int (*recv)(struct device *dev, void *buffer, size_t size);
> +};
> +
> +/**
> + * struct i915_pxp_component - Used for communication between i915 and T=
EE
> + * drivers for the PXP services
> + * @tee_dev: device that provide the PXP service from TEE Bus.
> + * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
> + */
> +struct i915_pxp_component {
> +	struct device *tee_dev;
> +	const struct i915_pxp_component_ops *ops;
> +
> +	/* To protect the above members. */
> +	struct mutex mutex;
> +};
> +
> +#endif /* _I915_TEE_PXP_INTERFACE_H_ */

--=20
Jani Nikula, Intel Open Source Graphics Center
