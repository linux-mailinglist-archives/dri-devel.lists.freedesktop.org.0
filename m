Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D885F641
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042EE10E6E4;
	Thu, 22 Feb 2024 10:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OqhqBpya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070.outbound.protection.outlook.com [40.107.114.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543010E6E4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:56:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdzisZN20KpjiJTFtmDtgqsiqFhVtvheHOAQ0BPeYXJ5aj7xJIul+0RN3vjUDjiu9/mtEuaZTdVbC8Glw/MFO1maF01ldYRqSLsQAjFuS8BKudw+LlvVs3Fi9C2TWilZJ8VMlOG7jiNB/tWEFoYGCScL3ZNPo+li9H9PWP8EhHREwKbs7zhowryJ187XelkOB7qYQMd2AiD0aurXzovsB4nS5QkPqdjaCE0Lqh/7cukXoxogKkdbEagMarr6PSyruVl2lkFWdzfRXgX5ciUD2YhswovObo8tbt8jQ4O7JKpZw0phARg9AlRhhcwBXa6dCaUqei2rVEHmJ+yRIb3COg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvIV7lVK4+uNXx+ynQ8vvgMixAv5b8jKx2EJlRwVIq4=;
 b=lbIVGaIypBDNy06fNnAikUA7qHcY8bXCpMj855MtvFiL4V5RjgKXY4iYuEgBub/SUPQcAco/eLWR/P80aePGd18Tdw2NfjtB4yh2PQIDi6GcprePZDtX2mZdLKcROXDkl7dGzky/iw5Q2LOhBUXK2s17qIFiPy+M77HkqSdcv9YShZeQWN16MikZwCyB2b0WUQVgWbQUr4CzQw73phm/hRIL5x1GbBIZv2dos1uFZxDIRkYiBERpXmp3/MONI/KoIAr4TEywsKZM/k9ghQn6X8+CYeVe6nvmzNb+FO9zQUrwV2ehbXUxY069eesjxBudDdhmtyQzu4t16kltUFL8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvIV7lVK4+uNXx+ynQ8vvgMixAv5b8jKx2EJlRwVIq4=;
 b=OqhqBpyaaBMOb5rJX1l339pUcR6HJpqc5r/TdKn0agGruUPWO3UEmMI1NN86b9XyVODx1AM43CzXKGFB39i2vBobHhbASN5CHRXnbSqQlg+AdH1p2W2Wxpk1FkVWKFLGOHkwbbebgElKwZ85ZotKHuNu0T/YZhjLpxIGG41Z2+w=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB11706.jpnprd01.prod.outlook.com
 (2603:1096:400:400::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 10:56:34 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 10:56:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Thread-Topic: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Thread-Index: AQHaZXVtHaNSTT51VEKDU1bQITgsD7EWJOCAgAAK9nA=
Date: Thu, 22 Feb 2024 10:56:33 +0000
Message-ID: <TYCPR01MB1126924413959F15A597EF98586562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
 <dmtawf7kybdkhf3tjp5chuwn54szunlme7l3gtq7bn7sxntvge@ozgpn3lljhmg>
In-Reply-To: <dmtawf7kybdkhf3tjp5chuwn54szunlme7l3gtq7bn7sxntvge@ozgpn3lljhmg>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB11706:EE_
x-ms-office365-filtering-correlation-id: e7e47e1e-17a3-4abe-1ba8-08dc3394eeec
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOMUvvvEXGPwfjntk40aOC+aCppSsVBFxt+pVE+U0JqujGR+Cmzpi/buS6rVsb8f5pcaCuQOTEERWY55za9ml+4cxBswMr76LgIsGqKyKPQAF3n47LFcYKhiERMSpCkxlJE8ZCJ++QVhKchHW1A+7iM6jgmze1aRd8x4nlACmFficUW83mDcLkONd7yDhsv6SQ/5ZW0v/HLDIwj+SAdgdg3w0rTCvnkcNGteAyj1KsWTvEAsZ0epl8AFYJyCKylca1rqaO6UhFGMweIqgKVEYCFRf/aMaLWxYIyEs1yZDpmkB6djADgM/uWog3AKUiRsfxFikPQT74cTkMWLYyHuwwxcD4ELJVAQrNOdQDQ8js/nz8/gtmPU3CROWW8jGs0R8qdVtpAihXAsAJHgRgQ0VfFohogfA6D+zHa8zzBuBKFs2xY3v+p9f2zMclM78FrgUj99VCl8jEp06LV4idhhExoEURY0WOuTEtNJaOtloL9h6z5A7sm6f2QaUlL0Sd6H9q2eGMUCpeZaNN/gYVnGE6yeMd/LU0rQbGDqFXNFbnbxZJ0qpooExDxf6JYqqrzz1WzxIXeOG/N872SF7xKI/CYQs6fy+0XdScdj4eLMSRP1DanzefLRAXf/sj4M66ut
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IDU2hMHzl44A4GfJRUcl58SM3LIipW7E+ObUxxbucwBxZCCxn0IGwaY9sNLF?=
 =?us-ascii?Q?P7ZGvRwZFK8ZNd9BL9ZgKHgYywic33R+5STYLQ2kyR5TG8mV0FWCOEi0aoa+?=
 =?us-ascii?Q?Pmv5szHC+E7wKDIfJR1lU54WfzMb2naIkgqZBC5nyXP4XrX3gUW1z+ayaZZu?=
 =?us-ascii?Q?vNxcsjOKneQ7tfx8m5q0X3cBzKcSKQu4sA7szsl2QpZpO9uhsZd/qlUmyVmh?=
 =?us-ascii?Q?qo4aNaMwVXDA/7MHsVCxZw6le+miNk1jDNGg5alXl1EH/fWjCRXPNQUV4HCj?=
 =?us-ascii?Q?bf8CDve8HsgPd3ivytWyMrcF7IbyGVuwTqwZpy7Gv+Oruk7HFgO8W9nI5lR5?=
 =?us-ascii?Q?MigedhRnqsBbibCbswg6RhfZhkptvCP2vY064nx4S1lNRlGm5qfl2jwJLl8j?=
 =?us-ascii?Q?ZRRKdYM5fMzx0mCbDCAn/d9MbVVuH8GUbCJVAO45quzzzR5AZyQnlx3RbEq4?=
 =?us-ascii?Q?78Cd4V8ye3rqeDcKCP1yoltCSABludNvzkGEYemQnyPo69yrUDwdV/U7PIuv?=
 =?us-ascii?Q?muNQr5oNfuc0ntYH0G1kzNko9PcNcVgLuT29xMCwWHcScy/86p8t87RazzUr?=
 =?us-ascii?Q?0RLdyjubBHPn5wEVnZ5H0NubaffeekrKmdIskZS40piIERcBhk2GNZBkJE4N?=
 =?us-ascii?Q?3o/vgPcp3mpdip2GOhDm+RlVlj1Lr/LivB216uwaNsa7cju3KdD7wf055Mvd?=
 =?us-ascii?Q?ZnVtQdvq92TUM3h/xQp/PdMfujtSmCyjlDF0JLjRc/2k6NtkmbYrOzxI3waN?=
 =?us-ascii?Q?xxCkrmTzluw7EuYAwA6AL/lmvOFjDiVCtlBIbkD5QORsPb5kR9Xpt6eiamTY?=
 =?us-ascii?Q?lU3AgBT7jJhgthceOMuW3Rr5Lg/t5KX05D2TE9/8dkrVos9OzaaDShBlelv0?=
 =?us-ascii?Q?mtav/IaMycZyqUf4Az4bPej9bNb6HidOD2lzoEJmVhRR3mp0ohzyVoZs0OoP?=
 =?us-ascii?Q?fA4aia2KlcE9vYw7lxLq/GxxkkbOJxdpELLzujRdZQGDtYUjo0IuW7hxSmdJ?=
 =?us-ascii?Q?pXo8zHQoA3UQvdb0+HIDV25d0Ri+og4rQg18/J4F0orm9mH4081AZImTqfR+?=
 =?us-ascii?Q?Hm5+0NdFjia5euNUsbEDfBQceAjleRYvPrzaTqEzRY7AMm4MXmiZAK4LXsOY?=
 =?us-ascii?Q?QqAuqUp8lno//09kMfyTXb/qH5t5RhWvZHXGQlOs98h5uv4BwSS4RLc41WqI?=
 =?us-ascii?Q?gA7ZPc2Gpr37+DSafcwsFdYLP44N+uy7tSJuxzglWhKJFinc2sokLuqu3Z+G?=
 =?us-ascii?Q?ymBO1gtsZrLdAlO76ybaUppJeZsJLN4l9EMBGnafS2SNc3DnD0hBJE++l5uM?=
 =?us-ascii?Q?4eOcdfYqhfJEA3iaSiQ+qoGlFdLFsoKsG7elrpjcX0llxVMkg2jHT7lN9SjQ?=
 =?us-ascii?Q?BYxtmPClaSXPkHwmg2uvNuhNCVTh/kj/tDSvI0g2VALi/384Xb901krl2NWW?=
 =?us-ascii?Q?Ifgdf0LkEN26Wmy5yLARlrrdy5jQfLJPxmgFWHM6WhQ3Wm0mcJrEca37acgo?=
 =?us-ascii?Q?lGCxNf6qX3Eczlzfwb3Iuvf87I2fFCMu2FV1L1ouqkXGZJRZBM5/j//FO/L9?=
 =?us-ascii?Q?igh5U2ypJNYwlDQ04DE0uA4jxa590dI+WiqJwTobdYntSJneGas9KkapQcQb?=
 =?us-ascii?Q?pQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e47e1e-17a3-4abe-1ba8-08dc3394eeec
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 10:56:33.6177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAZLWtVE772K8CsWfJvqKT98dC2NcFyy1BMukPHwUxemIHFfo15iwZjjpcq9hvCKF6wyJT+9rDCsZcxC00somfsm4EtQDTcFEP1inSFtN1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11706
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

Hi Maxime Ripard,

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Thursday, February 22, 2024 10:14 AM
> Subject: Re: [PATCH] drm: renesas: rz-du: Fix redefinition errors related
> to rzg2l_du_vsp_*()
>=20
> Hi,
>=20
> Thanks for working on this
>=20
> On Thu, Feb 22, 2024 at 09:56:30AM +0000, Biju Das wrote:
> > Fix the redefinition errors for the below functions on x86 by
> > replacing
> > CONFIG_DRM_RCAR_VSP->IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1) and adding
> > EXPORT_SYMBOL_GPL for all:
> >  1) rzg2l_du_vsp_init()
> >  2) rzg2l_du_vsp_enable()
> >  3) rzg2l_du_vsp_disable()
> >  4) rzg2l_du_vsp_atomic_flush()
> >  5) rzg2l_du_vsp_get_drm_plane()
>=20
> This really should be two patches: you're fixing some symbols not being
> exported (because they need to be called by what other module?)=20

I Just realized that ,this export symbols are not required as they are used
within the single module. So no need to export.=20

So, I will send a single patch with fixing redefinition error.

Cheers,
Biju


