Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC7A30256
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 04:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D425010E412;
	Tue, 11 Feb 2025 03:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="OC49bVOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn19011028.outbound.protection.outlook.com [52.103.12.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331CC10E412
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayL7w2ZGibHlFB4uordNaosnLS4xkJ13PuqGm4auaIqbr23eAS1apKSv85LYEQMQYkbLK7m8gLA+P1ZCsKnWO+OBnFhk1T4W1EJDyC0YpjHhV4KttyJYDprOIY0zFptYSL/m84isQ3npQsM2GgW8c/9gz9WMs9GRgH0gwctURRu4IgoGpermK4sLy8U/h7rX8K8ReBqpc2k3Qlgxoc0uQ+P8FiwSfGyHw35bDghms/SuJPx2mBTQYVajxV5vdaoz/TmRRdFkZaOtrEH5/57/bDmxdVGCGjDUfB2tOQAXhPmogqg+nKdoSU3BsyhCxSVvlu2mTSwhD8iDtm6QN9S3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXYDth+0qXF77iVv/VdiJI9mcgUuWg04ycwgnYzioSE=;
 b=cRunaQ94Fl+zzvzjFIOLiIig5D5c8b6/mr1nUUwTPMQEo4QefhZZdADEn/cM5CdVdl3V02nddPSGGBiBkpim5WKdDfG/gqOFKNBqzxg0wxEfANw461OV8oUnC+XCVltbds3Qyd0RtdxRHPLvEU4aNCm+OWyYVI3AqB1wzgGx7C9DSRDbiBg7U4mLyImQRVa7AxAMMPk6bw5QgR50bXZCcbwABApo5Pq20PMiv+rFwmLyn5+oljDtGTuNGdVL7aiYSN1Y2kmxj6X2OubsSSdsAqq6ko8v7xdl+xjFmzqgKmxxsIO+O8k9K3v+CKeyAitLLOaL2SxWpcxLNGOVdUX4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXYDth+0qXF77iVv/VdiJI9mcgUuWg04ycwgnYzioSE=;
 b=OC49bVOHrF6t6LSCv/+QpISeKbpr+882KigE9yr4HlZxc4sCBovRIhkWl4yLQ5rcMiulHYXxCRKz1mZBAMFD+AyB+HDtQbl6hgLSy/gXR5lTK4Y8hJy6iQIPhxsi3PrZ3asdpfrDoZ/tGk6zCBna++C21ehyM145ztO5ZpNXK8mcI6cQlwH5Vhz8PjWau+e87y1ZJwsGu+l6+twnf2ETM8kqZx8B3epix46XIpLy0z2ZdYM3ygTXNGGwGdJiL22FwysgmoRPIir2821bCoAlu8wLhbJxcpQT+w9tQkCSf3PbxqfZk0CuFYzsyxbwhv4cQTyURxU7fngn9GsKA9+QgQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO6PR02MB8817.namprd02.prod.outlook.com (2603:10b6:303:141::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 03:51:48 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Tue, 11 Feb 2025
 03:51:48 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
CC: "haiyangz@microsoft.com" <haiyangz@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "decui@microsoft.com" <decui@microsoft.com>,
 "deller@gmx.de" <deller@gmx.de>, "weh@microsoft.com" <weh@microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Thread-Topic: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Thread-Index: AQHbe03JMSfrBLANP0SDwaGKm7HxS7NAe2OAgAAbBUCAAAt0gIAAH9WAgAC3EPA=
Date: Tue, 11 Feb 2025 03:51:48 +0000
Message-ID: <SN6PR02MB4157CA4DAF488D05EE0EBA34D4FD2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250209235252.2987-1-mhklinux@outlook.com>
 <20250210124043.GA17819@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157B0F36D7B99A5BF01471CD4F22@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250210145825.GA12377@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250210165221.GA3465@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250210165221.GA3465@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO6PR02MB8817:EE_
x-ms-office365-filtering-correlation-id: 6b8c2735-db32-4c53-c17a-08dd4a4f6966
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8062599003|15080799006|19110799003|8060799006|102099032|3412199025|440099028|12091999003|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?IKy2Uuo35iFEgUtQbdzsR443nkvAUfCu+4y0v987JfUP4rUUCskohlZiYt5b?=
 =?us-ascii?Q?H5qdYdXid0fDbmY3fz1eRuoZFBn9j7GBQS8LJywerR3G5Gw3TwbYaOm3zfhP?=
 =?us-ascii?Q?DkBB0861EGYzPi7k6m0XIVwIYssA0s0535OFmkrvzePdWqaLsW//Iypyvd/g?=
 =?us-ascii?Q?lx7D42uhYrP7qTRh63zasHIYqw8fl8MRl84k4W0syfXnUdosesAKxWgEJWMd?=
 =?us-ascii?Q?dBa0jL/WwjbvzRw4NyExYl+I/pZNN/UPp1lyvGBm/JAqb67xOR3Vs0Y+mC0G?=
 =?us-ascii?Q?QeK4nKOAen1UNo+xCGkQdXlXMs4Cm2EqBkdvUfTQcP0O1D+YxrAkSSJHRiHx?=
 =?us-ascii?Q?xVWap1Pc1q5yCi55qdbFqC/9Mun6YHV0m1KKA48fucFrNAK93oNK08T7OYwW?=
 =?us-ascii?Q?rw7nQX+A6r9KYxMRdoAAtcvYGNPel8inaqNVYbX3hWw2ONz3i32aD5fcE2tH?=
 =?us-ascii?Q?1sFhhVrDuhQiSM/IrNdqga21C/wHitXMcJIU8y7DdBtbo87ieeIDIn0n2+Hx?=
 =?us-ascii?Q?n8S5iDj8MS30VSlvlYhjayBwZSi3EgK1Noar9jnpppXtWrm3FIzVQZtBWQT+?=
 =?us-ascii?Q?wowe2LfxKrVuOu+ix+ojz20Oprs4TIPe4qeu3VYXTwFqrkU8TKlRyjiur8/p?=
 =?us-ascii?Q?y1wN2Iqo7Q4/61ee1Teucp+P4D1s0pBBADpJsBtth2DUVcbF8TdiWVK9nKc7?=
 =?us-ascii?Q?anCVp3aOEJ2YaMONV0h75GwY/5LOgCJQ3AO1/T4P1MbAnHAxElly8q2mAK+0?=
 =?us-ascii?Q?kVBj9KuI6fsffjCKunQcQBO78r2QIY9kCGV6RyP3QyUSIfdPkcK7EcHjSMdZ?=
 =?us-ascii?Q?3QqF4ayA9E2HCI2dPpJ+9yZCedZCxi3sreDJxMl5UBqMFtqFiRRe7VAzRzEf?=
 =?us-ascii?Q?vJ5/OWATaH7AzYC2iZzuM9VuFB9+EdBOjDkIT1kfpSuRntaJNNonQsP4SA0A?=
 =?us-ascii?Q?jjuaD9rRYFZtSZdjZ8pUOgSmaB21zVbYVlASrbNg4x2hlz6I2mo5TM6PWBrC?=
 =?us-ascii?Q?Dd5CmuxTQMrN187YzukDC6dGiLsalkBIIHgyWzVaUz6o0M46snDXfJylgx5e?=
 =?us-ascii?Q?Xy9qRgtaH8jHY2UNxHfjeg6Q+RS6nBZwInslRgjfLJ1aHaqteK8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7sk8LnzGTl4m8E6ffIPjeyZ/y5nFHxIbmvNcF0T4OMcg1VvNiBmPL91xviXy?=
 =?us-ascii?Q?uikV3XPqbQFtXI4munlLMipkMbvmmdv8qTonMVa7zmpUXzTPWajspraVcM00?=
 =?us-ascii?Q?06apKVQ5187YP+MR4SAU+zZuBf3EaWme+G6tRmTJ1xe19d9mZaRPBREP11fT?=
 =?us-ascii?Q?jhUWKTYkIu9rlm+qzI94SESD7L42mo4zdMYk4eMO/4VJfylA5GQB+ortXAsR?=
 =?us-ascii?Q?ABnZaGraK+35MUvYxOQlHWvRvOCjyPMhJE/Ok3Wk5TxdO4TIqqoppvnklYKM?=
 =?us-ascii?Q?dDHeWEdP/fc0Gp37NDpI/OVXWUjgRKJ6qlpEPTkMURzjLGjUIePoYWImCNX7?=
 =?us-ascii?Q?Bt1+LyRMtAafikx42nYW6/tKljXmVGBk1vVr/66vieA1FJlC/RLBXyHxrXAJ?=
 =?us-ascii?Q?CKsgF04r9/N6AsuQb6FoNCH4jgHnLzKkZDCQmqV6dXFXRZwWtbXEqNdF0fbz?=
 =?us-ascii?Q?Ld1WgcaDKtG8Yqo3c8JhVs8hGm/rzA3Kdfsy1jXnO74QLBXubA/DXttry+MN?=
 =?us-ascii?Q?MvHfz+lskSNmXAXmKRZMs+A/AYt0SMY8703E7KW/MH77sBEcMdyDGmM0C6Q3?=
 =?us-ascii?Q?S+EZ7jN6bvLdqpMvzieMuu4MaJ5IH7DkxICDMhmtGR6XlJteVt192Dbsog+D?=
 =?us-ascii?Q?DrRoLKvy623WGXPdalaryEA4Imrn4LGbjc3gN/HwPm+qyJXOjTTgdUHfDl6B?=
 =?us-ascii?Q?QclX10Dn4RlE8rCKwIpGQdzkMN3QUY+ONNqYuKgKVitcaddClahhYwa+/sp5?=
 =?us-ascii?Q?8DlzhP/bEcQi6n5qXYN41vrmhcDmHdEnRQpE6YmND0x+zOUI4qSPejlZa3pb?=
 =?us-ascii?Q?EjW3HQWqfxzRYz3jETEnPU2mCGos6Nh832+k9AdS0DYYOAD59hEJLwKKUJ1R?=
 =?us-ascii?Q?QGcIwS66t6DQ3G8FN9hOrffhlnDi7NAQ6T9Hz3+xPMV00kK4hl0qG0+iZjBV?=
 =?us-ascii?Q?oFGq6efC1DA0CCGgWvpHT+vzJOPoaeCTtrngWOyW+V0AuAPB5OaTiZ+IlJYD?=
 =?us-ascii?Q?gFqOa9tq2apKhIma82wAQGi6o4lDQ56YVZhq8dUqJXA39M7u5ez1sLaHqoJ0?=
 =?us-ascii?Q?0RuPx3wXrBu5cdFlJmmS6DJyTrYdl6por+3wkMTg6N9shzNYnrzp3V6+MfaH?=
 =?us-ascii?Q?xHESN4Z+KdJPhIgDpTZiVA9LHiTsyQDHwt2Z/lANrJcNPJvwkxM58gRmUNn4?=
 =?us-ascii?Q?QIUsPnMA8uE351PeYAStmbP7Az7RswsiwYeUsR+KT8x7IgrtTExXVwkCQg4?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8c2735-db32-4c53-c17a-08dd4a4f6966
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 03:51:48.7382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8817
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

From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Monday, Febr=
uary 10, 2025 8:52 AM
>=20
> On Mon, Feb 10, 2025 at 06:58:25AM -0800, Saurabh Singh Sengar wrote:
> > On Mon, Feb 10, 2025 at 02:28:35PM +0000, Michael Kelley wrote:
> > > From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Monday=
, February 10, 2025 4:41 AM
> > > >
> > > > On Sun, Feb 09, 2025 at 03:52:52PM -0800, mhkelley58@gmail.com wrot=
e:
> > > > > From: Michael Kelley <mhklinux@outlook.com>
> > > > >
> > > > > When a Hyper-V framebuffer device is removed, or the driver is un=
bound
> > > > > from a device, any allocated and/or mapped memory must be release=
d. In
> > > > > particular, MMIO address space that was mapped to the framebuffer=
 must
> > > > > be unmapped. Current code unmaps the wrong address, resulting in =
an
> > > > > error like:
> > > > >
> > > > > [ 4093.980597] iounmap: bad address 00000000c936c05c
> > > > >
> > > > > followed by a stack dump.
> > > > >
> > > > > Commit d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred =
IO for
> > > > > Hyper-V frame buffer driver") changed the kind of address stored =
in
> > > > > info->screen_base, and the iounmap() call in hvfb_putmem() was no=
t
> > > > > updated accordingly.
> > > > >
> > > > > Fix this by updating hvfb_putmem() to unmap the correct address.
> > > > >
> > > > > Fixes: d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred =
IO for Hyper-V frame buffer driver")
> > > > > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > > > > ---
> > > > >  drivers/video/fbdev/hyperv_fb.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbde=
v/hyperv_fb.c
> > > > > index 7fdb5edd7e2e..363e4ccfcdb7 100644
> > > > > --- a/drivers/video/fbdev/hyperv_fb.c
> > > > > +++ b/drivers/video/fbdev/hyperv_fb.c
> > > > > @@ -1080,7 +1080,7 @@ static void hvfb_putmem(struct hv_device *h=
dev, struct fb_info *info)
> > > > >
> > > > >  	if (par->need_docopy) {
> > > > >  		vfree(par->dio_vp);
> > > > > -		iounmap(info->screen_base);
> > > > > +		iounmap(par->mmio_vp);
> > > > >  		vmbus_free_mmio(par->mem->start, screen_fb_size);
> > > > >  	} else {
> > > > >  		hvfb_release_phymem(hdev, info->fix.smem_start,
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
> > > > Thanks for fixing this:
> > > > Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> > > >
> > > >
> > > > While we are at it, I want to mention that I also observed below WA=
RN
> > > > while removing the hyperv_fb, but that needs a separate fix.
> > > >
> > > >
> > > > [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/co=
re/fb_info.c:70 framebuffer_release+0x2c/0x40
> > > > < snip >
> > > > [   44.111289] Call Trace:
> > > > [   44.111290]  <TASK>
> > > > [   44.111291]  ? show_regs+0x6c/0x80
> > > > [   44.111295]  ? __warn+0x8d/0x150
> > > > [   44.111298]  ? framebuffer_release+0x2c/0x40
> > > > [   44.111300]  ? report_bug+0x182/0x1b0
> > > > [   44.111303]  ? handle_bug+0x6e/0xb0
> > > > [   44.111306]  ? exc_invalid_op+0x18/0x80
> > > > [   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
> > > > [   44.111311]  ? framebuffer_release+0x2c/0x40
> > > > [   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
> > > > [   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
> > > > [   44.111323]  device_remove+0x40/0x80
> > > > [   44.111325]  device_release_driver_internal+0x20b/0x270
> > > > [   44.111327]  ? bus_find_device+0xb3/0xf0
> > > >
> > >
> > > Thanks for pointing this out. Interestingly, I'm not seeing this WARN
> > > in my experiments. What base kernel are you testing with? Are you
> > > testing on a local VM or in Azure? What exactly are you doing
> > > to create the problem? I've been doing unbind of the driver,
> > > but maybe you are doing something different.
> > >
> > > FWIW, there is yet another issue where after doing two unbind/bind
> > > cycles of the hyperv_fb driver, there's an error about freeing a
> > > non-existent resource. I know what that problem is, and it's in
> > > vmbus_drv.c. I'll be submitting a patch for that as soon as I figure =
out
> > > a clean fix.
> > >
> > > Michael
> >
> > This is on local Hyper-V. Kernel: 6.14.0-rc1-next-20250205+
> > I run below command to reproduce the above error:
> > echo "5620e0c7-8062-4dce-aeb7-520c7ef76171" >/sys/bus/vmbus/devices/562=
0e0c7-8062-4dce-aeb-520c7ef76171/driver/unbind
> >
> > When hvfb_remove is called I can see the refcount for framebuffer is 2 =
when ,
> > I expect it to be 1. After unregistering this framebuffer there is stil=
l 1 refcount
> > remains, which is the reason for this WARN at the time of framebuffer_r=
elease.
> >
> > I wonder who is registering/using this extra framebuffer. Its not hyper=
v_drm or
> > hyperv_fb IIUC.
> >
> > - Saurabh
>=20
> Here are more details about this WARN:
>=20
> Xorg opens `/dev/fb0`, which increases the framebuffer's reference
> count, as mentioned above.  As a result, when unbinding the driver,
> this WARN is expected, indicating that the framebuffer is still in use.
>=20
> I am open to suggestion what could be the correct behavior in this case.
> There acan be two possible options:
>=20
>  1. Check the framebuffer reference count and prevent the driver from
>     unbinding/removal.
> OR
>=20
>  2. Allow the driver to unbind while issuing this WARN. (Current scenario=
)

OK, that makes sense. I haven't looked at or thought about this issue any
further today, and don't have an opinion yet. Give me a day or two -- I hav=
e
one more patch to post related to the FB and DRM driver problems.

Michael

>=20
> - Saurabh

