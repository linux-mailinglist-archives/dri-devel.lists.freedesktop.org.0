Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDGmFEH5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F3BDC79
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216C610E0A4;
	Fri, 30 Jan 2026 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u6v1ym3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7D10EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6fTxJB3TyQi21DWxl5GxFB8baMAzKOaTGLr6JvQL8nAelQo2zUpJOU4xC2MPaNPB6LATqoZ407dKMpluzWJpH8weYzJ1QnTKXMyIOV6CGKDpWO98tTQdgj+ZiwMSGeRHYNl/fOCg4LBZapHQRIzYZDWE4jvEcmvB4jg6uIrAeN4xQ8L04uj0dVwq71/tEYVgIruDrlCzU9ClQqi6UsLS7+lks0K9XN2Cq20k6qMdx1pA/ywWwyJd4Nr5sTK/OPztX3OOYXgu/2s9VsLCvSRdOTs9LIbj/deFkN355WFeXQcwaIPCXy5p8CUmLkTgipFsE5GbjZsPdlSdPl7VIis3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tMrGsSHOOv0Z9px28hpN/muC0oq7g1zyqoTe5gxSgQ=;
 b=PIhkBy5Ao+V71KwdVjp59eKFzc3GspI64wFnjfMuTyCylkdpIh8d+PTb6n9tvAWTx6PEIT/X1+ltrvqUEOW6YOGJRdrD8xiH+qtDuPMi8jWL4vXhVbEZOXqXZVUGgkpVYaA2dvI/J7VdwBNbu8EzfHgYBX3ZuCOm2f5LvL7hvl83o5nVi5efdO1mRLn4trxw3WOsBrV/Qe+7NCvxNercuoq/YNb9ddGURNkPD7Nmq8w6nQiitCde9aicSKvy76BYl9F05wub2HyDMSs3cZXrBbceBL/cfjcNkyVDOweKy3F5h87G9uh/nc7Q+Doelotd4QOvrrmpFUGB9FWB6xKraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tMrGsSHOOv0Z9px28hpN/muC0oq7g1zyqoTe5gxSgQ=;
 b=u6v1ym3nOD9i0xK3++0SR18OpPr5eOuiEbTp/6S+eQTBEjy5rQ6aF9YLPPcGbmDgMo4LdZJkP6D3TNzzLzuSaX1IUDYLM1RKklBmnO1nWIkm9fsX8t3H/FVMq+zJ1uMiXE6EfpBuirV+IsS95+UiLTqNiYVpgUAJ3+AyE6qm6AE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:32:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:27 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 14/20] drm: renesas: rz-du: Add RZ/G3E support
