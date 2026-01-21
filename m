Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MChFCEukcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:02:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C686154DBD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D8910E73D;
	Wed, 21 Jan 2026 10:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVEJayuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129C10E737;
 Wed, 21 Jan 2026 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768989767; x=1800525767;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=5x1yWRMZo6Yjnl9EgGnZ48kgw7u1ZpJ/OyNDBks1Pvc=;
 b=JVEJayuwxMWMB7auObJXx3n2zE4vmNW4O5Jw71TTieFSUOuUou7+AY1S
 LOXD9qtT3LLKQ9q0rc+7FgQsnXfxDqQy+8qIr8mzO6+9HH92pu7pqvg8J
 Qc1mJHXik6RxDS5Kyj7GwuJU4f5eec/ZrI5vos8cUSK8mldnEXSh+5Qqr
 Nt/76DeWsTZmVhazZ5CvyCCtA0nZK321+ZZSmpCcl3KTAqKIgnBbo+8HF
 +hfbwfDaJngGFA0xGapiua41DA4ujalZM2DxZzqEh2rBbXe3LCnMWgzL4
 JtJ1jvFsTpPtgntuQZKKzO4iQiXvtldynz9V7A0aN+qW3kx183rZeJUAC w==;
X-CSE-ConnectionGUID: DXI1lQvNQvaYdWodbx6P7g==
X-CSE-MsgGUID: EON/8dkDRbWhl/Iajf9yWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87625892"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87625892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 02:02:46 -0800
X-CSE-ConnectionGUID: CPohdRaPRjGLk71wGPUZ9A==
X-CSE-MsgGUID: EWgQ+mAZSQa/dfE6ACW4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206643649"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.108])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 02:02:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Jan 2026 12:02:35 +0200 (EET)
To: =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] PCI: Fix restoring BARs on BAR resize rollback
 path
In-Reply-To: <aW_w1oFQCzUxGYtu@intel.com>
Message-ID: <bf1ece5f-07dd-31e7-db0d-40dfa8ebf7b7@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-7-ilpo.jarvinen@linux.intel.com>
 <aW_w1oFQCzUxGYtu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-237514233-1768987075=:1033"
