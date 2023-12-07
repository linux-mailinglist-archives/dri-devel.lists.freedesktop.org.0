Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507458084FB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EB089755;
	Thu,  7 Dec 2023 09:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CD089755
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701942882; x=1733478882;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JVg+YFeylE5751j053diLSsB0HH6ZRmcj2hNvpngTOM=;
 b=d8aBvxvLOAKwLjYrdsycaHl+THt71OG8WKJm38QNl2Gcw0+Oy+ILW7D8
 o55GwID7V2/l4LIF2wIInDOy7fkgajtM4EQQOrhc8SQanVzI/XvToLpQm
 jcxXcV1gYZXVBPVJmtvnCTeoLAp8OZ0GxwIdM21c1+amKTGkE76fKEAFD
 xxgHfeBbW7MSrV+r7AWkTiQmmvKT0pZV09gi13YHsLuZKPu39d4/tp1Se
 +T+lJgp8wo1Q3Re5T/zI1DhE/XSP+cAnZoAYzpyMgtO7LcK4PqqovA1MJ
 +wPbVWyrCBCGcqw+xHo/k02DTRvMjCP7tBBJMtsxjomVk69vwvrtfUSc+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12920378"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12920378"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895078971"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895078971"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.169])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:54:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: bbaa <bbaa@bbaa.fun>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [Bug Report] drm/edid: drm_edid_override_connector_update
 returns a incorrect value
In-Reply-To: <930E9B4C7D91FDFF+29b34d89-8658-4910-966a-c772f320ea03@bbaa.fun>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <930E9B4C7D91FDFF+29b34d89-8658-4910-966a-c772f320ea03@bbaa.fun>
Date: Thu, 07 Dec 2023 11:54:34 +0200
Message-ID: <87jzpq1go5.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Dec 2023, bbaa <bbaa@bbaa.fun> wrote:
> Hello everyone,
>
> drm_edid_override_connector_update seem return a incorrect value.
>
> drivers/gpu/drm/drm_edid.c (Linux 6.7-rc4)
>    2294	/**
>    2295	 * drm_edid_override_connector_update - add modes from override/f=
irmware EDID
>    2296	 * @connector: connector we're probing
>    2297	 *
>    2298	 * Add modes from the override/firmware EDID, if available. Only =
to be used from
>    2299	 * drm_helper_probe_single_connector_modes() as a fallback for wh=
en DDC probe
>    2300	 * failed during drm_get_edid() and caused the override/firmware =
EDID to be
>    2301	 * skipped.
>    2302	 *
>    2303	 * Return: The number of modes added or 0 if we couldn't find any.
>    2304	 */

Thanks for the report. I've sent a patch to hopefully fix this [1].

[1] https://patchwork.freedesktop.org/patch/msgid/20231207093821.2654267-1-=
jani.nikula@intel.com

However, please read the documentation comment above: "Only to be used
from drm_helper_probe_single_connector_modes() ..."

The function is a fallback for a *very* specific and rare scenario.

> This will break the EDID override behavior on Nvidia graphics cards.
>
> NVIDIA/open-gpu-kernel-modules:
> kernel-open/nvidia-drm/nvidia-drm-connector.c:
>  =C2=A0=C2=A0103 =C2=A0#if defined(NV_DRM_CONNECTOR_HAS_OVERRIDE_EDID) =
=C2=A0=C2=A0104 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=20
> (connector->override_edid) { =C2=A0=C2=A0105 =C2=A0#else =C2=A0=C2=A0106 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=20
> (drm_edid_override_connector_update(connector) > 0) { =C2=A0=C2=A0107 =C2=
=A0#endif=20
>  =C2=A0=C2=A0108 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0co=
nst struct drm_property_blob *edid =3D=20
> connector->edid_blob_ptr; =C2=A0=C2=A0109=20
> drm_edid_override_connector_update(connector)  will return zero here.

That's an out-of-tree driver that doesn't follow the documentation
above. Drivers have no business calling the function.

All of the override/firmware EDID handling should be covered
transparently via the drm_edid_read*() and drm_get_edid() functions, and
the drivers shouldn't have to ever care about overrides, at all. Drivers
shouldn't really use connector->edid_blob_ptr directly either.

Please report and get that fixed downstream.


BR,
Jani.


--=20
Jani Nikula, Intel
