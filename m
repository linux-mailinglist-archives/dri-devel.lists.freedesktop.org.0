Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31713B43084
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 05:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C85810E41F;
	Thu,  4 Sep 2025 03:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="hw54BPnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02olkn2094.outbound.protection.outlook.com [40.92.43.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D0710E41F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 03:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCCzwtz1y+c2GHDvTpqI3oT09hvZFAhMnTreqa1pX+oWm+PzXox21cBh6/y+Kbcd/qFaWhqc5XCVUNUb0uOh1q+6Z1v3zSb8JfmIa9YLHTdA7YUi9ktbD4AgCWANCfTv4syrtLKAxeyfJQrCR8QjsPDi/qcj+Gf7lpQI0rDHjRnGWCNBhfXHpxKxVbgNO13KGOdkaCfj1vfNGYBszSVrLt8dAwZ8NuWKpY0vX9caxApC+LCHLa9bsSFpix9jbj+s/oBDl/ypn0/6vTZDUDc3ePFeNJqy0nPld9YpbTlcaME1MeqYx1eJXc5TdXZvYHm0FlAzAKmobL4jMmHI9lAwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1aJ0kWupFa7rG6jJgRXP8pgRk1xTg8t8uPXCkW73p4=;
 b=U1LtRFRyTBcRXhiWfCPi9mvRsjIwT/dHkHL+vR9OkwUnBqedIycFMUta1/Yxns80dtsMQItz3plB2Z9KhLHtr9CU7nCmS7KX+tfsd/rJNPuk22/prjWXiVac0Mm4RHyOpUewTZi1VbKYpL8wAv4WlETP/OBYOUD7jwAp2PXSi9LypOpNb4QA+j/dFmNPVJJS2MAMfJs/iD7ZFpkZP1RrGXrY2CgpaIEHzgDhOsB4lRP/OjJ3qJJ7KjqY+XCycomZnZ1uSQJMsDfnDpTqyV7V3hXCpSZzZJbc+Jn//gQ7LRQzKFKxrlKRsbAx4l/bhx5jZlvCE5A0hYQ5b07w9M7isA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1aJ0kWupFa7rG6jJgRXP8pgRk1xTg8t8uPXCkW73p4=;
 b=hw54BPnulOkhpxerTmL+ED52Cmnh5VW6gVagHguwEnaySdi2tnWXCe+sKKsqv2MRp1zLUNXQBH4e5QKTKiR62aUY2sTln6eeGzIIYQqS7+VlJxBso1beQh9lyoPRNvhSUO0FqSOfqQyQtDuWv/+xS66ozdM1eYLM3ByVO+6jSn5T/9aHFrTBHZ1VoLGVRBqFmF0uHEnunpDcG1KHAbEJa6yDQ9iBKtTF1/qpHcmzYc36PWwbx1pjNplKlfkerBGkJsgbSaE1pKJA/K7nbLy8dz1OZ47NamJY/VjeTGIvFQOXsuxgj3q+fA7dfG8nu2R07STl3Qdtkeqguv6VW3cmQw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB10203.namprd02.prod.outlook.com (2603:10b6:8:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 03:38:49 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 03:38:49 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "hamohammed.sa@gmail.com"
 <hamohammed.sa@gmail.com>, "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] drm/hypervdrm: Use vblank timer
Thread-Topic: [PATCH v2 4/4] drm/hypervdrm: Use vblank timer
Thread-Index: AQHcGzHDDGNCuDCdhk214Z4ciHyQErR/kWAAgABKq4CAAC2WAIACU6eg
Date: Thu, 4 Sep 2025 03:38:49 +0000
Message-ID: <SN6PR02MB4157EFAA19227FAFD21E1466D400A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-5-tzimmermann@suse.de>
 <87a53dfe87.fsf@minerva.mail-host-address-is-not-set>
 <5cd7f22d-e39a-4d37-8286-0194d6c9a818@suse.de>
 <877bygg8vb.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <877bygg8vb.fsf@minerva.mail-host-address-is-not-set>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB10203:EE_
x-ms-office365-filtering-correlation-id: 1c9c7715-3403-48ac-d621-08ddeb648f78
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|13091999003|461199028|15080799012|8062599012|8060799015|19110799012|1602099012|10035399007|40105399003|4302099013|52005399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?LYaJYd4zMPXNU27vKZUyA4GiEvL9goXZXnSwRrTMUXBgQ9ra2dwUy0ghWQq4?=
 =?us-ascii?Q?dMlAbLiNCY4GPI/mbF66qIgP677SYcXbF+LQH1iV4xG5uwBDHF77F8Y468lv?=
 =?us-ascii?Q?U/iF+2R5QrXXzcb7ZMz7fN8G/eroFWjtbtgEB1UFwZvae8ymoyAYoI/VH3uV?=
 =?us-ascii?Q?GWnFry06F0jRnGgOsT5o7HwMy5Sqk/ueH4H3ZY3HUylEFn0bI8hnjkVukXqh?=
 =?us-ascii?Q?LY/yW2kVEOon0MPWFMbsZU0TPyK6vw124i/iTMMBPTT3xcwTLnJvNcuqu53V?=
 =?us-ascii?Q?EPZ8pxSu12ozaoDz4jsyobu4x14yrwIDic+3IJjQ2Js9gQnM1SdQ3RN0cBlb?=
 =?us-ascii?Q?nJ4EsQLnKqDfKqgLMtUFlN5WCrlNz6trLlN9favZX5DYlW6txUAtSS7h82nR?=
 =?us-ascii?Q?pEKdW3nXpyHuAqVjCXuDyOFc6uCXnofe5YkwISjUywEnwYFHQw4+YbKjiKfs?=
 =?us-ascii?Q?ZGVkBVJowFNMeG2Sa1bRVyte2zsYs6pvmNFRH/h5wmdGQip9GajHsREodUzI?=
 =?us-ascii?Q?/TaT62xjQ+lLqrl7h5wqFN7PygHSg8Go6NLKa3MkDlEij1HeKouD0tCLpr3j?=
 =?us-ascii?Q?bY2naiIvGt4yp3CEMomU+u8bQ4bhgVPimvW7U/vSWaX2gRH69UT0SP+7Kr1F?=
 =?us-ascii?Q?EwICyaeydjd2OaWx41T5Zf0Ez4LlQ91jmWN+s8tDk462X+d1yKKruW0f3rV2?=
 =?us-ascii?Q?vz5sE/QnxqunHBgG6ValqvWqW/3WF7xDWqs7ZEBUgWEjUUe/IKQwDkymXuN7?=
 =?us-ascii?Q?Uo7iooKdWxcll5l2xESo4yT6jEzUkaYvu04Rl1gE5RPhheZ5wNmtH+dGUxPk?=
 =?us-ascii?Q?9G9ncPrXWWTeXusIqNP+uLMJog/100E3htChGkl7DWmch7cQdh/9ZK3TSCvk?=
 =?us-ascii?Q?N0Br1PXGuZD8a4ouvINrIq4T+ujztDbVJrqvAsqDsY0uQswdKiBI72i6UMQL?=
 =?us-ascii?Q?cVovqBn5Hou4TpiF+31zUOqHbROF+KcYWTvK/gaSY/y/1sXV3PECGfTWroFz?=
 =?us-ascii?Q?TG1vUhQZYfVcME7rh2SozIkBYQ9I8qVo5zyOHr37TLLzlRTejTsHkO5SJmrp?=
 =?us-ascii?Q?79lAPEHC8CafqAwWB74GhbEAgmXip7JApdgxIqUbk+RafHgS6YoNZ/XroMo5?=
 =?us-ascii?Q?rEGRj/S8neKpnOEcSmDA0Dp6/fRKcRhl3WkIJN6CUd0WHKTSuGqQVAkPzJba?=
 =?us-ascii?Q?38d2qJgxbnRg50ZfjYSph01GjrrSQOEnE7AREV1yZK7BYIY/zgEnU8WrfbfU?=
 =?us-ascii?Q?9sBbfYFG3NNBsoUBGUE++QveqeUVWd6SxWQxWMofDhHKcbX0ZAEFg0jpX2aw?=
 =?us-ascii?Q?vpF22B2QdhU1Jw7Ail56iBwp0SIdnLNI/OR1+9Hy+SUAbw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p5O/lFN3IYfTV1VCuSSuCwn+mncPJjGTNtux0RiNLKcJXQ2kZW+iTtpYwTP7?=
 =?us-ascii?Q?Pmr9yjy94g5hsS6NP3wOZF4++wxg+G31IYniTE3ol48sFXHPLdvM0GQWU4jH?=
 =?us-ascii?Q?hwznyboVTIY/ITIW2mGFalwWdUdVAKnXkVvdK/9TuYxw5N8HjjSxwb3q8EB6?=
 =?us-ascii?Q?Wu7QGvonxjRHe7toqiENfeTd9IzpurxHg/LFCz1g9mT2yK2NmAXscOIkJOKa?=
 =?us-ascii?Q?QZ705DOmnCMgFCZomZ5lfg7Wg9uLXkZEipFKkP4wz3INMeAkAqYqw+eabXWX?=
 =?us-ascii?Q?sNe5sppSDWye73HZnvW3ldniWZXNGl+BgdtlED31QRKf5UWfpQHDmChzuxp9?=
 =?us-ascii?Q?XIs5F7BrgaopCFfbLJXX9quexmVasLyimjs2tiDvOMQ6S3CSR+rB3l/CgFk+?=
 =?us-ascii?Q?dMwF5Ls8uN9kQxRJeR3MBnmOP7VVndlnrSdv5fwKSC30slndWNZvX5JRCpGA?=
 =?us-ascii?Q?713WyFCVu22UElLGIFYaXdCyj9GDEgUEnVo5WPv3bJzct7osuujZgZR+h+Oc?=
 =?us-ascii?Q?O4MybbbmzmgUR6vyeD5vk/R1RclYO53+czWsEFJE4RCFFybuyEvOTE/jqbGM?=
 =?us-ascii?Q?HW0Geyb63wdRGaYC1U3kZB6YBAKIX1hqwGOPMaBfurqJc5Z67IMkw6gs1U45?=
 =?us-ascii?Q?JkBwPEPM0sNeq5votXD0U8rFaA+LxVQ4/Vtj1eGCZgQYnQOgVQDx61Je/Zvi?=
 =?us-ascii?Q?7yESNVg8g+rSJxIX8uApC25IgNPYC5veKITWb+9qiOgMQxrZbxj2MHLPPTXS?=
 =?us-ascii?Q?iA2twfF6TtMwynB8ST+V5IzGOehIlSknyFIJM0ayl4WjIGI5FuqaXgqHHvIB?=
 =?us-ascii?Q?LmoNY0Quz1DtFm0sFkD1XgsBDtYZdQfKSHfxZZJnUkWTj5y+U6TTi/uAjHC8?=
 =?us-ascii?Q?YVwlBu7QZaFO//vrVZEx3c5efY/8MGxzQn6gZAsyLKmx1TrcWM6TnEzfXmYS?=
 =?us-ascii?Q?T2ee109tPRpwXjCig15Pmgctb0ZTDoJ8ikEuFryBHruLUbNSO8lhfZYhH6Vv?=
 =?us-ascii?Q?zDy9/6P9WMdAyOQQLdkzJP8EocPUSPjwoTsp8gdDdwQuWlHsw0yVLZckTLcX?=
 =?us-ascii?Q?5cUnoeYhC+kgoTKO4Pf6MTOOi/Zs/F2td7U/TSUK1Vif1YJ3rs+QQoxFqqqz?=
 =?us-ascii?Q?sMz3Li6ZJASJMI5ecfqVlbjmKl/XHWFGWyivc2uVBTt9X9cS4XrlKrEvS3SZ?=
 =?us-ascii?Q?siVxyOz1gPy88sKYYaqq49qonuDmjVz+ofYXwaFbwKyOegI2o8AEeoTPMk4?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9c7715-3403-48ac-d621-08ddeb648f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 03:38:49.2312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB10203
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

From: Javier Martinez Canillas <javierm@redhat.com> Sent: Tuesday, Septembe=
r 2, 2025 8:41 AM
>=20
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>=20
> [...]
>=20
> >>
> >> I'm not familiar with hyperv to know whether is a problem or not for t=
he
> >> host to not be notified that the guest display is disabled. But I thou=
ght
> >> that should raise this question for the folks familiar with it.
> >
> > The feedback I got at
> > https://lore.kernel.org/dri-devel/SN6PR02MB4157F630284939E084486AFED46F=
A@SN6PR02MB4157.namprd02.prod.outlook.com/=20
> > is that the vblank timer solves the problem of excessive CPU consumptio=
n
> > on hypervdrm. Ans that's also the observation I had with other drivers.
> > I guess, telling the host about the disabled display would still make s=
ense.
> >
>=20
> Yes, I read the other thread you referenced and that's why I said that
> your patch is correct to solve the issue.
>=20
> I just wanted to point out, since it could be that as a follow-up the
> driver could need its own .atomic_disable instead of using the default
> drm_crtc_vblank_atomic_disable(). Something like the following maybe:
>=20
> +static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +                                             struct drm_atomic_state *st=
ate)
> +{
> +       struct hyperv_drm_device *hv =3D to_hv(crtc->dev);
> +       struct drm_plane *plane =3D &hv->plane;
> +       struct drm_plane_state *plane_state =3D plane->state;
> +       struct drm_crtc_state *crtc_state =3D crtc->state;
> +
> +       hyperv_hide_hw_ptr(hv->hdev);
> +       /* Notify the host that the guest display is disabled */
> +       hyperv_update_situation(hv->hdev, 0,  hv->screen_depth,
> +                               crtc_state->mode.hdisplay,
> +                               crtc_state->mode.vdisplay,
> +                               plane_state->fb->pitches[0]);
> +
> +       drm_crtc_vblank_off(crtc);
> +}
> +
>  static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs =3D {
>         .atomic_check =3D drm_crtc_helper_atomic_check,
>         .atomic_flush =3D drm_crtc_vblank_atomic_flush,
>         .atomic_enable =3D hyperv_crtc_helper_atomic_enable,
> -       .atomic_disable =3D drm_crtc_vblank_atomic_disable,
> +       .atomic_disable =3D hyperv_crtc_helper_atomic_disable,
>  };

I have some historical expertise in the Hyper-V fbdev driver from
back when I was a Microsoft employee (I'm now retired). The fbdev
driver is similar to the DRM driver in that it tells the Hyper-V host
that the device is "active" during initial setup, but there's never a
time when the driver tells Hyper-V that the device is "not active".

I agree that symmetry suggests having disable function that sets
"active" to 0, but I don't know what the effect would be. I don't know
if Hyper-V anticipates any circumstances when the driver should tell
Hyper-V the device is not active. My chances are not good in finding
someone on the Hyper-V team who could give a definitive answer,
as it's probably an area that is not under active development. The
Hyper-V VMBus frame buffer device functionality is what it is, and
isn't likely to be getting enhancements.

I suggest that we assume it's not necessary to add a "disable"
function, and proceed with Thomas' proposed changes to the Hyper-V
DRM driver. Adding "disable" now risks breaking something due
to effects we're unaware of. If in the future the need arises to mark
the device not active, the "disable" function can be added after
a clarifying conversation with the Hyper-V team.

If anyone at Microsoft wants to chime in, please do so. :-)

Michael
