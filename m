Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89E96B31D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0410E69E;
	Wed,  4 Sep 2024 07:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="FZC4xRW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8135410E6A7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ5JKuem71C8quhSa0LIiZqDD4TCNmNFrr37J+XwhP4mlmjtXbVkJBzm3L0EyreQGK0jgqH5s7TiY7O/ptFXnJu2EeI51e8A/B5e6oIxz7HpgKhIoOyTAhBYr2uzN4+ZR2kS/R5iGLVxVYvWiSDrxX1wsCwuc95RajGzn45Bo0n+34H1nKfG3PA6hquK4WgWJNFibqjhDSbbXD2ygbbkRQKviJf7FEiiM+Kz89JBpxN1s26PCmijISttIFalcq/igJlPEj+mozKI/1k7HbBM1ufEEWxEDtvs4ODv57V0/ytZu564GHlBXxBZrj5D/RiFz5XRqRj5/vof75I+tAyDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+yBq/6hRvZwF7j41tO4HvfaCrhcJKMWpdwOK3xIt7A=;
 b=a/LWfKDLYZTlDQjVvU47h5FLBHUeH4h/T33l3tMa4Ce3M5/rSR0doeYVIqM/OhwA+QNpatT+fysSN5m++R7dOUDq6WDenGWS8pnwoV7hFRgYtcgHP42v8Nez4K+IZsn3zdQJB2oc+B2E9DW3ZJOsILy21CpyV9yBXu3UtOYJ5PcYfLBU+bbhJZ6ChxjJcegkGLMUmEgTQmtDuFyMBccxlZrD10PeW43BbmHYBvRb7l0OQ/PDMKZCc1QIegT5sAoer27AQXZp3NC5BxoYCkev2KyAY7TbXj4ebNVWjrO5Avj2+M44tTvCe4r1tDdJg4JbvpocWs5el7IKI0isKfp5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gehealthcare.com; dmarc=pass action=none
 header.from=gehealthcare.com; dkim=pass header.d=gehealthcare.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+yBq/6hRvZwF7j41tO4HvfaCrhcJKMWpdwOK3xIt7A=;
 b=FZC4xRW7hhPD6t4kN+T7cZoXaFA8t/VhraShy78C5VLGYp28Hb24c26Y8rtVbSOWQTq0ZY0BjiDLbiCP90IB+NCnr7GdLinZoOF7zo/B0KRjxWc6OnkpxZdxXMYLYPQCOQU9NmIQZahq1aoP/gv7cfZmQTUwfY2YhCZ5aL9a7Dgx/cuJey59HPveVaKmK1gU1Wfjb877gK0p+p3aYQNYVECmJnS2n04wjWmbmMK30+EY2t+JoJ3jMw63YTSr9q2jc/aDEO/583cttUr4fzfTEUGJ+LMRjub18Bysud00Vjb8cAc9CSF/5hvO88knJ5YQz9T3BMJPsv7C+bBM7XH0Pg==
Received: from PH0PR22MB3884.namprd22.prod.outlook.com (2603:10b6:510:2a1::22)
 by BY1PR22MB4085.namprd22.prod.outlook.com (2603:10b6:a03:529::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 07:44:33 +0000
Received: from PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4]) by PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:44:33 +0000
From: "Pu, Hui" <Hui.Pu@gehealthcare.com>
To: Liu Ying <victor.liu@nxp.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sasha Levin
 <sashal@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
CC: "Wang, Huan Kitty" <HuanWang@gehealthcare.com>, "Wang, Tao1"
 <taowang@gehealthcare.com>, "sebastian.reichel@collabora.com"
 <sebastian.reichel@collabora.com>, "Ray, Ian" <ian.ray@gehealthcare.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd
 screen resolutions
Thread-Topic: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd
 screen resolutions
Thread-Index: AQHa/nQ6EpgruDDrAUGt+3bjowYOHrJHHOcAgAAgdbA=
Date: Wed, 4 Sep 2024 07:44:33 +0000
Message-ID: <PH0PR22MB388465D1C753EA4FB57AB58CE19C2@PH0PR22MB3884.namprd22.prod.outlook.com>
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
 <01b335a8-0802-453b-a792-ceb5c54a41aa@nxp.com>
