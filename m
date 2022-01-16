Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832F48FF53
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 22:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504210E145;
	Sun, 16 Jan 2022 21:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azon11020017.outbound.protection.outlook.com [52.101.56.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2790810E145
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 21:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuFuU7myd4qGjhMgw/TeoC70crY1VQzR8bf/WhbnpCVLlEIQpCjHrzMco0FtTJUVd/l3zgANmaNmog0n5HxRMxUOADvdPpyY+EsYU+8rPDB6gTq7v4vhdfy231IQt7ubpzBNwTr/uPbrZTsSpSHXCJpdqip5DU5pyLxYEMyac0GLjK9O8W5UB3HXEhNMJVtiFlPJkMJwrzUWQjPqqtI3IrQiS610oQPN1clXQ5V3GDNUz/g4vHjJkcZQ2SZeTKbFpgrBtVup8+nTDz6BqNtMixQnfhJi21GANlomIGLsK6yhUqAjeDulREzspEAkj541ZpZqMLwBiqIuXoC36/BvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSg5+eMoJMRlhRldhaR99wm7/CysJS8udUM/PARF4aE=;
 b=LFEKzm9lkEjosQNPhRE9uhnfJoqbXI3L471rbwtinL8DmDnzB0+XPy+IFiuPM+cKFDDxvBF9lT1vZq5ZuXnpt3oyUW6uZMdZHkoA9kPiLGB2XWbHO2SuHKsl2arq2xYr0gxI/2+xqu7be0TmjvCyKSMbo9D1kM9DEk+FT156tfC3aARhYzhnPN9fjdiNAEkg5nbvrjlXePSB7jhQ55MdNdS30jPLPSSVND26GQql7Qki2qtaiYvIRAMkvAIvQrVEQOXEHz/NeFdcum1rYodtwhsQnuNnptdSpvNXpbPfURO0/EPC29H4g8zCy5QByvHJTY0rPczSHbdG3J5m0NfxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSg5+eMoJMRlhRldhaR99wm7/CysJS8udUM/PARF4aE=;
 b=EGRHSHSx1i4Rg8nq8/zaqVjznO9Em1ACmJwLkHg8+Rb916cguIt5BoWS2gHnAW5pytDYo2VVt7oSf7lYqL2qNdAgDMANOiz8Y69eVMFH71QDgMoVrupJjU8GdaPz73wwsOVC5LyUNCMLBE/ihst1h0N2i53GsJ0g4x8mmkaerls=
Received: from MN2PR21MB1295.namprd21.prod.outlook.com (2603:10b6:208:3e::25)
 by BN6PR21MB0498.namprd21.prod.outlook.com (2603:10b6:404:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.2; Sun, 16 Jan
 2022 21:53:07 +0000
Received: from MN2PR21MB1295.namprd21.prod.outlook.com
 ([fe80::d1ac:adcd:9b00:28fc]) by MN2PR21MB1295.namprd21.prod.outlook.com
 ([fe80::d1ac:adcd:9b00:28fc%8]) with mapi id 15.20.4909.004; Sun, 16 Jan 2022
 21:53:07 +0000
From: Haiyang Zhang <haiyangz@microsoft.com>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Wei Hu <weh@microsoft.com>, Dexuan
 Cui <decui@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>, 
 hhei <hhei@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Thread-Topic: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Thread-Index: AQHYCw3r/9KVT2KjBEeZakYSFa/ZGaxmMHOg
Date: Sun, 16 Jan 2022 21:53:06 +0000
Message-ID: <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
In-Reply-To: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4f4c8785-cef3-4653-b8b7-0197cdb424c0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-16T21:51:56Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb4f12c7-c991-49fe-5b1f-08d9d93a9479
x-ms-traffictypediagnostic: BN6PR21MB0498:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BN6PR21MB049882354E35B671A037296FCA569@BN6PR21MB0498.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ZJ7QvpsW4b8kGfS2vu9ajASKsymfJ4Ppyu1jK/6n0QZ2zZn7AfTb2XXY3MSYR/CMTI48nPj/d9Kqc87LRgnIwDGnSpOgj4YsT2+59ok/m+8F5C9HeJ6eE+MXk1Z78Wk5Pj0lEZGrXhs71mhvwU2nXdFMFmQWuWlo43Wk8bANtuNqZCm6zMOJeaWsAEuOIMM1rMXdpf+bn1ZzeyZd9EkkFInMvBJdGIR8gx64kzPO0fL0HGQ98ZDgBvg+DnI9whPQn3jYUCiFfnYo3FqISRHINZYntM15Z+8Eah8mkAOdQsEgHvLAMnZue2/S9+06a/6XxY0q009bkalbDWEnnQUXq5yXaE+o0wWpe9FVGUFq5he46CLLzoemm1Ek8qANAK8o3Vnys9RH/m2NBjAfJ0Px8yiF+mx/OgqtSbGlQwOXvVcsEMcTrZccmLwc4PKYhPMopeinpsqa/37tF0wTkUqzTc9iHdue9ep65CzPWZxBrnGYJKUKgAHIksav6lyJGUj59D3aSn13vQwz6gKo51JvxSaO7Y3TQuZ+e7dteKqi7zExUke8tFlXy/TNAhXssxgdL4ZUWvXljdFcg4PjH+u/41HspJz00ewBm2zBwYNwBa9B1l6ritMZ//SlWu3d72VIPVTpduksMAiibxCUfPWZJ132oCWjrCxwWpEt+KQmb5eeamTZ7NHtPX6ePiXwFEfEr2ANHH3A5Exf5Edu7z+qLg7YP13BsdLYbH/l0RqK1jZs7bWC3L73Bsaj6XUVr6KK9rhmlxoYiLweBwGHJ97Rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR21MB1295.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(82950400001)(53546011)(71200400001)(38100700002)(82960400001)(508600001)(10290500003)(9686003)(7696005)(6506007)(86362001)(186003)(122000001)(83380400001)(26005)(38070700005)(921005)(64756008)(33656002)(316002)(66446008)(66476007)(76116006)(110136005)(66556008)(66946007)(5660300002)(8936002)(8676002)(2906002)(52536014)(55016003)(8990500004)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B3AaRE4MtFbz9rEKJFNeXsb+Y//NKpcEqOp5GR5XyXJCJp6akzsxRxSJ6EpD?=
 =?us-ascii?Q?UW+BxlEgj+qtjoGCo9TOI4KZpQmMalMVlKTkKFMdW/cAv4vk6ZTZQ89LgX5M?=
 =?us-ascii?Q?12crjm5hoK4bY9QCyoxIaWRCNxJdQiYKfTinlBH7Z8zoAeQiKWdCjFk2OV7J?=
 =?us-ascii?Q?3+/YvH6949kROh7Hsgk7csileFByCP93+lo0YeeCYWj/nIZozwSyaI/g7Lux?=
 =?us-ascii?Q?uxSqwa0ZXFEXUOZSjGBPZq7uB+Cd7bBZ9XKp+CnA6gN+25KoTg7ChrxMJlDF?=
 =?us-ascii?Q?hbfa0u4SUiDU1vUqlq8oe/JhxDQJmt9rLLHsurgEfFTyAXCNuZgmK+l0XRIV?=
 =?us-ascii?Q?J24fldcEIkMYaTKikQcIy3vDjEvrz5pMMpftweBT8LQ7wWAns8jnJyxEkXyK?=
 =?us-ascii?Q?ufbPOg9gCquKyrFZ/ts5zt4pBOJ5JBHuV1wH8oHliSL7xCgUWIOjgoMDhPmY?=
 =?us-ascii?Q?iCIki9LBUSC2QRS0wEQLwsLqMPIBuZSKdZCmz67FXfJEfUpKRy1d3JPUXWiE?=
 =?us-ascii?Q?cii/C4yqmpFMjrWhQvT+gfHPs+/E3nQVG5eMt4eyV1F63w0VvZOR9gOU7DLa?=
 =?us-ascii?Q?KTxdrM7bJNsp+s2VqWcs4PFOCmTLD/lneEFYyV9e6e7yVHtYZdwoN/GA0MLq?=
 =?us-ascii?Q?Y+6+fzi7TPn16ku+4J8neeTc6YegmA5LuQcS4h9jlEmmvFNZh1+Qc4V63D0m?=
 =?us-ascii?Q?sIjiGR2W2v9Hgw9pjOql89dEgscBQn5wrJBDm7CiOD2BFBScPi1Qn39NE9S+?=
 =?us-ascii?Q?mwHPjgX0T7AyPCqLLbsZbRRE8UlnpLD+vLi6rkIyAQZ9jPSAmwDYMUDV4UN5?=
 =?us-ascii?Q?+Lf62yE/inof41MdnKOIMzmZxQF1ySbNxmBqMHG4vnjPqumbolnYjbyVIvUd?=
 =?us-ascii?Q?GBI0AcjRVMJC2H/8GTtgL9/kDwxOg6sbOUj+vgxvhlcu3fkT2lkVSCgYiQmD?=
 =?us-ascii?Q?vK3ClqGhnCTwRfdunYhmpB3dQm6XNSLJBnlbBhasWB7b6t4LAibjz3MXB4zr?=
 =?us-ascii?Q?1ezqUdOZ02BT8cQwdvzHSa5/VyzoQdILCcfjO+yYpLMTIqcgqfySsMEx14CJ?=
 =?us-ascii?Q?3FaZv6DxxK53whmebOBaOZMsDebfBXnsApo1Y+8MKCfNr/0wfVUf/X1oNx4T?=
 =?us-ascii?Q?4EBQUfiIlAND0b3GDndKn0Vm/h6v0R/KUwNx6TJWh5wdDHcopht3JhlwRgQi?=
 =?us-ascii?Q?timOrUnXtYLMgUwNz36ke06PNbomQsqWwcUg6XeHNnjT4pbNBayJU8BH9JpN?=
 =?us-ascii?Q?s0hUiJRVoyGLXRr7vN6fBDWF4rdO9vBfS8DtlVlkgoI3pycybIxMfO05bQ0L?=
 =?us-ascii?Q?xmUBt8AT6/eAZoiW+eGSc9NJbxeZ2bnWSVRtKE9K29IvnjMVRO7Pe4Xl9r37?=
 =?us-ascii?Q?cFx7/Ba+eZwE8GfAnFv21SAYAM3QiUE3orTxQ6wcOqEPqsuZ7fefz0Khn7pj?=
 =?us-ascii?Q?+aOfFSaxn4Y6xeCVPAoaAZb/cgKKsMLS9uRx/PSfJAoaiq747+zXb0smF4+V?=
 =?us-ascii?Q?ErXQiFXLlOpQHDW9b/swjaq8xxDAadx54VTQASYoNM//Cy/KHJr9/ewD49gc?=
 =?us-ascii?Q?NX2rhhtrpXDu/LAob6bwkwWFD4zckGKsP8WzJjNEK1DdCQKa25efkGMckg4R?=
 =?us-ascii?Q?kA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR21MB1295.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4f12c7-c991-49fe-5b1f-08d9d93a9479
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2022 21:53:07.0147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsENiCUl/sKYXTnIqnCDicLUniOKbUix7CChRK2w0vJ0qzuhlaE2kqoBIRCund/w8aNmy+MOjg/qwIB7K/NDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR21MB0498
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



> -----Original Message-----
> From: Michael Kelley (LINUX) <mikelley@microsoft.com>
> Sent: Sunday, January 16, 2022 2:19 PM
> To: KY Srinivasan <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.=
com>; Stephen
> Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Wei Hu <weh@micro=
soft.com>; Dexuan
> Cui <decui@microsoft.com>; drawat.floss@gmail.com; hhei <hhei@redhat.com>=
; linux-
> kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-fbdev@vger.ke=
rnel.org; dri-
> devel@lists.freedesktop.org
> Cc: Michael Kelley (LINUX) <mikelley@microsoft.com>
> Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolutio=
n
>=20
> In the WIN10 version of the Synthetic Video protocol with Hyper-V,
> Hyper-V reports a list of supported resolutions as part of the protocol
> negotiation. The driver calculates the maximum width and height from
> the list of resolutions, and uses those maximums to validate any screen
> resolution specified in the video=3D option on the kernel boot line.
>=20
> This method of validation is incorrect. For example, the list of
> supported resolutions could contain 1600x1200 and 1920x1080, both of
> which fit in an 8 Mbyte frame buffer.  But calculating the max width
> and height yields 1920 and 1200, and 1920x1200 resolution does not fit
> in an 8 Mbyte frame buffer.  Unfortunately, this resolution is accepted,
> causing a kernel fault when the driver accesses memory outside the
> frame buffer.
>=20
> Instead, validate the specified screen resolution by calculating
> its size, and comparing against the frame buffer size.  Delete the
> code for calculating the max width and height from the list of
> resolutions, since these max values have no use.  Also add the
> frame buffer size to the info message to aid in understanding why
> a resolution might be rejected.
>=20
> Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen resolution =
from Hyper-V
> host")
> Signed-off-by: Michael Kelley <mikelley@microsoft.com>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 23999df..c8e0ea2 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -287,8 +287,6 @@ struct hvfb_par {
>=20
>  static uint screen_width =3D HVFB_WIDTH;
>  static uint screen_height =3D HVFB_HEIGHT;
> -static uint screen_width_max =3D HVFB_WIDTH;
> -static uint screen_height_max =3D HVFB_HEIGHT;
>  static uint screen_depth;
>  static uint screen_fb_size;
>  static uint dio_fb_size; /* FB size for deferred IO */
> @@ -582,7 +580,6 @@ static int synthvid_get_supported_resolution(struct h=
v_device *hdev)
>  	int ret =3D 0;
>  	unsigned long t;
>  	u8 index;
> -	int i;
>=20
>  	memset(msg, 0, sizeof(struct synthvid_msg));
>  	msg->vid_hdr.type =3D SYNTHVID_RESOLUTION_REQUEST;
> @@ -613,13 +610,6 @@ static int synthvid_get_supported_resolution(struct =
hv_device *hdev)
>  		goto out;
>  	}
>=20
> -	for (i =3D 0; i < msg->resolution_resp.resolution_count; i++) {
> -		screen_width_max =3D max_t(unsigned int, screen_width_max,
> -		    msg->resolution_resp.supported_resolution[i].width);
> -		screen_height_max =3D max_t(unsigned int, screen_height_max,
> -		    msg->resolution_resp.supported_resolution[i].height);
> -	}
> -
>  	screen_width =3D
>  		msg->resolution_resp.supported_resolution[index].width;
>  	screen_height =3D
> @@ -941,7 +931,7 @@ static void hvfb_get_option(struct fb_info *info)
>=20
>  	if (x < HVFB_WIDTH_MIN || y < HVFB_HEIGHT_MIN ||
>  	    (synthvid_ver_ge(par->synthvid_version, SYNTHVID_VERSION_WIN10) &&
> -	    (x > screen_width_max || y > screen_height_max)) ||
> +	    (x * y * screen_depth / 8 > screen_fb_size)) ||
>  	    (par->synthvid_version =3D=3D SYNTHVID_VERSION_WIN8 &&
>  	     x * y * screen_depth / 8 > SYNTHVID_FB_SIZE_WIN8) ||
>  	    (par->synthvid_version =3D=3D SYNTHVID_VERSION_WIN7 &&
> @@ -1194,8 +1184,8 @@ static int hvfb_probe(struct hv_device *hdev,
>  	}
>=20
>  	hvfb_get_option(info);
> -	pr_info("Screen resolution: %dx%d, Color depth: %d\n",
> -		screen_width, screen_height, screen_depth);
> +	pr_info("Screen resolution: %dx%d, Color depth: %d, Frame buffer size: =
%d\n",
> +		screen_width, screen_height, screen_depth, screen_fb_size);
>=20
>  	ret =3D hvfb_getmem(hdev, info);
>  	if (ret) {

Thank you!

Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>

