Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLvwC+bpfGmYPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D0BD11C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A288825B;
	Fri, 30 Jan 2026 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e3aoUBYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305A310EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDN/4spsh82BLFx0KrHsjpFgF8Wc+JQ3qU3ZV8Eadz3/hbdDkAogubTVWICClbIO9TTxZ8T9D2T10R7oXwzPFWno2+TLKrr6FfH+iYEP8y1V0Imsntm1R4SqEeotoc9ESmfVdTZpi/iuUdSqRzyWCSr7npcA0GOMoRaQWYS1PysiU9awKdDPVmkCUvWkjInijB1C5G9a+Niv92s0i7bQfum8dhtZAfxyWJQ7AIB0oOQAZ4BVDPiWUVTfBTuY8NpcGMRYonq5+TbwiaAQOCnj5JiZhvYXzNe1+/pyKNd3JxGixlTT/xnbAeH+IPUM/cGkHwlUjlDr1R9Ue7Dc0Q69cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyZR3fLb9LCn/9JqzkMsOERX/+iD0rwGLR/R/2exoAE=;
 b=QtIdpBGecEahpMRgPkeCamqfDOHexPMzQgicYJ13zUg8QltLFPuT0lEgznUhj5VG5C+pwrE0i7JFpT3uAvJF8/xMPcPcum/WO3FZYAn/Kpm6IZTKQ66njCIRZBWMdRK9t4f+YjMLG842LxV6v3cizanKiQHmEWOkySgq2NCkKwjMSvr+eSOyGrB+eRMgIqt+4GqIWazrK/4ICeZGZfpqkwtHu18ivVHD+s4DvKD+rf4z5fnRbBQOcnOM7MjmaWABAS52YRawNI4Z7TCLa4KvjWcQMpTsu0C5yRySbHXMwQlkg0rtcnF2LyQvRWYPuSGoJXExNfkhDjq6mtdm9TQhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyZR3fLb9LCn/9JqzkMsOERX/+iD0rwGLR/R/2exoAE=;
 b=e3aoUBYJlMX83hwcRja6sYO1QMVSJM8jcEAEgjdFSjkriKkjKblGHiuS9t4z3Rtgj7cJs+1kz7l7yr0yJ8X1Wa0N5EP/BF1PI3gc2Sd+deXUrxwt9iVKpMaCLika67ezZ9SbuC2gtHQLGJlUZrr0ift8FILtWd7YZaMDH67evLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:57 +0000
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
Subject: [PATCH v2 07/20] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
Date: Fri, 30 Jan 2026 18:25:04 +0100
Message-ID: <efce106d1692c1ea99b1fd675d4e9e4f7ef3144b.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b80e09bd-d616-419a-dccb-08de6024c49d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VPSOaXb4iCUPB6Aba6Z12eQjtCXkhTcWOy1TiXnhEYCE0vwGfTsHzbco7BeQ?=
 =?us-ascii?Q?YCuvE8tmThb+V/E3BRie+MGBmYDiXMWrPE6ctRX5XN9h4uW771BwEmBqWQcU?=
 =?us-ascii?Q?Xa7s0dvZcN7+Awsq28fz1Z/7OflRAQr2D6OhNkf+xwEaPuDgx00Wd5KFH+Br?=
 =?us-ascii?Q?ZlvNLqfUDcrqwGV2ZAF0bN1PsP+Hnp5l1KDwpwd/xDGofpZuQFe5Gd/51gGZ?=
 =?us-ascii?Q?Q7L4QD0IMJPDCkaLhJXPl2Z6AodD/LvrxjGGGaLjInxZ+P256YkDNFqGaSdp?=
 =?us-ascii?Q?jihrupcl/lT5AuUJtVqETazYvLyVR1H+TSMJk2m+PUncNmdll+09gX+u7Uzk?=
 =?us-ascii?Q?23ogo8euflxYyR1+JfpIGLmaS8q7zOQT0/leS9pCkxGEcFBnIcIabyQ4sKiT?=
 =?us-ascii?Q?ka4mE7Yq6cCvbDennwZ9vXgOnYux4a9uymepVsVr+44lzkTYybvpdpw4lZvn?=
 =?us-ascii?Q?k0qKtr4FWBD/iqx0ETsiMZs9dflHmd+X8oB8b7g1fk1ha9IuQIsGnudEyfYO?=
 =?us-ascii?Q?rRo4pmp0B2HVJrjFcMpapFFpP5Bz887xPEWRwX2samtJyK3AGka/Ee1RnCoF?=
 =?us-ascii?Q?Rd4RBWouIb5okP27jU9ADl6EMgzE/XZHdh9iwzlE81LQXsnIxh22zSC+fPHt?=
 =?us-ascii?Q?NBTLNKRfmj9FICWB1n0geqU0dHxc5p+zUDWHBF+8O88y1JQiktkewwb4Q2v3?=
 =?us-ascii?Q?XNCyFOybQbTlqWcKrlg4i4AvdKC+8ofjri31sMRM3PNz3nRMAXcODqFVOpm8?=
 =?us-ascii?Q?LPQ2iGpeks+z8OUBCon/VVRv4FMoaSg1A7N4aaGjJRG5i/ONxO+K76Mqe1HW?=
 =?us-ascii?Q?+D9XSGm04xFLneU2a2vdp9JohGi6iE6/V83/Rpdf8LG/1daqFbAUy3C/Ms9R?=
 =?us-ascii?Q?tZbt1xXn8ZBV/UKslSIzB0R6u3rnPXuCOlJza9/o15bXno3I6VRDkN+kDIvk?=
 =?us-ascii?Q?NDsTec1nSX4koRJRJK7YdRh5dDC3OxNV9acQC6Qa1O5NOHcMnACHtAPBrEY0?=
 =?us-ascii?Q?aW36477t2LVMz3uyhBQl0U7eYwgd1GqT9h855G73vfKLcAafCih6TYpRBFaV?=
 =?us-ascii?Q?FComC0asR7PFLoV+v62XrdxOKeALZGmCWyq8/4jkglxZUXQTQOgTLH4gFSiO?=
 =?us-ascii?Q?RZ/n4BJXiGTa0rvnxdczyHmeNPMZIXT9VBdNpLd2YQbqvebgLVsH00EbIQDI?=
 =?us-ascii?Q?Vxoq3kMlm8WCa6E32yiAcSHF7Vjd8Ys/5yy0JfwEnMDfmZVpLYuM9Xi0Dkq7?=
 =?us-ascii?Q?7Vb8jdd2jqGaHI1SV1FmSGAuTpvRFrlWivtv27YrxFv6CJwEgTFXxQbHAqTj?=
 =?us-ascii?Q?QpniRZmWfbVDmdg1yQ/ncqWT0mfE/PiIYy7bU8uf3ph9bhFfAlSwWX0LUI12?=
 =?us-ascii?Q?Vi9X7HeqhSeGpYIZWfV+siSa79EKXyRaGDYPZ1EFbJOOwRgkIvneLrp7cBkU?=
 =?us-ascii?Q?tuE+Vqw3szOUQAeicHk+pDEWpZkuJGiLEA56+mHHEG4lCkiumnImczDanxjZ?=
 =?us-ascii?Q?Iz5sUjT7nd3f/fb2OvyHjxg4h83k70Y0Ollb50EdLmtwV7m/T0jIurdaHEEb?=
 =?us-ascii?Q?lEoF3GUymV60a9oUrSQWeTWykUGJryUbEumJhFgHuQnj3nFU1WSQ7CkOjcPH?=
 =?us-ascii?Q?tNNYGf1cixqo0CxqLnAVuR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JwjQ4+ahycuWJz3N7GA8CgrYlGICcJw7zeLSGDfCl6OktPiEF0FsYXCLW74O?=
 =?us-ascii?Q?d/I+RI+kMXGMpOsLHVPFvSRo7CcUQLGsobmPNLHuEPA8N2TkIydL6Ll9DSe+?=
 =?us-ascii?Q?lCeFvTWxowqIe0XMuHOVfwTqGG+izTzWmOgOexCBLtQzQCJl51r8BlasyQ8q?=
 =?us-ascii?Q?vy5V2APIBICgIhc2Vb/ogI6e2mTpX0rdLxJDFD/9brH4txHQT6iuP5okiC/S?=
 =?us-ascii?Q?K+UQA7T3UPGwCeZAYQE2lrqg2DJZB6pE4QNVvqjxSlL1ycBF0IrXFdAUKDum?=
 =?us-ascii?Q?3VdY/EtFG0CuUdGhIYWDfwLwDsB0ev9tMSQfauMpA8vnks8jidW6kbsQqjY3?=
 =?us-ascii?Q?lj1t6vMwDsUu4R9q7qgraCmclFTt3xv/9d6TSyGtzNQMehiPqa6xmlufBU7E?=
 =?us-ascii?Q?0OPTv7GSAUheF/omFPVlTuyvSSuvB+Bw8+9oDR/zTCbCgOc87WwWvjGk/WQh?=
 =?us-ascii?Q?8PwzzM09PRPdlG4ZslbBUgcnTLlPQvwp2krPNArJqzcURuAbOoeaM0Y9j5oO?=
 =?us-ascii?Q?lKh3SnDvD34RuMBQE1NuNM+DREgeHkdIDWvvmVDIoiuIfC8l1tA0H8TBKIkP?=
 =?us-ascii?Q?wCULDmDsNAFxfnDnaZbCO974IJYroQgSHilcWlGvIQsQlz9en1vR4NSOExz3?=
 =?us-ascii?Q?jrCThLXh9NyybtYObkmTiiHsAKSuoeDEhW7YplybSM5lcdPElvC6NCcosPIF?=
 =?us-ascii?Q?enYCJHnoWi1w/kMZOKqhKJI10eT5hube9ZEXTnefzgAdJJbTEUlExeQxm1jV?=
 =?us-ascii?Q?d3JUW2TuQz5c9XezSg7p/5XMfZ/Wf3IDxNlorEXTjNzijqFq/QptW5LmQu/j?=
 =?us-ascii?Q?wtvvNgh1EDZemWQtXFJ3OMd3mHVQr1e8SlCPux6L1rGNFxVttkZ4HKAzF+Pf?=
 =?us-ascii?Q?zGiXw14JOya0czwxm6AMIO79RYqejnhry8G5C5PIOT0EnlLKm8GwVck6Vlk/?=
 =?us-ascii?Q?QDHB6sKQyh6aOCYrtMLXSgltdCdLjgZ8iCWpXuLMNRJtweibNxzNM3bfZk+1?=
 =?us-ascii?Q?rNii391N4kqVldER9CgIXYcB+8bghuaqg600ezv3xXXB84sjEQR9cONYDOXz?=
 =?us-ascii?Q?rRRgYxpCwn7Ta0tmYo8S69WlypCD1x3paXYUamYu/VO3Zm65OzW7j6RCEiD2?=
 =?us-ascii?Q?0HNw3xXMHFqfSI8MrixmIZJvD2r1uB2+zdex8Z+5y0o14RA3KoejUz1IYNb1?=
 =?us-ascii?Q?QQpyjvukmdgSdfRbQp276Qm1d+MkkYUmN3IU9BCh79UZX4lrla92kENZsJS/?=
 =?us-ascii?Q?tbAAAzqF/p1O6dEjkdn/yzzNoi0rI16YQ70sB4RUxUj2kmxEYFe2DSEtDilJ?=
 =?us-ascii?Q?NqQwB36CHfiXqA3neBDb0Yw3bwDYJI8KygrFs8UU7CtlbfiBK1+Gp4CrLESF?=
 =?us-ascii?Q?AfBUn3bypLkr/FclwmLCjNkFpKOsf9JyyIYGUZEYhZVgl/dAe3pY92hrQ4sg?=
 =?us-ascii?Q?X96BdriXWJowSxwL+pcahny8YjknPEEuXFRpDRyfwmIwaOcBNscN7qJAI4T2?=
 =?us-ascii?Q?CZCub4hC+Q8KTDmyG/KY5nXSHHiquLST/IM81NUGRcm0cHknaqUXUn/dJcBG?=
 =?us-ascii?Q?aOcPKfkMdgcfLcCR7URUaVkF3kvzR13h4M7fZ8ntb+52lL+8aWbjx5i8+7VW?=
 =?us-ascii?Q?LcaUzd7fbcIExjhOrsgY+W8mS4lSSqsirh851Qh98Jux+6ouoibdGzV/5n3/?=
 =?us-ascii?Q?TfGNakW4PbPwciJ66VDR49qPqdgLnUE7ul2DVefqrdh43i2xNfMpieyBAmQy?=
 =?us-ascii?Q?9DINOEJB1d+v7q3qcZl/dBnC7idDZIIFB+vgnxLr4Dc+ybk2LOJm?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80e09bd-d616-419a-dccb-08de6024c49d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:57.0520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMyX/SsrrxFhXPeVLCfrPBZcQ5+bn2c0JaUlXyKNb1CDu/rBAnC92kpr3KK0J7U9RBoVgdZX503JJ0MvON3KUv8JSLfXHJqa2/pd0HFWaWM4bYDSyWNs0ilnAAbGrnRE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D61D0BD11C
X-Rspamd-Action: no action

Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
to enable proper initialization and control of the DSI hardware.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.
 - Fixed "dsi_0_vclk2" position to match order.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e10e6ff52f8..596349fe6132 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -486,6 +486,16 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
 						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_vclk1",			CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -494,6 +504,8 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -562,6 +574,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
-- 
2.43.0

