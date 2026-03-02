Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COfFHURvpWlXAgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:06:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E11D72DC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4F210E489;
	Mon,  2 Mar 2026 11:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CLQWwEM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D3310E489
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 11:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGx8Gg9GWFfJdNdiH/s9lwXePEorCvYvsoq+rJ+GtcpO1+M3lrYgeBwafT2PRccJGOXVJVmb1WcRQXjGVcsnvKmWPxgYVvxDresTIF6Dhe+oTBCEjbsFWAgeov5mFWwwYZKJmi+0vSekCzC5kbEqlymgYToS8/IyLN0kAKJfw3Nk8daakmcm78iHu1FLc+SBjprCx856x46cpXUuMnDuR3yo8ZI4rRNVMqrdwbN/E4GmHP3V+NyXgG4etGQUfuHDudQuiWW24tQn0ze5w5YvFBR7mm1mE31Thk0NgfAgHHKpsJNUGukCoKfQPSVUknY30VHfVYt4NCWiepUR69sfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z05oGujtxVVztN1YIJ6iLNpwtybXW7Si0MdC6RUZe5E=;
 b=x6MEL3UAJbmORiaiSXrkIu6bYD+Wuw1M9HyUdgUC0EhUs782POvpZWqqsBv/2dfphDGPM/NZZO3mWf30+PsEH9VrZtwbBvk8dGzycVXtY8e1OfPzWp+5nSc2wF6VWJkoLrtr59j1IEyLcArlwgqmuGfQiQM646MXSvnG2CYH5CmVq5S2vf9SpQ3lmu4F5WA19VZf83IOqQHXRo5vqJVZpq5P/UgNbsOu3EBW56WW830fsQqmWL/CqG84TRZAdtLTaglP5LEhKSe2E6yQR8GnIYwXQ4g0mO3lS4h98TBK/GnWrLm8Yv8dJ2W3reLKoEt9jPaVf2I3ktg+LAUR5aECkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z05oGujtxVVztN1YIJ6iLNpwtybXW7Si0MdC6RUZe5E=;
 b=CLQWwEM59ib7fs/5Mzm/iikXk1bKkPAUGSb7Hg8r6L3xvla5mlxFUh7yrQiO+kTysKhtrhbxDtpgFJ8ArEH2Z+7n9IbGbtICd+4xGoRTADfWicojWvDUmCrushi2rNm8R7PqOXLkuFk68L+lZJAaA/Lood3ZtRJiQGctrannQLA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11974.jpnprd01.prod.outlook.com (2603:1096:400:3e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 11:06:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 11:06:33 +0000
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
Thread-Index: AQHcp4u/eZzblQs3SEG9Nd1aSbBwPLWbGdAQ
Date: Mon, 2 Mar 2026 11:06:33 +0000
Message-ID: <TY3PR01MB11346E1B951F1EEB5474E2005867EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227015216.2721504-1-chris.brandt@renesas.com>
In-Reply-To: <20260227015216.2721504-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11974:EE_
x-ms-office365-filtering-correlation-id: 657cdb96-6805-460f-eee0-08de784bc3f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: cdhn555ymgIwh91wo2n4NRW+6aINuezXATw6vVqXtcj1TW8sJB7bxR12y/fS+fpDMDBZ0Vw1umt0fj8HiRzteEwfyNKtabjqPPII1wX+veTHc5HhT7nlGY/V6wBq0OnJUzcJ1RTcxkuIe7jhng+/QFo74cATE0Su48C/MC0FMgG0HlSuVzcW55TptBHF7Oa1BxN3SS8eRKBOqU6K1ChIcpDhW9fMc9qqegU0KEfosdj+81IWjlTicLbXjwwj5sGVhG1dSWdIao3maiG5WO4jlZQj8VC78v7CU2DmLSJtHY6PVhjtWSPQrC34b7u4iVJviBWAPC63+36uzkHbvIJubYW3YZo6+riQrhCx75GcEVbIusImxXCa0P/S03ELU+BRvrSJpFqYYTChybR9qRpOERRHp7mANx5KVW0KUnCqL67zZL0MBtmNpCH6bcIZ1e3KpQRZnn3iiLkYmwAZTX/GFuPPBMb4GDEZhiTdeGCjC1hMmGI8NK+4ZwSwiNphOtV5BahJTEa6bwRbNQNQOaqTx/VJZXY0SsU4+jVO0DA5eqL/PnDDHsg4SLMlF1hTsNNKA79vJFTrRQZNu6MouX/bOB6+sHjdbytNTeWtCqSO2teTcVveIE8MTIrfvq2I4lydRrAXxW9LHLhPAZs/woEn5dGpdC9rHizIgStJEBJRQsEjF+tqT1inObTgSRZ429cffWrhtlLgYoABEz9YqGeb8OlTpROHpOD3Ijo3IH9P0dVvtaaIfuDcZDZIuCmn7NCsW5byR8n4KpIf3E4ptYuksEFEVlojZ56vtDv+0GyG2Hc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K+GHyeJTu8lZDWGWJ9XKH8eW/RNzoqzBYCT/LFYSQzgwVoZVkPYux99FJM6q?=
 =?us-ascii?Q?ExK1GLymKtZn5GztFMfPwvzk2RXZvybZgkMvT9Y3KhJsSAAIaLbJHVmkcHOH?=
 =?us-ascii?Q?PYGgSWRStGa+bHyNdJJHXDr91FArY9ugaesvypNaHBERZf02vZeluh77z5TX?=
 =?us-ascii?Q?JN3GtvAXTZfQvRwQdS5W3NT/dNWTQbwP9u3sTWKlShPjViSvETFczumoVEmk?=
 =?us-ascii?Q?bnUXl1yXSsbAD93TLT6tvIMe0mWlo9m8V+3IMo05/+v9NTuqIa67vY7rCKFa?=
 =?us-ascii?Q?9RHbbNa+mtPEQHxpPSOBTxXC3Hli5lOgKZBTAuLsHfrbW5fNfYT22vcrFs97?=
 =?us-ascii?Q?LdhJfWNC3F7hscBXHoJsKr1gUsG2yve488bgtzuL4XSlaYmT/kSiJZ9wCnNo?=
 =?us-ascii?Q?R4OC93tNmteEO0ueP2LTclLUiaWsVWSxnlwQ574jbE9AK3nAB8ZfiqZYYHU2?=
 =?us-ascii?Q?ShEDMw/KM/ynitHBRWLMXufUzXlkT57ud4OrzGgAM2SW7zk+PFXUAs1lhwe1?=
 =?us-ascii?Q?j8zv9eGTV+CWNuSA5iXDb5RhDXZkSlrCNAoM8TBqbR4bn8DIbQ1DDH2jHGF8?=
 =?us-ascii?Q?JJ6Mp0rm/ESrpZLqaae/TKvirpR9atM2gShMDM/5ZYcw2qR23ZRX6Q1d3T53?=
 =?us-ascii?Q?It7NafcJq4zTrXuX52/HDhKgq7BzSTgwDEeXcT/UTnCdYJ9Vssz4GCdbtNl7?=
 =?us-ascii?Q?0dS49MKSK2GIa/MMX0YJ0uKMqO3xUCjlt24ru+vZ8xrfbMB3zpSWLL1q+V2z?=
 =?us-ascii?Q?YS2IGog41RL9lYiJvQrXjwuuAk0CsHV5UF7oaF2OtoZjgmZr5I0s8jbYYh+P?=
 =?us-ascii?Q?nKCEBmmDnnDkxJQ4ROY0CTN0Pv3F2xQI3Y6YbJL6OoakXUwzvVLYJWFQ8gkH?=
 =?us-ascii?Q?VfJ4ijfsNxMArCBFcHhrRR8CzWKYKZjORxqPeea5t5Rmaw/BMX8vYYa7kXnD?=
 =?us-ascii?Q?7FqB4oP9FY0jqIy4mgrS0exZ0cOqEE2eDf4dArFSqEea2uW4cu0t91G3e1Qp?=
 =?us-ascii?Q?0qrcVRCVF79uEmdr7khl+ewTy6P7IyC/sjmkfQ6rovBy9BEan/NJmP2Btp5K?=
 =?us-ascii?Q?XK2hEP/x6XrRBPvZo4CiSQPMwhmJV8r/FX251Nw25t3nhm6rMWFZz4l1qAQP?=
 =?us-ascii?Q?t8pnSYEKvyBKbDHOW+y89Zn7rXMDbw4AaJ9gwhGqYj6eL6q1Pj7DSax0j/fy?=
 =?us-ascii?Q?ZM1YY4mNTzlGBCnCH0EADDgi1wul1WmBDk38ZwWPBLBUJRsAhhF9w3UIsuMd?=
 =?us-ascii?Q?TM6rBfSEgq1+EC7pddXDR5q0a6wlf6qRCXVuIdz7HzmZwizOfYp6BWWHEoa5?=
 =?us-ascii?Q?iV+jzcf84C9yP3pSt5pVob08+eM+z1u+VJD920SEayHUcNKrWiPo0pEQtUFr?=
 =?us-ascii?Q?WJ28GLnbdQCvsEWpoTky9JwPofY2f/Du9gUpuPq37GjUNeNLb7t0FKCD9zBc?=
 =?us-ascii?Q?8q4bhNiC4Qvkb0qgphXa8CjFwPWmQEmaQEaa9jkWN1nmhYdqPn4bp4EE9Ddl?=
 =?us-ascii?Q?wiFhFo3+mjIwZnU7bv4DIvpHgCfn7+vOAoTS+R4PQY0OGt9qZF6hS/jB58W1?=
 =?us-ascii?Q?VEIFqy+TkTT7B/wM1pxClJvgPaF1hWM9tK1s6JSzD0ggxsYT6S+tHQh4uche?=
 =?us-ascii?Q?XIMDTl8goQwimdFnPQd15HDbvFoTx7VaMH9iAdXgTBVKb4TVrW4Qao35CraB?=
 =?us-ascii?Q?gMu5YtpRQ6v/b5XC4en6rHalGnPz6xMPwV2Ql+ZjIV9tGYsDK2vlguaKpTE4?=
 =?us-ascii?Q?TpExWluaFw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657cdb96-6805-460f-eee0-08de784bc3f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 11:06:33.8634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xP0/XXpstDNhZFmQK0quwOVyA+pHtIKOCh+0h8NL3HVLcF4y/ot31fJiuVrrmWqXFDq2bNlt5xvF/Xe7CdkW+1QpeSKxVIPzkNb18uSUqvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11974
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
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C21E11D72DC
X-Rspamd-Action: no action

Hi,

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

Thanks, applied to drm-misc-fixes after adding fixes tag.

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