In-Reply-To: <01b335a8-0802-453b-a792-ceb5c54a41aa@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gehealthcare.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3884:EE_|BY1PR22MB4085:EE_
x-ms-office365-filtering-correlation-id: b8819e00-3b5a-4f84-d9c9-08dcccb56aaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?SHZlV1Z4UE5OVzMvbjBJcGxjVjNtTWh2UFhkeUFHRHZmSnlGK21CU09yVjBJ?=
 =?utf-8?B?Mm5VSzNwcEdTUkx5Sit2NytqZDI2VlBRenQxcnIzMmtUcXpqNXR4N2xXMW90?=
 =?utf-8?B?MHZtQ0FINVhuWXdrTDJ3REVycHhXcmlVZmdlQVFKcyttTVd6R3hoclM2TWJs?=
 =?utf-8?B?eng2aUlxd1gzSU1yTEcxcEhiMmhjNjVMRVlzRGZaOUJqU2lvSDR2cjFuTjVs?=
 =?utf-8?B?N1pJTWRpV0ZCdGRad2dQUExhQndyeWFRYkhpUmlkMHdvZDQ4Nm1ZblJTREt6?=
 =?utf-8?B?VG5YSTRhSklhVHhRZ3VYdW9BaTFHTFN3d3dNbktMbkx4cUNWYnVRTmxtcGww?=
 =?utf-8?B?Y25Rb293MjZDSUUwWlA5QjZPZnRVMWFwc2J5SVpDdHp1Z2NJMm9ROGxCTFo0?=
 =?utf-8?B?MjFQa3UzSVMxa01RSmc4TmVtajJoRmJhOElxNlhESytPSnlJQ3A0c1k4eHZM?=
 =?utf-8?B?MlBJNk9BWWIzYTdtb1BQc0JlUXhJQmNMWnhONlFhTEhJcGVCQjdpM3Uram5X?=
 =?utf-8?B?citRTVB6eDhMMUdQNDhNN2hxMzBPYWlVTE8wS2RKbERlaWRZNEtuWEpseWtm?=
 =?utf-8?B?bUdEdHhtc29KN24xMUh6YW1qcGdOSkI5QkphNHphWXhyS1BLRVBBNFJNTjZX?=
 =?utf-8?B?VWxxQnlxVzNzWjdHczd0L1gxM0lFYWE3Tmh5cCt2MTR1MnJmaGVJYkw3TnFS?=
 =?utf-8?B?U0lZR2p4aUR4QzdhNDZPWVJUNXl4VjlNZENCTzBMQ2RuWkJMNmFHR21ZRTht?=
 =?utf-8?B?YnhPWTZORWIyWGk4RVlTUXNyeis5MnNQbW4rUllLRlhlTldURHJIQTFBTkhp?=
 =?utf-8?B?UENBYmhTVFVLQ29tQVZoQXVkNXZQWUpleU50VmJiY28reFowN3F3Szc3akNW?=
 =?utf-8?B?RlNuZTVwbVlhL2sxdGdpMDBzOG1IRjZWaEozTmt4M1lRcS9Ud052ZWRQbUF2?=
 =?utf-8?B?TUF1cVlPZk9Wai9mcHVzZUN5SUg0ZlFnQWNvc1JCd20yVFhYL29RT1R6bHZG?=
 =?utf-8?B?dFJaZ2JEV1B6WmdOdVA5WS9uL2tRUlNVSGQ5OTA5S0VzdUwwMVJwc3NFeTEv?=
 =?utf-8?B?RTQxT2YwRjRvVXlQWDZMdVJlNHh6QUpYRjZMVE8xQ2ZKd0Q5SDNtRkhnbkhl?=
 =?utf-8?B?SXhKdS9jUy9QaGNHTENrRiswUHU1MTlVK0VmRkR1VWQ2RklOUWVyaDJ1SkJV?=
 =?utf-8?B?cXU0c2txZlNtcHdpeFZjdUNuaFZxQjRxWk11V2IwN3JxTGoyUHVZcnpaZjND?=
 =?utf-8?B?T0ZkdTE3VTdQd3R5NVhpbFd4UjZrQTFPMnF4cURXUU00SWpvK2RHR3Y5QlJs?=
 =?utf-8?B?c1BpMjRMVEw2MlJ5akZzT0dHWC9mVHlCOEUwY3ZYcDRZTkRsKzZyMXBzQzBN?=
 =?utf-8?B?WlFud3RHNlptOUZ2ZWxiejJPekRmUWRQU0JEUzVJQmZvRkg5WnBuWFVPajJT?=
 =?utf-8?B?L0Z1UFhlSk5UQzlBWGhweVlmRmVscmRxbTFTUXQwbWxKTG9hRGNtT2FuYzAx?=
 =?utf-8?B?OXNtNFhINnVJZ3NTZDZxV3A4LzRWc2g2d2RNdkFncXJhZTFwTzBVYjFEd0Vw?=
 =?utf-8?B?eWZiUWgrbkdscDd2ZUJyU0tVV2pSbTcvcjZoZmFsaVZNQmNJVnJGaStKNXlQ?=
 =?utf-8?B?U0FrY1lST2o2cGt5N0ZKeFVuYmtJRWY0bXorT0ZZRHBLZXRZNncwUTVNUnNK?=
 =?utf-8?B?NEFheUl3THBOOGtuRWNIWmYyZDNjUnRWVDMyR3VKNTB4dXYwbVoyaC9uZVEr?=
 =?utf-8?B?NmxrblZUbzhJc3Y3TUU0RkFEK2lNdU0xcXUzbTYwVjQ3TEdaa0VGS0RHR1o5?=
 =?utf-8?B?aXhvcHNFUEw4NU1SNkwyL3dJRmo3WDY4RW02TytRaHNOa1N2WkUrQVhmMlJK?=
 =?utf-8?B?MHpmZUJFcSs2bnFjL3Z3S3FydlVXazdmRTg1ejlvZmU2Y0FVZXhsbzZGR0sx?=
 =?utf-8?Q?eVQmNA9sqCw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3884.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkYzcmVLVkFhUlZybTdUdDE3VnZHMG1iTzRIZy9MZUxxV1NiZ2JUNlZvMlFY?=
 =?utf-8?B?aERhRFFHSkxiVktGczZwdWoxZkh0RGllT2pFSW1HK1NSNmZmNUtwYU93VmFu?=
 =?utf-8?B?Wmt3UFdaanNtdEZqZVhlcGtEMWEyRHFzSHhEaERub1cxZDh0ZGx2OFg0N25q?=
 =?utf-8?B?TGkvdzFsZkpmelpmNFJDbjNDV1lTVmM2VkYvUzk5NXYrbDI3MHo4d2pxMFVw?=
 =?utf-8?B?N0lVV1ZqQnJoMHkrMzFDTDN4bE5SbGpXYW14SzlNem5ueW5oaUVtSXZvRGQy?=
 =?utf-8?B?NU5qWWRUT0ZRMGZoZ0diemI2bXBGQzN2NjcyQ1VWOFpSQnFkN1M4cTIyM21v?=
 =?utf-8?B?eWd1UVY5WDBvVGV1SkpHaThMZ2Y0OGJWdjFuYU5uRDVzTU1VTVIvTy9LL2Nu?=
 =?utf-8?B?NCtKL09uVjRTWXluTUlPZkcvNGVJUWM3ZGtNVG40TitPMk5CUml0UG54WkFT?=
 =?utf-8?B?RTFvdyt2L3FEeUQrWldVZ1NYemxHQ3BnbTN5ZVBRVmI2c3g2Z0N0SDlwWHRE?=
 =?utf-8?B?R3d5S3FDcERXWjhrTlBZQ016MUw0UnZKVitwNVJxYXg4UVpIM3JjQlczbi9K?=
 =?utf-8?B?emx4dHVxY1VKTW50YUF2TFlkcktESVhhaERpN2dXRHdOeDYzMW16QmhPQy9U?=
 =?utf-8?B?UTd2ZjR6SVlqUTlSTldpZk9WR1l6OFRrc1B4SHpQdEUwV2cyNXpCQ0NtN01v?=
 =?utf-8?B?WUVYQkNWay8rUmhTVWxsbjJkNjNMTldpcVcwTG1QaWpKY3FaQk85RTEyek9x?=
 =?utf-8?B?eGsxcjVHQ2xsYktMV21JSUVmVkV5eXBCZ1ZuTkJaN2FvNUxoa0pLYU5JamVV?=
 =?utf-8?B?M0xxMWNVc2I3SjJLaS84ekRCMmI1QXdiQ0grK29hOXFTeW55WXZQWXVTUjBE?=
 =?utf-8?B?ajhuUGVWV2c2eWJsN280Zit2bU1ySEZrd3E5TGhMU3ladlZoZGNya3A3ak5G?=
 =?utf-8?B?cU9xUUZPOHBETVNuREFjM2I1YU1nUDRsMnpGc2NTQWRveXVqcmp1Y3BNcDhX?=
 =?utf-8?B?NzJDWWdqTm9hMnNQQ1ZQTm1pQU5Ha002YW43SkZnTE1ZRklxM3JxNnloRm9V?=
 =?utf-8?B?Y1ozcjgvWXFXR2tML0krYUtkcW1xMTh1UFFpMHpCcEgwQ2pjT1djQkRvZ0JP?=
 =?utf-8?B?SnllbVJNYituVlZBMk1zSDJiREdRS0tXREVSVGtRdTFMbFVKV1dKL2FHQkVU?=
 =?utf-8?B?bERtdUFuOEVzdVA1anRrMnZMRXlRQ0ZYSWlMVjBiblB4QWhIbzhxakNlUU1I?=
 =?utf-8?B?UWVOZFRaTUorNlhzcTRMTXhxWlU5aFY0MUZrWlExZHdlNzZqQjIzT3AzcThT?=
 =?utf-8?B?aFdqUjZSeCtudVo5ZitEYlk3eGpkREM0R0N1MnFZWis3N3RWeHNtUlhXUXZk?=
 =?utf-8?B?VmI0ejhwVkJSL1MweUpkY3ZqOFVzQTNtbE1iUjQzOXZGbEpjWTZNSDN2Q0Nj?=
 =?utf-8?B?bWNLRDkzcnRuVkZaREdNT1RSVzJ1dEJNb0g1MVpCSmM1alVjOUNuZlhja1cr?=
 =?utf-8?B?VFRtem9NT3IwbDJGTGduQUlkbDhLU0NjeU9pSnd4bTFjNWl3RE83SnpYU3V1?=
 =?utf-8?B?Rkt3enVYRndYRlg1SEZUMVFwdXBFMmgrNWEwMExFWDV4bW1LSXYwbkY1K0Zs?=
 =?utf-8?B?OVVPeThNa3BGR3VlWmN0OTZFQUdDN0ZQZ0NoQUlOVHE4d1pmZTlXcVY4U04z?=
 =?utf-8?B?VFZubGJhYXpRS3dMSnVTc2dENjlERUZ3WUpLUk1vMWJnZzIzV3lRR0w2WDRN?=
 =?utf-8?B?RzZKOVRiRk1hWndBb1pPWUdjZVRJcXhjaUNRK1k3R3BLeHhaeTBiTFQ1cTJi?=
 =?utf-8?B?dnZlR2RjbmFmalJMTXkyVXRLYXhHRzRrSjRsUjlDZkhrY0JKVzkxRGR5VXVB?=
 =?utf-8?B?NVhjZHljdG5Sd2R6MGwraEszbFRBVzJVeEdwS0tGaUtJdVFLL1g5OXJRU29y?=
 =?utf-8?B?SGVjTzFHdlQ5alU1R3dMTGhuMkxPekNyNm0rM0tUU1hIRVo4VHVwOHNOZXNV?=
 =?utf-8?B?UWlldXpJT0VnNndzOFdyRFpmam9mbFRVSUh2ZWRSdDd0T3ZHT1Z6aXZVSFZt?=
 =?utf-8?B?M080VXFzUE0vc0pJZWFnTXRzbk9wcm93bGVXMTROVEpuQThjU0NYOVpWR0lZ?=
 =?utf-8?B?VTRMUGlBdWh6TjFlQkduZUtTOXB1UDZuVk9lUll3UUh0SXg0OHgxWGs3Mmpm?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3884.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8819e00-3b5a-4f84-d9c9-08dcccb56aaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 07:44:33.0323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Itlrm7xLLqkYLGpcxyoYuVr3v7mNK0Ny2KyLyDbB4fN3qhkLjlBv3ph0js/FLUBzK/cKC/F0CeFGQhRdQjXjnR1sSQIvw2C1WPPqceyWGTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB4085
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

