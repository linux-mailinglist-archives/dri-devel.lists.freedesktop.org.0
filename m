Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIlyEW/5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB820BDCF7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E959310EA45;
	Fri, 30 Jan 2026 18:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HSsf8hZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8207610EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtkRDJIMlfa+54P3ol6I8b/fuWXDEjjnUdN17A3vhsqaTLkv4ENQmNUV7tgI7prw5s+MYz/BO9iGPnrPrftPuvEACRJ75imh8fXYDxBPXwMOjiXdz1v0lIvlQhlkqjSib010h908+CVcZIeAlFtO6Z6yEypcWr8JSz2KgWRvKMGIZZvU+O4BVbjW7eTQ5MJUJZ3PuoV21tz3gmY6zRuinWb49BpyuvtjiDLRC0U6uG4Lbu1CenLgamfWBQ5nostIbbW6AUyqLZPS2rM0km5witDTD5iRugsm3knkt6jjyQhLRoeaquoxbIrRPNTKgX26LGN1KRVfhQv1v28I1TXlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jRzfNzj0aaOUlm6jIjp5S1uXSASzDvciT9UiVU1vR0=;
 b=ItgiTTbRj9eGvWaLZJk4LGju/pciQoVgAqYRraYcqKJo/idkHWtbxGbYPXD6CIkIUKBVdL5Qu4Fva+OLe4QTinuQ9S49XkP03lhkJ3bxT6EGv4MJJ8EsprIreuMaqp6Gtzf2VUGyKZgrjpwM3JWeH0xUwbIhz3kaBsnYM2oqyaD8dLsG4+kSCGD3ySz2ANc/YxZ9M8SkmU1idJyY0qyuxdN5TWXlYg7chPLYzZUs4Hy+HznFJrtFi8N1YJ9htpzqviokdQDsfqK/dI3w9htXWxJOw8GdZz7Cx07ggxXO0bPkPJ8iBe4SOTpXd2rEbappiF2CoImII6fQSOxEAT10XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jRzfNzj0aaOUlm6jIjp5S1uXSASzDvciT9UiVU1vR0=;
 b=HSsf8hZsExhzoW2EqHw3v9AcHZORD9yXAveZLCyxlmOYGKX9+d2Nk/0xIpvnhMUT6tUkgM4vZ9ezfIKwS32w4ve5nAfM9GKgOJySMnQFEZzl2WNcWTXkUE8GDTgw+ewKvWHi/rS78ruh6hFLmBZ+RGieWHr33D2JOM5vQgAAMf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8547.jpnprd01.prod.outlook.com (2603:1096:604:18c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 18:33:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:33:13 +0000
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
Subject: [PATCH v3 20/20] arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1
 and DSI support
Date: Fri, 30 Jan 2026 19:30:12 +0100
Message-ID: <e6d022a133dd0eeee68a3585e908467d01b76a78.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcff615-a506-43f8-ee88-08de602e06aa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bSXwCyKh1XiWF6rN1+3ewHpOXr1KQmuqMZjS9cle68eU1svajFR3L7ihwDX8?=
 =?us-ascii?Q?uR0RH/WADbKSYv4anoxQ+jMrLhiDKB6kERjiUX1g+vyNSfLL+FDgV5r1yJP4?=
 =?us-ascii?Q?mGXiEXv9NXopZrwZwtxGh8h16wzXnOx6u5Lc18su7xFj5sfwzbl/n8bidcKt?=
 =?us-ascii?Q?uamHE6nlJH+79s/5qLs/KIvwTu85CLoI1VZmGWP4JUR7H9yUh2BRUcVN3kcW?=
 =?us-ascii?Q?3LOcfFy8oRMHLQ0kITAs56StYHkRk4DH3DIthibPqq7mmX7dOhy4XG8RYmzp?=
 =?us-ascii?Q?I5oQWJVryYfETsJBOPttnGN5oOgEuxxjQe3Ro3IPvyN5dPQObJ0NRQNW1656?=
 =?us-ascii?Q?2jA8txwntcfmKK63ixsl43eCJ92mvVUiRuwQFWaIhvUY1Z7ZJjs6bE8IBsKW?=
 =?us-ascii?Q?bTrRWyoKIAOmYFYeRQSP2Dlp3j/QfiW2qUurqdUIY5ahvqZ1bWMpgYyxuift?=
 =?us-ascii?Q?QzFwGyLdB36a6wJDjlxAZQzDVAhrrlDqjWtoVycAQbBC7Jx3VkeVWpwI5SXN?=
 =?us-ascii?Q?2ER21B9G56K7KRW6v8/2JPFUQ6QGu4Ohz7eXvDgT2fiMx1oS5++J81X5QThU?=
 =?us-ascii?Q?LtSsvHmydjgRqgdaODjbUgqJwXBAbaTJYxKDrJ0wSETSIuLncaGH3fkWyIQt?=
 =?us-ascii?Q?NIR+wOXhdgiwWGpdSs8tA4k/blfXDzWsgeOnxPi0hDuxYG+gzyFxg6JuoSmO?=
 =?us-ascii?Q?lpokxOkEv558u3TxHr5ZSmslhGQzH25oz4n2hdB+dh3Ap4LmXI/CdG6HbmD4?=
 =?us-ascii?Q?Vjv2vKyGuCyMSkaA5jOjOmfD7YJkUCFdg1QrX4Ys1H8yUuMsrKW6DjVnhbGO?=
 =?us-ascii?Q?D8WTr7IJGPYCol5hOEAxwaDjKwF6di0rbzcU7g4GzutJy9/2PgOUBI7NHrf9?=
 =?us-ascii?Q?667p5MAaiLVmFatVOlhyWd1ZS39S7mZZyXCO0+OZK8hpvZNnyrKbOLyAxvbf?=
 =?us-ascii?Q?H7uzMJrxlX1gL9SfVSKrJcnxCJhm0gCf3GSPq6t65fNerG9jLpQD/9J1BaVR?=
 =?us-ascii?Q?6FBA/twf/ddkRuYZXpN8CILYJ7kG1GxNoQ+GzitlpzWbzQfmXoJs0fHZzmBy?=
 =?us-ascii?Q?quDSHwE2Tec7jty75Fg9STLc2WeRb156X/elBKKE3UnzYmsCiHhnijF18gS/?=
 =?us-ascii?Q?ny9C6DNszCpJUL56pPHccaSPFfi6QgrHUe7spcnGKlEm7x8MJNOiN7C4z3LK?=
 =?us-ascii?Q?Nc0MDimtp2XQJt0UZrN64YMUcOMFtY3cmocPoFNx5nC/0+bM9bgJSGAvq1P1?=
 =?us-ascii?Q?gpyRyjeaITNCk+kpS934YzgIbqP8hDpxGl8jxXHnfsmRGsE0s+QQksyMrN7f?=
 =?us-ascii?Q?NnIvN1LUZLeEbdnx48vGmZkSfXbRQAlB2LfBczCZqn68V0buCXIQQD4kfhlQ?=
 =?us-ascii?Q?SFoQpICnN8SX1GgbLNRfuGYR9ZLpOoaDzEMD0N7uEfmxnSD9R7Cw8E+prOfi?=
 =?us-ascii?Q?sRX33ev/Y2S62os9zUWEOHlSOgMbpUViCvR0MD60qcf5AHcELsOojIUf2YyR?=
 =?us-ascii?Q?Vko6f7X9MlZmSyJDt5IScQTjwwvX10tIJERp2f/yp44Xb5C7RETJx1VdHhwx?=
 =?us-ascii?Q?YwagVTYA6CMIxbK5WKsAheut4AWbvP+jaEyyX3pRqO99efUvIlLU21Z1FLXT?=
 =?us-ascii?Q?9SCwe3Jo8Dm0gMw0sw+MXl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YN2Dga2Alb+gCSwcyMpI3luvHXd8l3LEgs8H6rHm99taWOVoMViE2ImqcgdC?=
 =?us-ascii?Q?YK2MgHMGdgYl8t4XLnB01VNOBFOVoHOy9xm/eSLtIJQQPl+M1OUs592xdRGn?=
 =?us-ascii?Q?RqEoR+GhsBSr9gJcIh6Rdraj5cG4UbNTQFrfHOPMoxnMlAewxcHPBeGfGS5W?=
 =?us-ascii?Q?Q8RnZcfSQ7VNEGTQeGPVNDb61ugrJf6/bSKumN9i54FG5WDGxIq3OusL1AXQ?=
 =?us-ascii?Q?bjwWW4nRXO3hIdm9igzakTJOy7X14ZDsFjDsdPQFhIccS7XbfRncI1NLK4yd?=
 =?us-ascii?Q?bZlOj8v19dodAA8isBgvo8WqNkSgF3DimcoOOgT+wMf07mG34vbRlx8zS8HA?=
 =?us-ascii?Q?Hzr+AJlQ0CE21SlqFTHc0dQJgkqf0tdELR6rLOK4J4Lg0UMG4WOIskUQ2Ep/?=
 =?us-ascii?Q?viVPxF8Zf8fFh865Zl4rriIrQnxHfEKeT0gafqVzmIsq/ORr4xqT4ux0QRhp?=
 =?us-ascii?Q?nxD8TUAixV/enC8Q8QZcOWzfAo2Bvx16KiN/bQLHYG7zJq9q6qwzExhJiMz7?=
 =?us-ascii?Q?Qub2XZa7k4fFEZLhqCPBArFYvC+QJF5KNkG35kZf6hy+K9yO7akZAxbaPbqI?=
 =?us-ascii?Q?e8fN4tbanyM5Iuaj+1aYMKIa0ZlnnSitbnfYvP70rm/bfy78iskz5KPeMxkn?=
 =?us-ascii?Q?NdmrMP1xWsKU6T2ITXZkYg1eZ0t3v0MZrynMK7WPYVTQqYE/9KTU8BH0Vz3C?=
 =?us-ascii?Q?yCiStJpS44TQVCo3kExasZ7T0p2S+7hlaflOMjs2d2NPE047YV1Mc2kAGiS2?=
 =?us-ascii?Q?F8p/4tkq6NwPKAjmdQW8P5lntwNi3vD4uqYKx3MxOWOyQgCvbH3PBuz9+ZnE?=
 =?us-ascii?Q?K1YRiZqG2Oi02VcJM+8lGjrr430LfA7vM5bVCr/UT/O0vIFM2bEgp3lerVy4?=
 =?us-ascii?Q?qRVoooxpC9ot4Urbk1gu7BugecVJ7kGq8QYua/R/iSrp+Ck/5pgVNDa7oBjp?=
 =?us-ascii?Q?YOJVfCYMHGPTZAqCycSXGMrtvY5Yfeeob1KI/2SilbOcogiR33hVem47UnuU?=
 =?us-ascii?Q?l4cHmJQSNx5/v3Jjz3MwWUgsh0xs8AjXVSSyBPPNM2Ijwila2KsPQYjHU7FY?=
 =?us-ascii?Q?W0DaA7NRg29AtRQpDyTrZ6HKJV+Dn4ARIi2BSRUz8qkbhxrNU528DxuM1trD?=
 =?us-ascii?Q?TQI5KZuUaIu0FXK4CLxNeFrsPKlmeQLmo304D5okerGIVLS2b76MUBQopB0w?=
 =?us-ascii?Q?I3Q97yVTiME8ix8f/7YS64XAvdavshrCKFG9dsbHgnJGoKnlxRah6R70dPNx?=
 =?us-ascii?Q?79hYNuvMQTENLYtLegyo2Bzskkbr/NhBCS2CqS7e+If8zEbSJIcdBZ8hMr41?=
 =?us-ascii?Q?9yYAJPSm5kFWLTgs8qJhjjFRbAzlFtsOXp/M2YRCf69SAi9l37o7U4TIe4ua?=
 =?us-ascii?Q?sMiHymQG2dzAXznTLxqL6R/rc94X9/WzS792tDepT8Dd/sIqpC5Z8rbP3J3T?=
 =?us-ascii?Q?mfA/cQrY/nMOfQFnbCWktAjSEHlsRdNU4I0uqYzRs3pNp+jelvbcw5EuhvjO?=
 =?us-ascii?Q?LFLP+g3jtOSXhBwO3RKAA8VfJP2bggmMSdsKPbTJGHYgcEalWg0qrQHtl7ee?=
 =?us-ascii?Q?5VleKGeq8wIaJaYnpuaZrlxd8/aj+SDqb04eGovEAe1WvR1uMddU1ittWjnX?=
 =?us-ascii?Q?iHpkz8LlBVOKrhGBa7CF+AeWBMMmMTKLDXYJgaOcTpfDzSRH/H2Q/cjbvmfp?=
 =?us-ascii?Q?G2N9fA18mvtXpB+9wDJLVt7v7lZzpti0xrEY2dhyGThliAZriBqgKbZHSI1X?=
 =?us-ascii?Q?nKazKK2Z7LH5Oti+52D7DvdT05nfQ6zWtYB/PO80HbcA1a6nUAkp?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcff615-a506-43f8-ee88-08de602e06aa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:33:13.2860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WVEnoAcPnwjrn7S6cdvwtAx6TJbGmlwAR00Pd+Z9DZbqdULpHmNa4J6B9CDCiDw3LV+zIRDfqiv/eelDfCAHGWyVxdGWVf6X5cYSi74Zyxg/96TlVZpAzwzeju6BM4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8547
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,renesas.com:email,0.0.0.2:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,3d:email]
X-Rspamd-Queue-Id: AB820BDCF7
X-Rspamd-Action: no action

