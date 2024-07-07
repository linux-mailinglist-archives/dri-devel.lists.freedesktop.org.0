Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038192965D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 04:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEC810E004;
	Sun,  7 Jul 2024 02:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=LIVE.CA header.i=@LIVE.CA header.b="dzYJIfXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR05CU006.outbound.protection.outlook.com
 (mail-eastusazolkn19011010.outbound.protection.outlook.com [52.103.1.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F8710E004
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2024 02:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKmEtx0/2c+TBFtuLrzyEh79mk5eXVCW0cqpDWMzZS/ZJ23hMipl2SCUpFL75+lRq7aQP2BfKxmb91a1luHdATKO32px7RQf5m8JvCBZ664rBLKN5fcUap+f2uh0CWs9aHSnvvtBCxPJTY2tALQSlJC8EkdQZFQkYt+JS0xOM0paBSPdlK+YOTGlaFb4xcQDSytlwsjoBUok28Lxd5yKH1UINQN1Qg+FtM/kQcqpxb1rhsYs1ka73guoPklBjDr+pIu5XKoLTL2X7Fp64s+bASXgKKwrYtuZzr1T4kf/MqupUcK4PgaWCEb48Kxocoy2cMKLE9wpIWJs2rbrvSoShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWtWpCWhyoqX1TqGqoVgPKb6yvU3MuUN3NUUImDygKo=;
 b=julyS2uTcEEK2HxKaunp13pUMAhVX1rTTJPPFCQJu3gLEX7cVS/aE2lFeRW/ABCeUwvwNHZtS2wTKWtqVZXuKCIE4Ptrgts3FnRz7gAcoDhwa8jpmvhvEajbYH92wAT0KYfwlZ5XC7/SXeeNQPV7fxglg9SlyqX4Jzb21WHHpPRkYR8qHgpBkPvS/4H4VGmI++RIC74tz79K/CKJUhcecndhT4F1TnzAw0xqGiozAd+jT8cOXXZPubHkpmeNjF63rSwUYwHoJPdjjyY5yJEyXLis3CLVVmpKWrQddYYOhq+Z/xoTRJACUrXD/Nsd82HnULcZm9lEXHaekc/NY1IahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.CA; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWtWpCWhyoqX1TqGqoVgPKb6yvU3MuUN3NUUImDygKo=;
 b=dzYJIfXRthFdfPv9JRrvc9PaLTmgOauvjzTeO1oUTWZQ3n5lhffxoX2hXCTa7kvqriieVfRcED6QXzrwS1fuO0T3hP0ZNkqTWAsGOM1eDJQgO/SAdWDk3kD7MfQiPG7dU7I0UMyNNnlxRpiRPcSHf45cy8Al09mkVfMuuuFNvIXvEltylONbHhFkHyUABp5pSmaQofA+5nK5HE7AXQQBwzWKS3zS0FxQa1qBb+pNnQTBuNLaBBUkpB7WoQIsvWXH2Tacyp9/ASgREzKrZm+qdQ++qYxaUdak9au6wzYI3DwSwwhkeuqtlK8DxtytvCC3F8tVh9DL21qYv0ils8Tiag==
Received: from DM6PR02MB4283.namprd02.prod.outlook.com (2603:10b6:5:26::12) by
 PH7PR02MB8956.namprd02.prod.outlook.com (2603:10b6:510:1f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 02:13:26 +0000
Received: from DM6PR02MB4283.namprd02.prod.outlook.com
 ([fe80::881b:c465:e9da:daee]) by DM6PR02MB4283.namprd02.prod.outlook.com
 ([fe80::881b:c465:e9da:daee%4]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 02:13:26 +0000
From: Josh Simonot <JSimonot@live.ca>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: virtio_gpu_cmd_resource_flush
Thread-Topic: virtio_gpu_cmd_resource_flush
Thread-Index: AQHazMZcnNAp4heC1U+vtLtmW636ALHlCRMtgAOwx/CAAbKPAA==
Date: Sun, 7 Jul 2024 02:13:26 +0000
Message-ID: <DM6PR02MB428310A506FC551E3B6078CFC7D92@DM6PR02MB4283.namprd02.prod.outlook.com>
References: <DM6PR02MB4283EC97FB486C9E9357D3F0C7DC2@DM6PR02MB4283.namprd02.prod.outlook.com>
 <DM6PR02MB4283010B4A4CE521B1050042C7DD2@DM6PR02MB4283.namprd02.prod.outlook.com>
 <IA0PR11MB71856F2BCA9AD5EB8E01A129F8D82@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB71856F2BCA9AD5EB8E01A129F8D82@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [ExIvQ8yv4rOCUt3BucwLBoVcv2wZG8tW]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR02MB4283:EE_|PH7PR02MB8956:EE_
x-ms-office365-filtering-correlation-id: 0f9cc441-f033-4d3c-d623-08dc9e2a62f2
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8060799006|19110799003|102099032|440099028|3412199025|56899033;
x-microsoft-antispam-message-info: UO33p4qc2MEsnf/w7M2CDPly1uS/OHYH6xzIr8p4zc1hD5Vk5oR5ZZHEOJfiN406oX5XH+8et0i9ZWMxhH1L/d3fvquA8vVxzhXZvuiQrbP9pLkMu40UV034adb1MK/E5Yzf3uYZUNs2UAAFgVasoSgnJkEEZfoFBwsJz/qZWYixrPoffRSOG+iDTZFfPuhctbrPUiAUsJlUWvkKpoutdHOi5vMS/E7qKGMbiVjTatPmQO+lzFpDp8Fc1rxfwoa4Cxfx/TzkIWAAIrpyU+Qho8CmiCfaWauDLI0Y2ZtjJQT848UX0QCy5sJvPGt2RdBYQg3Le4LLE6urcavFGJ0yV8W1b3BiFzuwSQ6X21iFqTSsHJNUy2ZgQFKJx71W3lY8PmS+HOffXLc1+U9g4+icN6h0wzAG7UDIA/dS8dT0tbqlyzcnvMoCPOPdIyh3cDIthsZeNaXTvyXSsGPtzhhg+qTTVrKQDg+TtGdhYbAqrvt0WZoRE+iKeRhN9nly8sGgKXh7PFq2uq8K4+QLLGiI0fTM88/h0VQhQzppMU6KKSB6Iy5BT5VaIOsMhqvsTeZli1XVWoLp19E07Friaic7zbOk8utEnqP2GIZVnzgoKPb8ZoHCcAF85ElehKJ/HGpBkuqoqvRduMx+YHaiFOWSOQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YnXcjpQKKHUQ07sbUw++PUc6AP0WFITM3uk04LzvmHZui5OJTy4btSO+tM?=
 =?iso-8859-1?Q?L47anT6BIQbNvoCsycuRMYqwRhLtEL1LSShObdU3tKsuCoyLv0A/3D/sDt?=
 =?iso-8859-1?Q?MeQc1qvYF0nokd0AQGXqG74gnNKsVT79WsvmM37TKrvzWlCf6+BJiSNKHi?=
 =?iso-8859-1?Q?ppX5VVA7WYWXk+cUxMiRDD4Ue/LCjkVPf/V7QUz2urbei80NrC4+Bug/YF?=
 =?iso-8859-1?Q?5hcdzqhzcjCAHCNWiq1drdmCXFh4M6zyunSXZE/DNc7xBB01q+niCbiykP?=
 =?iso-8859-1?Q?1MGU7nDX7ybkzfyjqzPb54qZF+AKyEFpORgmNZPRpyJwDl2Ee26IztCjIJ?=
 =?iso-8859-1?Q?8us6NOWjJYkp5Yu4K+Yl1tnxe90ADUm75EqKLg3x5vGdWmJMjdCajeIbtj?=
 =?iso-8859-1?Q?zTzmtzEXVjTrOZtk9dLdgeJNVdkA96MS9w3bTPgwmDJ9JCEJMPS3aq1GNR?=
 =?iso-8859-1?Q?5s8dLsMW8SOAkaas3a4aYTfrtXOxefZ0Ujz/d4yhNIGkTs45VcdqAJTvfX?=
 =?iso-8859-1?Q?Ek3gDUUapuBkRWoLzzyhfxDURshW0/CQIsAi/xtluXhnB2pMEbpWLF2LLY?=
 =?iso-8859-1?Q?lepNzXiseLQdjSHffvFqQnoYbq+6F4Q+ah/DlmtfTSbfx9sZu4P60uleEO?=
 =?iso-8859-1?Q?Ov6lEvgKn1wX2GTCds11kiztvb1bs50mC/tPaKJovDHmcsgMrcsLUcQMN1?=
 =?iso-8859-1?Q?+EyMK4kkQHce4qohtxMRuwJbWDMcwG2pkGXZK6Z7UafSw6rO/1yBhEid4f?=
 =?iso-8859-1?Q?atcA4DtDkYCd1K4h05S0iNqirJrtICYczJ252gyXPfMB2dadzJCpD8WC45?=
 =?iso-8859-1?Q?FoI6XrBvWWEWkh6aX+5FhS5H4yGxviAtMyry6alzdA1Jp6dAEaLIeKS/pD?=
 =?iso-8859-1?Q?BGRGVgDpzUCCmhWqAB+lZBtg903Jy1PI8D4v1xTMh6Y5+ptf5bjhdktTZl?=
 =?iso-8859-1?Q?3DP3ScFZinVi5NwgVhmlfPChddRyW8Nj8qXpvhk2C9QDwolPTRpgz22/6R?=
 =?iso-8859-1?Q?gVPLgsd7xV+yhSqX4Rx4nR2ujzJEV9g3ppROb2mHjRC/WAImKf6KHdcFRj?=
 =?iso-8859-1?Q?qat5S+HxmGV7dxb/V5Ff/pbR7pU16lx/5aLWaI/9BgSIZ8GgY2AUt5ndDG?=
 =?iso-8859-1?Q?1yROP7oujlhIpZpjYR8Sj3nE6WoHI2//46Z7mYom0zth62saNxOcFVbdCg?=
 =?iso-8859-1?Q?ud4FgZUI5LjJjPfB3hWIgQ21eyBV2vm77jruJeJlNtQ5ZAdpMS9tahS2yI?=
 =?iso-8859-1?Q?8n1F0v1/ZiPRcv+gMOKQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-0f88b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4283.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9cc441-f033-4d3c-d623-08dc9e2a62f2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2024 02:13:26.5474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB8956
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

> If virgl=3Dtrue (which means blob=3Dfalse at the moment), then things wor=
k=0A=
> very differently.=0A=
Yes, we're using virglrenderer. The flushed resources are backed by host al=
located buffers.  We tried posting the flushed resource directly to the dis=
play and replied to the flush immediately (since not fenced), but I see art=
ifacts - I assume the guest is reusing the resource as its being posted.=0A=
=0A=
So now I'm doing a gpu-blit from the flushed resource into a separate set o=
f backbuffers for display.  The blit is done in another thread and I have i=
t synchronized so that a second flush can't return until the first flush's =
resource has been copied, making it safe for the guest to reuse.=0A=
=0A=
This is working ok with a double buffered guest compositor, but its not ide=
al as it can still hold up processing the virtio controlq.  I really need t=
hese flushes to be fenced so I can defer their response... =0A=
=0A=
So in my case, what's the best way to handle the flush?=0A=
=0A=
In case its relevant, at the moment I'm supporting an older virglrenderer t=
hat doesn't make use of the virtio-v1.2 VIRTIO_GPU_F_RESOURCE_BLOB or VIRTI=
O_GPU_F_CONTEXT_INIT features.=0A=
=0A=
Thanks,=0A=
Josh=0A=
