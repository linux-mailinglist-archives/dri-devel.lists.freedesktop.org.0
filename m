Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BDC4FBB2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 21:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F206310E14F;
	Tue, 11 Nov 2025 20:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NcYY8F9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D93010E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 20:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGPe0Jajn6QzKKTyzTTatEkkxC7Xzl8YCXoufbZ27RvnWxX8ieRxiHhhzI6xHz4RwZjhquIXQcETZMxxjeQuaojIBKeNqVm4mL58QyVBBR9EtHOv4r9rQU+U5gDvOM+eSPSbibG27V1iBMS5v4WuUkIityw3JGAD2foPQ5WRzfgLeL/6fX/JPFz2Oqfrje5fLZfBMOEJjtW82tEVNePt0hMuSuOjy32hX1Of0KqgZEp79ESIZfLyay+pSFnCOUwG55Jo/dqNX5MGuefIgwdnzMFbufYv74vFrNTQPLzrQKwSNsCZQ5jJu/PVPA/ROf8XmjvZw6O24jOw9uBOM0K2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yafuTzCuTdKDRGN9O4EnUxoMbANheDKky+gT0sO2p8=;
 b=nqU7i6miaHZHiBPNOC99AuoZicCGoN/5re8zbyMg6928zegpxnS03+UqbsS5/YZDNKy8fjqhP/eUmy5LO/COH1Q+AvnzVaoqHyKBdt/5AJyJUYwVz7JmWodWZXxnAWzuWzp5WeyEoD+0gDFOxvEi+rugPzGRqiMvudi7SX4HYZ/DXOu45Gg3N8VnUn5Z0hiYnwtNagKOu6Be8EcXimxDtXcR4dAnBZDMn5UnyaOOkLni5NUVFdK3m1FUh4jzBxoHzVnYtj/C4j+6SI9S8bW0zsLoZdpKp/7PCBSrwoqCNV1FgG9DRbbSFlusAyO12VyER2osq1At1iSgLGI+l6UdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yafuTzCuTdKDRGN9O4EnUxoMbANheDKky+gT0sO2p8=;
 b=NcYY8F9z962NeOoJchj8EXeU/8yXCD8xp5nqMcSqqi97raULhjd44WQAqA2UdJAmsfifJrmvq8p/jd5WevoNDUK/6AXOGIh+YFWi3P+BveKMX8RnTyry/mIVPMfk2Uo658vlcDYEUdGPlAA17HMl0tPxBtTGRbHC2qtQbEH/qEk=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYCPR01MB8614.jpnprd01.prod.outlook.com (2603:1096:400:15a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:43:02 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 20:42:56 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: biju.das.au <biju.das.au@gmail.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, Hien Huynh <hien.huynh.px@renesas.com>,
 "hugo@hugovil.com" <hugo@hugovil.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcUIhzzvEMa+4Ez0iYgZqH/QRQ77TtxCkg
Date: Tue, 11 Nov 2025 20:42:56 +0000
Message-ID: <OS3PR01MB8319B194964E67E3F7EFC86E8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <CWLP123MB44995816738B58D66F4729B0FCC0A@CWLP123MB4499.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <CWLP123MB44995816738B58D66F4729B0FCC0A@CWLP123MB4499.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYCPR01MB8614:EE_
x-ms-office365-filtering-correlation-id: da23af76-a32c-4188-b24a-08de2162e4f3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K7S6XDbuZB521+PN4KhvUwT8g6wvwQzhXXKbkkwFexF2j0/r6TrLnH4pYEz5?=
 =?us-ascii?Q?La7AgHsFKXMxoPXXjglusmJHq33hwtvL3vRKEISm302MSboJ7b7ejRJlGo15?=
 =?us-ascii?Q?seRwmkb5F0WvlUtGPzzTSaIC5DJkayW074RQvBAdlkxKgEyqBGXQejShs9ua?=
 =?us-ascii?Q?pHgYKN2J+Y3gGBNvbw1NnTAn6DE7hC/aB0aqLnzBaG6b8I/LSWblJAcNrVRe?=
 =?us-ascii?Q?C1p7ioiWNgUkhxveNwJvyk05qvy4v3F7TqF90JgzZrOlzmT1tkGGBPJyD2mt?=
 =?us-ascii?Q?r+tZTEvXzSCK2T4j4U2hfjVJcx5lpta7IOtTTz/g6ROT1maLNq0NfGxGACyj?=
 =?us-ascii?Q?ZlUYSO4xwXCyREK7QdqRgqYL1qKzsfn7FjbhmZHAqlXxBAxP30yPKwRv8uGd?=
 =?us-ascii?Q?bgpz4InvGINSH8IzC0TpZaa2IhHek5suU124T09kl/wL3GiBLPCXBvJcRAor?=
 =?us-ascii?Q?vrGfe1C6Wyhum1qJkFmi57VgR6XyA1a7e3OW+QH6Nd5KeUIfz0BwHwj7fbr7?=
 =?us-ascii?Q?/3y9xy3RyJgqFDRVD+v9L5W7Zqhttnhz3IFoAVb3J9raYAtP4BBr8BWncS4t?=
 =?us-ascii?Q?EjL0Pp9pP/J/aiR/w4Roo1N2X8xWRH9/yzvkfUi7FnppTrMrWI3ZbKCjg/on?=
 =?us-ascii?Q?zJ0BJ0VRoY8Y6/He7I/t2ntSuy3Kva37RS+sGo056nP2DGQYq36kJ7gAJ3IE?=
 =?us-ascii?Q?lc9As7zmcFunx8ilCCsfKaJoXELj9tD8wWqt4ZZzvp4xojw3zYnz7C88UPAn?=
 =?us-ascii?Q?ik/R1zx96d1stpgOwlwL/BCbIsZprNpfeLhJo1oR293M+qAT7CxCKYyj7GSh?=
 =?us-ascii?Q?uplUsrRfi7ONjwP+niloaPCXLIvb5docnEH+Rg+wT05gJvbAB362U7Z82tXx?=
 =?us-ascii?Q?EJvxX9xMcnRBApyrN2mhLiFEMbGIKDLktKYOe+IoQYIgfKxasbr9pF2V9/f9?=
 =?us-ascii?Q?o1+rTLuCGZqDA+1TUp2/Bd43lHaj4Q7RakTxocQ1jtoY57Q9Tgi/Zh2ET9Yc?=
 =?us-ascii?Q?w6xyQaTDBvngIVCPOYOB0V5Mswdd41J6djJJRSNxJa6sAuMgDNzxdDkZjYQp?=
 =?us-ascii?Q?WfRhYrcXw8HqNFqbPO10QzEj80X7dqOkM7v8Ni9mXoRilKmxfYDHiNavYRD8?=
 =?us-ascii?Q?d6DNajrb0JbD/bc0+YzCQAzmj8rAw9Savyq70QB74g4mM+CfRQ4Y2120wszU?=
 =?us-ascii?Q?k36YrtkTn5f/HWpHxUb2DVsY0hr/2m+QpJcYZ4HEzwX9n7vBa+EmAVdRlBuX?=
 =?us-ascii?Q?HweU2Qy5Oyuvrt/xcWQ8igyOCUNMUSfA/ic8JRqxlE8loDY2CWboO09cFUb+?=
 =?us-ascii?Q?j8Ax/JCwXyB9o8a6hKgESv1730A5nBLCfTLNPV9rztxa1Mst0bAOUZ2SLxCb?=
 =?us-ascii?Q?DoxcT14/xs90y/UGPsBgkKf3BZmLcssT5bo0PKkUTzg4pENI820iNHX23otb?=
 =?us-ascii?Q?5sm3BR+Cqny+yY0jerUosXUHO2z2Z2zxFvLuRbMCxb1kHEny8lbYYprxwbgm?=
 =?us-ascii?Q?eHJwRQxUa/snTkUGFT40bgti6TRgGIDxe/St?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M1g9CDO9fcvtDCZM8W4nazGqF63YHvna3VJwvUD0ha+6dcj0UZ0jKpPX4a8M?=
 =?us-ascii?Q?EPzecD9vlPZlC/c4PqROXc5PwJOAlO/mD+aluErnXeB4Jl7th/m8TGUfDIgO?=
 =?us-ascii?Q?VVuukjbfGic9sZbrOwbPW08HK1dPOLk2SIkONfq/FLuBN5G9L78LQsVMs0bA?=
 =?us-ascii?Q?e/4wey4Z0BS117Io/caSgaD7OxROyuC+F6RUR42YGg+CY/5uteLAh9Nu/u6t?=
 =?us-ascii?Q?EF4x4XfgJwBH8CGmAMqVQRri0h+ngpPp3PBa7Hc0OUKB0ovzjtZpdJ1gmVRB?=
 =?us-ascii?Q?ImAo4LjwHx87V9SHb4vFb1+oE0p8n2sx4E7IZbFjM+Nm6L0MfkAnBvSCrBBU?=
 =?us-ascii?Q?Sx1mGHnqTy6Nj/Zzmmv5CGHF3J62By0BON+xEtYCzXIQODeBdWSy3TImm5fu?=
 =?us-ascii?Q?2zPGSysJBdyCw51LdCyrOy2UawxlHg6uZfy/LjC32vr4qs22b2hdgInxxjFw?=
 =?us-ascii?Q?I7b5RveySfrGFo6hpB0ssvynTCNVnWJURL3gj8oYd/GKhKib6XpM9PEhpdPb?=
 =?us-ascii?Q?q1/7NMoiHGl2zLYFYEtKWN0ubBDtrwQKRezz07oSAVB/0uB8ul6lBYVIhcr+?=
 =?us-ascii?Q?9AgJEc6pzkEhHa/vPvSKf9HoFN0a9ye5zfcleMpQ5FDQfAOlimjwFcGKWKJt?=
 =?us-ascii?Q?HrfgScaP6Ku4mXHCxXX2Lk8weEV21Zor9zX7aoQ9NUH5rcJnBF0pNZ1WmOP+?=
 =?us-ascii?Q?nWuuDot8Ou+edo0cuaCMc9/VQXGlHPmef/VZtJVnkp0EasuTCCLa4RmerN5v?=
 =?us-ascii?Q?ccNVik0phaFYSxX2gQgj0G3sAs9DdW3t8vlHLXF2DKXtZNNziWmiaiOdNsWf?=
 =?us-ascii?Q?X2MaZxI98zmcFAkyT3QOWGIlvWru1NbBjc6zb/MwwjLaEQvEAeRLIyy+zbyp?=
 =?us-ascii?Q?renTPBefFty20X1zGiBxA+3M5eJusUTQ5gI3sKiT6e5K4qk8O1aD5+t6Hgyu?=
 =?us-ascii?Q?eS/ChkWNOH/UExX+oBvwmWx8sSAO6siRnacOJFnNNvEARmbiZBmdM/ba+2o2?=
 =?us-ascii?Q?FPuecsNZjJ9mV/Y18h6euYfh/4o+kctrpqRoP9G3S733ONh+kEP5IXFgUYDK?=
 =?us-ascii?Q?HWd05MakJLdpd+7m7czQZ3Kzf4D7iph2TDhnFVPVT+kiFEcYMPV0JhUcUyPg?=
 =?us-ascii?Q?YV42BpfLtsuC5YE2hw5cONXwMyqxEjLz+fM/VlLh2TlPE/nYhW8OjClSkoHQ?=
 =?us-ascii?Q?QlZW49tShcDSTPmyaUzDoxTY8gdkIsSmHMZFq0JdvAtctcTpVHfB0rkXSSS8?=
 =?us-ascii?Q?d5dvDAp0tHhOFmMH/M8JP7celbFU4dPpaBdNKyPI0OUTk2OTpK7XZiP1n4KN?=
 =?us-ascii?Q?3qagIv9b+Ou87gvkDAcA4bS4k2+bdPIuf3PY3yr2hQOQQNr2Xa4PdREY8e5+?=
 =?us-ascii?Q?b2XrCH0lnJqTYN0XIOyKyHvc6yiWS5OsPx9L2wHDq4FIGbeSyMRs2Uta4ope?=
 =?us-ascii?Q?TumezMGCZIhW71jvSvctE+bk/HOE0SC5TdnpNauSUI6y9oDarucA8Swa2KD2?=
 =?us-ascii?Q?8j04KX10AatcZGCnss83pr/CNAMIVbMBdgGD9uiKRuMTydSumbW/wSSdBaDu?=
 =?us-ascii?Q?osiX/zwNxVLupxE9QKQSLDDdk0W0E2yRP6JTM7KG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da23af76-a32c-4188-b24a-08de2162e4f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:42:56.4500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93dgHtWjvagkIpC8ycqy6LsPgqbzEOwa+jme7KtFBvuyaf/kRqtdU83jaUcrH5g5Pa6laRCJNLmfbTHyUgF06NTw7faO4/Cop51TI+5ThP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8614
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

Hi Biju

On Sat, Nov 8, 2025 3:30 AM, Biju Das wrote:
> > +	if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {
> > +		/* Fixed settings for DPI */
> > +		priv->mux_dsi_div_params.clksrc =3D 0;
> > +		priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> > +		priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> > +		dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
>
> This block is duplicated may be add a helper function(), if you are plann=
ing to send another series.

Actually, I just found another issue with the current driver when it was as=
suming everything to be hard-coded.

The current code calls rzg2l_cpg_get_vclk_rate()    BEFORE   calling rzg2l_=
cpg_get_foutpostdiv_rate().

	vclk_rate =3D rzg2l_cpg_get_vclk_rate(hw, rate);
	sipll5->foutpostdiv_rate =3D
		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);


The problem is that rzg2l_cpg_get_vclk_rate() is using the current values o=
f dsi_div_a,  dsi_div_b and clksrc  to calculate a vclk.
But, the real values of dsi_div_a, dsi_div_b and clksrc are not set until l=
ater in rzg2l_cpg_get_foutpostdiv_rate().

So we have a chicken-and-egg scenario.

We can get around this by using the new "dsi_div_ab_desired" variable becau=
se we don't care what the current settings are, we only care what we want t=
hem to be.

static unsigned long rzg2l_cpg_get_vclk_rate(struct clk_hw *hw,
					     unsigned long rate)
{
-	struct sipll5 *sipll5 =3D to_sipll5(hw);
-	struct rzg2l_cpg_priv *priv =3D sipll5->priv;
-	unsigned long vclk;
-
-	vclk =3D rate / ((1 << priv->mux_dsi_div_params.dsi_div_a) *
-		       (priv->mux_dsi_div_params.dsi_div_b + 1));
-
-	if (priv->mux_dsi_div_params.clksrc)
-		vclk /=3D 2;
-
-	return vclk;

+ 	return rate / dsi_div_ab_desired;
}


Since this function is only called one place in the driver, I suggest we ge=
t rid of it and just do:

	vclk_rate =3D rate / dsi_div_ab_desired;
	sipll5->foutpostdiv_rate =3D
		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);


Finally, how this all relates to your comment is that instead of the same c=
ode block in 2 places, we can just set the default desired divider and targ=
et in rzg2l_cpg_sipll5_register() which is always called early.

	/* Default settings for DPI */
-	priv->mux_dsi_div_params.clksrc =3D 0;
-	priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
-	priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
-	dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
+	rzg2l_cpg_dsi_div_set_divider(8, PLL5_TARGET_DPI);


I just did some testing with DPI and DSI, and so far everything works the s=
ame.


What do you think???


Chris

