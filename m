Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71641A709FF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71BA10E5D7;
	Tue, 25 Mar 2025 19:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="xRL0tjgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEF810E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4846z/5QCGZ6ZJmVQ3RxP8u6vIyDBbdN+0KEUf+CPydBdUF4mz6uiEUhV7q49W5VIjGXdSWBMCwdsoEKnpwRYg6/CJYS80L6AAno7cT3H7ftrBdA6vQfWAQVt1AFuGiHGazuSMcR9qjecr1wPZkG7sUbv+tqLWx8crK1nR4uv9dJwYScIL2i+7rNSg0ZVdsVxchv+2/SEMv1DQi3rV4hvDHjpdnTzATTRhnIq69wSFS1RDU3pQ1/mR/zH8DP/TXbFoEOROyW+5I9c1ipv8yzHGuP6ww6Zc7eNAfaf+h4hOrB/RAm61FSdBOkOHCr5e/3JwOaRVekwM74EO8oxyUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDVIIFGvfN1NEEfIchtRRTvmWKF8YTTPEVwGqCE02m4=;
 b=wB9piq126SUR3K5FuOH2Oq0ZRCve6ZlNuFs1uHLhYqld2da12P7h0uqCmIusLyZitQeoX91AgOOLtWK9KnTYIIZm2s9yJohvBO6/tBDOm2LNwHRiKrq/u+q+AV4BAxIJisPncW5U1wWz+vDAMRnzU/un2pO1oNQ4VLXI39E7+3zkB3a5v96TSLT80cL2BulXLxiOTQk/NYfypPU4gMOXWSJ//a56X6B+8teNaV00LrETgXRM2FZy5EPN4r5qwfmiZrL7WP9kceDdm8B51lt4StdFvdiEbXdarCrmFetyZZtBI/J4OqrrbmWTcSB6i2DSpWpl+l8TxB04xOCarqnf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDVIIFGvfN1NEEfIchtRRTvmWKF8YTTPEVwGqCE02m4=;
 b=xRL0tjggz4Iiwg8iJALx1oCxTK4z3VghkH1Ix7r78O5i1yrCiGgwEm6HeHfy7pe6VHXs7qjVpkvXZtZqHpXmbflLWamfhMs6iLoaOP3+IuySQ9dxvFgTNLUyaObsCsiud1I3fMMFyCMMA7daxJ4EA6u/PyAUT0OfAttIdd3ct27KGQyk7QYFoQL9WsGwTN8EE6+pXFPxA7GlIje/axq2rLZOgtHr9fHUGWYzn8UrxXCZEE/FYi3rKagKdkiV1E+NvZCiTD/Z013zEDQpxjq3DI9bTPreFlX3zMWBYKJoRiBRNgfONsRucUw/Bs9mgZpvOXRXfv0VSfMp5BGH/G802Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB9110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 19:12:10 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 19:12:10 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "rfoss@kernel.org" <rfoss@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "aradhya.bhatia@linux.dev" <aradhya.bhatia@linux.dev>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "j-choudhary@ti.com" <j-choudhary@ti.com>, "u-kumar1@ti.com"
 <u-kumar1@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devarsht@ti.com" <devarsht@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nm@ti.com"
 <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "praneeth@ti.com"
 <praneeth@ti.com>
