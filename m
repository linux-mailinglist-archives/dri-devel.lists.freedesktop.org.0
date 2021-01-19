Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF32FB9CD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 15:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5E16E3A0;
	Tue, 19 Jan 2021 14:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707C96E3A0;
 Tue, 19 Jan 2021 14:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC5FCAB7F;
 Tue, 19 Jan 2021 14:51:23 +0000 (UTC)
Subject: Re: [PATCH v4 0/6] drm: Move struct drm_device.pdev to legacy
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, sroland@vmware.com, zackr@vmware.com
References: <20210118131420.15874-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7051ae0f-b86f-344a-e768-71ccadc3cf55@suse.de>
Date: Tue, 19 Jan 2021 15:51:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118131420.15874-1-tzimmermann@suse.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1907438962=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1907438962==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kxpotDhPRhv4Y861TKwIwPpQee7lgLLdE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kxpotDhPRhv4Y861TKwIwPpQee7lgLLdE
Content-Type: multipart/mixed; boundary="H9Rm5CapTkeGqzs1YHZWgXV5awAdc7ijX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, sroland@vmware.com, zackr@vmware.com
Cc: linux-graphics-maintainer@vmware.com, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <7051ae0f-b86f-344a-e768-71ccadc3cf55@suse.de>
Subject: Re: [PATCH v4 0/6] drm: Move struct drm_device.pdev to legacy
References: <20210118131420.15874-1-tzimmermann@suse.de>
In-Reply-To: <20210118131420.15874-1-tzimmermann@suse.de>

--H9Rm5CapTkeGqzs1YHZWgXV5awAdc7ijX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

FYI patches 1 and 5 are now in drm-misc-next.

Am 18.01.21 um 14:14 schrieb Thomas Zimmermann:
> I merged more patches into drm-misc-next. I'm mostly sending out v4 of
> this patchset to split the final patch into the core changes and the
> patch for moving pdev behind CONFIG_DRM_LEGACY. The former are required=

> to fix a reported bug. [1] There's also a fix to vmwgfx.
>=20
> The pdev field in struct drm_device points to a PCI device structure an=
d
> goes back to UMS-only days when all DRM drivers were for PCI devices.
> Meanwhile we also support USB, SPI and platform devices. Each of those
> uses the generic device stored in struct drm_device.dev.
>=20
> To reduce duplication and remove the special case of PCI, this patchset=

> converts all modesetting drivers from pdev to dev and makes pdev a fiel=
d
> for legacy UMS drivers.
>=20
> For PCI devices, the pointer in struct drm_device.dev can be upcasted t=
o
> struct pci_device; or tested for PCI with dev_is_pci(). In several plac=
es
> the code can use the dev field directly.
>=20
> After converting all drivers and the DRM core, the pdev fields becomes
> only relevant for legacy drivers. In a later patchset, we may want to
> convert these as well and remove pdev entirely.
>=20
> v4:
> 	* merged several patches
> 	* moved core changes into separate patch
> 	* vmwgfx build fix
> v3:
> 	* merged several patches
> 	* fix one pdev reference in nouveau (Jeremy)
> 	* rebases
> v2:
> 	* move whitespace fixes into separate patches (Alex, Sam)
> 	* move i915 gt/ and gvt/ changes into separate patches (Joonas)
>=20
> [1] https://lore.kernel.org/dri-devel/7851c78c-8c57-3c84-cd49-a72703095=
a5d@suse.de/
>=20
> Thomas Zimmermann (6):
>    drm: Upcast struct drm_device.dev to struct pci_device; replace pdev=