Content-ID: <c081b2b9-396b-b5f8-3d52-7b064a7fde28@linux.intel.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FREEMAIL_CC(0.00)[linaro.org,hogyros.de,intel.com,amd.com,lists.freedesktop.org,google.com,gmail.com,linux.intel.com,vger.kernel.org,ffwll.ch,ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: C686154DBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-237514233-1768987075=:1033
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <42d4d565-d15f-b9b5-c51a-da0923ea45e4@linux.intel.com>

On Tue, 20 Jan 2026, Ville Syrj=E4l=E4 wrote:

> On Thu, Nov 13, 2025 at 06:26:23PM +0200, Ilpo J=E4rvinen wrote:
> > BAR resize operation is implemented in the pci_resize_resource() and
> > pbus_reassign_bridge_resources() functions. pci_resize_resource() can
> > be called either from __resource_resize_store() from sysfs or directly
> > by the driver for the Endpoint Device.
> >=20
> > The pci_resize_resource() requires that caller has released the device
> > resources that share the bridge window with the BAR to be resized as
> > otherwise the bridge window is pinned in place and cannot be changed.
> >=20
> > pbus_reassign_bridge_resources() implement rollback of the resources if
> > the resize operation fails, but rollback is performed only for the
> > bridge windows. Because releasing the device resources are done by the
> > caller of the BAR resize interface, these functions performing the BAR
> > resize do not have access to the device resources as they were before
> > the resize.
> >=20
> > pbus_reassign_bridge_resources() could try to
> > __pci_bridge_assign_resources() after rolling back the bridge windows
> > as they were, however, it will not guarantee the resource are assigned
> > due to differences how FW and the kernel may want to assign the
> > resources (alignment of the start address and tail).
> >=20
> > In order to perform rollback robustly, the BAR resize interface has to
> > be altered to also release the device resources that share the bridge
> > window with the BAR to be resized.
> >=20
> > Also, remove restoring from the entries failed list as saved list
> > should now contain both the bridge windows and device resources so
> > the extra restore is duplicated work.
> >=20
> > Some drivers (currently only amdgpu) want to prevent releasing some
> > resources. Add exclude_bars param to pci_resize_resource() and make
> > amdgpu to pass its register BAR (BAR 5) which should never be released
> > during resize operation. Normally 64-bit prefetchable resources do not
> > share bridge window with it as the register BAR (32-bit only) but there
> > are various fallbacks in the resource assignment logic which may make
> > the resources to share the bridge window in rare cases.
> >=20
> > This change (together with the driver side changes) is to counter the
> > resource releases that had to be done to prevent resource tree
> > corruption in the ("PCI: Release assigned resource before restoring
> > them") change. As such, it likely restores functionality in cases where
> > device resources were released to avoid resource tree conflicts which
> > appeared to be "working" when such conflicts were not correctly
> > detected by the kernel.
>=20
> This thing completely broke my DG2 + non-reBAR system.  The bisect
> points to commit 4efaa80b3d75 ("drm/i915: Remove driver side BAR
> release before resize") but the real problems seem to be in this
> patch. A had a quick look at the code and spotted a few issues...
>=20
> <snip>
> > @@ -2468,34 +2466,78 @@ int pbus_reassign_bridge_resources(struct pci_b=
us *bus, struct resource *res)
> >  =09=09free_list(&added);
> > =20
> >  =09if (!list_empty(&failed)) {
> > -=09=09if (pci_required_resource_failed(&failed, type)) {
> > +=09=09if (pci_required_resource_failed(&failed, type))
> >  =09=09=09ret =3D -ENOSPC;
> > -=09=09=09goto cleanup;
> > -=09=09}
> > -=09=09/* Only resources with unrelated types failed (again) */
> >  =09=09free_list(&failed);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +
> > +=09=09/* Only resources with unrelated types failed (again) */
> >  =09}
> > =20
> > -=09list_for_each_entry(dev_res, &saved, list) {
> > +=09list_for_each_entry(dev_res, saved, list) {
> >  =09=09struct pci_dev *dev =3D dev_res->dev;
> > =20
> >  =09=09/* Skip the bridge we just assigned resources for */
> >  =09=09if (bridge =3D=3D dev)
> >  =09=09=09continue;
> > =20
> > +=09=09if (!dev->subordinate)
> > +=09=09=09continue;
> > +
> >  =09=09pci_setup_bridge(dev->subordinate);
> >  =09}
> > =20
> > -=09free_list(&saved);
> > -=09up_read(&pci_bus_sem);
> >  =09return 0;
> > +}
> > =20
> > -cleanup:
> > -=09/* Restore size and flags */
> > -=09list_for_each_entry(dev_res, &failed, list)
> > -=09=09restore_dev_resource(dev_res);
> > -=09free_list(&failed);
> > +int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno=
, int size,
> > +=09=09=09=09       int exclude_bars)
> > +{
> > +=09struct resource *res =3D pci_resource_n(pdev, resno);
> > +=09struct pci_dev_resource *dev_res;
> > +=09struct pci_bus *bus =3D pdev->bus;
> > +=09struct resource *b_win, *r;
> > +=09LIST_HEAD(saved);
> > +=09unsigned int i;
> > +=09int ret =3D 0;
> > +
> > +=09b_win =3D pbus_select_window(bus, res);
> > +=09if (!b_win)
> > +=09=09return -EINVAL;
> > +
> > +=09pci_dev_for_each_resource(pdev, r, i) {
> > +=09=09if (i >=3D PCI_BRIDGE_RESOURCES)
> > +=09=09=09break;
> > +
> > +=09=09if (exclude_bars & BIT(i))
> > +=09=09=09continue;
> > =20
> > +=09=09if (b_win !=3D pbus_select_window(bus, r))
> > +=09=09=09continue;
> > +
> > +=09=09ret =3D add_to_list(&saved, pdev, r, 0, 0);
> > +=09=09if (ret)
> > +=09=09=09goto restore;
> > +=09=09pci_release_resource(pdev, i);
> > +=09}
> > +
> > +=09pci_resize_resource_set_size(pdev, resno, size);
> > +
> > +=09if (!bus->self)
> > +=09=09goto out;
> > +
> > +=09down_read(&pci_bus_sem);
> > +=09ret =3D pbus_reassign_bridge_resources(bus, res, &saved);
> > +=09if (ret)
> > +=09=09goto restore;
> > +
> > +out:
> > +=09up_read(&pci_bus_sem);
> > +=09free_list(&saved);
> > +=09return ret;
> > +
> > +restore:
> >  =09/* Revert to the old configuration */
> >  =09list_for_each_entry(dev_res, &saved, list) {
> >  =09=09struct resource *res =3D dev_res->res;
> > @@ -2510,13 +2552,21 @@ int pbus_reassign_bridge_resources(struct pci_b=
us *bus, struct resource *res)
> > =20
> >  =09=09restore_dev_resource(dev_res);
> > =20
> > -=09=09pci_claim_resource(dev, i);
> > -=09=09pci_setup_bridge(dev->subordinate);
> > -=09}
> > -=09up_read(&pci_bus_sem);
> > -=09free_list(&saved);
> > +=09=09ret =3D pci_claim_resource(dev, i);
> > +=09=09if (ret)
> > +=09=09=09continue;
>=20
> This clobbers 'ret' was supposedly meant to be returned to the
> caller in the end. Thus (at least in my case) the caller always
> sees a return value of 0, and then it forgets to restores the
> reBAR setting back to the original value.

Thanks for the report.

Yes, you're right it's wrong, I'll move that call inside the if.

> > -=09return ret;
> > +=09=09if (i < PCI_BRIDGE_RESOURCES) {
> > +=09=09=09const char *res_name =3D pci_resource_name(dev, i);
> > +
> > +=09=09=09pci_update_resource(dev, i);
> > +=09=09=09pci_info(dev, "%s %pR: old value restored\n",
> > +=09=09=09=09 res_name, res);
> > +=09=09}
> > +=09=09if (dev->subordinate)
> > +=09=09=09pci_setup_bridge(dev->subordinate);
> > +=09}
> > +=09goto out;
> >  }
> > =20
> >  void pci_assign_unassigned_bus_resources(struct pci_bus *bus)
> > diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> > index 3d0b0b3f60c4..e4486d7030c0 100644
> > --- a/drivers/pci/setup-res.c
> > +++ b/drivers/pci/setup-res.c
> > @@ -444,8 +444,7 @@ static bool pci_resize_is_memory_decoding_enabled(s=
truct pci_dev *dev,
> >  =09return cmd & PCI_COMMAND_MEMORY;
> >  }
> > =20
> > -static void pci_resize_resource_set_size(struct pci_dev *dev, int resn=
o,
> > -=09=09=09=09=09 int size)
> > +void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int =
size)
> >  {
> >  =09resource_size_t res_size =3D pci_rebar_size_to_bytes(size);
> >  =09struct resource *res =3D pci_resource_n(dev, resno);
> > @@ -456,9 +455,9 @@ static void pci_resize_resource_set_size(struct pci=
_dev *dev, int resno,
> >  =09resource_set_size(res, res_size);
> >  }
> > =20
> > -int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> > +int pci_resize_resource(struct pci_dev *dev, int resno, int size,
> > +=09=09=09int exclude_bars)
> >  {
> > -=09struct resource *res =3D pci_resource_n(dev, resno);
> >  =09struct pci_host_bridge *host;
> >  =09int old, ret;
> >  =09u32 sizes;
> > @@ -468,10 +467,6 @@ int pci_resize_resource(struct pci_dev *dev, int r=
esno, int size)
> >  =09if (host->preserve_config)
> >  =09=09return -ENOTSUPP;
> > =20
> > -=09/* Make sure the resource isn't assigned before resizing it. */
> > -=09if (!(res->flags & IORESOURCE_UNSET))
> > -=09=09return -EBUSY;
> > -
> >  =09if (pci_resize_is_memory_decoding_enabled(dev, resno))
> >  =09=09return -EBUSY;
> > =20
> > @@ -490,19 +485,13 @@ int pci_resize_resource(struct pci_dev *dev, int =
resno, int size)
> >  =09if (ret)
> >  =09=09return ret;
> > =20
> > -=09pci_resize_resource_set_size(dev, resno, size);
> > -
> > -=09/* Check if the new config works by trying to assign everything. */
> > -=09if (dev->bus->self) {
> > -=09=09ret =3D pbus_reassign_bridge_resources(dev->bus, res);
> > -=09=09if (ret)
> > -=09=09=09goto error_resize;
> > -=09}
> > +=09ret =3D pci_do_resource_release_and_resize(dev, resno, size, exclud=
e_bars);
> > +=09if (ret)
> > +=09=09goto error_resize;
> >  =09return 0;
> > =20
> >  error_resize:
> >  =09pci_rebar_set_size(dev, resno, old);
> > -=09pci_resize_resource_set_size(dev, resno, old);
>=20
> This new order is very broken because the new reBAR setting
> may have turned some of the originally set bits in the BAR
> to read-only. Thus we may not be able to restore the BAR back
> to the original value.
>=20
> In my case the original settings are 256MiB / 0x4030000000,
> followed by a failed resize to 8GiB, and finally we see a
> failed restore 'BAR 2: error updating (0x3000000c !=3D 0x0000000c)'
> due to the read-only bits.
>=20
> i915 limps along after the failure but nothing really works,
> and xe just completely explodes.

Hmm, I certainly didn't foresee this happening. It seems I need to break=20
the nice rebar/setup-bus layering to fix this (by moving the=20
pci_rebar_set_size() calls into pci_do_resource_release_and_resize()).


--=20
 i.
--8323328-237514233-1768987075=:1033--