Subject: Re: [PATCH v10 11/13] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
Thread-Topic: [PATCH v10 11/13] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
Thread-Index: AQHbmedU2XBbXdZi+EaTp+QXEE7Rh7OEP82A
Date: Tue, 25 Mar 2025 19:12:10 +0000
Message-ID: <5895a5c837eb2a7998cd8ffee86abf72c8104e48.camel@siemens.com>
References: <20250226155228.564289-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20250226155737.565931-4-aradhya.bhatia@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB9110:EE_
x-ms-office365-filtering-correlation-id: f1f69784-556a-4df5-0170-08dd6bd0f1a3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?NlNIZmtuSmhIQ0JzcXN4clNRWVZiZmpBY2xQL0NrM1pBcGRSSTZ2UE55WDVG?=
 =?utf-8?B?OCs2ZE9UYS9vSFQ4dnRnOHVvTHpIVmFrc1VrUEg2eUtsa3UrWm1HdXV2MTlo?=
 =?utf-8?B?UHNCNnVmMXE4VGlRZHdneXJhTTE3ajQzdXFJTjFkOWlwL0tMZ0xRT1J1NGZ1?=
 =?utf-8?B?Y0tiTGREMWt2emxmazErVEh0NmltM1RnNVVBeHpFeFRLU0NJVm1VTTJSNnNu?=
 =?utf-8?B?N050OGNkTWd5VmJ6NEpYSmdjL21hNTdXK0NPcXZHQ2VQRytoRFVRZ0ZDTmdT?=
 =?utf-8?B?Rk81NkoxWFNxYXY0bkRRcWpibUk5UWdIYjNDbFQvK3k4M3Y5Wmp6TEtYNmt6?=
 =?utf-8?B?RHRGbUdCUjBGYSt0SXVjZjdDOTFqeElzRExaUjBEVHlhMThIUjRPdE9PSmJj?=
 =?utf-8?B?TkxscWhDa1RkQkl2OEltZXdQM2RMUVJKbyszL1FIdjNYdlQ1U2QrcWRSdC9I?=
 =?utf-8?B?UjRxUVc4VldMMTV1NC8xcHpoa0xpc3FsTUhZZi9PUjhsdFVseVZwQVppSDAx?=
 =?utf-8?B?MjBQTU5hZXBSb2JEUGFnY2dpejVMblBYWGFvMGFNRzBYSGNnY05DaVJPZjdV?=
 =?utf-8?B?ejJXQ29YSTlNSzcyOTY5RXQyOEJvcVRPYzdrNksrOXEvUE8rOW96aGtnb2pH?=
 =?utf-8?B?STdHSnlySWNrd0NWdU5MY1VSejhhS2E5Uk44WlZHZ2pCT0RQMHd5Z2VmUUpJ?=
 =?utf-8?B?TTdpNFVkeUgvT2x6c2lCUHBKYVpsWkE1ZGJpbnRzVmx6U3FGVG9Gc0ZzZWRv?=
 =?utf-8?B?MTNwODRrSmJkYVlOcDViY29qdERxa3NvMVRZNnE5eDVpU0puLzlKYXFTbGFH?=
 =?utf-8?B?bkQ5UXJmSGg5ejBjaTFxM280WUdQaHBFZ3M2c0lWRGV6MFJ6TTFNTUdQSmVh?=
 =?utf-8?B?eHlaWkFLcElBazZJMmxBWXlSOFU1bXBiVU5wYXI0TWZoZVd4a1dOWmg1aytD?=
 =?utf-8?B?Qys4amNudDdtZ2hJUXpkb2FXUHlERXNKZXlmc24zZUhxMmgrVEsyRlNYQzQ2?=
 =?utf-8?B?Z1hYeml4d29sL21HSkUrcE9pSExZWm1UaWkxRW5wZTdWeFpCL3drRVhkYktC?=
 =?utf-8?B?L0xBcE9LeS9ad0pLeU9Rb2hONXF4ZitPQXlWUHRIWHVSMVRPU1RIQ2JiaCtO?=
 =?utf-8?B?eFQwcEtvNDRrSzFtM3RGMHluUkQrUnZkVCtLZDdvakdSMnNxR3ErSDJIeC9l?=
 =?utf-8?B?Znh2dDRsTzY1K2RTeDdVV1IreGxiZHNoQ0trSlI1WHh6R0ZobEgzeHFhTk1p?=
 =?utf-8?B?SFpwQnF6bFIxV1A0b002NEttYXNRQUFob2dyYXM4Wlk0MDNNaWNjNkRNSHM0?=
 =?utf-8?B?RWVkWUFJd09lUlowK1g0UWR0d0hIY21NdzRHQ1B2UC9HRlZ5aHNQWDlXYWRj?=
 =?utf-8?B?ZHhydlM3RTI2bVFldFhvZXdwN00yeWlXRElmYnFRREw1UCtjd1o4OEx5YU50?=
 =?utf-8?B?NzlHanhHdVB0cmxQS3pBVklaV0RPTmZuWCtnOE5zVkZGZHNTa0c0eUZrbloz?=
 =?utf-8?B?M0VuaTVIN3pnZERlUW5ROGxEWVVqM1IvWUYxMEJxbGNsQ2x0UFhJN1hNQkhG?=
 =?utf-8?B?ajFLQUx4bzd0WDV0WTFPcTRRS2U2Z00yQ3ZlZnVLK1ZqK3Z0dnVwbTFjMUJ3?=
 =?utf-8?B?RFNOZ3R6dHM2OTFSSDViaE5yTHVCaG1HUm5qY2UwZ2QyT1dZVnZqWGJjTnpH?=
 =?utf-8?B?dlhsZy9yR0FLdDZFcExoOWpjZjJKeUloWlJVTWpEWmpUZmJxU1hxZXBoNGIw?=
 =?utf-8?B?QjVJU0V5anY0N0ZIN2hjdnNxUHVhUVJ3SFJubHFjTFZxS0RSajJHU3dsc0ZD?=
 =?utf-8?B?d0Z2WGpGNDNJYkR2Ujk1LzlXQXV2RTRjRmFYVXdsQ2xsbmdMZWVlUjlEQVRW?=
 =?utf-8?B?NVlPM29OL0piSnQ4bXlBZXhXaDlVNXVXbWw5SXlEOHozYVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGxESEZ3WTdGVmRlZzh2aVl6bnNERmszN2pCRjBxWWlhZTdMNnF1SmRUNzlo?=
 =?utf-8?B?U3JjZW1OU1hwcE1yMHlIMWZKQkVFK1NnZFc2dWpYL05sQmRNS2dCbnhJL3RB?=
 =?utf-8?B?cVRLbmd6TVlCQWgvLzJyRnBpRjMxbDhaUkxWbVB0Mm5mVzNHcFIxczU3RUF6?=
 =?utf-8?B?WVptS2RCSTNQeXdnMmVJWGRNVjJKT0xNMUdvWVF6MlF2Qk1pYkZ6K2MrT3lr?=
 =?utf-8?B?eEIrclk3VmhrRFZqUHdmSFZPekNTSmxJL2UvYXptVmxGaXZtNHh1aHhyUktj?=
 =?utf-8?B?Uk9IczFHVTVSbTM1N1RCd25SQkJXbHJHWTVVOVFHK1ZpNkN5TlE1MUJXYTc5?=
 =?utf-8?B?Z1FSQWlZa1dnUitVSjVCZG5RR2VPT2VaZ3dpQVVvY3Qwbit0R2ZycFlJRktj?=
 =?utf-8?B?NC9jdHU1ZmZqNlZSQ2E2REU2U1ZJRFl6M0NIKzRnSURZUjJ6VFhHalJiQk1t?=
 =?utf-8?B?cXB6NXRPVzZBUmNZa3dXeWJ1Y04ybTJCNEN0YlpZcTdkbHpncU9uUmxFcnlZ?=
 =?utf-8?B?K1kyazcvUllSYjBZMlRFcjJ3Qk9hR09hK3g5QUpuRi8vS1h4MHFzaUZmL2F3?=
 =?utf-8?B?ckUyK0xLbmVkS29PZEp4R21abVNwMnZIVnk4QTdPWVNKUXc1Yk1HWVF3cU9H?=
 =?utf-8?B?R2tGVnhoOEYwbjhUZGJUMnRjYWRRNGFHZXBIRndrQmJqSUhzek1aMUM0SnhW?=
 =?utf-8?B?NzBkT3pMeUsxeDQ4TEhzV3B3Zlh5elArdkdEWTdSbFFRMnNNWlF2Q013REp4?=
 =?utf-8?B?L3RDYzVMd0UzandKZ25LODZOU242UmVob2dVV3pqTjlXb2hMOWJkeWkvSHpq?=
 =?utf-8?B?WHdkbE1sR1FyQmJGdmNVRUpuZmtKOVZ6eFA2cnE2cVpCREw4V0ZDaENlVmwx?=
 =?utf-8?B?MzduRXA1dWQwTGR2aDVDK2s3eFZHNXhkQklia0YrSmo1ZDNiZU01Rzk4OFBj?=
 =?utf-8?B?bWw5SXpNeWxBczE2bDV0a2xUUEhlOEd5Q2xlQURJS09sNVJUaXlVUVpOdXpR?=
 =?utf-8?B?OGlleElyODRjQ3RzbzNMN1dRNGdzSCtjYXhUN1M0SlorS3ltVURuUFJENG0r?=
 =?utf-8?B?UCtrMks5STBRTmhZNk1LbDhndkJsSmI0ZjdXQS9heVovbnNVMmdYamc4SVV1?=
 =?utf-8?B?MHVOU1VFMWJlQzM0a1dVdVdlOGFnUEZIUlNuMDY5c1d0anp2bjBGR2hpcnp1?=
 =?utf-8?B?WUR2aDIyTVJrWWIvU2lJZnN4L1d6RXNIZmM1UTI0RWFDcVRJeGFtTTA2Vkdt?=
 =?utf-8?B?TEFMRjAzamZtL2t1OEJ3TkVsS3o0RGIwckZweS9uN2J0Q1R0OGNCTkp3MGhY?=
 =?utf-8?B?L1Y0dk1mUmFNSWRGMTVZTHFwZmZ1Um1ZZHdyR2hQTnZyRzIwVUc4a0JBaDJF?=
 =?utf-8?B?STVNNmh1SGFUblI2UnNJcFNsWWlVQmIzZ3VlVi9aS0J4V2JSZHZVZnRnZmNn?=
 =?utf-8?B?Z25XdEx6SytzempQaGd1bjhlL0M0akk5WnhnOTFNUS9PZWZhd2V1V0NvWnNO?=
 =?utf-8?B?aVN2akw3aGxCSXlGbHlELzRrWHJDQy9mdDJpN1M5cjAyaG5KRnVOVU1EMjRY?=
 =?utf-8?B?bE9iaDlnYlJ0M09tVmxLVTROR0N0V25TN1dRMFNEYlFpME5HMzRsaG1jd2RH?=
 =?utf-8?B?ckhLZk9lVjBjNmd1d21seVNjVmo3aEZ5RGYwei9UVkJyMVdBOXJBZFp0QVFr?=
 =?utf-8?B?ZjJ6a0lidlRTVkNBZ3JiNEg5NHFDWDMxcHpXU283aWVqaGFTOTgzbWFyYlFJ?=
 =?utf-8?B?ODlRL0lUYTRsT2VPRlAwMURXeXhkR2RCaUM0Z1orNHkzRzVvMFRTdEJmWkFM?=
 =?utf-8?B?R3pFMkJKQ3RZZHA4QkZXRTRNU1FWY1FNL0ROL3JMeWdKVXFkZkVOZHFKMVZY?=
 =?utf-8?B?dzN4MGZWZ1V0aGJBNEhxdU9vTzlUVGdDZTI5YVNHbEM5WlVKaVg2VlhKTUph?=
 =?utf-8?B?OGh2TlVrbkVJSkJ5Z01sNnlYUkxTL3lPdkFJWEt4dGZKVVpINUhPWm9seWY2?=
 =?utf-8?B?YStSWFd0dTBKdDZINU1OaEZWMFhTTmVBc3gzeER4QlRrNE84VitsYzhNTEpz?=
 =?utf-8?B?aXowanZ6S2VVWXBhaGF2Z1RRRHlaS1NvRTYyc29ObnQrb3QrL2xweEVYS0VF?=
 =?utf-8?B?QmszclJRMTBDeE1sNWNSMTR5bGcvNlVJUFpJdkJRS0FWYXpVU0dqa1FOVkRt?=
 =?utf-8?Q?wVbp+vaJc6dICOSVSzyXd3o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1655A8BA99B06541BA5E542B8E3E8488@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f69784-556a-4df5-0170-08dd6bd0f1a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 19:12:10.7298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxJAnO1/p2xXcShN/LRG6wk4VE4ZPLvxTvLu1gRm6QPqC6rnMZF58Wcy3nvZsZqgLRhBgsfq/HPCFUE4+qMjp0c08xuLMPaC5jy8U1BWpjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9110
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDIxOjI3ICswNTMwLCBBcmFkaHlhIEJoYXRpYSB3cm90ZToN
Cj4gVGhlIGVuY29kZXItYnJpZGdlIG9wcyBvY2N1ciBieSBsb29waW5nIG92ZXIgdGhlIG5ldyBj
b25uZWN0b3Igc3RhdGVzIG9mDQo+IHRoZSBkaXNwbGF5IHBpcGVsaW5lcy4gVGhlIGVuYWJsZSBz
ZXF1ZW5jZSBydW5zIGFzIGZvbGxvd3MgLQ0KPiANCj4gCS0gcHJlX2VuYWJsZShicmlkZ2UpLA0K
PiAJLSBlbmFibGUoZW5jb2RlciksDQo+IAktIGVuYWJsZShicmlkZ2UpLA0KPiANCj4gd2hpbGUg
dGhlIGRpc2FibGUgc2VxdW5jZSBydW5zIGFzIGZvbGxvd3MgLQ0KPiANCj4gCS0gZGlzYWJsZShi
cmlkZ2UpLA0KPiAJLSBkaXNhYmxlKGVuY29kZXIpLA0KPiAJLSBwb3N0X2Rpc2FibGUoYnJpZGdl
KS4NCj4gDQo+IFNlcGFyYXRlIG91dCB0aGUgcHJlX2VuYWJsZShicmlkZ2UpLCBhbmQgdGhlIHBv
c3RfZGlzYWJsZShicmlkZ2UpDQo+IG9wZXJhdGlvbnMgaW50byBzZXBhcmF0ZSBmdW5jdGlvbnMg
ZWFjaC4NCj4gDQo+IFRoaXMgcGF0Y2gga2VlcHMgdGhlIHNlcXVlbmNlIHNhbWUgZm9yIGFueSBz
aW5ndWxhciBkaXNhcGxheSBwaXBlLCBidXQNCj4gY2hhbmdlcyB0aGUgc2VxdWVuY2UgYWNyb3Nz
IG11bHRpcGxlIGRpc3BsYXkgcGlwZWxpbmVzLg0KPiANCj4gVGhpcyBwYXRjaCBpcyBtZWFudCB0
byBiZSBhbiBpbnRlcmltIHBhdGNoLCB0byBjbGVhbmx5IHBhdmUgdGhlIHdheSBmb3INCj4gdGhl
IHNlcXVlbmNlIHJlLW9yZGVyaW5nIHBhdGNoLCBhbmQgbWFpbnRhaW4gYmlzZWN0YWJpbGl0eSBp
biB0aGUNCj4gcHJvY2Vzcy4NCj4gDQo+IFJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFJldmlld2VkLWJ5OiBKYXllc2ggQ2hvdWRo
YXJ5IDxqLWNob3VkaGFyeUB0aS5jb20+DQo+IFJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gVGVzdGVkLWJ5OiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
QXJhZGh5YSBCaGF0aWEgPGFyYWRoeWEuYmhhdGlhQGxpbnV4LmRldj4NCg0KVGVzdGVkIHdpdGgg
QU02MiBPTERJIHNlcmllcyBbMV0gb24gQU02MjUgd2l0aCBzaW5nbGUgY2hhbm5lbCBBVU8gODAw
eDQ4MA0KTFZEUyBwYW5lbC4gTm8gaXNzdWVzIHdpdGggdGhlIHBhdGNoIQ0KDQpUZXN0ZWQtYnk6
IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KDQpb
MV0gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI2MTgxMzAwLjc1NjYx
MC0xLWFyYWRoeWEuYmhhdGlhQGxpbnV4LmRldi8NCg0KPiAtLS0NCj4gTm90ZSBvbiBjaGVja3Bh
dGNoIHdhcm5pbmc6DQo+IFRoaXMgcGF0Y2ggY2F1c2VzIHRoZSBjaGVja3BhdGNoIHRvIGZsYXJl
IHVwIGZvciAxIGNoZWNrcGF0Y2ggJ2NoZWNrJyAtDQo+IA0KPiBDSEVDSzogTGluZXMgc2hvdWxk
IG5vdCBlbmQgd2l0aCBhICcoJw0KPiAjNzc6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX2hlbHBlci5jOjEzMDQ6DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBuZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRl
KA0KPiANCj4gVGhpcyBwYXRjaCBpcyBsYXJnZWx5IGR1cGxpY2F0aW5nIHRoZSBvcmlnaW5hbCBj
b2RlLCB3aXRoIG1pbm9yIGRpZmZlcmVuY2VzIHRvDQo+IHBlcmZvcm0gZGlmZmVyZW50IG9wZXJh
dGlvbnMuIFRoaXMgbGluZSBvZiBjb2RlIHByZS1leGlzdHMgaW4gdGhlIGZpbGUgYW5kDQo+IGhh
dmUgc2ltcGx5IGJlZW4gZHVwbGljYXRlZC4gSSBoYXZlIGRlY2lkZWQgdG8ga2VlcCBpdCBhcyBp
cyB0byBtYWludGFpbiB0aGUNCj4gdW5pZm9ybWl0eSBhbmQgdGhlIG9yaWdpbmFsbHkgaW50ZW5k
ZWQgcmVhZGFiaWxpdHkuIFNob3VsZCBwZXJoYXBzIGEgZml4IGJlDQo+IHJlcXVpcmVkLCB0aGlz
IHBhdGNoL3NlcmllcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlLCBhbmQgYW5vdGhlciBwYXRjaCBj
YW4gYmUNCj4gY3JlYXRlZCB0byBmaXggdGhpcyBhY3Jvc3MgdGhlIHdob2xlIGZpbGUuDQo+IA0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDkxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDg4IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5z
IEFHDQp3d3cuc2llbWVucy5jb20NCg==
