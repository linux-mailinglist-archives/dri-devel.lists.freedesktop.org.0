Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1612FA2EFC2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD1110E570;
	Mon, 10 Feb 2025 14:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="QKzeN1rd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazolkn19012042.outbound.protection.outlook.com
 [52.103.7.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EE410E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8/brkzZj+3f0s/6CXakLvdG56h2xzGmoh5B3Ol1lOEvUey0B8mCZAC89QwdvCLel85lEDcs7KuOVM2GxbfQ5zkX2D6jotNlJm8tHphPy1/Ob8nxD/NUm/8Xb0OuCYV3Z8PrLAVu+E1Pg04FYWaf0yQUWH9d7Rs+eFrYVoaIm5mpRc5cGNx7lwVEnjJHSqthKTy4TGIGK+qg2NHYoWxo8nMqTY2I39YpbztZoFb2KH6NsRHvnZ12Wo1n5ZfB0/FYbpKMEBqdHiUhQpKBPqKOS2ZCdh2v4cugxfLkct6byZcDhvdpvuFZc99dazreiije9oFoG0Jr3iPdAgSzFfFr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjZDP6pRCEZpGuXNECFyi2XodItYTd2zQnZh7ORc5oM=;
 b=ZrGb+RPT11MaYLOVsV/swnfQSAi96FGtJedJvAN14DGZdREW158u/LZ7S62iBEQubm7FymUgkjwQVwBepOdgQyFGHPIYsG+fssXTp6Uovsub8/3BBASz5W1UXfwOD4zUPUGRdyYXz0085ETwfjJWyN53eSnoYYpXmu/3aeWIKQgbfGmUOTHu313TPwUVTqz3oN2FYDlsS0qnS+8JPgVTK8vCO8ax3c1C5Dy0M4oxtTF6JFauDgmcKT8g343TedVFPF9RAAzcUOZws8TrAzaFqJilnJp/7fco6g1KLgHiC2eGMNbVx99Z7BreD7ynSRHxgTHvnTSmwYU1vKn6ltwoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjZDP6pRCEZpGuXNECFyi2XodItYTd2zQnZh7ORc5oM=;
 b=QKzeN1rdaBqOtPYm31/9z5yrpBaI4Jkz6RrGZ3mf76AGPVm3ppQtqAe5E+nLLeUjLu4Tg+21TAPEw5erwI2uzbXret/wXDfvslIj2x6cdn87SOHZdBaOYNiG3fgSW9zlcaVg+7t0JURKZ2VF8pkNbPSRjqgAGbZKuAMWl4WSIiaHubF1+psZC7hGFBjqpBnSQ0OZUO8QrdbIoWqGIy6Ou3mtHJ9aNvuNLHpVIqqoqKl2+rB7cBirthBOmgcAVf2a/mYjZe+ZZp0+SGef2wObiPpHH+8F+hAeeUMbKKrsz8tW9OZ+gQHJqdoHifqQP0J8QuXcWF+a6HfLybkzFrLbQQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS7PR02MB9506.namprd02.prod.outlook.com (2603:10b6:8:e0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 14:28:36 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 14:28:35 +0000
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
Thread-Index: AQHbe03JMSfrBLANP0SDwaGKm7HxS7NAe2OAgAAbBUA=
Date: Mon, 10 Feb 2025 14:28:35 +0000
Message-ID: <SN6PR02MB4157B0F36D7B99A5BF01471CD4F22@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250209235252.2987-1-mhklinux@outlook.com>
 <20250210124043.GA17819@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250210124043.GA17819@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS7PR02MB9506:EE_
x-ms-office365-filtering-correlation-id: 9d354a09-06a8-4cc6-25a3-08dd49df343c
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799006|461199028|8060799006|8062599003|102099032|3412199025|440099028|41001999003|12091999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?vzNe1//tCzjIfMM5FalsH7AKa9r226kb/8i8RnIxEgpcOHjZ3yU2QECw0hIf?=
 =?us-ascii?Q?7q6fT9OVLAPk3KMcT+zuKrfDz+9/cZ3UDTiNCNLuMZp5caq0S3TOYXfrSqIi?=
 =?us-ascii?Q?vZ2roJ3HBs90uTpB4CEIRKHuYKn0VZ8BM0MkfAXe/MEHo0lj4baQ6Xp3B5qM?=
 =?us-ascii?Q?Wb7qLmS85m+tHBEGN94hniwIiXa7uypFCHXt84NXhw+m5rY8NfzGrgdovk+c?=
 =?us-ascii?Q?Rl1F/ScxlcWej1z4nOZMAXL5v9HL/zzCxTNQ7nfxTU9f56CDAF+JzVZiNcQG?=
 =?us-ascii?Q?2hCm3nQ2enRu+Fxc30q1vUjeAK1nz7RLRRhls4wfV4Bypvn32CrH3k/6m5YV?=
 =?us-ascii?Q?uZUhqg63rRAgikrIgQw4pVx22sh87lFZjA4EiSFxpJaFItmtqgmwh99NAutb?=
 =?us-ascii?Q?VjAAjDz7PDgYSD4LK0G2Y4rz8kEXO+crz6KHBFfVqGjwSedCgT4XpWmPHG6t?=
 =?us-ascii?Q?0vcnoe4F3pLGDDLEHGsVsCzNtDV/4I8EiqNAB3lrrB+vc6F5dcp/yjHzYWt1?=
 =?us-ascii?Q?qrb3+djbCKK4iMIEh+El13EqVFXPNATqdUPsFcP/bTSD4JrqCCszYC1iNmTp?=
 =?us-ascii?Q?nVoKqq5h1roeM0LjeT5nV3MGOM8Qzx+XbdhnAFaWbHvVEvRuJqtjvrJaECk1?=
 =?us-ascii?Q?RzbcT8SyaC46r6Jq3pbg/VI+HiK4Q1U5kLYPy8dGBL+BhxzOo2+48J+ahRYx?=
 =?us-ascii?Q?5ZV3Hq1IVax0DqSsL+mlsMlKSJxX0xpMU8glDCpREtWYD9CzcUUgFxD/LdrX?=
 =?us-ascii?Q?2qwYMEDwDI2CzsdRqm9IsQByLgkGG7wmpmtvOzF1ytYkaG9RwSXg8NxP7onR?=
 =?us-ascii?Q?TQT9Dr790YpUn6pXVCLgAN4kJXMOya9RycwluDenv8JfljRvK95bZHvUs8DW?=
 =?us-ascii?Q?FqKcgTnz1Na99uccbaxu10XR4RS6+bpfAsTnws4CKxvZtBGIwLBXBjnYW8il?=
 =?us-ascii?Q?AlANbggHhdGGV0t04lfv6su/W4mqnKicVViSxrvDWEVbKZq28SA0n71ppd3c?=
 =?us-ascii?Q?ZlZaKPcHCeRvBCQcLSe0ALrDxvB5pFcyb+L9e/hxE7UhjIZGtNafkWH4iHHL?=
 =?us-ascii?Q?fp0G74TozGTPrHBp152J9MZk18sgh14eRxL+ijC0rGvqB09l/aU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QzpiiWR6+YRwQPtYmQeuxuRMv8eLDlPRX2+JPsSGhw9zYRCfA6gvZstqP3wc?=
 =?us-ascii?Q?WTfqTQgXXwvaxXL/u5P3PvSDB+kZFlseX6z78MLY/CDfUNm4my41y2unDeEf?=
 =?us-ascii?Q?vlPKpM8IYNHagsqSCa9qOvLztIhjCDtnQ7VKqNqRCKE5mYKUYROArHK61mlL?=
 =?us-ascii?Q?0tAbJ9EvG+uMaIathPlFftavAHddrxVEN57s4DeER8FHSgFtmW39iaWb51DT?=
 =?us-ascii?Q?tosuqwUkj46IcTZMDxBWNFOTPuclgxzwK3lGxMcGdMXLhtvvfAeSjBaF1GAY?=
 =?us-ascii?Q?Y08Y73oFGYa0RvgYS0QBvRWYuGF7hI/kg1TSVBKsplRc9VEFGpWcSix7mhqn?=
 =?us-ascii?Q?ezfQpCYaxarAVh09MbxtzWn+sQxK6AXNP65fzYLz3rADM0tzzke7zCJ+Hduy?=
 =?us-ascii?Q?FypbfQBO98lJksAmwTBdRi3RVf3cMD5MdYePo3TshRnyRlqQcgiDf9BA6iae?=
 =?us-ascii?Q?pmtQTA1bGkeH8GlWT3MUeWWFKcCJLqEfwJvrh6OSb9muE3QCdSBKN50nsUcw?=
 =?us-ascii?Q?W3eeGaCGlRWKsR/pM71rWbZj4YJBIPvUaVBA1vvMGCZMJJF2FudTiKeWtruw?=
 =?us-ascii?Q?qRH+aN6mOM2E7nln2V0233V8cuCWcs5Ohsi9poEtWyW8V8HkILEgnLDARbg5?=
 =?us-ascii?Q?/neORKDhufYCOgAfXe/+XZhF3XUxS6FeBvj0XKl4kwfUQ/XRJWCt4GjMyr7N?=
 =?us-ascii?Q?ZFfofgZcCEY/X7Dv0BGufRFOTjgFTl8tVGVwif8XC7qz8XVi12GH/Jv+tjx5?=
 =?us-ascii?Q?S40tNLQ7iGCUXo76+7bjztRLccEes2V+YjL6eB74NWEo10QokbFm59sh9IZE?=
 =?us-ascii?Q?RtQPHbn0maXzvgxNX/tGocaPbdIbI+MFyGu3JSwFlhTFtMwhY261G5suRrOA?=
 =?us-ascii?Q?OFyQ1uZKGPoxO++Ul7jTBwKX65dVsCYpmiyOk3qbUqfj4b4rIamADaabsXba?=
 =?us-ascii?Q?FvER5NCNO5WeshL6qEQ6+v4x1s31dvrevisORkAMl+j01lIDFeILf2FjPAks?=
 =?us-ascii?Q?1PM4tSW6g6cmcA55yHiW8jl9pb/+YO/ZGpG35nfRMShPFp+8BdLO0+KNK3sv?=
 =?us-ascii?Q?aM6Q48jT0FVky4qkuVL9O9shMDLMsKvm+rLKx9hczFbv/jOdkmfEPB/CCiMt?=
 =?us-ascii?Q?kSVyF3UdOZJ/gtgwlVTIJMCmO3qXnX9uiWhAjAeOZka3YuIOwad3ZgSdFlxe?=
 =?us-ascii?Q?I7SQh5VQbF6BnACYH2HoREalkm0WSpCuI5KW/zjy8zs9NSxC1NHRhKGQGRw?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d354a09-06a8-4cc6-25a3-08dd49df343c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 14:28:35.8821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR02MB9506
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
uary 10, 2025 4:41 AM
>=20
> On Sun, Feb 09, 2025 at 03:52:52PM -0800, mhkelley58@gmail.com wrote:
> > From: Michael Kelley <mhklinux@outlook.com>
> >
> > When a Hyper-V framebuffer device is removed, or the driver is unbound
> > from a device, any allocated and/or mapped memory must be released. In
> > particular, MMIO address space that was mapped to the framebuffer must
> > be unmapped. Current code unmaps the wrong address, resulting in an
> > error like:
> >
> > [ 4093.980597] iounmap: bad address 00000000c936c05c
> >
> > followed by a stack dump.
> >
> > Commit d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for
> > Hyper-V frame buffer driver") changed the kind of address stored in
> > info->screen_base, and the iounmap() call in hvfb_putmem() was not
> > updated accordingly.
> >
> > Fix this by updating hvfb_putmem() to unmap the correct address.
> >
> > Fixes: d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for=
 Hyper-V frame buffer driver")
> > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > ---
> >  drivers/video/fbdev/hyperv_fb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hype=
rv_fb.c
> > index 7fdb5edd7e2e..363e4ccfcdb7 100644
> > --- a/drivers/video/fbdev/hyperv_fb.c
> > +++ b/drivers/video/fbdev/hyperv_fb.c
> > @@ -1080,7 +1080,7 @@ static void hvfb_putmem(struct hv_device *hdev, s=
truct fb_info *info)
> >
> >  	if (par->need_docopy) {
> >  		vfree(par->dio_vp);
> > -		iounmap(info->screen_base);
> > +		iounmap(par->mmio_vp);
> >  		vmbus_free_mmio(par->mem->start, screen_fb_size);
> >  	} else {
> >  		hvfb_release_phymem(hdev, info->fix.smem_start,
> > --
> > 2.25.1
> >
>=20
> Thanks for fixing this:
> Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>
>=20
>=20
> While we are at it, I want to mention that I also observed below WARN
> while removing the hyperv_fb, but that needs a separate fix.
>=20
>=20
> [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/core/fb_=
info.c:70 framebuffer_release+0x2c/0x40
> < snip >
> [   44.111289] Call Trace:
> [   44.111290]  <TASK>
> [   44.111291]  ? show_regs+0x6c/0x80
> [   44.111295]  ? __warn+0x8d/0x150
> [   44.111298]  ? framebuffer_release+0x2c/0x40
> [   44.111300]  ? report_bug+0x182/0x1b0
> [   44.111303]  ? handle_bug+0x6e/0xb0
> [   44.111306]  ? exc_invalid_op+0x18/0x80
> [   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
> [   44.111311]  ? framebuffer_release+0x2c/0x40
> [   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
> [   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
> [   44.111323]  device_remove+0x40/0x80
> [   44.111325]  device_release_driver_internal+0x20b/0x270
> [   44.111327]  ? bus_find_device+0xb3/0xf0
>=20

Thanks for pointing this out. Interestingly, I'm not seeing this WARN
in my experiments. What base kernel are you testing with? Are you
testing on a local VM or in Azure? What exactly are you doing
to create the problem? I've been doing unbind of the driver,
but maybe you are doing something different.

FWIW, there is yet another issue where after doing two unbind/bind
cycles of the hyperv_fb driver, there's an error about freeing a
non-existent resource. I know what that problem is, and it's in
vmbus_drv.c. I'll be submitting a patch for that as soon as I figure out
a clean fix.

Michael
