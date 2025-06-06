Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A3ACFF57
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6E310E2F0;
	Fri,  6 Jun 2025 09:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aHjUGbiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7291410E2F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 09:33:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 85C4261139;
 Fri,  6 Jun 2025 09:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A5FC4CEEB;
 Fri,  6 Jun 2025 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749202382;
 bh=a/cSRPXXvWMntEronSsbDihFTabNg3hkGiuEn4chUIA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aHjUGbiMRTgqmKBI5/NKSytER+wD+f8xtIQAG9im9jNLtdG0Euimvzu7mf27OGY9+
 02d4tGq5I3JSdFyRFuprtiwxviESlUW+rjOju0gNhU9O+51pPm9ArY1Jb4zZ9+iaFL
 4+tfVM5CGBw9LbksFk0KUh5/3IXXkhxjz3MX4gFhNP8vwp4S3zppGj+T6jvzfDfI3b
 mC65zomebElguFf6DZbQwXmqg3dRm2SZQ7UVQMkAS0eZMMVEXIPjCElKMlyC9MjPDR
 1CanswgBu1tw1VRmrDvt8/qS2s2JGvUgF4Q+c893ZONew80RB7FZKa7htzlP+zA8/a
 BvOmCaJ/eEw3w==
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
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
In-Reply-To: <20250605163339.GE19710@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5ah60u8kev.fsf@kernel.org> <20250605151029.GC19710@nvidia.com>
 <yq5a7c1q88oy.fsf@kernel.org> <20250605163339.GE19710@nvidia.com>
Date: Fri, 06 Jun 2025 15:02:49 +0530
Message-ID: <yq5a1prx8bb2.fsf@kernel.org>
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

> On Thu, Jun 05, 2025 at 09:47:01PM +0530, Aneesh Kumar K.V wrote:
>> Jason Gunthorpe <jgg@nvidia.com> writes:
>>=20
>> > On Thu, Jun 05, 2025 at 05:33:52PM +0530, Aneesh Kumar K.V wrote:
>> >
>> >> > +
>> >> > +	/* To ensure no host side MMIO access is possible */
>> >> > +	ret =3D pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
>> >> > +	if (ret)
>> >> > +		goto out_unlock;
>> >> > +
>> >> >
>> >>=20
>> >> I am hitting failures here with similar changes. Can you share the Qe=
mu
>> >> changes needed to make this pci_request_regions_exclusive successful.
>> >> Also after the TDI is unbound, we want the region ownership backto
>> >> "vfio-pci" so that things continue to work as non-secure device. I do=
n't
>> >> see we doing that. I could add a pci_bar_deactivate/pci_bar_activate =
in
>> >> userspace which will result in vfio_unmap()/vfio_map(). But that does=
n't
>> >> release the region ownership.
>> >
>> > Again, IMHO, we should not be doing this dynamically. VFIO should do
>> > pci_request_regions_exclusive() once at the very start and it should
>> > stay that way.
>> >
>> > There is no reason to change it dynamically.
>> >
>> > The only decision to make is if all vfio should switch to exclusive
>> > mode or if we need to make it optional for userspace.
>>=20
>> We only need the exclusive mode when the device is operating in secure
>> mode, correct? That suggests we=E2=80=99ll need to dynamically toggle th=
is
>> setting based on the device=E2=80=99s security state.
>
> No, if the decision is that VFIO should allow this to be controlled by
> userspace then userspace will tell iommufd to run in regions_exclusive
> mode prior to opening the vfio cdev and VFIO will still do it once at
> open time and never change it.
>

So this will be handled by setting
vdevice::flags =3D IOMMUFD_PCI_REGION_EXCLUSIVE in
iommufd_vdevice_alloc_ioctl()? And we set this flag when starting a
secure guest, regardless of whether the device is TEE-capable or not

and vfio_pci_core_mmap() will do

	if (!vdev->barmap[index]) {

		if (core_vdev->iommufd_device &&
		    iommufd_vdevice_region_exclusive(core_vdev->iommufd_device))
			ret =3D pci_request_selected_regions_exclusive(pdev,
							1 << index, "vfio-pci");
		else
			ret =3D pci_request_selected_regions(pdev,
						1 << index, "vfio-pci");




>
> The only thing request_regions does is block other drivers outside
> vfio from using this memory space. There is no reason at all to change
> this dynamically. A CC VMM using VFIO will never use a driver outside
> VFIO to touch the VFIO controlled memory.
>
> Jason

-aneesh
