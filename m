Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE76AE7A02
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439C10E698;
	Wed, 25 Jun 2025 08:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="gZw6MdhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F99410E698
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfbR/xRQIzuQKM77jg5pUkKciykScW7jY+O6YFgsXIboAnY3G3RD5ZWM9ulPzbkKCGUuS18Z6SnK7f3urwwt6vGO9tZw0kwFkAOBRfGvMLN3bPYi9eFj++1P6Ng4scCP/qbbVDNHXm5HShanh08sWDZyYxVaATemOm5pnFOgkbyd2UdhzkAI4mB9sAi184OW0/Lor/CxK3/qLh2B0jroTkavagPgpPfhvhHGKLQzzB5qwuD5QGts0/6BewvRc3S/YXlJw3t2VclCfNAHIpD+N12R3BIGw44ilRtArlf/nEi3vk1cUn9sE+badNszzcN3wAsGnDAulkG4/2mdkdPgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDoLxvJjuFm2JeVxJvOeNgjxoDsSSmq/zdSBNxKsTuE=;
 b=fiSmAeoI+Egzrnd2WR1Vo0faKShl+nZD5sWXvu1baD7DrlO/dCTWKyrsGFfyPPGtSoKb9/Ye+L7wLz7EU9+vXtlOF99AslaWu8OYLAKFE0/O+g0/n28+wlrvdl0nz6frGT6M/cuWg8lnHpYPOeM32XnWLANY59Oi86xDer7ouO9JW+972iW9jKx3bihSHXlO3Eu0C/GvTxUEFlZV8Ou+pb/ergDZBTzV4/ehFmvwNisBcfTao19HkATUyljBENSa3s3ld3TOSWY8+4hBY4CtrrhNT3sm6MzN+MTwXVtfueFZXM91b0G9u669ji/iz7AyisqsqLPo4t3UO7HjBNE5Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDoLxvJjuFm2JeVxJvOeNgjxoDsSSmq/zdSBNxKsTuE=;
 b=gZw6MdhUqeFaigK5Fn25kLMZNg/0u1xAPJdFVc/QO+Z+n/QnVFSrhx62rY2MXQDAO2iUAOxX61eMpdivPhj0ODsn/86dzvBUt3hq4+DyJuCNDCxe3kbumoYvWbUHiL+YJCbniPcZr73JJMJkAOLVBtNZ1fMDfKrXrMQ93cruSA0MN/btkYipovB4xmZEenNOfDbg8jpBK2e8b74AQ/ritgNWjXOdpnbdwjG34e8rNscS3XLrTGxWmnhRUQbgY/EkCZV0aacT8ZSYa/+QYSIfH0gn3b5UVTE4+AfMnvkFuWfhE4YvyTUM3is+7TGObogKBXFajD3RpZSkNZ1eo9hKrA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Wed, 25 Jun 2025 08:26:21 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 08:26:21 +0000
From: <Dharma.B@microchip.com>
To: <mripard@kernel.org>
CC: <Manikandan.M@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
Thread-Topic: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
Thread-Index: AQHb5Y2YVcsh1lSVi0GWtdmNtVHFC7QTcNKAgAAZuAA=
Date: Wed, 25 Jun 2025 08:26:21 +0000
Message-ID: <f5f68503-9f52-4a60-8e2e-fe1164e447cb@microchip.com>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
 <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>
 <20250625-fuzzy-expert-mackerel-6edb0a@houat>
