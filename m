Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B0B9F0C2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C3510E27D;
	Thu, 25 Sep 2025 11:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="Z3wGdH2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021105.outbound.protection.outlook.com
 [52.101.65.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0F10E27D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybMd0H2RoE3cS55qi1Sq9kORJAtGHG+vYdJ1SpJFBXdVmXDdaH3n6jfUP975F//R0MHG1u71EEROJiLoXbvgNNn8wiiNSzaHEPc/D1W9mWTC9QJMZ4HzZIAxVqnI7hjMniAJcsAd/fAnhLrKoFKq0YLcCrfcBfouiB0djy+o3r2YmJElNmoGA6NgKPM67psz3cDjBg5gWy1yqiBHLhQKA/DAN4nuXlRShIMDcX4FlPim1safnvWERrpGfTV/R2yEfECe3gkePqYQY5rluLPmGD93kh6miWIaTPekPwXVfoNKWhtyRR3rEiEjCijaDwgGlil0m1M43h7R6+SOm/KwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A07kNrobvLfP0Xsb8shg4regBg7OXHLjrdu2+mavTsA=;
 b=aqW+Z1tJuJrtH5KMU4mYke1LGO3wfviGaCmouDXwrqdPht9qicFTsJ/9VO8Kkhf7pJuur930BI0YD7Dftzv0g9R6y7jJMjsi4LiQuM1cv2lNo8Hj5wUMSaRJyEI9fbefuC53BxX3KIYznaY8yn9Ei51WNgpAXojxGNPmVdoURx6feB6jpNp6Wqm7MW7HB40+wt14rIMjJTeQseavDrzIXX9hyUyS1Uk1cs9F5sjEQm29WC3U9oiGAgoVIe+DCqEeM7XoEZhDfXf2m8L83qrXAHzElQyOLzFUxdbN9uB4ct5FIlIOlyscbaZgIcU9CkXZZOtL8YE5oDf/pkZbUNRJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A07kNrobvLfP0Xsb8shg4regBg7OXHLjrdu2+mavTsA=;
 b=Z3wGdH2FcCmEcSFNBpJbtV0rzQXk786TdzI2JN3mIJ6sViQDq2NEP6P/Koq1TkZTM+zctO/B0uon8Ln43/ASY035oWBAwM9MPGkXgiwP6yezNmI8vo6/pTxPmsYaJjBEJ+PpJDuUM7aYYQgIu0aL56+lUgyfeltE3Q80EOId6A1wxifiKcXyuQQUiMYnQpn+KtCOGtN8gVw5h8Xoppwe3ipIaPH3Z4JlGpBeOB9qoxd7ubbmWffXZUERFHSKevgnT49SgBK6N5+gnUgnaSbp8otWcAt4Hg7ar+9JHIcDymdqmUHSgcYz33zI0hOsKt3PVVCB0YxxfKv6wfQSf6YDlw==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by AM4P195MB3108.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 11:58:22 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::ce58:6abc:a395:f7c4]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::ce58:6abc:a395:f7c4%7]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 11:58:21 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya
 Bhatia <aradhya.bhatia@linux.dev>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
 <upstream@lists.phytec.de>
Subject: Re: [PATCH RFC 2/2] drm/bridge: samsung-dsim: move clk setup to enable
Thread-Topic: [PATCH RFC 2/2] drm/bridge: samsung-dsim: move clk setup to
 enable
Thread-Index: AQHcLhCfEKqot/mr/kKB6aO0piyuFrSjyFEAgAAC7oA=
Date: Thu, 25 Sep 2025 11:58:21 +0000
Message-ID: <9f3b697a-b4eb-452e-b6fe-fa7cfef2a3be@phytec.de>
References: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
 <CGME20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03@eucas1p2.samsung.com>
 <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-94f9f775ee62@phytec.de>
 <6c7cdef8-f912-4147-a4a2-641070a478e8@samsung.com>
