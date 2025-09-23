Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43082B9477A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AEE10E563;
	Tue, 23 Sep 2025 05:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mtq/3kzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55B210E563
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9zVgRYFvdFnxom4oxLGhtrz5PuUMqMIW2Jy9nAM6qbjSmLMyZB2XRCaBkeMW4hQYEkBhZfH/NTajHhupvgEuGexbk1V8XP1UK1xt0RTbyLuBvLr3BMBwsJccW7Dpz6DmJwAlA7gitZp6bKzEa51R418odEVENsSWgex96Vfq8V+iPJbAj7moa5ZjdM76NxyFoYENYpZ9my+Fuxu0Fpo9GiPq70baTtNH31U39RMKx6nlsW6HEc/oHnB4l+K3ZA3QZYKzRrWOxpIvpVs+otvOnBWlqHyfp5R3CNxw/g4DEJSrQViY6+ZT6n+lYCIwZAjNvaT5l9LfSculLQ6JXUv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE2U8VFkwteOdmZxlNn7cyB+SsQ8bC8Gc4RyOUv1D/M=;
 b=eJaOgur+zc4Qo3OmN8Geu8Pxkq5EmhE0I1TVH1fsEd7DuCeQitB6XRLhLATPvfU1BHPpsqnmtjq7ycwQNy3O9UXDJB6Sk9oQUO9DLBRPJJ1a+yilhn/Z/V7dtxH7CX1kpbHFUvYYLQ3UDrhmHyLWVKhtJHx6BZ+9ti6z6gWzSy8uKdh71pGvEk4W/2Yvs6ubSR0Du2i4YkfOEzHqxCBL/5H8QmJdGI/i/VLYtOrxppe4c1tecIYHXehONKwNf6Lp98XzucFHQJ56e9HeaHDhanrm3fA5uKaqBe0rDHMNipShGvPs8VihyYLLHnJbu4lbxrSXAnaeNOjJdoPg4UdkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE2U8VFkwteOdmZxlNn7cyB+SsQ8bC8Gc4RyOUv1D/M=;
 b=mtq/3kzQVouSc2lhTvUOFPw4i5zH1Owy5VUnOIQ/LCFXWCbvOW2svdqE0o/UKlcelLqD8e9QGiZXW3YOZpcOD+KWwIObZiprnSMyGvLkfo9P0dJf5fDtc3/pvzCasVHcOzRvpEVKl7bS/SXQ+7BwsE+PdeeNWpMp81urW7VPAmo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB16208.jpnprd01.prod.outlook.com (2603:1096:604:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 05:45:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 05:45:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, magnus.damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Thread-Topic: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Thread-Index: AQHcK/LmTCgzaExxe06X7PfbHDM01rSgQXgg
Date: Tue, 23 Sep 2025 05:45:30 +0000
Message-ID: <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB16208:EE_
x-ms-office365-filtering-correlation-id: dc510d4f-77e0-43b8-6009-08ddfa64680c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6UjN1qV6CJ35bhKLtFKGkdB/7MTJp0PH/NSHFo3NsZNdSgjy2JfXuJT45AEQ?=
 =?us-ascii?Q?qvvs6uqHa4VMHUSrrOc8yJQVlKlKDFnoo3Zsas8ZdwBE3dLcJa+KYmslfq5h?=
 =?us-ascii?Q?LNS1n5l9jOW6DZBM3W5vDIMLrx5wGTRkNa8qZGmKXadWpE+oExSkli9hJCqC?=
 =?us-ascii?Q?CyQvdvNWrxcrUkoSaLMpY+dl7PmiMb0gBg2vaBruUe2nJOD6hIPORh7+5r7c?=
 =?us-ascii?Q?S745srvmMb94UguVmXD3d5kfrzF3QJAqZvJqJQ1PYTy+HOe9o7yHDyCxN3tG?=
 =?us-ascii?Q?nWD12AtAfLcYHNOBsZ2xeapVt0UUUYo1uENap1YFEu1bxaldtk1H6UDfeHov?=
 =?us-ascii?Q?TRarEZtlmARTz8Rqf97tW6UenLAENuWclbfL+Wxg7vb4L3uQSbpw//R3xjQN?=
 =?us-ascii?Q?c1KQ3oksGiSEb6yiPMC3qet4kQraOX71FuxxFJ0U6mtqqoNe5YWa1PXTTXHw?=
 =?us-ascii?Q?FoNnzh8gg10x8yS4EY4RiIubYqpseBbec5LHe+0R7dEF4LgDR8w8k/355YYV?=
 =?us-ascii?Q?/VIuURV2bty002vWB49YPoWXoHkv8vBBOoORLzHGG5H8r9WBoytReq+p0pd6?=
 =?us-ascii?Q?gwmeCiDz0MRM8XzHZKlMKKP1aQz9zSsSGAB82gxnmtAW5IpI8Zqino8h4XEP?=
 =?us-ascii?Q?pR+sAAxHK6lz5ZCRDZMUPnXEtNAp1ju+fVnQBhMxJOIuqN3KqcDl1bBIWDez?=
 =?us-ascii?Q?z+HXPuN9M0uXVEhCz3XsG36+5msIfXJLdvUWqcY8awSjk0hG/PC5lbrIDhDP?=
 =?us-ascii?Q?VaHtCHkh/xmPUgpI8hLFsAUI+ix6VGMgonQUC521FgqK9VGj1P9OhXCjr5Op?=
 =?us-ascii?Q?NB185gK6A9BQiCOcuT4GTilcm9a4W0uHD+odjjZzTjrJprgggSQQMRwjkscM?=
 =?us-ascii?Q?nhz34veRAQsbazGTY61jf9htbTt0Cjap3NY7bucP58KO5+mdNcPolsTBpzcc?=
 =?us-ascii?Q?lERMRH6EnCYAjp0bb7aezGVatoKy6bXaYes7CxIHu08/wdOuHrgoOU3eArDr?=
 =?us-ascii?Q?65KkWKNlOUptyoeFy9KT9plkf1g0UXkfWRMEF7oBL7Hoa3BwGUH7loOu5gOA?=
 =?us-ascii?Q?PsnhixEPGqtleHLWuGjssQsORH5O2y08j619sNyimPnsV+p2PYmxaww/3xMr?=
 =?us-ascii?Q?Ty3gYXXUb0ozUGW+S/sSr02i9JW5S9N6c/YHpxi7afBAGcniYv4Yc81P9dWa?=
 =?us-ascii?Q?hgTQReU+HaiMGp9MbQmuJODDqT/YcPX5AuDfo8EWwXbDvvV3GUpOtbGqn0Xw?=
 =?us-ascii?Q?m90MfA6Z+80Z0VWgvmCRW1AnIKd37H9m1SB5QoVLwQRKiBg7RcZX8hyQEIJ4?=
 =?us-ascii?Q?wHHFiPrVPz85cEttOZvUT8Yc4gSnrtvTaWfyrUjHJyovvgj/IR7xYe7+U3m9?=
 =?us-ascii?Q?SmJN5j/9C69fPxQBq64gCRYsD3oaxCc+osrrKlOvxmrzvYK7RLXfkxUoV5e0?=
 =?us-ascii?Q?V3MEIw5KoedV+QmAOl7AIs3lpcVqgvTy0BZtpqprAmYkJHpWCIZohA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gbceXEF4TBsINAVLOsQ+la7vk6GG71cTTl1NCTNPyMWe0QEn9xXAiKhFI5Ac?=
 =?us-ascii?Q?WP/56igwE4uvAlcEcZ1WUqeu42glgW5BQX05qDXAD27aNDh+v645JpDupoFq?=
 =?us-ascii?Q?dywEBvhwGl3EZaAsMF2iDeQ5t1fwa4kXA/HEf2uFyArUp2/rwdpwj/LVhVRm?=
 =?us-ascii?Q?fwv5DyCs0EjTiG/mWcf6EieIP//OI8dtd71zdaNwD7J/gZ5s2qqTZOKK3Tcf?=
 =?us-ascii?Q?M58TG9TrtLCcqnJmMeFV4LNkEA5Oi7aKBIz9zuWawO6l6QGrKPxW83vLkAl8?=
 =?us-ascii?Q?iB7DlDkPqhFaS+MSouNy8zd4jis/TDjGU0yR/1qmYeA+CHWgelXjy3tzfN4n?=
 =?us-ascii?Q?8Q9N3d1PQE9opLX2k9HYbjzqoXnRM9cIdlAn5C1i7BIa6kMtiCnrhP+nXJFq?=
 =?us-ascii?Q?XpP22Eb9y90Ku4CFGX1KUukJ9xjf59q3lAmjI7/kZ5ibprtm11EaFpBhmBY+?=
 =?us-ascii?Q?93AevOYlkJGRZXnlMfO+Y8/dmEexFre6VlNAgoCnjzv+WyZr6NBQbjQkaCdI?=
 =?us-ascii?Q?x0I0P7x1n2bGuxMsU+iFwubR1IHPrw7spFaXOykIXilrr4wCiDsc9NxEa7WC?=
 =?us-ascii?Q?/vsL7gBcNfSCVV+as3gtmVH+erjgEr0P7zk+ETZU23f/lwaJSqWPURtnO1z5?=
 =?us-ascii?Q?bXtVLS81ocn2R6fM6N89IIgp7OmjqG4c93eHLbXAOkeNtVs4vOqMJYTnsvf8?=
 =?us-ascii?Q?Qe5yeDzFpPsuHIiPybYagtzeMa7S3cUuqt4m8j2IKTf8GM+ww2UcycYsyXpe?=
 =?us-ascii?Q?HbiDX5zwYi8lTpoXKlUnoffLoLzz3jJfOhAksTylmOerCsEGhdWYd6VNp6of?=
 =?us-ascii?Q?cKUuibNLjiRurvdbVIuPRcamv1tirmrKrrrZe5G1Bz7f2EuiDSpd0018ghsj?=
 =?us-ascii?Q?ulPlyNOBS0yhd5xHhBvsRCov7tIJdedlm9YQ4dbcD1FRWgn5Ern6Hy5AkDHO?=
 =?us-ascii?Q?M+Ts3/gl5iwoSzoyqlAEwwhyi+2xE0Xdh0i3wpBpoJZp0c3HsWtrdq22BiHB?=
 =?us-ascii?Q?EnLmluC+9IlreRXGs9e/iEXKLCqzQieGjQdMeLdSbUJr4/7RXYI1GR3dTPQN?=
 =?us-ascii?Q?XceHTjse2IiKq+WcRSsUOy7si1Da6jdhNMItQoZRdy7imN7ShjsmNI0ed+eb?=
 =?us-ascii?Q?uH4LPNjshfV3scxMMDdN+BTOMIOx6hZKFd20epuWEnlFn40Md7m4M9fI1gbu?=
 =?us-ascii?Q?fNupcCqPPuMNgMoD9ny5ozFNv1iRNX4K6qdP/YTmsqS2nvMdO93vXKLLfCdO?=
 =?us-ascii?Q?anz1v4965TYoKL4OCh+oUBgjxKv5yVl6ANwFHBNpMTr779g0IaXIpHE4tSkr?=
 =?us-ascii?Q?8jGJnxUsO/dDXouYpEAIhuqDynEco0KShMbuY7FBezK+WWTEVek0jyHQlyMa?=
 =?us-ascii?Q?Pkyquuy7MlWiA9kosoLZty0gMad2wMDK+o5f/I+2QoZ38pCFKpdDGEc3Yghz?=
 =?us-ascii?Q?gI5zntIDIbMueX3ApAmVr59eTzxSN71gIU4AYcwRk13tw4aPZNeo0mSgCBJJ?=
 =?us-ascii?Q?WARewStOO2ih3dBeBtjCPYCAPQJSaW3zIHGKLOLGiTEbZgyQxB1pcTqTq8WP?=
 =?us-ascii?Q?S15ewTt5W4QbDK1Mbmg/SHDBwd9JaHGRfRX67xCy/fnroLxuVYY6qWyQ/zAQ?=
 =?us-ascii?Q?JA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc510d4f-77e0-43b8-6009-08ddfa64680c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 05:45:30.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZAzgDI2n2UPW4cQ6P+XgZnb+Z4nnDNfOz2uOkxibbN0XHr8ItJzrxl9gE96czjOazsa1StZXwihnNFjBRlARqd+Gma7mcKzyfvImtfkA5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16208
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

Hi Marek,

> -----Original Message-----
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Sent: 22 September 2025 19:55
> Subject: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>=20
> Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from values t=
o make this bitfield usable
> with FIELD_PREP(). There are no users of this bitfield, hence no updates =
to the DSI driver.
>=20
> Do not convert bits and bitfields to BIT() and GENMASK() yet, to be consi=
sten with the current style.
> Conversion to BIT() and GENMASK() macros is done at the very end of this =
series in the last two
> patches.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: No functional change expected, this is a preparatory patch which pa=
rtly removes macros which
> evaluate to zeroes from rcar_mipi_dsi_regs.h .
> The other patches in this series proceed with that job, piece by piece, t=
o make it all reviewable.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drive=
rs/gpu/drm/renesas/rcar-
> du/rcar_mipi_dsi_regs.h
> index c2cb06ef144ed..808861aaf3bfe 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -268,9 +268,10 @@
>  #define CLOCKSET1			0x101c
>  #define CLOCKSET1_LOCK_PHY		(1 << 17)
>  #define CLOCKSET1_CLKSEL		(1 << 8)
> -#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)

0
> -#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
4
> -#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
8
> +#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
> +#define CLOCKSET1_CLKINSEL_EXTAL	0
> +#define CLOCKSET1_CLKINSEL_DIG		1
> +#define CLOCKSET1_CLKINSEL_DU		2


Looks like this patch breaks existing functionality,
as the macro values are different.=20

Cheers,
Biju