Date: Fri, 30 Jan 2026 19:30:06 +0100
Message-ID: <6c1ba4e052425cb0d8648138764a82e875d4b4d9.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c227c9b-2e9a-42d5-210e-08de602deb1a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uCutuizOTgiQqIsa6aRLvuic/SaanTi+W9NGhVoKM77d6BWwfd3aAtJnhyaj?=
 =?us-ascii?Q?gslEhdEFc6L6hO6d83v9LJfLhp0hJ1WwDLm56/RA1McrdXroXiDMezrGhSe/?=
 =?us-ascii?Q?M+PKY3C8aPJvvRgH0GW51RX/tbFyVHgKQKAsdfm0Sdvo7YwF8pe4Pvp5EA2i?=
 =?us-ascii?Q?kOIEzmhe5gM8bDofCLe9j0YWG+z0JQ2Hk0lPvCIPBlmg1lht1kW+OcbGusc1?=
 =?us-ascii?Q?E84Y4Jjsp17xtZ9gCDIBQht7QlIjvRMNLtS6Me7ADdKrSiVHQogzR8I0emN2?=
 =?us-ascii?Q?9RBf1UpIj6gLljqvOfVDz3Ai1JgZEUsf2pZ04jFLUgu5t7b6nRoX9fCwStrd?=
 =?us-ascii?Q?HsjNymvHbCevrzrlLe6c9KFdgVOAKcGy6PGDhpqpSeMrPFTegYVUBuwH9kcV?=
 =?us-ascii?Q?Y4qqYTkkK337gXS+erw/AOCZigR8+jkmcrkiQWFX3nzmTO5LP6gDKcfJinRy?=
 =?us-ascii?Q?5jxNwa5AIFQO1T2YMOGMbk1IcYUXnO9O9o3TdRFh4NwDQXB9E6BewVV3mWyk?=
 =?us-ascii?Q?YirWS+M5rrbRsXNoZG1ryozzEYXh7TncTld4grnUZ/vm76zHOiAnmGkzOD5d?=
 =?us-ascii?Q?FkgFfClpphrn0T1lwSf9to4iCDuA6O4aPczdTBQAiwIwMwsvHioX28SNAXmX?=
 =?us-ascii?Q?kq3i1dQZOlazEQ4etdVXTYt/j4BdlEwRd4I10NDPCS0yGy67N+S/wr8dxq5j?=
 =?us-ascii?Q?lTNF4S7ampcIHpVu844ULTGm4Yc0EOlpGy/fVFrV4SGknvXAIujjnmb6a3B8?=
 =?us-ascii?Q?QsLe7TW6HHhwaKZpATm8M8e63B9TyQQAzgLnyiDofbQk03BxUwydIqGt04Y/?=
 =?us-ascii?Q?AhoZXtr5AWAnOaQIkFhhVNGWYG06Cj88BWmMX0UgplNKoIjdFH1/Zok+K+EL?=
 =?us-ascii?Q?U6TbQp+wQhqKquOvD5x98gouurfBXWTV0w7B6yLPOwG7zewTiuNu0/BRpvla?=
 =?us-ascii?Q?aAZMRcFVTgFjs5JJoCvgit37tMv69TFZHQ6u5sBQxglsZcc2SXqOz3Dzqhoj?=
 =?us-ascii?Q?lcdXy1OBXGw1JPhHf3bPxgdH7SMEmNOIa4y+YhIsKh63j8YNrnZ/Er2IVX7w?=
 =?us-ascii?Q?VuezOSHmh40gb5K0r3NVKa0TvBvp1yEyBTHXUryfv2GCvBKQfrpn51y0J4w3?=
 =?us-ascii?Q?VCFStnPRdDE4Z5cKxBBsI5dVRt3EtV2hZBJZ1SGj6LmuRWPASN0jDU5PLww2?=
 =?us-ascii?Q?HUGMValAB1K1gKknMzzVyMRatv+2OCRV3+iojXTy3FHrw3nySm1HxFzyJ8q0?=
 =?us-ascii?Q?dtSGNya3npUykBJ2ZXrefq5Pcqc6pEiiH3WlBCudjHzHQjpj3NDV7cEL6Dma?=
 =?us-ascii?Q?4wgVC11etVwgVBcbQkVySn1Aqz7o1ctJ98Y/YnJwbgeZCjmoItslBrHUh2H7?=
 =?us-ascii?Q?0EIGuUcifGsdAzBUULwD/e/oDjGSjsCBdZ4qYLhYteG5+ILsFG3z90Dr7KD2?=
 =?us-ascii?Q?ofS05jbEgcTK6s2OjrTDwhO2CQQdOfgNiR4epyFFMNBlOZNdlrvKUgQ2Damq?=
 =?us-ascii?Q?dV9qvExZ0py5z1ZF/3Rr3ptipaWUWrag12iLcoiM2yHAXN+v0ri036O0HxIG?=
 =?us-ascii?Q?BHiJvliV1tS5SADz1G6oE2Jsrts7FTDAisjZp4oqomygeySKIFv1t8KKbtwx?=
 =?us-ascii?Q?yLKL92ZqxyuOxFCJXFT8CqA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H1LiSyIXHsFkxia2NcBgjqacPzDcdCLciJz6kfLrKV39P0YtlnI2NtQHMofe?=
 =?us-ascii?Q?VnVEqewzRiIzhCkJEsCxrtGASalwVHr/pi7vF4WpTxAtNw+2K++IwqK2+61V?=
 =?us-ascii?Q?5Zxf81uUywtRNMlQCFI13CyDE2H8Bd6Wif8w5qMaPsdXh1z1RaPRXdJApX0q?=
 =?us-ascii?Q?s1ReSh46zg8k6IwmVhSO6oiR17GNtUFKusWprZh3LFfLxFjU0GJROy5lLoA5?=
 =?us-ascii?Q?AjmDTPx9xyBIaBww05gDnu+SxJjYE89Z8eiOSeL8v3sa6ILEjhX8zIqhuLh2?=
 =?us-ascii?Q?Qyd7TEpY0SFuZ17+VOyLGqfdWpRzFQEwgK9w1GBjntSY3dlrTP0o3rAOa9iQ?=
 =?us-ascii?Q?xvmyn0ST0S5rjMcdU9kCLpP1MgCDtvmgqwjvjAXEWrR5eaBGjuyHTBQS+ipu?=
 =?us-ascii?Q?d77uCO5NY99ztDEkZYHUJwZnSdtJILwXZSZaPhxLlVZQkX7n1OHiTf4kXJBO?=
 =?us-ascii?Q?+eXSddbiNhrj2OkdMpoHMpzsWR45aANj95n4bkN3Kp1xon71/RTnUJVQACXm?=
 =?us-ascii?Q?qDyjs1ZRsXAVqzQDLVxqKS5Zn950AK8QWxtyoZPbaGv8zRBImMGhmMugG9ke?=
 =?us-ascii?Q?j1cF9+ISwVokiC08JOzXvjLGJ7EdCG07XkFGoyghsWfM3CK3QqQYeb8Me1B9?=
 =?us-ascii?Q?ce7vaBMqrERGbibXvvhGBw2fw4QNo16c3r4GPfojL0p6c25Vg+wvq1tCicTZ?=
 =?us-ascii?Q?QTofzGatUB3SWhi7L2HW8fciM9je5w0e2HL+9t4bQ0vDAPGo0oGve9w3Hk2U?=
 =?us-ascii?Q?wCTi3yi47J9+ZEItxkPf4EiaEQNWzx4sJYnxwEbWbpzXqH9GjM4CHUpNS9vZ?=
 =?us-ascii?Q?B/CakeX5J+jbkOxzOtozRbrPEZbVaFQSt4WUf+AD++fVqdW7gIfZFUCjK+JC?=
 =?us-ascii?Q?Gpp8xd84bXPF9mLZSWZNTtvCPuPyl/Y22IMYId1q21c/RW4ps/j0hKIMN2uG?=
 =?us-ascii?Q?MrwdQsDGqvuVaUHw35kOSUdubJjNb4/sVH58FKGlQL8v0Nrxto4byIWlONQR?=
 =?us-ascii?Q?XqWjEK/qvNMZaaqTUaJH3DvhLq5VOkRE0Y7typ3PYjw+JG4QIsHsmIoY0LHI?=
 =?us-ascii?Q?JoQjNgmSWwgWuSeBTdmEzKTyV+uKj5oGucXcy5znehNb0Nho5WWzQA97aSvn?=
 =?us-ascii?Q?QIgYW16Ee/FYo/5ydylHHp/ax7U7r3vhoP7DwxZ48KjQYQkL3NC6QaCYpM+G?=
 =?us-ascii?Q?0JIXEQE9GQNdbIJt6zEnYDl38GIq0w/tJ8EphPPoDdeAoMBPGNjAFJrl0PRL?=
 =?us-ascii?Q?s1ln533bVUNC27+wH+dVMSK6F9k+XBP2j4rGu9UjsC3k48hTkAboHaGybGAd?=
 =?us-ascii?Q?0X/0ifd65GVgJ3bBZ2wy4YG9Jujv+SGZ2jGKf59Ixtn0x74SlmdWIjkqdmmM?=
 =?us-ascii?Q?VFVoRuBthedmYEg0Eb33AW4vl/aQ1rB2T968K0rAjAtMdXfL7WySL0LyxjJR?=
 =?us-ascii?Q?HWak5LrkXGQK3eYpbPHdGSf7IjnAtt9Tb1POymvyTycjIZXzi1rimwziK86S?=
 =?us-ascii?Q?+Jul16+GGGaqEtYWV2eztjfxeX8Ji5R38Gwu6VpaJqmn8WX4eiMPwACoZLES?=
 =?us-ascii?Q?Ev6uLk/cwSHSzK6PS5efQ0HsK7d3gXSeSAlZRw4d1MBwFk1y0Gj5xn+dGV7G?=
 =?us-ascii?Q?JMOrgBwPoyqp2Y6lSirsqFNAT1Sd2tPrh/Hsv0HLn8lNeEOkW8hDbD1YYgFv?=
 =?us-ascii?Q?hzw59riM5wQQNQy/a/WczXublRi3UVAdNKluijH1Y1fOd/3+zhODv/q+P/Su?=
 =?us-ascii?Q?5X3HBs5z+WZ5wHYQHRbMxZH92YRF4jdgp28ZaWBV3HLXOqdEVidu?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c227c9b-2e9a-42d5-210e-08de602deb1a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:27.0382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ftswx48FKKb9jVqp6r3M21wX07Ya+uOOf0TeeMFQp0ttvl0ZItIgW7IAsojTu3dVif6Dq+EaCRsU9bU1S4CA8L1DhRMHw65DbjwlHu84ChjoHVM33nf85NGaF9ThSks4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
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
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C60F3BDC79
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Depending on the selected output, the correct SMUX2 clock parent must be
chosen based on the requested duty cycle:

 - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
 - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)

