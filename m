Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912BBA334C2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 02:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4088E10E11F;
	Thu, 13 Feb 2025 01:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="ofagyWal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn19011036.outbound.protection.outlook.com
 [52.103.14.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF4910E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 01:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1YIIM0uWmx957W5G0o2sb9Vn/XXjGHWXsDA+4rP5+bDcg4muYX6HGI4QLNUiXqcM7H5N7+yUDurh1ykpml9Hz41FE6EVK1vGSTqEnirG9Qn0BqFsxT49q5MLoWWK4Il8ckX5IWFD6+F1HW8qKMn+RHT9ng2YxmihtUnqTqUbThDkGHbY3sTeotb+p5LDFlGqd0mV0Id58xtAH56ZnjweRsCc0Km7MkbGkw8GKkyasyiiFC7LxPWLzef1bqMvgiINYvhbGcdGqsDJHIuvJKAsKOhzfpYqlxTsBTfSE8mBOEN7CcXgpANtZaOBsXfTeX3AO9EfbL2x0S6NE9OP6ZAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7/PKbdhL77CIanyc9ctveT3XYq/6UA7Gd/N3Rr+Ajk=;
 b=E4HVquxagawlhIcp9HzTVq/h0EpIJIqFGbSNoC2ed7v3IFXaT0OF9nvT/KGoqTpGZmG9UsO9qufjoqEncSXvCqrOd11Oga+IePF9QjyHAsHoXeKqGWUK/d+n/IO5irF0jpwvK7sqERr7N0tAKxbxxa7+8pxU5sHySqM9kqpKeiwLn7ij3pxf4Q7W0v3eiQTIlcDXUzWelQ4sg5dM1xxtSNiGsv3taYbFgwSNl8pyACwpjQPEOrC+eIgq2igoR27LtDO6Bn7Qoegh9M2V+N6kvWieqT6fouluxM51QqDktqyuFcg2IXnGaXGmSuuSjwnClMR8nj3e715Md9VJNK6DyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7/PKbdhL77CIanyc9ctveT3XYq/6UA7Gd/N3Rr+Ajk=;
 b=ofagyWalzEJVJRmCMa2mkZl54zWZ9Kh2EQa86lVdEIGo2MTEqt9HmGhe6dsL1zf57gmPI0SjTGk8eYo8r+gZw/UwJuxis/rF+ezD7trPuS2kHbVN6zLQ31OTwcxm/2YYQJH18PkBfd9P6noMKPwt5s3zUljNb0YacywGl7D042qXZ1Uz6cgL9QVzlWLh3oWfM3f9EoHo8XJx9z2k5GX+DyWvLbg7cIxKAwdyx8acS0QROR2HfEEVpOS6w1LntoPywqw8lsj75/S/Bn5RQisfH5oPhuhkzpRiQk5hluoHwBbYbL/LqRdLVz5Ukz1BKYE1NmeJZPuhZC2MNVGE+Q82QA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA1PR02MB8607.namprd02.prod.outlook.com (2603:10b6:806:1fe::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 01:35:22 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Thu, 13 Feb 2025
 01:35:22 +0000
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
Thread-Index: AQHbe03JMSfrBLANP0SDwaGKm7HxS7NAe2OAgAAbBUCAAAt0gIAAH9WAgAOyT7A=
Date: Thu, 13 Feb 2025 01:35:22 +0000
Message-ID: <SN6PR02MB4157C1DF0A0101EEF4CA79E2D4FF2@SN6PR02MB4157.namprd02.prod.outlook.com>
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
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA1PR02MB8607:EE_
x-ms-office365-filtering-correlation-id: 7a0f0f0d-bf2e-4594-97f6-08dd4bceaed4
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|461199028|15080799006|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?2CumjRiO5js1vFyAFE3Ntuf/YVV2M456+GSEqLW6IFdGVDEZY4fvizVOWaKd?=
 =?us-ascii?Q?ZBYRQss7dJYhyLUABfr5szO6MtGIAcyX3B+CtDIwY2yza/Ea0n6HPEVEDays?=
 =?us-ascii?Q?AlVGhcHSlTqOEPjmWXx6Fyu2p90J++28S8mu2pM1s7Cv+tEu309Q0EHoySDt?=
 =?us-ascii?Q?GZmU38yLqHVgzGKE3CwvuNnK0KETrsOzbgNpRgaiecIE1SbwzCO0c+vAoOJX?=
 =?us-ascii?Q?zG61rANzBFxqsevjMa82UL4ZkA1AHHJ8VTIPGlNg3Qqusi1ysq37ttp4kiYV?=
 =?us-ascii?Q?Vf8yMOBVXUy80VxWI5osLkDi3fiqd2h+ipn9/euqB0mDzdPstxyl7xN5bRqS?=
 =?us-ascii?Q?2lLAG3gmoLaeYPnJGbo0qKAUhbmMI9LUSJpCOs6JJdcU1tHJQhhePePck2E3?=
 =?us-ascii?Q?JtxjlP3cxgqS3pOnoSQKyeg7ATd0C3IwVKl2z0Y/ngEuXAzQjUebKthdtx2q?=
 =?us-ascii?Q?jRHkSLV+cAt0lME6g6cYxLRENPNCBq6YpzP4DsCHXQxeP7DaJrGY+1AuYCVm?=
 =?us-ascii?Q?YlWUyKsVQ3XwjBLUypgvwwWBxB6p/+7HBDpmFoOmqTVmLZki1jCroxyJdgHo?=
 =?us-ascii?Q?tRzyk0LwjdsmheoQjiDNpGswubl/Lt0ZaeMrd0zYILIWo6ssTcNjbnDErrMn?=
 =?us-ascii?Q?SnJWONret5Rk9nP9OgdSgj4mCra17XdDGaIgfUCxlJT/aV8yh1lwuP1HAwdG?=
 =?us-ascii?Q?/KC/PmDLLNt/BBaXQo99PuE02nwEuacuojJAjUnGaP5/4VGiPTbdkB0Nowcm?=
 =?us-ascii?Q?c7Y5BINVbSlaiAGOhjH5zS+wG6V1oCmkbW2kQbtm7usLYffnl7z1oqd1A3YG?=
 =?us-ascii?Q?mXQjG88e2X4sLqLtU93ffcJuU7Wqq6ba1D6Vecfn3YUpxQMymLIKM/Ku2seG?=
 =?us-ascii?Q?t2tLzG2prIWmd+8MdTkEqJX+kguHDCIeApf9tod0Mrtn8NZjsSoZ1Xqe4A6S?=
 =?us-ascii?Q?TRgBc2jzN4Mk02k4vKuSzPQWLZiE13m2Zv97nQtnLQfZ0nuZ+SUtwHplTJV4?=
 =?us-ascii?Q?RAnnqQ3P247RtT+r8qpinfMPxRwdhZWpORxBJpRCPI4yl6w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z4zMkJ2ocQkpRvJOMGpaKpYSSbGy8tXX2kCYgq75I+b1/RPPVsrD5TetgYfU?=
 =?us-ascii?Q?pUE1ROYAxv7siqa6irz6XwTaa1lDodhG8x8q92ePCC7h+oLdlcx1UGy4rUL/?=
 =?us-ascii?Q?lDC7+Q86vFAjMWaBEvsWE1wRSzDsLmKq/GG6wJukiaY0STRT7zx0wQaDa5US?=
 =?us-ascii?Q?8udPs0UeT2KvCznoNf8dkYkM6UHDnyT1brP5cKoG1cpMv9vLLkwzLrkGBcoz?=
 =?us-ascii?Q?nY0js1LoNkLl7to0komc08KGAWFXfFQfNNVAFVx8MzVwhNSX44ei+/prWzvS?=
 =?us-ascii?Q?KEUIqJTPKuRQmwoaCj+wlkzzGUeJzsDalbSA3InVoOSeLzYCxIm/v0ByhZS+?=
 =?us-ascii?Q?axkxYRlI0kCahozI/N2BvmWpOwD7HaoFCeWQpLhr0fwybNjrgUeiUgsVx2jm?=
 =?us-ascii?Q?RKF2oYZkuOhLackNZRMHdX0CbR+4Y/L3c/hRJOWD5Oi2orZq4A7lWZjQK9TO?=
 =?us-ascii?Q?BlN8lfBw2j8RzrC6oTDrCF8ioPu6+BNCIhiYFblO01LIKFLIQvXNuRZZ14w4?=
 =?us-ascii?Q?4Y2UcxjQ6rCMJpAz6Qw0j9b4S0vkkfsuyUb/KY88I9gT7PI+BdZlAQZvv036?=
 =?us-ascii?Q?V4mEQoCL/6Z6hdB5HW0e+Vii2iSD8aRqdmvScmY0nXexzLbbUjzzzbwYHIEq?=
 =?us-ascii?Q?Rurao52L1xRnWWeRESIMm9bVQyH2J0bK4+mKmzsfCGIa9C5l8FmwEYCg9V7z?=
 =?us-ascii?Q?lNfUvb3QkggmChjQgDCr2g3X+7uQDNT7K28c5ikuugevLByXdeicvXGIbkJI?=
 =?us-ascii?Q?eYoWmYEBlsCSORabwVwPbrTQ0CmAHttJJMpouuHdWZiHt+NjaSCT8B8IKuNl?=
 =?us-ascii?Q?zykw9Byh8AcS14iQfyznJg16kUda8H4vuwJmf7rND2yioPeIs694NL991Bcb?=
 =?us-ascii?Q?6msqluW2KhSDjcpGjRI0QmqDhFK6pDFQ/IPRjVrLkzbxtl377OYBPpP91A8m?=
 =?us-ascii?Q?di+OO2QqW/enhIsabJZQaBAkomxZkiav6LMFqTS5xwH/XI/3Co91bXcXKNGy?=
 =?us-ascii?Q?gpxLo2E3VOavLr7Od7Qjxu8k/hqLo3xB+971LJ4bR9vfN4E6bbwhn7PYSmpx?=
 =?us-ascii?Q?aumjmwlngaCZTgplsxKH2RGBfyRrby05SbKXt2/FJtT7jVYiiqoPme3jkMt2?=
 =?us-ascii?Q?xGYdtJkoiGB4iW6ONqowHSetMPhGvPBBCAu85PmryV0iMynAVWVZuNaIsQmU?=
 =?us-ascii?Q?aF+VvKiHHgT5aB6lp2azTD8roMYVo9e+2kkiZjeL6DZZ+sR4XN6UUdsVPww?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0f0f0d-bf2e-4594-97f6-08dd4bceaed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 01:35:22.4934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8607
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
[snip]
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
> > echo "5620e0c7-8062-4dce-aeb7-520c7ef76171" >
> /sys/bus/vmbus/devices/5620e0c7-8062-4dce-aeb7-520c7ef76171/driver/unbind
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
>=20

From looking at things and doing an experiment, I think there's a 3rd
option, which gets rid of the of the WARN while still allowing the unbind.

The experiment is to boot Linux in a Gen2 Hyper-V guest with both the
Hyper-V FB and Hyper-V DRM modules removed. In this case, the
generic EFI framebuffer driver (efifb) should get used. With this driver,
a program can open /dev/fb0, and while it is open, unbind the efifb
driver (which is in /sys/bus/platform/drivers/efi-framebuffer).
Interestingly, there's no WARN generated. But when the hyperv_fb
driver is loaded and used, the WARN *is* generated, as you observed.

So I looked at the code for efifb.  It does the framebuffer_release()
call in a function that hyperv_fb doesn't have. Based on the comments
in efifb.c, we need a similar function to handle the call to
framebuffer_release().  And the efifb driver also does the iounmap()
in that same function, which makes we wonder if the hyperv_fb
driver should do similarly. It will need a little more analysis to
figure that out.

You found the bug.  Do you want to work on fixing the hyperv_fb
driver? And maybe the Hyper-V DRM driver needs the same fix.
I haven't looked. Alternatively, if you are busy, I can work on the fix.
Let me know your preference.

Michael
