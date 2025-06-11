Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E97AD63C8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 01:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BFE10E740;
	Wed, 11 Jun 2025 23:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="uDOYp/l7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2076.outbound.protection.outlook.com [40.92.41.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59F10E740
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 23:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRQBpwmxHNCDeLIkRMD0vi51qvGhgBwYnHvye0ak9EvWLtp3cw9k62H7gU1XHlWfpOlMjV7vQL7evcqG+HB5GzEETY6K44OnPfl2C+RMCDskInBH1nFsypuTcUKkZf8wYfcDmwrmN6pNc1BvSPbVrfjpyRWvVLhw5RUpDm/VRzZE5vBOg1vi4wI8a13bbIY4ItKJGvGAMaQ025o9nzhXetsnjNP/rv6czWSrj0vbVbnJfQx2oOCBbZ9sBLeBQHyHtkJX9s92k2ZCNUdKjY77XFDY6VFJwmQg8B8UYOgkIUVBqskU09YASYxtT5D98PKcjh0GJMu57ZPAUw56U/Fpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i07YXafGM+D2rVqESTDkkWRAyEq1oE/cEH2CTVZX+go=;
 b=wRT5tgS5ebpGN3wfr7FZ0x20LjS0foLzAH3MRBO2Vl0iPEdSUgISwCT7TogDEofWKdjyoDQ/faqy9kMIIHzpMAVtksqiVOwE2IhWh4vC3doTavSpTnua5RP9d3WKRRqLOHurNwRqraQdZJKYkQfHdRyoJnISs49HrT87tE96uRdD4L8i1EihXN96uOxoSui5Vl0YD2NLyeWv69QbMkm07K8ooDk7CCNZYUu8ahMpkLsWfi39g2beIR6ix6NExdINwVkg6StH7JehH99RutTHvoFyswryHCH0XQia1+SNSKDa4gWmGULLUh29qFmwH4TqtBaR6eGgdZderksY7o/OLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i07YXafGM+D2rVqESTDkkWRAyEq1oE/cEH2CTVZX+go=;
 b=uDOYp/l7EK1cmm3NdAXnRJj36lyH0Eu1yS8OYK5wcbexhRebohXROLmMMpLxaIqLevzV2aGbzc+3yUf+OuWKZVbT0zrwJAcDhOmfbh/Jw1QiHvpd0pV8VfRuhFl6sDcj+5kujg38YCPXCSsJ3QCQ9IlWYNmeZVX8msYh7H4LXzi760hP/jFBoAtNQEwVcD8vpVV9JN3UdW7Ji+/NhkhJ4KzYgdG0ZnZjW81uWr6vrg5sxD0FrbuTQCUaJNBpnjtNJ52/kiKSJWT/2baztOJvRZfVmgETFP2tmDCs9uFrLUsB0yUg8r7hYIFCOZ0ltBB5VeyQnBOCry9co+oiG14Cfw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB6553.namprd02.prod.outlook.com (2603:10b6:610:34::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Wed, 11 Jun
 2025 23:18:02 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 23:18:02 +0000
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
Thread-Index: AQHby/4dA8oNLnhKakm3U+ZOuvHFDrPvrtEAgAEJQeCAAFCFAIAAuDlwgAD4GoCAAG28AIAAbZyQgAEy0YCAAB38UIAJ0FOA
Date: Wed, 11 Jun 2025 23:18:02 +0000
Message-ID: <SN6PR02MB41579713B557A32674252865D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
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
 <SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB6553:EE_
x-ms-office365-filtering-correlation-id: 8daafcc1-e114-4c4f-5805-08dda93e36a1
x-ms-exchange-slblob-mailprops: iS5pQZgsAQCkRkOLrFZHmAr0JELdoGfPtujHw4I6FbTXLsgE7Haj1PKxl2u6EE+EEg4wTPDgqqTchmctohFwqqOCSGgI+QaTj7iRXjJ0Xku6ErpLClUW2QFI5ZhmbO/In8oHIrOMJJO8eqKycyIhXIS5O+HwACWwxHO+QtMajI01B7q0XVa7gHcSTa/CtFGBvBxb7dykaIZuFHa6GmKIIfYPns0PnCI26u6DBHvV+BAvDF3OlpTBNJ8ZKHywXvywa0YK22QX7a3fHgRT18JWDvl5ML2tuwZHUnFduyxmND+ee1BTM/TFPl/AD4xbED4bE1MdoJIRASBqX3kwtGZN4N5Ny4d2hXxUztzojU88z9hjsShmE9qFwAHLq9SWz/KO+smY701zsh4sy41vuF0JkqWQawa0UuBOUCd8e3RYYk9pMoes5Y82X7EyfvMRGNCZx40TOxKtSpqebXRsAPDZE7vDbFUcly1LGAxZzN+waKAN1+QHVx+zMexTILF2nZDPX3mxTqIaW5EfTn3RISPQnWhrLWsO9oeGkT2dlt8BKj0Q3ST6UjU42aPgL0NVM8ez0FcuusRzEaeG6j+XIgzd0/MzGIPuaPmS2yDHnLepVKxcQi235jKfa5WIaMsNjkhJSaucUoUDDzH8T1GFUIe6LNy+MQGHSfY8HPHuTM/j/lz2VIE0qoE8u98o05zJJjUCPy3O5YfEOZemaq/AIC1fX/gPqpekO9mp1dquRJ5SbulZV9n4bm6oJvwtW+CA4eDXIiS7wGg15Xovsa1FeKkg0Wn3jnTullu6lzaw01my4O+Ngd2ojVt/4BthannSvxbP
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799009|19110799006|41001999006|8062599006|8060799009|1602099012|52005399003|3412199025|4302099013|440099028|10035399007|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?f7cQcZWn4SkSC+CJK6H8BbC22uQSZtRs0FRbc0fxHXnegNcULK+Wj+i0BdJE?=
 =?us-ascii?Q?dxhHgBq5RHZMDsMbbPWQAnsaZ1z+tYRza+VHO8rYWh7hA1o5K4BvTiOffH8s?=
 =?us-ascii?Q?A6q7x/V8nxXdloWtwEFVEqT2FMue3hisgXEA3I+NyDTD/b6XCDjeWvMe5GKI?=
 =?us-ascii?Q?Hzlz7W4SWZU4uHhtMBlZGOJF7Kw/SUf3A7Ldy0YNnjJvle2ux00zNCqWYMwQ?=
 =?us-ascii?Q?1Zs4pnIOvbQRjEALhKgpqYA482cuqUGUB0524VBav43dynKMe09s8gZdLPXT?=
 =?us-ascii?Q?8PrUIagQ9I54UjNXP4eaLjx3DJnjLsDYTrWGdowUVd7SezAx8tM5Iqw1j2kG?=
 =?us-ascii?Q?XQyUnSbzCxsmjSeib4qkYNX9U8rFbTrGIjbZ4PJf6HP2jbw78fGW+BfgeoUX?=
 =?us-ascii?Q?JAuTHlsEGE7Snrn2/Nn1XXu+d1XRnuaxvbUhxOfxybRwI805jRDxku4W4tnN?=
 =?us-ascii?Q?ixTlUdq5U9DtCSF6D+Eu4YFs7wXDC+/bR2OsO2jHsBLi7JI29KXe6lNgqlzx?=
 =?us-ascii?Q?jLkdg43zQ4sSJGh0mdd1LLOSrfmuGkL975oKKM9qKhwIiLE1SvZ4mYa3mpe4?=
 =?us-ascii?Q?EJd8OC9eFdMREQ7cT7Yt25abS1eFSYdk+BuSaQ+E83NoNLijbD+tzMPHD4oV?=
 =?us-ascii?Q?OYJBIKXCtM+wCD+3QvDi11t1J6cAbq1P8jVADjVF1B0jGpGs+qo3ru0DvTo8?=
 =?us-ascii?Q?/KNlAeK24CECtdY/W2OGO9GxI80hhkrkcljT77/NWUExRqNwOAK9zF0fINfT?=
 =?us-ascii?Q?3z7QgsHv1wUQIoZO3iOM+L9CNBBejPVVjI60uQ06Gz9cVuWJl9AyFNcG6zTc?=
 =?us-ascii?Q?bRwMEU1bjEkMKeLRT31aR64Glq8b8pzzUEt83/nxq0o6jwIhBNGQRUvWm9Qb?=
 =?us-ascii?Q?ossVHDP1jfpsCD0Fuj4avmI6+nX/Cf4dodDJyD+nskukpVTif9gbi4E7Tm/W?=
 =?us-ascii?Q?wQngh1i4Dqzn6iBcuoYymJUk/aXa9Dl1i+/P/1dcsYI0mXF2jZG3Jd8rE6fM?=
 =?us-ascii?Q?EiYf584UWA6vyNXBf5vceok9Tlu9NU39nBqDNgnJh0m/MNt6veEXqWN8HthT?=
 =?us-ascii?Q?MIUXBuK1QWO6EqobEyrsh/0HMlZrOnLo+hyRy/tbob2oQwArljiTQd/3O2RS?=
 =?us-ascii?Q?VXQ+doKkFue+iDFmE4WZaq6c4GDze2xT9rpCQF5GBfx++RUSyLbA1At+q5A3?=
 =?us-ascii?Q?Ml+c4Q+UCfiYkTme8rDP3RweKfCW3G8uN/+960TGqu5ipZ04M4XhegVYZaiE?=
 =?us-ascii?Q?hobuVwWqS+PZQFMErRXQsjNUbQHk5xEk2prA/vBWJgDnsZQxe0v6n2oH415O?=
 =?us-ascii?Q?dki3fCA0hac0YVFkHIr3yQ0n?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YQxefKfgQ/lJHRoT+t8O2PssOm9mLq5rBZbWTT30zpoX9f3zGwHvis42sJDO?=
 =?us-ascii?Q?rowHQXVdDNNBVzRnsiIt2Wr9UnKup5wU9hG7QqDxca8s/n9mwfBSL7a7+Cgm?=
 =?us-ascii?Q?1GdT4jTqGwuEdcrEsh0ZVrdDkE0k9qvtTNSI+T87hlWwbd44BcBGH889qHQx?=
 =?us-ascii?Q?EqGIEqmIQz8mFHCJkmcvNpSxpAAfvDsHVwKmQln/1t/am19SO6mEoduBEnra?=
 =?us-ascii?Q?94qr7jnw3VFvDd+hK/7bVOp2xfEFEVRUpDCxCZpR+orvxX5coVrlZoNWwggd?=
 =?us-ascii?Q?lfTA/Pd4Uasq168bHpfOkr5QDalrbqpWWiZpYvpoYM2TDjWfsZcHmiaW54pq?=
 =?us-ascii?Q?rhWF9pnEeXTffJPmwMoAj2RrduwPCidY9gvvoRdeo96T6FfnUHDI/EizQbTy?=
 =?us-ascii?Q?PL0bpeYctECi6RcjGgIlAMSKmrNWHYrjB1NOXG5ctMY4+H4jXWm+r38wJGnp?=
 =?us-ascii?Q?g8lt3ZmME0hX1vLpw+Uc2H2fZ/N8VdblXRCvdbq7BE3mxFB7mnM79e0kgCq+?=
 =?us-ascii?Q?p1VQw9wMlf670M6AJx/0YH/7vLp7psWrT6Ff3foqR17IsN/QJplnPgqEAlms?=
 =?us-ascii?Q?K/ELAs8cHzRIPxnxIDaKNgbSqa1ltSkJrZpUk2e19+Ht+bHLwc5lSogEbHk9?=
 =?us-ascii?Q?Q5OOL3U3xd5gkEBy7ncym4zphGJfNHuGcZhabybmutWeE0S8+Snq8Ts0/ldG?=
 =?us-ascii?Q?VTUKwQGWFkVKfnjtOvfJlYU6yHRmmdhhArsDKfoc+ToSAaVozZZmXvONOZX2?=
 =?us-ascii?Q?0UBG/vsgTyk9ypGW42ZytcYSe6tkj579DHXxF3Ed9cm2AJWm2BmjQRYTJnmp?=
 =?us-ascii?Q?iKKjJfWrs0qWEcAySJygqN9K2tnfU7Zqq+BCD2yvKtbqLEa2xWByvny6qgnM?=
 =?us-ascii?Q?J5KW8v1hbpT8kuWRvqPFvCvVCTNJ8XGwEErbMpADAnn/2kyQ3f2Xtzg3I3ai?=
 =?us-ascii?Q?2q/dBUHW7iPH+wlYmsFyaE91YmBedpxS9zxxOOv4aCK157gsi+AQ6ToqeiPS?=
 =?us-ascii?Q?SLNhcyTWIsWWzn5oT+9x9MHPSEUKqN5rE7iisoWuKwQXh4miNTelu8xOjZxL?=
 =?us-ascii?Q?T3U178oAKulQuRbKXV3wCTH/OVLXFc8n8nCIvPyJmrb4EVevgIHD9QNm+2xb?=
 =?us-ascii?Q?sORj74OOqpDB+oiwGS5Ymv4dwN6HrfHxqgy03z/3XZIDu5Q5Xp8yc32i2YDp?=
 =?us-ascii?Q?vrmF/dLEejqKxFQEBXhbiA6Ceibd34cKMQtZhq+ZoWJM0ndXaqSOK5Gm14M?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daafcc1-e114-4c4f-5805-08dda93e36a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 23:18:02.5508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6553
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

From: Michael Kelley Sent: Thursday, June 5, 2025 10:39 AM
>=20
> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, June 5, 202=
5
> 8:36 AM
> >
> > Hi
> >
> > Am 04.06.25 um 23:43 schrieb Michael Kelley:
> > [...]
> > > Nonetheless, there's an underlying issue. A main cause of the differe=
nce
> > > is the number of messages to Hyper-V to update dirty regions. With
> > > hyperv_fb using deferred I/O, the messages are limited 20/second, so
> > > the total number of messages to Hyper-V is about 480. But hyperv_drm
> > > appears to send 3 messages to Hyper-V for each line of output, or a t=
otal of
> > > about 3,000,000 messages (~90K/second). That's a lot of additional lo=
ad
> > > on the Hyper-V host, and it adds the 10 seconds of additional elapsed
> > > time seen in the guest. There also this ugly output in dmesg because =
the
> > > ring buffer for sending messages to the Hyper-V host gets full -- Hyp=
er-V
> > > doesn't always keep up, at least not on my local laptop where I'm
> > > testing:
> > >
> > > [12574.327615] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12574.327684] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12574.327760] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12574.327841] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12597.016128] hyperv_sendpacket: 6211 callbacks suppressed
> > > [12597.016133] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12597.016172] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12597.016220] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > > [12597.016267] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
> > *ERROR* Unable to send packet via vmbus; error -11
> > >
> > > hyperv_drm could be fixed to not output the ugly messages, but there'=
s
> > > still the underlying issue of overrunning the ring buffer, and excess=
ively
> > > hammering on the host. If we could get hyperv_drm doing deferred I/O,=
 I