In-Reply-To: <6c7cdef8-f912-4147-a4a2-641070a478e8@samsung.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|AM4P195MB3108:EE_
x-ms-office365-filtering-correlation-id: 9cf60314-ae61-4cf4-c4ec-08ddfc2ad334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VTRibGk1ZEpHSWVEejZVTGhycVJPWmNveFVpVFdqYXV6MkYza3JWcElBNUhQ?=
 =?utf-8?B?L1lMd1JJRGtYQVlpL0VyYmgxbGR5bDlJOFh0L0srOSt4RjFiVTVnRzRtMUtn?=
 =?utf-8?B?RmVzYm5QQ3FORGFuOU1YVFExaDlQaWZRT2RVallFcDBEZFpGK3BQZzdjc2FU?=
 =?utf-8?B?VFV6NU9PVnUrZFlYaEFpbXVyYkhDSWF0NHZGTWxaWUhBL0xJYXhoZzFEZ1pl?=
 =?utf-8?B?WHlEV2QrSlQ2SWRQUDg3UFFvYkxHTTFjUGh4bHRrMk5XVDV0UkpYMis4K0Vp?=
 =?utf-8?B?RnJWM1lUN2pMQUF4K2k1cG1sK29DZWE5V3V1MDJabnV2bytFZkZ0ZEM4MGhk?=
 =?utf-8?B?ZzJXMkVYTUtaTCtuR0lMckJMQUZ2VjZkQnpWMGJud2hmdUtwdXNNdDRZUVVi?=
 =?utf-8?B?NnpGdDBMVHRNNkNwaEQwQ0p4emRqTTdTWGtqQzNSalQzaVFLSXNmUS9Kampw?=
 =?utf-8?B?ajg1TmQ0bm14ZlkyL0J4NEVEdGNGWHFxSFdNdVJ6R3l6Qm1jZ0t0WmJocFZm?=
 =?utf-8?B?NGlaNkpuc0xxalhmajBQWmhZZHhxOTViZWdUQlBINjB2Skp4ME1tVDFFaXBV?=
 =?utf-8?B?cXRhVEFRQUg1UzhiKzBEa1JRU2FEVnJWM0hqdWdYM2p4SW9PYkl2RStqeDF3?=
 =?utf-8?B?SmZIb2NvdmR6NFAzUTkwbFlrTnhPR2NhNTBvaDB4WlZVTmtyY3cwdlZ5Wlhy?=
 =?utf-8?B?dXNqS0dNOXhUc2Y3Zk02aEREVTVMYnE5R0NNb3RmMDdhalUrMldwcmx6U1FC?=
 =?utf-8?B?Nkxvc3AxNmlYaXAwWlVwMExxNDloZzQzUTZIWm9UWHVCeTl6NXZvK29tdTNS?=
 =?utf-8?B?aldwbFg2OHpQaTRsUVNSYlNISUQrRXBCNTBOUy92WG1vMk12QUx2bEpnNXB2?=
 =?utf-8?B?NUVZcmlDcnNEc2lTdG9LWEhoZ210L3Fwcy8xa2FibnVkMVBKK1l5Nkg2U1Yy?=
 =?utf-8?B?RmlsSGFNWGdIaG5VcnExUUdFeDBDYURvUXJ2Q3ZxclBPbUJtRUNaYktHMGpo?=
 =?utf-8?B?eEVuZWhkamJYVUcyV2x4aHJnNk1HOXRXajVoc1U4S2hBRnNWYkx1Q0NoSzdQ?=
 =?utf-8?B?d3J5cDc0aGxVUW1kRGZTOGRnZWpPU1dMN00rdVpDNGxZcmI1VWVNVWtCcnVB?=
 =?utf-8?B?TDdqblA5NGtJYnpRTkxVbFpmQnZVSWM1RzRHb2NBUDRhRGJBVERWVFFzRUZj?=
 =?utf-8?B?R01JdTE0ci96aGVkRllLVExlSEkvS3E2WTRPS1ZjYzBua3h4TE5TTm9NOHRV?=
 =?utf-8?B?Qk05WVdyZ04yNjlpZzAvbUhCWXhqZDhDckhhWVNqb2ZqNjNxVnFqY2VheW9W?=
 =?utf-8?B?US82U09wa1BHRnpnb01PbmJYanlVajVlZDNGUm83OUZhOGNBVGNmbDBPbmxY?=
 =?utf-8?B?dUlma21PTXVaOHZWM0lZQlpmcFgyTStHUFc3Y3hWeVJPL2F6d01UM3ZTaURl?=
 =?utf-8?B?VWVLd3dRM0ZHTVVpa1N0ck5CUmFpeW9IOHFRc01hQ0tDbTloMmhSd2pGcUZY?=
 =?utf-8?B?L3QvUG1IR056VVU3S3FHY1NoeTV2SHkxSDA2Y0REckovcU1kYWpFSEl5b2FE?=
 =?utf-8?B?UzdYblJEZG5jeUlxR1FTVnAyVlIxOXVhZlhRbDBJbUNEYWg2akdkRGNYK1Ar?=
 =?utf-8?B?SFMvWnYxK0xzSUlKR0dWeUQ0dzVCMzBiT2ZHRTBrMTFIdTZiNG9wRitZMWVV?=
 =?utf-8?B?YkNqaTc5Q3l5UzNwOWlvWHVQUnpZcTZTTlcwb1E2SmxTU0d6TUdham9vQWN3?=
 =?utf-8?B?YjZDNWl3MUpFMHBHdmJpaGFuOXJhMU9XQ3JSdUlMaGp3djBNTHVWUjg5VzIy?=
 =?utf-8?B?RnUwZHA4bzExYUNraVZFOWRFVGFVbTV2dHQ3N1YxWDF5ZDhXTGNrd2JpM1oy?=
 =?utf-8?B?Vi9lUTErK0VNbUpTMHF4OTJTTXh0SklnMUNORUNid0h1L1lxQ3JDSHdtK041?=
 =?utf-8?Q?wuBGZaBpAnEre9SbFJp4pXSGGKdQ9Eav?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG16bStBUDM3bE1YbFZ1bTJjQ1RPZGsvVU5BNkowUUErK2Nhc1haOW84SnNP?=
 =?utf-8?B?cjZhV0xJMkhhUjh1RjkyVjF1OFM5c3BuVGx3Z3NxbE1tcDNidG1IcisvbVdv?=
 =?utf-8?B?STFLRG5XcUVjN09KQlVuelMzQTk3K2RzMHdaRExOWCtGblV1RkZuQWJWU01D?=
 =?utf-8?B?aWY3WVcxNHFJQ3c0VURNSDVHZEQ3Ly9GMkFoZ05YeGhtRk9rTmdqR05qZmRh?=
 =?utf-8?B?NEpRc1pBa0NUYjVuaUpqckxJLzFEcmJnSVlIZlFkYVdZb01FdUJNQVlyOEY4?=
 =?utf-8?B?dHdXUi95OEd3a2hFWmxTTks4U3F6cURiMXpTWnhFalFZRXd0TVBYblZ2RkQ4?=
 =?utf-8?B?UVdJWXVlYm5nWkl6Y0dNRUxrcEQ0bnpGekg2VUlvcDkvK2JBZ0FlNStudm13?=
 =?utf-8?B?VmNKYmdvdThuMWRwSzJSSGZxdEZiNEVxQ1lDRVBla3pYZU5sQmEvOW85ZVgz?=
 =?utf-8?B?RTczMDMwZlRWR2FhbTZrN0NVbEhPYW5RaXNkSm84T2hWa0NoYWEyNkxxSkZt?=
 =?utf-8?B?TS9yVzVORHA2NW9Nem81OWRNdkxRdUs3UTN1L0I5QTVHVXpwR2N6SDVKVXpQ?=
 =?utf-8?B?eUViajZlMGltanlJcVFKc2ZqUTI1LytzK1o4WERFWXZUWDZ2b1RLNzVodEF0?=
 =?utf-8?B?SEN2RXpuUEFZaVZDL2NqMWRDZmFubmZuUC9XUFdhNTBMNmtOL0JXa0tkSWk5?=
 =?utf-8?B?WjE4MUdCVjcyNERrdFJzZFM0RVl6L3g5OThpNERCTll0amVLNEFncVlUYVYr?=
 =?utf-8?B?bDAwRkN5UlNwT0ZoTTdsbmcxZ2NrQ1JRayt2VEI5MXVSMFhzUVloRkRpOWZj?=
 =?utf-8?B?bE9CZVpsU01tU0V1WURiaGw5MUs5cjJ5MnRPbGFwMkg4aHJDZ1V4bnhhK0VX?=
 =?utf-8?B?R0VuK0lnRnlwdFZER2ZTaEF1UWZhUXYxZ3JiVEg1bm1USGtuQktSWEVrRjVm?=
 =?utf-8?B?WVdsUzh0TnN1NUZtb1RuWGpjU3F1UloxYTRTd3hQZ1hvOElPNzZhOHluckln?=
 =?utf-8?B?dGY4YXVYVmR1bi9ML29DNXZDRFdIWWR5enVEcmNlWkJsMGtZNnYwQzBUbmxD?=
 =?utf-8?B?S3FCVm1CVUErRWtsak8xa2FUWDkveUpHWm9hOStTOXFVOWowUlhXR3pKMHlS?=
 =?utf-8?B?aUZqQzAyVnJsOWNkVHc5V1VhQ3NJanhvUlJSeDFZTnB3eG9vczlZQllxelQ1?=
 =?utf-8?B?RVp3S3pkNDhFVmdZd1RtbzIxVmlwVmFtUGdZT2tmMkk1MjN5d0gwY21rdm9U?=
 =?utf-8?B?UUcrN3ljZkIxNzZsM2xjazJEdkRoZWFYbHN3T1BZVU5iT1krSUh4M0hPZ2lh?=
 =?utf-8?B?YnlldnkyRnA3MGNmMHJ3VmVrZlJteFNYMm1TaUZVUEdSSmZuaERremxwWnRF?=
 =?utf-8?B?dHpxZ3FOZGlZUG1FSk1MR29heU1CNjNLSEJlWVdBaGFYa3pUUDdMV3QrZ3hL?=
 =?utf-8?B?b0xWd3F2WklDNXhhTnk0RGcvTTJ2cCtSaHluaSthSlZMZWp0RmxFajhXUk50?=
 =?utf-8?B?V1NkQS8walVyaXFON3JQSWY2eGJBZmhCcVNFWVcrQ2J0NndpemswRHR2SXVj?=
 =?utf-8?B?NmxVbzJNbGdFQmZtMWRsc0xXdi9YdGk5UUdjTjFTeFJtZkc0Z0lPdHg3aWJZ?=
 =?utf-8?B?YytlZ1ZuekV1M2ptTy9OcWVrb3JrdXFWTEt3ZlQ1bEZQdEJReklvcW1xb29l?=
 =?utf-8?B?anVDc2NYNmlCVkM1SWkzUkJUVWtYeVFOQWl0bmh3eXhDaHUzVHV5WUQ2cGE4?=
 =?utf-8?B?dUQ1ZUlXTXlKbTA1MzVWYmlKam8rNTVWbTZENDZxREpBVHU5NHA5YXBLOGFL?=
 =?utf-8?B?UDZmbTlrK2t1Vk1ZVFZSY3NkWGMzODN6VUVuTXE1K2xKWllkWDk5emtkRlJI?=
 =?utf-8?B?VjNHV25NVythWlUvQy9IRTdnZEkwNkNqbnBwYkpZb3pucUtuc1pCUVprTXJq?=
 =?utf-8?B?N3dlaUdVR20vWXAyZGFhY2NMd2hZZlVPTjUyOXlNc2J5R2gwM2F0Uk5SSGs3?=
 =?utf-8?B?V25TeHhKekcvbmVzQk1hUDQ5TjFuVjdJRUVJT2k1cGMyeTFheVNNRklYRVdH?=
 =?utf-8?B?YWM5NjM1dEMvc3g1Ykp3VjhtaDZwWFRqVmRxMnBaTzhQaXJ4WUF4VG9BWGNU?=
 =?utf-8?Q?isdfVRWLjdxExW88MowhXxrAk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A6A962111B87148ABE3C4198D7F987E@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf60314-ae61-4cf4-c4ec-08ddfc2ad334
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 11:58:21.8387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuY6laNEdDtm8My49RNMbtF+k/rhDJAQ8J7EserZqx5QI0pRkoByI+iYb7ma7xpjTdXA2xG8m5QxG4FmMqvgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P195MB3108
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

