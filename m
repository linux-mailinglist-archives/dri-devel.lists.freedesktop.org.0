Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6776A7100E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 06:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CA910E0E2;
	Wed, 26 Mar 2025 05:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeBheI7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D957410E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 05:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742966102; x=1774502102;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rXO7sx8SjcXIITtM8BJZnM+hjc3dkFzrLLeUQDz2pt8=;
 b=OeBheI7KBH532UbYujBdsSSW5us/HoBaJTQ/HuQrqJJDPUSNUYQeDPxy
 dkeMC4R9rFSBUXJk+MhV56cvXmQWjPXxaWB12FzKPMUM9wyjpDRWIpHW+
 uWkfTXk2/hvogD9sy8caMgeoxk11P7LtLydhUMTXmhfJ8lIjsxWmYb8mJ
 X1e7fiDziCq74hxSeS/L4mvy0UKlHcqwpdKcXbvsZ3kmc1yTFsQWTst1d
 zp/E7tyZonIMPujGpZls20XoZrI2Pd15t5OcstI2SLEdugX3NXZoAci/k
 Pfdxr96mUS1mDqPYKJm9AaWIMEHIbygZ+TdYtuuEkxx4/mfmNea5GfBNH g==;
X-CSE-ConnectionGUID: fsoEGMgrSceFbq9kgP4vAQ==
X-CSE-MsgGUID: 8JFmuKoZTha/zaRpV21dcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44399378"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44399378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:15:02 -0700
X-CSE-ConnectionGUID: 4KLDf3qURC2Cz8NVItMu4g==
X-CSE-MsgGUID: 8AJNh0boTsa4isNhaDiO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129662849"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:15:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 22:15:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 22:15:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 22:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQi101Xx9cNls6OebaCRqOHA/oLfHpsgT9fvEURVpPZCyFDxqADhDLzbEPnb49nvqQ6qLnYhg1AiBEci6B0LX01yWPjINYHmhD+fzEjwFrCgUpGxGVRwFw4wKlG7OFCLJQd/dN4YHrEQwFQDpY5R4+MCgHOXpUZcnkjtTsMfYxw58BHr9TwqOHIQIMjdfesKh9zk6Mpvq5ZGl6j6FITKpV17GtIt7dFtL2p246ZK6D3qwydf44QuxyMIbyKdkYzU0kjacS2WpRfMXSw26/6lxBrSVdGfRYtG4HGLhtKUavhNJN38sy/Ow3fCZZdWsbdwuCtS3jYaJB4EC3syfRxiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPELpb8gsI8Fjol+D0Xns89HNHhYvEZ6VLFx4r2UG+E=;
 b=Uraff2V0pRTY/HNPErBMDiEHFhRv3rWjY0O2K30BQ1ZuASrYkoxj/prR7HZ3YVGaGXSrjPPD3L+ewHOq/8vRAkwSTnfSHCpPtJaVZiCrQdS37QGsLZ1TI5rJy5/oEJRcM/WoyP8DOQS2X0NBZ3m3T/2Q6CTCATEr6OHHhOhEofyUG2CBFEO2CVayV3SIho2puNatfij7fVirhXsjZ2D7hEmAqzVbzh6ahNukIUNPLKageYQp0QGH70PFXtXt8/zGhoMJorFgRg/GbvI973+B1pHBitxnfJTOWfujrxii4EHIcMXLY9H/sJcQy6IbtAnUtLDwrs72+oXX3Q4DQHadtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 05:14:53 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 05:14:53 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error
 path of prepare_fb()
Thread-Topic: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error
 path of prepare_fb()
Thread-Index: AQHbnfGBeSAw8gFsy0Sck8QBafnwF7OE3R3A
Date: Wed, 26 Mar 2025 05:14:53 +0000
Message-ID: <IA0PR11MB7185345D3DFA8C7900059144F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250326014902.379339-1-dmitry.osipenko@collabora.com>
 <20250326014902.379339-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20250326014902.379339-2-dmitry.osipenko@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB6043:EE_
