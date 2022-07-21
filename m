Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA057D2C3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 19:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF12210F540;
	Thu, 21 Jul 2022 17:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020020.outbound.protection.outlook.com [52.101.61.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606AD11B9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 17:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvJ12t564vUFyG3oe7uKrdq0XEBeqNbopwtAKfypLtBKffrwhCln9qC9p9uF9PSIDDDhuojLmgyAY9eBNvsCn4kOVLHaFHBEUmT+p3aJDAR7FejpXwaa/+ZWcxSWkezAG2ZAd/qSCuXEy67goMxUlrJjNEgZMe6r9qrVhZAYzRkkYYXe2iLATu8jT/cTn2qE0Tb8zm9DNNiDMTBYBuASUkHA+X6tzBrnN2e4uU11O81DP5m49kjlQSklvBqyo0Qz08mZBO9gIO9wPabBSv/ivcGE8WsRK0NFOhI0DSMFkpiFwl3mHmLSFV9oh9gXIEGAts/Nd5tOwaBaQURwyrdslA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Glkl8OKkHMt3TigpTQ2/1x7E8QORN2lpw0xAIPco0DQ=;
 b=EjbJamfrejqCnNvwSEhiY850N9Kvy9WJDUBKpY+/SSbFkAmKpXMMDjRD//lQBOqg/T5Yxn8VwFr6QY83y2ZuC0Avd5ySmS/5JxY4G7hIFtd6zi3TI4fzBrfwiDo1Ygz8iJF6uuC/SBSuozNTz/z7erC0H4icwZ+XxGER+MIdMARJNZl4XYn8+N5jQAHbsz5oFacAmbVRfHq2sqzG5AD+GklBRZIGZyPTppTeDzhWyMQT6x3TlHeU7KaXx+tyb+5T3GMKFW0OslUZFXT5qbQu23cSTbuGURltH1pSnuG6Gj2TqQaqVQtPmzn57Hinw7+73vMBbrmR+yYZ6ROxOiK4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glkl8OKkHMt3TigpTQ2/1x7E8QORN2lpw0xAIPco0DQ=;
 b=FTRi38Q3Fhrj76W7CHQkKVpVb6lNefjexlI4KT6RBUKlr4PXvgg0cFdoh9sg6bzQ34OEgQM4K+dcC8IKebScQdciT9tOfvtFHAdE9/k5ngM/vPaJ44+/mpWK29xljJxCb0ARQFPNTYlPCHg0ZWa69qvfpCBrszdZPl3j8+hbRUI=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by DS7PR21MB3052.namprd21.prod.outlook.com (2603:10b6:8:70::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.1; Thu, 21 Jul 2022 17:50:55 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::ddda:3701:dfb8:6743]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::ddda:3701:dfb8:6743%4]) with mapi id 15.20.5482.001; Thu, 21 Jul 2022
 17:50:55 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "deller@gmx.de" <deller@gmx.de>, 
 "javierm@redhat.com" <javierm@redhat.com>
Subject: RE: [PATCH] fbdev: Fix order of arguments to
 aperture_remove_conflicting_devices()
Thread-Topic: [PATCH] fbdev: Fix order of arguments to
 aperture_remove_conflicting_devices()
