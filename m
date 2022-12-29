Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46A658EAF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 16:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436110E3EF;
	Thu, 29 Dec 2022 15:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU002-vft-obe.outbound.protection.outlook.com
 (mail-westus2azon11020026.outbound.protection.outlook.com [52.101.46.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA7F10E3EF;
 Thu, 29 Dec 2022 15:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7qz9zPeLPdUlV/MxmDppT0AGJ6/ozH9hFpC8oFQsSnPtHaoKPpgiu0SKFGw1Qmsv4UumKQJNQhlcvIdZrVr9/y4PnLXYbTMHiIatoEeOGk4PbjZM3EbWKdVvvHLz3Dj3thSDNIhgvnN7ORkqjgc9cVIk+cDvl2TZD38rvqZHXp5sORGKEt6aHZj/TPs25xpLlBnhgAU8RFHErzZ2yT53PVVBq+E/l7ZHB87J1ryohm9vEDWtPYh3DXINM0CJPRmBH6h1gB7uEGQryEtGM0nAPby003//LiiYVnl7J39TfgH3vWINJTLTLWYOCTGoQxkfCgs/h6jCFyTP9M6qI8wJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMqbUgvhPnFSaq8qaAp8g+oUSRhCQxu0K/dKsQTzQEw=;
 b=XC9CQxtsFh7fdWMnoIzdXR12gVRX+NodwP105f7jXrVr//8yTWr01tNdfHTH+ztkNGTn/vhI7NcFqdDSywi0LnHJUFqHfPc5lElnB7TMKWvT3ErRpW3PsHiIpglwjyE2LX87t8kmT0ak/AMgt0gJOF+mQrANNySP6CFP/y8aLnOv7ovWIOZM8eqv8qS9dE1u098Jqmt1UI1A9LxQAKN5sRCszRhj53BlQFpP5DdZS+9sst9vswzWw0fyQQ0kDKOUa13DNFlkw3/6PQRODUaW+EyTarXmDlMrFaJfBkdXJwHYl7y7nA0kMgGD0UasFTx8g2eRwZbacEaUHYOhgDcf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMqbUgvhPnFSaq8qaAp8g+oUSRhCQxu0K/dKsQTzQEw=;
 b=aQgC7jgwO+SsBf7gWpeGAsMNQvQyL4st4lkNbQMzW+pDnSCW1SaGTWGTVDDJXYUhI88hAeBaJlKF4PkrlGIiVwxF+Pa1Q77OcW0RcyXcMkwWQa77M/DLbf/enQuZA40AauIjEb3DmryKuV5pa5xRpTnLu1J5YMvCm3Dh48Dep0M=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by BY5PR21MB1410.namprd21.prod.outlook.com (2603:10b6:a03:232::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Thu, 29 Dec
 2022 15:57:36 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::db1a:4e71:c688:b7b1]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::db1a:4e71:c688:b7b1%7]) with mapi id 15.20.5986.007; Thu, 29 Dec 2022
 15:57:36 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "javierm@redhat.com" <javierm@redhat.com>
Subject: RE: [PATCH 08/18] fbdev/hyperv-fb: Do not set struct fb_info.apertures
Thread-Topic: [PATCH 08/18] fbdev/hyperv-fb: Do not set struct
 fb_info.apertures
