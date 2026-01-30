Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DUJGbfpfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD94BD0A7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2995810E122;
	Fri, 30 Jan 2026 17:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qRpuLRlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF72110E122
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PH5DJHGh/CI9tIc6gOdNGuQkvgTtwHFVOy/GvxMy3kYhlWex9zFF1XXcLWp/yi6QrbmUpeFuZqjNBHLoAmWuuLph2y3nEjjd+swEvanz1JtCpCKsYXj28J/JgiOJHHBnyM4SRJ6w9G7oXbdFKo+wQASRdimQJmapHz5fxx2vZzU8m7XC67wEgvKamqV/cCSCfU3sl0DQnCNxNn1uM10Wsgs9XFAdJQMA32L0jfBEOTyVnFa9JIKB7P/I8RfoooEl5sZCs5D4+1xDldg9fprcYJCeJz51WmdPNBzON2lUhy0i4FM7aH51gwy1qcmkmrgw0A4BEWbQhxNMBmQn/L58Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EdqmCsik2fJ/Yib9VTVwUsSJa9FutnUHywBYJ/tTC4=;
 b=mHsDutLSx7cXUBI/XeKcIDWgA2AJ21zm4K1dLPw07sGP1iTRLNQzkgW1/9cuWX9fxD5lUDYk1Wfc465a755R4hKOMBVRtlBUClQBSxZjks65FihJpsjijRre96BfOfjrAd5Ch6yWcR/9DC9UC2g8mVHPEAGWmg6W2vtiNDL8QckLMFVOGhGtAGpqQE9Xd31EXcwmdTPkSk4g5jsxeGfdqHAsWpCdI6rIjOpdhe+jcZGI3NsmpPRZ5geVfBQk9zdQAqIAHoH1M+MsqCUH5WXbVte6K+8tJIG4q81pp/Si99wAbajD3+q72/LEbgmDa8NtqhInxbcX976jthEEqYFYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EdqmCsik2fJ/Yib9VTVwUsSJa9FutnUHywBYJ/tTC4=;
 b=qRpuLRlFBhzj5Y8A+CsSzrC0Qg3TW3z9XYobI1/sqFKIBuzGj/NRV7HhqBciz9R9k8W5hPNzy1VgX6SREDBbheULbYzSQsJzMNeZsgmZsZoIMplzRxfNucW05Csl6OAjKwvRU+3o/QNx3vAxwRm8gG73QftGbV9PWn2H0/n/JM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:08 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:08 +0000
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
Subject: [PATCH v2 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
Date: Fri, 30 Jan 2026 18:24:58 +0100
Message-ID: <d09e90a797b1c33ba120679f0b3419366df7f431.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8792b6c-dc14-4e13-0643-08de6024a7d1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eBUumPdwYcKs8wi+mNccPwM9ZbNjON/qnCZ4FtCXHj7OVJi2wutmOvmwEFpL?=
 =?us-ascii?Q?gvSwUyyji1mZ7OX1y5PMhMGbZNvHjIBO66c9Gpir2cecLSXlWjCxTS2XF2AK?=
 =?us-ascii?Q?5hqUpTIayKW90yOzLdqCDKvXMwqNKlj1rNze3RxuCdlUHZ0z6f7IJtQzbja6?=
 =?us-ascii?Q?Jmx83Qqav2JJ128OEuNfPMmh/Om0lJ2D/swaFsz3cReTN9lZW0LFOQ0CNqf9?=
 =?us-ascii?Q?N0pMXkfzUxKlML4aADeNWX3b3SGzoezcTk38okU1b7bLVd1I9Q6iopGf029q?=
 =?us-ascii?Q?ILn3wSzpB0Tpy9131jbSC7zRObiZKqEaoC0SGHjXt5kgjaPAWJEM2sIeBmKj?=
 =?us-ascii?Q?l85jje2ODHCGoZ8BlNEc028F9yivLYyU6+mWG4tv6QDtpplwJ/7hY3piZSGg?=
 =?us-ascii?Q?LToyGfAPN1imFM9yS5JBcrPEIxi2ZXXU29/cWCL/jz33B+OtWoLP2MDDl+Nq?=
 =?us-ascii?Q?vwi2KVeCuXFfcZzXJK5HFjiOC46rM3KYuUzhWWAzzbiTy8IwsNAIQYuVj5Ye?=
 =?us-ascii?Q?q2SYRu/Zhuqxe2sif/csAJGA180TcXWoWI1kVQIG1QaRPhRVsJXlTxOPFIQR?=
 =?us-ascii?Q?0n3bnHRooBs3tuDWuaxIJjLoZcawSwn8xEeunAJWAbnmb2yW/CSSQgcoRoJH?=
 =?us-ascii?Q?k3ygNhAQzeVSHD67QG5ArKKhFsV7Yqyy24UovAjNsM2KKecR4ZdIbNd0tQL9?=
 =?us-ascii?Q?w5BJz3DMjB5M3SImTJKFW5mfLbhiP+8KkuEMGZR2cGTmhx69ZkyrARv3KKYc?=
 =?us-ascii?Q?1w33goR5SGEiAAqq6+tt88RTbudSJpi73+ivejncq/dFd+aZCLFiAWOzoiJq?=
 =?us-ascii?Q?EZLjgl4XLR1xZYl9qJ8qLhNutaZ54g81iV+LgScUD4fwoEX2WqPZSsjmWx4X?=
 =?us-ascii?Q?XJOFp6WDivGwRhbWTWpIrx5V4mo80jVMoNV4CHR3aHYFRqtudnBQ0ceKANyE?=
 =?us-ascii?Q?FMQaOVL7ZqWzoNxs3W5zraljDx/G6LsQLgfu9HgAKP+OJIqCBRSco5a87XG8?=
 =?us-ascii?Q?HQH7BKDY7GaSPZd338bUMs9pOPBWXuv73GSHZ5t/NLq1XWHCdLt4Gl+1GjxB?=
 =?us-ascii?Q?J31X8ZWQ6IpX8TUbJolcLPw3ikmrUfFzxtn2HnBxyOUJrWsFrEuni9VKYlji?=
 =?us-ascii?Q?DBbSXc5T97ihkleokd12CWY8OZoVgBcj/QsXGwB3TmVu/kGDnVfQjdfLYP5f?=
 =?us-ascii?Q?UWPjnDXM/S9Q/GS9BwbnB2Otv41b9kWZpn5S+bxn7vnhJpYXtvskfaYsqFhq?=
 =?us-ascii?Q?emsDhMB6aYzjO9+UtRxwwQBgC208mX1F2WEihwx8MeXStAbeO4K/qZ06iqfS?=
 =?us-ascii?Q?wJApCI/K1uyv35x+8ZGXXEgunqsL1jJXZSa3RPkZIQ24PenWfb/7m7/bB8p4?=
 =?us-ascii?Q?J4nrST9FAXYoh3LnivBJMhZ2O7X53QSp80Fm5WA5rAaR0en4TCR3EMmaTYa4?=
 =?us-ascii?Q?EsKX64hn3gW9bmFnMOEGx1RRRUyjScQuIx+TEsw8LGfJnEeSAW8F2HwMDNYy?=
 =?us-ascii?Q?g0G89cQf46mU0dGG4Jyt/ZQuieaAmIynknZHysRtMpXLyWOhxS92SkfCzsYh?=
 =?us-ascii?Q?zDk+l6zozpwxNw38Fr9R6wBWjOaCNYl2o7M59jZfi/O3fwWSPPwZotBTe1/f?=
 =?us-ascii?Q?IS5Kx+uhHZ7iSm+9jXcT474=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?89RDPdoXqrmINCFTu3gQEdO/A+fTXOd2wl4ACnVjAx6DCiUkKjny8DcNcv/1?=
 =?us-ascii?Q?2bsKkl8uA07RcjdlEnaxP0XO76A2eLwy2I+ySZVKTSDCkkSgdvst8u3PLB85?=
 =?us-ascii?Q?SkxzqHCtpfiwNEr/kXWKQvG09W9q3mNyk6JrozQ0PwmE5FBxbsbrcYcVqtNp?=
 =?us-ascii?Q?trLwYVgW4Pl8m0eQexXD4ldMIGPYxeGtQUyrGm8u0eMA9xM5jbUGljFEwOXG?=
 =?us-ascii?Q?ZNxmbI8w9Ll2rciFJyKF3avp66hjVkFNLohD/vjpcUcDQNwE5AR2AyPDvQ3i?=
 =?us-ascii?Q?DenZCF+xFCnpWL7gPVsoCpEztn6Nzffkzg6w4vE4hE8IMeZbY93igs8Xeqar?=
 =?us-ascii?Q?RZdyDsW8j1U+P/WSLjbDFl/FA0fuz2VrqVoLoFyYRCS1Q0ZiUFjutX6hMs43?=
 =?us-ascii?Q?AngIfrZkQ0SvD2Eqn5MNgmlgL1WgMOfqjRxVMntxS8xC9ygaDF49kSh/Hy/n?=
 =?us-ascii?Q?QuHRjft40mRcjlWyLKaSs2FvCTtdY0b5ccwqjtX36mLZknbgbW4aCVJJUpro?=
 =?us-ascii?Q?WgvcG+yGWhWbqXCxtKHLdGe8lXb9oD7IWEQfsBOt9mFdc/Yb+2Vi60yxyv2H?=
 =?us-ascii?Q?PbZ3pzFRWPzCrHH2fJdDOTzqcPx9sZDaWOkVrYu3ajTGbCQtMFSAuYhG57hd?=
 =?us-ascii?Q?CCgoX/iCGAZQ8nYJ3AeG0djwhR0zRH2YHAGX9YSPiHPXs9FDyB9DRPSFY/6j?=
 =?us-ascii?Q?JFBHZ3YEpJMhhma738C28AX8FhThFvBAyQ2oWavRG8IOmf+Giwu4RJpNSjnF?=
 =?us-ascii?Q?o7TYl98IyCYkrI8nF2y8lzkaC/Oxy2wz8TuiVcKZ1LMHT++uUytiEFOGc/AJ?=
 =?us-ascii?Q?sD5ATls34rz/ry++5L7tmdOrhB+e+vQxlAVxRbh8XdZ8iuSsNSBr7nj3fm2G?=
 =?us-ascii?Q?BWzA23iPoOiHnL/wShMOO3O7OFfykY3RGvJ2q0DD8Yn7sBIxEuifc8wpE8V0?=
 =?us-ascii?Q?TOiMSYVNEFwev7EeNMON0T47YYbuLr8fpr4wl7vPPhIIEeJXg1mzWKNjpz++?=
 =?us-ascii?Q?WRFlwxOZWfze7HCgKY/DEYCSYp7vXOho7Uc50o8TEbYxHRjyN3ZqN64KyF+h?=
 =?us-ascii?Q?67myOzScM7P97z8qA1knZWatzmChKiIAkO+vNC0T5yc3j6SxjQIDNzEhm+ym?=
 =?us-ascii?Q?MsXcrf8UXgVVivKr+rjBCPkXOmpNnB5x2JLPqV4JDbmyYh5bWYQr1zONM1Eu?=
 =?us-ascii?Q?xeTdLni6++KFXgruagN/svCnRVS+ZzWLPzDJP5f3q8OIji2y+LVEWg2gPc85?=
 =?us-ascii?Q?Cg9PtlsDJf16Q0K1hn0L4L32j78FIUO5LYpNfRtfNw5TomvCTYTrKCbTcvsp?=
 =?us-ascii?Q?OQ2Ww+GBQxR3GfURXZzp4jB+S4TXy5/0F1jPqOaIkoy3MijRMZf6mVn4BOKS?=
 =?us-ascii?Q?1hgKoPl1DKMMMZFC6mZfCP2BWye0X17Ohee8m6W+xAkCXbC/QnRD2lcTE7E0?=
 =?us-ascii?Q?+PKYpR68Fe4DJtT4rOil9dwYF3TYs5w2Oj3aOAowvjweMXWCamo/Ikvuu5JO?=
 =?us-ascii?Q?ML5VFg4TDK9EhGT1zbIZWB7CyezXoE+mDYXsbLVkuGJleYP3AyZP66k+iXzx?=
 =?us-ascii?Q?Q0YgwOG5qV66Le+ZACkZfsAAqSukQX/PebRLInTExiwYLwkf2IkPUWpZ5TlF?=
 =?us-ascii?Q?pH7tV/g5kxacRNpUWh/4By8jhthtOdO+udfiyfrmdRalMEIyoh+k47fOudD3?=
 =?us-ascii?Q?3l5ODpf6+9X627L+wTUgzAGghv9e68f6e+LRu1eIib2aEr0XbmprA7qs05pV?=
 =?us-ascii?Q?E/Zg1OvV1sH2Kmzn4vPewX/hLrXZ2Zc/tu9848SbkTVUr/Bv3y47?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8792b6c-dc14-4e13-0643-08de6024a7d1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:08.7177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYGb77FAKETnxGcAK6MmDtQ9Qtjh4D+2888/AfHKafTyAyLTy/8XQCdbkVMIpDhazA9NCW8CDsjRCm+EpCPu4Srp4dGaCjMNKyPVPh8I7pw7DDRsJuuHzgpCSsVIs3m/
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: CBD94BD0A7
X-Rspamd-Action: no action

Add PLLDSI clk mux support to select PLLDSI clock from different clock
sources.

Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
them in the clock driver.

Extend the determine_rate callback to calculate and propagate PLL
parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().

The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
with different duty cycles:

- CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
- CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)

Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
allow the DRM driver to query and configure the appropriate clock path
based on the required output duty cycle.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
   allow the DRM driver to query and configure the appropriate clock path
   based on the required output duty cycle.
 - Updated commit message accordingly.

 drivers/clk/renesas/rzv2h-cpg.c | 178 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   8 ++
 2 files changed, 186 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f6c47fb89bca..f1dfa6773b4f 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -418,6 +418,20 @@ bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
