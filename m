Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923EA7A0E3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0492F10E987;
	Thu,  3 Apr 2025 10:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVNbctpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A410E987;
 Thu,  3 Apr 2025 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675667; x=1775211667;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=WzPE+yc35G0Ukevwleocf1xZFNkNNZmTwRFnHBsa3R4=;
 b=eVNbctpMWrW06mMfjaeVHw4uAp+axkDYO4MozWWSnFs+xe1shpx8GZxg
 /epg/FJ1ksW1vbZ+zA1RmArJJWQM1fPRgMtVRYbBEWqt2/THNQsU5DwP3
 4yrpEmMNwVeZeOUPYuxgJpAr5Yg3l0RSFjBVo9mHAeZKk6g7T4WCPG7MN
 SclOIgtK+/qpDmhhuSokdaq2WHuYZVUXkadlWAAo6zpp68zQuZEODH5FU
 TpOZjbh/o7bJbLGwityjHcMdXPp9VS446iEkp3ZF1eDYLLfc6oTxPeXlC
 5JxcrkrayNATmgvN7l0SimlVH2wQ9USqVx11ZOQktEyynbIKXC7GWqeQ3 w==;
X-CSE-ConnectionGUID: 6TLiwQE3QOyui5so0itM4w==
X-CSE-MsgGUID: ZrIGKD8ZSUS6/JpLl9SAUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55745494"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55745494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:21:06 -0700
X-CSE-ConnectionGUID: E26iemQmTHK+vF7TmOFN3w==
X-CSE-MsgGUID: buV1Yn3mT6KD5KN/3k38uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164201212"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:21:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 13:20:58 +0300 (EEST)
To: =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>
cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 5/6] PCI: Allow drivers to control VF BAR size
In-Reply-To: <20250402141122.2818478-6-michal.winiarski@intel.com>
Message-ID: <14a7c29e-31b9-2954-9142-0d1c49988b07@linux.intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
 <20250402141122.2818478-6-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1193295669-1743675658=:1302"
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

--8323328-1193295669-1743675658=:1302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Apr 2025, Micha=C5=82 Winiarski wrote:

> Drivers could leverage the fact that the VF BAR MMIO reservation is
> created for total number of VFs supported by the device by resizing the
> BAR to larger size when smaller number of VFs is enabled.
>=20
> Add a pci_iov_vf_bar_set_size() function to control the size and a
> pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
> allow up to num_vfs to be successfully enabled with the current
> underlying reservation size.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c   | 69 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci.h |  6 ++++
>  2 files changed, 75 insertions(+)
>=20
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 2fafbd6a998f0..8a62049b56b41 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -1313,3 +1313,72 @@ int pci_sriov_configure_simple(struct pci_dev *dev=
, int nr_virtfn)
>  =09return nr_virtfn;
>  }
>  EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
> +
> +/**
> + * pci_iov_vf_bar_set_size - set a new size for a VF BAR
> + * @dev: the PCI device
> + * @resno: the resource number
> + * @size: new size as defined in the spec (0=3D1MB, 31=3D128TB)
> + *
> + * Set the new size of a VF BAR that supports VF resizable BAR capabilit=
y.
> + * Unlike pci_resize_resource(), this does not cause the resource that
> + * reserves the MMIO space (originally up to total_VFs) to be resized, w=
hich
> + * means that following calls to pci_enable_sriov() can fail if the reso=
urces
> + * no longer fit.
> + *
> + * Return: 0 on success, or negative on failure.
> + */
> +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
> +{
> +=09int ret;
> +=09u32 sizes;

Please reverse the order of these variables.

> +
> +=09if (!pci_resource_is_iov(resno))
> +=09=09return -EINVAL;
> +
> +=09if (pci_iov_is_memory_decoding_enabled(dev))
> +=09=09return -EBUSY;
> +
> +=09sizes =3D pci_rebar_get_possible_sizes(dev, resno);
> +=09if (!sizes)
> +=09=09return -ENOTSUPP;
> +
> +=09if (!(sizes & BIT(size)))

Add include for BIT().

Although adding a helper like this would be helpful for multiple callers:

@@ -3780,6 +3780,88 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pde=
v, int bar)
 }
 EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
=20
+/**
+ * pci_rebar_size_supported - check if size is supported for a resizable B=
AR
+ * @pdev: PCI device
+ * @bar: BAR to check
+ * @size: size as defined in the spec (0=3D1MB, 31=3D128TB)
+ *
+ * Return: %0 if @size is supported for @bar,
+ *        %-EINVAL if @size is not supported,
+ *        %-ENOTSUPP if @bar is not resizable.
+ */
+int pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
+{
+       u64 sizes;
+
+       sizes =3D pci_rebar_get_possible_sizes(pdev, bar);
+       if (!sizes)
+               return -ENOTSUPP;
+
+       return BIT(size) & sizes ? 0 : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(pci_rebar_size_supported);

(Yes, I've some rebar helpers pending so this is extract from that.)

> +=09=09return -EINVAL;
> +
> +=09ret =3D pci_rebar_set_size(dev, resno, size);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
> +
> +/**
> + * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to =
num_vfs
> + * @dev: the PCI device
> + * @resno: the resource number
> + * @num_vfs: number of VFs
> + *
> + * Get the sizes of a VF resizable BAR that can accommodate @num_vfs wit=
hin
> + * the currently assigned size of the resource @resno.
> + *
> + * Return: A bitmask of sizes in format defined in the spec (bit 0=3D1MB=
,
> + * bit 31=3D128TB).
> + */
> +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs=
)
> +{
> +=09resource_size_t vf_len =3D pci_resource_len(dev, resno);
> +=09u32 sizes;
> +
> +=09if (!num_vfs)
> +=09=09return 0;
> +
> +=09do_div(vf_len, num_vfs);

Add include for do_div().

> +=09sizes =3D (roundup_pow_of_two(vf_len + 1) - 1) >> ilog2(SZ_1M);

Doesn't resource_size() already do that + 1 so why is a second one needed=
=20
here?

Add include for ilog() and SZ_*.

> +
> +=09return sizes & pci_rebar_get_possible_sizes(dev, resno);
> +}
> +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e967..c8708f3749757 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2389,6 +2389,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16=
 numvfs);
>  int pci_sriov_get_totalvfs(struct pci_dev *dev);
>  int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
>  resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
> +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
> +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs=
);
>  void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
> =20
>  /* Arch may override these (weak) */
> @@ -2441,6 +2443,10 @@ static inline int pci_sriov_get_totalvfs(struct pc=
i_dev *dev)
>  #define pci_sriov_configure_simple=09NULL
>  static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev,=
 int resno)
>  { return 0; }
> +static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno=
, int size)
> +{ return -ENODEV; }
> +static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resn=
o, int num_vfs)
> +{ return 0; }
>  static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool pr=
obe) { }
>  #endif
> =20
>=20

--=20
 i.

--8323328-1193295669-1743675658=:1302--