Thread-Index: AQHZE8PKXOCI5g/V+0Kur/EU/q61Ta6FFFsQ
Date: Thu, 29 Dec 2022 15:57:35 +0000
Message-ID: <BYAPR21MB16883E1B4E7A685EE4CC5142D7F39@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-9-tzimmermann@suse.de>
In-Reply-To: <20221219160516.23436-9-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b26a9e3f-2fc8-4dd1-8189-e3d8a093c2d8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-12-29T15:55:16Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|BY5PR21MB1410:EE_
x-ms-office365-filtering-correlation-id: 412a947a-202f-4500-4d9b-08dae9b5675c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9QbZIagjV8AmBo6Ovk10TuliXsP/cqWZ5t8N6SK5eYVdk8jia0DDFNNf1K4sUt84UNbbbpbXEoZ44ojtHJeKUqpOG9i8qwxQucHPEfPomFfxnFgX0WIFXo4DieBGOtm1TJqkOJHtmP5m6MVHS+s67NRecPV3RDefbsLK3dposcXgwXh0oyGrPRk2809q5cGfWl8jkCfcbgiWobgESqbAJAzykgVVgq+HS6lOLKoF9TL/vEmjv5MSYQuKRfnLFmUgDb3dYGPpKsGQ/KCUTvCrHIV/5osRJtBeOPQtAzHGU1djlfW4CKqI/6g/cnZz2MrMnU68uKAAsyheBh9jlHiASRvXfhB4gxqD65HVYZXitxRptYuobFflxg0tgXKeGMmEeAJZhtLwoLubAV2MGSP8DWaY2jT5Ji+Fj0M6mdtqq/S/xBb9Qc5PsW4696K4ii+keejw6wtTxP+CrQ86zVt1pr3J6pdX3KBBkQVZ5/k01wEhSGo0c+T6TcSJ4Jc0eL7ptilQo/07ECIF00ZkCNyqLxihs5qWtJ1MstOnh+xGMfw/upYvwSYrobAfDQda0vlg0f/sO7eqEtp9cImXhO0/Xg4pLDVYPXpNtRxA3yiLcHlXD7hHcnwDEgeVfqDm4raVKU315ykgRg0HVUD6/47EJlY/mylOo4InLjZy9wCSFOcQegD/Wta2WSjjseOWohBaNsh8gZpWIuHfB3GN6ZB6p9LvpgoxsNEkpNbZ1U6qmcgEEdJOPX/bH3NY7fbSM+O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199015)(38100700002)(82960400001)(82950400001)(122000001)(10290500003)(33656002)(86362001)(38070700005)(64756008)(76116006)(66446008)(66946007)(8676002)(66476007)(4326008)(66556008)(41300700001)(110136005)(54906003)(316002)(55016003)(8990500004)(2906002)(7416002)(5660300002)(52536014)(9686003)(8936002)(83380400001)(478600001)(7696005)(71200400001)(186003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B9fzLlubny1ymtAfsPyZt+pXsQq0gidCuVvnNL883dteKtt6fdX61Nod0Wx8?=
 =?us-ascii?Q?dP7JqnnWf0wC9GHHjesuqP64QA0MW5uuOWAV5InBNDy3DuNgbEsmNH0OL5tu?=
 =?us-ascii?Q?ke6ChYmZ0VifJnrv67qmzSWO0YSEhbJwE3Wu7jIv9bpmfT95/SdxTkL43kQ0?=
 =?us-ascii?Q?2gdeFXvW5cy0ycU+c5K4UpwJW67/TSun+CFOsvLkdvf/664D1eWD4BONVaRK?=
 =?us-ascii?Q?wj5qITR74Sl1pJF/dL6rJcBhMxSNLrgv9lFb95vUK35ICfKcQAo/2NVCV7lL?=
 =?us-ascii?Q?CyFduSBQfzEpvygrrn2sXaLaiNa9YKSlv6OJld6X6ucKvkktOeCva52RO8xG?=
 =?us-ascii?Q?fTxBd8I7ZhZymx+b1fCMyvuNNK4FRvaLEhexRE6IseqvLqUo0Gl/BL9KpHSA?=
 =?us-ascii?Q?wIt0DvgHcb7BfmeU1stoKhxSGw1R6AawEvigztOOwAEyiCQPPDhlH98WtuHp?=
 =?us-ascii?Q?iHsO48+fDvE4XXpn2z3oDhaZ2ec9DAPT1tjzHk0eI5F3SA7ti4SA7j2+ifHx?=
 =?us-ascii?Q?W0/MttJT7vxi0IzDrsj1VDBFcfjxKTvgIEvZYCyPgV9P8XwjFf/+GIkRpmvq?=
 =?us-ascii?Q?4Akm0EpsBMHbwgoTb2NXq7zgECtXrME3PdOz/tDYSDN3snfJ6ZOUJRDNpdis?=
 =?us-ascii?Q?pxr3bdDGvXeyXo4S7NZT+9aGJcq//8WXbxKeOGlCoKY1Kn+l8XvF3K6oXOzg?=
 =?us-ascii?Q?ELQHEmmKVz6Gi8C/w9HFtbMypEj4pE7WfVyI+eyDta4rFUE9CxYQwsQMW9WV?=
 =?us-ascii?Q?k7efBKvdAKFCNuLjoYkrdz2567VB6Rq+3XqJR2eS6y+Hq3MnJ8t5iwhDQ8p7?=
 =?us-ascii?Q?KXTSPT/pFasGVBACaTCW2NVuwXqH61lCfHuW1czQLoidKqIFiS4pJjTK9prN?=
 =?us-ascii?Q?e0siA1f5bcrcCiYvo2b+KSSXuBXVSpsYFtCRnrpq1H8BQdHtNHoaZWTcm+fh?=
 =?us-ascii?Q?crs+YJ9dS4CXY2pAvflSDPRNwRe0NYVW8h7rfAIJLqM/hEOv5puLMih3jV2+?=
 =?us-ascii?Q?R+PCpZw0o8obsf7NVdGJ9P7NlXq1h6VfvMm4bBJXJJfW53kkXZt8DFyTRh4Q?=
 =?us-ascii?Q?wuaHh9tSrz6/2epCfkq3YpbfxcNxYP4GsyVlBoitzcVoT6fmmjFZk8kRfTgt?=
 =?us-ascii?Q?hFEqLvnKPOpiu4IjR5oXn8b/v5K/OxLsLxeFnDeVfOcP8ZrFcgRfwlVkWHds?=
 =?us-ascii?Q?9N6j+8IGzcm9Z79En6pda+nO8zEq87VJ1+ZZ0xYzbqua4A2ooBglZRLI9Qwb?=
 =?us-ascii?Q?Ah3OrKPL+Qz5DuTcPruBP62I8WgF+BGulSAYWkzfy5KBzFZ7Io9pjH49jPpy?=
 =?us-ascii?Q?D2foC4nht4AG0xzTIgT02gtbUpKa0zgjep67/ZU7AElMS18OF2rKK/rgxzyZ?=
 =?us-ascii?Q?jkGf31QSFy21DNuz2y6z9LtT4fC5k7XW6Q4yqYFhIzalXcfzQVqyxDBDut18?=
 =?us-ascii?Q?jH0VrnwQ5EmA/QMRdoZ+jd4dxWDiVFKg0b+0cuTDf7aVqhQ5Jf0Un3JJMZfb?=
 =?us-ascii?Q?Bmy2AbgVbObPv8Kcqb9RbZ7pTU7c5USo8Ar+QAGsNctI0a990m7+ml0aG5WT?=
 =?us-ascii?Q?Um3wKL+vfqATGUtjDXqlkDHtcbjUTpLDfr7M5dCmvcoxYTbVhxb14g7ho3V6?=
 =?us-ascii?Q?uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412a947a-202f-4500-4d9b-08dae9b5675c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 15:57:35.8176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLrt+wI0JeYtfgEXm4279hc77Hr8/VZ5NfqMjcK6d1ffvUUqB7kwTZA1Q+HFp5l2vSTmaJZXZfp1eYZqJqu0ynWT70okGcDKG53xXbZJIsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR21MB1410
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Monday, December 19, 20=
22 8:05 AM
>=20
> Generic fbdev drivers use the apertures field in struct fb_info to
> control ownership of the framebuffer memory and graphics device. Do
> not set the values in hyperv-fb.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index d8edb5635f77..1c7d6ff5a6c0 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -988,13 +988,10 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  	struct pci_dev *pdev  =3D NULL;
>  	void __iomem *fb_virt;
>  	int gen2vm =3D efi_enabled(EFI_BOOT);
> +	resource_size_t base, size;
>  	phys_addr_t paddr;
>  	int ret;
>=20
> -	info->apertures =3D alloc_apertures(1);
> -	if (!info->apertures)
> -		return -ENOMEM;
> -
>  	if (!gen2vm) {
>  		pdev =3D pci_get_device(PCI_VENDOR_ID_MICROSOFT,
>  			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> @@ -1003,8 +1000,8 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  			return -ENODEV;
>  		}
>=20
> -		info->apertures->ranges[0].base =3D pci_resource_start(pdev, 0);
> -		info->apertures->ranges[0].size =3D pci_resource_len(pdev, 0);
> +		base =3D pci_resource_start(pdev, 0);
> +		size =3D pci_resource_len(pdev, 0);
>=20
>  		/*
>  		 * For Gen 1 VM, we can directly use the contiguous memory
> @@ -1027,8 +1024,8 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  		}
>  		pr_info("Unable to allocate enough contiguous physical memory on Gen 1=
 VM. Using MMIO instead.\n");
>  	} else {
> -		info->apertures->ranges[0].base =3D screen_info.lfb_base;
> -		info->apertures->ranges[0].size =3D screen_info.lfb_size;
> +		base =3D screen_info.lfb_base;
> +		size =3D screen_info.lfb_size;
>  	}
>=20
>  	/*
> @@ -1070,9 +1067,7 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  	info->screen_size =3D dio_fb_size;
>=20
>  getmem_done:
> -	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
> -					    info->apertures->ranges[0].size,
> -					    false, KBUILD_MODNAME);
> +	aperture_remove_conflicting_devices(base, size, false, KBUILD_MODNAME);
>=20
>  	if (gen2vm) {
>  		/* framebuffer is reallocated, clear screen_info to avoid misuse from =
kexec */
> --
> 2.39.0

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