x-ms-office365-filtering-correlation-id: f255ba21-c52c-4217-14f7-08dd6c252481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Sr5q427PY6bkZMSPk2DWg+2bOmUIOfChLS1Yw/1174+yZ3l/PToaQNTF9TtZ?=
 =?us-ascii?Q?N3vmMa1DONwynwjPZpvv4eZ4etpxKX7rrqnWNTeNOkXi+GYTa2BS3HGlpLai?=
 =?us-ascii?Q?jIzelIGmT+xrjVhk7GdiayOng9ua8bHawxSwDPy56hFyT3aIbuXqzEmYhq24?=
 =?us-ascii?Q?KXLg8d+oiA+eRi6zHlJLL4n+9eZDktNV+aef8XA1BlnBA6DoJas2H7QOW10M?=
 =?us-ascii?Q?ylbEQJHfKuMo4svUPmF5CKIImrTwDofeCfEC0oZLhoLnmDq+96mnEdPhN0cI?=
 =?us-ascii?Q?eupXBQsjg+JCd479f2C5RMDDMeFgJaJscJosfBAx/XNy6xBF9azyO9BP4qjL?=
 =?us-ascii?Q?MBbEvA+uT9iP3xLpSxpTS6earc5wKuvt7LjtYf3wOm3faxSeOsvwbWQexq3H?=
 =?us-ascii?Q?Vdh8voLX8hXH9XTy1XYMbLIQs8evan575rQHynVhbEeYYJDohsTH4ZXhfjtR?=
 =?us-ascii?Q?vaFGMYsZ8M2pi1UjQXq85qVRAmagm0lJP6bTL06NKwkcw7D9scHy9mnhaAtC?=
 =?us-ascii?Q?hrFZDxGgF2IoTYesx7qYfPax4nfwg/1kgMsNfNQcWBZRhPUlaTe4hvOXXr+s?=
 =?us-ascii?Q?PZHrH/TgdbDtSOWOQbN0+vO09YFpFXPrQJocPKSNZ71a/LP4Q8rgX4hcBFlc?=
 =?us-ascii?Q?KkYIoOHFq21XMtLNFKJbjh6Nu++nGy3qxyC3QmX4IcxQscTRmQlWOVSkHb9k?=
 =?us-ascii?Q?NFUK+fnTGdf5JISdUcWOd615NuAzG0zsZltf9ZAHqfbE8L7r2/1mOxQoMfPi?=
 =?us-ascii?Q?qWOwnUmPKOnf8c4A/7Xvfsqx79B/h0Gkbjl5A4TZNAVCmGJWL5zSmWmxXoK7?=
 =?us-ascii?Q?njALug7DrLhsyyG42TB+ZjPqKf+S/BeEcfbyy9v2IP+5RFFXQXyCZhxN1iMG?=
 =?us-ascii?Q?5fpe0q5Y8436SkO1qp/7A1kr9uu81I8HD0JmIRu3h9qO0FJ311j73pI7CnsM?=
 =?us-ascii?Q?o0arUCeFLIWpxVa6fFIIa6G/TUDR71v/jdVkzB7sirR/iQFaLWrCB5E5Y+3E?=
 =?us-ascii?Q?XujK5cQ47rMF0ydzi0fzYUlUUPc+cy3w29IvB5fGYPXJfNf/EvGSDnGm2iUX?=
 =?us-ascii?Q?jFX6N0gFsqEFbVwGrDwiVU4rv5oLuR1oef6qjAoFQI1F2rm+Z/QD64ss2+LO?=
 =?us-ascii?Q?IZSbifu4s3/XeMXRvbDk2X7BugDAWVKHoHUY1Txf6Q6x4tJ1LMJgZ7XHWqcg?=
 =?us-ascii?Q?6PdotPY/mxAJhMOfDNQhqjidB++H3y0QEIw5Wqhn+jXB5is3OXFCEOjeAHiy?=
 =?us-ascii?Q?L22VSZbhOD0EdXz6gqXllQKDHN+VPeQugj2a/NuV1I6m+lo/ON7c4QCxBw8F?=
 =?us-ascii?Q?uCZYMf+KCybKGiLZiGjcKkLTeT0/MJDSdSMR/+YrHRDn1m2UoawxE/HcP7Vq?=
 =?us-ascii?Q?tOlLkJWVBsJsM2DpJSBXY9jqKPS7ErBIyfpGldXuUJ86RuxrWmvE2kotIoPB?=
 =?us-ascii?Q?4xh/L6VBcnN0nWyWmuIfCh2HdxuIAf13?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XgEzh6AjRiou0uf4NRjfuJkTH7fwLs8i82urxBViETle3AOazEdtQfoCdYAY?=
 =?us-ascii?Q?6vou+5a/D6FpTmr+EuxDmdE3W0sqElM9Fwvgjkj+u16tzlvyOXZl8OfHVt21?=
 =?us-ascii?Q?jtO3rMu0Xx7vmXcIwi5AuOvRUZ4SZk9teKx3Nc063MNjKivZJB/H2iPb5dH/?=
 =?us-ascii?Q?MxOtWlwWPFcXUffv0d5U+fQqd8GS2JUkL+RDMwI23OEdF+XWP1f3K+Hyz/6h?=
 =?us-ascii?Q?EiueirEUWb9sHLYwnmj7uY7+NHC7kyzHTJzE3ayiTrfC4kRmdbSavaPNseLh?=
 =?us-ascii?Q?lXvCs//HmfT9P5S8OuPgP7s/ZVtOnMPkoVC0NOhHeggYrP2irLRqyIbZGU36?=
 =?us-ascii?Q?CwnPk7Nn7LBLbS913Y8SEENz7s9MZ5MO9Ngwer5R6SADKqeoO6pCajbyO9UG?=
 =?us-ascii?Q?yi6/a5/GRefAFmlethCFr6Rj8UZkYIBcotauAclOVlBUkjlIEIX6VAL3XwFr?=
 =?us-ascii?Q?o0qUhys7AGyMlKARyUeodFc3fAEShxIOUAP2dW9e9/3H89BCmyI9dpVG+52t?=
 =?us-ascii?Q?HlfEKt7sV3zA7L4kpStLNyYoyVRaW2Q1TB6d9wwR3HqJK7thCbx4aEACncjP?=
 =?us-ascii?Q?fv/MlLpn8w8D6OCe78HxyaKL4GR7JLka9qeoJGOGHsYkw779IRjQqWi9Fh+Q?=
 =?us-ascii?Q?zEa9jGMcUvdqOJ4FS+anWg4lvS8UPf5Wf4ieiNJK4gJuzp6+DO13XXzxcztV?=
 =?us-ascii?Q?xdXF6tS7MKpk+pSVarZ1xTzl6wQgJ7ntDwgc5HXLcCVfwSezchkpP5wnYqP1?=
 =?us-ascii?Q?5cR9rWt32rak/p3AdkqusyRzfS33atf8j6X8rV+MZOxvnCZ/0V0XrrzqeI+u?=
 =?us-ascii?Q?oQKhXBAKlVwU2xMK0ktZEy4LZdStBa4B8CtuMMAHU8M1ziazUggkeHpafERm?=
 =?us-ascii?Q?bCg+2z0DqZNwAn5wo9qrToW00Ok5eMBCb4J71tciTqbtSCH9/Yoe6jHXstng?=
 =?us-ascii?Q?E6xk3ZGybYXqGoreKF4BRGSZ5fkaesz99XV6un0gWuvDR01ZiLBcdHiU5g3c?=
 =?us-ascii?Q?ojVP0VBruwdNRNRxt8qfT7aq6ZaTndULHygiCc28G5kQ68gz62Oz/NEwU2kp?=
 =?us-ascii?Q?gPH+0vQzVc3SyowlVB3Vw2qezd68yRaoULG6OxiS3DzCeObdr5zEjUFdqeNf?=
 =?us-ascii?Q?JVRO9e9SzDKcSFKAzfIb80HDj0G7K1vWSRTpV8Rso6Ccgk/MRz+3rN0r/LZD?=
 =?us-ascii?Q?4yftKiZugCxbjXQgyZFwOz7xDTVEr3RHBDzQ6Pnpw7CPgGAG8Y3BkCaf37IW?=
 =?us-ascii?Q?BSz5zEh0HlGy/D7iwBoSvEG+o57DB8f2nsexErdzUlQ2FgKyv0fHMVduoxMl?=
 =?us-ascii?Q?lp1lCDMn68AQk5hR17bUjNmzMBuVB82k2yvZYNNFsVPXDp0OI0bUyXPZ0not?=
 =?us-ascii?Q?Y6NIoWGz5KJH8CHzHwgZjnzvDRXQzJka17hdQcK5AWeF7iYPcOeqW5G4GGQb?=
 =?us-ascii?Q?juOfUwWPaRBF5+NkxEFOLn6slipnWdpzNGQAXgT6Wvq0HWJ6rYMZPOA7EMwh?=
 =?us-ascii?Q?ERcJGVguZ4O/H0SABJdPZUQ7icFkRdM3BXqwm6s+PE8A7J6hyPmbrT94dobP?=
 =?us-ascii?Q?dko72irjtRtW6TT/sIES+QRa+4Qjb60EoayanbRC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f255ba21-c52c-4217-14f7-08dd6c252481
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 05:14:53.7916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Le0qwBRNJ1Mbt2dupwi7F3nZNoXOYg/KEFl8oRghSVptVRic3NFKMJC1Zmupj4h4kUTQ50PxmsxQde0B570LhHmuL9mTu8ZXida2sffzsi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
X-OriginatorOrg: intel.com
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

