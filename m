Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DF8BC6825
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 21:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C31C10E88C;
	Wed,  8 Oct 2025 19:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uMuwrqaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012025.outbound.protection.outlook.com
 [40.107.200.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC9D10E14E;
 Wed,  8 Oct 2025 19:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3hsJrocxEUwwKQoaQM0q+clqcVyxndphOKLgXem30EDR4iC4i0fu6yPYOrsIxwubYibxbk+t3IOWWZ0ume3IsuVyS8UiEzj+BEtAQPd6N+3EFwbZeONXwityL1vIrDr9dQ6D8ljhuEustkZdloIjTJsO7806cefgJbCqg+pmW7HeAuG4xJoLZkM8qcpw2gAWuAs/B5fNT59qToI+FfRXMOn0eTqWNjXspLvfMQsD4dff51uXGfuKFxCRGywMKDFjfM8LKqa/YPut3P5tBX2mj9neT3ux5YbsduX+fmFSP2swPUvHcdplqwEpKnHy3Ro9+hdcPfubTm6nxmGfSN+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJTp8y2HtUxJMzdpOLNlcQv7OWuIJXXQWu2hlpoCtPQ=;
 b=lf8zbm98zLZzpGNbzplF0oCSuSsW7m6xmkTfaLAPAoXIGvj7a9FDktGMLNdVDmnSIk9EBCzDjr+UeXCFxjmcUH24tE0mNBPbuzfzgMKaHL/hPZ6luwfOAPlyp4Fb/Dxt+MHuKsUy/AqqCiDz6LJRxLauA7ImOxEAU6Ses+hp363pRunoLY+toLAAO21P0rvH9cF2SCR6C81z4n8WQF82GCY9pyciEAId5yDFf88lfcIQ9xWZZjjFpymEG7MsaGOZtqivN1OSwbQ2WgRq+Q58Q/yJJYHrmaFCvDaIpjK1wGGoAn6UtE0DpNlnfzaCejlfJKXXSA9xa5umb478BIdhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJTp8y2HtUxJMzdpOLNlcQv7OWuIJXXQWu2hlpoCtPQ=;
 b=uMuwrqaShmznpV0j/Rm8vaIehALNw3Egg/NiT5UPDG40Fuk7YC1OARfJEuk2vH69rYNz0oSk49F57ptS5ZTJX5oLSilkhPvcSWIjjd69RuyhS8BSSiesaywhN6bIUPCtd91b4OTRBvrIYn75r2q1ZR2z+xVNnSsS2nDQ3Nw/3KbUwXsfuYR+6CLCgfz33aVRLoIQwxgIC7Talr8OnRaz6n88d3zrC96OexntUYOL9i/cOH+qDRRbZJsIr/9Rr2gTtihN0wUJvB3RzuvdLk6/Ekb9PQ6Mw4pMgt2qAt9IbBrzNuiFjjTHD2mXI1HxzjLlc8nB1u7g78kBj6F8jVfysg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN5PR12MB9485.namprd12.prod.outlook.com (2603:10b6:408:2a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.21; Wed, 8 Oct
 2025 19:56:20 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 19:56:20 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard
 <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Thread-Topic: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Thread-Index: AQHcOI2dprxl+ZTvTEiJcLAXPLUKFA==
Date: Wed, 8 Oct 2025 19:56:20 +0000
Message-ID: <EF6C8A90-E911-4768-8B44-3750F29C9905@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|BN5PR12MB9485:EE_
x-ms-office365-filtering-correlation-id: 37dd89f7-1e2c-4d02-0880-08de06a4c053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TjRzd1lGU0VUQ2FTM1lwVjdyV1JmMi9xOUx6WUlUcU00dVF2c3U1bFExUkNT?=
 =?utf-8?B?blUvVldKbmxuSzNZRVB2RnBrZUFHN0hwbHVJRVdTTGJhV1BxdVdGUENVQmNx?=
 =?utf-8?B?djZtcElnWXpVWEhnaCs0ZFpoK0t0SVFKc0FielI5dWh0K0lDRk5ZOTFpeXZL?=
 =?utf-8?B?VGM5MWdQWmZFci9zRklvNjRkaUlFd0lDRDVVSVJMTlFzQnU1dzZDNFd1RENS?=
 =?utf-8?B?ekVFME5rWGt3RENSMTdKVXF2ZndqMlhlNDYrSFZrci9Kb3J0bXVmTkdaUzFn?=
 =?utf-8?B?T1BXZ1NmVXJCRG9WM2E5djB0L2NVcGlOdmpCYmMzNEhWVHQ5ZUpOVUZwckkz?=
 =?utf-8?B?eUNnRVZLUmRaczNOYTl5MTBabW05VFgrS25KUzM4dVFHNVlPMi85MU0yVmNN?=
 =?utf-8?B?U3Erdnd5TmdxUng2dmFWY0ZGRDh1R2RKLytaMVlSdzRBOFZnU0t6THBLKzAx?=
 =?utf-8?B?OEg1dzNRYTJ1blBIcjNEbnNNNmZHbC81bHlhR0VjZ2xsWG9QSkxIenRlVzF0?=
 =?utf-8?B?TXJPdTNkaEVZUVpWMnh4Q0szdUhRV1NON1Jwc25ldWFqN0JHYkVnMXNLU2dH?=
 =?utf-8?B?b0w2dEUvQUhscUE2QTYrQ3o4aWM1ZElsNGFDWXFiU2pucDZTMm1lbFk3U1Rz?=
 =?utf-8?B?RERPanB4QzBSVkh5cVlQY0Q5Z0RYWUJVWEoyNUJuUEZyQ2lwcTZWaEgybVAz?=
 =?utf-8?B?MFpqRTRVUkcvVFhlNjZBSXlRNldSQ1FuVktVMUJKUS8rbUp1R2tDQVJWTFB0?=
 =?utf-8?B?bUZlRWowaXBzTnVZUXVhUUpVTXBCL3UrVmpFMlRuNE5HS1FsSTlPK3oxL1BB?=
 =?utf-8?B?MEVMQkJxL1ZQYW10clQvZzRLbW9OUFJFcWQyaUFoWFFHVHcxNCtUZzhJcm4r?=
 =?utf-8?B?VGpmR2FBU3VBTnZlWGtROEVsWEVnT1FQK3pvRC9QNmg4SVJlcnFzMlN5OWFI?=
 =?utf-8?B?dXh0d040YnVGUURBeU5QYUpDUVNvaDNjNk4rTmxESk9td3hPNlBNRUVDZ1Fy?=
 =?utf-8?B?Z3pDQXR2RVhza1lTTW0zWmdsNVdyUWdzTVdhOHZ1Rm1rWFpxZ0pQZG5aWmxj?=
 =?utf-8?B?YkxCTjFmeVBPaU5qaldpWFY5b3FqeExCS002MUZYZnZqQnRraGdMVHF6ODg4?=
 =?utf-8?B?YjZjWVlWN0pSZVRjSkcvWFZOa1BCOWFUTXd6ZzJDSm9lN01PcmJWbjRMYkUr?=
 =?utf-8?B?aDc3c0R1SXQzSStzZnZmK1d6a1dHS3IvMTZTUUtjcXVGTGZzVXp3aElBL3ZP?=
 =?utf-8?B?N3QzdW1hYlJHOWR2N00rV2xCSllONk5qYnlwUkh5UUlJZnprSlV4NWgrVzZz?=
 =?utf-8?B?V0lnd2lGbzhZbXJKMjRRQmg1b1cwTWNGYVBlZmVMbmE4SCtvU3R0Q3NxU3h5?=
 =?utf-8?B?WE1xc05UcUcwV1dZREFGNCtGbVlOWGxqM2MwaGY4dEh1ZW10cnhsblJNbGJq?=
 =?utf-8?B?YlBhVmM5SjJlTjR1dU5zSExjMjZsTUhyR2xGVTZ2YlFXMnk0MFN0QW12RUJx?=
 =?utf-8?B?QkRXcWJheVI4UFhTZml3b2JDOGZsbGs1bmdzNm4wNUp0c3d6bGMrOHdiYW92?=
 =?utf-8?B?Ym9qOGc4Q05RcGdaMEF4TVlLNmtrQjBzT21PQ2RnaGo4UktrdFZmYlNUQzY2?=
 =?utf-8?B?OGJPZFQwTmxGWHliTXV5dDdyTFFpc3ZEb2V4cEFIQ1hrNm5tNW9jUnZQL2Zm?=
 =?utf-8?B?dzV0MVVVUmgwS1BTbzBZQXB0cUc2NnpvMjZiaEhBSXVTVUo4eldoR05rSnky?=
 =?utf-8?B?RUhUdFlGWGFKbTVmcmpSM01IRDUyNUZiTXdMNUdpREIyZW9SMlh1UjBPYkp6?=
 =?utf-8?B?dEMwcFFaWDBRNHovVnZuNFMrUzQ0V0FuOXVSRFpmQldvS0ErcHZwSDQvcDhy?=
 =?utf-8?B?WmRFOW1YVi90Y050WDI5SHhSRGVYbnVPNmJ2TlRsOTdQdUw2cjA2cnZxTk5o?=
 =?utf-8?B?TlFlNXpTZzV6Y2N5U1JCb0FZdldxMkhQS1JVNW56bUVDUUFFYVRUbEFic3k1?=
 =?utf-8?B?WXlRY0svVzdROFhvK2hSL3ZnKzZ6RHdUWU96YXdkamk1bFlmWWg0SHo5WDVv?=
 =?utf-8?Q?mhBKg9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWdEVGFER0xKUEpGdWlWNHdEcllmUzk3cGw5Y0xLbGpzT2VSckxuWlZOU1Rm?=
 =?utf-8?B?SDFnKzB4d3VWSG5hTWVLMjJQMUxpZHZmM0JDU3ZUN2R2NXFjS2IydGFTTmg3?=
 =?utf-8?B?NEJaNTVYbjlQWTd1S1lrYWtlaERhdHBxWDdma3M0MFJ3aUMrRHBvSEVyOFUr?=
 =?utf-8?B?eGdvNUZKdExlYzNQUklSNkhpbUlEWjlaWTZRVzI2c3RTc1lYUCtVYUV5RXhP?=
 =?utf-8?B?d0FBMTZWcUc5ZThpaG91dGY5dlN6ZEkzT2pnR1QvMjZ1V0I5YnQ3d2dCeGZy?=
 =?utf-8?B?YnNGNTJGL2RRUGdkSThPTDBZNWRDck40MDV0VFRkWEFIOE5BalEzRkVPMmQx?=
 =?utf-8?B?T0pLbWk0RCtkanhHR2NyVDlZV0VJNi8yS05uUDcrWnl5TGpUVnNKOVp0QXRl?=
 =?utf-8?B?SkRnZ1ZjVkpGd25GRnN5OGZOZThJVVd2U2JuTkRZOTIxV3k0ZHltL2tMclJC?=
 =?utf-8?B?OE8vakVySytUYU1hY3VtcEJobURXMDhvRjhaYUtPV1dic3BoNG1BSjZDUklL?=
 =?utf-8?B?OE1sVU5iOVpGVmxhTUgzcm9PZFRSaytGamVocjg1VHIwVUs3eDZ2TkJzYmNP?=
 =?utf-8?B?RmloWmpJNEVTQnhxTGJTUXhVS1NZbXBpNU1GUFMzYk5KZmNJajI3aDdQSWJi?=
 =?utf-8?B?TFV5c2s3bVlqNmY4dlc4dXZBMzNsK0lPZXFKcmVYTXVYSjF5enNuNHI3OFhw?=
 =?utf-8?B?MGM0QXFlbFprcThhYUhXUGswSU16VG1KYmZ6N241U2c5V2UzbFBQNGRtUE8v?=
 =?utf-8?B?Q04raGFTQUgwVVd1emhZWFQrYzBVcTQ4WkpSYXJGSFNRVVl5Y2ZhREh3RGVk?=
 =?utf-8?B?UmV4RFUxRUtpWVJzNUszeXRSZnZtamQyR084dmEzVWxGZEU5RUpoeGVCcXcw?=
 =?utf-8?B?dzhQdUlXa2cwVWJnWkttS3BBRllWVzNrK1JmZjZFT3AwY0pnL1RiRUhxZnlh?=
 =?utf-8?B?dTA4OTl4Rm9TRmMvZzBqSVdkampKMm8veFRDNDBVbXhBYkNacHdHWTZ1aDlU?=
 =?utf-8?B?VTczRnF2VVdVdjVOdlNvcEZkRzNwTDhqWDk0am5vM2NFQVlRdnQ3ZVlwVEJh?=
 =?utf-8?B?VklROUtoZHphSG9QMlFmRGFodDRSdzRHcGdIVkZmc2NVMVA0Q3M0Tm04Vzk4?=
 =?utf-8?B?WXE1VllhL2MxdzA4T2xIdUN1eTFLWTVuZ0wxWHJiU3NXbWg4S1V3TGhVOG85?=
 =?utf-8?B?eUgvTjZJdVpRWXVQNHZkR1RhcmIrY1FQSlpRN1F0Q0ZuNm9MZlM0SWI3ajBx?=
 =?utf-8?B?UGgxUmxLNWxpVW5NYW9IQUFueFd2K0dZRFY2c1NpQmI3aURhM3hUS2ZndDZ1?=
 =?utf-8?B?QVJRNEJpanJxbFoxTTUyWFkxWkgrN2txRVczc0RnY3lPQ0ZPUktvbW1BekhS?=
 =?utf-8?B?U3orVVNsdEI1cWd1S1BoTjBuUy8vUEhHMUtkVkRwVmNzTFRsL0VaTE1CUUhw?=
 =?utf-8?B?YVc2MTk4UG4vcnZVM2NqaktFNjJCVFEzNDlzTUJ3ZHNnbEhVS0Fsb3V2azlT?=
 =?utf-8?B?RWRJRXRQdTV6UDNSWjR3ODBQeTBTaXNCcGhNdzBMN090d0Vhb0ljTEtsN2t5?=
 =?utf-8?B?bDVWUHhVSFZxa1Azb203NDJoYURQMjFyT1NZMUt5ZUYxV3cwQWk1WFdyRlha?=
 =?utf-8?B?ckNRcFNTRTJQQ005bk45ZVBNcXJMMytsaVR6Z0Y5SWU5VS9tVUI1RER4ODVl?=
 =?utf-8?B?dlJ3dE5UeFhjckJNbXJOMk1CdUhDSm5lMTJWZ2JzTStGb1RTM2E2c1lwZnRa?=
 =?utf-8?B?UUpnalpGY2hHb0NBVzBNM2lmQnA2ZUVVQ1MrSm05QVBGY25mVnRxTEJBSVp4?=
 =?utf-8?B?aVJWWUFFSHNCYXJTSllYUjdOUUdpVGEyRmc4YUZ5QjJXSnF2V1VaQmFld1hI?=
 =?utf-8?B?MnlOZXZGbjNkQTR0ZXFBODMxRU9Qd3ZuMDBjeVFJakJFNGVkV2JkbExlU2hE?=
 =?utf-8?B?Y3U1ZDFhSTNxMk1LMnE4UjhRSjBMY0dJNFVrRm5ucnhzVWk0NmcvVGtiRElB?=
 =?utf-8?B?Y1NMWVF6WGFsTElIVFdWK1BFM2daMHgxR2ZTMGVyOUdNNkxtb1l3bEFjM1BB?=
 =?utf-8?B?ZTN1R3FiTkQrOW92UWVOYjZqdXZXMmJJSHlaMnNMeWdMbjB3a2N1ZU0vdElk?=
 =?utf-8?Q?eA4vbMFPWOo6/HelIphr+ZyyU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <129C18A8EEDF34498091215767DA4BC7@NVIDIA.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dd89f7-1e2c-4d02-0880-08de06a4c053
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 19:56:20.4196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URJ+6cE94zzN4aJXS1j8iuxRkxHE5IwvVCjlie7gUwnXeRXQ7xeOvA/2DfZN1AMO5H0zsSrHiJDULFv0L+puUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9485
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

DQoNCg0KPiBPbiBPY3QgOCwgMjAyNSwgYXQgMTE6NTDigK9BTSwgWXVyeSBOb3JvdiA8eXVyeS5u
b3JvdkBnbWFpbC5jb20+IHdyb3RlOg0KPiDvu79PbiBUdWUsIE9jdCAwNywgMjAyNSBhdCAwNjo0
MTo1OFBNIC0wMzAwLCBEYW5pZWwgQWxtZWlkYSB3cm90ZToNCj4+IEhpLA0KPj4gDQo+PiBGaXJz
dCBhbmQgZm9yZW1vc3QgSeKAmWQgbGlrZSB0byBzYXkgc29ycnkgZm9yIG5vdCBoYXZpbmcgdGhl
IGJhbmR3aWR0aCB0bw0KPj4gY2hpbWUgaW4gaGVyZSBlYXJsaWVyLiBJ4oCZdmUgYmVlbiBwcmV0
dHkgY29uc3VtZWQgYnkgVHlyIGl0c2VsZiBsYXRlbHkuDQo+PiANCj4+PiBPbiA3IE9jdCAyMDI1
LCBhdCAxMjo0MSwgWXVyeSBOb3JvdiA8eXVyeS5ub3JvdkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+
IE9uIFR1ZSwgT2N0IDA3LCAyMDI1IGF0IDA3OjM2OjIxUE0gKzA5MDAsIEFsZXhhbmRyZSBDb3Vy
Ym90IHdyb3RlOg0KPj4+PiBIaSBZdXJpLA0KPj4+PiBPbiBUdWUgT2N0IDcsIDIwMjUgYXQgNzoy
OSBBTSBKU1QsIFl1cnkgTm9yb3Ygd3JvdGU6DQo+Pj4+IDxzbmlwPg0KPj4+Pj4gUmVnYXJkbGVz
cywgSSBkb24ndCB0aGluayB0aGF0IHRoaXMgaXMgdGhlIHJpZ2h0IHBhdGggdG8gbW92ZSB0aGUN
Cj4+Pj4+IGJpdGZpZWxkcyBpbnRvIHRoZSBjb3JlLiBUaGUgbmF0dXJhbCBwYXRoIGZvciBhIGZl
YXR1cmUgdGhhdCBoYXMNCj4+Pj4+IGJlZW4gb3JpZ2luYWxseSBkZXZlbG9wZWQgb24gZHJpdmVy
IHNpZGUgaXMgdG8gbWF0dXJlIGluIHRoZXJlIGFuZA0KPj4+Pj4gZ2V0IG1lcmdlZCB0byBjb3Jl
IGxpYnJhcmllcyBhZnRlciBhIHdoaWxlLiBSZXNjdHJsIGZyb20gSW50ZWwgaXMgb25lDQo+Pj4+
PiByZWNlbnQgZXhhbXBsZS4NCj4+Pj4+IFdpdGggdGhhdCBzYWlkLCBJJ20gT0sgaWYgeW91IG1v
dmUgdGhlIGJpdGZpZWxkcyBhcyBhIHdob2xlLCBsaWtlIHlvdQ0KPj4+Pj4gZG8gaW4gdjUsIGFu
ZCBJJ20gYWxzbyBPSyBpZiB5b3Ugc3BsaXQgb3V0IHRoZSBwYXJ0IGVzc2VudGlhbCBmb3Igbm92
YQ0KPj4+Pj4gYW5kIHRha2UgaXQgaW50byB0aGUgZHJpdmVyLiBJbiB0aGF0IGNhc2UgdGhlIGJp
dGZpZWxkcyB3aWxsIHN0YXkgaW4NCj4+Pj4+IGRyaXZlcnMgYW5kIHlvdSdsbCBiZSBhYmxlIHRv
IGZvY3VzIG9uIHRoZSBmZWF0dXJlcyB0aGF0IF95b3VfIG5lZWQsDQo+Pj4+PiBub3Qgb24gZ2Vu
ZXJpYyBjb25zaWRlcmF0aW9ucy4NCj4+Pj4+IEknbSBub3QgT0sgdG8gbW92ZSBiaXRmaWVsZHMg
aW4gdGhlaXIgY3VycmVudCAodjYpIGluY29tcGxldGUgZm9ybSBpbg0KPj4+Pj4gcnVzdC9rZXJu
ZWwuIFdlIHN0aWxsIGhhdmUgbm8gc29saWQgdW5kZXJzdGFuZGluZyBvbiB0aGUgQVBJIGFuZA0K
Pj4+Pj4gaW1wbGVtZW50YXRpb24gdGhhdCB3ZSd2ZSBiZWVuIGFsbCBhZ3JlZWQgb24uDQo+Pj4+
IEluaXRpYWxseSB0aGUgcGxhbiB3YXMgaW5kZWVkIHRvIGdpdmUgdGhpcyBjb2RlIHNvbWUgbW9y
ZSB0aW1lIHRvIG1hdHVyZQ0KPj4+PiBpbiBub3ZhLWNvcmUgYmVmb3JlIG1vdmluZyBpdCBvdXQu
DQo+Pj4+IFRoZSByZWFzb24gZm9yIHRoZSBlYXJseSBtb3ZlIGlzIHRoYXQgd2UgaGF2ZSBhbm90
aGVyIGRyaXZlciAoVHlyKSB3aG8NCj4+Pj4gd2FudHMgdG8gc3RhcnQgdXNpbmcgdGhlIHJlZ2lz
dGVyIG1hY3JvLiBXaXRob3V0IGl0LCB0aGV5IHdvdWxkIGJlIGxlZnQNCj4+Pj4gd2l0aCB0aGUg
b3B0aW9uIG9mIGVpdGhlciByZWludmVudGluZyB0aGUgd2hlZWwsIG9yIHBva2luZyBhdCByZWdp
c3RlcnMNCj4+Pj4gdGhlIG9sZC1mYXNoaW9uZWQgd2F5LCB3aGljaCBJIHRoaW5rIHdlIGNhbiBh
Z3JlZSBpcyBub3QgZ29pbmcgdG8gYmUgYW55DQo+Pj4+IHNhZmVyIHRoYW4gdGhlIGN1cnJlbnQg
bWFjcm8uIDopDQo+PiANCj4+IFR5ciBjb3VsZCB1c2UgYm90aCByZWdpc3RlciEoKSBhbmQgYml0
ZmllbGQhKCkgdG9kYXkgRllJLiBJZiB5b3UgbW92ZSBpdCBvdXQsIEkgY2FuDQo+PiBmb2xsb3cg
d2l0aCBhbiBhY3R1YWwgcGF0Y2ggdG8gZG8gc28uDQo+IA0KPiBOb3Qgc3VyZSBJIHVuZGVyc3Rh
bmQgdGhpcy4gRG9lcyBpdCBtZWFuIHRoYXQgeW91IGhhdmUgdXNlIGNhc2VzDQo+IGZvciBiaXRm
aWVsZHMgdW5yZWxhdGVkIHRvIEkvTyByZWdpc3RlcnM/IENhbiB5b3UgcGxlYXNlIHNoYXJlDQo+
IGRldGFpbHMgb24gd2hhdCB5b3UgbmVlZCBhbmQgc2tldGNoIHNvbWUgZXhhbXBsZXM/IFBhcnRp
Y3VsYXJseSwNCj4gZG8geW91IGhhdmUgYXJyYXlzIG9mIGJpdGZpZWxkcyBpbiBtaW5kPw0KPiAN
Cj4gSWYgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LCB0aGVuIEkgdGhpbmsgdGhlIHN0cmF0
ZWd5IHRoYXQNCj4gbWVldHMgeW91ciBpbnRlcmVzdHMgYXQgYmVzdCB3b3VsZCBiZSBtb3Zpbmcg
dGhlIHJlZ2lzdGVycyBvdXQgb2YNCj4gTm92YSBlYXJsaWVyLiBBZnRlciB0aGF0IGJvdGggVHly
IGFuZCBOb3ZhIHBlb3BsZSB3aWxsIGdldCBlcXVhbGx5DQo+IGludm9sdmVkIGluIGJpdGZpZWxk
cyAoYW5kIHBvc3NpYmxlIEJvdW5kZWRJbnQpIGRldmVsb3BtZW50Lg0KDQpZZXMsIGJ1dCBob3cg
d291bGQgdGhhdCBoZWxwIE5vdmE/IFRoZXJlIGRvZXMgbm90IHNlZW0gdG8gYmUgbXVjaCByZWFz
b24gdG8gbm90IG1vdmUgaXQgb3V0IHRvZ2V0aGVyIC0gZGlkIHlvdSBzZWUgbXkgZW1haWwgd2hl
cmUgSSBlbmxpc3RlZCBhbGwgdGhlIGlzc3Vlcz8gRGFuaWVsIHdhcyBzdWdnZXN0aW5nIG1vdmlu
ZyBpdCBvdXQgdG9nZXRoZXIsIHNvIGhlIGNhbiB1c2UgYm90aCwgd2hpY2ggYWZhaWNzIGV2ZXJ5
b25lIGhlcmUgaXMgYWdyZWVpbmcgb24gYXMgd2VsbC4NCg0KPiANCj4gVGhpcyBpcyB3aGF0IERh
bmlsbyBwcm9wb3NlZCBpbiB0aGUgb3RoZXIgZW1haWwsIGFuZCBJIGFncmVlIHRoYXQgaXQncw0K
PiB0aGUgbW9zdCBzdHJ1Y3R1cmVkIHBhdGguDQo+IA0KPiBSZWdhcmRpbmcgdGltZWxpbmUsIEkg
dGhpbmsgMi1zdGFnZSBhcHByb2FjaCB3aWxsIGV2ZW50dWFsbHkgYmVjb21lDQo+IGZhc3Rlci4N
Cg0KTm90IHJlYWxseS4gRXNzZW50aWFsbHkgdGhhdCBtZWFucyBkdXBsaWNhdGluZyB0aGUgYml0
ZmllbGQgY29kZSBib3RoIHdpdGhpbiBub3ZhIGFuZCBvdXRzaWRlIG5vdmEgZm9yIG5vIGdvb2Qg
cmVhc29uLiBOb3ZhIG5lZWRzIGJpdGZpZWxkIGFuZCByZWdpc3RlciBib3RoLiBNb3ZpbmcgcmVn
aXN0ZXIgb3V0IHdpdGhvdXQgYml0ZmllbGQgbWVhbnMgZHVwbGljYXRpbmcgYml0ZmllbGQgY29k
ZSB3aXRoaW4gbm92YS4gV2UgZGVmaW5pdGVseSBkbyBub3Qgd2FudCB0aGF0LiBBbHNvIHRoZSB3
b3JrIHRvIG1vdmUgaXQgb3V0IGlzIGFscmVhZHkgZG9uZS4NCg0KSSB0aGluayBJIGRvIG5vdCB1
bmRlcnN0YW5kIHdoYXQgYXJlIHRoZSB0ZWNobmljYWwgcmVhc29ucyB0byBob2xkIGl0IHVwIGFu
eSBmdXJ0aGVyPyBJZiB5b3UgaGF2ZSBhIGNvbmNlcm4gYWJvdXQgYmVpbmcgbW92ZWQgb3V0IHRv
Z2V0aGVyLCBwbGVhc2UgcGFydGljaXBhdGUgaW4gdGhlIGRpc2N1c3Npb24gd2hlcmUgSSBzZW50
IGEgbG9uZyBlbWFpbCBlbmxpc3RpbmcgYWxsIHRoZSBpc3N1ZXMgYW5kIHdlIGNhbiBkaXNjdXNz
IGVhY2ggaXNzdWUgdGhlcmUuIFdlIHdvdWxkIHdhbnQgb25seSB0ZWNobmljYWwgcmVhc29ucywg
bm90IGh5cG90aGV0aWNhbHMuIEFzIEFsZXggc2FpZCwgdGhlcmUgaXMgYSBncmVhdGVyIGNoYW5j
ZSBvZiBiYWRseSB3cml0dGVuIGNvZGUgaWYgcGVvcGxlIHJlaW52ZW50IHRoZXNlIGZlYXR1cmVz
IHRoZW1zZWx2ZXMuIE91dCBvZiB0aG9zZSBpc3N1ZXMgaW4gdGhlIGxvbmcgZW1haWwsIG9ubHkg
dGhlIGJvdW5kZWQgaW50ZWdlciBpcyB0aGUgb3BlbiBpc3N1ZS4gQnV0IGV2ZW4gdGhhdCBpcyBu
b3Qgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGhvbGRpbmcgdGhpcyB1cCBJTU8gc2luY2UgQWxl
eCBhbHJlYWR5IGhhcyBSRkMgdG8gZml4IGl0LCBhbmQgaXQgZG9lcyBub3QgcmVhbGx5IGVmZmVj
dCB0aGUgQVBJIHVzYWdlIG11Y2guIEkgdGhpbmsgQWxleCBoYWQgc29tZSB2ZXJ5IGdvb2QgcmVh
c29ucyB0byBtb3ZlIHRoZSBjb2RlIG91dCBhcyB3ZWxsIGFuZCB3ZSBjYW4gaW1wcm92ZSBvbiB0
aGUgYm91bmRlZCBpbnRlZ2VyIGlzc3VlIGZ1cnRoZXIgcGVyaGFwcyBldmVuIGJlZm9yZSB0aGUg
bmV4dCBtZXJnZSB3aW5kb3cuDQoNClR5ciB3aWxsIHVzZSBib3RoIHJpZ2h0IGF3YXkgYXMgRGFu
aWVsIG1lbnRpb25lZCwgYW5kIEkgY2FuIHNheSB0aGUgc2FtZSBmb3IgTm92YS4gU28gd2hhdCBp
cyB0aGUgcHJvYmxlbT8NCg0KTm8gZG91YnQgdGhlcmUgd2lsbCBiZSBpbmNyZW1lbnRhbCBpbXBy
b3ZlbWVudHMgdG8gYm90aCBtYWNyb3MuIFRoZXkgYXJlIGluIHByZXR0eSBnb29kIHNoYXBlIGFu
ZCB0aGVyZSBpcyBubyBuZWVkIHRvIHdhaXQgZm9yIHRoZW0gdG8gYmUgcGVyZmVjdC4gTGV0IHVz
IG5vdCBtYWtlIHBlcmZlY3Rpb24gdGhlIGVuZW15IG9mIHByb2dyZXNzIDopDQoNClRoYW5rcyEN
Cg0KSm9lbA0KDQoNCj4gDQo+IFRoYW5rcywNCj4gWXVyeQ0K
