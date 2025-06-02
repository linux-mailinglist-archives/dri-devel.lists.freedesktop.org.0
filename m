Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0FACAE33
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 14:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CA410E2C1;
	Mon,  2 Jun 2025 12:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V7emBN1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0C10E2C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 12:43:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 849BAA50141;
 Mon,  2 Jun 2025 12:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7750AC4CEEB;
 Mon,  2 Jun 2025 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748868207;
 bh=M6LDVbtStMrFljOaOf+mHoY8Wc3iP1Za9Pz7obGiIR0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=V7emBN1DTn/BdreyF48omyyY5HquD4e3+BG3qXe6/FkYUvF1MajlqGEBgNtJEkuNy
 t3gUfvBr9HaS0UXytdOaxhHlEhndd48jqkq+u2O10jhbN7iF8cNbBzosYiIIJoK/MI
 O6FsQHx7mJkQQp1y+HpDlBM1eF3KEjXP2Kh5bxQ3TF3qgcbGL3BmyqmGhAh9/OTtLT
 f1rfCN9BT48rQYKV0lzqFTtrSiN6uv003iw1TWY/rsAkm4iljcH6CJvi5DAiZW8/Gp
 dEHTA5FgGMr1QBxmoEtvBUvmSnzWEPkfzb9z3p75qcwgRxw/fBzg7u+0FpenxuKr//
 rX2+rlIkEUdBw==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com,
 linux-pci@vger.kernel.org, zhiw@nvidia.com, simona.vetter@ffwll.ch,
 shameerali.kolothum.thodi@huawei.com, iommu@lists.linux.dev,
 kevin.tian@intel.com
Subject: Re: [RFC PATCH 17/30] iommufd/device: Add TSM Bind/Unbind for TIO
 support
In-Reply-To: <20250529053513.1592088-18-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-18-yilun.xu@linux.intel.com>
Date: Mon, 02 Jun 2025 18:13:16 +0530
Message-ID: <yq5awm9ujouz.fsf@kernel.org>
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

Xu Yilun <yilun.xu@linux.intel.com> writes:

....

> +/**
> + * iommufd_device_tsm_bind - Move a device to TSM Bind state
> + * @idev: device to attach
> + * @vdev_id: Input a IOMMUFD_OBJ_VDEVICE
> + *
> + * This configures for device Confidential Computing(CC), and moves the =
device
> + * to the TSM Bind state. Once this completes the device is locked down =
(TDISP
> + * CONFIG_LOCKED or RUN), waiting for guest's attestation.
> + *
> + * This function is undone by calling iommufd_device_tsm_unbind().
> + */
> +int iommufd_device_tsm_bind(struct iommufd_device *idev, u32 vdevice_id)
> +{
> +	struct iommufd_vdevice *vdev;
> +	int rc;
> +
> +	if (!dev_is_pci(idev->dev))
> +		return -ENODEV;
> +
> +	vdev =3D container_of(iommufd_get_object(idev->ictx, vdevice_id, IOMMUF=
D_OBJ_VDEVICE),
> +			    struct iommufd_vdevice, obj);
> +	if (IS_ERR(vdev))
> +		return PTR_ERR(vdev);
> +
> +	if (vdev->dev !=3D idev->dev) {
> +		rc =3D -EINVAL;
> +		goto out_put_vdev;
> +	}
> +
> +	mutex_lock(&idev->igroup->lock);
> +	if (idev->vdev) {
> +		rc =3D -EEXIST;
> +		goto out_unlock;
> +	}
> +
> +	rc =3D iommufd_vdevice_tsm_bind(vdev);
> +	if (rc)
> +		goto out_unlock;
> +
> +	idev->vdev =3D vdev;
> +	refcount_inc(&vdev->obj.users);
> +	mutex_unlock(&idev->igroup->lock);
> +
> +	/*
> +	 * Pairs with iommufd_device_tsm_unbind() - catches caller bugs attempt=
ing
> +	 * to destroy a bound device.
> +	 */
> +	refcount_inc(&idev->obj.users);
>

Do we really need this refcount_inc? As I understand it, the objects
aren't being pinned directly. Instead, the reference count seems to be
used more as a way to establish an object hierarchy, ensuring that
objects are freed in the correct order.

In vfio_pci_core_close_device(), you=E2=80=99re decrementing the reference,=
 and
on the iommufd side, we=E2=80=99re covered because the VFIO bind operation =
takes
a file reference (fget)=E2=80=94so iommufd_fops_release() won=E2=80=99t be =
called
prematurely.

Wouldn=E2=80=99t it be simpler to skip the reference count increment altoge=
ther
and just call tsm_unbind in the virtual device=E2=80=99s destroy callback?
(iommufd_vdevice_destroy())

> +	goto out_put_vdev;
> +
> +out_unlock:
> +	mutex_unlock(&idev->igroup->lock);
> +out_put_vdev:
> +	iommufd_put_object(idev->ictx, &vdev->obj);
> +	return rc;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_device_tsm_bind, "IOMMUFD");

-aneesh
