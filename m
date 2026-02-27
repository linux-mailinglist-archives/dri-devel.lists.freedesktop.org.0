Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EX8JQB3oWnHtQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:50:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B6A1B630B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5121210EB03;
	Fri, 27 Feb 2026 10:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F3+iRXDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3F510EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6xsDJ4qUq3J5U66r5kTlPBAia63E68P5v4Q6BhSMWO4tS6LoRE28QFdZ428hDVUQgXAzsriNnTmZEZM4H5jZcfEAdN2VyntpdvRyFgYvoGvT8rGJG/xnJ/kPtvI62NUACM+2oLpHKZiwAt+NEk4Jhls9fot3JBkspJh+B/tIq8PMdidSf/Pw+VGSaNWpUQPYdRpSX0hqaLgRLwB5nQ/UtV1XD+LiFbNuf4FZmjJxHcpPHbHiVBQ9en1i9O377HXDzxIsNAqlz17SKemScjQuWo/LSF/k12loH/ghB7Sou5oJ38XZUgrCVBhHHtcgw83vBF1Tf3G5Tgz1tMJjZtcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEoVVx3E+50uv+9H4akH/6N4BWz9/Ee/wV5N3OEWuEM=;
 b=a78Zu0f33RDAjDblNVwT/gKLCivxQmovJ1hhq7Js6zsaE8KcvkSEpaiUb7x4PO4wtPferue+nYANFakE+gaJvWC7vL0Sr4qrVGJQq1K75iBDEgmvtXPPAjMlF89TaNODeyrOomUKj69hxrQnAT1v565r4kC+5SXHrnDcl4nFXCxfjBVgX9jUAlJLeFU1l6kMu198piv2S2zKbDft9/Dge3IYcDyW+3v0CLMYmmdvNwAEKUYgFtQJDdhgI52WLxbGnMEFYmvMqiVe1hmkc2C1ODsAYtZsmaUHmmmuYmUzDX1caEO1mBZGG2I2yc+nCViNLgjbIlUQW5qESqSGhY7v8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEoVVx3E+50uv+9H4akH/6N4BWz9/Ee/wV5N3OEWuEM=;
 b=F3+iRXDatv7Tjd48fjAN3oaDFbI5rzIrqbx4w0xS0DIKYuEosEBXJwMBgrAecWtLOuxECcnFwS5AuKytLe3JUHckseEvtjBAY50UujvZS1UcoPZGc6U3mGjv46BZfhVKaqABRuxHT7Uju0Tsn+TrFosAWpVpq6viRNDtbt/d7RI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10384.jpnprd01.prod.outlook.com (2603:1096:400:250::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 10:50:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 10:50:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Chris
 Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Thread-Topic: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Thread-Index: AQHcp4u/eZzblQs3SEG9Nd1aSbBwPLWWWTZQ
Date: Fri, 27 Feb 2026 10:50:30 +0000
Message-ID: <TY3PR01MB11346FB8BDCBBD83203F776FC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227015216.2721504-1-chris.brandt@renesas.com>
In-Reply-To: <20260227015216.2721504-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10384:EE_
x-ms-office365-filtering-correlation-id: d2e1bee6-afe2-4fe7-a071-08de75ee0690
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: HzROCt4lD/TJdI8w2Pd7odQ3qAii19dnVJX/oZv8JxfKWIcQ8tWIPUljFi1aUU0pno2wXDp5OyMiOZ0JuTAaKpUznj0jT46DNrCilXObtXeHw024T4qDtpOGGPPuf73JhRGlsqFVkvabV+jLQ7uAFahHGvfIfOTqrAfUz8oAHd7mgzNbGc92JkesWUoY7ulV5ZfwXePGm0pNa6EFqRPjUNI8sgPt20cqWJ5EMbc3Kek9U0NwlypUrqTd0mVUtbF6O7dJ8Su7M6knIRxT6hI2GHjGm6ydL4iwIx4/Bdm1knfDatG4rMz/OHh9retswRC4yMpOe3yCHLmXT1wk5mHd+mXWVUllRJuft/CMGi86Tp23/nfy3rk5R+LTSn9NwlHv/hXOvNtCotURxxKk8nOEu7nyHts/nLteHj5Meta9BCz8ht4OKW23RC1jRCNWBN9BE6ksHtr9k6rSaJyvdYynnn9MpZBLFhyz/RUVJj5WwvM/1CaWE18QXjqcoSdbK4SKWJ7+VOPr4MY2u0XZDc6xcYxSGbTqbvCleO9I0N4nHqrVwzNOeJFeGRilooWvwWGGaLNAIWbacLzu5bTLIGvwkAPJj/NKqdFkqsC+T+WIkfQBGoj19R/5jmXTaGgFXX8MXS9d/JZZApluQz40wmKrUnhDG+xi8MLjEfQJAXZs/ZNvhzFlpuKvHuls+UkZrmmYlkL7QDXERaaryJ1ygIJe7l9WjgZNYzf0lFQSw0eExlOKcLR5VZ4MRS2aZhVYvGWUrbXYoVV+43zmzyRrGOrkMOb8apJ3uoRmXd34JsRwglM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ELjqjZZVvtJQB10bjoMPCPmo9zBQnZA/VNY2oOLNDKutbgF5+K/NiLyjroM0?=
 =?us-ascii?Q?LBCFv5BZulbmWrNmB7gKORbDiQJ2m2HlulczlsMDyJBRCLHYboWhkmRCxIBe?=
 =?us-ascii?Q?dFYBnSGNkiaeXRE/kPfcb0/PKMXrmBm2pZlC7OgOUqKSHtVoTRJO5myGKsyn?=
 =?us-ascii?Q?LppoptvRVJGfxhG9Q9xq2K701trI4DrElBdBxaAj7U4kXMI2TMyfXP0xLUz5?=
 =?us-ascii?Q?npHNBIHXb4PayWnu+Ean0qg8qcyNw+DCOpC8lX9WZ0RXC4dX+0SulHt2xjKl?=
 =?us-ascii?Q?OWX0/m8NUtB7UFPOAVnbkCIQvkp+ixTftDbf5gRI+q5LGCMgsAYdWRcPT4CB?=
 =?us-ascii?Q?8X8hGES7Jc+CyhpmIBMItZ+s0TOKpWzW+yxUYsWou8yGYzf7uD7AoQ6doME/?=
 =?us-ascii?Q?pSoP4WRkYJz9/s3ntSKjo2x3/xz4nhHsm7kNSvAK3LaN7e+gMUrhgT9HQbrn?=
 =?us-ascii?Q?UUVZjNdsFMRRcxPV4MY5jnhjpNAoLdesCVfiYb+fspWWZxaPQrtyFIZvdZ1j?=
 =?us-ascii?Q?Obbg6A0ylTQZ/20K8gUyW6A6q1qi9e90p3CCtBqL8fWN053YIhtK9sCfsbb9?=
 =?us-ascii?Q?oV7o8juMPTy/YCZ+jAMIEjJydcJfaWAMYdCYv0v/xsEBfARNz3jhTBfFkyeR?=
 =?us-ascii?Q?s3UjA0xDJFmdXP4iyXI3Ro9VzM9svCemkxh7IJpeny0KBvuFtTlj/yGZsaN7?=
 =?us-ascii?Q?9Cb18YZSHyh/r3o0Vq0DRp0dYhRLFfk7UN+uu+83OdLI283LDlQiKXoBbqAG?=
 =?us-ascii?Q?I9HgnXb/zCr8qa1lnND26yATjAEUUp4ppgf6W3KMBBp2tvCbTyH4gq8FXzcg?=
 =?us-ascii?Q?FYulZTqwYUvJ1dhyf0BvEinF4MGrNjsTstC0daozRNNRormC/nrWUZqri2zE?=
 =?us-ascii?Q?4NZR7vfqD7Uhziclkp9X2Dmo2f054XFdRiPFi5rKF8TywDTpZhT5rCUKsIZr?=
 =?us-ascii?Q?Bba+8qTF7/Jkgt5SpcUJ3StcbK0bB3xx7h+ImMbAlBeN0ysdf6/2QGs6GI3n?=
 =?us-ascii?Q?1BGiyA9r5hITsUAoF9ZtqXPctUwW6ohK9iChsHiMMlyzNpAcaaV026TRyeKi?=
 =?us-ascii?Q?P2gMVTwru0SDLGQUCFoOcFNkVCMB0SQnuZRJpq9Xu6v3XhVcfY7hpyPBIboI?=
 =?us-ascii?Q?xTA56AHTx3sx0T+Nm4lAuCP5+IUzYm7ewgBJlnggHtrzvKwR3PFWNqFQZvCO?=
 =?us-ascii?Q?l6dUdhlWELbHD4Bl1V4cGEPJGNsfYfaE+H3DJUeiYtZr6qHkU+Q0ee2CigM8?=
 =?us-ascii?Q?0l3gBW2eKvu1d/HKKG4r3ia2eN27cTd7b6UvNnntBdGEdGXO8cM79CKvkFI+?=
 =?us-ascii?Q?dvMexiLXVfEpF0AAOHwktWRCLr8/y7LAvYoAc5EFcG6wN+BrKFTyNyZTMWe7?=
 =?us-ascii?Q?fYY1JRm43iYv2RuO5P3CkJKe4aeMCn4RuZ/+l3U+39GLJRkW5jRrhSEmeocQ?=
 =?us-ascii?Q?pwplnw6jcR7eS6gSsySTZav1oA/mmzjj6nUwL/hZ+DPedy/jJtmaregOHIqM?=
 =?us-ascii?Q?kQNm2SfpJZ2Cs3co1NGQTfOruYOiTtVlL+04xP8MUX5atLBb3tqsL3bo2dVP?=
 =?us-ascii?Q?LBXYzKwVt7W07QGBkAHWf40p7LltnA9pwFjiDqI+SfG/oTWt9RGANfl0s0yy?=
 =?us-ascii?Q?66aCu7KKOM+luE8QrnLFlpreFuUfA4FIBnaJeVS3/nJ1l4EwXCSiuXw2UhY/?=
 =?us-ascii?Q?gHkmWgVv4f91mfiIShS9yjneutcvFpAIhhLvLFS5IuNB2SB8vodJ4NcaN2Te?=
 =?us-ascii?Q?nn/GVZa9jQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e1bee6-afe2-4fe7-a071-08de75ee0690
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 10:50:30.5403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poGEfTjAfyzu1l7SZbq6VYiof3qMR4FS2Q1ys40tysI7TNzFaXuJjnGp3RvbaUkPYsn0XHRxHotPvWeaYpvMCWoONdtSta7P6i1wO9BBC90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10384
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Chris.Brandt@renesas.com,m:geert+renesas@glider.be,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hien.huynh.px@renesas.com,m:hugo@hugovil.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,hugovil.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 95B6A1B630B
X-Rspamd-Action: no action

Hi Chris Brandt,

Thanks for the patch

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 27 February 2026 01:52
> Subject: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
>=20
> Before the MIPI DSI clock source can be configured, the target divide rat=
io needs to be set.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Fixes: 5a4326f2e3b1 ("clk: renesas: rzg2l: Remove DSI clock rate restrictio=
ns")

As my testing shows the above commit breaks RZ/{G2L, V2L} SMARC EVK connect=
ed to
ADV7535. This patch has functional dependency on the above commit.

Hi Maxime, Maarten Lankhorst and Thomas,

Can you please apply this patch to drm-misc-fixes please as the
display is broken on 6.19 kernel since the above Fixes commit?

Cheers,
Biju


>=20
> ---
> v1->v2:
> - Add spaces around '/' in comments
> - Add target argument in new API
>=20
> v2->v3:
> - Add missing period in comment (Hugo)
> - Changed '1' to 'PLL5_TARGET_DSI' (Hugo)
> - Added Reviewed-by and Tested-by (Biju)
>=20
> v3->v4:
> - Fixed up the comments
> - Fixed the match for the divider to set (was missing a * 2)
>=20
> v4->v5:
> - Rename patch title (Hugo)
> - Add bpp varable for easy reuse (Hugo)
>=20
> v5->v6:
> - Remove clock diagram that was wrong (Chris)
>=20
> v6->v7:
> - Rebase to v7.0-rc1
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index f74a0aa85ba8..29f2b7d24fe5 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1122,6 +1122,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_d=
si_host *host,
>  				      struct mipi_dsi_device *device)  {
>  	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> +	int bpp;
>  	int ret;
>=20
>  	if (device->lanes > dsi->num_data_lanes) { @@ -1131,7 +1132,8 @@ static=
 int
> rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  		return -EINVAL;
>  	}
>=20
> -	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> +	bpp =3D mipi_dsi_pixel_format_to_bpp(device->format);
> +	switch (bpp) {
>  	case 24:
>  		break;
>  	case 18:
> @@ -1162,6 +1164,18 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_=
dsi_host *host,
>=20
>  	drm_bridge_add(&dsi->bridge);
>=20
> +	/*
> +	 * Report the required division ratio setting for the MIPI clock divide=
rs.
> +	 *
> +	 * vclk * bpp =3D hsclk * 8 * num_lanes
> +	 *
> +	 * vclk * DSI_AB_divider =3D hsclk * 16
> +	 *
> +	 *   which simplifies to...
> +	 * DSI_AB_divider =3D bpp * 2 / num_lanes
> +	 */
> +	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);
> +
>  	return 0;
>  }
>=20
> --
> 2.52.0

