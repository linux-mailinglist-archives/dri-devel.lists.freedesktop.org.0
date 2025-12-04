Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8ACA3958
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4A210E1E0;
	Thu,  4 Dec 2025 12:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2tDufgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD4B10E1E0;
 Thu,  4 Dec 2025 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764850807; x=1796386807;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l5RZdf8e/zhB+USml8d08qyw3G3+Y4U9wM9GTqIDbVM=;
 b=h2tDufgzOq384GWeoZqu7BwpjkE29peeKP7ZoEv6vIiQgqeAPa683eXl
 3Vri+mSwFsutz05nEplJOR5z1RFQDx+e6fUq67WZEZMsJAUPaI26+LyDf
 TUuGNk/o81xvGfHi9z2FChoP+8xLCp8zpaNyqr5cMVDxZTDrodC8WZGM8
 vdvd2gFF29y+qDmep9FXSosa2RnGAcz4Iq5RX45tH5AufmZiSaolHJNi2
 RYFdS1MD1Z4JpM09rTUV8MTQLUvr/VcRQxfJlcDFn/UlqLZqxpPlZ3rrr
 bbTm3Yf313iZ6gJWwxTEaxGklLmujzMkj02w/dQzAV9UEU9l/hKVraIjq A==;
X-CSE-ConnectionGUID: SXeXHpUKS+CDb2XeXUQ9JQ==
X-CSE-MsgGUID: HysWGQlbQvKjCj3G8edgkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65864773"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="65864773"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:20:06 -0800
X-CSE-ConnectionGUID: VlAWi4gYRn2bzSpvUr4ppg==
X-CSE-MsgGUID: jGEhN+IMSVCOOsuBr26MXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="225928589"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:20:00 -0800
Message-ID: <c174c12d9748e2e9b2e497c1e479100c323e79c2.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: fix VFIO link error
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Micha=C5=82?= Winiarski	 <michal.winiarski@intel.com>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <demarchi@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, 	intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Thu, 04 Dec 2025 13:19:58 +0100
In-Reply-To: <20251204094154.1029357-1-arnd@kernel.org>
References: <20251204094154.1029357-1-arnd@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-12-04 at 10:41 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The Makefile logic for building xe_sriov_vfio.o was added
> incorrectly,
> as setting CONFIG_XE_VFIO_PCI=3Dm means it doesn't get included into a
> built-in xe driver:
>=20
> ERROR: modpost: "xe_sriov_vfio_stop_copy_enter"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_stop_copy_exit"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_suspend_device"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_wait_flr_done"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_error" [drivers/vfio/pci/xe/xe-vfio-
> pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_resume_data_enter"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_resume_device"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_resume_data_exit"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_data_write" [drivers/vfio/pci/xe/xe-
> vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_migration_supported"
> [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> WARNING: modpost: suppressed 3 unresolved symbol warnings because
> there were too many)
>=20
> Check for CONFIG_XE_VFIO_PCI being enabled in the Makefile to decide
> whether to
> include the the object instead.

s/the the/the/ found by CI.
Same question here, Do you want to resent or should I fix up when
commiting?

Thanks,
Thomas


>=20
> Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index dfc2ded01455..e5f3c2ec9e9a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -185,8 +185,8 @@ xe-$(CONFIG_PCI_IOV) +=3D \
> =C2=A0	xe_sriov_pf_sysfs.o \
> =C2=A0	xe_tile_sriov_pf_debugfs.o
> =C2=A0
> -ifeq ($(CONFIG_PCI_IOV),y)
> -	xe-$(CONFIG_XE_VFIO_PCI) +=3D xe_sriov_vfio.o
> +ifdef CONFIG_XE_VFIO_PCI
> +	xe-$(CONFIG_PCI_IOV) +=3D xe_sriov_vfio.o
> =C2=A0endif
> =C2=A0
> =C2=A0# include helpers for tests even when XE is built-in

