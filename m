Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949AD0B141
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1462510E8F3;
	Fri,  9 Jan 2026 15:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O58HbXN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDE210E8F1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNfBhlm5cdh3tLsNHynTLO29b/a6I68Al2yrMc1kvKSvVi0tbJDLb/8nzS8Zs7E/RpiR/6YsabR0IXt+mTbH3yhvIcDPR66lvXrUCEbum7CoKANRGVq9P3UbQ/7zQkfLxekbsQ0briwZ1NtyA5MeNE+L2tkSyv3d/Kv37YrKfkUSZaQFnHh9T1cEEQUj+ZWPcAibwuLey0FSWRDSYkZAAdQ6QZfZaLWilAlhmYvgLA3dGRtoUsqepHcG8SMl3sW+bRF3b9Q7LklncWxBfvD///EJB802l8kvothZGqXMViAXD8sjVhG7pT50bBRxk9WoZ5rcxK4EOKqVpMUgtKbfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj1EOOv37fg0nOyq7y3xMi7gsbwQyrekqXOToiFHd5w=;
 b=A2H6NB89siHzrIvVXoFsT7RkUl1Tf3fcdbKF17wnScRzwFMyZ5Dst9hOiO+6RQyzfNJZEncoHGFYNNoK49UrhhBCn1nangKJ4YCsVf9Oe7kJfLO907LvVRonwIM9uAk91E8xuXxDysj2UPMk/q6qgjGzW2Np3gHxcRhuTrgfRsjuBqYRRM6DPDVPiY1o2yIX1TfqiTZcE46Mi19DNYpx8GYQQ8pext2GF5yZnbCMnsgtSUHZLRTNRDLSN+wxdft8d7f/VSC5CMC9MjXfSNF+EkKW7RzfAcI77vhxiYCl8HzDXCTqm6yrsufsi9RLQw/xCJj0wnrh28JpCcugG4yTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj1EOOv37fg0nOyq7y3xMi7gsbwQyrekqXOToiFHd5w=;
 b=O58HbXN11CY60Z7Q218rxjX02t2vWm/B05mVSc3coeG/4qXltQlpTg6Jk97a3uoovDoyMjnZ9PgbEx08TkNL34+SFeusIr3LXtMn+WO1Yhz1XC++dFMfLG7HH+dWpk/bVj+d0DAQjzH/+9tsSfztxOXci1iPeuz8DV6FWUjJ/oU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9621.jpnprd01.prod.outlook.com (2603:1096:604:1cf::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 15:57:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 15:57:18 +0000
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
Thread-Index: AQHcgH7+LfMjCpngTEmutarkKkFyQ7VIbNOAgAAJDQCAABf9AIAAOKJggAErDACAAA5bAA==
Date: Fri, 9 Jan 2026 15:57:17 +0000
Message-ID: <TY3PR01MB11346170A13E303D80369DE128682A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
 <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
 <20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
 <TY3PR01MB11346AA75CAA2496A06BCEC438685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260108125134.6ce05fd214a217a37de9ed4b@hugovil.com>
 <TY3PR01MB113467DBEE7A2A0B3A93050788685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260109100436.f499618affc1fecd11c25097@hugovil.com>
In-Reply-To: <20260109100436.f499618affc1fecd11c25097@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9621:EE_
x-ms-office365-filtering-correlation-id: f721f3dd-8be9-4e8b-e720-08de4f97c3f4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Hq0fKvbl1CUNgHWNo9oQ6q2QUgK6JSmU7WOW0iQE7RYVLqsYtGOopCN9kpPO?=
 =?us-ascii?Q?aKQh0yLhc8kyuexA4NHUHsvWjQAsKVngWF/lX9UrsMW+XXBQksZ2Be4hY9ue?=
 =?us-ascii?Q?c27amYAKWEN/EfHwDjJ0OEJNI2E1Otd2PlhOkYkRGaUFMGEB0Uezlp7b+Si3?=
 =?us-ascii?Q?X77sFTAC0ZGxwXlrwvdsCWC9bn86um8SfAKgsBgsWou4KYHGDbIw++gg92MZ?=
 =?us-ascii?Q?zaWGI65Ruu9rRqhYMavGcXc2jXnj0PUPTNKpYtEnWlCqBbmd2349q1LHXdFz?=
 =?us-ascii?Q?f2qqRZNO5Wm73NCgbaruYtO+SfotWqU9+gINfdHnpUGsHydNH6RDcovXWxVz?=
 =?us-ascii?Q?cUBc/gJOzJ6zR+jiwPPFgxd/AarS8oJDULqwtV/VzP+Yh9ifOHWgr+Bqw+GF?=
 =?us-ascii?Q?tmZJ+TWPjVn9K2A2fyZn23M4QUaA3Hf8YcrP4CACi6Tt1IYqVTHGEyDNq3T4?=
 =?us-ascii?Q?wCmEPo1SnxeBbmli1AJ4Diox+O2kJ7pGV2F7freC5aszwF/3GXZjjpth1IH3?=
 =?us-ascii?Q?whxjBQ2JAGy2alQeRptKc8vk/EtcxglIWtyfjUobReu+M88ZDMxka2aDARvn?=
 =?us-ascii?Q?RbJtA2UXnlYs6AzoNZuxEYNDEqG77qYBGW8w+5ux9TkhZqtx1XV2f7wgiDUu?=
 =?us-ascii?Q?0AT20U5Nhzs9lvtqnbYf4XUyDLIN3CHq+qy833t0qXcXNW+v6mlVzfeQaGGG?=
 =?us-ascii?Q?jeEYnWGWFVmNlpYmik2mBeMc7QWfGLX++2zNt7Ar9kv5cw63MTlm8A80FSsb?=
 =?us-ascii?Q?rE1qjVAmtUFAnykpiACboubOy1f9Uv9Iav9osvRT0wcStiJgUrl7rko5OwE7?=
 =?us-ascii?Q?EoUX2t0qp7KliiFGtBDcQ42xEAdrLI0LH1zsOU3z+cT6xO1nxI2516bERW/4?=
 =?us-ascii?Q?MMKpXk+mwf4wyKWvPkxH2XDnusBiU+SJQ8cnHgTOWH0ja1JIE3t/Ge7R2MJ6?=
 =?us-ascii?Q?hN3OC/ed5N/zC1+1DEq2rApzKLJFyWii0xhyu6TmOW7cQjFe/6R49cVBWYQ1?=
 =?us-ascii?Q?vinldVLPDuMZCVw0Hs6mfNAHXslVbrElzS1qieipX16gnlWGNq0erFXngV+j?=
 =?us-ascii?Q?ygl3OkvJ9vOATTmhwHVH2jlU9hKthKFClLuWDziTdJgAzWHLO3kAhA3ynX+Y?=
 =?us-ascii?Q?Rs5CM8Eom7MZ24bM4GzsqBzsZvLK/cMC3OQuvqm5yiTE7wOcyR9e8TNPw2qs?=
 =?us-ascii?Q?uEXB8eX9q+EbJMqQpaChE9jLAAf4EmwryWtUPyRqDAmucr/K1MaaSbxaUEO8?=
 =?us-ascii?Q?8haSa5Xzt0u+a94FRM1qjTIuxeLZ/T2VI0n/pa/VKBbsqPQR4XTZamV+UCs2?=
 =?us-ascii?Q?ZooXTvXWajX4jHiEdsOlBt5X/wU9HkmJWoij9Hq98U55qTg+10d0Cng1eFfc?=
 =?us-ascii?Q?otMOmiMmmh862fLc8L7nHo2DPjsL/KOTXfNuG+q7doRHqWwNfULpGiC/zq9J?=
 =?us-ascii?Q?b5BH5MM9i+kamhCoaPa+i/KkjN2J1JG88A1gHMCMsPBQ6g4Y8OX2Kv7Gl/CB?=
 =?us-ascii?Q?yUExmYpUmZIhB9U5NuQCc4nUFKWyKAeY1r0E?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3I16bHazEmaOZRDRxqN2PCa9JolDzd3atm2vfq+RhXFV4cn7yk8wgnmnc6Ak?=
 =?us-ascii?Q?UxTmRsr8r7iTCK1W1DIJ7J9a5qCuR4k43uKjduwwQI0xgSJ7lXDW9yS4VF9V?=
 =?us-ascii?Q?bvylHoLgpFobAxRKG3R8PdR61biIAHSDbcRr+i69EqmX0JpKDeeLwWo5F8SV?=
 =?us-ascii?Q?mxupoVbNePCwggrwcL812Q+S/Jlqnego6nRK+YqdUWW/E5f1sBX7XCMg10dX?=
 =?us-ascii?Q?Gwly601Id3hYkXxp1hkBq1k4CdD4l4lbVimtrj1NJRtXUPUXtHZymEiFEoXi?=
 =?us-ascii?Q?DUuhvndk3+C+WUj8ap8n0LeuIvxgAR/jomh6U18XYwwuTBOziPMUrxpol4r0?=
 =?us-ascii?Q?UztyF/VZ89BPATycVt9jdRMdtu7wctTPXEUj7eqL6fXlmKdZCsvJ+wk6mIRe?=
 =?us-ascii?Q?MJs5Z7wxyT6e5u4YARWLAFp45dTk2zf0n/NxMUhQ97I10/+GeQv95WqFyo/g?=
 =?us-ascii?Q?fD6kSIyvSh8qJ7OB1gMcA89vAfikggKYlGojwPmEVUZWoKEV89hCe6QGfo9I?=
 =?us-ascii?Q?GkZ6Yh1eE2GTJPJPau47K2An3i2reNdWoziXlXTNGkbjNdZx0FD9c+zV7vSI?=
 =?us-ascii?Q?Nlyui5DCPCxpx4fOVozeDDVY8THgJSJeq8rpo7wwXmT58fL/qIvvPoG+mHMm?=
 =?us-ascii?Q?njzZ6eIZ4zIUqlOf0qK/HorjdrFLklaqryQbFPuwJRvW2zYhPjIPymtA9Jqk?=
 =?us-ascii?Q?31U9A5ydm6xhHsddTtJQYVzVkRCDPDWEzXGX/VtWVJbYi1QHO1uIoEDKYqND?=
 =?us-ascii?Q?KH1AN24CkyYdQo7SGlG/L/JYM5j6reedQgSKmg5b3C0wkhq5KGz2MRP+Zsot?=
 =?us-ascii?Q?iLe/XXrTwsWuGc4tQwOEXur491hT85EIpMTF+OrmzgymSXxggUnPVuUiL3ui?=
 =?us-ascii?Q?FZUViiOFrBjmKDbITppeZTn7ztMaiDYAn/saL2JfTdGt8R2B6NDViggsgVSS?=
 =?us-ascii?Q?O06FfGrYRXYICIvfCNeE7fqcEenJAyQ7bSf6nVpUbroo9DHuEsd0txBubCoF?=
 =?us-ascii?Q?OPozy6N4XZCer/YMUL653yzRaw72IuWy0BhYtgc07zKFhLOS5X0zfcfZOLW7?=
 =?us-ascii?Q?s4gRpz2m1wFrby3LUEcdV8kPFoUuB+1e2KJ9vKCuJcR4VPIeyf921SlkwsQB?=
 =?us-ascii?Q?MUmFJm6790PCawrmNsY2+vhSOWtza0bdHVRhCeTASQgcKkwcJDdx59lf5AvQ?=
 =?us-ascii?Q?2W8s7Oszdl3bRGQ1wzhX+RagtvTH8MmxCs3NAVgtAs3OrrsWfkrMUlIr2zKO?=
 =?us-ascii?Q?k/ImdnkdiWyz74G72EDgn6DjgEAG7bpHSWsH4jwUbKsvuIXhptUrJfm5yTi2?=
 =?us-ascii?Q?WOwE8OYMUu4rYxmyP4rTga059JKrt2yZYhKJJ7r2kxGziYktqkjPPSKe15oS?=
 =?us-ascii?Q?bJ2LBy8csxAXaUP8rWeNAg9iQKyTOH0Meg/GpxYZFob85JPhSolwX1aVwZqO?=
 =?us-ascii?Q?d7IJyNrRVXc4LXFq7yvXNnZDPcrF74fJCjqHncpowDy5QVbxRVrdNd1Felz7?=
 =?us-ascii?Q?tOEAavuIyjvLgDnoKMYOGUy2b/YsKl2YSRlZGGneMIWrfITiuC6VikQkYq1B?=
 =?us-ascii?Q?3rVngSc800T9d1FX4RR+FaRKiOS0LIsm/ocJj5apucpW89tre3GG/6iSERqb?=
 =?us-ascii?Q?LEGLPJ/SEpdHVIsIO70osadt78VcnJLPdiBpl4Uvujb76LB9VqZC6x6ulVsU?=
 =?us-ascii?Q?7NR/nU3n2DQfEp3oXI6n+X7vxaDJESm9rI8mxe14rGbCwPmAG0J2rksa52P+?=
 =?us-ascii?Q?ZMYdMS4sXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f721f3dd-8be9-4e8b-e720-08de4f97c3f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 15:57:17.9042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2z863Sy1up26vs7G+94V2AqrlYfqC+io9jadTieQqD3S/U/uw3/hyjJuk+306Y0fOLG337UFRtTAkN69/3aTHb7do9+Asq4EvdwEOx60NFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9621
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hu=
go Villeneuve
> Sent: 09 January 2026 15:05
> Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
>=20
> Hi Biju,
>=20
> On Thu, 8 Jan 2026 21:21:00 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Hi Hugo,
> >
> > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > Sent: 08 January 2026 17:52
> > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > reboot
> > >
> > > Hi Biju,
> > >
> > > On Thu, 8 Jan 2026 16:44:37 +0000
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > >
> > > > Hi Hugo Villeneuve,
> > > >
> > > > > -----Original Message-----
> > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > Sent: 08 January 2026 15:53
> > > > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > > > reboot
> > > > >
> > > > > Hi Claudiu,
> > > > >
> > > > > On Thu, 8 Jan 2026 11:12:54 +0200 Claudiu Beznea
> > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > >
> > > > > > Hi, Hugo,
> > > > > >
> > > > > > On 1/7/26 23:48, Hugo Villeneuve wrote:
> > > > > > > Hi,
> > > > > > > when issuing a reboot command, I encounter the following kern=
el panic:
> > > > > > >
> > > > > > > [   36.183478] SError Interrupt on CPU1, code 0x00000000be000=
011 -- SError
> > > > > > > [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tai=
nted: G   M
> > > 6.19.0-
> > > > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > > > [   36.183504] Tainted: [M]=3DMACHINE_CHECK
> > > > > > > [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> > > > > > > [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DI=
T -SSBS BTYPE=3D--)
> > > > > > > [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> > > > > > > [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> > > > > > > [   36.183547] sp : ffff8000813db860
> > > > > > > [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x2=
7: ffff000009dd7450
> > > > > > > [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x2=
4: ffff800080e1f7a8
> > > > > > > [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x2=
1: ffff000009dd7430
> > > > > > > [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x1=
8: 00000000ffffffff
> > > > > > > [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x1=
5: ffff8000813db220
> > > > > > > [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x1=
2: 00000000000009a2
> > > > > > > [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9=
 : ffff800081255bc0
> > > > > > > [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6=
 : 0000000000000000
> > > > > > > [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3=
 : 0000000000000028
> > > > > > > [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0=
 : ffff800081780000
> > > > > > > [   36.183652] Kernel panic - not syncing: Asynchronous SErro=
r Interrupt
> > > > > > > [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tai=
nted: G   M
> > > 6.19.0-
> > > > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > > > [   36.183665] Tainted: [M]=3DMACHINE_CHECK
> > > > > > > [   36.183668] Hardware name: devboard1 (DT)
> > > > > > > [   36.183672] Call trace:
> > > > > > > [   36.183675]  show_stack+0x18/0x24 (C)
> > > > > > > [   36.183692]  dump_stack_lvl+0x34/0x8c
> > > > > > > [   36.183702]  dump_stack+0x18/0x24
> > > > > > > [   36.183708]  vpanic+0x314/0x35c
> > > > > > > [   36.183716]  nmi_panic+0x0/0x64
> > > > > > > [   36.183722]  add_taint+0x0/0xbc
> > > > > > > [   36.183728]  arm64_serror_panic+0x70/0x80
> > > > > > > [   36.183735]  do_serror+0x28/0x68
> > > > > > > [   36.183742]  el1h_64_error_handler+0x34/0x50
> > > > > > > [   36.183751]  el1h_64_error+0x6c/0x70
> > > > > > > [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> > > > > > > [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> > > > > > > [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> > > > > > > [   36.183792]  ili9881c_unprepare+0x38/0x88
> > > > > > > [   36.183802]  drm_panel_unprepare+0xbc/0x108
> > > > > > > [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> > > > > > > [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> > > > > > > [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x1=
00
> > > > > > > [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2=
fc/0x5f8
> > > > > > > [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> > > > > > > [   36.183865]  commit_tail+0xa4/0x18c
> > > > > > > [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> > > > > > > [   36.183884]  drm_atomic_commit+0x8c/0xcc
> > > > > > > [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> > > > > > > [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> > > > > > > [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> > > > > > > [   36.183920]  platform_shutdown+0x24/0x34
> > > > > > > [   36.183931]  device_shutdown+0x128/0x284
> > > > > > > [   36.183938]  kernel_restart+0x44/0xa4
> > > > > > > [   36.183950]  __do_sys_reboot+0x178/0x270
> > > > > > > [   36.183959]  __arm64_sys_reboot+0x24/0x30
> > > > > > > [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> > > > > > > [   36.183979]  do_el0_svc+0x40/0xc0
> > > > > > > [   36.183988]  el0_svc+0x3c/0x164
> > > > > > > [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> > > > > > > [   36.184002]  el0t_64_sync+0x198/0x19c
> > > > > > > [   36.184020] Kernel Offset: disabled
> > > > > > > [   36.184022] CPU features: 0x200000,00020001,4000c501,04007=
20b
> > > > > > > [   36.184028] Memory Limit: none
> > > > > > > [   36.495305] ---[ end Kernel panic - not syncing: Asynchron=
ous SError Interrupt ]---
> > > > > > >
> > > > > > > The problem is present since linux-6.18-rc1, but not in
> > > > > > > linux-6.17. I also confirm the bug is
> > > > > present in linux-6.19-rc4.
> > > > > > >
> > > > > > > The bug seems to be happening in rzg2l_mipi_dsi_host_transfer=
().
> > > > > > >
> > > > > > > After bisecting, here is the first bad commit:
> > > > > > >
> > > > > > >      commit 56de5e305d4b ("clk: renesas: r9a07g044: Add
> > > > > > > MSTOP for
> > > > > > > RZ/G2L")
> > > > > > >
> > > > > > > Reverting this change makes the bug disappear.
> > > > > > >
> > > > > > > My limited understanding seems to indicate that the MIPI/DSI
> > > > > > > host may no longer be available/on when the panel tries to
> > > > > > > send MIPI/DSI commands in ili9881c_unprepare(), maybe
> > > > > > > because the MIPI/DSI clock has been
> > > stopped...
> > > > > > >
> > > > > > > The exact same board with two other panels (jd9365da and st77=
03) doesn't have the bug.
> > > > > >
> > > > > > Could you please provide the output of command:
> > > > > >
> > > > > > cat /sys/kernel/debug/mstop
> > > > > >
> > > > > > for both cases?
> > > > >
> > > > > Here it is for the panel which has the bug:
> > > > >
> > > > > ----------------------------------
> > > > >                            MSTOP
> > > > >                      clk   -------------------------
> > > > > clk_name             cnt   cnt   off   val    shared
> > > > > --------             ----- ----- ----- ------ ------
> > > > > gic                  1     1     0xb80 0x0
> > > > > ia55_clk             2     2     0xb70 0x0    ia55_pclk ia55_clk
> > > > > ia55_pclk            1     2     0xb70 0x0    ia55_pclk ia55_clk
> > > > > dmac_aclk            2     1     0xb80 0x0
> > > > > dmac_pclk            1     1     0xb80 0x0
> > > > > ostm0_pclk           0     0     0xb7c 0x10
> > > > > ostm1_pclk           1     1     0xb7c 0x0
> > > > > ostm2_pclk           1     1     0xb7c 0x0
> > > > > mtu_x_mck            0     0     0xb64 0x4
> > > > > gpt_pclk             1     1     0xb64 0x0
> > > > > poeg_a_clkp          0     0     0xb64 0x20
> > > > > poeg_b_clkp          0     0     0xb64 0x40
> > > > > poeg_c_clkp          0     0     0xb64 0x80
> > > > > poeg_d_clkp          0     0     0xb64 0x100
> > > > > wdt0_pclk            1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> > > > > wdt0_clk             1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> > > > > wdt1_pclk            0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> > > > > wdt1_clk             0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> > > > > spi_clk2             0     0     0xb64 0x2    spi_clk2 spi_clk
> > > > > spi_clk              0     0     0xb64 0x2    spi_clk2 spi_clk
> > > > > sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk sdhi0_i=
mclk2 sdhi0_clk_hs sdhi0_aclk
> > > > > sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk sdhi0_i=
mclk2 sdhi0_clk_hs sdhi0_aclk
> > > > > sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk sdhi0_i=
mclk2 sdhi0_clk_hs sdhi0_aclk
> > > > > sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk sdhi0_i=
mclk2 sdhi0_clk_hs sdhi0_aclk
> > > > > sdhi1_imclk          0     0     0xb6c 0x2    sdhi1_imclk sdhi1_i=
mclk2 sdhi1_clk_hs sdhi1_aclk
> > > > > sdhi1_imclk2         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_i=
mclk2 sdhi1_clk_hs sdhi1_aclk
> > > > > sdhi1_clk_hs         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_i=
mclk2 sdhi1_clk_hs sdhi1_aclk
> > > > > sdhi1_aclk           0     0     0xb6c 0x2    sdhi1_imclk sdhi1_i=
mclk2 sdhi1_clk_hs sdhi1_aclk
> > > > > gpu_clk              1     1     0xb80 0x0
> > > > > cru_sysclk           0     0     0xb78 0x8    cru_sysclk cru_vclk=
 cru_pclk cru_aclk
> > > > > cru_vclk             0     0     0xb78 0x8    cru_sysclk cru_vclk=
 cru_pclk cru_aclk
> > > > > cru_pclk             0     0     0xb78 0x8    cru_sysclk cru_vclk=
 cru_pclk cru_aclk
> > > > > cru_aclk             0     0     0xb78 0x8    cru_sysclk cru_vclk=
 cru_pclk cru_aclk
> > > > > dsi_pll_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys=
_clk dsi_aclk dsi_pclk
> dsi_vclk
> > > > > dsi_lpclk
> > > > > dsi_sys_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys=
_clk dsi_aclk dsi_pclk
> dsi_vclk
> > > > > dsi_lpclk
> > > > > dsi_aclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys=
_clk dsi_aclk dsi_pclk
> dsi_vclk
> > > > > dsi_lpclk
> > > > > dsi_pclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys=
_clk dsi_aclk dsi_pclk
> dsi_vclk
> > > > > dsi_lpclk
> > > > > dsi_vclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys=
_clk dsi_aclk dsi_pclk
> dsi_vclk
> > > > > dsi_lpclk
> > > > > dsi_lpclk            1     6     0xb78 0x0    dsi_pll_clk dsi_sys=
_clk dsi_aclk dsi_pclk
> dsi_vclk
> > > > > dsi_lpclk
> > > > > lcdc_a               3     1     0xb78 0x0    lcdc_a lcdc_p
> > > > > lcdc_p               3     1     0xb78 0x0    lcdc_a lcdc_p
> > > > > lcdc_clk_d           3     1     0xb78 0x0
> > > > > ssi0_pclk            0     0     0xb64 0x400  ssi0_pclk ssi0_sfr
> > > > > ssi0_sfr             0     0     0xb64 0x400  ssi0_pclk ssi0_sfr
> > > > > ssi1_pclk            0     0     0xb64 0x800  ssi1_pclk ssi1_sfr
> > > > > ssi1_sfr             0     0     0xb64 0x800  ssi1_pclk ssi1_sfr
> > > > > ssi2_pclk            0     0     0xb64 0x1000 ssi2_pclk ssi2_sfr
> > > > > ssi2_sfr             0     0     0xb64 0x1000 ssi2_pclk ssi2_sfr
> > > > > ssi3_pclk            0     0     0xb64 0x2000 ssi3_pclk ssi3_sfr
> > > > > ssi3_sfr             0     0     0xb64 0x2000 ssi3_pclk ssi3_sfr
> > > > > usb0_host            3     1     0xb6c 0x0
> > > > > usb1_host            0     0     0xb6c 0x80
> > > > > usb0_func            1     1     0xb6c 0x0
> > > > > usb_pclk             5     1     0xb6c 0x0
> > > > > eth0_axi             0     0     0xb6c 0x4    eth0_axi eth0_chi
> > > > > eth0_chi             0     0     0xb6c 0x4    eth0_axi eth0_chi
> > > > > eth1_axi             0     0     0xb6c 0x8    eth1_axi eth1_chi
> > > > > eth1_chi             0     0     0xb6c 0x8    eth1_axi eth1_chi
> > > > > i2c0                 0     0     0xb68 0x400
> > > > > i2c1                 0     0     0xb68 0x800
> > > > > i2c2                 0     0     0xb68 0x1000
> > > > > i2c3                 0     0     0xb68 0x2000
> > > > > scif0                2     1     0xb68 0x0
> > > > > scif1                0     0     0xb68 0x4
> > > > > scif2                0     0     0xb68 0x8
> > > > > scif3                0     0     0xb68 0x10
> > > > > scif4                0     0     0xb68 0x20
> > > > > sci0                 0     0     0xb68 0x80
> > > > > sci1                 0     0     0xb68 0x100
> > > > > rspi0                0     0     0xb64 0x4000
> > > > > rspi1                0     0     0xb64 0x8000
> > > > > rspi2                0     0     0xb68 0x1
> > > > > canfd                0     0     0xb68 0x200
> > > > > gpio                 1     1     0xb70 0x0
> > > > > adc_adclk            0     0     0xb68 0x4000 adc_adclk adc_pclk
> > > > > adc_pclk             0     0     0xb68 0x4000 adc_adclk adc_pclk
> > > > > tsu_pclk             1     1     0xb68 0x0
> > > > > ----------------------------------
> > > > >
> > > > > I do not have acces to the other panels for the moment to run the=
 same command.
> > > > >
> > > > >
> > > > > > Also, could you please check if the following diff solves your =
problem:
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > index 5edd45424562..62957632a96f 100644
> > > > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > @@ -1282,6 +1282,10 @@ static ssize_t
> > > > > > rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> > > > > >                  value |=3D SQCH0DSC0AR_FMT_SHORT;
> > > > > >          }
> > > > > >
> > > > > > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > > > > > +       if (ret)
> > > > > > +               return ret;
> > > > > > +
> > > > > >          rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
> > > > > >
> > > > > >          /*
> > > > > > @@ -1322,6 +1326,8 @@ static ssize_t
> > > > > > rzg2l_mipi_dsi_host_transfer(struct
> > > > > > mipi_dsi_host *host,
> > > > > >                          ret =3D packet.payload_length;
> > > > > >          }
> > > > > >
> > > > > > +       pm_runtime_put(dsi->dev);
> > > > > > +
> > > > > >          return ret;
> > > > > >   }
> > > > >
> > > > > I confirm that it fixes the bug, altought I assume this is just
> > > > > for testing and is not the
> > > "proper"
> > > > > fix.
> > > >
> > > > Pre-MSTOP case during reboot, without clk it is accessing
> > > > registers)(mstop off always) it won't crash. But looks like you
> > > > may have ignored timeout error from
> > > [1].
> > >
> > > In case of a timeout error, it is not really ignored as the proper
> > > error code -ETIMEDOUT will be returned by
> > > rzg2l_mipi_dsi_host_transfer() (see log below). The hardware manual
> > > doesn't seem to properly explain how to deal with a timeout (or I cou=
ld not find it). Do you have
> any suggestion on how to improve this?
> > >
> > > >
> > > > Post MSTOP case, if you access registers with mstop on, it will lea=
d to crash.
> > > >
> > > > and the patch fixes crash.
> > > >
> > > > Basically, you are accessing link register after video is stopped w=
ith this panel.
> > > > Looks like it is a fix for me.
> > >
> > > Ok, like I said I am not an expert on this, but I was just assuming
> > > that there was a better way to ensure that the mipi/dsi interface
> > > was still active until the panel unprepare() function could do its
> > > work. I was looking at some other drivers mipi/dsi
> > > host_transfer() functions and did not see a similar
> > > pm_runtime_resume_and_get() scheme, hence my confusion.
> > >
> > > > Better check if there is any timeout error[1] with this patch. if
> > > > not, It is proper fix.
> > >
> > > The patch does fixes the kernel panic, but doesn't allow the panel
> > > to be properly unprepared, as I just noticed the timeout message:
> > >
> > >     [   39.321153] ili9881c-dsi 10850000.dsi.0: sending DCS SET_DISPL=
AY_OFF failed: -110
> > >
> > > In my case, for a reboot, this is not a problem, but it may be a
> > > problem for systems where it can be suspended (I assume)?
> > >
> > > Thank you for your help with this.
> >
> > Can you please try implement .atomic_post_disable() symmetrical to rzg2=
l_mipi_dsi_atomic_pre_enable?
> >
> > Ie, move just rzg2l_mipi_dsi_stop(dsi) from
> > rzg2l_mipi_dsi_atomic_disable() to
> > rzg2l_mipi_dsi_atomic_post_disable()
> >
> > and check  you can send DCS SET_DISPLAY_OFF successfully.
>=20
> I reverted the previous fix (pm_runtime_resume_and_get), and implemented =
.atomic_post_disable as you
> suggested, and this works great: the bug is  no longer present and I do n=
ot see timeout errors:
>=20
> [  537.727556] systemd-shutdown[1]: Syncing filesystems and block devices=
.
> [  537.734544] systemd-shutdown[1]: Rebooting.
> [  538.520174] rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_disable=
(): entry [  538.547848]
> ili9881c-dsi 10850000.dsi.0: ili9881c_unprepare(): entry [  538.564524] r=
zg2l-mipi-dsi 10850000.dsi:
> rzg2l_mipi_dsi_atomic_post_disable(): entry [  538.574016] reboot: Restar=
ting system

Great!

Cheers,
Biju
