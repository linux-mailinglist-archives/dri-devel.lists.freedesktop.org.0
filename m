Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C9ACF588
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 19:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394910E121;
	Thu,  5 Jun 2025 17:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="D7xP9PoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2022.outbound.protection.outlook.com [40.92.20.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4CB10E121
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 17:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dlrvd+KyINaFZyiW3+Zi/t/MRTN1iQXpkfEZNzzWS6Cp6vLfm9OymH2aMlW3YEeQ+RDuNz9s2fjivndIBmtNCjRlnTEPBTMjFvRJryF4/KCVvUhHqMck6nsb+MzuZjhCjJgP0fZA6ixWuwrPdf9jUnTTyxMmP8akgAcJAoLnAe/nW3n930A4FgzY/qCeuX9M8CFKBwu2JH61lcsSk3gZHaHNogI8ABwWckTx35dOSLL7TKy3xC6obb89ZZSSaJHcAOKZmMX+3/SXAqLU7eBDpmSNjohZhIeqYfU7ed5tB5bIeDVIWcAWTVc/vkAQGYUQ+T3trLcoteTIYo7kXm4+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dmW7qfaRT9003apR1Q0yKrxAps9XZ6ku0K4R6f99mU=;
 b=Q2kAPP3XNPaZNsJ2Mfw6hrJ3KDthWi9SNhP0qx2VgMY/oMD+c0rQrbXzAS4LEiiC0cFPemOtJgdlB/6+fnsJIsOOx8tHGQk7izqc6GQG2iPebC2y0YnTrCp49L0Dz94v+vOetwjPlF1FRot4D/aM5yYYZoGjU/8pWreY4tr0LZmE1olKd8HKqZndF3EqpzeJTseCj6PbuYRj5Whi4vJLxr20+8S213I59sJqnkITGcWkP/QlpxTBlgWLHlBRZrJZM+vcxtQ7GYk5v2giq5vF7nFfHz1+A0w+zMtwVsN5HF9F62XQcIHkxbopLbAmTG2CtPfohHqRJwbjEqVjWdADZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dmW7qfaRT9003apR1Q0yKrxAps9XZ6ku0K4R6f99mU=;
 b=D7xP9PoJNDckhPwfpj/n2iy+kYqch6/EhzgYOpiH8UOPxI7XwSMkzhdOw+l/jqhxOLiP/LrzHxdCo9dH1zwuf+qY7PVQz80H5uwxdWf/Cnwt/zMe/jMY4amB5wPpc3XfPzRMjaHxTzgp8K4GYx+UFnaWc71WPp+d676nEAG8EvW5Gchd9KYeK4KQRdInotti/kkrg0pdT+9wS/4WMkKFlQY9b2fPBk0TRwn7lQMaC6TssJMOL2DX1JGuqS5KNJwWEvPrds+mVzZyBUGXVphhzB8P6FYAr4kR4DO5wmxzLXWgoVv+wEHf4jMFPg/uS1uJEuBFgWLtwZl5uHiOSGByyg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by MN6PR02MB10728.namprd02.prod.outlook.com (2603:10b6:208:4f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Thu, 5 Jun
 2025 17:38:57 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8813.016; Thu, 5 Jun 2025
 17:38:57 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona.vetter@ffwll.ch>
CC: David Hildenbrand <david@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "deller@gmx.de" <deller@gmx.de>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
 <decui@microsoft.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "weh@microsoft.com" <weh@microsoft.com>,
 "hch@lst.de" <hch@lst.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: RE: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
Thread-Topic: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
Thread-Index: AQHby/4dA8oNLnhKakm3U+ZOuvHFDrPvrtEAgAEJQeCAAFCFAIAAuDlwgAD4GoCAAG28AIAAbZyQgAEy0YCAAB38UA==
Date: Thu, 5 Jun 2025 17:38:57 +0000
Message-ID: <SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
 <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
 <aEBcCjMWZJgbsRas@phenom.ffwll.local>
 <SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <154aa365-0e27-458c-b801-62fd1cbfa169@suse.de>
In-Reply-To: <154aa365-0e27-458c-b801-62fd1cbfa169@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|MN6PR02MB10728:EE_
x-ms-office365-filtering-correlation-id: 7570987c-c0e0-4b12-73bd-08dda457d99e
x-ms-exchange-slblob-mailprops: Z68gl6A5j2+3oou7nEu68O8SUMcwyYgVqvScVLTWrmPvIdxFwEibVrZXrqENYM4vQ8JkTeBLmVTAgnbphmiabHpYGEhC+BPYU5Ep1wxcy7910Aw7qZyUA0Jjdj18gQR2cIADeG/sWB3rmBOvLHTo16R/ILMqogOjuiGh0LZHg70LtmP6boW22nVh9PXma6Sou1B77F4lp0IBRdp0RVu3SI5FSoYUAlEv567XlunI9lxMLbwGBkQXWzhTH+H1GPGAQKcWsutQhRlphoaHWu0gtIx7r3jwNQSY+D5tLnxiRicZ75l+b6M1pM6JiGzdq8zul6eRrWdRqe8Mqksumv1rHKauAXL6bbw1p0nArafpA/AXfarBaWjGvXqohl9AitGaPomtnY8S3ThJKs1gpK2Dy56Mvby3bGKM80khKtDGULqynea4VW6KOTdbbsABuDuSc6w+0o0ZkAK2SsarP7Pav4evjeVIVXeWXc2l/6EDtnf/rG8xcg2jxIqqYY6CwzK2GOMK+3x6ctQcDLu2Z3az/bfOUZ9YGAAeVrJp8B1GxMajC4VEqDYoK5Os8HIR+BfllWZkg1ZMYTJG4bV6vD5k8AumWlUBfI2nQKuSjxXbipMVTFhACpuzkCQbnu/W2TwA3TOEcIOX0wkwN47hFM3PWcBGrE8xnk/qnRq5c37CsFte+otyIeEkyuYaxPktwIwMAOTWJgJG/n9FglG7DZqYXq5rKOujMLMdRIhVQpU3eLlrwJr2G3wUiR5gH0y4uaPa7/mAS8ui5TGvNqEmk0u4re0gtueD5Em2jpwkXF23PGu0GN5T/ZcPXrTPqV3HSSlJ
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|41001999006|19110799006|15080799009|8060799009|8062599006|1602099012|102099032|440099028|4302099013|3412199025|10035399007;
x-microsoft-antispam-message-info: =?us-ascii?Q?AqEFkvYIF0wZhks6f3g9MRLtem6IpzkaKlJGjFwWeJMk34ccVC8ACBlgd58A?=
 =?us-ascii?Q?DmYxV5yVTBkiYVRuR79VrCY0//OAyGXHlxco+dYk+tS9jybz5iLPjIUAtrnu?=
 =?us-ascii?Q?tl0ozYgxMsQD14vBc3y/B6kTBafrOs7ZOIWBsFJ1HmRqKDh5zcNAZDwuY+Mf?=
 =?us-ascii?Q?2iRVw+plPrmUaW9m6qvOXX73/OC717uldTK4vgs3VtjIwVpnY8n7E6MlUdEz?=
 =?us-ascii?Q?Fp4CRWzTTiYykL3dFD0UK+jEpzOW9dCTj1lc/ChyWijM469JG2o0O4CNYM48?=
 =?us-ascii?Q?JLu9RG6p7bbsMrHGVADBZtirclaUU6gxMFkdg1PAlgzXZ45bDIDl5UV+9n/p?=
 =?us-ascii?Q?yktb8oMFdX98hhxOBKBADgAQOXab8SWldUL4ldXdFnKeUV3NZpzIrENFXNNJ?=
 =?us-ascii?Q?Rfn6dI1hmOlmT25h7gVgQyCw3hvHzwBPBTwNtU9LypVPWMauziITibQjaE4q?=
 =?us-ascii?Q?i5K/qaLpMVOWYjok3WL6Mc01JxVRqNQtGcO0KJDoacLBm+n/XKK2OYqpElcM?=
 =?us-ascii?Q?RrN7ZOGj7IT40XUqKx8OC2srWk7QAmvTW4V3jU7KzQwMdO4cRDwABrYI+t4B?=
 =?us-ascii?Q?CjqCi+hflLz9e6/VhInioXhN0FlG3l79Ju8UhrmncPlZ/FMgguTkl7i6u1jD?=
 =?us-ascii?Q?H36L5wpznjnYmpqJUXvvdSnA86TyA39zMEhsY+r2qfRDndPPzYb+b96QB0IW?=
 =?us-ascii?Q?MyMsternfi/EYvzTws+8aG/jY1bvIR8GWylMMV0+oc2YUuOkhi3vTfSF15+b?=
 =?us-ascii?Q?FvN153xxGkcFi3R88VMvOhKS51id0jK3jyoG6+3w5G7aveoMrd7IVMhpPgoK?=
 =?us-ascii?Q?WslLxQx/ut8W07JxZmWyDVPRd/QDZeT1PTvNRkwkBd9JPwjEt+BicEKdakO4?=
 =?us-ascii?Q?0mzlQNEPEbe+TP+PENC4KBYffS2HFl1Bplj+C8egJfYTOBs9FqAnRKjQlYfR?=
 =?us-ascii?Q?+HoJ0l/Jslb95aogypuE1UnYJxHzMCs2obbSJl0P6532l0DENfQSuFLwKnNu?=
 =?us-ascii?Q?iQQgKVWgQmq7qmFUltF3kpEcg3jyuye/moD2lyb5Mu+sSLoQ3H4doavylOs2?=
 =?us-ascii?Q?hUPsbjO3I5NVkKnpCn/hYJc9nkDo5qLRMtsp09WbdzWOs+zR+NtzeI0aa485?=
 =?us-ascii?Q?E37GYyjIiuNQVTscPzYnHP/5zEfXswkNauEaXdd3rhoDEnZCO0NtVsYeM4lI?=
 =?us-ascii?Q?Uzo+Kf67CyvSvKAWKdv7/HPFl5XFjkye+TFPNHTUBC7Ew/PgNPtAPthnX0qB?=
 =?us-ascii?Q?Y5Rm6XrkkMWnuN1B732feeXuHWjOjMR9DoVGJbFGTw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y9gRyck5KMv3PnHIc2w63LVrEVzTFlrKN10Ydy1Spdu+D5SWpdTzf7f6NLb5?=
 =?us-ascii?Q?NKVG80EJ0RLBvucJHf5Y0zMNEuxrf5Cf0Md7b9udGKfDRdM9OsNDA7XlGolk?=
 =?us-ascii?Q?Lfv6ABcIxZlEbeil/oHW/HSk6zo01ma5OwPFq9kO8kW3iqnk7h2e3rexhiEy?=
 =?us-ascii?Q?bLNNlrj6hSgcMU/x3PtAw4rdrNt8flAuPFyhtJbdIyzNuPOf2r/NFJ0pqQi7?=
 =?us-ascii?Q?gZv0qm6b71UAWPqas/ZJF+99s7CyWQ6MUbWQ+91LiEhpf3Ayln37D4k0FVgm?=
 =?us-ascii?Q?dgUGlFImaTMznJAawpD54FkVi6xQ2h2kFt/1s2hZlVstiShyQBX4Q3OdGLSk?=
 =?us-ascii?Q?mBqw692EeBkngegqdYaqMup55dJo1RNuuyA5gJrLCvIHtVlVwp4VhslJVHmU?=
 =?us-ascii?Q?/5vN1sWW8A7BYyrGF/SUdtBQJGNerW/u6Y/nHjaUAONhvsb0b5OGDN7c3n2o?=
 =?us-ascii?Q?5E+w9S9aUNhPjS9tfpDw2/M045hy/QVI1yFjP89K+NVRS6f2GgImghJDnYT6?=
 =?us-ascii?Q?qChn7aV4qSO8dnggYcuRqHWGKOWBG+v3JCemlmvJJxaz0dMt1HVPFB/8XeBB?=
 =?us-ascii?Q?OPTaL7CduupEzBe5W2fo1qiuLoaVre3jMlvALsxXlNcvPuXhLu92oMfe7/Fj?=
 =?us-ascii?Q?JC3fpWTpqX+AEcRdtlYD7/cwaYKsTAYKFgW0iC8KpGEk01+WHHAh+TK7NHRQ?=
 =?us-ascii?Q?GsR875NaWsHdEJbCE7EKyl3rN+WAcLVKqLgHlQtynBZH93fK4vPeujyv7oqV?=
 =?us-ascii?Q?usEDWOjadW1iVQrxWjAKKxuGqrlOoJQOrQRZ1yauiZ6FCc8AVhragYpz+t5G?=
 =?us-ascii?Q?b+Ewj0aSjBpZ/YSUlTvzZXX6Rr4RupTBmX46F7TGyaGOsRmnOBOpkPy2PX3O?=
 =?us-ascii?Q?tCfcgzzBhbi/5chVSUbAJ2COFyBmqouzyjdbRxbUHt61aBY3n/5LQncGw3Rn?=
 =?us-ascii?Q?hI5+cy3ZtKKXRU9tSSoWebwlixidwNNQk96X2LALEvvJLKJHNT/VlB0iYfrM?=
 =?us-ascii?Q?7BqLUwKBbBVR9Fi3BkFyEnM47RvOcoW08B34jzc/HIwDGLaHb7L5zbc6KVe5?=
 =?us-ascii?Q?fdP/Z2ez6QQVol1kn4Ed25ZQniK8oChGgqHeAWqPNeOtn/pJtiggs+xFDYz4?=
 =?us-ascii?Q?ZlTG1Up6fVDp67kPjIglfb6sVY0oymlkscFtVd+tk4ntg8Q46svZpJuDcXrG?=
 =?us-ascii?Q?x8E4wtHLL6G/TIsSMxXYBALyJ73foPfnYZosoHf+NA0Ddc86D4dBHFLr8oA?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7570987c-c0e0-4b12-73bd-08dda457d99e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 17:38:57.6155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR02MB10728
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

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, June 5, 2025 =
8:36 AM
>=20
> Hi
>=20
> Am 04.06.25 um 23:43 schrieb Michael Kelley:
> [...]
> > Nonetheless, there's an underlying issue. A main cause of the differenc=
e
> > is the number of messages to Hyper-V to update dirty regions. With
> > hyperv_fb using deferred I/O, the messages are limited 20/second, so
> > the total number of messages to Hyper-V is about 480. But hyperv_drm
> > appears to send 3 messages to Hyper-V for each line of output, or a tot=
al of
> > about 3,000,000 messages (~90K/second). That's a lot of additional load
> > on the Hyper-V host, and it adds the 10 seconds of additional elapsed
> > time seen in the guest. There also this ugly output in dmesg because th=
e
> > ring buffer for sending messages to the Hyper-V host gets full -- Hyper=
-V
> > doesn't always keep up, at least not on my local laptop where I'm
> > testing:
> >
> > [12574.327615] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12574.327684] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12574.327760] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12574.327841] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12597.016128] hyperv_sendpacket: 6211 callbacks suppressed
> > [12597.016133] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12597.016172] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12597.016220] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> > [12597.016267] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> *ERROR* Unable to send packet via vmbus; error -11
> >
> > hyperv_drm could be fixed to not output the ugly messages, but there's
> > still the underlying issue of overrunning the ring buffer, and excessiv=
ely
> > hammering on the host. If we could get hyperv_drm doing deferred I/O, I
> > would feel much better about going full-on with deprecating hyperv_fb.
>=20
> I try to address the problem with the patches at
>=20
> https://lore.kernel.org/dri-devel/20250605152637.98493-1-tzimmermann@suse=
.de/
>=20
> Testing and feedback is much appreciated.
>=20

Nice!

I ran the same test case with your patches, and everything works well. The
hyperv_drm numbers are now pretty much the same as the hyperv_fb
numbers for both elapsed time and system CPU time -- within a few percent.
For hyperv_drm, there's no longer a gap in the elapsed time and system
CPU time. No errors due to the guest-to-host ring buffer being full. Total
messages to Hyper-V for hyperv_drm are now a few hundred instead of 3M.
The hyperv_drm message count is still a little higher than for hyperv_fb,
presumably because the simulated vblank rate in hyperv_drm is higher than
the 20 Hz rate used by hyperv_fb deferred I/O. But the overall numbers are
small enough that the difference is in the noise. Question: what is the def=
ault
value for the simulated vblank rate? Just curious ...

Michael
