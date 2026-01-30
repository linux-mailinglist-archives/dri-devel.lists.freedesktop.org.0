Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJWBMT7qfGmdPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:28:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18CBD1F2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8435510EA22;
	Fri, 30 Jan 2026 17:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wAftS0TG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A451210EA22
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ii88VLc0pJIqTaDvrzcevjgkKjP7aMrJ1rzOWv01i4/jK4aUiAKU5Ny/LfiYZF+Q+Jq4Usfna0+wHs7nJ6ERAptqV6HLj0aXMP65EwA0IiXZmgARzJmW+KNrabuPPyKBJJ5GwN6djx0o++sTBqlzkXE15FSsjoXZxZ4ur+WJf9rs4AwoQf46pQCt7i9P38DWKvnPH41K973kmpa1hwLIzxzCFWDcLP46psP9v8JEJuLNibAD0N2k83gUcJZ2qDXelaJz5pYpCAt5iS8DOIMg3zXXGkHqk+RKDKpvcyNMphhmtjk7pE7uY5RIZ/fzdGaz2XKtoDyYYwwTI2ekZobPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlc5d/nN9BNCdSq9V8Drn7bOgTEN+sO4eO/prX9mgH0=;
 b=elgJsWxB7UrZDUi64ohf3FwZDWEqdcW+4s74n4pHMoYf6Z9/CCVPJFUnQBgwwTTYYyI7KSvzxjh4Lw6jaZ7+UN+PZm8SjHg7LrGBv1+71MWJWIZSC5RZydI+hHvxxF17uiVqeq/WP2wxYuvCar8ON3cgAEEBVPhMAl1MoetVRPGcv8NzFV0H+cM9MwBbYymoEU2vZQJhj9tRKtl+ESD37y/hgbnilVtP355IxmiuPu+86vA+8IuQEyGMCg2UkmS2FqRFTASratRl6fiR0FBDfDO/oTtJ1caBO8pEcKLYTSfFwazqzlY3WwjMnEFsnJeYmYYph4IyeeE/FowrC3vnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlc5d/nN9BNCdSq9V8Drn7bOgTEN+sO4eO/prX9mgH0=;
 b=wAftS0TG68c91jUMdFnZvxQCytU8CQ1mBtaESi365MtABCleaIudYHlMOtmCOMkK68UnQyXlHkp5mSuPaHOsiN4NMMROCDYdZnURSfITUqfr2BOOVb0xmsgZuGa40Dn9w55ezQzpC2+K74Ea6mJlcWczdXZ+9dGw1nqIvjQu3t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 18/20] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
