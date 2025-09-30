Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD15BAE26C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 19:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1EC10E61D;
	Tue, 30 Sep 2025 17:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P065e3F+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6410E616;
 Tue, 30 Sep 2025 17:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUpVwJdhQGVoaA0PqVCeqTlfaqqbhJpSWRhEAhjTcttht8OO/2HK8p+WN79WuAng+aL7UEBmeT9IaEXKyFIF+9fYhLfa4RgRmoe0rUfa5XEnCMvcxlKJwo1qz5iG24CU/5F0UPPvjJfI1q8YnTXLiLOFL1aI0qxS9LQdem8uSKFWScZLqVjg10/wPkQOS7Esv42KA52AASlBQDbCE3QgogETSfBISE33HYHg7/ZBbjG9pJx3dHsQyXs0/4uwpYnUsEyppfGshKZ4Tgfmpry5fQd18CdYCUTC01X8tHj1Zo9msZ/wQBqqdXK7IPpeAnWfxuikcnt+BZm5+SMJpQUwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/DQMZmTjc2VID7TX4kuL1QbP73Q+KMYpkhQ+3C5QoU=;
 b=xNRsr9shQB2Hkd0kFhZXvRiW431Jd61dpz5q6YwtrLQh8lZj9RKkY6V22tP6e+G+22Tg+zlAfpOsHCs8YmbZcED+6D29NL4IFYuNsjV1cppJ/e2gy/bRtI78HSeejBTjnpltOsE2qIBlitZJge15rkGasxksO0ZTRIMls7SzHugBk/zrBP7VnN6wSsIz3rqRyk+GnQu7pEk8rNlqRdvBHE8m95v5qNfBapQwvon++qQvKkWdovK+tkMzNgNNmajyl7e6UVQyjfs1bpW4DwdLtxYjr1x3cDR7pyv2ChRuezjAfko/4g9X1fOQOrviOXIBieUmK9Pb9sVHf1zqXTcE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/DQMZmTjc2VID7TX4kuL1QbP73Q+KMYpkhQ+3C5QoU=;
 b=P065e3F+nKMQGBHfUUhC74kQOqA6fpt4TGktTvY9HDli+kfxpLvJmLhsntp8QBghc36hE13FyZZgEJAfw/LVj2Nijsgl//kC+ZdFONAUOyQAT0KiECaY4H99c5DbbwQ4Ysk2LqOqDFe3EYdriclmv/mtRCUzLsZJES/K5y3p27YiQt6A4q4ZEdz8shugvsbnyf3RlgoiHHYk7n7u5/9QkxNaf4Ija92qIcHnCnUd254cyQF+hXkr9BYBlAy+7My42sjFpnbl29+kvXGJUb3VfElnOz7rL6gMrr2XbcJobXt4kgfq8m2pm4pNwokW35msRyHFhvPftGgVB7uWz/gqkw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 17:17:39 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 17:17:39 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v3 11/13] nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Topic: [PATCH v3 11/13] nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Index: AQHcMgyiTbPm6K4MM0yGvQVtGSdCWrSr+CQA
