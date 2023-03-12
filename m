Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5346B6517
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 11:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6D610E05B;
	Sun, 12 Mar 2023 10:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN3PR00CU001.outbound.protection.outlook.com
 (mail-eastus2azon11020024.outbound.protection.outlook.com [52.101.56.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDEC10E05B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 10:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQqDcIJ8uQ/hZ2r/pUS4+Xm/sxJ4V+UYd31hhEXk5BolMHj0cAe+hWwvAv/2wAlGWcK5mhOjnW6BPhkPJn7Ov95eH/+YHjgo+1m0vFQh6kmUg64zIC5zoquDyYh4sBz9NWelFQktym8Zvrq/CJib6EnX1XAKM6oLmqgw2YRs2PFrYfZ8VJMwTuco+SZB8jwxF55K2hJHWjNFcsFgVX8nyWs73jMXyzHk2QvfH6ZGkdqtUIYC0V9YnjvYxBiBYcZUmS0YD+Sh9ZIe15HzGT4Lwl2TgGBUF2NlCOB376d5aLtX0OC6y+H4HV4kRB3fVRl9qGYeFL32y+AeXm6fn5U3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCiXqIwAt8Q4/c/hCZ7g5Sh9iBVR4QYwuZbdlt2eWPk=;
 b=h7puDSDMfKDqlfYPe0wdGnuSz18oiEIx1lBknaLFp/xcyQJZmov0l6DoJMWz/FFtTxAPFlmtIEf+cISr/DQb4TE4OEPxfRDrAIbNEKgIr2b6m3RkGbT8ISvjF7KhcUQWdzYBwC8OcYb1NChtkmL6zSVB3EKh9+rfdkL3ZczG7/ZxnNV8ULFGUGK/ih07qQygYHO/iokS1tKfEe98JglNo0PQlaB6vOJ8zZU1Cw8aonrgaqAszr00jeMSVYdYoXPWE/vnyubmvwEcOTJZBlEf87rtkMjGGA5+6ngCgz+KW/NUHcQc/WxMsBSikJI9QCKPIRRI24BpaSO4+HIJVwtLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCiXqIwAt8Q4/c/hCZ7g5Sh9iBVR4QYwuZbdlt2eWPk=;
 b=DM46grrZ3wheOXFSKEiLd13+2DcOW+33mePjx7yC/miaV1cij/3BGStPJbc5ZeFJiPwjpk9xDcgIMEb/tzjlmNsXU8gOMG6d7CT5mUxmClrizUjdhYljcqCKJ5B5jtOo3+mjsXPu0AVbufUQvQP8I9NUHJmm40VmicyQqvBAx38=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by LV2PR21MB3110.namprd21.prod.outlook.com (2603:10b6:408:179::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15; Sun, 12 Mar
 2023 10:51:22 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::629a:b75a:482e:2d4a]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::629a:b75a:482e:2d4a%4]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 10:51:16 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "deller@gmx.de" <deller@gmx.de>, 
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "timur@kernel.org"
 <timur@kernel.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "paulus@samba.org" <paulus@samba.org>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "pjones@redhat.com" <pjones@redhat.com>, "adaplas@gmail.com"
 <adaplas@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "mbroemme@libmpq.org"
 <mbroemme@libmpq.org>, "thomas@winischhofer.net" <thomas@winischhofer.net>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>, "sudipm.mukherjee@gmail.com"
 <sudipm.mukherjee@gmail.com>, "teddy.wang@siliconmotion.com"
 <teddy.wang@siliconmotion.com>, "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v2 031/101] fbdev/hyperv_fb: Duplicate video-mode option
 string
Thread-Topic: [PATCH v2 031/101] fbdev/hyperv_fb: Duplicate video-mode option
 string
Thread-Index: AQHZUqEMCW8/QSrXq0ig6mrfyG1yaK72+4hQ
Date: Sun, 12 Mar 2023 10:51:15 +0000
Message-ID: <BYAPR21MB168885C08CBDA49767030419D7B89@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <20230309160201.5163-32-tzimmermann@suse.de>
In-Reply-To: <20230309160201.5163-32-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=29256458-132c-42aa-8239-ef79f0ab6109;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-03-12T10:50:01Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|LV2PR21MB3110:EE_
x-ms-office365-filtering-correlation-id: 1317eb84-55a2-4bef-9fff-08db22e7b43c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abSM0jfxzQQWFNe4kCDBvgq0Y68KXtfqYPKr1WOAxMdEPHtbwXrwM45bBxUVQhm8mYj8xF66z6mJDZJY2Sb/XKe0+bFZEYZ0AUk0YzL3pBWGpzGcmwP3n6SchMepoWHvnSAXatpbh4+zSS/8EbihNytALyompbwIroSuIqk8haN++cZISJcxLV+7KaKDTJQKHS5Z7DlMg+9jVuP+UN9mm8Uij8jX7oP6jnNRx7lwbCoVmAZkM+gDk+PhV71X47B6A7sSZJx5z6F+3MpMWrODCeT2AN5oIIcq3JRUZZqC4PLgS6Ud4nOPCIaJpr7lbeLj7RYkmdY2/ucvPH1mVIPCOTbf33XfmbRg53S5am+0zdLgDk7deJYroMYH0dhHxnqiyl3mpGalS4b6r2IhT17HjBiDR9+CJQzQSSnqtkKM18P3QfKxNoM0aJ6Z86UinxVriBISo2ShDxnm5BRWE9k4QHmQ3CCM41uchs+ljZyV9ZHq9i3CSgEa2JlQ99bdYZqfEgLXNxyO8Yn3aCQ827EEiIVyUmvRtOWbEgtff7RyHFvQd1KEh0CibgFsatdgvgayO/7GuC8wIiAxlPH9orOSHWnQldqIYKlsF/jnJo8mMy7Ul46+IzzrZ+pFPtjmGxuYaPwlMtyCM23bRoKefZ8ecQ6JLOX0fnpLqQtYdi/m5eSmChEkEg5hiOFEGF8sX3RlkptQdATC0cd614JURJcJ5hDgJ2JoSFcAfGRm7BsHegWzRJwmd7gJQrEvbmPGmqamQu+qD2r2ysf6xG7D7BPN6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199018)(82950400001)(82960400001)(5660300002)(86362001)(7696005)(64756008)(38070700005)(921005)(33656002)(41300700001)(316002)(66476007)(122000001)(76116006)(66946007)(66556008)(7416002)(2906002)(8990500004)(8676002)(38100700002)(66446008)(8936002)(52536014)(186003)(9686003)(6506007)(83380400001)(54906003)(10290500003)(478600001)(110136005)(71200400001)(55016003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vntmHuyFurqU65HbHORvh4fvNQ3tVcBc8O2M4mYqxTBGttzp6o944X6vi9/y?=
 =?us-ascii?Q?vUjAy4ITYazv1u4tAD1MmuoheD76WFCwF5Y6UpHm6VSfbCytnpBkDtY4UxKV?=
 =?us-ascii?Q?pYRzoniRzUdjVSiyXAWd1wFt7qGjB8VxV1VEV4QQoEE/QhqpKFclLG9YKLAk?=
 =?us-ascii?Q?b7woQjd8U24HJddXy6uYkB65gOOcqrvPAXqRemq30tD5ZUkLNB/ceY8dj8Fe?=
 =?us-ascii?Q?Zq8dtxRHTV464OYO5XJScihd003uRFUKOYPdGCs/SiFvDh4oLLfVfViluuwh?=
 =?us-ascii?Q?bMUZNUCAOswp16WNoBKRK/b6UxIDR1LXl8PeL+ddO5fj/0E6mHnKi1mCNi/W?=
 =?us-ascii?Q?DgT733b2raDOIUot/WAGP5WroOHPPByWnq34VmyXfKGj8gS3WvP0ewHXVOM/?=
 =?us-ascii?Q?G8roCedBNH22oUhZYt8nsOhuWhT34jjUV3MQfbq3KdXGxcXKHV7/o+NBLiz2?=
 =?us-ascii?Q?+47lbgGNftnFZbPb9xDD721IFstAO6EhvX1a/YEdjCIfLV8tGOpm/Wmwe5k2?=
 =?us-ascii?Q?oJOa70RAAbcF3w36cMYe2rQujDasUhONWVYw5e/h0hsmoPLdqax+YJiS4rJb?=
 =?us-ascii?Q?aAU5HOQJWdv4klHz7DyzOhjXpdU82zEm4wrYKGdACO48a8ZNDG9DmBXulXEB?=
 =?us-ascii?Q?Oj7/uTWX61Iud0wRmx5AnX6YvGHzJR655PeB6d26LvduJSEnUg0jmUh5JU2i?=
 =?us-ascii?Q?SER7KwspvKB3On/eqLdBpcwo95CoK1XJzIp6ds+I2dDsKPASOpb4dyAoyRzQ?=
 =?us-ascii?Q?TvnLR41SbMYfKym72niDIWOOpdgUI0pcIZrmZ7hTGuo60wjeOIw1FzAD7HJN?=
 =?us-ascii?Q?NTmOGumR+Mxj3bVzW19N1l/2rGblYf3cHbhMdh8HRjSS+2qRZSva0XaWg1fh?=
 =?us-ascii?Q?jRWROzUVnhJl0ALY/P+tax0eG+vMfrD8IOgub5yC/CIo4Tm655BBrbK/k6Uj?=
 =?us-ascii?Q?DqajP01bQALBRkzKvcN9ZuOCMDn8CyS5TUOvjwEgIHWMJXPrxAQDoKsBDlx/?=
 =?us-ascii?Q?eFIuWG9yzYF7czi7hBf28nR8Fls9dVT5ZXE/6wzMPaGe+eiwc57lr6p6hKMt?=
 =?us-ascii?Q?ob180oQu7OMZHP5lL2yu0SUT3C6dbApZ2SUzDyE96ZdC9JJgp793rMsUM02t?=
 =?us-ascii?Q?w7fuPXYNrMuO7nTuMVV9dJZASfYpRetVnUozsZyVwsWIY6NC3851z3qppYK4?=
 =?us-ascii?Q?sgFGi46ykqoUefDN7B3ar899Rqcy5+pZvBvFnlQ9zWBO8pIhXDhoOwNZSdo3?=
 =?us-ascii?Q?Q0i/VgLWaNzpgRKMRCoCMY9mcK0OLKlsyNNVItZQsP0XUm63hozJOX27ry1o?=
 =?us-ascii?Q?UAd1u1FxwYKP1Pp6AXPCpgR5VWWlqk/MPMb/y/raZQFAffWq6E4vTshE/dR+?=
 =?us-ascii?Q?tm5GhZJcNjo2oZTnglGLfWEAUyBcN6iK/tu/UBx4gKN0szKi8511FDhSOsU1?=
 =?us-ascii?Q?rqNGUF3dq4kI5awsK3AUk0qqsg8ggmAeHARVpuGEEqqJTh/9HEkh6CmNdN0u?=
 =?us-ascii?Q?N6JvfGe9GPq4J60eqpdhhILHo8p5PLcNkd9hsNt/ZTRYSCTDooRIZd8JCp0V?=
 =?us-ascii?Q?C55vrA1HOJRV/KavH14uhGgA3KoBonYTUn7gzpjYR9bgcB2v6QNIKNhnja78?=
 =?us-ascii?Q?DGF5VzA3spB+t6IpNlYurtXGc3Jua4M1Ticm6PKWCpkS5RM3dBo6ywTGDkwF?=
 =?us-ascii?Q?3uKOwQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1317eb84-55a2-4bef-9fff-08db22e7b43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2023 10:51:15.9250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fkEmZw7I+PcwB8+O5ifQBn36hVcItdhNzf3qP4uQZr+dHZ9UJ868PhanAiwAlBdPP7YOW/LoJclj4jp9hpYq4Hh5ldVkVA25Pb+WZrNN0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR21MB3110
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, March 9, 2023=
 8:01 AM
>=20
> Assume that the driver does not own the option string or its substrings
> and hence duplicate the option string for the video mode. As the driver
> implements a very simple mode parser in a fairly unstructured way, just
> duplicate the option string and parse the duplicated memory buffer. Free
> the buffer afterwards.
>=20
> Done in preparation of constifying the option string and switching the
> driver to struct option_iter.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 4a6a3303b6b4..edb0555239c6 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -903,17 +903,23 @@ static const struct fb_ops hvfb_ops =3D {
>  static void hvfb_get_option(struct fb_info *info)
>  {
>  	struct hvfb_par *par =3D info->par;
> -	char *opt =3D NULL, *p;
> +	char *options =3D NULL;
> +	char *optbuf, *opt, *p;
>  	uint x =3D 0, y =3D 0;
>=20
> -	if (fb_get_options(KBUILD_MODNAME, &opt) || !opt || !*opt)
> +	if (fb_get_options(KBUILD_MODNAME, &options) || !options || !*options)
>  		return;
>=20
> +	optbuf =3D kstrdup(options, GFP_KERNEL);
> +	if (!optbuf)
> +		return;
> +	opt =3D optbuf;
> +
>  	p =3D strsep(&opt, "x");
>  	if (!*p || kstrtouint(p, 0, &x) ||
>  	    !opt || !*opt || kstrtouint(opt, 0, &y)) {
>  		pr_err("Screen option is invalid: skipped\n");
> -		return;
> +		goto out;
>  	}
>=20
>  	if (x < HVFB_WIDTH_MIN || y < HVFB_HEIGHT_MIN ||
> @@ -922,12 +928,14 @@ static void hvfb_get_option(struct fb_info *info)
>  	    (par->synthvid_version =3D=3D SYNTHVID_VERSION_WIN8 &&
>  	     x * y * screen_depth / 8 > SYNTHVID_FB_SIZE_WIN8)) {
>  		pr_err("Screen resolution option is out of range: skipped\n");
> -		return;
> +		goto out;
>  	}
>=20
>  	screen_width =3D x;
>  	screen_height =3D y;
> -	return;
> +
> +out:
> +	kfree(optbuf);
>  }
>=20
>  /*
> --
> 2.39.2

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

