Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799BD0B27F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0710E900;
	Fri,  9 Jan 2026 16:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NMfnLvYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D30010E900
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/AgZlGali6Fw4evU3G7RJEYbzxmvnK3hgBk3cX6Jxp+powrZsqUZYPOOPPmuUAlhC+4XwiJ+lAbtPtJPm2uq4DF+FvA8CaLg9nuEXveuEizQYautoYvakoQ9LcZnNOhLJg+x8gg6mudgfROwJI4+ecu/oLw+ZCySrA+yugkOtvRIvTq8WXTV/qNY+kaB4ZdBIr2bM6DUJmsZObzGe8cgbIUisQ7CBCCaKwYzhl9VJJ9gZrZ9ScbcmI3gUBBFu/NRJSXAuN3br+JkHuQSe1XXyXU1QclleiFeXkVB3oeZbSK/bbyJ2d9ca+YaR/25wGC68ad4z00AoF14zkHMrGp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntw8Snk8191vuehTNEyL1QsJnBFjBSe27ZjlLViXezg=;
 b=Nd9sMQWKzoEd13eUR48KA7RszX79jy7jWcmAWv/1dt+h3nOBRXMogw5gWGVRzfe4N3tnIte4wnFvMkIASuLjk3gRP/O1xQBb/PqK3aKmOlbN2DVlNA3KAZ66VCZ7qG2YCSSkE4t/qfrcE4hrqHj5hsPuCATZlVAZ3JYjYRBhBpH8veZMFF9wLRVtfolza/USO49hvgBrFgHXupiVTRxPgeWakvZ0VX7H6dNn/hcAac5ScKuBI1JHvuIqn33NWE8IAUQZ8jkaVCmKyaguh1CawWvFY++qacikGlB3r8bYIKnaKC76g1Dbj1pgHEc/9fbdOcKE0FYljliROeXzPdJwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntw8Snk8191vuehTNEyL1QsJnBFjBSe27ZjlLViXezg=;
 b=NMfnLvYqCd7cOPtuSMTXpOstdHmO892Brjno/yoN28hVsLE73Re+ox/0OPtwkbhfKu0djRNDUdjkTT55eE1Ado8ritQ0qdWcln1V1h4f3MJUaXn2uVJXyEq8x4z3pK9rTXKW5qruwAitLCSFnV2B3m/u4k1QdZmKnSFHYG2g6Fw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15234.jpnprd01.prod.outlook.com (2603:1096:405:26a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 16:14:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 16:14:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Brandt
 <Chris.Brandt@renesas.com>
Subject: RE: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
Thread-Topic: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
Thread-Index: AQHcgH7+LfMjCpngTEmutarkKkFyQ7VIbNOAgAAJDQCAABf9AIAAOKJggAErDACAAA5bAIAAAQMAgAAAT8CAAAGGgIAAARPg
Date: Fri, 9 Jan 2026 16:14:03 +0000
Message-ID: <TY3PR01MB113461A7892183DDCDB7720C98682A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
 <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
 <20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
 <TY3PR01MB11346AA75CAA2496A06BCEC438685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260108125134.6ce05fd214a217a37de9ed4b@hugovil.com>
 <TY3PR01MB113467DBEE7A2A0B3A93050788685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260109100436.f499618affc1fecd11c25097@hugovil.com>
 <TY3PR01MB11346170A13E303D80369DE128682A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260109105936.111c6ce42243eedafa7ad02c@hugovil.com>
 <TY3PR01MB1134663A44CD9ECB52EFDB9378682A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260109110609.868b0e75ebaefca898e8393e@hugovil.com>
In-Reply-To: <20260109110609.868b0e75ebaefca898e8393e@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15234:EE_
x-ms-office365-filtering-correlation-id: d59cb62d-a949-4bdd-17f3-08de4f9a1b19
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pzqJpBs3kLaFGLYnmRnxVCGjQBWFvmCVkeEzCHjOk7D/S3QiESFZT7+N+8We?=
 =?us-ascii?Q?uZojUMtGxkkrTPKI+/gk8RGCJcPt7IJeT+9W3GwlPGmMcQpbnaacqn1S/5vK?=
 =?us-ascii?Q?/TagaLzcGSaGwgcwSZ/FBJ7AS14tAdMMcc3psschSPq1UuTaRBJz1VYMGVMg?=
 =?us-ascii?Q?Rm+v+8xHro8fm2en2PiWv7ho+Tvne7bJqnM6eMoOrPZxGOcT6vgw5/F9LKUt?=
 =?us-ascii?Q?8X+PxZVgiNK/bPAGM2gfHr3zTZyABVtll93wI0MGQKlR7b42LoD0uy3IB/Lk?=
 =?us-ascii?Q?NfKJJrmHCHVk2iaDOByVNd7B6VbVXWLrAb8TKvuovGMBntzp47NmRESl7cW8?=
 =?us-ascii?Q?vd68YN2qXdWk+53CW/Nc6biW7UzY0U8KIIeoplE/aZFv4OceVQZKviP4XgZO?=
 =?us-ascii?Q?5qLEKFWfv2adb73tsEwI0mae03145YLV/EgrFcQuGotVKEGVxY3IdMdQejpV?=
 =?us-ascii?Q?FIjVzPFp1ROv5vIpvx8G0BTLhOJ0j1DI/8A4tge/y+0nXj8LnWc5ugn+csy6?=
 =?us-ascii?Q?k+1alcG6DB3C0An/LYpih+7sWfq5lFGEPS3++1SG0Ww2eF6NSZiCuU717mqp?=
 =?us-ascii?Q?d5i0FZeVjmbVBRIRgxomfNvKFT8EEbBM+fGSEhb53bYVYXoY2j9xIXlh3LiU?=
 =?us-ascii?Q?WJEmWINrb3bQXicAi+7vsRvNXDrk8LgcRA95yNnr758ouxF1OaJBy6jc7Sp1?=
 =?us-ascii?Q?FlzRYlKC8xu+LiGwwUaAXiHlDk+Gp0qSmAneVnPzzv6k5qSP4Z7pBdqU46Td?=
 =?us-ascii?Q?CbIrUkO78c3IqJ1aw/DAvjziAmqU91HIASCXWfCXQBKtYU07kEPdXBYIVKNG?=
 =?us-ascii?Q?Kt92LnsKSa6p6x20L4UzZ0jJ6CI05mLdVGz1kICw2t2TDThT/ex+u9s3xyt9?=
 =?us-ascii?Q?s+z0Md2/jrzVyTQ2JdvaSRL+FLbdEnddxN1FSiNzFlVIizObR713U/+/+4Oz?=
 =?us-ascii?Q?q9v4u7DkV44FE+aM8+H11oFUtYOhgKtWITMVICjEQsX7fnLGu3JQKD6xzgP9?=
 =?us-ascii?Q?lVC0kMgtJVlzkucdgwzwcCA4AMWW1gpVWveznwf4tNPfrx0KyXhr6wIIDSxi?=
 =?us-ascii?Q?4wAuRq91SyjrDrE3RRqHrKTgsElU1oW9MhzfvnGkqktAazfm2+EjURDvSzZh?=
 =?us-ascii?Q?CMx6TOdte7cCz9a/UBQWGLP9pCxqgZ1qgJBVAUPd4AzsstSPqR7ec5odq9Fc?=
 =?us-ascii?Q?/GS9jOctSaPTiJ1n7dcTwwxYge3q7hlWwu2iiuig2GR/A7C/1ie7nI6NkObH?=
 =?us-ascii?Q?6sJDQ8HuUJegW7TICk8z0hCfB8rMSdgDGjz2omDTBx/Dyx3sMad5aJYGZ1eH?=
 =?us-ascii?Q?WmbXYiBtaTfEmqjCW1qH07S+k6LkwSyIVqAywF/EiHrA5l/9bgxv8nrScKEY?=
 =?us-ascii?Q?WFFOPY57ZaXahHh6zmzCqDoPUL6yS8xd7V1umEDRhrjRNq7NGB2ypcceO0G2?=
 =?us-ascii?Q?taKX0rxtQ/0igj/CswA5ncH5wI80bewwlD2AUpNu4rWQG1PNHTK3TJVRit64?=
 =?us-ascii?Q?wIG/pTcjkIT+ubHfGbr8MZGqkzuNozXTnBi4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2JFv9N/HI9a9CkEBqCRfMKpRMk3OtLJpmgl8KDFoEicQX7xk+zRrepsZi9A/?=
 =?us-ascii?Q?vWq9LTu1mvZ29Ybpqxy+JqPli+m3UjVcHjtk8t0GiU3sgqyjyySkUMK+hLry?=
 =?us-ascii?Q?4gU4o8uhdadLYVZ9s0Q8Y9DQIaQ2W9AuzPCHqW4JjrWtW51fKWpG2NvxKyMy?=
 =?us-ascii?Q?ZFzCnmlg2wGGoG2JcTdc2c0fwpTafj812k7/+ywMFeyG91J5fKZkyeCrBP5U?=
 =?us-ascii?Q?Wxy8EWbXHZ6dWHSsRJI5VojlxZkphfnAFlTj0Hef7/1e0x3nmSgE9olC8QLT?=
 =?us-ascii?Q?l53eXzW6lMnADDcVvRE765LJND+7ovQ7JNjwVyi2SUH+hazkMBuD2DyWcXTd?=
 =?us-ascii?Q?jIv9EXiqfKpoOcpJfy1bTDW61fI+cNFEHpVs+S6+yWhrRWUKxb0hs/l0w7jX?=
 =?us-ascii?Q?V45EAoTf0KRBiNq4hSXUhNxHo7UCQXwWEdzew0FIRGAcHpOZHn3lL9I6h7tP?=
 =?us-ascii?Q?vDsr53gJrq5FClplHjEfMIpslyntMerFXfq1fVFzCbdTJSawkxbW7UMjQYqT?=
 =?us-ascii?Q?JW6fP41XDDo+CEKovtCEVApw5VDeYAFD3VrUDkD+01XOwEZOBdgUn0IoImLu?=
 =?us-ascii?Q?Di4wa1WWAvSrfGuCPH39q8dsHWjfcGHCW+XPvnTVkPZWVFzu7I0kGoaMUGBc?=
 =?us-ascii?Q?PpodM0DMtuPxmPzPWynSEzxQDhfffKRhMgcdlLBCuBqY2BOq4/XUASzrSQny?=
 =?us-ascii?Q?7jhQZht7ltddxpQzrYGphAumTfwfp5or6TJbGY2kzajMyu6kdoB6rpBjqP3Y?=
 =?us-ascii?Q?hfReWqr3FCVgV9i/GpGMj+Yp6YVB6iSVB0Ii4RKisDxCio0G3SaX4+VJK797?=
 =?us-ascii?Q?6XHEMV82AAzXbLOnBZQRVF51Ef7xkH3jYvPW1FT62/vW038foR5SR85Q6RBY?=
 =?us-ascii?Q?1ODpMzj/AxPAsoIfRT2YCLf6O/Rbd74x1YmdDp0nRhiN5GCdu4JSInk7DeKa?=
 =?us-ascii?Q?nRQs/zbw/+huPNZWecHDsKg8mMguRI9r8kH/znlj7uocA2I2t93N0Zy9NCs/?=
 =?us-ascii?Q?+cCF567xhrTQr5dEiq2iVK9nlDtd/Y0pFpkB59rjkm+5u8NTqRhPlKWEbQx7?=
 =?us-ascii?Q?XI2/oPDMzthfdC0wJ7TPHeZv5bDxfnko2C2F/PwdTyZkAKL8FEjR/ptgzQ4D?=
 =?us-ascii?Q?hsjpKI+OxkORcE/UWxMDGbLS4Ecw7sDvVAjypdelO5bTfQbYbEtarUTJLqTv?=
 =?us-ascii?Q?aqLBYfAcwNilgoiIBdUzZ+RHgqE7fnoGv6Hs9wcPiqzoTuKfWuKPOzImoCse?=
 =?us-ascii?Q?GhnO5p6uJsHxT+Sh3LqGqq1oGBkKTR+mWIYGF3BWQwGlYSgNcy/4IB4ZSkF2?=
 =?us-ascii?Q?ahLzyNnAm6QEtgyjjQiPevQUTOKvoqcFvYqL055cVQKQWqIZUnEjfNX5tJOO?=
 =?us-ascii?Q?zFw8LowVzPru0JAimiOkSdlDsnUh+D7P4lm3JrHWch0vRLjtKBVLGMzHqP2B?=
 =?us-ascii?Q?v8SoECyLpVyn4WEgEE7SuLyzDF9XbHWv/OLAHz8FIZmcU7vGsvExEUFa+NzW?=
 =?us-ascii?Q?fJda0GTgLAyKZ1i804NGINC6zp9L1XbHrEJhwfulOcgImPEp8gcAc3ZhzQOK?=
 =?us-ascii?Q?cvAhMVBFfo7DVpJt7mQoS8wZ5e7TK1TZOKaBrMPe4WHrYUtEetz74zAvTqV+?=
 =?us-ascii?Q?WSjwJfadFqu9QAPrO2vdCjU/M7OEJhUFA6LPuUslX/hwuv5Awiu+jhc6Qwtu?=
 =?us-ascii?Q?EVXpWPtCPPKNbhN+sodX7xheTvbM8yuzsbn4/AdhI2etHdedgvl4eH4yCEFu?=
 =?us-ascii?Q?Q+hZIXu5dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59cb62d-a949-4bdd-17f3-08de4f9a1b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 16:14:03.1355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mPRV/8eBtnX4lfnvLIRS3USuAarOj7lRN6vSfvAJtUVK9sH5s6DC9/lZ8rSKT+Vrz0VDDlj1XZtzd2/sLOtUKOMVfKZ6/OSmdtPoYDLhNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15234
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

Hi Hugo,

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 09 January 2026 16:06
> Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
>=20
> Hi Biju,
>=20
> On Fri, 9 Jan 2026 16:03:29 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Hi Hugo,
> >
> > > -----Original Message-----
> > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > Sent: 09 January 2026 16:00
> > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > reboot
> > >
> > > Hi Biju,
> > >
> > > On Fri, 9 Jan 2026 15:57:17 +0000
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > >
> > > > Hi Hugo,
> > > >
> > > > > -----Original Message-----
> > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > Behalf Of Hugo Villeneuve
> > > > > Sent: 09 January 2026 15:05
> > > > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > > > reboot
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > On Thu, 8 Jan 2026 21:21:00 +0000 Biju Das
> > > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > >
> > > > > > Hi Hugo,
> > > > > >
> > > > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > > > Sent: 08 January 2026 17:52
> > > > > > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic
> > > > > > > on reboot
> > > > > > >
> > > > > > > Hi Biju,
> > > > > > >
> > > > > > > On Thu, 8 Jan 2026 16:44:37 +0000 Biju Das
> > > > > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > >
> > > > > > > > Hi Hugo Villeneuve,
> > > > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > > > > > Sent: 08 January 2026 15:53
> > > > > > > > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel
> > > > > > > > > panic on reboot
> > > > > > > > >
> > > > > > > > > Hi Claudiu,
> > > > > > > > >
> > > > > > > > > On Thu, 8 Jan 2026 11:12:54 +0200 Claudiu Beznea
> > > > > > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > > > > >
> > > > > > > > > > Hi, Hugo,
> > > > > > > > > >
> > > > > > > > > > On 1/7/26 23:48, Hugo Villeneuve wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > when issuing a reboot command, I encounter the follow=
ing kernel panic:
> > > > > > > > > > >
> > > > > > > > > > > [   36.183478] SError Interrupt on CPU1, code 0x00000=
000be000011 -- SError
> > > > > > > > > > > [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shu=
tdow Tainted: G   M
> > > > > > > 6.19.0-
> > > > > > > > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > > > > > > > [   36.183504] Tainted: [M]=3DMACHINE_CHECK
> > > > > > > > > > > [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> > > > > > > > > > > [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO =
-TCO -DIT -SSBS BTYPE=3D--)
> > > > > > > > > > > [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x11=
4/0x458
> > > > > > > > > > > [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98=
/0x458
> > > > > > > > > > > [   36.183547] sp : ffff8000813db860
> > > > > > > > > > > [   36.183550] x29: ffff8000813db890 x28: ffff800080c=
602c0 x27: ffff000009dd7450
> > > > > > > > > > > [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009d=
d7450 x24: ffff800080e1f7a8
> > > > > > > > > > > [   36.183573] x23: ffff000009dd7400 x22: 00000000000=
00000 x21: ffff000009dd7430
> > > > > > > > > > > [   36.183582] x20: ffff8000813db8e8 x19: 00000000020=
50028 x18: 00000000ffffffff
> > > > > > > > > > > [   36.183592] x17: 0000000000000000 x16: 00000000000=
00000 x15: ffff8000813db220
> > > > > > > > > > > [   36.183602] x14: 0000000000000000 x13: ffff8000812=
55bc0 x12: 00000000000009a2
> > > > > > > > > > > [   36.183611] x11: 0000000000000336 x10: ffff8000812=
b28d0 x9 : ffff800081255bc0
> > > > > > > > > > > [   36.183621] x8 : ffff800081399000 x7 : ffff00000a0=
42600 x6 : 0000000000000000
> > > > > > > > > > > [   36.183631] x5 : 0000000000000805 x4 : 00000000020=
00000 x3 : 0000000000000028
> > > > > > > > > > > [   36.183640] x2 : 0000000049627000 x1 : ffff800080c=
60b40 x0 : ffff800081780000
> > > > > > > > > > > [   36.183652] Kernel panic - not syncing: Asynchrono=
us SError Interrupt
> > > > > > > > > > > [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shu=
tdow Tainted: G   M
> > > > > > > 6.19.0-
> > > > > > > > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > > > > > > > [   36.183665] Tainted: [M]=3DMACHINE_CHECK
> > > > > > > > > > > [   36.183668] Hardware name: devboard1 (DT)
> > > > > > > > > > > [   36.183672] Call trace:
> > > > > > > > > > > [   36.183675]  show_stack+0x18/0x24 (C)
> > > > > > > > > > > [   36.183692]  dump_stack_lvl+0x34/0x8c
> > > > > > > > > > > [   36.183702]  dump_stack+0x18/0x24
> > > > > > > > > > > [   36.183708]  vpanic+0x314/0x35c
> > > > > > > > > > > [   36.183716]  nmi_panic+0x0/0x64
> > > > > > > > > > > [   36.183722]  add_taint+0x0/0xbc
> > > > > > > > > > > [   36.183728]  arm64_serror_panic+0x70/0x80
> > > > > > > > > > > [   36.183735]  do_serror+0x28/0x68
> > > > > > > > > > > [   36.183742]  el1h_64_error_handler+0x34/0x50
> > > > > > > > > > > [   36.183751]  el1h_64_error+0x6c/0x70
> > > > > > > > > > > [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x=
458 (P)
> > > > > > > > > > > [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> > > > > > > > > > > [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x=
9c/0xc4
> > > > > > > > > > > [   36.183792]  ili9881c_unprepare+0x38/0x88
> > > > > > > > > > > [   36.183802]  drm_panel_unprepare+0xbc/0x108
> > > > > > > > > > > [   36.183814]  panel_bridge_atomic_post_disable+0x50=
/0x60
> > > > > > > > > > > [   36.183823]  drm_atomic_bridge_call_post_disable+0=
x24/0x4c
> > > > > > > > > > > [   36.183835]  drm_atomic_bridge_chain_post_disable+=
0xa8/0x100
> > > > > > > > > > > [   36.183845]  drm_atomic_helper_commit_modeset_disa=
bles+0x2fc/0x5f8
> > > > > > > > > > > [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x2=
4/0x7c
> > > > > > > > > > > [   36.183865]  commit_tail+0xa4/0x18c
> > > > > > > > > > > [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> > > > > > > > > > > [   36.183884]  drm_atomic_commit+0x8c/0xcc
> > > > > > > > > > > [   36.183892]  drm_atomic_helper_disable_all+0x200/0=
x210
> > > > > > > > > > > [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> > > > > > > > > > > [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> > > > > > > > > > > [   36.183920]  platform_shutdown+0x24/0x34
> > > > > > > > > > > [   36.183931]  device_shutdown+0x128/0x284
> > > > > > > > > > > [   36.183938]  kernel_restart+0x44/0xa4
> > > > > > > > > > > [   36.183950]  __do_sys_reboot+0x178/0x270
> > > > > > > > > > > [   36.183959]  __arm64_sys_reboot+0x24/0x30
> > > > > > > > > > > [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> > > > > > > > > > > [   36.183979]  do_el0_svc+0x40/0xc0
> > > > > > > > > > > [   36.183988]  el0_svc+0x3c/0x164
> > > > > > > > > > > [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> > > > > > > > > > > [   36.184002]  el0t_64_sync+0x198/0x19c
> > > > > > > > > > > [   36.184020] Kernel Offset: disabled
> > > > > > > > > > > [   36.184022] CPU features: 0x200000,00020001,4000c5=
01,0400720b
> > > > > > > > > > > [   36.184028] Memory Limit: none
> > > > > > > > > > > [   36.495305] ---[ end Kernel panic - not syncing: A=
synchronous SError
> Interrupt ]---
> > > > > > > > > > >
> > > > > > > > > > > The problem is present since linux-6.18-rc1, but not
> > > > > > > > > > > in linux-6.17. I also confirm the bug is
> > > > > > > > > present in linux-6.19-rc4.
> > > > > > > > > > >
> > > > > > > > > > > The bug seems to be happening in rzg2l_mipi_dsi_host_=
transfer().
> > > > > > > > > > >
> > > > > > > > > > > After bisecting, here is the first bad commit:
> > > > > > > > > > >
> > > > > > > > > > >      commit 56de5e305d4b ("clk: renesas: r9a07g044:
> > > > > > > > > > > Add MSTOP for
> > > > > > > > > > > RZ/G2L")
> > > > > > > > > > >
> > > > > > > > > > > Reverting this change makes the bug disappear.
> > > > > > > > > > >
> > > > > > > > > > > My limited understanding seems to indicate that the
> > > > > > > > > > > MIPI/DSI host may no longer be available/on when the
> > > > > > > > > > > panel tries to send MIPI/DSI commands in
> > > > > > > > > > > ili9881c_unprepare(), maybe because the MIPI/DSI
> > > > > > > > > > > clock has been
> > > > > > > stopped...
> > > > > > > > > > >
> > > > > > > > > > > The exact same board with two other panels (jd9365da =
and st7703) doesn't have the
> bug.
> > > > > > > > > >
> > > > > > > > > > Could you please provide the output of command:
> > > > > > > > > >
> > > > > > > > > > cat /sys/kernel/debug/mstop
> > > > > > > > > >
> > > > > > > > > > for both cases?
> > > > > > > > >
> > > > > > > > > Here it is for the panel which has the bug:
> > > > > > > > >
> > > > > > > > > ----------------------------------
> > > > > > > > >                            MSTOP
> > > > > > > > >                      clk   -------------------------
> > > > > > > > > clk_name             cnt   cnt   off   val    shared
> > > > > > > > > --------             ----- ----- ----- ------ ------
> > > > > > > > > gic                  1     1     0xb80 0x0
> > > > > > > > > ia55_clk             2     2     0xb70 0x0    ia55_pclk i=
a55_clk
> > > > > > > > > ia55_pclk            1     2     0xb70 0x0    ia55_pclk i=
a55_clk
> > > > > > > > > dmac_aclk            2     1     0xb80 0x0
> > > > > > > > > dmac_pclk            1     1     0xb80 0x0
> > > > > > > > > ostm0_pclk           0     0     0xb7c 0x10
> > > > > > > > > ostm1_pclk           1     1     0xb7c 0x0
> > > > > > > > > ostm2_pclk           1     1     0xb7c 0x0
> > > > > > > > > mtu_x_mck            0     0     0xb64 0x4
> > > > > > > > > gpt_pclk             1     1     0xb64 0x0
> > > > > > > > > poeg_a_clkp          0     0     0xb64 0x20
> > > > > > > > > poeg_b_clkp          0     0     0xb64 0x40
> > > > > > > > > poeg_c_clkp          0     0     0xb64 0x80
> > > > > > > > > poeg_d_clkp          0     0     0xb64 0x100
> > > > > > > > > wdt0_pclk            1     2     0xb7c 0x0    wdt0_pclk w=
dt0_clk
> > > > > > > > > wdt0_clk             1     2     0xb7c 0x0    wdt0_pclk w=
dt0_clk
> > > > > > > > > wdt1_pclk            0     0     0xb7c 0x8    wdt1_pclk w=
dt1_clk
> > > > > > > > > wdt1_clk             0     0     0xb7c 0x8    wdt1_pclk w=
dt1_clk
> > > > > > > > > spi_clk2             0     0     0xb64 0x2    spi_clk2 sp=
i_clk
> > > > > > > > > spi_clk              0     0     0xb64 0x2    spi_clk2 sp=
i_clk
> > > > > > > > > sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk=
 sdhi0_imclk2 sdhi0_clk_hs
> > > sdhi0_aclk
> > > > > > > > > sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk=
 sdhi0_imclk2 sdhi0_clk_hs
> > > sdhi0_aclk
> > > > > > > > > sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk=
 sdhi0_imclk2 sdhi0_clk_hs
> > > sdhi0_aclk
> > > > > > > > > sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk=
 sdhi0_imclk2 sdhi0_clk_hs
> > > sdhi0_aclk
> > > > > > > > > sdhi1_imclk          0     0     0xb6c 0x2    sdhi1_imclk=
 sdhi1_imclk2 sdhi1_clk_hs
> > > sdhi1_aclk
> > > > > > > > > sdhi1_imclk2         0     0     0xb6c 0x2    sdhi1_imclk=
 sdhi1_imclk2 sdhi1_clk_hs
> > > sdhi1_aclk
> > > > > > > > > sdhi1_clk_hs         0     0     0xb6c 0x2    sdhi1_imclk=
 sdhi1_imclk2 sdhi1_clk_hs
> > > sdhi1_aclk
> > > > > > > > > sdhi1_aclk           0     0     0xb6c 0x2    sdhi1_imclk=
 sdhi1_imclk2 sdhi1_clk_hs
> > > sdhi1_aclk
> > > > > > > > > gpu_clk              1     1     0xb80 0x0
> > > > > > > > > cru_sysclk           0     0     0xb78 0x8    cru_sysclk =
cru_vclk cru_pclk cru_aclk
> > > > > > > > > cru_vclk             0     0     0xb78 0x8    cru_sysclk =
cru_vclk cru_pclk cru_aclk
> > > > > > > > > cru_pclk             0     0     0xb78 0x8    cru_sysclk =
cru_vclk cru_pclk cru_aclk
> > > > > > > > > cru_aclk             0     0     0xb78 0x8    cru_sysclk =
cru_vclk cru_pclk cru_aclk
> > > > > > > > > dsi_pll_clk          1     6     0xb78 0x0    dsi_pll_clk=
 dsi_sys_clk dsi_aclk
> dsi_pclk
> > > > > dsi_vclk
> > > > > > > > > dsi_lpclk
> > > > > > > > > dsi_sys_clk          1     6     0xb78 0x0    dsi_pll_clk=
 dsi_sys_clk dsi_aclk
> dsi_pclk
> > > > > dsi_vclk
> > > > > > > > > dsi_lpclk
> > > > > > > > > dsi_aclk             1     6     0xb78 0x0    dsi_pll_clk=
 dsi_sys_clk dsi_aclk
> dsi_pclk
> > > > > dsi_vclk
> > > > > > > > > dsi_lpclk
> > > > > > > > > dsi_pclk             1     6     0xb78 0x0    dsi_pll_clk=
 dsi_sys_clk dsi_aclk
> dsi_pclk
> > > > > dsi_vclk
> > > > > > > > > dsi_lpclk
> > > > > > > > > dsi_vclk             1     6     0xb78 0x0    dsi_pll_clk=
 dsi_sys_clk dsi_aclk
> dsi_pclk
> > > > > dsi_vclk
> > > > > > > > > dsi_lpclk
> > > > > > > > > dsi_lpclk            1     6     0xb78 0x0    dsi_pll_clk=
 dsi_sys_clk dsi_aclk
> dsi_pclk
> > > > > dsi_vclk
> > > > > > > > > dsi_lpclk
> > > > > > > > > lcdc_a               3     1     0xb78 0x0    lcdc_a lcdc=
_p
> > > > > > > > > lcdc_p               3     1     0xb78 0x0    lcdc_a lcdc=
_p
> > > > > > > > > lcdc_clk_d           3     1     0xb78 0x0
> > > > > > > > > ssi0_pclk            0     0     0xb64 0x400  ssi0_pclk s=
si0_sfr
> > > > > > > > > ssi0_sfr             0     0     0xb64 0x400  ssi0_pclk s=
si0_sfr
> > > > > > > > > ssi1_pclk            0     0     0xb64 0x800  ssi1_pclk s=
si1_sfr
> > > > > > > > > ssi1_sfr             0     0     0xb64 0x800  ssi1_pclk s=
si1_sfr
> > > > > > > > > ssi2_pclk            0     0     0xb64 0x1000 ssi2_pclk s=
si2_sfr
> > > > > > > > > ssi2_sfr             0     0     0xb64 0x1000 ssi2_pclk s=
si2_sfr
> > > > > > > > > ssi3_pclk            0     0     0xb64 0x2000 ssi3_pclk s=
si3_sfr
> > > > > > > > > ssi3_sfr             0     0     0xb64 0x2000 ssi3_pclk s=
si3_sfr
> > > > > > > > > usb0_host            3     1     0xb6c 0x0
> > > > > > > > > usb1_host            0     0     0xb6c 0x80
> > > > > > > > > usb0_func            1     1     0xb6c 0x0
> > > > > > > > > usb_pclk             5     1     0xb6c 0x0
> > > > > > > > > eth0_axi             0     0     0xb6c 0x4    eth0_axi et=
h0_chi
> > > > > > > > > eth0_chi             0     0     0xb6c 0x4    eth0_axi et=
h0_chi
> > > > > > > > > eth1_axi             0     0     0xb6c 0x8    eth1_axi et=
h1_chi
> > > > > > > > > eth1_chi             0     0     0xb6c 0x8    eth1_axi et=
h1_chi
> > > > > > > > > i2c0                 0     0     0xb68 0x400
> > > > > > > > > i2c1                 0     0     0xb68 0x800
> > > > > > > > > i2c2                 0     0     0xb68 0x1000
> > > > > > > > > i2c3                 0     0     0xb68 0x2000
> > > > > > > > > scif0                2     1     0xb68 0x0
> > > > > > > > > scif1                0     0     0xb68 0x4
> > > > > > > > > scif2                0     0     0xb68 0x8
> > > > > > > > > scif3                0     0     0xb68 0x10
> > > > > > > > > scif4                0     0     0xb68 0x20
> > > > > > > > > sci0                 0     0     0xb68 0x80
> > > > > > > > > sci1                 0     0     0xb68 0x100
> > > > > > > > > rspi0                0     0     0xb64 0x4000
> > > > > > > > > rspi1                0     0     0xb64 0x8000
> > > > > > > > > rspi2                0     0     0xb68 0x1
> > > > > > > > > canfd                0     0     0xb68 0x200
> > > > > > > > > gpio                 1     1     0xb70 0x0
> > > > > > > > > adc_adclk            0     0     0xb68 0x4000 adc_adclk a=
dc_pclk
> > > > > > > > > adc_pclk             0     0     0xb68 0x4000 adc_adclk a=
dc_pclk
> > > > > > > > > tsu_pclk             1     1     0xb68 0x0
> > > > > > > > > ----------------------------------
> > > > > > > > >
> > > > > > > > > I do not have acces to the other panels for the moment to=
 run the same command.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > Also, could you please check if the following diff solv=
es your problem:
> > > > > > > > > >
> > > > > > > > > > diff --git
> > > > > > > > > > a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > > > index 5edd45424562..62957632a96f 100644
> > > > > > > > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > > > @@ -1282,6 +1282,10 @@ static ssize_t
> > > > > > > > > > rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host=
,
> > > > > > > > > >                  value |=3D SQCH0DSC0AR_FMT_SHORT;
> > > > > > > > > >          }
> > > > > > > > > >
> > > > > > > > > > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > > > > > > > > > +       if (ret)
> > > > > > > > > > +               return ret;
> > > > > > > > > > +
> > > > > > > > > >          rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR,
> > > > > > > > > > value);
> > > > > > > > > >
> > > > > > > > > >          /*
> > > > > > > > > > @@ -1322,6 +1326,8 @@ static ssize_t
> > > > > > > > > > rzg2l_mipi_dsi_host_transfer(struct
> > > > > > > > > > mipi_dsi_host *host,
> > > > > > > > > >                          ret =3D packet.payload_length;
> > > > > > > > > >          }
> > > > > > > > > >
> > > > > > > > > > +       pm_runtime_put(dsi->dev);
> > > > > > > > > > +
> > > > > > > > > >          return ret;
> > > > > > > > > >   }
> > > > > > > > >
> > > > > > > > > I confirm that it fixes the bug, altought I assume this
> > > > > > > > > is just for testing and is not the
> > > > > > > "proper"
> > > > > > > > > fix.
> > > > > > > >
> > > > > > > > Pre-MSTOP case during reboot, without clk it is accessing
> > > > > > > > registers)(mstop off always) it won't crash. But looks
> > > > > > > > like you may have ignored timeout error from
> > > > > > > [1].
> > > > > > >
> > > > > > > In case of a timeout error, it is not really ignored as the
> > > > > > > proper error code -ETIMEDOUT will be returned by
> > > > > > > rzg2l_mipi_dsi_host_transfer() (see log below). The hardware
> > > > > > > manual doesn't seem to properly explain how to deal with a
> > > > > > > timeout (or I could not find it). Do you have
> > > > > any suggestion on how to improve this?
> > > > > > >
> > > > > > > >
> > > > > > > > Post MSTOP case, if you access registers with mstop on, it =
will lead to crash.
> > > > > > > >
> > > > > > > > and the patch fixes crash.
> > > > > > > >
> > > > > > > > Basically, you are accessing link register after video is s=
topped with this panel.
> > > > > > > > Looks like it is a fix for me.
> > > > > > >
> > > > > > > Ok, like I said I am not an expert on this, but I was just
> > > > > > > assuming that there was a better way to ensure that the
> > > > > > > mipi/dsi interface was still active until the panel
> > > > > > > unprepare() function could do its work. I was looking at
> > > > > > > some other drivers mipi/dsi
> > > > > > > host_transfer() functions and did not see a similar
> > > > > > > pm_runtime_resume_and_get() scheme, hence my confusion.
> > > > > > >
> > > > > > > > Better check if there is any timeout error[1] with this pat=
ch.
> > > > > > > > if not, It is proper fix.
> > > > > > >
> > > > > > > The patch does fixes the kernel panic, but doesn't allow the
> > > > > > > panel to be properly unprepared, as I just noticed the timeou=
t message:
> > > > > > >
> > > > > > >     [   39.321153] ili9881c-dsi 10850000.dsi.0: sending DCS S=
ET_DISPLAY_OFF failed: -110
> > > > > > >
> > > > > > > In my case, for a reboot, this is not a problem, but it may
> > > > > > > be a problem for systems where it can be suspended (I assume)=
?
> > > > > > >
> > > > > > > Thank you for your help with this.
> > > > > >
> > > > > > Can you please try implement .atomic_post_disable()
> > > > > > symmetrical to
> > > rzg2l_mipi_dsi_atomic_pre_enable?
> > > > > >
> > > > > > Ie, move just rzg2l_mipi_dsi_stop(dsi) from
> > > > > > rzg2l_mipi_dsi_atomic_disable() to
> > > > > > rzg2l_mipi_dsi_atomic_post_disable()
> > > > > >
> > > > > > and check  you can send DCS SET_DISPLAY_OFF successfully.
> > > > >
> > > > > I reverted the previous fix (pm_runtime_resume_and_get), and
> > > > > implemented .atomic_post_disable as you suggested, and this
> > > > > works great: the bug is  no longer
> > > present and I do not see timeout errors:
> > > > >
> > > > > [  537.727556] systemd-shutdown[1]: Syncing filesystems and block=
 devices.
> > > > > [  537.734544] systemd-shutdown[1]: Rebooting.
> > > > > [  538.520174] rzg2l-mipi-dsi 10850000.dsi:
> > > > > rzg2l_mipi_dsi_atomic_disable(): entry [  538.547848] ili9881c-ds=
i 10850000.dsi.0:
> > > ili9881c_unprepare(): entry [  538.564524] rzg2l-mipi-dsi 10850000.ds=
i:
> > > > > rzg2l_mipi_dsi_atomic_post_disable(): entry [  538.574016] reboot=
:
> > > > > Restarting system
> > > >
> > > > Great!
> > >
> > > Will you send a patch for this?
> >
> > Please feel free to send the patch, as you have the hardware to test it=
.
> >
> > I will add my Tb tag after testing your patch on my bridge setup.
>=20
> Ok, will do.
>=20
> Can you also check on what Claudiu mentioned about MSTOP values for this =
driver?

MSTOP is working as expected that is the reason you got abort during reboot=
.
If there is an issue with mstop usage count, you won't get abort.

All the clocks are turned off and usage count of mstop becomes 0 during reb=
oot
and mstop set to 1.

Cheers,
Biju
