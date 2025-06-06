Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B62ACFDDD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF1E10E98E;
	Fri,  6 Jun 2025 08:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pqhLkbKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505E810E361
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:00:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D45FC61139;
 Fri,  6 Jun 2025 08:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA779C4CEEB;
 Fri,  6 Jun 2025 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749196801;
 bh=KfrhofsOFofV4Yxp9rI2KSMcovauU9GJjmAbXeaDSsg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pqhLkbKMkWlh09VG2BUFsVfs6NK4OKZbNwioszl4dtm7v6FQc/Us4v9H8idPC/YAZ
 R9D+pS+mxBdOKoDLgqtqaLdXdLYDHR597Gg2BMYpada9SrbtQR4t7wJ6ImnWZzHOGF
 5gnEw5tKPIaK4Qhwzw0wHveRseXshANV2N2aXKDZSBLnFRNaJV0E6A9mAQ3TDfvhAW
 nq1UgqiGf25d7D2QCO1dYHLdR3DKyUk5gBrQSU/DXnxiQOQSAcqvdEmw/eUcLOA38h
 uMHfd3tmg5iZSInah3S9vB1cxcIVwyIczZWhxfCIK6FtpP8QL5Pdy+ytPlW1pxl4sd
 CpZ9A7pZeYAkw==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 17/30] iommufd/device: Add TSM Bind/Unbind for TIO
 support
In-Reply-To: <20250604132403.GJ5028@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-18-yilun.xu@linux.intel.com>
 <yq5awm9ujouz.fsf@kernel.org> <aD6UQy4KwKcdSvVE@yilunxu-OptiPlex-7050>
 <20250603122149.GH376789@nvidia.com> <yq5aplfj99x0.fsf@kernel.org>
 <20250604132403.GJ5028@nvidia.com>
Date: Fri, 06 Jun 2025 13:29:46 +0530
Message-ID: <yq5a4iwt8fm5.fsf@kernel.org>
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

Jason Gunthorpe <jgg@nvidia.com> writes:

....

>> tsm_unbind in vdevice_destroy:
>>=20
>> vdevice_destroy() ends up calling tsm_unbind() while holding only the
>> vdev_lock. At first glance, this seems unsafe. But in practice, it's
>> fine because the corresponding iommufd_device has already been destroyed
>> when the VFIO device file descriptor was closed=E2=80=94triggering
>> vfio_df_iommufd_unbind().
>
> This needs some kind of fixing the idevice should destroy the vdevices
> during idevice destruction so we don't get this out of order where the
> idevice is destroyed before the vdevice.
>
> This should be a separate patch as it is an immediate bug fix..
>

Something like below?

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 86244403b532..a49b293bd516 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -221,6 +221,8 @@ struct iommufd_device *iommufd_device_bind(struct iommu=
fd_ctx *ictx,
 	refcount_inc(&idev->obj.users);
 	/* igroup refcount moves into iommufd_device */
 	idev->igroup =3D igroup;
+	idev->vdev   =3D NULL;
+	mutex_init(&idev->lock);
=20
 	/*
 	 * If the caller fails after this success it must call
@@ -282,6 +284,12 @@ EXPORT_SYMBOL_NS_GPL(iommufd_ctx_has_group, "IOMMUFD");
  */
 void iommufd_device_unbind(struct iommufd_device *idev)
 {
+	/* this will be unlocked while destroying the idev obj */
+	mutex_lock(&idev->lock);
+
+	if (idev->vdev)
+		/* extra refcount taken during vdevice alloc */
+		iommufd_object_destroy_user(idev->ictx, &idev->vdev->obj);
 	iommufd_object_destroy_user(idev->ictx, &idev->obj);
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, "IOMMUFD");
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommuf=
d/iommufd_private.h
index 9ccc83341f32..d85bd8b38751 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -425,6 +425,10 @@ struct iommufd_device {
 	/* always the physical device */
 	struct device *dev;
 	bool enforce_cache_coherency;
+	/* to protect the following members*/
+	struct mutex lock;
+	/* if there is a vdevice mapping the idev */
+	struct iommufd_vdevice *vdev;
 };
=20
 static inline struct iommufd_device *
@@ -606,6 +610,7 @@ struct iommufd_vdevice {
 	struct iommufd_ctx *ictx;
 	struct iommufd_viommu *viommu;
 	struct device *dev;
+	struct iommufd_device *idev;
 	u64 id; /* per-vIOMMU virtual ID */
 };
=20
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 3df468f64e7d..c38303df536f 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -172,6 +172,11 @@ int iommufd_object_remove(struct iommufd_ctx *ictx,
 		ictx->vfio_ioas =3D NULL;
 	xa_unlock(&ictx->objects);
=20
+	if (obj->type =3D=3D IOMMUFD_OBJ_DEVICE) {
+		/* idevice should be freed with lock held */
+		struct iommufd_device *idev =3D container_of(obj, struct iommufd_device,=
 obj);
+		mutex_unlock(&idev->lock);
+	}
 	/*
 	 * Since users is zero any positive users_shortterm must be racing
 	 * iommufd_put_object(), or we have a bug.
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 01df2b985f02..17f189bc9e2c 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -84,15 +84,24 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucm=
d)
 	return rc;
 }
=20
+/* This will be called from iommufd_device_unbind  */
 void iommufd_vdevice_destroy(struct iommufd_object *obj)
 {
 	struct iommufd_vdevice *vdev =3D
 		container_of(obj, struct iommufd_vdevice, obj);
 	struct iommufd_viommu *viommu =3D vdev->viommu;
+	struct iommufd_device *idev =3D vdev->idev;
+
+	/*
+	 * since we have an refcount on idev, it can't be freed.
+	 */
+	lockdep_assert_held(&idev->lock);
=20
 	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
 	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
 	refcount_dec(&viommu->obj.users);
+	idev->vdev =3D NULL;
+	refcount_dec(&idev->obj.users);
 	put_device(vdev->dev);
 }
=20
@@ -124,10 +133,15 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *=
ucmd)
 		goto out_put_idev;
 	}
=20
+	mutex_lock(&idev->lock);
+	if (idev->vdev) {
+		rc =3D -EINVAL;
+		goto out_put_idev_unlock;
+	}
 	vdev =3D iommufd_object_alloc(ucmd->ictx, vdev, IOMMUFD_OBJ_VDEVICE);
 	if (IS_ERR(vdev)) {
 		rc =3D PTR_ERR(vdev);
-		goto out_put_idev;
+		goto out_put_idev_unlock;
 	}
=20
 	vdev->id =3D virt_id;
@@ -147,10 +161,18 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *=
ucmd)
 	if (rc)
 		goto out_abort;
 	iommufd_object_finalize(ucmd->ictx, &vdev->obj);
-	goto out_put_idev;
+	/* don't allow idev free without vdev free */
+	refcount_inc(&idev->obj.users);
+	vdev->idev =3D idev;
+	/* vdev lifecycle now managed by idev */
+	idev->vdev =3D vdev;
+	refcount_inc(&vdev->obj.users);
+	goto out_put_idev_unlock;
=20
 out_abort:
 	iommufd_object_abort_and_destroy(ucmd->ictx, &vdev->obj);
+out_put_idev_unlock:
+	mutex_unlock(&idev->lock);
 out_put_idev:
 	iommufd_put_object(ucmd->ictx, &idev->obj);
 out_put_viommu:
