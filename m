Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFBA446AD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3DA10E4C6;
	Tue, 25 Feb 2025 16:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="nsK1c1Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazolkn19010007.outbound.protection.outlook.com
 [52.103.7.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A0710E4C6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InimTrwjZujtti90jCLkxeyaX1osxJIPAQNAfzEncHqh8Bv9I58wxKzprXvawtJcqEL9ajFWfm9/obHEst+JxQc20vXQ1OBvwJvzaFDSdFcxTgJ2Oyn0JjmDEfp5K3SSLkRkdHMT0H7pVOsKJAqDVfCaADV52aldtrTO98r7xUNWCSuG6RBdv+1Yq7oMge3vB9D3oop0t8EmZqLxphY8U+WutomjqOvwcu44sYMP8s6dNglZ8E5ssXvKnoKaM/4SJkfz644dkpxbc6UGDHHRvaHVeQAOlAhvnKuVQiEe78bH7+GV7gb+KNMS4wL1/DuCFNlJ2dBu9HrmrMyTxmZTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA8EoysHT/MdtK8BSGhAlcKy1SF0hWCuMWkoHCJ/Bdc=;
 b=WzH/cgFeYwC/+j2QsfuXAzr9KE5QRZB99yEijz1ofsGxXQmArNgjrVx9G/zCv6+WAzisxDS3hwyxxuQqW5TMCDL3VVDJUOHPewyXc5xdYYXzjYWlJuaobuXoUOZKsF6a1vzLhILE2nys1lkIO00DQxV0jOfb5DAvk0axsr0nJ7FV9o/99FI4XXbkhSSkxBD0gNPLDIq9O0T8u5HJMYcIew0cIrmteeEIDzTPczidYv6/AVYIUNYvR0KF89s40euUWW/Q/phlAQTrx6hc/zslWll9LvZTu71Fe3PAevlVQi5AdYeTqSspAUAbkpoTgvkkEUeKgNe1tN1IGoSa7a3reA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA8EoysHT/MdtK8BSGhAlcKy1SF0hWCuMWkoHCJ/Bdc=;
 b=nsK1c1Yy+c7abjG84ff0/sHflXFaqEAS53ZNgZbyWpf76Mbc54ktfpWzj2fsjdzlDdw22Xt4kwgE//XhfXfa3zdWiRkcSpttqNcMR1p+FiyiM1rEhJIaR6wok3Lu6XNWL+rPy0QpIylzyJSo6i3UGqeeBllkRp68F8iHTcgMziJbOT/wobQGA2gfhFwVHEwtl7UsIRSz1MPMtXcFVglFB9/3WQdN9nVQY+ONdiAdMsmpmz+ISeeSSKSxllHB/mwjNHB+y5ZbSTqN9p5ixVn/Mg6ICos4CFsYbSluo7LPVtIbcznebrLkNrQAmeo+c1tkTkRrvWKEw+9fajrepBQYAg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ0PR02MB8481.namprd02.prod.outlook.com (2603:10b6:a03:3f9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:46:13 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 16:46:13 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, "kys@microsoft.com"
 <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
 <decui@microsoft.com>, "deller@gmx.de" <deller@gmx.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: RE: [PATCH v2] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Topic: [PATCH v2] fbdev: hyperv_fb: Allow graceful removal of
 framebuffer
Thread-Index: AQHbh2M3LEMsoaxXn022ELKP4Dyh37NYM/YA
Date: Tue, 25 Feb 2025 16:46:12 +0000
Message-ID: <SN6PR02MB41574CD095A292D20AD6C84ED4C32@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1740473808-9754-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1740473808-9754-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ0PR02MB8481:EE_
x-ms-office365-filtering-correlation-id: a2747b21-bfce-44da-1bd4-08dd55bbea0b
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|8060799006|15080799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?L92uOv4B/kZO9QXbroQkK3tGGkpradzXj0tm6/xC8+ifJ7op3+CeFA0woRwD?=
 =?us-ascii?Q?eVMzj5lQx63IzBItsD99u/k/Z8mqB8FG/P8YJmsWT+SgSCKvKcwWCjjMPSnl?=
 =?us-ascii?Q?fAZ/KjwITtoL5yX1wXp18+ncNAtgTz+4BIHwGxU2PH266yh2L5uDpEHbad7U?=
 =?us-ascii?Q?P3kIxYpdH0NanzRTf49HSKZ7EZ7/HakmxfabF10PXtYfCBNMrTv8JdqhS6+C?=
 =?us-ascii?Q?wbGKyGmyzrRZBT8u2blCwwe4WY6He2Dvf3qxt/ICCHD8U2+It2UcNG3sdCFT?=
 =?us-ascii?Q?ciuq+wa2F5fxN7XXMUrMcgUtAn82RqYz+Km9Pmy8CysmMRyFfYJB55PoZZDO?=
 =?us-ascii?Q?hz6ZSeViibWqjBOAi5KuZhFW3Sg4aVlCLcN4eyEhnCkpph/P/y1fepTaVqLN?=
 =?us-ascii?Q?DrB7GqRYVZ51cI18q6/0Gbs6y8JfizzKgCdOsZ+r/aIg0kKR92cazUaVD5C1?=
 =?us-ascii?Q?PsgAcch4/7EXNO2EQCyiSWQyHzs6tHBbD9YPbyEdo0jGzU030eAI6lfb88WH?=
 =?us-ascii?Q?3FZlRt4UXurCcg74t5NuF+RXvZtVRkKypHGOZ0ZKgLE9j78plragiwcSJEb0?=
 =?us-ascii?Q?Z6gAiZyiS8frEuNTL0hnSqCn+ydKkA29uzmEH1MKCoPfA3wA7390Kscs5jPr?=
 =?us-ascii?Q?efM9RgTIp4h8aj8frGGRyTdY188qo3uSVvJrPnm2Zu4e20JbAnF+/vFEYlwt?=
 =?us-ascii?Q?mdIa7SKOiuKyQprKjiWWq3q9LIfbTu4OAKeK+1qa8zHIjrqAOCh5HyOv/Cne?=
 =?us-ascii?Q?rMvHtA1nXOSpkKDOpzSaRa3ZhGE/aflK2A607BNYXqLxEsTZRPanAkteNVtF?=
 =?us-ascii?Q?vCR/fps7dw/avzDZKLsAku+40VINdTkI/I0OGxxjOjbRSZK2T1FR1Mlk2Cf0?=
 =?us-ascii?Q?NLWS8eHazwcL8xVzuxmxftlLnvLQyDwHmLWbiejXI4haqb3PD+MmDP1zXrE7?=
 =?us-ascii?Q?LK7wKzQJFLsaXH/4gGyQRQ428gPuOdD3oSSJ+wxEGpyQunmqfuXoT+ZsSIOI?=
 =?us-ascii?Q?DhYpD0YxsvtXQ3qIE8ERVzwJv+LO2coL79oXIjU2rD7NHiM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XAzxZ9X9DqPqonXpr0dzLWxs69ZwE2PXn2L/NrGkfnkXVWeNbyrTMmGZFZcM?=
 =?us-ascii?Q?2PPEE9OhFQs70QzaNbS5wReyZcpgrtqcKcXSP7nJtnYU1HbUty4Z3MrHSBrA?=
 =?us-ascii?Q?zuJ/1DvKPNOCouLgPMSqjw7AbJcP78Ntf3P1oHmcPL9gMnwcIlQ0ZHaoRCDP?=
 =?us-ascii?Q?/6hmkJFYYWvzJXRPuAL2BEx9QZC4f8XQHOfB2lFMwYlztcmBhwR1XgTkYdFu?=
 =?us-ascii?Q?cLweKTNHUTs/Hdg8QymduWRRg5wCoTU85gsxdO75N/gvoeq9Rz+8s3o9Sv9c?=
 =?us-ascii?Q?Nc0ymoMI8hyLQ++nqg5bRio/emLU+wa20cBalq2Ja5Y0r6vv6ondnjeL3FMk?=
 =?us-ascii?Q?OzGHwJ8Tg0efwtdA2ThQY+MnOJe6V8TJ+RBUXPkLvfw2WFTm8xt0HFieD+WX?=
 =?us-ascii?Q?ryMcBIznGuCY0r6/hNNOESfw4HmN2O3zMV0O2tUsksy4tItMPZE8hm8icZGR?=
 =?us-ascii?Q?5vxej8cciIq/5DnvYYHop6sr2hQhpX4Re6hqvirOcofV9ef5U0y1Np8D4ZKK?=
 =?us-ascii?Q?DhYIoG1MSBsWEhCuM/IG2vthov9dc+kdOUDIh/XIh6Tb7GS99owFc0vxiP22?=
 =?us-ascii?Q?G/OML9oQxPtpq+ayTxsPSzNodv9WuknwXfNjfoDnK97BY3rWCQcy+NP7rBe5?=
 =?us-ascii?Q?yK7VVUGYv26iWQC8UFG8lpUKglhagN4d/usRywjXe9SL+bXnzQivSMqoyZwT?=
 =?us-ascii?Q?KAJKWgnWcE+9sByCEbiZE9kLTNKyQKbv79CFVO9VHz0Y3PTyJY5U2HwGOA88?=
 =?us-ascii?Q?4bVrUdj9NYw/xX+IOIkDmvUFMxM7B7ypJjYre9its/yn9dzC0J6x103dlaa7?=
 =?us-ascii?Q?PczRT0dxZ8ZLjXpolvsJQCP9DLtj1YACfUiqOQwOGWqvdD2wugXj/QqD6Sh2?=
 =?us-ascii?Q?VhE1S0w1DgL8fBriP4w/7Nii9GoU6KfD24utcCKCzGVLK+oWiZBOsL1PLfca?=
 =?us-ascii?Q?iHzXlRlvIL+oyH9/BNS+/tyELIX0ehN1Eg0PROhVQvN2t8Gd2X0lUtFxvvsr?=
 =?us-ascii?Q?+8KwkjHdtxHPAZtLMnGqdCXQC6/p8Pu6Y8fAwF0WLKfx+E9hMr9plHkhiiK4?=
 =?us-ascii?Q?S26Zah0IhdTHvKFJuH1gFB177dAWnrlAAEuUkuKl0bYf0y4VkJigkujYxiXk?=
 =?us-ascii?Q?/vtiIqI6net7CIOT0Ul0pyw6ih520wfeW29ioWwBl2TU2kpIlcUjBNkYwRPE?=
 =?us-ascii?Q?3K/trGa4ocbWxQ/5Q6huJHa5immEHmESCXUgXOGGjQ+bbTPDiIXX08lcU/4?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a2747b21-bfce-44da-1bd4-08dd55bbea0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:46:13.0265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8481
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

From: Saurabh Sengar <ssengar@linux.microsoft.com>
>=20
> When a Hyper-V framebuffer device is unbind, hyperv_fb driver tries to
> release the framebuffer forcefully. If this framebuffer is in use it
> produce the following WARN and hence this framebuffer is never released.
>=20
> [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/core/fb_=
info.c:70
> framebuffer_release+0x2c/0x40
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
> Fix this by moving the release of framebuffer and assosiated memory
> to fb_ops.fb_destroy function, so that framebuffer framework handles
> it gracefully.
>=20
> While we fix this, also replace manual registrations/unregistration of
> framebuffer with devm_register_framebuffer.
>=20
> Fixes: 68a2d20b79b1 ("drivers/video: add Hyper-V Synthetic Video Frame Bu=
ffer
> Driver")
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
> V2 : Move hvfb_putmem into destroy()
>=20
>  drivers/video/fbdev/hyperv_fb.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 363e4ccfcdb7..89ee49f1c3dc 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -282,6 +282,8 @@ static uint screen_depth;
>  static uint screen_fb_size;
>  static uint dio_fb_size; /* FB size for deferred IO */
>=20
> +static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info);
> +
>  /* Send message to Hyper-V host */
>  static inline int synthvid_send(struct hv_device *hdev,
>  				struct synthvid_msg *msg)
> @@ -862,6 +864,24 @@ static void hvfb_ops_damage_area(struct fb_info *inf=
o, u32 x,
> u32 y, u32 width,
>  		hvfb_ondemand_refresh_throttle(par, x, y, width, height);
>  }
>=20
> +/*
> + * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> + * of unregister_framebuffer() or fb_release(). Do any cleanup related t=
o
> + * framebuffer here.
> + */
> +static void hvfb_destroy(struct fb_info *info)
> +{
> +	struct hv_device *hdev;
> +	struct device *dev;
> +	void *driver_data =3D (void *)info;
> +
> +	dev =3D container_of(driver_data, struct device, driver_data);

I don't think the above is right. The struct fb_info was allocated
with kzalloc() in framebuffer_alloc(). You would use container_of()
if fb_info was embedded in a struct device, but that's not the case
here. The driver_data field within the struct device is a pointer to the
fb_info, but that doesn't help find the struct device.

What does help is that info->device (not to be confused with info->dev,
which is a different struct device) points to the struct device that
you need here. That "device" field is set in framebuffer_alloc().
So that's an easy fix.

> +	hdev =3D container_of(dev, struct hv_device, device);
> +
> +	hvfb_putmem(hdev, info);

Another observation: The interface to hvfb_putmem() is more
complicated than it needs to be. The hdev argument could be
dropped because it is used only to get the device pointer,
which is already stored in info->device. hvfb_release_phymem()
would also need to be updated to take a struct device instead of
struct hv_device. But if you made those changes, then the
container_of() to get the hdev wouldn't be needed either.

A similar simplification could be applied to hvfb_getmem().

Maybe do two patches -- the first to simplify the interfaces,
and the second to do this patch but with reduced
complexity because of the simpler interfaces.

Michael =20

> +	framebuffer_release(info);
> +}
> +
>  /*
>   * TODO: GEN1 codepaths allocate from system or DMA-able memory. Fix the
>   *       driver to use the _SYSMEM_ or _DMAMEM_ helpers in these cases.
> @@ -877,6 +897,7 @@ static const struct fb_ops hvfb_ops =3D {
>  	.fb_set_par =3D hvfb_set_par,
>  	.fb_setcolreg =3D hvfb_setcolreg,
>  	.fb_blank =3D hvfb_blank,
> +	.fb_destroy	=3D hvfb_destroy,
>  };
>=20
>  /* Get options from kernel paramenter "video=3D" */
> @@ -1172,7 +1193,7 @@ static int hvfb_probe(struct hv_device *hdev,
>  	if (ret)
>  		goto error;
>=20
> -	ret =3D register_framebuffer(info);
> +	ret =3D devm_register_framebuffer(&hdev->device, info);
>  	if (ret) {
>  		pr_err("Unable to register framebuffer\n");
>  		goto error;
> @@ -1220,14 +1241,9 @@ static void hvfb_remove(struct hv_device *hdev)
>=20
>  	fb_deferred_io_cleanup(info);
>=20
> -	unregister_framebuffer(info);
>  	cancel_delayed_work_sync(&par->dwork);
>=20
>  	vmbus_close(hdev->channel);
> -	hv_set_drvdata(hdev, NULL);
> -
> -	hvfb_putmem(hdev, info);
> -	framebuffer_release(info);
>  }
>=20
>  static int hvfb_suspend(struct hv_device *hdev)
> --
> 2.43.0