+/**
+ * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzv2h_plldsi_mux_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
+
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -649,6 +663,167 @@ static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
 }
 
+static u8 rzv2h_cpg_plldsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
+						     struct pll_clk *pll_clk,
+						     struct clk_rate_request *req)
+{
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u8 lvds_table[] = { 7 };
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
+				     lvds_table, ARRAY_SIZE(lvds_table), rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
+
+	/*
+	 * For LVDS output (parent index 0), calculate PLL parameters with
+	 * fixed divider value of 7. For DSI/RGB output (parent index 1) skip
+	 * PLL calculation here as it's handled by determine_rate of the
+	 * divider (up one level).
+	 */
+	if (!clk_mux_ops.get_parent(hw))
+		return rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
+
+	req->best_parent_rate = req->rate;
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	u8 parent = clk_mux_ops.get_parent(hw);
+
+	/*
+	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
+	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
+	 */
+	if (parent == 0) {
+		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
+	} else {
+		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
+	}
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
+	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
+	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
+	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
+	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
+	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
+				   struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	struct smuxed smux;
+	u8 width;
+	int ret;
+
+	smux = core->cfg.smux;
+	width = fls(smux.width) - ffs(smux.width) + 1;
+
+	if (width + smux.width > 16) {
+		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_smux_ops;
+	init.flags = core->flag;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + smux.offset;
+
+	clk_hw_data->mux.shift = smux.shift;
+	clk_hw_data->mux.mask = smux.width;
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -1085,6 +1260,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLLDSI_DIV:
 		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_SMUX:
+		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..74a3824d605e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -203,6 +203,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -241,6 +242,13 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.43.0