Hi Dmitry,

> Subject: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error =
path
> of prepare_fb()
>=20
> Unpin imported dmabuf on fence allocation failure in prepare_fb().
>=20
> Fixes: 4a696a2ee646 ("drm/virtio: Add prepare and cleanup routines for
> imported dmabuf obj")
> Cc: <stable@vger.kernel.org> # v6.14+
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
> b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a6f5a78f436a..dc1d91639931 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -342,6 +342,16 @@ static int virtio_gpu_prepare_imported_obj(struct
> drm_plane *plane,
>  	return ret;
>  }
>=20
> +static void virtio_gpu_cleanup_imported_obj(struct drm_gem_object *obj)
> +{
> +	struct dma_buf_attachment *attach =3D obj->import_attach;
> +	struct dma_resv *resv =3D attach->dmabuf->resv;
> +
> +	dma_resv_lock(resv, NULL);
> +	dma_buf_unpin(attach);
> +	dma_resv_unlock(resv);
> +}
> +
>  static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>  				       struct drm_plane_state *new_state)
>  {
> @@ -376,23 +386,16 @@ static int virtio_gpu_plane_prepare_fb(struct
> drm_plane *plane,
>  		vgplane_st->fence =3D virtio_gpu_fence_alloc(vgdev,
>  						     vgdev->fence_drv.context,
>  						     0);
> -		if (!vgplane_st->fence)
> +		if (!vgplane_st->fence) {
> +			if (obj->import_attach)
> +				virtio_gpu_cleanup_imported_obj(obj);
I think checking for fence allocation failure before import would be much b=
etter.
In other words, cleaning up the fence in case of any import errors would be
much simpler IMO.

Regardless,
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>=20

>  			return -ENOMEM;
> +		}
>  	}
>=20
>  	return 0;
>  }
>=20
> -static void virtio_gpu_cleanup_imported_obj(struct drm_gem_object *obj)
> -{
> -	struct dma_buf_attachment *attach =3D obj->import_attach;
> -	struct dma_resv *resv =3D attach->dmabuf->resv;
> -
> -	dma_resv_lock(resv, NULL);
> -	dma_buf_unpin(attach);
> -	dma_resv_unlock(resv);
> -}
> -
>  static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
>  					struct drm_plane_state *state)
>  {
> --
> 2.49.0
>=20

