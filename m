Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJLdCvjpfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F05BD140
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C526810E19F;
	Fri, 30 Jan 2026 17:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V01V+g7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDF310EA15
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHdS8qoSKMSMr3fDutjFr7WjtrHQGeek6ea7PaGlv+rotIg/aB0x3U8wO4CW2NJATOC3uElHw8Y4Cpkjcw7TfWg27DJBh7d3yAz7FX3qybqkCkZrjky0Otu+rj856yTl6mu542ZuXFf7Vh6+KtgJVbp+rRDMmIoA27s+ts3rpE9PD4cBSzGOlmFN+5nLHXEqbZApcJwh16w8pNe36uO8Ylb1HnHR8pnqC7NRkvklPi8Uhc0b/8/Bp1wxfJm/MwlALPZDbcN+vGDCUEye1x57dEiX4gnyFBq3tegjd8rYXLbRK4G8tcpB+QgOHLlP/tnN7/59fmZWrqKxPUpNwObpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BMJbhzdEPT0kgm5iP8eYvxL0vmYzRoSQxXHwQkoXFA=;
 b=k3TlObdE26h/USaHaScfRE4JbiJ6KamoViJrUe2hnbf6OkC2CfN87W51zr3/21EuDTvSssgzsUb50WwQ9Ao8GiVAoEau4h84vs8fYU4KGFDVLiAvlWjMUMwoJ/eHNO8aCEQRv0ywNgIf+rzGq12ZimO5UZJYXKJdnpqaAbHNXbEjIIMFD25NYejksksVnNACrAMYXsMD8lN81DqNmOAeb6tdyf0fTsTeAepZm9p7KdqHlVJKKFFS9xGY7yPq5UBasI72sRY0nPUe/leAVEBZRYHH+TZuLOtuzmje29NC+XvF/Nz+fjUq9wWbLp3QB2saEZvJCBkdjBHIHw8f1sXELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BMJbhzdEPT0kgm5iP8eYvxL0vmYzRoSQxXHwQkoXFA=;
 b=V01V+g7n7a1n4QW1FYOF0qALU4Vcc29eBALALvF9f8NPYPXFJB7XczT2owo7wq1hcBLxipWgdf895Av/vdM0+CYyCKMAYjEE6a3X+WIg4bDqshV0WPin2y03Wc0dSZW9ac56FJxe6sF0Y6Lf7VnUlkzxv2AN4imxRYEXvV1TonQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:13 +0000
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
Subject: [PATCH v2 09/20] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/G3E SoC
Date: Fri, 30 Jan 2026 18:25:06 +0100
Message-ID: <e2fe2bff5acbd17f1dc618606c8def4f8d013a1e.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: 20aa37a8-a7c4-4d25-f17c-08de6024ce36
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cttOWOXlPb6ohceDEB9k678RJfvKMd4shK5YPaUxK8Qcl/qWbAlKAPRcuRKv?=
 =?us-ascii?Q?mKeVeP3l2gcQCkc5mxXW6WmdUP1SZLiUx4JsGyxVMRziRDH1f2PoqyA0otT5?=
 =?us-ascii?Q?0TWlpEVoy08dBch95f8TjcIdRml4q4TDVkF8NKbwl2OnvUgFQm197FS/DePi?=
 =?us-ascii?Q?6S916Z3Qh8JSh93crLWkIc6NRTow1jX7s5cmduhcGtz2izuuEtVkI5sqTVIy?=
 =?us-ascii?Q?l4EalyMbx/ygFjZ7HJqg8SIex38Mcikb2dDuk6DKISXU66FW3PbtghbISGv4?=
 =?us-ascii?Q?tx0c3xq+21oQY9CFyV5MtMIYuGzd8x1adAEUN7a9PVwwiRaUpo443QqOd4ZO?=
 =?us-ascii?Q?wQYzAuO39ca1To+p2iynLBflXuQ4t4mxKkGceTAQjykor6dCzfcJUXMVWq9k?=
 =?us-ascii?Q?aw8hkEMIpUjI+OR+Gb10M7A2lDxbYwsZi7ouNUvyaQ5h1nIoEAp55XCM0AIY?=
 =?us-ascii?Q?LXNdvTljyUqnfnCa7EF/31YRfYbS3ysC16qxp2u22LxCGGDzbN9k88iMKwc3?=
 =?us-ascii?Q?+z8kVTzXeS0PUoyKf7yG9q9FEJbsW+H6MUMBHJP3Q84k+iLDt9cZXzHDswC+?=
 =?us-ascii?Q?LE1MN5e5hKJUsaDuzN2j0peVBesyQTv/Izd2Ieajy0jNTflrZI8HBCFrUKoA?=
 =?us-ascii?Q?cpPv+OcUTvzyj6mdQTkAA955tvCIKasZigDx0yDEwyUMVs7BHIj3vzCcdquL?=
 =?us-ascii?Q?Y839EKPmU45fI6/AZF9ILk+nKTNrReuwTUaN1+owKqs4CwFEUfczhurFg0/E?=
 =?us-ascii?Q?VF1IuksQySR4FEBLlXBwnrhY6YHA/rUCHSxD80+3EFj8j202/ZfrJeDAiijM?=
 =?us-ascii?Q?5fMolMUS71UsLPfNseH/FQFa38JtSBYuZWKC3UQpnl3zn3cwXYkhn9x9wt96?=
 =?us-ascii?Q?qbbZFnny9uM5aOfG1MiScANpt3sd6+BMlPjMteXD6UJDtY7eSf+MlhEoAHtA?=
 =?us-ascii?Q?ktcawOPhWOPOefyephfz8dP51f2pfjMahbgLzui6d72Ew3bGn4dVRv+udUri?=
 =?us-ascii?Q?WnjYTM8R0jsAzvLlDyRHt3WfnI6i+JgS32n9Vvc11pwDAu9H5bjTnmgrkohl?=
 =?us-ascii?Q?TyzqIRsmoGiPMBuceEEnTGhHv/1QFCZ2MoHtZYBcS1x/3fDeQ3sG92sxk1Km?=
 =?us-ascii?Q?eCINHaTGoqJ3rMl7hbxU1rjEMOLqpfJMdmj7/tX2QzWPexgqAPP8COqlr2fY?=
 =?us-ascii?Q?mRTsjRX2LyUmsClaVQrZBPqXZle2KfShsnhrbmeAsBe4eEgWHjAy0zz/boN6?=
 =?us-ascii?Q?KnP5IJUCOYioBEdPsp34rPwmcxMzz55lLCvQtU1ACSikn0RCzf3QOtaZTlf6?=
 =?us-ascii?Q?I9YqLGWXU4VXoilnwYi2W/GbaXV3GOCyqFMOYpYZukOuK7DbxqauXh0MR4gZ?=
 =?us-ascii?Q?c04wxBEbWHzoA1tNC1WttUsI2VBv5k/JVYd6gwDGvHBYdq8kuaIJmjfuKhJD?=
 =?us-ascii?Q?7qaStlrGenuT2hKUGHBzx/S1qZrUN9wEeW8+ObyXzReznjhiySxNQhgvAlJm?=
 =?us-ascii?Q?KkFQS0AwkuYj2F/Vw/LpcptpbskX00U6gjV/QzGiRBUH+tvQ+PTf1zZjaVsD?=
 =?us-ascii?Q?QbkHV75aZS3hHzM8n+7BdbawTTlZELPe7fZ3dhQJ6ygOfZjEwu6YmeGFslx8?=
 =?us-ascii?Q?LA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7jGQAIka/EIrIF7wU7woD/xqYPTeFb8bx6UzaVGghV5yisMhhYWOcnJhoqMI?=
 =?us-ascii?Q?zgZiGKx9KxItdKZuLhkR+yQUVMUuUdTK9Jn3S5JKPbZplFAhJGCwjTxQOpGj?=
 =?us-ascii?Q?GoVIAQf8QbD+x9PFPoAAh9DkiL/zAVoow+gXAR9iekmdEwqSD6EqOl3VkV2C?=
 =?us-ascii?Q?+ChdN8cZ7zULFKiwa20gnfKTRd1T5MZ7zfIJEhK377jIV0+fwPRhR7Lu90et?=
 =?us-ascii?Q?mP7xoCVKORYjviBY0w+8cJwRaCu/wBgvWdesinbHr5lBjqjwOtwV9u0A7gIU?=
 =?us-ascii?Q?u7EyU5C0UwSUg+5tt5fI+Qn13TmozgVHuNt4XSKjZlJJbvbmDf/O9zBZhjaL?=
 =?us-ascii?Q?gwys/TiTcHL6Bod70QYJpAqELL9PDxLm1RGKJAJPecoeGv20DnW78SWmP52C?=
 =?us-ascii?Q?PjOhy8+IeOgt7uOckkidIL0iyz8FwWxR+wu7Jws7ltHpp66/dVn+6iNpRIuQ?=
 =?us-ascii?Q?jDWY+bXmncfUhiOoblBC2lukhoRbF49rdLRMR1KA2wMagxReAO5txZ64XI+Y?=
 =?us-ascii?Q?ytXzFMiUjCMXkjFIGcE5lLyZqyWLXgdhmCfABdbkJcoFNk2EsC2/gJ2qawp9?=
 =?us-ascii?Q?mmIqTzsZZR8png4Q2EOM4wvwMZIqy58WFQWVztToL9ZGA/f/01WAECOtDKRJ?=
 =?us-ascii?Q?mBk2NwVnz7nApn8w3H8+8Qs1TGRJ62vea9ra4EFebR+u6Cz3LAyIZ0Za8lOG?=
 =?us-ascii?Q?w3xFGMs6xcwCzp7T6axsMV6fDsBnWmUXk8BXOaXcf9YXqhzVHgp5QRG/zJzH?=
 =?us-ascii?Q?M7vPWqzWHtf3uTdC86mtBPd7W4smuCBJHvGrHbhFWwQPHBeWY75rbJv2PYCK?=
 =?us-ascii?Q?ncRQC0gSq8fA6M64TQskzzxHIdf91ksy00IRVf+clmr1q9pmIiJgbsErsi/d?=
 =?us-ascii?Q?gj5ZzG/wsBLpamyCKFjsWgQaUaOtlHp/o1xU6ZLF4aqo03ve5soDfEwv9Q52?=
 =?us-ascii?Q?J8wjQ5otdLdM36fFyzuT0zOvvh16oYl4Qkmm8mUe60gLfPVkvC1dgqE//y/p?=
 =?us-ascii?Q?8444BOBOJeY5l/s2a5BoIPKGOk3DKvAQeTUIVfxBJtjf9JTuGsIisGNpKE6J?=
 =?us-ascii?Q?cMxmc9+vTz/lyzn5r/qk4Y80YcvMvyEyt/CzSSGMdde6extqOkEgKANajaVf?=
 =?us-ascii?Q?/WxCJm6yXiVmbDSViO905uAyRpAmA7xWRtgKjl5mkOtLTGFGaISYoXmVXVhe?=
 =?us-ascii?Q?pJaq3N6wXt+FxeqnbAZRtXbjyKlYdF79JGKM84DhyMmfUIXCMQXzTEm2r38A?=
 =?us-ascii?Q?c7BYbWO8dBbo+lo0IPZd0cLTxQRR+pAOCrtoMiERIaH38Z0xOg7byR9H65ro?=
 =?us-ascii?Q?PV777ELjErmpsfpi6iil9qvVYh1QAyZ95I0QKt6dnZJWQ1JP7Ed6sK5muauH?=
 =?us-ascii?Q?Tx8mvP+hK1E06xoBC/ATAjgJ5FDT9nQlEjqTdWgmSOoNtjAwpZNJ8Keowoxt?=
 =?us-ascii?Q?5bWKCbnakBNc1cGwT98Rt4qgpWdNyBgRnJHqVbrpfQpWrJi0kgIcpCY6CMqy?=
 =?us-ascii?Q?yfhSlIGbIa0mZsE5at+sdxxaNzO0sFRNP+GdO+/n96ininli4AS7dhYzAurg?=
 =?us-ascii?Q?ydtSE//kmK9C3KlOYPt5MEVw9TGb53YvrgSH807cqEgoNjcruNWNMaRUW3FO?=
 =?us-ascii?Q?0GLIWwUlW9tF9aJE/nQ9heGiKJwp2X7pj1nrIrXbCEV7XY2a7G8nW721omw/?=
 =?us-ascii?Q?/BVM2CJMzMmELSkbz6umySwLpE8joSsKqY+a73WddB4KoPNp60nNxNS/Ost7?=
 =?us-ascii?Q?cXLPpyDxbW2p+mLIYEXrE9ELr8YCGKfGPcpZZP00oabsItZm8CUK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20aa37a8-a7c4-4d25-f17c-08de6024ce36
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:13.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmJhcfev7V2R2MOLFDUvh0oeqiWmjZWKc+VKEIiJ8tx2ByPmKlUL0aPs9jo8WBhspQsw0Mi9DwdgGVElY8bjo19gM0oaQszgtMpTaH9Brs7UAkHjB7vtV84bTJDBFaxI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,bp.renesas.com:mid,0.0.0.3:email]
X-Rspamd-Queue-Id: 91F05BD140
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Add new SoC-specific compatible string 'renesas,r9a09g047-du'.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Updated commit message accordingly.

 .../bindings/display/renesas,rzg2l-du.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..55e3fcff7030 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g047-du # RZ/G3E
           - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
@@ -53,6 +54,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  renesas,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      DU instance number.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -137,6 +144,53 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du
+    then:
+      required:
+        - renesas,id
+      if:
+        properties:
+          renesas,id:
+            const: 0
+      then:
+        properties:
+          ports:
+            properties:
+              port@0:
+                description: DSI
+              port@1:
+                description: LVDS 0, Channel 0
+              port@2:
+                description: LVDS 0, Channel 1
+
+            required:
+              - port@0
+              - port@1
+              - port@2
+      else:
+        if:
+          properties:
+            renesas,id:
+              const: 1
+        then:
+          properties:
+            ports:
+              properties:
+                port@0:
+                  description: DSI
+                port@1:
+                  description: LVDS 1, Channel 0
+                port@3:
+                  description: DPAD
+
+              required:
+                - port@0
+                - port@1
+                - port@3
 
 examples:
   # RZ/G2L DU
-- 
2.43.0