Thread-Index: AQHYnNpV/acnX718h0KpOASc3kYn/a2JGseA
Date: Thu, 21 Jul 2022 17:50:55 +0000
Message-ID: <PH0PR21MB3025FE4A5333681D2570A381D7919@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220721081655.16128-1-tzimmermann@suse.de>
In-Reply-To: <20220721081655.16128-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d4baedb8-e33b-4a39-923c-1adc6f1ba5f5;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-07-21T17:49:36Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b972d2b0-834e-4fce-be20-08da6b418fb6
x-ms-traffictypediagnostic: DS7PR21MB3052:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GctpFKragu2od8h/qyksa8Rdw4tiF01mSTktUTJOBKD3h2kxfYQA0VQwyKWJGLsuK091qS1gzCXuIPHyx9nokVRR9m+7gFDuwtA0dRG2Xx/dwmaB3qZVRID2cXO3wX91uKpGO4jYdSJNT4Znxx2nFx95qAPqJbyS1DS5qaekkCIV8wfOiEqMj0Nv0lVJSv1MIwlY9sCAEPt/ZzuQCgkVLa/hgO892M9aEb2p2yJzFbIK7MyxTr4XPdbFwTEAi1CZsquXZNBCLIxt/XrOyrwyuzhZrOgyCHhsw+qZ0RrKFRnFqgQHevrW6Q99bhzXYzWoxdqVXbvhJPfaPcjH9E5yto6kTSsPyLPELFETNTeum9T+R1eK1lg6WKbuHw2CPzjLLC4qWDAiBckO148sCz5JwOM9UyfDQYRrgcesiInG9fnukClgfrFYInWi8t3b6//yqj0fBCewVRp0OSiAlyf1MZyWYWVX69d8bGMk7RgiFZ4FXsvBPgIg+LWLwvJKs7hxLI2WFM3F3mqZl67kgpqc1MderVoxK9bTukfMEIlb3nA1rp5Z1q1+5irrGjpKYR4KX+ACSnuc9lZwBSYwU9cabYi8zWzlgv+EkQAYma8akXIhTJ7Ff7T3HcvNKXqQEEsYR5n0lUm1hLcry7Gh38Pv9365x1M45sY6jzkuu9WfrFyM/rXweSHTqIpBKMPNsgZ6F5+3OGksS2XMhXtUj4lWuVVwOLdw1m11Y3qNEHvv0vXnHB6OzaOjXrlS/p0ygoY1Ek/iJZNGDKT70LMc0YtTGtuQMiUrGSwRFLKi7A+uiyr0izeH0jcZ03ODrv7vlKRoznD/dlzk5QRiI1UDRvaGjXw3kI78+W5038/XmgzQ6la2Egpg7Hlu7RYZm5huvjXJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199009)(66556008)(38070700005)(186003)(38100700002)(2906002)(64756008)(110136005)(66476007)(83380400001)(122000001)(71200400001)(66446008)(316002)(4326008)(76116006)(82960400001)(6506007)(5660300002)(52536014)(478600001)(26005)(86362001)(54906003)(8990500004)(66946007)(55016003)(8936002)(7416002)(82950400001)(10290500003)(7696005)(8676002)(966005)(41300700001)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QIKPHd28ZLPe5NpRNx3nSuicWmfefkgntjCk5ImUtQkCyQqn9IIryR0NWsrx?=
 =?us-ascii?Q?STR+bc2W+Vg2qEUh+VD2jfI3HvyoT/2qQvYhSbmlEvM7GEcIfBHOC8KpqpFG?=
 =?us-ascii?Q?NyTBqgoACczXthz5/honLnWtpJcfR6ZEmFwe9ysY3Y6m8P9c8Eig+zsu6eOa?=
 =?us-ascii?Q?fRUm79/7q7xrP4JltzKZh3WhsngrE2vqriu9nl+Wwkj2BIhFLijd1EyHyCJx?=
 =?us-ascii?Q?RQsbh7z+Urb/s07ecU8fx3sQYLpadZKykwWLrW9tCmMXMwHqmC65ZtsqnBxB?=
 =?us-ascii?Q?dVH4nm5fRlfVkA8Im3uEdOrQbKcMByR6JV8MggCdjvVww5W3o8yV1JP4p6Jt?=
 =?us-ascii?Q?cHGmh2UfY1yM3ZD8mY6pFyV8KO5lAxkULe97kiag/3Y/8PHD7trR0eiiiK3I?=
 =?us-ascii?Q?NWenGsy/+6YjgFNfcIv8riEg18Y/SqjRneI+fz6bE2XFCPLIXScetuL2tKRH?=
 =?us-ascii?Q?MKmGmt2ndjGOz2mwGJkqgRRlEGJNgsoMFAV9VavrXGbBcNKw2NR8PyakHP0x?=
 =?us-ascii?Q?7HonIH6mvn3W1dKZ3yt2cC4pJJz5B8pCppAdc5U6qylXK2RH3QekCdJQjqAt?=
 =?us-ascii?Q?bZWz1cvI1Nng1HeadSqts8x11J5kvqE4mKeTU/6BgxWfh/hh7eVDkYOO93YJ?=
 =?us-ascii?Q?z4L0ypLegJd9mNcVj7FItziBWewE96W4Rgg0cjNPqdATKmtgg2eVVwTiJeOX?=
 =?us-ascii?Q?OEspfanhDMePja+3QOlT6PsvOFjVwbFcwcwsj12F1NccRnDSptsNUgoTbjhg?=
 =?us-ascii?Q?fO7DI4QcwnCr+jS0nzXC+/zjbyups00VgBel86aIMuzT+z2O36yGlFmfwRqy?=
 =?us-ascii?Q?OZ/Asiu5evqOmN1Dw5l7B11fZOGfc7AhkDqBtMRbKZPwBDhr1NZXXqC+pL12?=
 =?us-ascii?Q?eilr/qnG0BSMXEUvFJDFil49bwKn5b678jVkc/LfKU0CmQBoCmOjP/g5XeM2?=
 =?us-ascii?Q?PzGpzVPO49AcS4uj27mPFWljLaQNGSNGh9oGxkfRlXJkr+AsAgqYHWa1IjAj?=
 =?us-ascii?Q?NsAJ074rX5498yTTk5CKEh9me7vg6AcdQ49C5jfU5NNDKKD9WtCN3QP41pnA?=
 =?us-ascii?Q?P1RBzvh1Fcj1evAUgFCwzlUEcSG34Q+Bga/XAqtEWR39WcQRSi70an8+NIHu?=
 =?us-ascii?Q?QgXuzfZaw/6Yr9E8137lEiQbUaWcrPWCXSLnz0nGygMRjnBfWG2G6ltIMRVr?=
 =?us-ascii?Q?zmee4ZztzD9oAEHCHLk5dYumdKnq+a+N88F7MChn8HjXox+TpH4nxVFdW2NM?=
 =?us-ascii?Q?BEepDN74mwfsoeU/pbrPPNbVOUrY9++egjjTNtKJa2PhWyDxGqiqF2OON81X?=
 =?us-ascii?Q?uvXnnBmARxGKO4NUCNfK6UFVowv4cYl29927EyAV/pA9B7ThGvVWBfCoED5B?=
 =?us-ascii?Q?xSRHTjOS1UFoUFD+WQOEBdERz02UWwHC6xKHSQKcWZ4ViO/un96KgmzaN42T?=
 =?us-ascii?Q?oIgD7ojCKOtZcXXYvr6mzMLjLNwb2xtVxK2+slGxXENMLyWwRUEsTbq72R1v?=
 =?us-ascii?Q?Z2dYxb5ynEeov0RtwbYBbMxXNhM2D7KbsmQgVEJUTliXQx4p3vPtuvdzys8a?=
 =?us-ascii?Q?N76oP9XzXFHFB8Vi5dYH9jh5sopxOY4pC+BKKbZsyF5dPr6dI8z+So2Fh84V?=
 =?us-ascii?Q?vA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR21MB3025.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b972d2b0-834e-4fce-be20-08da6b418fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 17:50:55.3885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APNTOBufMD6F6HF+IbBaU5PMkCdBagRglMpJlJANML3bniQBalmGT+/CUJ5IDxzes2YIE4FBrwf3GMSrYQyvvEo75gw9EQnUtRI0jH2t1Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR21MB3052
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
 Stephen Hemminger <sthemmin@microsoft.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 KY Srinivasan <kys@microsoft.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, July 21, 2022=
 1:17 AM
