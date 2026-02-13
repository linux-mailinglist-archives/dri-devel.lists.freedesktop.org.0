Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KoeGDJRj2nnPgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D2137F26
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8C810E820;
	Fri, 13 Feb 2026 16:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gif+pKSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E35410E820
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jk8BYyeYCnMG7VfHniwp3wo+hr6kiAJ0ka3j5ol2/3v2EUkIH/pcBgk1P57GPU/S2tQERDKfEImsr7GR/EgLsGAkVMHV7Qb5i1RPY5lVLXjuZcjyAVcCCGzBmFEen1tZ8yK3MSA61IfoKrIqUamkZWT3wuK1Ye0UJfrzSXPODG5C7GjZP4xLekjGLohOk7hAHX+QR8+qCTa73ASSenksTBUBlCscy2q9W6RDyQhHDAmsYvFeXRnw43/dVuzr2Qv9GXK+p+WEsaWcLqKpU4+331FXMJhJuvnGd8qotsp//y8tYOkRsjt4eUBwi/LOXxQ/GqYf2MY0zYVM3uXIR8W8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLX7iE5mO0zqQkv0amhcgJNDe3WFjWIAZ248j/IDt6o=;
 b=MfvIENKvR++hItAzKEZjmRDm5qgJ3QeHlzhVy0MN3T8MdboYyJ33s6br1rh0y66/hHzo7U7TiCsqEIxG6FA5aKB74oFuy7mLzzA8ogcpVEmCXznMhx4uYzynlPWwKJRgFr/waP3fDAgq3tvzG2YzMJCIfVHB2jiUkCu1hyMrnTgksqgM1moGR/uFwzPbgYqHRDIHxqdQ/8jfHifV1PTW8zLYzyTBKixLeksta1S6i2SM0OFQ2s/r264R9iuGUhVHiJjeg350m+x2b5pBiwR/3YPB9/Z7mun9rewV7WZTVdxCOt7EF/pJCfecwJBB9J6cOEhBgkR96BZ0mwlecx8CQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLX7iE5mO0zqQkv0amhcgJNDe3WFjWIAZ248j/IDt6o=;
 b=gif+pKScT/OwMOcDjRRl1nq+nDmwBb7ULo1pL6hA1yAeSb9NpmLtf5+ypS6Jr3PxI1+KpgiJ3joeAlp34akn4+2hWrGe9pxZ1ZTydVi/huw1MV1/mbHbxvDW0s3z/EvxFtULsc7Ut4zwfYfoSllOaLqcaAkG7eMJa34c/f2eYrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:28:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:28:24 +0000
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
Subject: [PATCH v5 00/20] Add support for DU and DSI on the Renesas RZ/G3E SoC
Date: Fri, 13 Feb 2026 17:27:26 +0100
Message-ID: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a6f896-225e-413b-4d43-08de6b1ce855
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TErjzLOjnEzV3uhq35RCHHrnMg4n/h7zsGH8PpSUjiBueMlE74IXBjffCM9a?=
 =?us-ascii?Q?f/c4GlX6LkyyTzygvmIh281bn4Cu+eD2ErDBYQHack49/sDyaUDrQrty6J47?=
 =?us-ascii?Q?bnE4UmgRxKm6dBIjyzoitcTAUup5thIu8Qg3sv43rH6uNK1OvOjagjdUDUaC?=
 =?us-ascii?Q?/9V5ZeXYp26+VEliqN0G6RSp5706Nedn0jVwAh5m7gGYntudLUXuA7cz+CNs?=
 =?us-ascii?Q?VWpmiLF/tT2lpiztrsHB9ZMc5dIYUCiyIuiCI6j5EgbzW8YYS+0zFgwHO8mZ?=
 =?us-ascii?Q?UG96kzutcgGYtELvKqkSeC6zBaBIagysQZDL0GYZYUmmymacV6F/4bLVE/Ju?=
 =?us-ascii?Q?o1OdHYvQHSiUKuGYQpOedcdQ+iizGb7JDwegIkIOutuG+Uvcv1iZKUNkXOxa?=
 =?us-ascii?Q?NReFplgg8j4dCFKM4ogouj4WuePt/Wc9ib1f9+iWZUT2L8DqnBhVGnl2TNvq?=
 =?us-ascii?Q?3gcFATGYlksPK9MU5h8dP/DA7umj9QwJoVOKk+MGbeAimSOgiF/Jrg+bTG/8?=
 =?us-ascii?Q?dQo/LdilfyY+nnJ5rFM86VYO3yP0cP6w49mngHltqbzoJ+ndoj5Dqn8Lj4ZP?=
 =?us-ascii?Q?eVd/EjaC3sTiND6LK33pKtcKa1Rhx84g0n8TWkSgr3g78YEJt8gxOMXe59n6?=
 =?us-ascii?Q?4IEtuZU3egFhUJ8gqGO1riHYPG5eS7JQ0471GNZdhR6meIcOhqIgrZGi2gg7?=
 =?us-ascii?Q?ns1seLBqtfvIn/wQSc6KxuaxKTqr89JHmu+qzi5DYt8q/YPSP71TmubTFwb8?=
 =?us-ascii?Q?G+bgcHNpuM6f9vrD2KItxjaw+FsaKUacP8piUF5QFYDxPlgAuJjuYvYDecvK?=
 =?us-ascii?Q?j0ZwtqwGxlR9gKANL/t7ttcwKggJ/JdBItqWpHndODcokfUxWSQvRnPWbVKS?=
 =?us-ascii?Q?p4Vg3kxoxeqkQa8uo3c8PexzuSeA8BEpj0xYeRs4SAD56/wYYfgDUxiT1r33?=
 =?us-ascii?Q?s3dQdn8oL6ho3AYzTaVX4ET2MXUGCr6magSzd+iTjc8YrrKqW9o1rUy5wGqb?=
 =?us-ascii?Q?XuQHrpUevHgnRiSYoOVGAjqXsqui71xKYQ9lQlu9pyQqyfdldq5B2RXQzghN?=
 =?us-ascii?Q?Q1Vr+hjqSSiCNidd67xwcBtV73/waeb6NHozUrR+5xXmewAfixCI+lkx957P?=
 =?us-ascii?Q?CGjcKZZCtevs5Shs2P4Zlqd8aa+Ya2dyTwoH4BLim4VqGVZ8+4OaLsOLd0Mb?=
 =?us-ascii?Q?hgnADAUXX+KoNhDPqjNsZJ5NrOmBcEkI8ZCvAxpqE6MD7k0kK29jOF6ye8Yz?=
 =?us-ascii?Q?G3v2gI1EHbYGZ1HK+zbshuT84PF6NOTZi0xTQyD6H+mh9gdE1zIUIxafziKf?=
 =?us-ascii?Q?aPqnJl2gO7haq6oBOZmg3QlrYK+4JDXi2B/A/CqzJ6TUE57nJy6hN+RueFst?=
 =?us-ascii?Q?2+7sKyM3uNwuv2P+pVlFTxc1zww501QXwluvS5E7flBkXupLknbuA62Kp4Tl?=
 =?us-ascii?Q?n+4GDk78yTkzGmrjfiWb0Jk5F9PUVK5RhDR2SdirnbLxOKL4p8q5D5oeG2VS?=
 =?us-ascii?Q?/lmGttw1I5Hexm3xtPSOi3JLKtLeF/JoPtu9toekgHUEkNKwPgRgW863OlEn?=
 =?us-ascii?Q?rhAO9RxaiFH4cQhsqjwcYUfVNoU3pMmvSHS9D0EXNzge7RzKAhDxDOnTQx4t?=
 =?us-ascii?Q?o3/Zva49v/Y+MfQwA0mguzM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZck3Q4R5QbKc/Z7lJX+e1DTYFSOEBwIo0V3rB35qqHmweru+WS3GiiPdXVo?=
 =?us-ascii?Q?tX7lnAcfubm4aVSyBdCDMssTWbbDLOFCM9rUmbUzdrLZUeFvRBtkYGzwG2Mw?=
 =?us-ascii?Q?d+T7KS4FiHV/I0LMo39QDZAs6WQGIx+cAlZ+1FvW3ko9p3RjotC+2PCtcJs+?=
 =?us-ascii?Q?H7NPEo7WeUw5qjK3rVEOWBjFSkUt+LsAnFSyudbIti32WHmzEO7hXo81u4Jz?=
 =?us-ascii?Q?ypvkARdF/N4G222TnkMYQwnQbi2WhEhJtzdxFKSu29D9ONNj2wFvVZYous1K?=
 =?us-ascii?Q?pcDg4MbDveoS0jN8zrsXecHjDPKy0CeVsx1xNoae94kIbbuZTvjjzP7lzI8h?=
 =?us-ascii?Q?dcYoctA5LA/X1NrtPhApr6LCxpZIKECTqsiNLUWLtC88/hY+t6lPyqHx5PJ+?=
 =?us-ascii?Q?faDljgWaLsdIy6/WIOypDxvj8VlSsTj0JGxBB+ZK5iF9srZQFWP03EgR8uU2?=
 =?us-ascii?Q?0KaFPmWfLVvYkl8owsSnu7ZgWdFR6k2opw6UMBoyn50i74k5YZZfXKk5PeCY?=
 =?us-ascii?Q?0jAPmKB+BkOLHwgOjbFdvsSqLqHnYcwafgtTWJ0SmLCzPjLK7WKs++tgyN5m?=
 =?us-ascii?Q?me7LAPOLxGdwb4RXXuYoSwdctVL7vf5bdM4di+lgdVQXU7cbNpol5JOesxNL?=
 =?us-ascii?Q?6sBjfTxaeRKzr5LtlB+hP5eMppgiZjnGEwfjZq89DLrAYmyvXfZkvKj+57vq?=
 =?us-ascii?Q?FUUjyMutNg2jpvIOiihwEoySAGNqXh+8blzHgjKrCrzBg35BtdArLa7elqeJ?=
 =?us-ascii?Q?ANwoCyXKzuToeaWo/ZdDerVd5nquNpMOY5VoYJT6aQJidoWb1pPUmdZ+r9Al?=
 =?us-ascii?Q?u/GxlcRrkrq0aAy0yCZTUrsMX3wYcPI40tWq5T+xghWtH6wSv/TESP+o33s8?=
 =?us-ascii?Q?r2a/B7jOXG8PG6+CkTKYlds/DuCpL5sC+R7ALBmRDTB7VMXdmvneLfL7q6RJ?=
 =?us-ascii?Q?fmzbEIwSqwbpbstCNvbxLXacYq9hc9wiMvU6lpXERTxErgL5rIYkdnefFDy5?=
 =?us-ascii?Q?dMsdvPQ4pl5Me2OxcfNKboHYvEnjx42mdjF5V0DfApd/2k/SpXRF4wdPH+3z?=
 =?us-ascii?Q?q9uUHnutUKcZ+saKsk38CUNHG5TP0hMIZ37KSmsK7fmazf1YJoZx2Wsz0mj1?=
 =?us-ascii?Q?JWOutrUeB121U4vK3G4JZvz/c9JTZ5FoPX40T2OFjf+CgHAMymWiziC1lz2h?=
 =?us-ascii?Q?xEJa0fXNs8ZC3m0HT1YgHH6oB1I0p+fb6xJBQGRmmSjqu6rhgm49vqXDADFW?=
 =?us-ascii?Q?2V1Gm84AzPV65SzTAxE3C+ayrs52crMdqtiW/kFbShSqG7BhBL+VZEfz1qSw?=
 =?us-ascii?Q?LamluHqCGuoPeHAhS5+8GoIeerKcA679OAuEVtTx5zhFU4KzviEmWW1PY1Ta?=
 =?us-ascii?Q?sBvzSpDQNmHs1da7OpT4TrhjxLugwtVEFwy2p7muH4AQdBVO6TTfyD6dVLfh?=
 =?us-ascii?Q?qoWhMXx0RA+ig6aVsnJYhXES/FZi7L/vBxMG6mrlo0ZKD4LEZRSYVdD6eT1H?=
 =?us-ascii?Q?mtpnd3FjZZzz5YMoWZjIeGc5+hPIRmtADFMJrDgVpeyrvMe4iuGC1l+Ilo2K?=
 =?us-ascii?Q?VJoRiPJgm4TQyHpe214xD0HlbIIdMiw0NcNROFrWm0XnpA5YeBIwLGZMI8pe?=
 =?us-ascii?Q?CnA51MC3rHQuo8Tn7lsolkLEKLqV68x28IComVdd2RXzILnKhNfzJc5BdnhX?=
 =?us-ascii?Q?Um0bi8WVRlRTSTe5UwLJgfh0PZii1ov8dq4ohEZPsBV5iooKCtIcJasP6x94?=
 =?us-ascii?Q?g9GFDyOLGZ7o20CzXOAdSN6MnMdakUQMDYPwKIeZjSxpipkCPPHg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a6f896-225e-413b-4d43-08de6b1ce855
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:28:23.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMyOQz+/RunnY/q5HJCedNQoYHoEICNmjIdLpr4iS1W8VKigp+4HyEqrWBYpykYdN2YSqFvRok2kmke+jHnwGaqWWQ7+kTsUtai3PBuMhtBLTZGciabQV+cZfRwj7Nxu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
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
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 545D2137F26
X-Rspamd-Action: no action

