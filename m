Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13510C58D41
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1297410E8CA;
	Thu, 13 Nov 2025 16:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQiFBPPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C5810E8CA;
 Thu, 13 Nov 2025 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763052379; x=1794588379;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=leNjymy4IrsrANo98enac3hyuX+efgKo4NeKdRrW9AI=;
 b=NQiFBPPPs2hCM+e7usm/nYuB7JRaNrRB7avfEhvNX7ruX21sW5lGL1SG
 0/XPzwI4QQkWRw2srm+Ay5Rg5k+UFhA6tKQzP1VUasVYcdqpTmZ8aIkrB
 tN7YQXufe9cG7z1hBYYpUmSbtzFP6N8Axu08jZ59XmH6I8OWSy3VBfFHk
 bOmNYd0OLglGQJVdgyvHR6bu3HmRMGJtPVBDjCZEgG0NsHejqjQC2XVsb
 6mDAkdTvJ60qFzqAMrSdcIchl2QdlPGOOTvfS14TrQmAbHZA/+zK3yMfe
 +g3Md/LIfNG1XLkeOoEhsYN5cozZjCMYECuTq+pWYWFy2Z1e3PIr0yXVu A==;
X-CSE-ConnectionGUID: PCqnRTj2RYCMRStfxT1wrA==
X-CSE-MsgGUID: OSHJYDJZRNKa3qBoHAjIZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65046353"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65046353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:46:18 -0800
X-CSE-ConnectionGUID: 2B04FgYhRlyg4sFFreNVog==
X-CSE-MsgGUID: nZE32FcgT+egbvXjO9RXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="220365848"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:46:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Nov 2025 18:46:07 +0200 (EET)
To: Bjorn Helgaas <bhelgaas@google.com>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] PCI: Fix restoring BARs on BAR resize rollback
 path
In-Reply-To: <20251113162628.5946-7-ilpo.jarvinen@linux.intel.com>
Message-ID: <ba725a72-7863-3dd2-6ba2-ff2259229bbe@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-7-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-64272619-1763052367=:1464"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-64272619-1763052367=:1464
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Nov 2025, Ilpo J=C3=A4rvinen wrote:

