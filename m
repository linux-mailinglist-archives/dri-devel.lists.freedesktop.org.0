Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4918B82D79
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 06:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354B10E32A;
	Thu, 18 Sep 2025 04:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="m7x2ofdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn19010001.outbound.protection.outlook.com [52.103.12.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B2E10E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 04:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAv7REFzEumf41QIgR2dIWoASoE6hDdBN0plt/KENroPGw9NNMPRBW9wjj4DnFJJbhON+GJJVfT0VrnHm/+UCHlPvVK6dq7gXKgBg4yIddgoXaFGh+6xSFmbGzw2auD9XyDXJW+t9yxPI40HMCVBCpFDJ6h0pAKFiNFLIrkT+TJvsG5v0tM5a6HnWzbNG4ewnzRO8XKqSCE0qAsr1GkOu+dD5Ec9IhdvpqoUu6ImXx9En2qT9RuBgPqVq/fR4pCSYIfVwk5xbgwYt1+nDn15R75UFpfI7JkN7Q7+5vTQWIAB0mn4smTL+oOw6JrdyC/3CQF7u0nigW4cMzlpwbYOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNN5GHSDwlL8apWvClKarVD1Hh3r9Y/eaw0hPn1SWYM=;
 b=jmODkiJxwVQhs/ivZNZ/ledgkrAzSKAEV27+1nlMeqFDB39n96vgWnU6xnWhNBI3DE2tQNbkrKcVtqZig5Of+vp9w7QzaeEEDEJ8Pite2JF+fiQ5oUxhz0Uzc/qNUtMZdorGSKcLpAM+YKswXJtvgthGpu2svL4KpLGw5IK0JOYL3gSV7fXEbwcbrK5e37jFuod88SiEh42rTCgGxwyWYde21JJQEkvx4KPyxbFva09NppnkNVYjDyHZINVsftoQFCHfGBFeAESqXaNdYcspA9m75Pxoh8MdjB1cXKI+8grjq9SNS1zCQvblJQvIQRTN3Gd3OhH8Ryvj2kgJWE9i8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNN5GHSDwlL8apWvClKarVD1Hh3r9Y/eaw0hPn1SWYM=;
 b=m7x2ofdXZ4B/v83IPbMlmAXj8oJbUQFWm7nr/vBHYaDU+ssfEz45bP9HjYdrhjy3mH+e28yAafuSmhDtYBE+WF8e2bxp8MM79RTFxtYe02VShABKBLPAh2DgDaztr2riavW4nICZslznGUGDszwnqffa34sltPhvfhuxDEBL5qgD+NwVwmRBwmG/1QmS4FdDZWxAGUeF6r9TRtMytudV8xvVJxkDLm27C+k3vd702PAeTeBIj4TCadSSZIoxcOfvqe5lthCL6553U9G1frNJPUc8+0k4Ra7UCYJnCdCyMF3GSRw6Cr6VOF08ZLGW2V9u3FQptaJzHx6zmvAUUIhcBw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB6694.namprd02.prod.outlook.com (2603:10b6:610:ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 04:01:17 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:01:17 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "gonzalo.silvalde@gmail.com" <gonzalo.silvalde@gmail.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "decui@microsoft.com" <decui@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "deller@gmx.de" <deller@gmx.de>, "kys@microsoft.com"
 <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>
Subject: RE: [PATCH 1/2] fbdev/hyperv_fb: deprecate this in favor of Hyper-V
 DRM driver
Thread-Topic: [PATCH 1/2] fbdev/hyperv_fb: deprecate this in favor of Hyper-V
 DRM driver
Thread-Index: AQHcJ9vT0RegmSIBJEaPQCJrgxuISLSYUdcA
Date: Thu, 18 Sep 2025 04:01:17 +0000
Message-ID: <SN6PR02MB4157B55FBE271DB1B75F8FBCD416A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <E5C2A201B1BD>
 <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
In-Reply-To: <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB6694:EE_
x-ms-office365-filtering-correlation-id: 240c243f-1bb8-4e8d-adc4-08ddf66804e3
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599012|8060799015|13091999003|19110799012|31061999003|461199028|41001999006|15080799012|51005399003|40105399003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?+bt/nTgk/vLwsly1A/R98TFq285vOLU9mZKLYlXRfix3Y6naIDPT64ygCn82?=
 =?us-ascii?Q?C0YAQ0RpUxq57S03SMbzQV+V2CwTlHBSjSgD/5Lz4SYqeVZRAOwzj4h9/Gde?=
 =?us-ascii?Q?s1mZ3m+Q6T/8mzipCtvKyiQoFodg9FubVql+cPh2m1SNB92elflRyvwN1Kix?=
 =?us-ascii?Q?O3eX1nXffaFiCoqdJTEmlhweEGi+gDqnpJdeM4MzcG14RGPplB5cY8M6qXeY?=
 =?us-ascii?Q?H6BS4P9AdIlRSMWoBu9k5cNi/WBV96hVPYVXXkaYvM2dohOp+k8T27ygCtk9?=
 =?us-ascii?Q?PnIFKQimOXzQZcvt4oOaD3gGIYHuh0upv+atd6JcvKx3Bf2MsOFAowh4UE6r?=
 =?us-ascii?Q?X6uwRw16stXRhoNbnnLnnHd5s43Rxz1xlH8PUq3oKsD0MGSTYaQrfXtk0xvw?=
 =?us-ascii?Q?wk3HvuuGF3BRblKfQuhPSAhqYg6lXQJclKBEhmtKtCt7fqEEbLWHof7n83PO?=
 =?us-ascii?Q?gWVxfII6hfbmH0Y00fiz/UeYV5KH5lagDBfkdBTjiSKea5j8sML+zPfDPOIB?=
 =?us-ascii?Q?boVhs/XlYKe6XrqMeleCvwVIJBfhiOJXfOeJBquk8vkA81TJ49tYPGU8L6YR?=
 =?us-ascii?Q?NBlXYMXFlrYamgjili6cVbdpckAjijwO5FQrH3ZQM0vSkq8cnZwTy+hL6Gg7?=
 =?us-ascii?Q?0NTrOgQ+M7DHLBX1oe9JHFgqMa00MEjjQlSDiM6VHfDWdheGM+2sBMpDCjjS?=
 =?us-ascii?Q?jSQOz2T+G6GACDH0tbXZljXv+6BNF9AAmQC/fCmWDd9PU70AyWbWHpXD/Ng7?=
 =?us-ascii?Q?0ooKRQ7NAcY3jxFidB0IEYxYtkXf8PMnxsCg9nPeoqX0NHfGQ0gyAW4+LgFQ?=
 =?us-ascii?Q?nMKfxkVuK/8KigjO+o6uHcHXkgK0Wmds9sexNNmeeya+zv5/TMBaKz9LGdA/?=
 =?us-ascii?Q?BoqGZfv5KdAP/f7ZVe5lI+f0F/6McIcXDWmKxvR/MoywY64ZF/8LSsAOlPQu?=
 =?us-ascii?Q?IejjupirQBoXgYRm0/8z2RPDhVdY3IgSuFynJ5gIVemdtXvknQALBCWizFAY?=
 =?us-ascii?Q?epVj8QsAl4mOyDTXCrHrNmfKQ22odE8JgG9PA1tGi2hTa9fxzUpkp2crBH4I?=
 =?us-ascii?Q?9mwxWuChqq88zrqgQ5IPvGcM8ee43U3e7ai3qDNr0jyy7+LqzkQXgK/lcu/w?=
 =?us-ascii?Q?5RPMYZ2CydaLCv2rbdzrToWZii1qxPafenrq9aio+eSyi1cRly6cMtJNoZw2?=
 =?us-ascii?Q?EOvebRVqEPUua3CAhpugkMq1rmoRLly04NoRrU13j5J1iIM1RKdcZ5vT4r1d?=
 =?us-ascii?Q?57t6oaxrrMisJFrrSIO7?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?883Av1pWrKxXRwuuiUaVufvuJkHuYUGZxKYOUJHW7XFb5uCTejyYC16012n7?=
 =?us-ascii?Q?iQGjd7iocsRp+AKbjc791kJwtUFuxyvxv51P11Z3lvWL55vm8XrDbLIbwYta?=
 =?us-ascii?Q?9ppC3qLgPxQo4yWzqnXqSO4xj4uVgotwCojyHxQCGfUlZWT2pXGOcnPClHTt?=
 =?us-ascii?Q?Zn6sxNTkM4jYLxiQJZRB9ZxFLx/SChMHlsfOoGfWUKP1hKG/x1fGPFt2ayzY?=
 =?us-ascii?Q?XwwjVqPEBcbD96dB7UhXDgn5xxEjqQrOg8s0fMC5HSuMrPo7XupSl97DzLnM?=
 =?us-ascii?Q?O3EG6vRb6VVtCCeMfRXDf8yFwawwswNum9YaP6elHkoT1nccnpeprtR0Zwde?=
 =?us-ascii?Q?xBpRQHmlk4+rul6H3TfgGnkRQzlrEXdYXBW15A4hmyB32Dcl/tyXOftABRez?=
 =?us-ascii?Q?Euab1XP1oHOnE4n7UzFgPHJ5XYR/As7PTWHGtd4TKQU/bNxKgufuppAKxZG1?=
 =?us-ascii?Q?KeSdmdC+vuo9gY/ENR3hGxePBU11grxVe9oD6OcnumTFBHr9OO24flSfYjEr?=
 =?us-ascii?Q?/+yQvdonOYf8GwRXSQDZcLqsENwf4bMUGFhwVzi2pceH7cZnC5r1qyaQ8Y5D?=
 =?us-ascii?Q?Uyi8iJXMTpEatZIPBieTFTRC9yHeVBMswreJOQvjNELvpnJS/uw/dmAtYnGq?=
 =?us-ascii?Q?gYxtKRwMgfIzT+4mBRlOnh4OlMe0OIFnqK4Ik8CZZ6RiQTK0Wx8KsD9Tbw91?=
 =?us-ascii?Q?9RoTueGnDpVRLAO+p7AvsJmxkg+MFvZS5UQN8uYc4iCzDVuagtj0UhDtNQwd?=
 =?us-ascii?Q?tioaMpdVNDLtN3nelDQHRkBidvxZcyt3KyyjA7LFy9q6zVy2Ip5VSXHxI3XR?=
 =?us-ascii?Q?QjtboSjSxCcvWAcy4oTB/xyDtPmFfV3/6ybPYxodUkkeNmhpMJ11IFgtVvvn?=
 =?us-ascii?Q?o4Ssphf1a9w3e2/1bwIwxhQUxHBeQq9Rz0GJD4MNzTe04QJ6pUnRuL2xZUw4?=
 =?us-ascii?Q?3yWaChuT9ofqNVSei1EEdU9AU+Eit5Vfgl/oofeDXRqO3J6UwoPxl3/zOa5y?=
 =?us-ascii?Q?Jwy//1XfKBEVFuaP21tpubHXyIl9ssZqesZAx8oFGkz23yrLlhYtvvrI5Ag4?=
 =?us-ascii?Q?s/AdjXXFJTXKMPTE2hb/4Hxg3xOlazQa5udWatUEiPxKTSI9YWi6lDbJyQmp?=
 =?us-ascii?Q?nIlvnT7Xhni/9TmcXAmljrsn4Dp6vSmNhQQV3j3PyzbXQGfM/5CdWfKskriM?=
 =?us-ascii?Q?pd1pRLSBGLjPLuvNL9JJfj6C4tWRxm/7j3uW/eQa1lsRRhdeG0/ZNITxsCU?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 240c243f-1bb8-4e8d-adc4-08ddf66804e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 04:01:17.5175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6694
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

From: Prasanna Kumar T S M <ptsm@linux.microsoft.com> Sent: Wednesday, Sept=
ember 17, 2025 7:03 AM
>=20
> The Hyper-V DRM driver is available since kernel version 5.14 and it
> provides full KMS support and fbdev emulation via the DRM fbdev helpers.
> Deprecate this driver in favor of Hyper-V DRM driver.
>=20
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/video/fbdev/Kconfig     | 5 ++++-
>  drivers/video/fbdev/hyperv_fb.c | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index c21484d15f0c..48c1c7417f6d 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1773,13 +1773,16 @@ config FB_BROADSHEET
>  	  a bridge adapter.
>=20
>  config FB_HYPERV
> -	tristate "Microsoft Hyper-V Synthetic Video support"
> +	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
>  	depends on FB && HYPERV
>  	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
>  	select FB_IOMEM_HELPERS_DEFERRED
>  	help
>  	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>=20
> +	  This driver is deprecated, please use the Hyper-V DRM driver at
> +	  drivers/gpu/drm/hyperv (CONFIG_DRM_HYPERV) instead.
> +
>  config FB_SIMPLE
>  	tristate "Simple framebuffer support"
>  	depends on FB
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 75338ffc703f..c99e2ea4b3de 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1357,6 +1357,8 @@ static int __init hvfb_drv_init(void)
>  {
>  	int ret;
>=20
> +	pr_warn("Deprecated: use Hyper-V DRM driver instead\n");
> +
>  	if (fb_modesetting_disabled("hyper_fb"))
>  		return -ENODEV;
>=20
> --
> 2.49.0

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