Enable DU1, DSI and ADV7535 on RZ/G3E SMARC EVK.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Fixed: dsi, du and adv7535 are part of the the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

v2->v3:
 - No changes.

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 3b571c096752..fa45e001f706 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -33,6 +33,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
+		i2c7 = &i2c7;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -71,12 +72,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	reg_1p8v_adv: regulator-1p8v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v_adv: regulator-3p3v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
 };
 
 &audio_extal_clk {
@@ -101,6 +137,37 @@ &eth1 {
 	status = "okay";
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi_in1: endpoint {
+				remote-endpoint = <&du1_out_dsi0>;
+			};
+		};
+
+		port@2 {
+			dsi_out: endpoint {
+				remote-endpoint = <&adv7535_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			du1_out_dsi0: endpoint {
+				remote-endpoint = <&dsi_in1>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -126,6 +193,48 @@ raa215300: pmic@12 {
 	};
 };
 
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v_adv>;
+		dvdd-supply = <&reg_1p8v_adv>;
+		pvdd-supply = <&reg_1p8v_adv>;
+		a2vdd-supply = <&reg_1p8v_adv>;
+		v3p3-supply = <&reg_3p3v_adv>;
+		v1p2-supply = <&reg_1p8v_adv>;
+		adi,dsi-lanes = <4>;
+		interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_out>;
+				};
+			};
+		};
+	};
+};
+
 &i3c {
 	pinctrl-0 = <&i3c_pins>;
 	pinctrl-names = "default";
@@ -231,6 +340,11 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i2c7_pins: i2c7 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 4, 4)>, /* SCL7 */
+			 <RZG3E_PORT_PINMUX(A, 5, 4)>; /* SDA7 */
+	};
+
 	i3c_pins: i3c {
 		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
 			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
-- 
2.43.0