>=20
> Reverse the order of the final two arguments when calling
> aperture_remove_conflicting_devices(). An error report is available
> at [1].
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 8d69d008f44c ("fbdev: Convert drivers to aperture helpers")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-hyperv@vger.kernel.org
> Link: https://lore.kernel.org/lkml/202207202040.jS1WcTzN-lkp@intel.com/
> ---
>  drivers/video/fbdev/aty/radeon_base.c | 2 +-
>  drivers/video/fbdev/hyperv_fb.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/aty/radeon_base.c
> b/drivers/video/fbdev/aty/radeon_base.c
> index e5e362b8c9da..0a8199985d52 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -2243,7 +2243,7 @@ static int radeon_kick_out_firmware_fb(struct pci_d=
ev
> *pdev)
>  	resource_size_t base =3D pci_resource_start(pdev, 0);
>  	resource_size_t size =3D pci_resource_len(pdev, 0);
>=20
> -	return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME,
> false);
> +	return aperture_remove_conflicting_devices(base, size, false,
> KBUILD_MODNAME);
>  }
>=20
>  static int radeonfb_pci_register(struct pci_dev *pdev,
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index a944a6620527..a0e1d70b90d7 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1077,7 +1077,7 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct
> fb_info *info)
>  getmem_done:
>  	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
>  					    info->apertures->ranges[0].size,
> -					    KBUILD_MODNAME, false);
> +					    false, KBUILD_MODNAME);
>=20
>  	if (gen2vm) {
>  		/* framebuffer is reallocated, clear screen_info to avoid misuse from
> kexec */
> --
> 2.36.1

For the Hyper-V frame buffer driver:

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