Date: Tue, 30 Sep 2025 17:17:38 +0000
Message-ID: <4733b951415d8b531a297cba860c83b7631eaa82.camel@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-12-apopple@nvidia.com>
In-Reply-To: <20250930131648.411720-12-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ2PR12MB9244:EE_
x-ms-office365-filtering-correlation-id: 1345ad34-910d-474f-7c83-08de004541dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MThSaDNkU1FSOS9VK2xSRkRzNCtNNkdFaXdGeWtKZFZHV0hnc3VSTHNSc0pX?=
 =?utf-8?B?WlFSdXk4UE1Fek9VcGI5dXhweURKN0ttUXJNekt3WGdhQWFKOHRFMEp3SDBX?=
 =?utf-8?B?eGcxcDV2QTE2NVFhTkpRR0ZnL1BiZHc2ckNmSkxqZXdFM3l3RmRJZHZ0bVkx?=
 =?utf-8?B?QVFnWlNEZXhVQVJLNnhWU0JxNmFlTU5mTFUyaEZnTGJMMkt0Rjh6WkRYWHFR?=
 =?utf-8?B?U3ZRMWV4UnNIbTBxUVVRa0FRd2hwcjJPalFJM2djV1MxTERGNDhjTUNpajJN?=
 =?utf-8?B?QlNLVG84bU9Zck1OUmRSVUpSVlA1bE1ydHF6NW13L2liZjFXdlJBWlVibml2?=
 =?utf-8?B?QmFUSm1Wdk5sdHZVL0ZqVUJEeUJIS3phL0NxZFRyT295R0hIKzdWaEoxaGRK?=
 =?utf-8?B?WENlUFpzNm9zbEN3bHBEbmFEdloxTVNQblMvNlB5czFWaTJXaW8xRlQxSDEz?=
 =?utf-8?B?dTEwY3lYZzdtMmhxdm8zOUhodTJkeHVzQzNueDd1RENzdDQyWVRTTVEzSHhk?=
 =?utf-8?B?blBsU2p1MWNDWG1JTFN0SGE2Y3h4aXN1UVlQSVMwRkc3cFhJUVY3c3hvcEFX?=
 =?utf-8?B?YlhOWTM5NXpFN1lBNUxRL1ZGREdsTXJCaTdGM0F4MFZYMDFETFFoNHNRRTlQ?=
 =?utf-8?B?QmdhOEdIL0pNOXQrTUxIOXg3d1Nwc1F2OFcxQzdQQVloaVRDdXlHdkxpNDdi?=
 =?utf-8?B?TGVKSDkxanFvMXJ6WkQveURYQkFocm1ycmNMY1RJdkxzZ08wR3VLV2tIT0ZT?=
 =?utf-8?B?RXlDelVCSFY1Uy9Pb2pzNy9OQUxoVGJvZmMvREhFc0l2aWVoK09SYTRjZ1hn?=
 =?utf-8?B?dy9ON05ldnZmck1mSlQzaXJkV0lub1dkVVlHcEpoQ0NCeVZCRVAvdFZ5WlJX?=
 =?utf-8?B?Z2h4SzZDUXhFRjZ0b1JwYmFGdVVtdjJrZHFrOW1iT1JxaytmOTNZTGVmNnEv?=
 =?utf-8?B?TzZ1UTZmYXBWcjVRR0NnVnVVWlNFdUZiZm12ek54OFQzMkhXcHIrT2VPQjFE?=
 =?utf-8?B?cVljejk2a25yQjZieDNndXR2V1lxSDVCQzFjSGRUeGFyVE55V1JoN1VJOVEv?=
 =?utf-8?B?SVFsUm9lb3lhcUdVbkI3MTRJTGRyZU15ajR4WnJLbVBlZXlIWnkvWXgwTVZs?=
 =?utf-8?B?MW92Y010cXRQZE03dCtIemtmaUswZVZ4M2xmbkMvVkhwM2MzNDVvRFZPUXNh?=
 =?utf-8?B?cFZwTTBRU3ZQOFpGNG9PZjhHN09rckVwY29ReTRHTUNMUlFnMlpVTWRLRFd3?=
 =?utf-8?B?N05SZWlualJlTnJPSm9pVER4TGhndWhxa2RDVDk0RVd2dWE2RHMreEFORk1G?=
 =?utf-8?B?MXFha1I5OVZmaDNYRk40Sk14WHpRODlDMDFmRkRzLzU1U3VuaFFQZ3V2elFa?=
 =?utf-8?B?QVc3cjl3VkcrSHJZaktqUlBYU0RXWWlhNmVZZnRYSFBHOEJNbGlsMjdJNHpu?=
 =?utf-8?B?K2FQaUhETExVMVRuR1MwMitCT3pUaXdKTk9pQUxNNldwaFJTQ0xtVndCdU9z?=
 =?utf-8?B?RDd1WTBHajBaV0psWW9vVy9GUGZqU0FmdXBld2F1b0drSHZ1RHdEVWZ3Q2c2?=
 =?utf-8?B?MVh4UFJuSWpxWE5BQTNuNGJWcTE0NjZlVWVoTFgvNUhZZGcrVmFCYml0K2Ix?=
 =?utf-8?B?Q1RudWRQbHU4cGNIRHhuc1NzUjVXMW54ZTRnTEhSV053QzJDR3lKZ2ZSaC9S?=
 =?utf-8?B?Ums2VGhIekp0dyt5VDJoRlJRNVZDN0x1ZVhpMkN6OWtuWk9Ud2Y4aWRuM2p4?=
 =?utf-8?B?YlpKQVRwNUFCREZIR0J0SE9QS0t1Z0lneXdVTGRqcE54aDFtRzZ3SnFtV0lj?=
 =?utf-8?B?STV5THhmNDZpT2I1TlBxMEduNUxJNG42TlNRNHA4MHkzU3U2U1lqbnIvVEhN?=
 =?utf-8?B?cklLSk4rbm1BSTBlWFdBdEJ2aTZIblBOdVAwaU02LytaRXhSWHhzb3lTdFcz?=
 =?utf-8?B?d2hrSHpZU0ZqbW5XMHJicGF2ellHMXVqTi9Fd2xmZC9WUGNFbXZ4cDVLMGY2?=
 =?utf-8?B?eEJiTDU3RWpQZ2VEOTF3SzZUSVBIRUhrUTROUWZrdlRSNUlFSmk0ckhVR04v?=
 =?utf-8?Q?doHyrB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3JiU0JZaDJBZDlPeXJUNEZhUDBQeHdXMmRWM3BUVVhwVUtad1k5bFNJTkVB?=
 =?utf-8?B?YTB1RWxWYkVPSWVZTlcrd1UyV3JUVVN1LzFaczZXbjNvZUYvdUY4UzJLcVVs?=
 =?utf-8?B?TmtQNXF4MWw0U0JiWFpRWkVKVEZHV04xUXNLazJMZnJWQmRxZjFLT3lkMmhF?=
 =?utf-8?B?d0RUTzlVOFJxQy9IcndvUHJmRHlscFk3c2JMZXNPc043ZVNTc2ZnQ1h4cmI1?=
 =?utf-8?B?YTRhYVRqZFkxQ1FZQlFVRnEwNnExSzYrK0IwUWxBSkhNUEpPay8ySHdGcGNo?=
 =?utf-8?B?bUFuL0RyYUlCemIvR2pwNi80S3FaVXZETGVIbGExbmpNYm16U1h2T3d6bUNN?=
 =?utf-8?B?dmkvaFF2dVFheTlZSnRZejlHdU1Qbi96MGJRcGpNQVFWd0FiNWQ3Z2p5Q0R4?=
 =?utf-8?B?WnIxcWR4UitHQWFKU3dmMlRFbzJZM1BPOVVTMmZuLytON3pTR1g3S0dlcFp0?=
 =?utf-8?B?QnprN2VGU0tiZlR6QVRmeTRqeU5mUDJCbGZMYTY1cEdJbEFOWGxNNTN2ZWIw?=
 =?utf-8?B?dk9zd1lHMkNRaDdLNURhOUJsREpnWE5qM0lETFh3aVB5VjdPS1hkT3c3blA3?=
 =?utf-8?B?bG5zSkNkWDZiWnJUVGI3anhmUnVSQ3RzSGxmaFhiNWg5R0lwaFZrUTNMQ005?=
 =?utf-8?B?cG5mb1VMK3l4V0prWTlWZlZXRm9helZBRnBXWWhSQWVCdURlS2tHaVo3WGVB?=
 =?utf-8?B?ZlJqdzcyTXppRHEzUHhqd3NFM0RKL0ljN1hQRWJNZDAvSkgzRDh1cys2Rkwx?=
 =?utf-8?B?ZXc0aTc4LzJURm0wV3RiT0ticmxvZjl1dXBsNkpwQkIvckhOZmU4MWU0djN3?=
 =?utf-8?B?Q3FTbm54MjMycmhPYUQ1TkszbldDZzc3SEdtWlN0Wi9NZ0tXUmdEbmNZZGdK?=
 =?utf-8?B?YUVBU3RqVXZIR2hySjhwTjNVRDRIRTFLMUtsWktSVlprQXpTVHI5eUJOOUpv?=
 =?utf-8?B?ZUxpM2RFQlIwTksrTmxEZlpCL3BibXRBM21hbWgxM09XYVVaRTVibUZCL21N?=
 =?utf-8?B?cm5PVzd4WFZDVmJLUUtrc3o1QTJuTFFMaGxVQUlNMFloQTVLQzZZb2xKWXFN?=
 =?utf-8?B?YTZHdDRBU0U0NC85OFZQOVQ5cXd1aGlST0NhYm5MenRxK1RhKzFmbVhBREVt?=
 =?utf-8?B?Mm1aNFlzekw0Q1h4azFEUTFCTmhWWnl1TllMSVkyR1VXSkVZTGMyTGtjMGFj?=
 =?utf-8?B?LzJvSXRTZHFwbWVTTlhPTXhpUE1XaW4xd3loblFibm1JWHlRZTE4dExqRWpP?=
 =?utf-8?B?T1huZmNEYVR6MHlHOWxEYzJvZUdWMG9vSGVqcDVrZ1BzRlE1SGRJYkQ0R05n?=
 =?utf-8?B?SlFpak9sU1VnWEE4d01NV0kxUFVwS2ZoTHV5WEhkUHZseUQrWEhkR3NWUGtm?=
 =?utf-8?B?TU5DUmY1dDZOSkhyVnQ5dUU1TkVuL1NNYWZBVWxnMDdMUEdLazNydGZoeHln?=
 =?utf-8?B?OGdtMHdxSThsK1c4VXRhc1FvVkpDNmQ3YVVKSU5BNjFlWFRwZlhVc3FicVJw?=
 =?utf-8?B?cHJZR1MyU0pmWG95TWtVWmhWMUp0cTVOOGYxNEszUTJueVAra254TDNyWWh3?=
 =?utf-8?B?Z0xXUTE0NGtXMDY2RGVoek0ySWkyRkFBVm9EQThWVnRuRWRNRTNRMnhlNjFP?=
 =?utf-8?B?Q25nQXRiSUtibTRvYTlMWENTbDRnOXpjOTNYdEJzQkJYWXA0SWowbU41SS80?=
 =?utf-8?B?WWdzeDMyZTAwOFJ4TGJLMVdMRzlHQ0ZJVDlUamNGSlVZaFZLdFJ5OStHWU4x?=
 =?utf-8?B?UDArTk4vSUZkekZxeVRySFdMWEx0cC9pd2FJOUlsUEFIdndOSmZmU0ZUV3U4?=
 =?utf-8?B?NlZzaFlsbDFpVlRkTXVrT0JuWGVsbmhhT3B6em96UGpxQW52VVBHN0UzZU9w?=
 =?utf-8?B?ZGpheC9aRDVNTUhOeDlGRlk1RTVLbWpteExveVBJQjBJa3pGR3FCTytVb3oz?=
 =?utf-8?B?Q2ozWGk0NjFSVzIzd0M2cVVPdTh3aXc3RFFsUTFUZysreDF1d1JDNGMvSXBK?=
 =?utf-8?B?SUVyK3cvTzUwVnFUS3JZVHV6YitVQmM5VlRsM3p1dEY2WGNSRVJFOXpxaG15?=
 =?utf-8?B?b2p3bGt4VVRHNytXdEVSc3k5L0xVTkdBUE80d3JpME9CQVo0QmhDdFJlZ2x2?=
 =?utf-8?Q?xjz58DETms28blVXcQYkJ50Kk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76E25835C30E694FA27279F7E29D6680@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1345ad34-910d-474f-7c83-08de004541dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 17:17:39.0264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmHfwWCd1ir7dbFJWmfSVqe/ZRgsagFh8eRPvGG9VhjWKGB056W1ggBpRstGq0u4EsN6FdVnRaBSi2ri3aEipQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244
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