To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
feature flag and extend the `rzg2l_du_device_info` structure to include a
features field. Also, add a new helper function `rzg2l_du_has()` to check
for feature flags.

Add support for the RZ/G3E SoC by introducing:
 - `rzg2l_du_r9a09g047_du_info` structure
 - The `renesas,r9a09g047-du` compatible string

Additionally, introduce the missing output definitions
`RZG2L_DU_OUTPUT_LVDS{0,1}`.

Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
the CRTC output to the DU outputs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Instead of using clk-provider API to select the right parent clock,
   based on the outputs. Just set the correct duty cycle based on the
   output, this reflects at CPG lvl to select the right parent.
 - Updated commit message accordingly.

v2->v3:
 - No changes.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 +++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..c51ba4b8c383 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -64,11 +64,32 @@
 static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rzg2l_du_crtc_state *rstate =
+		to_rzg2l_crtc_state(rcrtc->crtc.state);
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
+
+	if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
+		struct clk *clk_parent;
+
+		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+		/*
+		 * Request appropriate duty cycle to let clock driver select
+		 * the correct parent:
+		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
+		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
+		 */
+		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
+		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
+			clk_set_duty_cycle(clk_parent, 4, 7);
+		else
+			clk_set_duty_cycle(clk_parent, 1, 2);
+	}
+
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
 
 	ditr0 = (DU_DITR0_DEMD_HIGH
@@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..84e6bf186f5d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
+	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 3,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_du_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
@@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
 		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
 	};
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..c6f9dc46ab31 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,8 +20,12 @@
 struct device;
 struct drm_property;
 
+#define RG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
+	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_DPAD0,
 	RZG2L_DU_OUTPUT_MAX,
 };
@@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  */
 struct rzg2l_du_device_info {
+	unsigned int features;
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 };
@@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.43.0