Dear All,

This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
interface found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks & Regards,
Tommaso

v4->v5:
 - Rebased on top of next-20260211
 - PATCH 9: Dropped renesas,id property.
 - PATCH 10: Collected tag.
 - PATCH 14: Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK
             Added features field documentation.
 - PATCH 19: Rename du0_out_dsi0 into du0_out_dsi.
             Rename du1_out_dsi0 into du1_out_dsi.
             Drop renesas,id entry from DU nodes.
 - PATCH 20: Use DU0 -> DSI instead of DU1 -> DSI.

v3->v4:
 - Rebased on top of next-20260130
 - PATCH 1: Fixed build error: https://lore.kernel.org/oe-kbuild-all/202601311423.gWtJuxiU-lkp@intel.com/

v2->v3:
 - PATCH 1: Added missing defines for duty num/den.

v1->v2:
 - Rebased on top of next-20260129.
 - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
   operations to allow the DRM driver to query and configure the
   appropriate clock path based on the required output duty cycle.
   Updated commit message accordingly.
 - PATCH 2-5: Collected tags.
 - PATCH 6: Moved clk_ids to match enum order.
 - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
   to match order.
 - PATCH 8: Collected GUytterhoeven tag.
 - PATCH 9: Use single compatible string instead of multiple compatible
   strings for the two DU instances, leveraging a 'renesas,id' property
   to differentiate between DU0 and DU1. Updated commit message.
 - PATCH 10: Removed oneOf from clocks property, which is not sufficient
   to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
   existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
 - PATCH 14: Instead of using clk-provider API to select the right parent
   clock, just set the correct duty cycle based on the output. Updated
   commit message accordingly.
 - PATCH 15-16: Collected tags.
 - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
   Collected tags.
 - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
   Collected tags.
 - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
   of vclk1 for DSI Node and set to the right position.
 - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

Tommaso Merciai (20):
  clk: renesas: rzv2h: Add PLLDSI clk mux support
  clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
  clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
  clk: renesas: r9a09g047: Add support for DSI clocks and resets
  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
  drm: renesas: rz-du: Add RZ/G3E support
  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
  media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0 and DSI support

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
 .../bindings/display/renesas,rzg2l-du.yaml    |  22 +++
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 173 ++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  84 ++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 184 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  26 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  12 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 105 +++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 include/linux/clk/renesas.h                   |  20 ++
 15 files changed, 906 insertions(+), 44 deletions(-)

-- 
2.43.0