> > > would feel much better about going full-on with deprecating hyperv_fb=
.
> >
> > I try to address the problem with the patches at
> >
> > https://lore.kernel.org/dri-devel/20250605152637.98493-1-
> tzimmermann@suse.de/
> >
> > Testing and feedback is much appreciated.
> >
>=20
> Nice!
>=20
> I ran the same test case with your patches, and everything works well. Th=
e
> hyperv_drm numbers are now pretty much the same as the hyperv_fb
> numbers for both elapsed time and system CPU time -- within a few percent=
.
> For hyperv_drm, there's no longer a gap in the elapsed time and system
> CPU time. No errors due to the guest-to-host ring buffer being full. Tota=
l
> messages to Hyper-V for hyperv_drm are now a few hundred instead of 3M.
> The hyperv_drm message count is still a little higher than for hyperv_fb,
> presumably because the simulated vblank rate in hyperv_drm is higher than
> the 20 Hz rate used by hyperv_fb deferred I/O. But the overall numbers ar=
e
> small enough that the difference is in the noise. Question: what is the d=
efault
> value for the simulated vblank rate? Just curious ...
>=20

FYI, I'm seeing this message occasionally when running with your simulated
vblank code and hyperv_drm:

[90920.128278] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] vblan=
k timer overrun

"Occasionally" is about a dozen occurrences over the last day or so. I can'=
t
yet correlate to any particular activity in the VM. The graphics console ha=
s
not been very busy.

Michael
