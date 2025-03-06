Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D38A540FE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 04:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6955410E0A2;
	Thu,  6 Mar 2025 03:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="CnYTBW9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazolkn19013079.outbound.protection.outlook.com
 [52.103.20.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13BF10E0A2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 03:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpWyxpyVjgN3JGsnSjf0MM8RmBuYysK2mX225RJdP+OqE/9Ry3oHY4uI2L9WIbsoWUKL6ZPuQUmuTfJPutK3A6cepjVJ1q4ML02IqsUEVLkZLIwI91l49g2OM8APMTkt5xRRYlat3wQ2IvD5hLVXx+wsF6cGF/r75ILJon0irFjGeF+W0NWIDuaKkk9o4iRZJilt5uPrKA9kNUwtURbuCSoFkHbfsyptaK2Vz0VANBgZvfjhLiiIshYtkXLIkrjho1u/dkfmo7f3Wep5OdF787AS9ZvYfmRh/UbB8J6q0XJXRWIx5E0JKCzeRnTh1vJPwLkPFnYu+8YSvgIOi8pHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeUQn0H1wr1rmAd1KpLCLv47elwB0oV5i7YtzaHsucA=;
 b=cMGGfGmNMJ7nK0hYM7aD3PDy09sBf4QqXNR/Rv+5scXDjK4FFYoaLaavVdQslRyin2e0rtj9t6iPHl9hFJdXMOpeNRGAXhfurgpzK9yQwnf8rub+N5LCkCZSnp49SGpxKBIY1cIbEAUUM+nLWIOIQ0EB+z8odp3Qogmwjuj7KfuQwZmmTUbzuCN97V+JTR0mZcMTCZI7tAFRIeguPHqgMg/n3+MEHn7wkuxfWkPDl9s+aRDIn7w5I8Op6jXfV2vnGwSCPqWNX5k34NCmuNOG+LIiBnD7rGh11GDXgfhRxV2TpOmV+uD8Be7geWQLv8Gg4msmJidnWnE4c0X7fcjrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeUQn0H1wr1rmAd1KpLCLv47elwB0oV5i7YtzaHsucA=;
 b=CnYTBW9mldFKQwEd03BDwJxd7IKxGdlUicdS25XDO6IwcM46F3YqrMac5+uys2VnwBQPAKKAhSxL31hxrOf9Tfk0f6Qjex+lrW/S5ftcWVfZjYP+kkIEFOuAVhoxnDJrfi1N5REFeYiNPGNuBAVC202WFUFwjKTAQSnQjUqLsCtXGbLfzYy8TnwKZekTCutSrLLLX0L/eP5SZR2I4D+zduo19Fu8reDFJ12Tym0/oPkRspiJDZcQyVrxyRBXFCgCqtGyQzult7LdXM2rZQCvCYcW3iuBBPMQKtKCEhsacgfPx4Gi9AgByLBS3hrD0S9GZlLEx6HWlSkQvvjRYqvzOQ==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by SN4PR0201MB8728.namprd02.prod.outlook.com (2603:10b6:806:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 03:05:21 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 03:05:21 +0000
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
Subject: RE: [PATCH v3 1/2] fbdev: hyperv_fb: Simplify hvfb_putmem
Thread-Topic: [PATCH v3 1/2] fbdev: hyperv_fb: Simplify hvfb_putmem
Thread-Index: AQHbisVR7t4ZZxD0rUKMdcBI7zWk5LNlc0AQ
Date: Thu, 6 Mar 2025 03:05:21 +0000
Message-ID: <BN7PR02MB414857F75A909C48A153556BD4CA2@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <1740845791-19977-1-git-send-email-ssengar@linux.microsoft.com>
 <1740845791-19977-2-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1740845791-19977-2-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|SN4PR0201MB8728:EE_
x-ms-office365-filtering-correlation-id: 02d31508-934e-4092-9f14-08dd5c5bbb69
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|461199028|8062599003|19110799003|102099032|3412199025|440099028|12091999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?NVHdLIhXgP7VdEZ1H0HJUKOAPo44XhX65+KMI+X2zEzXbAcptrmA2wZjH0UP?=
 =?us-ascii?Q?9AGontfDElvvyCZatPrjesT25RatD3O55zn3ZyqmX/0YAE87+P919DMPUOMn?=
 =?us-ascii?Q?b7//FuU86Wm9jyzG+7tuZ0TeUZbZwDGwM7i0P7TIGDHsd35282qr+XHBEeYn?=
 =?us-ascii?Q?Eemy1qQGvr00VTFC6EWsm8OQYhbM5NL/xBwN/iIaNNWUEax99743DG0TwOQI?=
 =?us-ascii?Q?UGfZ3PYaqd6JmwEHzNQ4jRy/fac0ufndq4QIAJY3HpR3I1LvhVG91D45w4dv?=
 =?us-ascii?Q?tQxgQsOHbC71ya2yO26lTHM7I+xCnaPjyjha02W7f6xne7zailXU2hsFVI05?=
 =?us-ascii?Q?x0eq/r2AWXK+Ox66Xwv+i4TKxtOsNmQro/TzflgnJwNhdoRlCFZXPWWt0wBy?=
 =?us-ascii?Q?SJqIrVtexqDG69QpuHL9NgbS1Rb/KSxpzZMsU+pKOAxHPGuzur53RuwFbuPM?=
 =?us-ascii?Q?R07PxUvtBRbR8bt/490i4e3oO+v9oJHt1KM4dEchCEiDAcLen8u9Zsh8klyd?=
 =?us-ascii?Q?AWnwIhYSwwjwvSzcC7OGhTbffjvFBBSMQePnQ1nXvslVTciNLkH1Q7t5/pCL?=
 =?us-ascii?Q?+28Z/pMHEHHbo6DERT2MfgpHTITV/3Yb4Bx6n5n95+SwjsAslzhpjBDHiU9s?=
 =?us-ascii?Q?BwtvpzBamMh1UGk3Q7/0j52zvRUTUKITS0zXBgiQS0JsvUqED50GL7VNKTmT?=
 =?us-ascii?Q?NPICEPT8W17x5RzAywSFChoDy5I+oYJ3VsQivuDtPWYHxJqMnbw+UbSg0snK?=
 =?us-ascii?Q?IJEPfhw8rXweoTUHueXBSlKJm1r+5/xqkK4Mjro6ifrIhIgEXuYxBj26sZie?=
 =?us-ascii?Q?5Y/UgO3XaX++zJVEv/f6U10g4gn0+ZMpng2v8QYV+Cq4M38H70n9ZmJZcEzN?=
 =?us-ascii?Q?+hxcPff4Anr+d7uU6LzXPqCXfl0bLjNjndetKgwrSYejrARvd+CNYrO55oSs?=
 =?us-ascii?Q?tfjJCifPAO+IwqDiwhD3JRlxM6KRAVRfVV/pXNtGGNL7qpLYG9CXUAuhVIqs?=
 =?us-ascii?Q?RKuJ3lCH8uiAaPLr0GMbGUk0wPZkKrAxv3wON8P0oqNJl1DscMvO8tt/klnB?=
 =?us-ascii?Q?3y2XaFL5aTv6pfLaIXnS9848cDYzZQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YlKTbWziW6CLaaXG/KLoiOhiD3heDnvwPygpvQVKUxWO2sDN4qpV0v5ulVD3?=
 =?us-ascii?Q?Z+p66DQw2EGvZQtjGVCF+LfAgU3T7IisFeoifWF+2AX3VY4HmHIisvEz4QCO?=
 =?us-ascii?Q?5+CZdcu1Ak8Cf6WVgEfs14HAnPy58Ey1YxwdqBfqHQLVtB7vhjrXhPEZ7l2V?=
 =?us-ascii?Q?wFFdPI4iRtqQCoe++GEL+aAQYZwqNu/yRIknpo66EJC62kowhrPk5O+eJqcR?=
 =?us-ascii?Q?/nEKTaWiR+BbMi0uqz/IR+f6DIFJ3vIPigU7IkNTidEc77MJBHov5tLKtbjK?=
 =?us-ascii?Q?zwfzIAtrIwv/2BV2chXsP9FWt2JYBkK4h5jwXd3T6DUtFArbjc0T08NtMgNi?=
 =?us-ascii?Q?Zu5g5HJxATluDpeJyn3SdnvpVJr7bULx0XDAjMYUR+7yuR6hk/1/3ekVUd9n?=
 =?us-ascii?Q?opiqjhvQXS9MDCtmP7AAJ/YUH0uPG/GjfkhHDRbCXBqi+Bb5cQ8kAQRB/a/A?=
 =?us-ascii?Q?mFSRa6lbDyZ+QaLVZi2Ik/t0YsbGfxWFwZ5SNTFysAsx3LJcFxbh+UhnmWIB?=
 =?us-ascii?Q?wh9tfMmgBz/mKZbnSlsShYhoxoc6ISY4s2Lu6Y+15n9xOfm6vtyCgyhmmR3R?=
 =?us-ascii?Q?fX20O+vmmTXOZ+N5HQkuudLwk8vDeiY6iHaT8AKWGGM14W2WSQyd5JUjQsEj?=
 =?us-ascii?Q?Nfq8+z5VCRvUVdFQo9BNfrhP7ymjmmv7H6rMC1KOBsVJoIZEFmJBBH4N5my9?=
 =?us-ascii?Q?tkPVRDwmmJr954GMUP9s+5TRxnxytSEXmQ8BhH5hMkTpLqrsinMVo4Bg7B4C?=
 =?us-ascii?Q?MRpqQsMFvBk0uyMGjv4G+wmZpNF/mpJuDrWU2+01IJ0KbZ9aExXM1EXwFoXU?=
 =?us-ascii?Q?Ixk3BiWfDJUCmZGYz6wnknh2tpc1XE/swoS0xh64ENxjTIM9kIBdW82AJAhB?=
 =?us-ascii?Q?zebg6l7MTpH5TgEyyrk/uVKwnj+0o7xr8TGayFxE1MuH2nrw0Jned1YXXHWI?=
 =?us-ascii?Q?y6IHst7nX++7LG95WZXiq11iqiWLZhpAzhqgEnVZCpUI9MIcdZs1x+qhaiWL?=
 =?us-ascii?Q?mXoDDwRor8xjmZmtlZ4uLhqzP6YxhqaJyuXWhJyhesKQatkK32TMr/WBCtar?=
 =?us-ascii?Q?JhAcBG0g25zy/76hwlo+3iDyouFtCfWhIZtF8CK6ms0xiB7Dah0bXaRP0JY0?=
 =?us-ascii?Q?doaX28ebOOsCIOzKKtSrOKWHS2hDQoFFhWZ9tp0spxkEEwRuQZ9HwD7kRKL9?=
 =?us-ascii?Q?MpqgOQhjZIcSCQdPTpwMR3Jo6+wZ40oRDHnQIbF5aBGlGxwGYip5BpWrO1M?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d31508-934e-4092-9f14-08dd5c5bbb69
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 03:05:21.2198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8728
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

From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Saturday, March 1,=
 2025 8:17 AM
>=20
> The device object required in 'hvfb_release_phymem' function
> for 'dma_free_coherent' can also be obtained from the 'info'
> pointer, making 'hdev' parameter in 'hvfb_putmem' redundant.
> Remove the unnecessary 'hdev' argument from 'hvfb_putmem'.
>=20
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 363e4ccfcdb7..09fb025477f7 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -952,7 +952,7 @@ static phys_addr_t hvfb_get_phymem(struct hv_device *=
hdev,
>  }
>=20
>  /* Release contiguous physical memory */
> -static void hvfb_release_phymem(struct hv_device *hdev,
> +static void hvfb_release_phymem(struct device *device,
>  				phys_addr_t paddr, unsigned int size)
>  {
>  	unsigned int order =3D get_order(size);
> @@ -960,7 +960,7 @@ static void hvfb_release_phymem(struct hv_device *hde=
v,
>  	if (order <=3D MAX_PAGE_ORDER)
>  		__free_pages(pfn_to_page(paddr >> PAGE_SHIFT), order);
>  	else
> -		dma_free_coherent(&hdev->device,
> +		dma_free_coherent(device,
>  				  round_up(size, PAGE_SIZE),
>  				  phys_to_virt(paddr),
>  				  paddr);
> @@ -1074,7 +1074,7 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  }
>=20
>  /* Release the framebuffer */
> -static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
> +static void hvfb_putmem(struct fb_info *info)
>  {
>  	struct hvfb_par *par =3D info->par;
>=20
> @@ -1083,7 +1083,7 @@ static void hvfb_putmem(struct hv_device *hdev, str=
uct fb_info *info)
>  		iounmap(par->mmio_vp);
>  		vmbus_free_mmio(par->mem->start, screen_fb_size);
>  	} else {
> -		hvfb_release_phymem(hdev, info->fix.smem_start,
> +		hvfb_release_phymem(info->device, info->fix.smem_start,
>  				    screen_fb_size);
>  	}
>=20
> @@ -1197,7 +1197,7 @@ static int hvfb_probe(struct hv_device *hdev,
>=20
>  error:
>  	fb_deferred_io_cleanup(info);
> -	hvfb_putmem(hdev, info);
> +	hvfb_putmem(info);
>  error2:
>  	vmbus_close(hdev->channel);
>  error1:
> @@ -1226,7 +1226,7 @@ static void hvfb_remove(struct hv_device *hdev)
>  	vmbus_close(hdev->channel);
>  	hv_set_drvdata(hdev, NULL);
>=20
> -	hvfb_putmem(hdev, info);
> +	hvfb_putmem(info);
>  	framebuffer_release(info);
>  }
>=20
> --
> 2.43.0

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>

