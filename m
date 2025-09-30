Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF97BACEEC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ACD10E2B3;
	Tue, 30 Sep 2025 12:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CvJCltn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8564110E2B3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCJAe+E2LF+oxKNEistG/9nAKXUMAbe1wRnTiU48f6ev6TUvQEqwl8Pb+n0RvOWxjzVG6wD5SqyOZLY22drmCCCsnT4wh1K8QooTB114+wB8LI6hJkmRUPv6AMFUAgPwutVeM2hZHI87AKugWkytPtbYUCi90FY1GJ5J9rl8ETwdZPeOXZSx3lMZ7nHmXJrUHQGQKePKXTkeNbKAf6ctn2w6hWu4/UPZYF+oW1jLZosiGLukbFt0sRvK5VBuJUgcDVfCUfyVaRbupOzh3F36WNTBlAf1AiJLyt29ihIC36K/Rv2CXkKi25X1UJ1W97f/P5CAu85Aq3/lwR3N3tfMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FhRKAEbVUZqQ5F9A4lMRmtvH3BXrYpOP8PXGUBoEt4=;
 b=JLygVw0feJ1khgL62+ml1NoTQKov8j0Tvct0zZr/Vvp9Q9gaLbmA44z2pBmUY8b4bgTGZdG8IwA8MkHvGPPEt2A+wnItXpg5fspHmoHyO8OIZexP9OtSvYjGaaIchheX0sYfoGQamZvyieoOzU0XMrLfQB+kq5QfyYg5xJvtiCGEnZWMT/s3xbuPq2bwE+hueoHkCXE6/ufVyLRpFYu6R6qhIhjstcn6btdxqg0IVIjcEBDvHIeN8NNlIa5z8ZR1WQdMKMbET/5m8Sk2m6tux+jj4pnZE9GCv07HXF6ZyW6vAMcZOmSn9FaSdATjBUsyr42Rh+0zXH9xnZkqNJTzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FhRKAEbVUZqQ5F9A4lMRmtvH3BXrYpOP8PXGUBoEt4=;
 b=CvJCltn8jAJHqv3V7xP2QSHnetEY2bRMw71VCrsvoZL+LDmO5oEDOH5SORg4HeO5NuNIwSLSzXJaORQ5LWgONjS6oD/xvlj7roDO9mYPo3jKcHGYyxRK/PE4kvfOiqu5HF2tIXIZuhJ/Ozm/5MZfMItTWmTX+mEiwnBXvryW55EQM0WCFVtkj7uhJ9vsd2+xQXIoSXdeHQ7j7niMXWm4vIhRN41189gygyk+Wn0BxcH7b3HR06BHEN0TRnXTJVxhP/aO+kCQFfDPNLO++Fz4VLEf6gJP2yHaVSHpIuTjikPxt4ROGl84osZpyf5bbh0OV91gTU9WdBgMr23f3c/Cag==
