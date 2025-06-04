Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F8ACE63D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 23:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8CF10E1FD;
	Wed,  4 Jun 2025 21:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="hsj4wWOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazolkn19010003.outbound.protection.outlook.com [52.103.11.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D57C10E1FD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 21:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRFT++HTWa/J2trQasHDTkwl700LC+tkV6XHQ6zwEVHKD+tiZbxKLwkPFH082F6IkQ8D9nk0zZW8dxM6oTTlYHTX6p4+QTHjA4/4GA+8xOuASGD/oOKPx6dj1w12rSTtiwnQRe8LxUB+wNpYPERWx81dzw/QDAzYoOThTzwBpiwOH3kRSmpZ2vOR1MOV3vRRpAedfXvFhkcAsIKwLjJX/Ys5gephRKjnAcnbDQRVSEZ8ywflfxgWLx9eZzsNYNhxTNn+l/5DKdeJGMphbh/qVTjfRF6wC8TEN1jW8HTNydRuR1rmszsg9WBDmm6Dza+6rZQGNREtVT3MlxWF6lS8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVZLSlxhRdJSK2mqy3ybRHiOiTxR7VPrYODf2QV7k/A=;
 b=FQWaWc9Qmyhx9aDC/DKRA1znV1YYN1+KKkiwlhQdZGSoX4s4OxUqx2c8/qPZe57vWA9PDilzN44vP8VkcvCP7SxzBY9UAG8h8kmQqmwECElOgpU9ELhHImaEYZmfXUBTj8WrNWWcUDWObPOVy1zUzYOyrhW8HaD/SVnuJDr8NgCBNbLzpAYe4B1hC7zm8ADxqnCGoz6qFWwuur2yWOdnKENtP4DV4bvM4AZvOrP+q2LoGI61sG92lrL7d6Y3LTtM3B1nJjkrWpFrWv2SqW0vL0mSJVCoatH5z9c2GPsXvhkVCEQFVBBz04ObopZIe99yrvVg3iJ9+n2JKb1VTTXqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVZLSlxhRdJSK2mqy3ybRHiOiTxR7VPrYODf2QV7k/A=;
 b=hsj4wWObyR1ne4vy3rRaK8OSOT0Guly195xKJ28BJbfUSz4jGiWCp/Esbcuo0x0NMHNi3GurbR2G7Eh3UoYcfqQKKvr710wp6ohXqgIbOqCSHblvXKimvtLKgOFJmHJy3mfy/gPy7RNPJaIiB9ISW/Xn6dRx/QZGBTVtlvihPsnZ1WljudZGAT9BicwhgQqAxIGui8EmAwO7V0E4QvvcrJulJhRpp6DxZKf06/FE2dWvOUXYR7n/cfVQLkihqIGgpM60NAbQTgjMd47GHm4dP6NKWceR/aBgEHQsh4W3DKHWlzvmgATZ74RRsPO+m1/4UCkOnayBd6513WeuP4qKVw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH0PR02MB8119.namprd02.prod.outlook.com (2603:10b6:610:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 21:43:24 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8813.016; Wed, 4 Jun 2025
 21:43:23 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>
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
Thread-Index: AQHby/4dA8oNLnhKakm3U+ZOuvHFDrPvrtEAgAEJQeCAAFCFAIAAuDlwgAD4GoCAAG28AIAAbZyQ
Date: Wed, 4 Jun 2025 21:43:23 +0000
Message-ID: <SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
 <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
 <aEBcCjMWZJgbsRas@phenom.ffwll.local>
In-Reply-To: <aEBcCjMWZJgbsRas@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH0PR02MB8119:EE_
x-ms-office365-filtering-correlation-id: 0f04a5eb-f1c0-45f2-9110-08dda3b0d4c4
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599006|19110799006|15080799009|8060799009|461199028|440099028|3412199025|12091999003|102099032|56899033;
x-microsoft-antispam-message-info: =?us-ascii?Q?EtJVUrO4FkgHWSFtSluTPhYjp8ysEKmw4WerJh5B/KWqymTo5jbhfQA20n0D?=
 =?us-ascii?Q?j60mva9BkrI9Hn8K1Tw2twQvhg29xgk4rZV5k6aIEPeQtURWfweTEW5lDIPF?=
 =?us-ascii?Q?BOA9z5BCSoapNbf3Ueupr2lZ//PjgyjJaQoHI5AteYsmZhX3YAvF96LJkU3w?=
 =?us-ascii?Q?9keOwyTCTz11RRJDg05qHcgU+DBezywZRAoIiwM9nS1s4kraJkliHLNumRuV?=
 =?us-ascii?Q?WtqTTfm0RuGzsQjksB3qY9a5/BcnEMGtY12en1wFXROIJPbVqeADRRHMwnkv?=
 =?us-ascii?Q?RSvDt04eyzOH395JKu0m0kIWpoZY5IiyHUkQnnnFbvDf0XQVmzvjBKYoT4O8?=
 =?us-ascii?Q?TqrMUVztddP5TdQ1T5wqXLijAa0lIDqBE1JszPQBW2hqgd+6IaNWvitCFAsy?=
 =?us-ascii?Q?a/apXUrcxWVk/Utf48KU3bcvirdoduVUEgWdbY5l7M1qHaTCswtFDHJC2ujE?=
 =?us-ascii?Q?t7C07WeFecbtzJW0rNAP52Nv5KAipUOvjonPc+VRqv7hCKdVqGGIryIG4d9k?=
 =?us-ascii?Q?7rb5YTch4uidwMb2nUX8cvbxuK4RMO2vJbnGf1dKWNzyzhsubUUUcZqHR52e?=
 =?us-ascii?Q?fPCSTuIabFlrLBo8ZXIHHqiuQhcKfJ0w2vKAjYzE/pf7NMnPJAddKt92V/9m?=
 =?us-ascii?Q?nD4XE7UMf154272tXOo+Xa5nIrRAD+FlfvusjCOEMve05Q46JG/pngxEU1ir?=
 =?us-ascii?Q?KvgwVSm9ykQ6klICwLKWo01NltMwQqBL8OYi/dSD+kVmFzm05PH/TkbgtItV?=
 =?us-ascii?Q?l/sAHZA4QwwlCxihgKeOPITScvnq02tUy6RxvOPDbyCdv7C7CCxZ0AjdJ6Ta?=
 =?us-ascii?Q?DlO/AnnJWxmL62RwuSizw035ISUQeO6Ux0FAhw4LWexMbqq4wRAfyPOyrSWf?=
 =?us-ascii?Q?Ul3Rg4tmvBdi5IeNyeuWJH3CLcMW8X7UjSfljqTKQ2Mtonp7YzmMIyXpZblm?=
 =?us-ascii?Q?bB5Zv/a1rKG6SNyqbEcVeKYlV8QFraGSFNQVWZCGum2aHm37M5Ak7VSGK7MO?=
 =?us-ascii?Q?vjSaSFQcNd8KA5D+dEV68WOJjITHfv09sCJk93HOnir/HotqZZUgAGLuJ9EK?=
 =?us-ascii?Q?mmJJknNl0d8ItA+D3Qo/filQSvJNfedQYMn3QvgaSX8mI6fRwoo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7f07QgeZ5OADJE1mmSguYrA+zK+agxkVxfksPB2p1Up4/UZrhaIOob9803BF?=
 =?us-ascii?Q?V8Z5HXbJtC6qBITuZepSARO8w9n0CBYZJQSxZKPSXZl//p7wG39KXqo/h6cV?=
 =?us-ascii?Q?/NeWy4mMROIXe7brrJD2in57YRkxpEGudbLQ1c8lmMhGInuPBIxjip2Oge62?=
 =?us-ascii?Q?YPz/WmmYPVLXXZqsen7QkFYBVbYScnocUhS01ypKLvDXMMhzk7ZyKHnuzdLu?=
 =?us-ascii?Q?RAyUKVSgQ6zhLNLol0VMwWLMKDsKe/ykPf8yqlaaQWxbHNmNC9o7zu0f8OF+?=
 =?us-ascii?Q?vvVU50qPRvOWNPYcMo2l4cB+8QzkGHalmDKLRi0ZXkKNciDuynJlRtWXAoPd?=
 =?us-ascii?Q?0Y5D5j4mhY1tGGSPkzFQRFkkbyifiVQRTbqUNXXgUDzDFbKSEnp+eXJkT1J2?=
 =?us-ascii?Q?Y0IuYcjTSA9woFj/fEYgNHQrQ0myeJWY+96Ox5OTVumXRngXA/yqGQmtzu2r?=
 =?us-ascii?Q?04VRkO9VQPqiiMSiF0NwhX20kICEeRzaes/AoNIdinfN0NwBHNaONN5vMR6b?=
 =?us-ascii?Q?QBVDhyncFpHLsfjH1AfgTIrb0zXP9owX9HOJ/27rbuwJs9uSPrmbs7/vHtz9?=
 =?us-ascii?Q?xdKK2K4Uii0uPPhFKxN03mtUtWJKXzT3tTE+OWxIt8Ak6SWS0fJIs0/rQsKO?=
 =?us-ascii?Q?TvIYGSiW7QXEhriilbJLuihxzWS1YmtIo9e7BBDinkqyxWhH5ARg5NtV14uc?=
 =?us-ascii?Q?xXyXToKvswE/i1tL2zSUM80/GKggGMVqKzOmNCmwS7GLmeywRrnyCY9htjSm?=
 =?us-ascii?Q?NQT8B8KUAvPEgXtBJQ6HMtS+WaK+I6A8n3lccVAxnbzdmr4lj8mUM1kMEtvB?=
 =?us-ascii?Q?J2VZuqjhZLFkuBLNXgZPmOZU1DNbRd7h3u668PoRrBTfvRDMME251G9blVm2?=
 =?us-ascii?Q?ELF6h2oarxskX/hitYWcPUEdgIFEPGJxcKnvnNHLfdoBwnoZJl+3Dsk/t3d2?=
 =?us-ascii?Q?aID6vn86PwJWbOOs2HnbQnoGWAFLmU7oWs40s0iq6zMuTjJkVQmiEA1AtIvW?=
 =?us-ascii?Q?bh3cjdiI8+hz67/16yx+ElGBKhH1/DQxjeW2BTNReRhIN67c3qSIGxKdT6yw?=
 =?us-ascii?Q?ExRhGx2xBs0c+wgvboTG4NZJaMBtpg6/tnlJIjtXvG/Vezzxlc1Y2F4GH4BI?=
 =?us-ascii?Q?BRIOlIXPrIzpIGAbfdUuQ1as/u5dXT0frf3Mu+XYYdTlqQvbbem0KiCFMJNH?=
 =?us-ascii?Q?CdtW2+RJEvwuQ2v4ZXI2/SuMlYwju/CeIL3zWuVKCJUtZOZvyEasXqjuN70?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f04a5eb-f1c0-45f2-9110-08dda3b0d4c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 21:43:23.5198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8119
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

From: Simona Vetter <simona.vetter@ffwll.ch> Sent: Wednesday, June 4, 2025 =
7:46 AM
>=20
> On Wed, Jun 04, 2025 at 10:12:45AM +0200, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 03.06.25 um 19:50 schrieb Michael Kelley:
> > > From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Monday, June 2, 2=
025 11:25 PM
> > > > Hi
> > > >
> > > > Am 03.06.25 um 03:49 schrieb Michael Kelley:
> > > > [...]
> > > > What is the motivation behind this work? The driver or fbdev as a w=
hole
> > > > does not have much of a future anyway.
> > > >
> > > > I'd like to suggest removing hyperv_fb entirely in favor of hypervd=
rm?
> > > >
> > > Yes, I think that's the longer term direction. A couple months ago I =
had an
> > > email conversation with Saurabh Sengar from the Microsoft Linux team =
where
> > > he raised this idea. I think the Microsoft folks will need to drive t=
he deprecation
> > > process, as they need to coordinate with the distro vendors who publi=
sh
> > > images for running on local Hyper-V and in the Azure cloud. And my
> > > understanding is that the Linux kernel process would want the driver =
to
> > > be available but marked "deprecated" for a year or so before it actua=
lly
> > > goes away.
> >
> > We (DRM upstream) recently considered moving some fbdev drivers to
> > drivers/staging or marking them with !DRM if a DRM driver is available.
> > Hyverv_fb would be a candidate.
> >
> > At least at SUSE, we ship hypervdrm instead of hyperv_fb. This works we=
ll on
> > the various generations of the hyperv system. Much of our userspace wou=
ld
> > not be able to use hyperv_fb anyway.

Good to know.  Red Hat has made the switch as well. The Ubuntu images
in Azure have both hyperv_fb and hyperv_drm. I don't know what other
distros have done.

>=20
> Yeah investing into fbdev drivers, especially when some mm surgery seems
> needed, does not sound like a good idea to me overall.
>=20
> > > I do have some concerns about the maturity of the hyperv_drm driver
> > > "around the edges". For example, somebody just recently submitted a
> > > patch to flush output on panic. I have less familiarity hyperv_drm vs=
.
> > > hyperv_fb, so some of my concern is probably due to that. We might
> > > need to do review of hyperv_drm and see if there's anything else to
> > > deal with before hyperv_fb goes away.
> >
> > The panic output is a feature that we recently added to the kernel. It
> > allows a DRM driver to display a final error message in the case of a k=
ernel
> > panic (think of blue screens on Windows). Drivers require a minimum of
> > support to make it work. That's what the hypervdrm patches were about.
>=20
> I'm also happy to help with any other issues and shortfalls of drm vs
> fbdev. There are some, but I thought it was mostly around some of the low
> bit color formats that really old devices want, and not anything that
> hyperv would need.

You've set me up perfectly to raise an issue. :-)  I'm still relatively new
to the hyperv_drm driver and DRM in general, compared with hyperv_fb.
One capability in fbdev is deferred I/O, which is what this entire patch
series is about. The hyperv_drm driver doesn't currently use anything
similar to deferred I/O like hyperv_fb. I don't know if that's because
hyperv_drm doesn't make use of what DRM has to offer, or if DRM doesn't
have a deferred I/O framework like fbdev. Do you know what the situation
is? Or could you point me to an example of doing deferred I/O with DRM
that hyperv_drm should be following?

I ran a quick performance test comparing hyperv_drm with hyperv_fb.
The test does "cat" of a big text file in the Hyper-V graphics console. The
file has 1024 * 1024 lines, each with 64 characters, so total file size is
64 MiB.

With hyperv_fb the test completes in 24 seconds elapsed time, with
24 seconds of system CPU time. With hyperv_drm, it takes 34 seconds
elapsed time, but with about the same 24 seconds of system CPU time.
Overall this difference isn't huge, and probably isn't that noticeable
when doing human-scale work (i.e., 'dmesg' outputting several
hundred lines in 0.19 seconds vs. my test doing 1M lines) on the Hyper-V
graphics console. To me, the console doesn't feel slow with hyperv_drm
compared to hyperv_fb, which is good.

Nonetheless, there's an underlying issue. A main cause of the difference
is the number of messages to Hyper-V to update dirty regions. With
hyperv_fb using deferred I/O, the messages are limited 20/second, so
the total number of messages to Hyper-V is about 480. But hyperv_drm
appears to send 3 messages to Hyper-V for each line of output, or a total o=
f
about 3,000,000 messages (~90K/second). That's a lot of additional load
on the Hyper-V host, and it adds the 10 seconds of additional elapsed
time seen in the guest. There also this ugly output in dmesg because the
ring buffer for sending messages to the Hyper-V host gets full -- Hyper-V
doesn't always keep up, at least not on my local laptop where I'm
testing:

[12574.327615] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12574.327684] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12574.327760] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12574.327841] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12597.016128] hyperv_sendpacket: 6211 callbacks suppressed
[12597.016133] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12597.016172] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12597.016220] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11
[12597.016267] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERRO=
R* Unable to send packet via vmbus; error -11

hyperv_drm could be fixed to not output the ugly messages, but there's
still the underlying issue of overrunning the ring buffer, and excessively
hammering on the host. If we could get hyperv_drm doing deferred I/O, I
would feel much better about going full-on with deprecating hyperv_fb.

Michael
