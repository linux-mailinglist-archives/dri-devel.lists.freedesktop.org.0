Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKGoFSSecGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:36:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3354813
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D0410E731;
	Wed, 21 Jan 2026 09:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6+k0CNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181310E72B;
 Wed, 21 Jan 2026 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988192; x=1800524192;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qL9iu/H5hpUrP/X6+ggfEAqN7pCzi7K6vLcfE1tY/YA=;
 b=e6+k0CNtnOrCxHtia9YZYzbn6HZW3/yeAn50pdVz48/oDX5d4hn1NAYZ
 AInXBnGemUHtxKJnNyMo7YZGh6+wwKxRd/vnrFhKidws+QIUrRyByb5cK
 i5jtMfa5qcBvSykXn2mD/yhUo09Ffm2jPdVwBGS5K++DEEhU6Vs3zfemu
 VJJMw6Wc0AIqNAjVbY9xaKDolfHAe2/3Rmli8FxqZgcgHNbpp2WisUxpA
 lt3ipjM7CI28EH6dxYEFYSMjlh1hdfSAZeZfQhNw5cBGfRJlqgJrXCb0n
 bvpOioRiWQNwV6oR2t/cagC6zqPVVgTD6FnRdJKINY9eHEwwahWl4TP1n Q==;
X-CSE-ConnectionGUID: 8h/OYap6TlCgU6jGfQYAig==
X-CSE-MsgGUID: YCmR13y9TliCJByGsV6MLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87624104"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87624104"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:36:32 -0800
X-CSE-ConnectionGUID: 60Hy4B3ETOyz27yzkkUGrg==
X-CSE-MsgGUID: Cg2+ahF4Sdui1FjdHXerRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206639396"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.107])
 ([10.245.245.107])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:36:24 -0800
Message-ID: <107464758df9444a465a3a9e387f5a42827aff51.camel@linux.intel.com>
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Leon
 Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Alex
 Deucher	 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter	 <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry
 Osipenko	 <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>,  Chia-I Wu <olvaffe@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi	 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Felix Kuehling	 <Felix.Kuehling@amd.com>, Alex
 Williamson <alex@shazbot.org>, Ankit Agrawal	 <ankita@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 iommu@lists.linux.dev, kvm@vger.kernel.org
Date: Wed, 21 Jan 2026 10:36:09 +0100
In-Reply-To: <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,linaro.org,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,nvidia.com:email,intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Queue-Id: B4E3354813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Christian,

On Wed, 2026-01-21 at 10:20 +0100, Christian K=C3=B6nig wrote:
> On 1/20/26 15:07, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >=20
> > dma-buf invalidation is performed asynchronously by hardware, so
> > VFIO must
> > wait until all affected objects have been fully invalidated.
> >=20
> > Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO
> > regions")
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Please also keep in mind that the while this wait for all fences for
> correctness you also need to keep the mapping valid until
> dma_buf_unmap_attachment() was called.

I'm wondering shouldn't we require DMA_RESV_USAGE_BOOKKEEP here, as
*any* unsignaled fence could indicate access through the map?

/Thomas

>=20
> In other words you can only redirect the DMA-addresses previously
> given out into nirvana (or a dummy memory or similar), but you still
> need to avoid re-using them for something else.
>=20
> Regards,
> Christian.
>=20
> > ---
> > =C2=A0drivers/vfio/pci/vfio_pci_dmabuf.c | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index d4d0f7d08c53..33bc6a1909dd 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -321,6 +321,9 @@ void vfio_pci_dma_buf_move(struct
> > vfio_pci_core_device *vdev, bool revoked)
> > =C2=A0			dma_resv_lock(priv->dmabuf->resv, NULL);
> > =C2=A0			priv->revoked =3D revoked;
> > =C2=A0			dma_buf_move_notify(priv->dmabuf);
> > +			dma_resv_wait_timeout(priv->dmabuf->resv,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > DMA_RESV_USAGE_KERNEL, false,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > MAX_SCHEDULE_TIMEOUT);
> > =C2=A0			dma_resv_unlock(priv->dmabuf->resv);
> > =C2=A0		}
> > =C2=A0		fput(priv->dmabuf->file);
> > @@ -342,6 +345,8 @@ void vfio_pci_dma_buf_cleanup(struct
> > vfio_pci_core_device *vdev)
> > =C2=A0		priv->vdev =3D NULL;
> > =C2=A0		priv->revoked =3D true;
> > =C2=A0		dma_buf_move_notify(priv->dmabuf);
> > +		dma_resv_wait_timeout(priv->dmabuf->resv,
> > DMA_RESV_USAGE_KERNEL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> > MAX_SCHEDULE_TIMEOUT);
> > =C2=A0		dma_resv_unlock(priv->dmabuf->resv);
> > =C2=A0		vfio_device_put_registration(&vdev->vdev);
> > =C2=A0		fput(priv->dmabuf->file);
> >=20