> BAR resize operation is implemented in the pci_resize_resource() and
> pbus_reassign_bridge_resources() functions. pci_resize_resource() can
> be called either from __resource_resize_store() from sysfs or directly
> by the driver for the Endpoint Device.
>=20
> The pci_resize_resource() requires that caller has released the device
> resources that share the bridge window with the BAR to be resized as
> otherwise the bridge window is pinned in place and cannot be changed.
>=20
> pbus_reassign_bridge_resources() implement rollback of the resources if
> the resize operation fails, but rollback is performed only for the
> bridge windows. Because releasing the device resources are done by the
> caller of the BAR resize interface, these functions performing the BAR
> resize do not have access to the device resources as they were before
> the resize.
>=20
> pbus_reassign_bridge_resources() could try to
> __pci_bridge_assign_resources() after rolling back the bridge windows
> as they were, however, it will not guarantee the resource are assigned
> due to differences how FW and the kernel may want to assign the
> resources (alignment of the start address and tail).
>=20
> In order to perform rollback robustly, the BAR resize interface has to
> be altered to also release the device resources that share the bridge
> window with the BAR to be resized.
>=20
> Also, remove restoring from the entries failed list as saved list
> should now contain both the bridge windows and device resources so
> the extra restore is duplicated work.
>=20
> Some drivers (currently only amdgpu) want to prevent releasing some
> resources. Add exclude_bars param to pci_resize_resource() and make
> amdgpu to pass its register BAR (BAR 5) which should never be released
> during resize operation. Normally 64-bit prefetchable resources do not
> share bridge window with it as the register BAR (32-bit only) but there
> are various fallbacks in the resource assignment logic which may make
> the resources to share the bridge window in rare cases.
>=20
> This change (together with the driver side changes) is to counter the
> resource releases that had to be done to prevent resource tree
> corruption in the ("PCI: Release assigned resource before restoring
> them") change. As such, it likely restores functionality in cases where
> device resources were released to avoid resource tree conflicts which
> appeared to be "working" when such conflicts were not correctly
> detected by the kernel.
>=20
> Link: https://lore.kernel.org/linux-pci/f9a8c975-f5d3-4dd2-988e-4371a1433=
a60@hogyros.de/
> Link: https://lore.kernel.org/linux-pci/874irqop6b.fsf@draig.linaro.org/
> Reported-by: Simon Richter <Simon.Richter@hogyros.de>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   2 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |   2 +-
>  drivers/gpu/drm/xe/xe_vram.c                |   2 +-
>  drivers/pci/pci-sysfs.c                     |  17 +---
>  drivers/pci/pci.h                           |   4 +-
>  drivers/pci/setup-bus.c                     | 100 +++++++++++++++-----
>  drivers/pci/setup-res.c                     |  23 ++---
>  include/linux/pci.h                         |   3 +-
>  8 files changed, 91 insertions(+), 62 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 7a899fb4de29..4e241836ae68 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1736,7 +1736,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_devic=
e *adev)
> =20
>  =09pci_release_resource(adev->pdev, 0);
> =20
> -=09r =3D pci_resize_resource(adev->pdev, 0, rbar_size);
> +=09r =3D pci_resize_resource(adev->pdev, 0, rbar_size, 1 << 5);
>  =09if (r =3D=3D -ENOSPC)
>  =09=09dev_info(adev->dev,
>  =09=09=09 "Not enough PCI address space for a large BAR.");
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/dr=
m/i915/gt/intel_region_lmem.c
> index 51bb27e10a4f..7699e8fcf5ed 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -37,7 +37,7 @@ _resize_bar(struct drm_i915_private *i915, int resno, r=
esource_size_t size)
> =20
>  =09_release_bars(pdev);
> =20
> -=09ret =3D pci_resize_resource(pdev, resno, bar_size);
> +=09ret =3D pci_resize_resource(pdev, resno, bar_size, 0);
>  =09if (ret) {
>  =09=09drm_info(&i915->drm, "Failed to resize BAR%d to %dM (%pe)\n",
>  =09=09=09 resno, 1 << bar_size, ERR_PTR(ret));
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index b44ebf50fedb..00dd027057df 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -36,7 +36,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_s=
ize_t size)
>  =09if (pci_resource_len(pdev, resno))
>  =09=09pci_release_resource(pdev, resno);
> =20
> -=09ret =3D pci_resize_resource(pdev, resno, bar_size);
> +=09ret =3D pci_resize_resource(pdev, resno, bar_size, 0);
>  =09if (ret) {
>  =09=09drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider =
enabling 'Resizable BAR' support in your BIOS\n",
>  =09=09=09 resno, 1 << bar_size, ERR_PTR(ret));
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 9d6f74bd95f8..2a1b5456c2dc 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1599,18 +1599,13 @@ static ssize_t __resource_resize_store(struct dev=
ice *dev, int n,
>  {
>  =09struct pci_dev *pdev =3D to_pci_dev(dev);
>  =09struct pci_bus *bus =3D pdev->bus;
> -=09struct resource *b_win, *res;
>  =09unsigned long size;
> -=09int ret, i;
> +=09int ret;
>  =09u16 cmd;
> =20
>  =09if (kstrtoul(buf, 0, &size) < 0)
>  =09=09return -EINVAL;
> =20
> -=09b_win =3D pbus_select_window(bus, pci_resource_n(pdev, n));
> -=09if (!b_win)
> -=09=09return -EINVAL;
> -
>  =09device_lock(dev);
>  =09if (dev->driver || pci_num_vf(pdev)) {
>  =09=09ret =3D -EBUSY;
> @@ -1632,15 +1627,7 @@ static ssize_t __resource_resize_store(struct devi=
ce *dev, int n,
> =20
>  =09pci_remove_resource_files(pdev);
> =20
> -=09pci_dev_for_each_resource(pdev, res, i) {
> -=09=09if (i >=3D PCI_BRIDGE_RESOURCES)
> -=09=09=09break;
> -
> -=09=09if (b_win =3D=3D pbus_select_window(bus, res))
> -=09=09=09pci_release_resource(pdev, i);
> -=09}
> -
> -=09ret =3D pci_resize_resource(pdev, n, size);
> +=09ret =3D pci_resize_resource(pdev, n, size, 0);
> =20
>  =09pci_assign_unassigned_bus_resources(bus);
> =20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index bf1a577e9623..9893ea12d1f2 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -421,8 +421,10 @@ enum pci_bar_type {
>  struct device *pci_get_host_bridge_device(struct pci_dev *dev);
>  void pci_put_host_bridge_device(struct device *dev);
> =20
> +void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int si=
ze);
> +int pci_do_resource_release_and_resize(struct pci_dev *dev, int resno, i=
nt size,
> +=09=09=09=09       int exclude_bars);
>  unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge);
> -int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource =
*res);
>  int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resou=
rce_size_t add_size, resource_size_t align);
> =20
>  int pci_configure_extended_tags(struct pci_dev *dev, void *ign);
> diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> index 51f5e5a80b54..7e268960954b 100644
> --- a/drivers/pci/setup-bus.c
> +++ b/drivers/pci/setup-bus.c
> @@ -2420,18 +2420,16 @@ EXPORT_SYMBOL_GPL(pci_assign_unassigned_bridge_re=
sources);
>   * release it when possible. If the bridge window contains assigned
>   * resources, it cannot be released.
>   */
> -int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource =
*res)
> +static int pbus_reassign_bridge_resources(struct pci_bus *bus, struct re=
source *res,
> +=09=09=09=09=09  struct list_head *saved)
>  {
>  =09unsigned long type =3D res->flags;
>  =09struct pci_dev_resource *dev_res;
>  =09struct pci_dev *bridge =3D NULL;
> -=09LIST_HEAD(saved);
>  =09LIST_HEAD(added);
>  =09LIST_HEAD(failed);
>  =09unsigned int i;
> -=09int ret;
> -
> -=09down_read(&pci_bus_sem);
> +=09int ret =3D 0;
> =20
>  =09while (!pci_is_root_bus(bus)) {
>  =09=09bridge =3D bus->self;
> @@ -2443,9 +2441,9 @@ int pbus_reassign_bridge_resources(struct pci_bus *=
bus, struct resource *res)
> =20
>  =09=09/* Ignore BARs which are still in use */
>  =09=09if (!res->child) {
> -=09=09=09ret =3D add_to_list(&saved, bridge, res, 0, 0);
> +=09=09=09ret =3D add_to_list(saved, bridge, res, 0, 0);
>  =09=09=09if (ret)
> -=09=09=09=09goto cleanup;
> +=09=09=09=09return ret;
> =20
>  =09=09=09pci_release_resource(bridge, i);
>  =09=09} else {
> @@ -2468,34 +2466,78 @@ int pbus_reassign_bridge_resources(struct pci_bus=
 *bus, struct resource *res)
>  =09=09free_list(&added);
> =20
>  =09if (!list_empty(&failed)) {
> -=09=09if (pci_required_resource_failed(&failed, type)) {
> +=09=09if (pci_required_resource_failed(&failed, type))
>  =09=09=09ret =3D -ENOSPC;
> -=09=09=09goto cleanup;
> -=09=09}
> -=09=09/* Only resources with unrelated types failed (again) */
>  =09=09free_list(&failed);
> +=09=09if (ret)
> +=09=09=09return ret;
> +
> +=09=09/* Only resources with unrelated types failed (again) */
>  =09}
> =20
> -=09list_for_each_entry(dev_res, &saved, list) {
> +=09list_for_each_entry(dev_res, saved, list) {
>  =09=09struct pci_dev *dev =3D dev_res->dev;
> =20
>  =09=09/* Skip the bridge we just assigned resources for */
>  =09=09if (bridge =3D=3D dev)
>  =09=09=09continue;
> =20
> +=09=09if (!dev->subordinate)
> +=09=09=09continue;
> +
>  =09=09pci_setup_bridge(dev->subordinate);
>  =09}
> =20
> -=09free_list(&saved);
> -=09up_read(&pci_bus_sem);
>  =09return 0;
> +}
> =20
> -cleanup:
> -=09/* Restore size and flags */
> -=09list_for_each_entry(dev_res, &failed, list)
> -=09=09restore_dev_resource(dev_res);
> -=09free_list(&failed);
> +int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno, =
int size,
> +=09=09=09=09       int exclude_bars)
> +{
> +=09struct resource *res =3D pci_resource_n(pdev, resno);
> +=09struct pci_dev_resource *dev_res;
> +=09struct pci_bus *bus =3D pdev->bus;
> +=09struct resource *b_win, *r;
> +=09LIST_HEAD(saved);
> +=09unsigned int i;
> +=09int ret =3D 0;
> +
> +=09b_win =3D pbus_select_window(bus, res);
> +=09if (!b_win)
> +=09=09return -EINVAL;
> +
> +=09pci_dev_for_each_resource(pdev, r, i) {
> +=09=09if (i >=3D PCI_BRIDGE_RESOURCES)
> +=09=09=09break;
> +
> +=09=09if (exclude_bars & BIT(i))
> +=09=09=09continue;
> =20
> +=09=09if (b_win !=3D pbus_select_window(bus, r))
> +=09=09=09continue;
> +
> +=09=09ret =3D add_to_list(&saved, pdev, r, 0, 0);
> +=09=09if (ret)
> +=09=09=09goto restore;
> +=09=09pci_release_resource(pdev, i);
> +=09}
> +
> +=09pci_resize_resource_set_size(pdev, resno, size);
> +
> +=09if (!bus->self)
> +=09=09goto out;
> +
> +=09down_read(&pci_bus_sem);
> +=09ret =3D pbus_reassign_bridge_resources(bus, res, &saved);
> +=09if (ret)
> +=09=09goto restore;
> +
> +out:
> +=09up_read(&pci_bus_sem);
> +=09free_list(&saved);
> +=09return ret;
> +
> +restore:
>  =09/* Revert to the old configuration */
>  =09list_for_each_entry(dev_res, &saved, list) {
>  =09=09struct resource *res =3D dev_res->res;
> @@ -2510,13 +2552,21 @@ int pbus_reassign_bridge_resources(struct pci_bus=
 *bus, struct resource *res)
> =20
>  =09=09restore_dev_resource(dev_res);
> =20
> -=09=09pci_claim_resource(dev, i);
> -=09=09pci_setup_bridge(dev->subordinate);
> -=09}
> -=09up_read(&pci_bus_sem);
> -=09free_list(&saved);
> +=09=09ret =3D pci_claim_resource(dev, i);
> +=09=09if (ret)
> +=09=09=09continue;
> =20
> -=09return ret;
> +=09=09if (i < PCI_BRIDGE_RESOURCES) {
> +=09=09=09const char *res_name =3D pci_resource_name(dev, i);
> +
> +=09=09=09pci_update_resource(dev, i);
> +=09=09=09pci_info(dev, "%s %pR: old value restored\n",
> +=09=09=09=09 res_name, res);
> +=09=09}
> +=09=09if (dev->subordinate)
> +=09=09=09pci_setup_bridge(dev->subordinate);
> +=09}
> +=09goto out;
>  }
> =20
>  void pci_assign_unassigned_bus_resources(struct pci_bus *bus)
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index 3d0b0b3f60c4..e4486d7030c0 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -444,8 +444,7 @@ static bool pci_resize_is_memory_decoding_enabled(str=
uct pci_dev *dev,
>  =09return cmd & PCI_COMMAND_MEMORY;
>  }
> =20
> -static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
> -=09=09=09=09=09 int size)
> +void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int si=
ze)
>  {
>  =09resource_size_t res_size =3D pci_rebar_size_to_bytes(size);
>  =09struct resource *res =3D pci_resource_n(dev, resno);
> @@ -456,9 +455,9 @@ static void pci_resize_resource_set_size(struct pci_d=
ev *dev, int resno,
>  =09resource_set_size(res, res_size);
>  }
> =20
> -int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> +int pci_resize_resource(struct pci_dev *dev, int resno, int size,
> +=09=09=09int exclude_bars)
>  {
> -=09struct resource *res =3D pci_resource_n(dev, resno);
>  =09struct pci_host_bridge *host;
>  =09int old, ret;
>  =09u32 sizes;
> @@ -468,10 +467,6 @@ int pci_resize_resource(struct pci_dev *dev, int res=
no, int size)
>  =09if (host->preserve_config)
>  =09=09return -ENOTSUPP;
> =20
> -=09/* Make sure the resource isn't assigned before resizing it. */
> -=09if (!(res->flags & IORESOURCE_UNSET))
> -=09=09return -EBUSY;
> -
>  =09if (pci_resize_is_memory_decoding_enabled(dev, resno))
>  =09=09return -EBUSY;
> =20
> @@ -490,19 +485,13 @@ int pci_resize_resource(struct pci_dev *dev, int re=
sno, int size)
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09pci_resize_resource_set_size(dev, resno, size);
> -
> -=09/* Check if the new config works by trying to assign everything. */
> -=09if (dev->bus->self) {
> -=09=09ret =3D pbus_reassign_bridge_resources(dev->bus, res);
> -=09=09if (ret)
> -=09=09=09goto error_resize;
> -=09}
> +=09ret =3D pci_do_resource_release_and_resize(dev, resno, size, exclude_=
bars);
> +=09if (ret)
> +=09=09goto error_resize;
>  =09return 0;
> =20
>  error_resize:
>  =09pci_rebar_set_size(dev, resno, old);
> -=09pci_resize_resource_set_size(dev, resno, old);
>  =09return ret;
>  }
>  EXPORT_SYMBOL(pci_resize_resource);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index d1fdf81fbe1e..cc58abbd2b20 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1428,7 +1428,8 @@ static inline int pci_rebar_bytes_to_size(u64 bytes=
)
>  }
> =20
>  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
> -int __must_check pci_resize_resource(struct pci_dev *dev, int i, int siz=
e);
> +int __must_check pci_resize_resource(struct pci_dev *dev, int i, int siz=
e,
> +=09=09=09=09     int exlucde_bars);

It seems I managed to mistype this in the prototype, please let me know if=
=20
you want me to send v3 addressing this and the other comments.

--=20
 i.

--8323328-64272619-1763052367=:1464--
