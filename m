Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD36ACF3EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FAE10E288;
	Thu,  5 Jun 2025 16:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RETF9+Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C202D10E2B2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:17:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AD965C5572;
 Thu,  5 Jun 2025 16:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC90C4CEE7;
 Thu,  5 Jun 2025 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749140234;
 bh=R2kAT8sgTVzEg0Z9dPF3UmifglniI93iuJxDsKCUq4E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RETF9+Fi566neb4lJUpVLBOnK1Q0DHWFqA422TSAoXhbf7GHEODVktjFPnGcb07Ta
 kOlF0aK90BS+b+AiPwJxUZiKLwsNJSzbqIMH42/smRXUEP0vOXRwuknlk5wdLLeW0X
 jIbGv8yAN7a3R2ZoA88CWDALpE4x2Hc1YB0rjkJFARh1FZeoVrNpwlGikvihjETTSP
 KXwkqG5+CDCEtGNNOBQc0ZvWP+VDLDFfEFVXV33nSylK2zNa8UhKAWecCyrrk7YCml
 vfFtmhR4/MsoPIJvEBUXUVHFKjeoo5YlWkVygaoZdiWeYvBMVE4qpU22KNIjjoPy8f
 eFQS4zumEsmpw==
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
In-Reply-To: <20250605151029.GC19710@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5ah60u8kev.fsf@kernel.org> <20250605151029.GC19710@nvidia.com>
Date: Thu, 05 Jun 2025 21:47:01 +0530
Message-ID: <yq5a7c1q88oy.fsf@kernel.org>
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

> On Thu, Jun 05, 2025 at 05:33:52PM +0530, Aneesh Kumar K.V wrote:
>
>> > +
>> > +	/* To ensure no host side MMIO access is possible */
>> > +	ret =3D pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
>> > +	if (ret)
>> > +		goto out_unlock;
>> > +
>> >
>>=20
>> I am hitting failures here with similar changes. Can you share the Qemu
>> changes needed to make this pci_request_regions_exclusive successful.
>> Also after the TDI is unbound, we want the region ownership backto
>> "vfio-pci" so that things continue to work as non-secure device. I don't
>> see we doing that. I could add a pci_bar_deactivate/pci_bar_activate in
>> userspace which will result in vfio_unmap()/vfio_map(). But that doesn't
>> release the region ownership.
>
> Again, IMHO, we should not be doing this dynamically. VFIO should do
> pci_request_regions_exclusive() once at the very start and it should
> stay that way.
>
> There is no reason to change it dynamically.
>
> The only decision to make is if all vfio should switch to exclusive
> mode or if we need to make it optional for userspace.

We only need the exclusive mode when the device is operating in secure
mode, correct? That suggests we=E2=80=99ll need to dynamically toggle this
setting based on the device=E2=80=99s security state.

-aneesh