>    drm/i915: Remove references to struct drm_device.pdev
>    drm/i915/gt: Remove references to struct drm_device.pdev
>    drm/i915/gvt: Remove references to struct drm_device.pdev
>    drm/vmwgfx: Remove reference to struct drm_device.pdev
>    drm: Move struct drm_device.pdev to legacy section
>=20
>   drivers/gpu/drm/drm_agpsupport.c              |  9 ++++---
>   drivers/gpu/drm/drm_bufs.c                    |  4 +--
>   drivers/gpu/drm/drm_edid.c                    |  7 ++++-
>   drivers/gpu/drm/drm_irq.c                     | 12 +++++----
>   drivers/gpu/drm/drm_pci.c                     | 26 +++++++++++-------=
-
>   drivers/gpu/drm/drm_vm.c                      |  2 +-
>   drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 +++++-----
>   drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
>   drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
>   drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
>   .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 ++--
>   drivers/gpu/drm/i915/display/intel_opregion.c |  6 ++---
>   drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
>   drivers/gpu/drm/i915/display/intel_panel.c    |  4 +--
>   drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
>   drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
>   drivers/gpu/drm/i915/display/intel_vga.c      |  8 +++---
>   drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 ++---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +++----
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
>   drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 +--
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  8 +++---
>   drivers/gpu/drm/i915/gt/intel_reset.c         |  6 ++---
>   drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 ++--
>   drivers/gpu/drm/i915/gvt/firmware.c           | 10 +++----
>   drivers/gpu/drm/i915/gvt/gtt.c                | 12 ++++-----
>   drivers/gpu/drm/i915/gvt/gvt.c                |  6 ++---
>   drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 +--
>   drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
>   drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++-------
>   drivers/gpu/drm/i915/i915_drv.h               |  2 +-
>   drivers/gpu/drm/i915/i915_gem_gtt.c           |  5 ++--
>   drivers/gpu/drm/i915/i915_getparam.c          |  5 ++--
>   drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
>   drivers/gpu/drm/i915/i915_irq.c               |  6 ++---
>   drivers/gpu/drm/i915/i915_pmu.c               |  2 +-
>   drivers/gpu/drm/i915/i915_suspend.c           |  4 +--
>   drivers/gpu/drm/i915/i915_switcheroo.c        |  4 +--
>   drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
>   drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
>   drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
>   drivers/gpu/drm/i915/intel_uncore.c           |  4 +--
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  1 -
>   include/drm/drm_device.h                      |  6 ++---
>   50 files changed, 137 insertions(+), 125 deletions(-)
>=20
> --
> 2.29.2
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--H9Rm5CapTkeGqzs1YHZWgXV5awAdc7ijX--

--kxpotDhPRhv4Y861TKwIwPpQee7lgLLdE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAG8eoFAwAAAAAACgkQlh/E3EQov+BQ
oA//ZVy4jjHqk8jvqXmmtUH0MFcUKHRhHrswS5Z17dT71/Pg+BU1NT3TNC4YrSUc7U9J1+V/P326
MEIDTMXV/0Ftc72rueY0pF9ZgZbPtBPmrsPEbpqssPUyELQarKmlkkfTglnIuVArFvS7lnb02/81
l2iCrZA01w0M+zw1emYjw6rKahvb8r4v/m+VmXAFOQe7T/SkDkqAzlqRTZ8V5oQN7l6DFamJdbgW
keIVdF0b0PJBJZoWxyLJIzPTwejgcWImyEv0cv86tXnt6eUUtSbQg7Cv5T13d3bylDIzjcBEt9x4
j/XaLOoaJg+xuMtwgqJb7gnqceoBcJOdlMIDW2SbNoRfoK05ZCytmpzxQIVvsx/AfnDTZV+4hlrG
yBcyE7wt9kNZjo6ca1QKpv1tuT4ZIvBmVZgPwIFLH2YN2tIfxl+vrxIKNvl3uIp1mj2zcyueJL84
4myFK+9hdG2Ws9ZWgkOBW0u4db0rUPH95XmeGtbjJdCB3gmZljQa4rwxlmMiCYVEausKnalzctd3
SitCFQnkEZAdI0WXsZkjbJnpb7/f5540/PNtcLAsGVIIrQPOsVK4n/rx7Im4cn/KfAXgigUynG93
sGqeiBA2wM8M3PHZkVyHA+KYJ56QVJ8L5QHOdDfTha4Q+GPACmKP7uFntfRkLBiNKGg+xSM5moJj
sW8=
=hkIc
-----END PGP SIGNATURE-----

--kxpotDhPRhv4Y861TKwIwPpQee7lgLLdE--

--===============1907438962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1907438962==--