Received: from CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 12:50:47 +0000
Received: from CH3PR12MB7548.namprd12.prod.outlook.com
 ([fe80::e8c:e992:7287:cb06]) by CH3PR12MB7548.namprd12.prod.outlook.com
 ([fe80::e8c:e992:7287:cb06%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:50:47 +0000
From: Shameer Kolothum <skolothumtho@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: RE: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Topic: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Index: AQHcMIfjZsgV0WO2skun7ZexLpmyZbSqq/SAgADEaQCAABo64A==
Date: Tue, 30 Sep 2025 12:50:47 +0000
Message-ID: <CH3PR12MB754801DC65227CC39A3CB1F3AB1AA@CH3PR12MB7548.namprd12.prod.outlook.com>
References: <cover.1759070796.git.leon@kernel.org>
 <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
 <20250929151749.2007b192.alex.williamson@redhat.com>
 <20250930090048.GG324804@unreal>
In-Reply-To: <20250930090048.GG324804@unreal>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB7548:EE_|SA1PR12MB9471:EE_
x-ms-office365-filtering-correlation-id: 590df93e-1cb4-45a0-8405-08de001ff9f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?nhI2JxnKRja6ZMnW7X8Pzs8LYfaDT1lBGivQmptzuXktv4y+Hoiq+eHJxa?=
 =?iso-8859-1?Q?EvPe8VJKCZn9AIUsNJAtJZF5APACM05dnKVS+D69CroEyJm8go/O4LGRB3?=
 =?iso-8859-1?Q?sb/wWcJLvkkiFQYkmPobmondr2JOlQk3fl31w/MPmoW+vVZvU+P/gQnxb+?=
 =?iso-8859-1?Q?zKhJbIMUTWlqH0JM/Kx1oJ4jH00yD6UbaLYGFbcI4ITff1Uey9qQ2GQ9uv?=
 =?iso-8859-1?Q?zxVqyk4ozTHsm9t1agP/2xeFtos5d29l2Yn6klNvJyFZ5Top0vFgarq7bE?=
 =?iso-8859-1?Q?FDobCxRdEPM2LtPvrw8wabmiz2QUU3A5K9dPHd3etTzn1FwqnAuEEybIdU?=
 =?iso-8859-1?Q?PechBsNmw5JRZpy7+Iq9fQAbGm25qayMA87nZ2D6HfN0Wyrk2dCgYRcJOz?=
 =?iso-8859-1?Q?fUWEvwNXNFlZ/de6WzItnqIFPTcAh532PRkMKqttgQ9Ymd+jyz76Xp9TUX?=
 =?iso-8859-1?Q?YR1O8hFtjQ1uZpANKczlw5tXrcBbHQ33BfjZ64yJ4ewRhLVo+rTO2D1ygv?=
 =?iso-8859-1?Q?sjyOSNsWMrgaYVrZUJWbFVinVkVHoJgDE/LPrNSF/hMosThyEyvso+AvpK?=
 =?iso-8859-1?Q?Qp9AWWFQAywHvmpI2/0fUWtfGBT9S9iJVzF7Cex1mnEl4UOE7Q0VHF7por?=
 =?iso-8859-1?Q?jFVZKvuZC3UGfmA2tLcezG1frUDBQvRB4UfOvroCZXELlJtA/hDb/fDKHT?=
 =?iso-8859-1?Q?9q0/CjRU3quC7D5uJaFmuzhuHvb5HAOJy6kH5rYo4bf1fi6K/NjT8WRXcI?=
 =?iso-8859-1?Q?rXoA5kcW5gjuanMw69z0AyFgdJnhOSXjC58pRBFBrrOby4IvQlGazIvWFW?=
 =?iso-8859-1?Q?YALHBNhathORFE8/YW9nUrFMmOllzgnz+GhjHDQMACzVC78mzLtO5BvWe+?=
 =?iso-8859-1?Q?QsILF9EVsNlhg+e5A+C2stdygAJs2hFt2ALCh+7myOZmZn7aKinzwCxRKf?=
 =?iso-8859-1?Q?gL5M6ruI0VRfIg5cMgpGUagvQBwh8sF7otxKZD0ihnh0NDo32ZBuYHWdmL?=
 =?iso-8859-1?Q?eJELGjTkJ9t3FcDq64HepUiygibgl4B7oPUVk80ErrOCFi2g5wAdNzAh/e?=
 =?iso-8859-1?Q?dFtyqiP3aEPmwAS4/avo7o4jxCmOgItzX1a6ipyzMMHGKE912D0m+dJkhT?=
 =?iso-8859-1?Q?0EqlzfbKnNSnB5YH5w09We9eWPcFD5BEi11AmGrSlOwh9wlNlaRDXxtLi9?=
 =?iso-8859-1?Q?nhFPK29G9/qOMO2kQ77f/dNhugnQqmOwoWJgA3IgmgLyARwe2SqkFg6i70?=
 =?iso-8859-1?Q?QkvvglOQhbrhU3Dp2ScP4W2XfSdX1SGIwbZ7x1hW6maZLsVArRQI38+gw6?=
 =?iso-8859-1?Q?3WgwcNRWyFDe+m3+fnNuXsw0whoOXPru9cMzqZ7m3tsV4n5NQKKtNJ8C9i?=
 =?iso-8859-1?Q?mvIq1wyOrnSJiOJ/lJCi+yOcVJVy69qTxwW6e79ii6wFFiB8TXF+JQzEYC?=
 =?iso-8859-1?Q?J1l4vkdGJAri9p787NunoN+RskvOPa0qx2qJXbRihJvUunjEveMcSBkqAw?=
 =?iso-8859-1?Q?wtjcnSwT2QZvIjjU4HhsTvlYbp1IDyJmdOmOJO1fR/ZXTQPuYpnWCgO/px?=
 =?iso-8859-1?Q?YB7k92CdUUOIyol/1/AdS6xYVTVe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB7548.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?C2Fuyw1wDAFVGHNwhB+4M19VwmLfy6qKDyiJ7zkOAW1Lj7wVnN1eDpPnal?=
 =?iso-8859-1?Q?Ll6JBjnd455UUKoYh+sMtr2+8Q9b4oYFelOyqwv13RDL4f/CzrjYbb80yz?=
 =?iso-8859-1?Q?MSZ3GZFYhmfEPkEtEOBxjxs1Uyq2d/uKsJjb9jsSJU0vW0L+RqVHVllFYg?=
 =?iso-8859-1?Q?YClAd7RY5ZSFx9G+BcLwL50E9Tt5SAJaOhgiVN039s7OwEvnf2iIbMRZpR?=
 =?iso-8859-1?Q?9ZzWCA0MtNneuXQ0RAel2Fqn7+t8p8leVuFAk7NT6FXct8XYeUSmWBnjBa?=
 =?iso-8859-1?Q?C2vZK6iKNsPCV6yuoSqdP17BE6YKdgt6DuCInicYDEWfwKd9EoqJrGNam8?=
 =?iso-8859-1?Q?zj1o+Wj92kNRMAtnKeat2TRBEOX+/BoRABuGi8H6h3w8keJaYpTTvTf7wU?=
 =?iso-8859-1?Q?HnPqXB/+63k5jfnwzRgAkGP5Bk6vDdf50JwEd4VoGrHJadO7+GYM0BgVXK?=
 =?iso-8859-1?Q?Qc1MR4DrJAeMXezBzIKiR9Z2uue6jaXtEYQtqofDXksME48pSdNEcpB8Cj?=
 =?iso-8859-1?Q?K5Y8pwejAne/jcGcAZcCD9x8ooZG+zmS+vH1BN8lm1nbHfe2hG3nfSZ8rT?=
 =?iso-8859-1?Q?70b/K1ZnhlSSiE+6kU9yZqT+8qanGXOd3eyL+ShTYW4Li67GBVfTrgPhZ/?=
 =?iso-8859-1?Q?uW7p22kQ19FqK6UpsjXdSBZUytKClqRLjh3Om1RiIzOOpkJaobFJFZfBJE?=
 =?iso-8859-1?Q?9XqSCk7/Nv0hApAYpXhZ/7I3yrHeAcWCnjSBGC6RpoBTquMohExYyT8lVs?=
 =?iso-8859-1?Q?H3ucXBtWDVH4A+Y4iZV1fmEDOW+GMNXgd+8qC2SKBzw/6+ipu4mLzHvuSC?=
 =?iso-8859-1?Q?bftDHB5Yy43uZno6P0iAnHlqky8SxF5HSoom3ubKWwShsWA+j6At3vNDjf?=
 =?iso-8859-1?Q?ygKZeWPCQf3aOEuh4larY0OiXp4XFJfVO0b5lt4Ag99ffdF+xWoLu3cMtk?=
 =?iso-8859-1?Q?siPpQm6h4jOWtPhkcaXAv658KSynqVoALbdeGg/YjTufcHITvdwVt2WDFI?=
 =?iso-8859-1?Q?+LNGbMLKYYM7AEYcPYyhKzhajHr8EQzjv8DP6m6FoXKwkX8cgFZKEjjggr?=
 =?iso-8859-1?Q?hqP4c8Ea3IDqqeaQK1iVNICSr+I1ZTw5H/TAq1taxzbrUREAkzbFjRHuog?=
 =?iso-8859-1?Q?dFfoMTF/uk0NZ8GDa2UB2NqLx6/8+MXEStqP5uoyjgLO3t0nlP0bNE6LPi?=
 =?iso-8859-1?Q?DpfuKalDU1hezohi0FRYsX8kdcDDkcAg9AiderSq1kC/eFJiwhUUmeWL+Z?=
 =?iso-8859-1?Q?SnV0L2XT8F97Y6wlZY9lWonKHU1CJ14NLAYdWhUxTacad2Rtjb07vMygqJ?=
 =?iso-8859-1?Q?Z5/KclW4G/ET+sGGeAOMB4zVHjJK4a6AZWY197dL35Ik0SnEujAgDRuwEv?=
 =?iso-8859-1?Q?6aYZ6mi0bXVBrGZxtFHkAXYEnExq8Ist3cIoV+eiSwJqC4sPe0AUocv+Tc?=
 =?iso-8859-1?Q?Vbqlkn4jfyN1IJXjR6xji75jG014nC/mj3GapF4gfi3xoOEwNisjRdgusl?=
 =?iso-8859-1?Q?xNUYznLNZ55REfKWNKFhTcXbNwnCKQ2/iU6Z0tjuY44MXNRWHo2dSQbcSa?=
 =?iso-8859-1?Q?vtgHGK9m4ScCJNw/G+LvzowocL5lPtiaTAjH0swYPomFBQ/FXdDhNOx4oM?=
 =?iso-8859-1?Q?MKgIXaq0UTyPuHrT17iMehugaPjTqHImO8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7548.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590df93e-1cb4-45a0-8405-08de001ff9f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 12:50:47.0781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBDuHJ8NLMxMpbZjS1Fc12K6RMJxkkH97VFXIsxHTAcr6yN20E9FCnDr1Mmd0otrii+ETfNbp3zRPZWTGo/N4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471
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



> -----Original Message-----
> From: Leon Romanovsky <leon@kernel.org>
> Sent: 30 September 2025 10:01
> To: Alex Williamson <alex.williamson@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>; Andrew Morton <akpm@linux-
> foundation.org>; Bjorn Helgaas <bhelgaas@google.com>; Christian K=F6nig
> <christian.koenig@amd.com>; dri-devel@lists.freedesktop.org;
> iommu@lists.linux.dev; Jens Axboe <axboe@kernel.dk>; Joerg Roedel
> <joro@8bytes.org>; kvm@vger.kernel.org; linaro-mm-sig@lists.linaro.org;
> linux-block@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> media@vger.kernel.org; linux-mm@kvack.org; linux-pci@vger.kernel.org;
> Logan Gunthorpe <logang@deltatee.com>; Marek Szyprowski
> <m.szyprowski@samsung.com>; Robin Murphy <robin.murphy@arm.com>;
> Sumit Semwal <sumit.semwal@linaro.org>; Vivek Kasireddy
> <vivek.kasireddy@intel.com>; Will Deacon <will@kernel.org>
> Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for
> MMIO regions
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Mon, Sep 29, 2025 at 03:17:49PM -0600, Alex Williamson wrote:
> > On Sun, 28 Sep 2025 17:50:20 +0300
> > Leon Romanovsky <leon@kernel.org> wrote:
> > > +static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
> > > +                            struct vfio_device_feature_dma_buf *dma_=
buf,
> > > +                            struct vfio_region_dma_range *dma_ranges=
,
> > > +                            struct p2pdma_provider **provider)
> > > +{
> > > +   struct pci_dev *pdev =3D vdev->pdev;
> > > +   u32 bar =3D dma_buf->region_index;
> > > +   resource_size_t bar_size;
> > > +   u64 sum;
> > > +   int i;
> > > +
> > > +   if (dma_buf->flags)
> > > +           return -EINVAL;
> > > +   /*
> > > +    * For PCI the region_index is the BAR number like  everything el=
se.
> > > +    */
> > > +   if (bar >=3D VFIO_PCI_ROM_REGION_INDEX)
> > > +           return -ENODEV;
> > > +
> > > +   *provider =3D pcim_p2pdma_provider(pdev, bar);
> > > +   if (!provider)
> >
> > This needs to be IS_ERR_OR_NULL() or the function needs to settle on a
> > consistent error return value regardless of CONFIG_PCI_P2PDMA.
>=20
> pcim_p2pdma_provider() doesn't return errors after split to _init() and _=
get().
> The more accurate check needs to be if (!*provider) and not what is writt=
en.
>=20
> >
> > > +           return -EINVAL;
> > > +
> > > +   bar_size =3D pci_resource_len(pdev, bar);
> >
> > We get to this feature via vfio_pci_core_ioctl_feature(), which is used
> > by several variant drivers, some of which mangle the BAR size exposed
> > to the user, ex. hisi_acc.  I'm afraid this might actually be giving
> > dmabuf access to a portion of the BAR that isn't exposed otherwise.
>=20
> Doe you mean that part?
>=20
>   1185 static int hisi_acc_vf_qm_init(struct hisi_acc_vf_core_device
> *hisi_acc_vdev)
>   1186 {
> ...
>   1204          * Also the HiSilicon ACC VF devices supported by this dri=
ver on
>   1205          * HiSilicon hardware platforms are integrated end point d=
evices
>   1206          * and the platform lacks the capability to perform any PC=
Ie P2P
>   1207          * between these devices.
>   1208          */
>   1209
>   1210         vf_qm->io_base =3D
>   1211                 ioremap(pci_resource_start(vf_dev,
> VFIO_PCI_BAR2_REGION_INDEX),
>   1212                         pci_resource_len(vf_dev,
> VFIO_PCI_BAR2_REGION_INDEX));
>   1213         if (!vf_qm->io_base)
>   1214                 return -EIO;
>   1215

This is where hisi_acc reports a different BAR size as it tries to hide
the migration control region from Guest access.

static long hisi_acc_vfio_pci_ioctl(struct vfio_device *core_vdev, unsigned=
 int cmd,
				    unsigned long arg)
{
	...
		if (info.index =3D=3D VFIO_PCI_BAR2_REGION_INDEX) {
			info.offset =3D VFIO_PCI_INDEX_TO_OFFSET(info.index);

			/*
			 * ACC VF dev BAR2 region consists of both functional
			 * register space and migration control register space.
			 * Report only the functional region to Guest.
			 */
			info.size =3D pci_resource_len(pdev, info.index) / 2;

			info.flags =3D VFIO_REGION_INFO_FLAG_READ |
					VFIO_REGION_INFO_FLAG_WRITE |
					VFIO_REGION_INFO_FLAG_MMAP;

			return copy_to_user((void __user *)arg, &info, minsz) ?
					    -EFAULT : 0;
		}
	}
	return vfio_pci_core_ioctl(core_vdev, cmd, arg);
}

> According to the comment, it doesn't support p2p and in any case we will
> fail that platform in vfio_pci_dma_buf_attach() by taking "default" case:

Yes. No P2P for this device. But variant drivers can override size exposed =
to
userspace like this one.

Thanks,
Shameer=20

