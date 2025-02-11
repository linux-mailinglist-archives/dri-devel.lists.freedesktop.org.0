Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB49A3024E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 04:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B105810E407;
	Tue, 11 Feb 2025 03:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="QBljAHB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn19010005.outbound.protection.outlook.com [52.103.12.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62010E407
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcLk8oSxz2iWyn5fLs+KlNVhQOwfzN+wiSkobaVVI2CxOoQwHQIBxGzN65Poc5fBP7kjIto6AjOlItcEp7cdc01Xoyq8j+NWMEf+E8exS6qVW1/WRllLnOzTzn/GMxCwt/mHlVq0kw6JI3uh3N7skUzlsETLezCF/z94qHenSUrhkbN3QdYZcv0nEbyCjXp881JbyaoOk+F1KgAuR72mY8BdZ4uBX4xSM6lM2EKSSS2R0XQuVGnsrqN35Mviz3DjclRh8GV7jCjgLT+5WWYiGcq9wlLDZtRDJAA6so9KHFln3HmbCQLMRJHLJCSTuvpCj5ApcJrpr/+ln6GSlipIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWyBTotTGwvzc8BsvMnn/pV+MISBvaPMy09k3mKicm4=;
 b=rg5WdC7TlZV6rdIOZE8mrYHWa8jk+1nS4d5HJu61lF6g8dR4RagUSy5QWrjfXT59RSmcbq+oWFfvDMnFVTGWYY2BFUp6hL29JZk9fx4KyT6YfhNFr9FAAwPhO3oRf5pTkTo3Glq+YKYRocJf4zJU/CxDius9y78DaIs2MdnSDsSWLsfHVvVvOK3c69dRW00KKzvxEMJXIMUwgitpxAYubv45OUx+AwyDjBjL7gFEzssmvjuWqheUcSwlJGz+YveIzXJVleZFIWnqkHypL/mOgr6KvH3HrE8iMX2ABx04eRJ9zzQgVKXNBqEgOKjBqUGVae7otcMiY3iooDbK89hY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWyBTotTGwvzc8BsvMnn/pV+MISBvaPMy09k3mKicm4=;
 b=QBljAHB98nvZ4fgMHgyMjZnQFdGYDpVD9T8GfKFEGfGBxIiiDbxKYAu/XFgvXrXgQaF0sf9qgkQnG34AXhUu8Q3jHNjD7Wj/PknPwCjgyeGBq8zrxIJoTHxsMGHNYRrrZjM/iQmKNo76Mp701BeWCFLVAfeUWlZ/66sB7iZFhuwpFCjlgq9PhHkMFYknMOWfeU1uoIES5MMQwsa9eD08mrew3G4tH/0zMpdyfltDOiBfa++EATbG5KCzkn/VRj14AyY+z0BmpCtTdhcJIIJ7L/7myWImdOoFzcP8rFeieyR15NbqXOD6T5uURxdv3WVal6HFJ3lHltVi0XSRbNDZWg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO6PR02MB8817.namprd02.prod.outlook.com (2603:10b6:303:141::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 03:46:51 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Tue, 11 Feb 2025
 03:46:51 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
CC: "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "christophe.jaillet@wanadoo.fr"
 <christophe.jaillet@wanadoo.fr>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Thread-Topic: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Thread-Index: AQHbe/LnrZljjDR8lku/NvrRVzkSqLNBc4UAgAAAy8A=
Date: Tue, 11 Feb 2025 03:46:51 +0000
Message-ID: <SN6PR02MB41575726CE86AAB16FF6C365D4FD2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250210193441.2414-1-mhklinux@outlook.com>
 <20250211033326.GA17799@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250211033326.GA17799@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO6PR02MB8817:EE_
x-ms-office365-filtering-correlation-id: 2be7f68d-6840-46b1-d8af-08dd4a4eb845
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8062599003|15080799006|19110799003|8060799006|102099032|13041999003|3412199025|440099028|12091999003|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?2TV+9h5iY8qJ1h8R2sk4T9BUioRpaUtF44pXOPxCAXaSFE9qxypi9u4KqIyz?=
 =?us-ascii?Q?ic0R5hefmtiehjNp3X+U/wYiryDSf4vMM51VjcDBVOTBq3K8usar7gWVaKMv?=
 =?us-ascii?Q?4NR66KWmcVjXuCtl+bZsN8/6e6WLJXfp+w1ZMs5fFnQJmAxR2V25AXHahVyS?=
 =?us-ascii?Q?oRHR4F3ySYoe+X/LkfT7Ob0aR2N+cj89PB705z57U+JfH02VGLpRGjk9gulH?=
 =?us-ascii?Q?tlOwTi1i+h42qg9zgicf3dQEy4hFVRSbz2U+D5T1vn67PQlkghOTrJSxOvbn?=
 =?us-ascii?Q?vwGBKwd/uaRbEdLzPWlZkXQU/fJivShvxUiBXLhfCnSGkEf3+o8v8lNWt87X?=
 =?us-ascii?Q?K2a6TirFESxJ1h3sijBBWSjC16/g+aVH8AJyiwUE7qC2vyoiwlFheUJn9w2h?=
 =?us-ascii?Q?WQzoDGy/Udw2nMnFAMDZxYLg2S2Ql4qDLwhVGaFbQCW3/ZMKnC7kkDPTUMFp?=
 =?us-ascii?Q?hqosAbCz0TJSU2zUKB8vkE6bu4x779O35Nv+rndVe3h6E+YWinRLXVhcW18O?=
 =?us-ascii?Q?/NvtpjNj93HzKuZisHoX42NtZCx6XwOCyKFVdxs2+aHRVawjQ7KbG8iMn/Ca?=
 =?us-ascii?Q?nlLg4ZS65tWFN8eBlX/UxulzCTsycxCEkkNX4CPFChNXOCq32plvJjpri/qh?=
 =?us-ascii?Q?3zKYRJ50Mbm0EBkAJ6t3p3B+UAIO0PJDbEA2C0z3lLR2zeO3sn1ovPce7VX/?=
 =?us-ascii?Q?HjJrn2kIMLn/0ANRpXdQUsU27l6CueAhQFH/7E8V2N5Ib0w88XGsVkt0B2J4?=
 =?us-ascii?Q?6lCW6EmZhyfEuALn/0j2hfmx3Lu6yRIF/9fNJ+hxGAq9PLuFCWQC7CX+lQDQ?=
 =?us-ascii?Q?c2Qe0Z4z+uqa4RzNYAvoPElv7UXo2VUSi+uU5wqU/4QzCj+26EdaV0yXeVG2?=
 =?us-ascii?Q?m50jxlHDRsP7k3urRn6oTQUUt8n6H7Aq9smwFH5Pa2pKF2g8/9CjnbMnyjz/?=
 =?us-ascii?Q?C11aUW+FWDdgSzeNozlcvCZ0ljEbVanP8uj7GwStimNL5ZqlsSqzFRhW9zWL?=
 =?us-ascii?Q?jA1jEr0lXMOpK3kkfba1phjjwX/uyx6+nx35vk3C3+Di1H/1kuJ7YQ9QIjPH?=
 =?us-ascii?Q?rT1PxDbKei8XW2HZUZMepMg8udxYDs8w2Ih4mj4wF0aFrywMscsfADqmjjOX?=
 =?us-ascii?Q?xXcZk8FB6o1OH8H2LNqXSclm9Swfvh1Xyw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XXy8Wn3O/teqmNgmmU3p4fW9IeoB6OOvg6PvT/Nebb10XzC/nIAK3NfxqVPq?=
 =?us-ascii?Q?wOtF/dwqeOTYUpYGoAghNKVGCh8vYY4g63b1zrm7s2jDnu1GjKmXw/0Z9Ic4?=
 =?us-ascii?Q?Vt9aEas5IK6Y1w0PhzGVa0KWztHVNYSynZamDU7uAfBBoWt6Cd6JwPe4kZ31?=
 =?us-ascii?Q?qeM71sluGIAzBXtIocETNHGAcirh2eiCufMvkOrH5H9wmiJXs4F9yb3LlOzY?=
 =?us-ascii?Q?FzixpSD4HzqGFSILVYpc65OlqWA3YTj9wRrYNQAMVaGqixqrNAGAIUp/ssXj?=
 =?us-ascii?Q?MUhZZiU+WtV3q/TLtveu4ROX5/1RnVRbyB8LUOtDHq83zAOdeca7xer1N3Hf?=
 =?us-ascii?Q?O9m/SOq1WIHlaNDi9LEacxOoYUBql9T4/gVYAat4xomhF5igKWY2q/okrJ3A?=
 =?us-ascii?Q?Sfoevy+TXsQZ2mfUaON3sRAfKYMqPaLobi/wHBm6Hgqwtziv/1H3VgJtEe0l?=
 =?us-ascii?Q?snysD9G3MxnNLkW8Nccy4adgzEMSwTKrskFE04FISGNfZO2UO5g+BsH0jPWK?=
 =?us-ascii?Q?+bygO4qjX28Rp652wJrMhNtAUR8FzAl5b9xU7Sm6mvtn0XOTkoHhoLwEawkE?=
 =?us-ascii?Q?DzcUb/UBricfS7vrhm1HnfGPbyB7jBZruO4dBBlWYDkOU4R8WINvY/VHz1fe?=
 =?us-ascii?Q?sK3nU816ygfVqeYrFbSjRh01NIYTxKMYB3iYCJ+qXAx8aRD1X+7RaqFGgRVE?=
 =?us-ascii?Q?Gf3AS9LEOiw+qkaC6h4FhcFbyYzy8AUdav46UGNuDK2aTpI0c/+e94q1sBZn?=
 =?us-ascii?Q?uSIQVsdfnGKekDY2xpdF4iggXbaZ60LV1Tzb2o57KgPiMG5aiN3d70igYvek?=
 =?us-ascii?Q?M0uv4WSOdWaUsmzy0WADXlRYz7+xG5ZtJSnETVOwyyMe0tz9FNj/zQaTHvEl?=
 =?us-ascii?Q?aubFIxo1G4MABPCrPScyJ53ymmwyUqa6QlsSDTBWQaiPvAVUQmgouhbMOS9H?=
 =?us-ascii?Q?zuMSXm+qCLnc+TgvQmADsRUjF/nau8BvirORjoCjzaUjizyEOJc8X5kEyoDm?=
 =?us-ascii?Q?SPpKuRo9eyVjdWnmz4Tv8Lsa3wY+fVFeeFcKb7EGAfLOHZFWJOvp2jSBuuay?=
 =?us-ascii?Q?HuFITtm+L7U/jEVY4sZb7CAPhw0jum+EQ9wgOxVjtEDtW1F8avSRYAId3fwI?=
 =?us-ascii?Q?o8ywh9JapBRTavZMLwq+joYypb1lnvNhf/KX8VYK8W9/vSKInAipw3f6koHo?=
 =?us-ascii?Q?C0yNsQJcnkjV4+mOsf6fym/ohlc9m6zcDI33N5wrtpY01ljnZq9P9wHracI?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be7f68d-6840-46b1-d8af-08dd4a4eb845
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 03:46:51.5874 (UTC)
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
uary 10, 2025 7:33 PM
>=20
> On Mon, Feb 10, 2025 at 11:34:41AM -0800, mhkelley58@gmail.com wrote:
> > From: Michael Kelley <mhklinux@outlook.com>
> >
> > When a Hyper-V DRM device is probed, the driver allocates MMIO space fo=
r
> > the vram, and maps it cacheable. If the device removed, or in the error
> > path for device probing, the MMIO space is released but no unmap is don=
e.
> > Consequently the kernel address space for the mapping is leaked.
> >
> > Fix this by adding iounmap() calls in the device removal path, and in t=
he
> > error path during device probing.
> >
> > Fixes: f1f63cbb705d ("drm/hyperv: Fix an error handling path in hyperv_=
vmbus_probe()")
> > Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM all=
ocation with PCI bar size")
> > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > ---
> >  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > index e0953777a206..b491827941f1 100644
> > --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > @@ -156,6 +156,7 @@ static int hyperv_vmbus_probe(struct hv_device *hde=
v,
> >  	return 0;
> >
> >  err_free_mmio:
> > +	iounmap(hv->vram);
> >  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
> >  err_vmbus_close:
> >  	vmbus_close(hdev->channel);
> > @@ -174,6 +175,7 @@ static void hyperv_vmbus_remove(struct hv_device *h=
dev)
> >  	vmbus_close(hdev->channel);
> >  	hv_set_drvdata(hdev, NULL);
> >
> > +	iounmap(hv->vram);
> >  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
> >  }
> >
> > --
> > 2.25.1
> >
>=20
> Thanks for the fix. May I know how do you find such issues ?

I think it was that I was looking at the Hyper-V FB driver for the
vmbus_free_mmio() call sites, and realizing that such call sites
should probably also have an associated iounmap(). Then I was
looking at the same thing in the Hyper-V DRM driver, and
realizing there were no calls to iounmap()!

To confirm, the contents of /proc/vmallocinfo can be filtered
for ioremap calls with size 8 MiB (which actually show up as
8 MiB + 4KiB because the address space allocator adds a guard
page to each allocation). When doing repeated unbind/bind
sequences on the DRM driver, those 8 MiB entries in
/proc/vmallocinfo kept accumulating and were never freed.

Michael

>=20
> Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> Tested-by: Saurabh Sengar <ssengar@linux.microsoft.com>
>=20
> - Saurabh