In-Reply-To: <20250625-fuzzy-expert-mackerel-6edb0a@houat>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DM4PR11MB6264:EE_
x-ms-office365-filtering-correlation-id: e1b383ac-6f8c-4a7d-006a-08ddb3c1f768
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y2FqcWVUY1hxRU1lRG1GZGZFUUI2Wmd6U1NQdEd0RE0ycS8xSUswT1dzeDRh?=
 =?utf-8?B?T3cyU0VpTEZDSU1LZzVxYVhSMkRVVE5aUVVUTUROcjZ0cHJWNjBVbXlBL2la?=
 =?utf-8?B?enlVelNKSXdFQ2VBSm1NMFdSVm1kQjJkclQyR1dKSVovK3I1MWhaL3VkelQr?=
 =?utf-8?B?SCtPQ0tYSUlpSUNZKzRQcEJ5aGRYVnRGUng2YWZwaWVrazF3V2lvSDBBdjZB?=
 =?utf-8?B?a0VuZ2crMDJwK201aVZHOUxWK3huQkdHR1h6STMrOTA0ZkVveWI0V2FrUnVY?=
 =?utf-8?B?WkdpZ1pkOC8xQWxwZzl6VXNGOG1jcjlWOXc1NnZyRjR3WDVDa0RlaTEzQTJQ?=
 =?utf-8?B?QzJlRnYwbWRwN2dYRFVUbFMzTkdyRU05L25UYm5nQWltRFRjYzk2aWpqb3V1?=
 =?utf-8?B?RFNwZC9oWlNmdzNOcGZNT2FnS0dCT29Yd255Vk5MQ2xwNGhRTEtoRnB3VUxD?=
 =?utf-8?B?NG9CU28vQXhveW5oZUlHZ2djUWEzdDRiNnpMbHVjejcxMHgwQXJkRndSZkpn?=
 =?utf-8?B?U3gxQ0ZPSjR4TmpVcDZtbHhpWUgyMlpzd29nbEFaN1RTVzFoWG9OWnFrQjFy?=
 =?utf-8?B?Y0NudFRVU3FoNGFOYXJ1S0hGR21BcDl4Rm5MMDB5Y3EzR2ZsRDh4R0tmTmxL?=
 =?utf-8?B?ZlNyUlN3WXNtaDVSUUp4M041dHl3V3JlanhOMTFHblo1VXp1Q2t2V2tLNnUz?=
 =?utf-8?B?dk1qVnM0UG9sZFI4VjJMcFhTbG5ZaU1qR3kraDBBa3ZHd1l0UkNPMXoxcXRs?=
 =?utf-8?B?WTBPS0o2ZjVVdGZPUGtyN0RBNjRjUkI5RWhuVEFsUDVBN3dnMnY5TnYyYk55?=
 =?utf-8?B?UUJ4VHFlRWVYVXd6c0FPM05OOGFTdThHcmpKNmVHUit1eWJvWjgxSUljSHVP?=
 =?utf-8?B?OC9ZRjdDK1V6ays4cDRwbDhWWEVZYzdGM1lIbW0wUnRwR3hSTllHbmVtK2VM?=
 =?utf-8?B?WVRudXI1UEZlK2JXdnJNdFhoenZIKzN6c3NrcG4xTkx5OFVjdkprbU81UTRX?=
 =?utf-8?B?VDQ2cmlNMjNhbmMycXZXTVEyYmM0SnNkNkd5RU1SR1dnL0luT2YxTHFqQTZi?=
 =?utf-8?B?MU9TU0NManNtNXduOTVtRGhjODF0YWhoMEdQeTA1NkQ1a1JTT2ZwbVJEdkVY?=
 =?utf-8?B?YTdMbzEybU9JYVhveEo1TDR3UkF2SG5teFY2WkFvVi94UVV1UlpUMmpjcHNk?=
 =?utf-8?B?ZC9nbVFPL05OdW5NS1oxdEdmaDVIN0hySzNuejB3d3VHVlNnazh4d3p1Wnps?=
 =?utf-8?B?L0NCRVJhRHZlcDBrN0puVjVXYitDR0dTRk56Y0tTSlJ6L1RDSnpmK216NHFl?=
 =?utf-8?B?UC8veFBtWnQvdXdXakMxcHV1TCtsL09GQ3hyUDliNUMyQWZqU2JZVXJUWnFP?=
 =?utf-8?B?eGlyQ1pPdXVVZzJPRzUwQ20wWEo4OEdWUWlCem5CM2xKakZnVnJSbDJHNm5N?=
 =?utf-8?B?WUlMYXFHb0ZsbVVSd2ZTR05TVTIyQ2RielpTNHpwOW1GSkhMZk1vSHA5SXJR?=
 =?utf-8?B?ak8vZm5uM09kQWgwQ3JZVFYwaUZXaTluRUdUcGJPbXlDSzVBVy9sWUNYWFBK?=
 =?utf-8?B?MVRZdTVDM3FmMVhYRmVHdVE2NFM0VmNwbm5mSnlmMzFCeHd3QndqeGdscHls?=
 =?utf-8?B?VkVPcUVmb0FvdytTOW9Qdzh3T0V6WE41bDRKeVg3elBZTUFBZERDVWU4RTdT?=
 =?utf-8?B?cTRUWks4NUJCSXdHa3B5TFA5VEVocU43ZFJmRXRIcmQ0dTFyRTRvR2FiTkRa?=
 =?utf-8?B?b2JPcVFqYm1tUGdDc09LalU4dHB0Tmw2WHJ2U1AyYW43VDFuMUdwM2xWMk9u?=
 =?utf-8?B?MGNsTXdwUk4zT2lyR002NEsrSUhpdE9KZ3RhRmFsN0pTMng4ZTdXZXpNRkhp?=
 =?utf-8?B?bGdDRitxaTdicHdjNDdIWk1qZDIra3lnRjdGenpPNHhvT3I1YnNmVHRsZitQ?=
 =?utf-8?B?dXVUV2VKOWhWbDJNS2pJRHVCNW9SK2Z5QW9sY3FlVVZjcnMxd1Y5a2pvSnpk?=
 =?utf-8?Q?8AFh6mw+IX6uz1QM1Cl4w+B8uPqq4U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjhWdUlZaVlNR3BDRlJJU3o4V2ttSHpBM3NtOHlsYjRTL081S3ZyS212bmZ3?=
 =?utf-8?B?N0ExQ0Vmb1p3UVhKaUdROE81UHVKbWREeUxyRmQvWkpuQTgzMnJxeXZqNmZD?=
 =?utf-8?B?VVdKRVZqM2pBU1dvZzFvUSt0NEV2TVVHOWpORUJ2em9RS0M1UGsveTVzOWc2?=
 =?utf-8?B?S04reWU4QU9Wdy82WEd1RXZIZHVtcWZzcjZlSWlZd0RvUXpxdmdUbWZ0WUFy?=
 =?utf-8?B?MUVxVzRtdkNieE5OQzhxWU03WmM2RmIvb1hPaGxQOGsvNWdFU21rbUpDV3Fj?=
 =?utf-8?B?NFR2Q3NzTTRad2h4TUU0TVIxOUwwYU4yUGVYYjFKU0JQckN6ZTdwRElUd2tu?=
 =?utf-8?B?Y04zMThoeXdOS1JObHBOR05SemFuenJDakozMlVLL2k0RnJhM0NNSWk3VTdD?=
 =?utf-8?B?NHcwb2dzOXVhcUdVREYwV0FaWXVnM2NvL3FqdTRBVWFobzdkN3VuMjFJbkla?=
 =?utf-8?B?czQySlhwWmFpTWVKVjRBZWthWjRDYloyOG1hSTQ5aFNpTnN2ckNDNHE0YzBi?=
 =?utf-8?B?SDJvUU5BWlAwVVBVYzUxdEdTeWo3YTBpaDhseFhPQlc1WjBQQTBvQkJZQndN?=
 =?utf-8?B?aGdwTTIvMjlsRXVtSzFLOHhweWY5YmE4b2ZsNE9kMXBBY1RGdXpSK0g2TjBS?=
 =?utf-8?B?NnhQRnVlRTl1ck9wRVpYOWtFUlpUUG5ITjdIU3NTNHF3aWREbU9wVC96aS9h?=
 =?utf-8?B?V3ZGMk0zaU8yZWJoMERrNG1ORUEySm12ZHI4UFlCd0NiTWh2QnZtbU41MmFQ?=
 =?utf-8?B?a1VFRXVZQjlYUzZDYlB1djdvNCtmN1NDajU3bUV3STF4L3dXZXNESzZ6YzBj?=
 =?utf-8?B?OG9PZkcxbkJ1N21Bc0l6V2l2WDZxRVBzMFdRZHl5OXE5OElDd0hMOWhsS2Yv?=
 =?utf-8?B?aVIrOGN6UkpDZUs5cS91eFVQUE96QXZFU2dNdTR0WXhMTHVWMzF0bTBQQzFY?=
 =?utf-8?B?ektnL0NwdFlvQnM2ZzNLUFFaYThqb1RWTFJ3emhMaXVNK2wxMGl2VWhVVDUv?=
 =?utf-8?B?NC9aRDFGVTFTUDNGUFFWTWdzcnQwM0hqQkc0MDAzZ3hHVmR3bkVuM3JLYVNu?=
 =?utf-8?B?Um1iRzBaYVdyREpMK1NLbkpsK1E2SS83MXZjOWwxc3p5NzRlcmFnb2ZFdFRO?=
 =?utf-8?B?ODhQSHJDUVRrdnVzWUtPQ1ZRa3VHU0tueTJCN1JmVXdXaGdUWjlqSUhoNFFz?=
 =?utf-8?B?eUZRbFFQYTYwNVVuS1I1SERxRHEyMGFuc1FHcFlWSGdLaSt5Z0psb3ZJNGdh?=
 =?utf-8?B?cVNLUkxLVnNtUkxKNWVIeEtXTHZqTkxNZHgvRFRwWVhIczN2UllvUkhHN2RD?=
 =?utf-8?B?eVdVdnNicTVybXNSbmN1SUE3SVZmb2ljVURPYmtXNlpNdVNva3NjeExLN1Vq?=
 =?utf-8?B?bDcrYmV6d0hIMldtLzBIM3BjYzYybjRkbXh6NTBxN3lteDZENG15YjZkVklO?=
 =?utf-8?B?dkJLNmk5MlpZMVhjVDZFazVmbnVBR3NHais0RGxldVdjWHFKMzhNd2R4UUZZ?=
 =?utf-8?B?TGtNd2YvUE1Tc0ZIK0pDejNYSkxYT1ZoaElEbklObnZrK2tlZ0JXOUUvWDdJ?=
 =?utf-8?B?OThVS2ZKWmtKMzFWa3FjSW5DRzlDalJpNHRpVXBYN1ZNOVNDR0xaTFppZWJL?=
 =?utf-8?B?V2hrdGo5aDAvTDZaUC84aHQ0dWZ5ZXQ2c2YxK0h2VHRxNmYySWx3R0RDOHBs?=
 =?utf-8?B?ejdhVjMxZ0w1NVBscG43OTlhU0N3V3lwclRqYW5MM0drSTRmUmlnclVLV2I4?=
 =?utf-8?B?U3owWGZCanNMNk8xdVpBYWoraU5uT1ZGQzdGYUpvTk4wTGd2c0ZFbURraHRp?=
 =?utf-8?B?ekhkSld6QWpiWFk1RWRsSkp3R0NZSWJQVG45R004TS9SLzhWNWtMRnNPOG11?=
 =?utf-8?B?dlFRcmtNUjJsSGxiVmtveVc3dmdvQXE5MWdhczQ5a2l1V21oYWErUEJHeklw?=
 =?utf-8?B?bHkyejVzaS81UWxYN3NRVFI5WjR4UzhsREc0WjVQU1NsVC9ZNDl0dzlTTmNk?=
 =?utf-8?B?V2hnM2pYY2VVMkR1K3lxWkRueklQdG5GYkpHclBlWjZXSlJrT05vSE1hdE1D?=
 =?utf-8?B?YnF3b292d0F0MUFTYkdhQzR6L3JZQWVBSHJFN2lOdUUyNGtIeFF5ZnpIVFFG?=
 =?utf-8?Q?7Vky+fKUob6Ho7bX9JGPh3Vw1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B07EA536A5F5D439EFE8D531DA19BCC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b383ac-6f8c-4a7d-006a-08ddb3c1f768
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 08:26:21.6827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2eKfXUpFXalwabNxA86LlphY7eK0u3jc4a3yqEedim8M1t420VD2HzML0VHg8Dr5XD3P5gdH1eU7470kTmDZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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

