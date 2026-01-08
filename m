Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB6BD0644A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 22:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B989A10E381;
	Thu,  8 Jan 2026 21:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WcQLrDO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775D10E381
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 21:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWcG9aU/VVsRnvxgqPX36u/OhXrKHhdMX3kLlTLQyS0uwhTGdqV1UzYXo0I3B+gOEV7rwyqBwnjKpzqMkaS18D0Jtm0jORYKOtZOuJWESprfqT3JVdhAMKMaFVhaEnOOHSxlN7AhgSAmt+hsNwOeSIB1nA97opvfJCnnmb47yU1n9QyMnnc25lgoDMWa8tNfno7Z69FNFKhYYy9ljPZPi4sVW68mUfrmgiaC8GRj/oluNrwjv3fWdJpx+69WllOq8y566+994GxOcEw7C2R+IKn3Q+I2mgBfQfP0jGsp8WmncJWbUUzt+1wmJuqs/3+IYof/gDCfMaXChdXtHyMwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91JO3P2ORlEbY7pdYywP32s0w8mgnNa0NKRNm9dnue8=;
 b=Bgsr04KezVtcB3P2yi6L0ZAsEor2OoM0/Jbe1rvDXWW8CP0Zo4GYzdETm1N2GlkGG8agosc/CLg1+locjxHexNeXbT17Xvti14Hhkxvuzz86ad/M8T6HKjZzRzkSvjOqi6j9bEDQ6z6tv9o1OCPOaEREGPfHbnGSsLtxKDGXkYC/YiayIN2UL8sNlR7Cf85w3cVIyEp9urPR8c6w8rkA00nK/LnnOGi0LgfCUqWzmK9IU4Kze3EyK+/OBP5XnZOwPJMlpqSPEYLttRu/sob6K0QxAjhvdCctpZNnanSGeO+CWIc6vw+9RyVCvywECIwbQbq9BTnKyVthwxDb+yKOtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91JO3P2ORlEbY7pdYywP32s0w8mgnNa0NKRNm9dnue8=;
 b=WcQLrDO+T+NXE+EtwfxduDDgYcw5alVwZn/FUOr4yAxj5soQPPAn2NedDpnu4N747DS022NbdISWIWh/8zhqxFKELy3yphsI2XVCS/U18lfFbKtK0Cl9+sqD5uHFk9S8NHrcW8dcT9yeWRQiSv/Bu8IGr0c893hTS4HQECBZNoI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9416.jpnprd01.prod.outlook.com (2603:1096:400:195::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.0; Thu, 8 Jan
 2026 21:21:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.001; Thu, 8 Jan 2026
 21:21:00 +0000
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
Thread-Index: AQHcgH7+LfMjCpngTEmutarkKkFyQ7VIbNOAgAAJDQCAABf9AIAAOKJg
Date: Thu, 8 Jan 2026 21:21:00 +0000
Message-ID: <TY3PR01MB113467DBEE7A2A0B3A93050788685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
 <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
 <20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
 <TY3PR01MB11346AA75CAA2496A06BCEC438685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260108125134.6ce05fd214a217a37de9ed4b@hugovil.com>
In-Reply-To: <20260108125134.6ce05fd214a217a37de9ed4b@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9416:EE_
x-ms-office365-filtering-correlation-id: b62e9549-47a6-4a97-a86e-08de4efbd261
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?F+/ik5tq3Jg7xd3R/swhMUzcuF84fIixcICPbT989rP3vOFXVQuM0ZMpdK9m?=
 =?us-ascii?Q?8iHzPOTKt+GdqidhljXfzu2UBY2TadOZfYyEh4wEatuU1QOH+BPSy5RkKgwv?=
 =?us-ascii?Q?FEk86SWD8ERuCbWEtT1yv6WezfoBkxzVO9iJ87HaHb9hYwio4cA0B4f/+gNN?=
 =?us-ascii?Q?/l3kLpIMy6djKtyxw7DMa0hqoPYv1CFToje5dRorcWWWBUaf+l6W+3iq2k/T?=
 =?us-ascii?Q?FxpI3IDM+DiATAxzV5L6owA2RcP2F+3/I1KZubkP05+5bUSkHwe5qOL3gKDA?=
 =?us-ascii?Q?V+Usk+VMycoSFySJlsv64gTRTVgoC1mxKFFmh7jqU1/RdkptSpfEcz2KanwS?=
 =?us-ascii?Q?ZfjMFIM31BFomex5gQO0bQBp27bD9FPVEi6QUv+/Cvj0vlbw0R+uM2XTFoIr?=
 =?us-ascii?Q?25NK4XxlfvqSxgYLO8wbyMg8sFUGnMP4TDfYSssu7zaCWeq/A/0kjtyZKMql?=
 =?us-ascii?Q?XQQ2yHFBonWgSWz19AJT4dM+K/PDmfo6zJAr0KDmI389tGW6qgplKi3WXP80?=
 =?us-ascii?Q?i9Qg3n9ZEF7Y+UJEymh49rxYgUw9C4x/J9Qgsz1j6sM5nd7/IE+XQh+Mmm38?=
 =?us-ascii?Q?7IY3Q91LMp0caXSA7V4jvgNEp9cdaP9zW5eFb91XQz5TWzSYNSBPJQUE3JR3?=
 =?us-ascii?Q?+AceqsQmGWnLXIPe3TWNGSVyDrArSD7gx8jPerrQ8lCAKQVkZ0FRNPybsNKz?=
 =?us-ascii?Q?Xp5mQaYMUOWpKpdB9qMjS9wHS/b9Hq5PdG0mmGdEmmPugiYlZhNSnZs64D3d?=
 =?us-ascii?Q?av8n2Z5dY19+p0lzCFkUGZc/VrBQlTvj7B8b6F2kHjQMSv+F5J8AHBlE122T?=
 =?us-ascii?Q?IhT5fDp7V3rnher2WTYb6X9bhPAt5lZXO4FQ4e0nriZERDacS+BjH4qL12eQ?=
 =?us-ascii?Q?G6P5F3oyDF55p94l3zUq3kkUhnaTNORfw3a3TJFuqk22DtmU0FVR/Vb5Y+6d?=
 =?us-ascii?Q?/Pm8dZDXLKMlOl47mZgF6qRgq4EGI3S2+350i3PyikwZjR2Iyw5pE7W7geMP?=
 =?us-ascii?Q?Y1Kl2rlkoBtIEx1wRbaJzMNAkt1CP9xHMcCNAivb2VH+L46qG+2MjAl+uQ1t?=
 =?us-ascii?Q?5xzCQqh0er0mBZ8Ofw5wB5ufLHxoq6V6lKTTq4MIm5ObxIHThcs+vIzmb9za?=
 =?us-ascii?Q?YjfgWZLFznSmF2Ir3jr27kMKmilUqi8u6y0LvHKiQ8dkHyn39srNp0fPc4+8?=
 =?us-ascii?Q?ZRlYdovqpGv048wu6XD9VRgqhGyfKJNryWk+vpQisaGNCQE7+C927oRXHkv+?=
 =?us-ascii?Q?XFQ0mVg00ZCQ0KN34Y6dNv/p792ZvJfM9ZoakAwKQpAxA+O4vJX+XmnpvK0R?=
 =?us-ascii?Q?kICHMR6Btm+NYeDQdq13uNwwiRDLL6lFVHnF5KL7fYbFuudBHStg5xrsUwNA?=
 =?us-ascii?Q?rmHcPgOq8+hc5zGIGn3nVnLS/98h5NRruhwgG3r4vqzs9iiZ+VF8te32+zET?=
 =?us-ascii?Q?3pO6w5r3UQ8857YNh1LJCIaVFMeoPpAPQoUuPFVj6f7N+zoTYObnhhdaoduT?=
 =?us-ascii?Q?BPacQHG2VXAIPNEibgwsBPpv0QbKhhs1ngV0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wEdFREi8p7tIGe+DbgcGQw/Pt4QR3EXXDnDPA75326HNusyMb4M18MKXQ9cH?=
 =?us-ascii?Q?UlUhCFoU8+IivRFjFGmlwMIKmWVwx9RiZdCpf6wmzrNmVK9tNEvlnEBcpBol?=
 =?us-ascii?Q?uFCQMXtu5aPvVeSwPvakP7y+L5vk7Jkqba4AEiHgNjcXfjwP0+E6YIGqX7zi?=
 =?us-ascii?Q?wKRZ4obrgraTmnGKUJJ+wRZMgWCq5U0nDkOx+cNglX9vGMel960tNespGCMd?=
 =?us-ascii?Q?YvJYbPd+HRF9k6Wn3z4ShJN0fF3cxrudZNEPqT2uHTcEheVjAS+Fm9LwXs/V?=
 =?us-ascii?Q?ZCRPyTUIShyUQzwDJYqDdeurKm8tvBxV1dT8/shBgLNLBSlw2klKUJ4zShAK?=
 =?us-ascii?Q?bk57U9ac6oNzL4yhvJLokEd0nl9VVW6rSMoWVf+XZOQjxR5t3qb3KV2jQ4r3?=
 =?us-ascii?Q?5mqfi/sjAC5WdpwlRn9GK+O/nsb3LLvpZXIPIsYLTZYLs8MpU8qtOe5oNpRD?=
 =?us-ascii?Q?sFK9ADmGpLO+/gZPGoTeJcmbW04lqO/8W0bo7AEdObWWMN1nCIP59kte1bo/?=
 =?us-ascii?Q?B3FCd5UOnGGXylCiHSFBugE+PfilhZxCaXWq2Nm1Kv1gojNbW2Aa3Sdl1nPP?=
 =?us-ascii?Q?bNKQa9SoC9l09QqWX3o0ywcxyQ4b7VqBpB7BP28crASX4qq+ajPvgQ74mzuL?=
 =?us-ascii?Q?VSZ76mZ7T4Fd6kFbnAGkn2lESp1tVKevz0Kp1G1Tb2tnDZlGuaLuvhQ9mRrq?=
 =?us-ascii?Q?VQrnCGsnSpwlvkY/Q3/SusJjHlVgeTmsLxU4lJ3CAuGVmlWS23Sk0xk5AZvi?=
 =?us-ascii?Q?i8FfycHP9U0uD2jwCmi5uL04O6HW99sXhhluhmBwzBk0a+WIhVoVgDPSMFgm?=
 =?us-ascii?Q?9KdnI3U62765CK3hf2FW4Up+KIyZHgor9GvhvZvxaGg+EYiLZgSujDEyyMFX?=
 =?us-ascii?Q?HZKwPi6rzcctnGgKDiyvKL2UKQ7pTccDawzN8u6etqAb1fu1XlA1tEr11QcN?=
 =?us-ascii?Q?N9MBjGuuOVXgO1MXKbUd/gHvJ0K3W2GIROC5gIzeHyhQco5+Ez3rKEuQai6z?=
 =?us-ascii?Q?cv4nLJGt8QPGQ0cEVX4VQdQsPf13Af5LW3FA3JoiFEYyUjbuDFRPpo9tdrJp?=
 =?us-ascii?Q?mxOcVbZ4gSdarsofM8fgmfr1FR96X7AANuSzAdqHmBv+JHC6+WdW9SMfIJcb?=
 =?us-ascii?Q?nbKcG0OJGYYghiW3mscKo4dhOncH6hemyuCvMJgMBtL7EOhGKH9HxdYLtQWB?=
 =?us-ascii?Q?9KsT5cA1Edcg2NL6OQFGG5Wg+DiLCeUbN3cpDvMoIQm5y1Ij3xsgDXPh7RPv?=
 =?us-ascii?Q?9fPlUuyDwzQ0/TlhMil3DDz0s/TQOZaAmKsb3+pizLhaqhPONuvhlD04PJ/a?=
 =?us-ascii?Q?jKw8Dwz7+AId3GzHzD6Yn4TFh8OlGhA5Teu4TYTps2zR8aPCzM+3NCNOcx1u?=
 =?us-ascii?Q?orFqHJdzraKV+Se8VEl7W24phE+a4e1WE2BLpe9UxTRf2zyLWVNQ//qCl+mB?=
 =?us-ascii?Q?HX4gH6gn9qbqjwy+j2WKOqpAgtIe97+7kb/IYtKCDCzUGMqSusmsD0bOidEa?=
 =?us-ascii?Q?bK81VoBpNz0AHtYeQpgM2LCob84KTCJ+8LoVCPmvf7Ggk/FV3Tk+YV535rr3?=
 =?us-ascii?Q?B4j9UUqawC84CHs1zO8ykguwQJMEZL3eXAq9E1xCsfK1mAWnUyiFeW4FIivI?=
 =?us-ascii?Q?9qihhKGyhiSfO/Fl/u6yK2GGzkhIx8a1FBuPi7m5fhsnZUYmK7zgRFshCBYH?=
 =?us-ascii?Q?AQL5zqvWfpPAQ3+5jHEYaERQ2vp0eX43P0GbSwmSSa321yhz+Ro3ichQrrK2?=
 =?us-ascii?Q?qVUtYIGz5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62e9549-47a6-4a97-a86e-08de4efbd261
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 21:21:00.6289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvkJa+Ct+wnRY6TbjxBrrxn8PL44X32kSsr5iDv9DkNBXdPXcO39tDWaCr8n092u5jU+cC/8tgTEeBnWjK2sbTb6UvzQtBa6x8lF/FfaulY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9416
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

> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 08 January 2026 17:52
> Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
>=20
> Hi Biju,
>=20
> On Thu, 8 Jan 2026 16:44:37 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Hi Hugo Villeneuve,
> >
> > > -----Original Message-----
> > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > Sent: 08 January 2026 15:53
> > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > reboot
> > >
> > > Hi Claudiu,
> > >
> > > On Thu, 8 Jan 2026 11:12:54 +0200
> > > Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > > Hi, Hugo,
> > > >
> > > > On 1/7/26 23:48, Hugo Villeneuve wrote:
> > > > > Hi,
> > > > > when issuing a reboot command, I encounter the following kernel p=
anic:
> > > > >
> > > > > [   36.183478] SError Interrupt on CPU1, code 0x00000000be000011 =
-- SError
> > > > > [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted=
: G   M
> 6.19.0-
> > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > [   36.183504] Tainted: [M]=3DMACHINE_CHECK
> > > > > [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> > > > > [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -S=
SBS BTYPE=3D--)
> > > > > [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> > > > > [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> > > > > [   36.183547] sp : ffff8000813db860
> > > > > [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x27: f=
fff000009dd7450
> > > > > [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x24: f=
fff800080e1f7a8
> > > > > [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x21: f=
fff000009dd7430
> > > > > [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x18: 0=
0000000ffffffff
> > > > > [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x15: f=
fff8000813db220
> > > > > [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x12: 0=
0000000000009a2
> > > > > [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9 : f=
fff800081255bc0
> > > > > [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6 : 0=
000000000000000
> > > > > [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3 : 0=
000000000000028
> > > > > [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0 : f=
fff800081780000
> > > > > [   36.183652] Kernel panic - not syncing: Asynchronous SError In=
terrupt
> > > > > [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted=
: G   M
> 6.19.0-
> > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > [   36.183665] Tainted: [M]=3DMACHINE_CHECK
> > > > > [   36.183668] Hardware name: devboard1 (DT)
> > > > > [   36.183672] Call trace:
> > > > > [   36.183675]  show_stack+0x18/0x24 (C)
> > > > > [   36.183692]  dump_stack_lvl+0x34/0x8c
> > > > > [   36.183702]  dump_stack+0x18/0x24
> > > > > [   36.183708]  vpanic+0x314/0x35c
> > > > > [   36.183716]  nmi_panic+0x0/0x64
> > > > > [   36.183722]  add_taint+0x0/0xbc
> > > > > [   36.183728]  arm64_serror_panic+0x70/0x80
> > > > > [   36.183735]  do_serror+0x28/0x68
> > > > > [   36.183742]  el1h_64_error_handler+0x34/0x50
> > > > > [   36.183751]  el1h_64_error+0x6c/0x70
> > > > > [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> > > > > [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> > > > > [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> > > > > [   36.183792]  ili9881c_unprepare+0x38/0x88
> > > > > [   36.183802]  drm_panel_unprepare+0xbc/0x108
> > > > > [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> > > > > [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> > > > > [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x100
> > > > > [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2fc/0=
x5f8
> > > > > [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> > > > > [   36.183865]  commit_tail+0xa4/0x18c
> > > > > [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> > > > > [   36.183884]  drm_atomic_commit+0x8c/0xcc
> > > > > [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> > > > > [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> > > > > [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> > > > > [   36.183920]  platform_shutdown+0x24/0x34
> > > > > [   36.183931]  device_shutdown+0x128/0x284
> > > > > [   36.183938]  kernel_restart+0x44/0xa4
> > > > > [   36.183950]  __do_sys_reboot+0x178/0x270
> > > > > [   36.183959]  __arm64_sys_reboot+0x24/0x30
> > > > > [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> > > > > [   36.183979]  do_el0_svc+0x40/0xc0
> > > > > [   36.183988]  el0_svc+0x3c/0x164
> > > > > [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> > > > > [   36.184002]  el0t_64_sync+0x198/0x19c
> > > > > [   36.184020] Kernel Offset: disabled
> > > > > [   36.184022] CPU features: 0x200000,00020001,4000c501,0400720b
> > > > > [   36.184028] Memory Limit: none
> > > > > [   36.495305] ---[ end Kernel panic - not syncing: Asynchronous =
SError Interrupt ]---
> > > > >
> > > > > The problem is present since linux-6.18-rc1, but not in
> > > > > linux-6.17. I also confirm the bug is
> > > present in linux-6.19-rc4.
> > > > >
> > > > > The bug seems to be happening in rzg2l_mipi_dsi_host_transfer().
> > > > >
> > > > > After bisecting, here is the first bad commit:
> > > > >
> > > > >      commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP
> > > > > for
> > > > > RZ/G2L")
> > > > >
> > > > > Reverting this change makes the bug disappear.
> > > > >
> > > > > My limited understanding seems to indicate that the MIPI/DSI
> > > > > host may no longer be available/on when the panel tries to send
> > > > > MIPI/DSI commands in ili9881c_unprepare(), maybe because the MIPI=
/DSI clock has been
> stopped...
> > > > >
> > > > > The exact same board with two other panels (jd9365da and st7703) =
doesn't have the bug.
> > > >
> > > > Could you please provide the output of command:
> > > >
> > > > cat /sys/kernel/debug/mstop
> > > >
> > > > for both cases?
> > >
> > > Here it is for the panel which has the bug:
> > >
> > > ----------------------------------
> > >                            MSTOP
> > >                      clk   -------------------------
> > > clk_name             cnt   cnt   off   val    shared
> > > --------             ----- ----- ----- ------ ------
> > > gic                  1     1     0xb80 0x0
> > > ia55_clk             2     2     0xb70 0x0    ia55_pclk ia55_clk
> > > ia55_pclk            1     2     0xb70 0x0    ia55_pclk ia55_clk
> > > dmac_aclk            2     1     0xb80 0x0
> > > dmac_pclk            1     1     0xb80 0x0
> > > ostm0_pclk           0     0     0xb7c 0x10
> > > ostm1_pclk           1     1     0xb7c 0x0
> > > ostm2_pclk           1     1     0xb7c 0x0
> > > mtu_x_mck            0     0     0xb64 0x4
> > > gpt_pclk             1     1     0xb64 0x0
> > > poeg_a_clkp          0     0     0xb64 0x20
> > > poeg_b_clkp          0     0     0xb64 0x40
> > > poeg_c_clkp          0     0     0xb64 0x80
> > > poeg_d_clkp          0     0     0xb64 0x100
> > > wdt0_pclk            1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> > > wdt0_clk             1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> > > wdt1_pclk            0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> > > wdt1_clk             0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> > > spi_clk2             0     0     0xb64 0x2    spi_clk2 spi_clk
> > > spi_clk              0     0     0xb64 0x2    spi_clk2 spi_clk
> > > sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk=
2 sdhi0_clk_hs sdhi0_aclk
> > > sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk=
2 sdhi0_clk_hs sdhi0_aclk
> > > sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk=
2 sdhi0_clk_hs sdhi0_aclk
> > > sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk=
2 sdhi0_clk_hs sdhi0_aclk
> > > sdhi1_imclk          0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk=
2 sdhi1_clk_hs sdhi1_aclk
> > > sdhi1_imclk2         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk=
2 sdhi1_clk_hs sdhi1_aclk
> > > sdhi1_clk_hs         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk=
2 sdhi1_clk_hs sdhi1_aclk
> > > sdhi1_aclk           0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk=
2 sdhi1_clk_hs sdhi1_aclk
> > > gpu_clk              1     1     0xb80 0x0
> > > cru_sysclk           0     0     0xb78 0x8    cru_sysclk cru_vclk cru=
_pclk cru_aclk
> > > cru_vclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru=
_pclk cru_aclk
> > > cru_pclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru=
_pclk cru_aclk
> > > cru_aclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru=
_pclk cru_aclk
> > > dsi_pll_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk=
 dsi_aclk dsi_pclk dsi_vclk
> > > dsi_lpclk
> > > dsi_sys_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk=
 dsi_aclk dsi_pclk dsi_vclk
> > > dsi_lpclk
> > > dsi_aclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk=
 dsi_aclk dsi_pclk dsi_vclk
> > > dsi_lpclk
> > > dsi_pclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk=
 dsi_aclk dsi_pclk dsi_vclk
> > > dsi_lpclk
> > > dsi_vclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk=
 dsi_aclk dsi_pclk dsi_vclk
> > > dsi_lpclk
> > > dsi_lpclk            1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk=
 dsi_aclk dsi_pclk dsi_vclk
> > > dsi_lpclk
> > > lcdc_a               3     1     0xb78 0x0    lcdc_a lcdc_p
> > > lcdc_p               3     1     0xb78 0x0    lcdc_a lcdc_p
> > > lcdc_clk_d           3     1     0xb78 0x0
> > > ssi0_pclk            0     0     0xb64 0x400  ssi0_pclk ssi0_sfr
> > > ssi0_sfr             0     0     0xb64 0x400  ssi0_pclk ssi0_sfr
> > > ssi1_pclk            0     0     0xb64 0x800  ssi1_pclk ssi1_sfr
> > > ssi1_sfr             0     0     0xb64 0x800  ssi1_pclk ssi1_sfr
> > > ssi2_pclk            0     0     0xb64 0x1000 ssi2_pclk ssi2_sfr
> > > ssi2_sfr             0     0     0xb64 0x1000 ssi2_pclk ssi2_sfr
> > > ssi3_pclk            0     0     0xb64 0x2000 ssi3_pclk ssi3_sfr
> > > ssi3_sfr             0     0     0xb64 0x2000 ssi3_pclk ssi3_sfr
> > > usb0_host            3     1     0xb6c 0x0
> > > usb1_host            0     0     0xb6c 0x80
> > > usb0_func            1     1     0xb6c 0x0
> > > usb_pclk             5     1     0xb6c 0x0
> > > eth0_axi             0     0     0xb6c 0x4    eth0_axi eth0_chi
> > > eth0_chi             0     0     0xb6c 0x4    eth0_axi eth0_chi
> > > eth1_axi             0     0     0xb6c 0x8    eth1_axi eth1_chi
> > > eth1_chi             0     0     0xb6c 0x8    eth1_axi eth1_chi
> > > i2c0                 0     0     0xb68 0x400
> > > i2c1                 0     0     0xb68 0x800
> > > i2c2                 0     0     0xb68 0x1000
> > > i2c3                 0     0     0xb68 0x2000
> > > scif0                2     1     0xb68 0x0
> > > scif1                0     0     0xb68 0x4
> > > scif2                0     0     0xb68 0x8
> > > scif3                0     0     0xb68 0x10
> > > scif4                0     0     0xb68 0x20
> > > sci0                 0     0     0xb68 0x80
> > > sci1                 0     0     0xb68 0x100
> > > rspi0                0     0     0xb64 0x4000
> > > rspi1                0     0     0xb64 0x8000
> > > rspi2                0     0     0xb68 0x1
> > > canfd                0     0     0xb68 0x200
> > > gpio                 1     1     0xb70 0x0
> > > adc_adclk            0     0     0xb68 0x4000 adc_adclk adc_pclk
> > > adc_pclk             0     0     0xb68 0x4000 adc_adclk adc_pclk
> > > tsu_pclk             1     1     0xb68 0x0
> > > ----------------------------------
> > >
> > > I do not have acces to the other panels for the moment to run the sam=
e command.
> > >
> > >
> > > > Also, could you please check if the following diff solves your prob=
lem:
> > > >
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > index 5edd45424562..62957632a96f 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > @@ -1282,6 +1282,10 @@ static ssize_t
> > > > rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> > > >                  value |=3D SQCH0DSC0AR_FMT_SHORT;
> > > >          }
> > > >
> > > > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > >          rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
> > > >
> > > >          /*
> > > > @@ -1322,6 +1326,8 @@ static ssize_t
> > > > rzg2l_mipi_dsi_host_transfer(struct
> > > > mipi_dsi_host *host,
> > > >                          ret =3D packet.payload_length;
> > > >          }
> > > >
> > > > +       pm_runtime_put(dsi->dev);
> > > > +
> > > >          return ret;
> > > >   }
> > >
> > > I confirm that it fixes the bug, altought I assume this is just for t=
esting and is not the
> "proper"
> > > fix.
> >
> > Pre-MSTOP case during reboot, without clk it is accessing
> > registers)(mstop off always) it won't crash. But looks like you may hav=
e ignored timeout error from
> [1].
>=20
> In case of a timeout error, it is not really ignored as the proper error =
code -ETIMEDOUT will be
> returned by rzg2l_mipi_dsi_host_transfer() (see log below). The hardware =
manual doesn't seem to
> properly explain how to deal with a timeout (or I could not find it). Do =
you have any suggestion on
> how to improve this?
>=20
> >
> > Post MSTOP case, if you access registers with mstop on, it will lead to=
 crash.
> >
> > and the patch fixes crash.
> >
> > Basically, you are accessing link register after video is stopped with =
this panel.
> > Looks like it is a fix for me.
>=20
> Ok, like I said I am not an expert on this, but I was just assuming that =
there was a better way to
> ensure that the mipi/dsi interface was still active until the panel unpre=
pare() function could do its
> work. I was looking at some other drivers mipi/dsi
> host_transfer() functions and did not see a similar
> pm_runtime_resume_and_get() scheme, hence my confusion.
>=20
> > Better check if there is any timeout error[1] with this patch. if not,
> > It is proper fix.
>=20
> The patch does fixes the kernel panic, but doesn't allow the panel to be =
properly unprepared, as I
> just noticed the timeout message:
>=20
>     [   39.321153] ili9881c-dsi 10850000.dsi.0: sending DCS SET_DISPLAY_O=
FF failed: -110
>=20
> In my case, for a reboot, this is not a problem, but it may be a problem =
for systems where it can be
> suspended (I assume)?
>=20
> Thank you for your help with this.

Can you please try implement .atomic_post_disable() symmetrical to rzg2l_mi=
pi_dsi_atomic_pre_enable?

Ie, move just rzg2l_mipi_dsi_stop(dsi) from rzg2l_mipi_dsi_atomic_disable()=
 to rzg2l_mipi_dsi_atomic_post_disable()

and check  you can send DCS SET_DISPLAY_OFF successfully.

Cheers,
Biju