QW0gMjUuMDkuMjUgdW0gMTM6NDcgc2NocmllYiBNYXJlayBTenlwcm93c2tpOg0KPiBPbiAyNS4w
OS4yMDI1IDEzOjM1LCBKYW4gUmVtbWV0IHdyb3RlOg0KPj4gTW92ZSB0aGUgc2Ftc3VuZ19kc2lt
X2luaXQgYW5kIHNvIHNhbXN1bmdfZHNpbV9lbmFibGVfY2xvY2sgdG8NCj4+IHNhbXN1bmdfZHNp
bV9hdG9taWNfZW5hYmxlLg0KPj4NCj4+IFRoZSBiYXNlIGNsb2NrcyBtYXkgbm90IGJlIHJlYWR5
IHdoZW4gcHJlX2VuYWJsZSBpcyBjYWxsZWQuDQo+Pg0KPj4gY29tbWl0IGM5YjExNTBhNjhkOSAo
ImRybS9hdG9taWMtaGVscGVyOiBSZS1vcmRlciBicmlkZ2UgY2hhaW4gcHJlLWVuYWJsZQ0KPj4g
YW5kIHBvc3QtZGlzYWJsZSIpIHBvaW50cyBvdXQgdGhhdCBwcmVfZW5hYmxlIGhvb2sgZGVmaW5p
dGlvbiBzYXlzIHRoYXQNCj4+ICJUaGUgZGlzcGxheSBwaXBlIChpLmUuIGNsb2NrcyBhbmQgdGlt
aW5nIHNpZ25hbHMpIGZlZWRpbmcgdGhpcyBicmlkZ2UNCj4+IHdpbGwgbm90IHlldCBiZSBydW5u
aW5nIHdoZW4gdGhpcyBjYWxsYmFjayBpcyBjYWxsZWQiLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBSZW1tZXQgPGoucmVtbWV0QHBoeXRlYy5kZT4NCj4gDQo+IElzbid0IHRoaXMgc2ltaWxh
ciB0b8KgdGhpcw0KPiBwYXRjaMKgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNjE5
LXNhbXN1bmctZHNpbS1maXgtdjEtMS02YjVkZTY4ZmIxMTVAaWRlYXNvbmJvYXJkLmNvbS8NCj4g
Pw0KDQpJbmRlZWQgdGhhbmtzIGZvciBwb2ludGluZyB0byBpdC4gSSdsbCB0cnkgdGhpcyB0b2dl
dGhlciB3aXRoIG15IA0KdGktc242NWRzaTgzIGNoYW5nZXMgYW5kIHNlbmQgYSBUZXN0ZWQtYnku
DQpJIHdvbmRlciB3aHkgaXQgaXMgc3RpbGwgb24gdGhlIGxpc3QuDQoNCkphbg0KPiANCj4gDQo+
PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMgfCAxNCAr
KysrKysrKy0tLS0tLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
YW1zdW5nLWRzaW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMNCj4+
IGluZGV4IGI1ZGQ3MWY2YTk5MDU3ZDk4Y2YxNTA5MGY2MDgxZDA0NjA4MzZlYzUuLjUzY2UzMjI4
NTg2YWMwZjZhYmZhMjUyYjdjMTVkOWViYTQ1OWM5NmMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3NhbXN1bmctZHNpbS5jDQo+PiBAQCAtMTQ2MCw2ICsxNDYwLDE0IEBAIHN0YXRpYyB2
b2lkIHNhbXN1bmdfZHNpbV9hdG9taWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLA0KPj4gICAgCX0NCj4+ICAgIA0KPj4gICAgCWRzaS0+c3RhdGUgfD0gRFNJTV9TVEFURV9F
TkFCTEVEOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBzYW1zdW5nX2RzaW1fYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPj4gKwkJCQkgICAgICAgc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPj4gK3sNCj4+ICsJcHJfZGVidWcoIiVzIGNhbGxl
ZCBmcm9tICVwU1xuIiwgX19mdW5jX18sIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7DQo+
PiArCXN0cnVjdCBzYW1zdW5nX2RzaW0gKmRzaSA9IGJyaWRnZV90b19kc2koYnJpZGdlKTsNCj4+
ICsJaW50IHJldDsNCj4+ICAgIA0KPj4gICAgCS8qDQo+PiAgICAJICogRm9yIEV4eW5vcy1EU0lN
IHRoZSBkb3duc3RyZWFtIGJyaWRnZSwgb3IgcGFuZWwgYXJlIGV4cGVjdGluZw0KPj4gQEAgLTE0
NzAsMTIgKzE0NzgsNiBAQCBzdGF0aWMgdm9pZCBzYW1zdW5nX2RzaW1fYXRvbWljX3ByZV9lbmFi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4+ICAgIAkJaWYgKHJldCkNCj4+ICAgIAkJ
CXJldHVybjsNCj4+ICAgIAl9DQo+PiAtfQ0KPj4gLQ0KPj4gLXN0YXRpYyB2b2lkIHNhbXN1bmdf
ZHNpbV9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+PiAtCQkJCSAg
ICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+PiAtew0KPj4gLQlzdHJ1Y3Qg
c2Ftc3VuZ19kc2ltICpkc2kgPSBicmlkZ2VfdG9fZHNpKGJyaWRnZSk7DQo+PiAgICANCj4+ICAg
IAlzYW1zdW5nX2RzaW1fc2V0X2Rpc3BsYXlfbW9kZShkc2kpOw0KPj4gICAgCXNhbXN1bmdfZHNp
bV9zZXRfZGlzcGxheV9lbmFibGUoZHNpLCB0cnVlKTsNCj4+DQo+IEJlc3QgcmVnYXJkcw0KDQo=