T24gVHVlLCAyMDI1LTA5LTMwIGF0IDIzOjE2ICsxMDAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+IEZyb206IEpvZWwgRmVybmFuZGVzIDxqb2VsYWduZWxmQG52aWRpYS5jb20+DQo+IA0KPiBB
ZGQgZGVmaW5pdGlvbiBmb3IgUklTQ1ZfQ1BVQ1RMIHJlZ2lzdGVyIGFuZCB1c2UgaXQgaW4gYSBu
ZXcgZmFsY29uIEFQSQ0KPiB0byBjaGVjayBpZiB0aGUgUklTQy1WIGNvcmUgb2YgYSBGYWxjb24g
aXMgYWN0aXZlLiBJdCBpcyByZXF1aXJlZCBieQ0KPiB0aGUgc2VxdWVuY2VyIHRvIGtub3cgaWYg
dGhlIEdTUCdzIFJJU0NWIHByb2Nlc3NvciBpcyBhY3RpdmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBKb2VsIEZlcm5hbmRlcyA8am9lbGFnbmVsZkBudmlkaWEuY29tPg0KPiBSZXZpZXdlZC1ieTog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCg0KWW91IGRpZG4ndCBtYWtlIGFueSBvZiBt
eSBwcmV2aW91c2x5IHN1Z2dlc3RlZCBjaGFuZ2VzLg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1
L25vdmEtY29yZS9mYWxjb24ucnMgfCA5ICsrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L25vdmEt
Y29yZS9yZWdzLnJzwqDCoCB8IDUgKysrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29u
LnJzIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZhbGNvbi5ycw0KPiBpbmRleCAzN2U2Mjk4MTk1
ZTQuLmM3OTA3ZjE2YmNmNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2Zh
bGNvbi5ycw0KPiArKysgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uLnJzDQo+IEBAIC02
MTAsNCArNjEwLDEzIEBAIHB1YihjcmF0ZSkgZm4gc2lnbmF0dXJlX3JlZ19mdXNlX3ZlcnNpb24o
DQo+IMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5oYWwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5zaWduYXR1cmVfcmVnX2Z1c2VfdmVyc2lvbihzZWxmLCBiYXIsIGVuZ2luZV9pZF9tYXNrLCB1
Y29kZV9pZCkNCj4gwqDCoMKgwqAgfQ0KPiArDQo+ICvCoMKgwqAgLy8vIENoZWNrIGlmIHRoZSBS
SVNDLVYgY29yZSBpcyBhY3RpdmUuDQo+ICvCoMKgwqAgLy8vDQo+ICvCoMKgwqAgLy8vIFJldHVy
bnMgYHRydWVgIGlmIHRoZSBSSVNDLVYgY29yZSBpcyBhY3RpdmUsIGBmYWxzZWAgb3RoZXJ3aXNl
Lg0KPiArwqDCoMKgICNbZXhwZWN0KHVudXNlZCldDQo+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiBp
c19yaXNjdl9hY3RpdmUoJnNlbGYsIGJhcjogJkJhcjApIC0+IFJlc3VsdDxib29sPiB7DQo+ICvC
oMKgwqDCoMKgwqDCoCBsZXQgY3B1Y3RsID0gcmVnczo6TlZfUFJJU0NWX1JJU0NWX0NQVUNUTDo6
cmVhZChiYXIsICZFOjpJRCk7DQo+ICvCoMKgwqDCoMKgwqDCoCBPayhjcHVjdGwuYWN0aXZlX3N0
YXQoKSkNCj4gK8KgwqDCoCB9DQoNClRoaXMgc2hvdWxkIHJldHVybiBqdXN0IGJvb2wsIG5vdCBS
ZXN1bHQ8Ym9vbD4uICBFaXRoZXIgaXQncyBhY3RpdmUgb3IgaXQncyBub3QuICBUaGVyZSBpcyBu
byB0aGlyZA0Kb3B0aW9uLg0KDQo+IMKgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92
YS1jb3JlL3JlZ3MucnMgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvcmVncy5ycw0KPiBpbmRleCAw
NTg1Njk5YWU5NTEuLjVkZjZhMmJmNDJhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvbm92
YS1jb3JlL3JlZ3MucnMNCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL3JlZ3MucnMNCj4g
QEAgLTMyNCw2ICszMjQsMTEgQEAgcHViKGNyYXRlKSBmbiBtZW1fc2NydWJiaW5nX2RvbmUoc2Vs
ZikgLT4gYm9vbCB7DQo+IMKgDQo+IMKgLy8gUFJJU0NWDQo+IMKgDQo+ICtyZWdpc3RlciEoTlZf
UFJJU0NWX1JJU0NWX0NQVUNUTCBAIFBGYWxjb25CYXNlWzB4MDAwMDEzODhdIHsNCj4gK8KgwqDC
oCA3OjfCoMKgwqDCoCBhY3RpdmVfc3RhdCBhcyBib29sOw0KPiArwqDCoMKgIDA6MMKgwqDCoMKg
IGhhbHRlZCBhcyBib29sOw0KPiArfSk7DQoNCkkgdGhpbmsgdGhlIGNvbnZlbnRpb24gaXMgdG8g
bGlzdCB0aGUgYml0cyBpbiBpbmNyZWFzZSBwb3NpdGlvbi4gIFRoYXQgaXMsICdhY3RpdmVfc3Rh
dCcgc2hvdWxkIGJlDQpvbiB0aGUgbGluZSBiZWxvdyAnaGFsdGVkJycNCg0KQWxzbyBJIHRoaW5r
IHRoYXQgdGhpcyBzaG91bGQgYWN0dWFsbHkgYmUgUEZhbGNvbjJCYXNlWzB4MDAwMDAzODhdDQoN
Cj4gKw0KPiDCoHJlZ2lzdGVyIShOVl9QUklTQ1ZfUklTQ1ZfQkNSX0NUUkwgQCBQRmFsY29uQmFz
ZVsweDAwMDAxNjY4XSB7DQo+IMKgwqDCoMKgIDA6MMKgwqDCoMKgIHZhbGlkIGFzIGJvb2w7DQo+
IMKgwqDCoMKgIDQ6NMKgwqDCoMKgIGNvcmVfc2VsZWN0IGFzIGJvb2wgPT4gUGVyZWdyaW5lQ29y
ZVNlbGVjdDsNCg0KQW5kIHRoaXMgc2hvdWxkIGJlIFBGYWxjb24yQmFzZVsweDAwMDAwNjY4XQ0K
DQo=