Date: Fri, 30 Jan 2026 18:25:15 +0100
Message-ID: <1babfbd5bd735e65991ace0b7aaa420a2678899d.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13818:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c38e5-b002-499e-8ed6-08de6024f963
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDwsQhK5PY69WT6tuQGyoHAOL8q6bAYh6HMxK69pJ98PnBvRXOjTvZI9U82h?=
 =?us-ascii?Q?qIdkSyFbLmnmjntcmw0LSke2d+7mzo2KAxQn2ciG2WYC6rjYTBb85ugAK2kI?=
 =?us-ascii?Q?YabkBQH3T7I2gn5zAXpKCPlJ/r0YiLKbaNmBNLtTN8WpTPEnC9MKqlZ3zuAS?=
 =?us-ascii?Q?vKqW9SOSrZlVGFXvc1bdRGn7Jj2A+XwVbS6jpAVktIaI0J+Mmf0ovZnrdW9S?=
 =?us-ascii?Q?+W1jorMrZhHjMreBrXs7Xo1wthT5uhcQXOdqx0ES3KtE+GGa83kdWKaS77ig?=
 =?us-ascii?Q?0K6vorhhtXh0YSU9A6CiETy5LDiiqWOafHcKbmXmO+8v+G+wgIK09Wi0H475?=
 =?us-ascii?Q?/N24RgiL5j7lR8v8SPvwr0WluoQfmRk7vstUc3WE9KYBkipUsOBt9x4waoZg?=
 =?us-ascii?Q?5h9N3VZErhWBed0lr8iIMNkBUWYY5EEbXdCc+W1QlRgVJBoD5dWDIda/cS3a?=
 =?us-ascii?Q?ZAsU4e+Nq5hSX6NuigefmFzVaLGySm5ZcNpL+/mrPPOZbUR/U8ygJ/P6Eh1u?=
 =?us-ascii?Q?tBvGifBV7vmLLPB/qucvUSOhzYykHwCpx1R1I4j8Yx1FPh3m3cmLv5PF85Od?=
 =?us-ascii?Q?WKflhY4FojAKDGkyxY8+YqJBiFQKzmZHmhqOUIBo+N12DfhHmDNvAcO2TmM8?=
 =?us-ascii?Q?DfI3qBxDNzhukRyNcZlXwLnxPiWSgnW6htb5QSaKYPfx6L5aaistaMpnSJfJ?=
 =?us-ascii?Q?eTYi7IbFCSKZ4oqZl1fxMLhh312A9NI/9r+YUHrD53aaApykbFZVJeyjX9ql?=
 =?us-ascii?Q?bBtanjwmCYJ79kwkdXVbGCcT1lKzH1ts6+5KVUXmV0NzfeFUvq/Iw0ApHuEP?=
 =?us-ascii?Q?xcAwXQpLlYGUSkytBh8TrODv94dqCQPl6a2ExK9BrSRu2VOPQfuB/WpARAOo?=
 =?us-ascii?Q?61T9Nc9IHWoYraV3/yr6VXiX2WVog/XPB6fr7m7bdzovuZfW7wdVBNYVdF4Z?=
 =?us-ascii?Q?4DE+szNgb2Ei900d+FVHI0Yzs+N3gMOnif8c/DEMI3P2zXg32p1qFgcsIKUE?=
 =?us-ascii?Q?qcZ03YuAiZWelSScTJe69/Hs1D8gD/abde9aH3ho+KqYkEUtsYPGccqVDRw6?=
 =?us-ascii?Q?aH6nIunnLJ0S6iMkl8wAbXMQ4T//cGtxUbFUeYF+gGsGDC/M+XrRrzCJArFT?=
 =?us-ascii?Q?A54ua2KcXUCLF8m+u4YvoSYd9ZqEZ1H9UZqhSVbXs3wAOgHMVB+642hcPmOf?=
 =?us-ascii?Q?uRZArn5zWjx/DHsavI1yyM4+UH7lAUPKSILaLxO1aIF6+lJlyOKS7ZCcXizR?=
 =?us-ascii?Q?BmYJp7nmml6NMmBV3bPRoOSJD3ExKVaMRmsSKX1aJph6ixRKs6wD4MEpddRK?=
 =?us-ascii?Q?+ncpYqzVmS2DCBLa4N9jdJlL2v6w2ApGXc8LUsxrYSDiaiKeurHXBx4eMY7L?=
 =?us-ascii?Q?olyFfyWE/9U2gUHxHGi0pjd9QBkY0zCbe/5X1fw8HpiOAnTgyAQccN1Brpz5?=
 =?us-ascii?Q?H91VDdeOQIiixGd8D35Z/AZ9WyGOi6mM1fffnRE9Q47FUoG2iKMX9k9cvLSD?=
 =?us-ascii?Q?BTuEAxC4Wissl0rwhw+fuRbSNU3exwQSko8fDcDM13hN0yTMJ9638ezW1kAs?=
 =?us-ascii?Q?L6mNjP2fyaAcEwBDMtubdVP0jOe1/viwXZrndgeQ25UmL+WfoSdQRcJFC14L?=
 =?us-ascii?Q?Ufkyq4VdIKyuxuzLtRmNS2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWi6uTA+vxOotgRCzdLeJUzAvgu1Y2rbsOA0jxuDff8/zziHfU4RhVxRc2jC?=
 =?us-ascii?Q?SFmmuftKrudVUghNx4ZZqOglqE/fX0FarGesmuywcmyitwGNfNjB92GCTiC+?=
 =?us-ascii?Q?4x7t/uGI+/5DhbJQahFjP7faS0u509gDbr9KC1u4kCgoHW6hHkNaphhvNVwm?=
 =?us-ascii?Q?o5yT3w6LGKPv7fAhd/q5HA0JKkfooak9Q7ZoQ41yG+c7xwAgyobkOSVhWIlK?=
 =?us-ascii?Q?3gdsFixlxBDYqBLstNmeVuG5JGD91ENDGVxevuoNM5HoIsrjGak0Ibnwm3kX?=
 =?us-ascii?Q?iSFHFbNpFR65tUZ3Y7YAm3SiUuW/KO6FBJLPUm8E57hF3TeXph2dbP7q1kgq?=
 =?us-ascii?Q?fLyZL9PSC5RgeP66uNxKjNpeyWFeaSrd7T7UBMJ2OYJZHhVL18MBPnjAIpt1?=
 =?us-ascii?Q?Q5GU2nqy2l1KIL68nutP6D6t5bDnkUN6dlZicaToB6wcRYBONVcAQg70H8fl?=
 =?us-ascii?Q?dzXPWVoWkWEcAqjLphEdz7l3AQm8HCiDcry2/rMJb/CKgQOwaMF5YZt/Lbwh?=
 =?us-ascii?Q?YGqfuhGkMl7l9ssu9vh2UFaebDhVPoiaghO/mXxvCnlrLzeamXsmX5fw6SpM?=
 =?us-ascii?Q?TQpeaa8eMcpcIMZFTMXHtu5NBIsFx6lrpKWI87kZmIhD+oLXIaMJPDbox+JT?=
 =?us-ascii?Q?z4aL9vOVMbe0vCP4BTzjaXkcZxI35SDuRdLsQcwXipsmhdQf6W0FXzPtqOkG?=
 =?us-ascii?Q?6MLmpOehxVdAK9mOypgI8pirZY3vAcNgSJa/5ZRqukxQ8k1ljxaXs1tjlczg?=
 =?us-ascii?Q?vD8jK6ERIEzBRyXu1r4z/WU3swuklUpeSSjzICu5H7ewnqPwGshEsp0PcciH?=
 =?us-ascii?Q?KUhYQHgkaMyV/zHOXf3/GF3ycEQHxv5AIbcNw94nhIXk9lI/iA383COqYmBZ?=
 =?us-ascii?Q?K62UEm8Mg01D1yG0/kN4QJFdmhtbL+2SbdB48Fnaw9vdyV7ZfzhbYFY1iRgM?=
 =?us-ascii?Q?RXdj5vR10+I2p6SdMaqY2p5t50UEIGNna9xN/oiGphWKwLfGbr9MnUDhyMuR?=
 =?us-ascii?Q?m07zT8WfLWSVjwdtMc6eQr8kSQC1P8qo9SGX2Lf2ymm3rJMhB/3no92B9VGO?=
 =?us-ascii?Q?S7Be3PZh8+2qb5QRscMogu2UQrHWOJtHdUn4lLnbpRyE/LtMqT2HOPRaymEh?=
 =?us-ascii?Q?VAmhRkdQX2x6e6t+PegizzlLks6vgKBD/7WX6Yhn5dYDgpGa39EIzEoUFT8H?=
 =?us-ascii?Q?atpA8nScYYfEco62BG73+POpMh3rCiWvC0yrVzZVinEd1qUH9tJo/7MJfhq9?=
 =?us-ascii?Q?bIOsFYkYid1m9VvsNPQqBNRyXFkQp3XTnYzHrcv8L5qbSaRW0EMAPVDOS2HP?=
 =?us-ascii?Q?Vhzj6QFRmX9pf1P+5LE9qeKd5lZxbtEgTp8PKN2svBFH+JXT6UP1fxuL3Y2A?=
 =?us-ascii?Q?oqlMsW292/fLKAG3oPY1vieHnIAIJFRRvYbsF+xDAFESSaSLDTAU2tphOh8W?=
 =?us-ascii?Q?jcNAkSTZHAuKGXyPd+3JVbe4ooNlZiRfKoiUE2FXJ3N7jKKCDbvMXcPSmBA2?=
 =?us-ascii?Q?E5zu6z5kGPAsdB9AXpWd1g1vdRb19XRthXo8OImO1ogQ5lDHoXf+0UKWhRuw?=
 =?us-ascii?Q?4sEJabHFQMc/fo3vS/6FhFsf5c2QAt+5ASbhAmQFx+Iun6LCwlNLL9pPdExF?=
 =?us-ascii?Q?HjmaO75ss6+JDJJxBjaJTc64G1T2Y6ctr5f/Ht41sv9yOQdaqYN4DnG8Igfc?=
 =?us-ascii?Q?EUbc+gF8+k7pvHkfCMtfB3TosuYeTd3XtSIy652LW39Qh8hvHDQyqeWDH9AW?=
 =?us-ascii?Q?RefgBzq7MVWkkksg+826c4u+joim+psYWmdE7WnHdDe3cD71JE98?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c38e5-b002-499e-8ed6-08de6024f963
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:25.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OH+2LlmzDyLSVGJ0Of4bTJAl3iZ/3MTcOOvuSNhSoh7dFwTnLVlGyLVhNJgZIBH+PdplJdDLmz2BqEw9MGNDYOdqopj8G/NnUd1MXDdGFlnDBUnC4JaUgqntqB3+SKoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13818
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,164a0000:email,glider.be:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,0.251.119.0:email]
X-Rspamd-Queue-Id: 3C18CBD1F2
X-Rspamd-Action: no action

Add vspd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed vspd0 and vspd1 patches into a single patch.
 - Collected tags.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c90a778250d6..d4db44b6ccf7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1455,6 +1455,34 @@ fcpvd1: fcp@164a0000 {
 			resets = <&cpg 0x11e>;
 			power-domains = <&cpg>;
 		};
+
+		vspd0: vsp@16480000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@164b0000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x164b0000 0 0x10000>;
+			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd1>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