T24gMjUvMDYvMjUgMTI6MjQgcG0sIE1heGltZSBSaXBhcmQgd3JvdGU6DQo+IE9uIFdlZCwgSnVu
IDI1LCAyMDI1IGF0IDEwOjI2OjEwQU0gKzA1MzAsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90
ZToNCj4+IFJlcGxhY2UgbGVnYWN5IC5lbmFibGUgYW5kIC5kaXNhYmxlIGNhbGxiYWNrcyB3aXRo
IHRoZWlyIGF0b21pYw0KPj4gY291bnRlcnBhcnRzIC5hdG9taWNfZW5hYmxlIGFuZCAuYXRvbWlj
X2Rpc2FibGUuDQo+Pg0KPj4gQWxzbywgYWRkIHR1cm4gb2ZmIHRoZSBzZXJpYWxpc2VyIGluc2lk
ZSBhdG9taWNfZGlzYWJsZSgpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3Vi
aXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4gDQo+IEFzIGEgcnVsZSBvZiB0aHVt
YiwgaWYgeW91IGhhdmUgIkFsc28sIGRvIFgiIGluIHlvdXIgY29tbWl0IGxvZywgeW91DQo+IG5l
ZWQgYSBzZXBhcmF0ZSBwYXRjaC4NCj4gDQo+IEFuZCB5b3UgbmVlZCB0byBleHBsYWluIHdoeSB0
dXJuaW5nIG9mZiB0aGUgc2VyaWFsaXNlciBpbnNpZGUNCj4gYXRvbWljX2Rpc2FibGUoKSBpcyBu
ZWVkZWQuIEl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8geW91LCBpdCdzIG5vdCByZWFsbHkNCj4gb2J2
aW91cyB0byBtZSBmcm9tIHRoYXQgcGF0Y2gsIGFuZCBpdCB3aWxsIGRlZmluaXRlbHkgbm90IGJl
IHRvIHNvbWVvbmUNCj4gdHJ5aW5nIHRvIGlkZW50aWZ5IGZpeGVzIGFuZCBkb2luZyBiYWNrcG9y
dHMuDQoNCkkgaW5pdGlhbGx5IGludHJvZHVjZWQgdGhlIHR1cm5pbmcgb2ZmIHRoZSBzZXJpYWxp
c2VyIHRvIGF2b2lkIGhhdmluZyBhbiANCmVtcHR5IGRpc2FibGUoKSBob29rLiBOb3cgdGhhdCB5
b3UndmUgY2xhcmlmaWVkIGl0J3MgcGVyZmVjdGx5IGZpbmUgdG8gDQpzbGVlcCBpbiB0aGVzZSBj
b250ZXh0cywgSSBubyBsb25nZXIgc2VlIHRoZSBuZWVkIGZvciB0aGUgc3BsaXQuIEknbGwgDQpk
cm9wIGJvdGggYXRvbWljX3ByZV9lbmFibGUoKSwgYXRvbWljX3Bvc3RfZGlzYWJsZSgpIGFuZCB0
dXJuaW5nIG9mZiB0aGUgDQpzZXJpYWxpc2VyIGFzIHdlbGwgYW5kIGp1c3Qga2VlcCBqdXN0IGF0
b21pY19lbmFibGUoKSBhbmQgYXRvbWljX2Rpc2FibGUoKS4NCg0KVGhhbmtzLg0KPiANCj4gTWF4
aW1lDQoNCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0K
