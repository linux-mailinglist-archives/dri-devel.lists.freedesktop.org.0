Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7330D1910D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 14:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFDF10E4D9;
	Tue, 13 Jan 2026 13:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="adEt1I4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF6B10E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fipEbRMAGSwEp5pbGHlzHufcyKby6ErgH9U2pTv4ArzNtghcTYW3V44SE0tyhsEB0eoa7i94sm5ATTGdCZzgQJXJRsaUUh14KfvxY4YEmZNDKqjnc6aN6+0sycyS6WnhEsB86VINZlErH/rlDhr+Qz+z4gz+wq4aoGrnpxDKLKbQ2UgFR58xbAds73pmNTfxa11qIu3Tla5d5t5hJ8hJ69WuBlwbh+YgMApNQ/KFjBTP1ENTWhAoSRlaGhRzJkkaLLzP9rgTBwZ0g4iMVjb9Vn+ogLvI4mAte0LPxSkSWR2ZJpoiJJDcTizaLt8UqesSBX0CoBV2do3q5zwLfWSB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsXVQga6ItDd8OHCXoMnN2V2KdH/3jpKogJy62P2tIk=;
 b=gdqccfJ1mX+CWY8n+AFvodo5hdMkU+YovUQIFoQRm0QRKDCHTlWIogBehjSjg0jhg0APDCEQmKSUjatWuy/U6wib1I1bBTwa4yyA9nQrUZyUq9DJNtQ7nAe4H2LVBNkw69Cdr9RDYgkppszI0GFHOgMQnxiX7ac6qiejuAail83MIsWvCiKbLI3wFbO4sdkC/OIIoEI/a26wRi1ZR4we8obeFxVAOluhJKlDnezKAZGDHsgJpLmOyOFosQuMXLEArGrnlh6vq59YcQz8dtlnnCm1icxlb9dZ6XwX5cctYuFoZy0eQWP5UENshhmmKIy0OceBl4NxKq0uLeBFPPpQBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsXVQga6ItDd8OHCXoMnN2V2KdH/3jpKogJy62P2tIk=;
 b=adEt1I4o/Cu1L4HiDLCKcU561E0XXvaziNpDUKfXAqqeNL/vj1PPwn955xcFTS7pRIy4l4QNL8qMaANqLioz4juuGNUoi2fAiHuT06kJN3a7EaugZPyS0TllfsV8HEWrg/MR3Jn2/FOvYpy0eL/Y0owa/1j5OF0rKPgMzyFmKO4=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB10741.jpnprd01.prod.outlook.com (2603:1096:400:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 13:15:48 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 13:15:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when
 rebooting for some panels
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when
 rebooting for some panels
Thread-Index: AQHcg9pRFBCIPGLnxU6ZGk2qBR3uvbVQFOag
Date: Tue, 13 Jan 2026 13:15:47 +0000
Message-ID: <TYCPR01MB11332EA012210659410F95E18868EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260112154333.655352-1-hugo@hugovil.com>
In-Reply-To: <20260112154333.655352-1-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB10741:EE_
x-ms-office365-filtering-correlation-id: 0f87c084-ca8d-4874-b23e-08de52a5ddf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sUz8LCkXVgmfiKaARloxJa3XmBdxsZl8pLS6Mi0NOIvl+5JnuEhSTXkvbOfD?=
 =?us-ascii?Q?tHUj/XrCJ/DF7WziJ0j3fDqvc6zPMSnMR01AkNISnvuwrycj5gjiWjHNE/tU?=
 =?us-ascii?Q?RHOf1uXFjaizSk4JE1swyQFPIXVSvrUGanWoYGq0I4fjVzPA0Njrv5jX2jkQ?=
 =?us-ascii?Q?jAXkHfTrY2OatOxH91yeTd2c0bHirKRPuyRnxcqZK87r6ll7iEOrBnV9VDaj?=
 =?us-ascii?Q?UR5Y8LEFpIU/5RQDX/KaLsEM8bnPAAoWb34I8lrqK4gDFDw4iLzAxT48FjVO?=
 =?us-ascii?Q?kZ1DYu17TvdARApjZYVNEbBDdy+HyTgfqPqqTt+qmzMTwLjwRTiT/rNmGa8D?=
 =?us-ascii?Q?YpJz2bMsb33HHjdAlhBYyJ9ECsNTSQlKb5dSUINnE+HugXd+lwBaYQon8IXY?=
 =?us-ascii?Q?oH0ZZawl6/jzBJlH4w9sNfRazsJUNTogmBHzAqvPby4Wsv2arCOQxxIy+nh3?=
 =?us-ascii?Q?4lQ8IFtRBWLd2r9mpy0jNzSWeI+ghv0eHSON4ooeq6DTRxd+p3IvxfCsFHnr?=
 =?us-ascii?Q?b9hOI8yflqM+94sgaHwzEZNnGt2+g1mBOGgwjj4zErYkw4zXKfH/w/o5nJ0m?=
 =?us-ascii?Q?KqQLeZbqahI8rgHZ0sBU/BwGoKt3I6pNinNMUEQwXInArfql53fTSZDvbWtK?=
 =?us-ascii?Q?dPEQyQh0Pgk11PVb8nYbxtZdNFoVHMK2WPqMWH3b8+3obVGCLezDy7S11LnA?=
 =?us-ascii?Q?JYHi+3F+xtFCQAZVTuVVBHTURUmZ1R/VTJu57XnCiBP8JhmOLvbyHIq0u+m7?=
 =?us-ascii?Q?58b/QKgvpqVFr4hGjq0Vk6k/kpWvykPzeFoPbSjPy8kK3Fk1naU/dOmSBdFI?=
 =?us-ascii?Q?A32cghkvqIU39aVQfU/yIJrjckbrouNtXLKk4dlb4av8rZrQtuB9QBp0epT3?=
 =?us-ascii?Q?GGLt2eo3gSehJ9Sk0hCi94/5y2APYPip/ecFJ3jEhlAXubaX/vNDE220C76I?=
 =?us-ascii?Q?qt6eV7wU0LYHe5075HYE3CFssARuP1eQw7OYD1NcUuTbblvOqPg9j0nKLyRI?=
 =?us-ascii?Q?9TPhTo8est3Lk16tMj7z3kaLpou9FmETFtppL3OFWAW3lLCHUvHTKdLllPnQ?=
 =?us-ascii?Q?gfa9dD6wxfzmB0zhb64p0MT1eSR61wBoGiaPBjMbfEuFzuHchB940suzKWr/?=
 =?us-ascii?Q?N1xaLNEG2QHxqy6jmqFlfNoxQNg8nlSPdPIwwBMtDTdLGmhgIW4VJweZI+7F?=
 =?us-ascii?Q?lL/43T9uJUJJwHFJ175OGodBipQx2iY4Xzl4rk0sBHUl0DldTLc/9yYr9MMd?=
 =?us-ascii?Q?Q5lh74u2+bltXOCL+WcreQs8aWHeGajnT91xybTdumNfxEb/hbHM6LYOEgb1?=
 =?us-ascii?Q?yQJnSXtIBGIEGUfT1Ptj1zE07MIowSHmoadtn2mjZMvVaLFY44tXZgJMu2WW?=
 =?us-ascii?Q?cMJ3a+HgNW2HLG00xwdybJ/1aNC8fGhHYCMnFRMAMz7JxdDf3HFiO24uzss7?=
 =?us-ascii?Q?8dt8Jf+gkrqQComRov89uhL0ghzzJrL/0nJJ4YU+fzye56++IbFG1KYfC7/v?=
 =?us-ascii?Q?pQwaRwZtbO0UlPw7DC9e1wd27OcdBHs7rw5c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0RVmR3avTes9LAeIBbdYYfqtf0WmkrX8haEGR04H12dQFVBh+0S19isSa718?=
 =?us-ascii?Q?6biyPIrmRw/j4jFA60PV0jpiZwW0aYscuL4DSzSNtd44KdOAl3ljyZKvJTql?=
 =?us-ascii?Q?8ama946mejh+xn9eYFwiW+L8Ctq9g1LGZE4JfyP7eVEYTx5zu6WGWzAPWRqt?=
 =?us-ascii?Q?dJeImfuZodVIfJ4zdi2H++VR66jpWaCHDpxkNmtzjmdqjUWR+nQfLenQSL/p?=
 =?us-ascii?Q?8CnqT12HvfCiY5g7YrDVRuT/Z9HepCUCs9ICtb+2bRdl7xt7gtKl2pCNzT5k?=
 =?us-ascii?Q?YiM3AVFYfpthvuD5WRoJa+mgYoLfIy3tZfcjUESHTUWXhgH6s8aIjmvaplrV?=
 =?us-ascii?Q?fidaAu0+MFAvdmdrZY0/WSVe7fTV3yQOrYoivlemVnIz/dFVY6RnAwEVm5b5?=
 =?us-ascii?Q?hIOaObRtTkQXgHuwnstiXSPS9UwgwgQ0y2sLwTA/x5jniIbgaiaZT1jutsZA?=
 =?us-ascii?Q?b6UXJbT8kKxZP25slRkJHCvflivxBfmBEI0ChSjWwdj86huVYU5pvKpvXmM1?=
 =?us-ascii?Q?SCrtgO9LB88kK9iSQdteOMkI8bnsWAe38n+usB4PFKixnlinOsLG3gSE4jYX?=
 =?us-ascii?Q?3brr9Q5cl43K8rHV0FAqtYXCXPORXd5kGNiY1+X4KCjOmqfIENFMIS1W+WO7?=
 =?us-ascii?Q?0UclAyqr9GI0BVdWJ5sYtmKa5oiIMk+3mfWJ66igJg3IaePpKGWoEkuogNIi?=
 =?us-ascii?Q?HLdC7jlFeMqiTNEyQTlZO67Cf13MXI+FOeE3TzCsuORwkgUPJujLQ1T9nDmn?=
 =?us-ascii?Q?LQa3rajiNbPTRH4gLiLtUU76pcWL9fmrbzsi7+5pqMiM6PJlrCAaFXSX0FjJ?=
 =?us-ascii?Q?Ep79s+41+sJ+wmI/eXuUDuUhby3pH1ezsJ/xEEDho2u4GFJaCkuIqW987q7l?=
 =?us-ascii?Q?E0fmSOzSY6Zmuc1RYswPYxd/9BLObkp4HF/t7ZI8eF7xcmafpR4QH9ER6lt9?=
 =?us-ascii?Q?zOP8tPyWGfkJJ8kom/jOp48/IHQkQw9kn5CUu2hVhNPCgozLNHdyzAetzF0k?=
 =?us-ascii?Q?lBEFc6W2Em7XivOwKxZNQAtSMfNxQtMBxkozEegWHDcjgH4NUIRlxFZYvSah?=
 =?us-ascii?Q?gWmlNDn4FQ3puNfiVSV1darkj8wE4+yqYMhQazqqsBFhspkSqdO04BZbx3c4?=
 =?us-ascii?Q?uY/iXdWxRQ6/LfztX/fNh8NC+dKSkQw+ErAodtvWXQW3JDTQJ6i5XlylR96r?=
 =?us-ascii?Q?KOovSMaPYSLT1GR7mtvVkNrVFdfHAj7kyQ3dhWhSDV56kPIGbZrrMzo+ooq7?=
 =?us-ascii?Q?0Tj6IIFtHo3X38LZIZ6SvmVDoBt42NgfAhaISvFY617uTxD0iT0Exxm5pWa5?=
 =?us-ascii?Q?IdJSGj3LMjwDrAx2qjNjCkfKlWcAGG83j4KreT1S2K8ZsdGyo84h7omUfZpq?=
 =?us-ascii?Q?FhdMU2+8Q2AOF96wsGOOQitQvYhnnuUWrabWx9XzC24SiFMVwFa2bGTtI8MP?=
 =?us-ascii?Q?Y37cutLWFbu5DIq5c/By+U6XSlW/3GmTDnh9R6/J2iBLahT2dtMdCvqu4+UQ?=
 =?us-ascii?Q?na5A8Qgw8NTJcAc4I8p5T/eDgVCJkNXGhZte94CvjykHcSumYf4RvygZ3W8K?=
 =?us-ascii?Q?ns/IY2wKGAGfdylaeAI0vQ4rPhiNY4mJGyQ9zGofsJjk/IPLLpwhW3LLK3j1?=
 =?us-ascii?Q?KrWgALryzPqjJMJ0OR9sLMBMXg0ZsMklVF+IgIX4xksaLfR1M7AfTMgTBXN8?=
 =?us-ascii?Q?GaBRphMfyEiKtHsjShhhb8tJ9NBgn7Ua28B/cbOmTcJgqfgnl9CyOedtgdjO?=
 =?us-ascii?Q?KnU6vPdpzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f87c084-ca8d-4874-b23e-08de52a5ddf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 13:15:47.9682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Ez5Ys2HFkAvySU5UzN41DcISlSUXVGVTNha7UMazvl+e0ZUwz2sAbBfdzP/IdXGxyVtLuklQU8Hl/omZnbCbwp2+jvkhGaEaD+4hvbC8iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10741
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

Thanks for the patch

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hu=
go Villeneuve
> Sent: 12 January 2026 15:43
> Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when reb=
ooting for some panels
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Since commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L=
") we may get the following
> kernel panic, for some panels, when rebooting:
>=20
>   systemd-shutdown[1]: Rebooting.
>   Call trace:
>    ...
>    do_serror+0x28/0x68
>    el1h_64_error_handler+0x34/0x50
>    el1h_64_error+0x6c/0x70
>    rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
>    mipi_dsi_device_transfer+0x44/0x58
>    mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
>    ili9881c_unprepare+0x38/0x88
>    drm_panel_unprepare+0xbc/0x108
>=20
> This happens for panels that need to send MIPI-DSI commands in their
> unprepare() callback. Since the MIPI-DSI interface is stopped at that poi=
nt,
> rzg2l_mipi_dsi_host_transfer() triggers the kernel panic.
>=20
> Fix by moving rzg2l_mipi_dsi_stop() to new callback function rzg2l_mipi_d=
si_atomic_post_disable().
>=20
> With this change we now have the correct power-down/stop sequence:
>=20
>   systemd-shutdown[1]: Rebooting.
>   rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_disable(): entry
>   ili9881c-dsi 10850000.dsi.0: ili9881c_unprepare(): entry
>   rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_post_disable(): entr=
y
>   reboot: Restarting system
>=20
> Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Tested on the below boards:
	RZ/G3E SMARC EVK connected ADV7535 bridge (Tested low power modes as well =
s2idle, deep sleep)
	RZ/V2L SMARC EVK connected ADV7535 bridge

Cheers,
Biju

> ---
> Tested on a custom RZ/G2L board with three different panels/drivers:
>    ili9881c -> sending DSI commands in unprepare()
>    jd9365da -> not sending DSI commands in unprepare()
>    st7703   -> not sending DSI commands in unprepare()
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e0..b164e3a62cc2f 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -646,6 +646,13 @@ static void rzg2l_mipi_dsi_atomic_disable(struct drm=
_bridge *bridge,
>=20
>  	rzg2l_mipi_dsi_stop_video(dsi);
>  	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge=
,
> +					       struct drm_atomic_state *state) {
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +
>  	rzg2l_mipi_dsi_stop(dsi);
>  }
>=20
> @@ -681,6 +688,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_b=
ridge_ops =3D {
>  	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
> +	.atomic_post_disable =3D rzg2l_mipi_dsi_atomic_post_disable,
>  	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,  };
>=20
>=20
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> --
> 2.47.3