SGkgTGl1IFlpbmcsDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGd1aWRpbmcgbWUgd2l0aCBz
byBkZXRhaWxlZCBjb21tZW50cy4NCg0KVjIgaXMgY29taW5nLg0KDQoNCj4gSGkgUGF1bCwNCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gDQo+IE9uIDA5LzA0LzIwMjQsIFBhdWwgUHUg
d3JvdGU6DQo+ID4gVGhpcyBjaGFuZ2VzIHRoZSBqdWRnZW1lbnQgb2YgaWYgbmVlZGluZyB0byBy
b3VuZCB1cCB0aGUgd2lkdGggb3Igbm90LA0KPiA+IGZyb20gdXNpbmcgdGhlIGBkcF9mbG93YCB0
byB0aGUgcGxhbmUncyB0eXBlLg0KPiA+DQo+ID4gVGhlIGBkcF9mbG93YCBjYW4gYmUgLTIyKC1F
SU5WQUwpIGV2ZW4gdGhlIHBsYW5lIGlzIGEgUFJJTUFSWSBvbmUuDQo+IA0KPiBzL2V2ZW4vZXZl
biBpZi8NCg0KWWVwLCBsb29rcyBiZXR0ZXIuDQoNCj4gDQo+ID4gU2VlIGBjbGllbnRfcmVnW11g
IGluIGBpcHUtY29tbW9uLmNgLg0KPiA+DQo+ID4gWyAgICAwLjYwNTE0MV0gW2RybTppcHVfcGxh
bmVfaW5pdF0gY2hhbm5lbCAyOCwgZHAgZmxvdyAtMjIsDQo+IHBvc3NpYmxlX2NydGNzPTB4MA0K
PiA+DQo+ID4gUGVyIHRoZSBjb21taXQgbWVzc2FnZSBpbiBjb21taXQ6IDcxZjlmZDViY2YwOSwg
dXNpbmcgdGhlIHBsYW5lIHR5cGUgZm9yDQo+IA0KPiBDb21taXQgNzFmOWZkNWJjZjA5IGlzIGEg
Y29tbWl0IHRoYXQgb25seSBleGlzdHMgaW4gZG93bnN0cmVhbSBrZXJuZWwuDQo+IA0KPiA+IGp1
ZGdpbmcgaWYgcm91bmRpbmcgdXAgaXMgbmVlZGVkIGlzIGNvcnJlY3QuDQo+ID4NCj4gPiBGaXhl
czogNzFmOWZkNWJjZjA5ICgiZHJtL2lteDogaXB1djMtcGxhbmU6IEZpeCBvdmVybGF5IHBsYW5l
IHdpZHRoIikNCj4gDQo+IENvbW1pdCA0MzMzNDcyZjhkN2IgaXMgdGhlIG9uZSB0byBmaXggaW4g
dXBzdHJlYW0ga2VybmVsLg0KPiANCj4gcy83MWY5ZmQ1YmNmMDkvNDMzMzQ3MmY4ZDdiLw0KDQpP
SywgdGhhbmtzIGZvciBmaW5kaW5nIHRoZSBjb21taXQgZm9yIG1lLg0KDQo+IA0KPiA+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnDQo+IA0KPiBCZXR0ZXIgdG8gbWFyayB0aGUgdmVyc2lvbnMg
Zm9yIGJhY2twb3J0aW5nIHRoZSBmaXguDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMg
Ni4zKw0KDQpBaCwgeWVzLCBJIHNlZS4NCg0KPiBObyBibGFuayBsaW5lIGJldHdlZW4gdGFncy4N
Cg0KT0suDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIFB1IDxodWkucHVAZ2VoZWFsdGhjYXJl
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My9pcHV2My1wbGFu
ZS5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IE1heWJlLCB0aGUgcGF0Y2ggc3ViamVjdCBjYW4gYmUgc29tZXRoaW5nIGxp
a2U6DQo+IGRybS9pbXgvaXB1djM6IGlwdXYzLXBsYW5lOiBSb3VuZCB1cCBwbGFuZSB3aWR0aCBm
b3INCj4gSVBVVjNfQ0hBTk5FTF9NRU1fRENfU1lOQw0KPiANCj4gWW91IG1heSBmaW5kIGV4YW1w
bGUgcGF0Y2ggc3ViamVjdCBwcmVmaXhlcyBieSBsb29raW5nIGF0IHByZXZpb3VzIGNvbW1pdHMN
Cj4gd2hpY2ggdG91Y2ggdGhlIHNhbWUgZmlsZSwgbGlrZQ0KPiBjb21taXQgNzFlMzY1N2NiMTI2
ICgiZHJtL2lteC9pcHV2MzogaXB1djMtcGxhbmU6IHJldXNlIGxvY2FsIHZhcmlhYmxlDQo+IGhl
aWdodA0KPiBpbiBhdG9taWNfdXBkYXRlIikNCj4gDQo+IFlvdSBtYXkgc3BlY2lmeSB0aG9zZSBm
aXhlZCBvZGQgc2NyZWVuIHJlc29sdXRpb25zIG9mIHlvdXIgIkhETUkiIGNhc2UgaW4NCj4gY29t
bWl0DQo+IG1lc3NhZ2UuDQoNCkxvb2tzIGV4cGxhaW5pbmcgYmV0dGVyLiBXaWxsIGRvLg0KDQo+
IA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvaXB1djMt
cGxhbmUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvaXB1djMtcGxhbmUuYw0KPiA+
IGluZGV4IDcwNGM1NDk3NTBmOS4uY2VlODNhYzcwYWRhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pbXgvaXB1djMvaXB1djMtcGxhbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pbXgvaXB1djMvaXB1djMtcGxhbmUuYw0KPiA+IEBAIC02MTQsNyArNjE0LDcgQEAgc3Rh
dGljIHZvaWQgaXB1X3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0DQo+IGRybV9wbGFuZSAqcGxh
bmUsDQo+ID4gICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAtICAg
ICBpZiAoaXB1X3BsYW5lLT5kcF9mbG93ID09IElQVV9EUF9GTE9XX1NZTkNfQkcpDQo+ID4gKyAg
ICAgaWYgKGlwdV9wbGFuZS0+YmFzZS50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpDQo+
IA0KPiBwbGFuZS0+dHlwZSBpcyBtb3JlIHJlYWRhYmxlLg0KDQpOaWNlIGNhdGNoLg0KDQo+IA0K
PiA+ICAgICAgICAgICAgICAgd2lkdGggPSBpcHVfc3JjX3JlY3Rfd2lkdGgobmV3X3N0YXRlKTsN
Cj4gPiAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgICB3aWR0aCA9IGRybV9yZWN0X3dpZHRo
KCZuZXdfc3RhdGUtPnNyYykgPj4gMTY7DQo+ID4NCj4gPiBiYXNlLWNvbW1pdDogNDMxYzE2NDZl
MWY4NmI5NDlmYTM2ODVlZmM1MGI2NjBhMzY0YzJiNg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4g
TGl1IFlpbmcNCg0K
