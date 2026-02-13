Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK3kLEZRj2nnPgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB7137F75
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1510E82B;
	Fri, 13 Feb 2026 16:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RG60Vl8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8B810E82D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:28:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjDNuhyL4/RILSqkkAs+qNhF3RZ4a1ibShCN0x/SJlrbUlQn0Xw212bJvj8HxMlHDXDT+S57rM3G4TxaRZdwDVw/9oT4wUk8AI+QMZYYFuWj8ZQM2vLTJLub77+h5xi+Uy3KAfQpy+NKtcI9BYAlVq6kHexEYYA2K/cuMSuRJ+nITFOTF2hZDaBHCr2w43beizqAniZmVniJnNV+AoyMAp7XgXolGJNSt67eU8jztxQTVmCYR2I9q18RMvUOgAOYdDtHDn0cZyIs0kNNE9/VdZ1amoR6M9ugNjqAdDBiPP3lNy4bLwgDiSDFIbKXk95fSCiF9qflAXbmq84x7C3HUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eCjq170xoeGLvQ5ZwPfLAXbnOQPtIjD43XqvWitnTQ=;
 b=qGZ/LzuX6zxsn0kQ9suUOAUK39yHBoFpJFiYqTSYEdSwPMwRRfVMyeVc6X+vUexmXazKFtY0G9O40OP5UzFCM4VuQVvoJp1En2HvG8Jp3lqVVqLGIeImQ8BKWcyQpRaY+E7BdLOwbq1HIAGJ9jJQxOKSBPUR5gfEmiAMt6glMF19QtH3DJz3uAvi/vH04N6bgn27yQQ4SUshMOgmYhsA5GerSKvV7PXbkoduSssAQoj+e91svnWm8vMqfReh53x6L2O+0KSZ4GNT99ylQMRSNQlQcSnC6oE8Ph0TVt3P7JbjdTB/zJH4xa4L28/B5/FAUBGjKNALNAgUb32ZqAW6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eCjq170xoeGLvQ5ZwPfLAXbnOQPtIjD43XqvWitnTQ=;
 b=RG60Vl8hdxjD+lSP3wgWBC5zzw/qh0rO5Py3fk2FI4Sl1hadpDBZRO/+tbztT72UVCqJJzU6mVIkbvah1shSlPCRoZVV4C54qJFPvszSU13vFiqLfSgo4W9ys3oDIV8s2gDIyuV3bG7pGAb9VE37KSF5o87Iye2GGXrJaokvj+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:28:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:28:47 +0000
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
Subject: [PATCH v5 03/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
Date: Fri, 13 Feb 2026 17:27:29 +0100
Message-ID: <abaac082f6990124f7991f3c9591bdc1135ad76c.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: 272ab20b-a5ee-437c-4961-08de6b1cf695
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K4etijbeaKQie4xBADoqAxrIZvJ20xzjH/MW7+y2QShCPb2q/NN3KXnFB5YA?=
 =?us-ascii?Q?sK3em+NFM/HpuaC6z1mNrHvf22IXtBBR35EV9+ISTa8d9NZNsMM0KzDrQQcL?=
 =?us-ascii?Q?c2BIHhWofk7lmBrKE1GxjpSbMgVHWx3OZvDt3i/vL+9+t415rJ+qclQ/F8oZ?=
 =?us-ascii?Q?YHMM+Med9+6Rm38rqc4J9xNoEy5z6yTN2My2kWLJroWShtymxnPP76nJEMb8?=
 =?us-ascii?Q?H2B8umAOAOhnzen42nfz0YcPQJKEZTThMz7SKCP4KoS39Eeh1kLDAn+FwwdQ?=
 =?us-ascii?Q?qwlC+LZmcpbCzql3YMHFLom9qYxczZOA9VHmH4mOgZx4qEF16e14Tr6WbuXT?=
 =?us-ascii?Q?HRDfkDI9H+MCIBzB1EdBmMZu+QFRj20fHdHbafag7vgKgu6ePsW88g1rfZug?=
 =?us-ascii?Q?G3H6FFBLCUO7pG4x3xy7tC5kVXevTyAsHPojWBE/AaOGhBH6EmX0PtMRsTWP?=
 =?us-ascii?Q?stgc0UmzyBvy9PaaFgVmV7NiJTAauBRHgrWLzbydE57ZVc01X/v8yTQmxuVz?=
 =?us-ascii?Q?Z3I4FAksRhhiSdG3ChPzZIe5Sy+gG5rl3UeGrw6TWfLQEretM+r1qYMJpQ/4?=
 =?us-ascii?Q?fUVMLUaWaC/VWti/O20KHiV0gYvI8vNbfH+8OJzxTOhqPdYePrOcTp9ng20A?=
 =?us-ascii?Q?hon5Kpgi0FMBMOqxDF4nDTG4GtzGDq+kTEPmLeSRcIrhaYNS69yhwzuEKOxa?=
 =?us-ascii?Q?o/yApPShIfcfHnUufKUVuVuRqcZDni06pOUaaa0cswqxDfH6hbZcV8hpVBVQ?=
 =?us-ascii?Q?iFIsZ1TX5Kg31nBv9l0Z1h2gQBcCVRgMCIwgO9VwjdS+4Th7lLY56u/qa1s7?=
 =?us-ascii?Q?zyukoZzwgG8+xC4K7dvCWlRzlw9gFSgXbpMIXEYmTcfce7fBupKLQ1nhjjfg?=
 =?us-ascii?Q?cgDJiAk3ERucfvBU8XhcEE2Jk20kD3kuE51lt5tpdK0AQLNKqPY/XS/GOFI1?=
 =?us-ascii?Q?KSE4OLN9Q1v0KWRLa+R4TPAmUxeX6GsN+oS+xBLDzy8kxi9PvKrkTNHT7UFX?=
 =?us-ascii?Q?imbQf2jLI6h0xw+PlJaorPJPaathwOoCF91kEhUaj4Mzv/5kQtfeJNbaq0IF?=
 =?us-ascii?Q?bi61faaBi8nUowG5PhyqQXwXZZa4JHf75+vtbepKbF449/dU0PFsg4E+4N2W?=
 =?us-ascii?Q?b0KKQlXtRckRas7g9qB/FMOoKINFoDubMqYv58m03Fv41whipYEoU59kXjgk?=
 =?us-ascii?Q?Y43dDoYbqZs+3F+iHdxZZDGuUSfDB24+gTS4wE1ZV1c4o++Prqqa3WlkLtHE?=
 =?us-ascii?Q?oQCXlaJXE6xssayXnKjAwwV0im3yXOSKUt63hkceaklfGs+8Ua91df/wTtoK?=
 =?us-ascii?Q?IdFrlRequYY6aGU/s96nca05CuL3+YDpseF5p70IB9hdiOfojo/DSRcNQ8SE?=
 =?us-ascii?Q?mBrBpvaUtHHxV6rSk+l45F3WPSG9N0tB6ut/JGIwCbwouzRMNm+vblZgTXO9?=
 =?us-ascii?Q?UwLYnkJR7pvsMy64qqgEIB+R0uNm1PPf7+cGhPNw1FdYNl0H6uNxU8TWtAjY?=
 =?us-ascii?Q?omIKpXRlMqgaC2UOxnpLxK5nWnGHi+VQG12TQeoQJMTr5AJ0+xer5wbw/LsG?=
 =?us-ascii?Q?U4QB+QKdBkuxUA+V7bUBstNF0xZcSgp5mE6y3zhGWRL1krNE7DvZQ8KZIS9O?=
 =?us-ascii?Q?LDFhKR2NJdkEm1oofptloD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W/t+wv1q/dnaT9wQZqYeCZgQTWSvEGLKeYLtQrmV2uf4WRWdIdEo8/ATSlNc?=
 =?us-ascii?Q?inhKzrGM4YEWbMzylL90QkEiJGwVgemJxpk1A61Rlyzm9GQNZM1pA0OLGVct?=
 =?us-ascii?Q?lsX6GO4hC+Lo3JIEuXR2xuNi0NAc+LKRGjZtwwmgGKtOI5ZuK6bodzvAAKoi?=
 =?us-ascii?Q?V5Byqwt5dk0RsqmLMEgfOmlTEUpo8zoc8TRBQakgjOwQxAm5bsneBE0NYk0L?=
 =?us-ascii?Q?MpT03ABT6Vc31roJguYvKAxSLdCMx71jbEUywKEgPso9+1+2NLASGQIVUh8j?=
 =?us-ascii?Q?n+fXSQiY3oNTbb05DTVATd7dIXE3tNEzXPClv2uy06KxqhDU9/avG/vzcSNp?=
 =?us-ascii?Q?twpaAw18AlP6RlHJFy+sRqC+QLjkWxJlJYNE33KOZzXHribMP70YKhjiru/p?=
 =?us-ascii?Q?XupaVrW/hkuF6Y67ZMcg0EQ+0DCtuCeWWZxCUORBnq57/ObBlMH90QvSL58G?=
 =?us-ascii?Q?ygpybLSwP593/1QFdmHKdcFECjhqytw4X2T0h49f3CHUKotUAS9OqeoYGtzY?=
 =?us-ascii?Q?XQaiV7azWLEcvyK+wxKl9lDQNLe7E2iMyTPg84kCfXOzjNTe0HgIlYDWTTps?=
 =?us-ascii?Q?aLPfiYbxTV1Aw+Y5xIoBXUvf/G2VgzFHNqvMYAc0AH2wxL4lhKE9YxHKXw5G?=
 =?us-ascii?Q?WcbwXnUnNHanJ5oxk+qve3q0ZsSKo0wPNggwiuWnXFYWJeb7I0iuULD57o88?=
 =?us-ascii?Q?aeaJCGWd37GWT0PhkNcC2/5pCCcntwHJoLrdPiHONMwYtxMVort8FVznA3Yd?=
 =?us-ascii?Q?46rXyZbqBoIa0TsKgahBz/GvTJ3mQv5onMjHs3a6t0A9tpz8iuNIzsIVlWd2?=
 =?us-ascii?Q?6k7oIvIjbz4aFUj56U+5IxJFzwtcU36xGgvgCPrBqNxqMrELXNPqhzd17NrD?=
 =?us-ascii?Q?biV1YLl+zfJYFuDhEaQc9Am0Mk2B0xWWfR9UAlxALLfzQW/I14+GfH2yO7br?=
 =?us-ascii?Q?6SwWSZpv/rMiQ+SkvzVXnTjm4A5GSUTNxCaei/ZyFThtlk66hqfDugwJ5GKn?=
 =?us-ascii?Q?nNGOSk3mbQ9W0fUlou0K2A5Uh6ROQ8bGJb7NvXgt42hJuS9tuk4XQCucqna+?=
 =?us-ascii?Q?lmPY+XMdi4qqm39eVIKAZiRvWVU4f7xToxpaFH1GzDty/G6mJzWJxKLbIcVM?=
 =?us-ascii?Q?vNJESWqELgscvHsjJsN0cP7L4+RGTT9tV5jFLxxuL7GMOiiJJsRYqp64Hkta?=
 =?us-ascii?Q?qvNPaKBQCKu5kNXEcOZBE1fQxk15INQEEwJE55ve7+rUvrqFLFoJoM2xCzCA?=
 =?us-ascii?Q?7BIvMQqxPMp85qT5PJC5b2ED0Zdix/11I6kOEvVp236CUmHKNyvylfhJgZbr?=
 =?us-ascii?Q?saFCgno7J288oCq8cxRe705TtvWt9hUGRzRAIG+WWKrKlbcmz8u32SkV0Ku6?=
 =?us-ascii?Q?n6X3ZGS4gWbeJEPP2DKrVA51hHujHPnK9PwuLtv+XycTYVGIlSHsMiox93J/?=
 =?us-ascii?Q?2Ygq4rUaPltW57aPVDS/3KpmTAtyzznu3y7AN6YgzmIjOwdrdAcxs+ymK8O/?=
 =?us-ascii?Q?csWpRUhJi3tYlD8q60mImLLppsTh/IMNjsI8HV4HaWgq+oMAoaH1DS3nxeaW?=
 =?us-ascii?Q?jlobhpxiqURvPvu8IzGshJxt5rYWxiDhTebQzb/1/u0EO+pPX8s9qV8E3o2Y?=
 =?us-ascii?Q?n1fT0bAY8jptuaIc1cMOV6QfiXUAF4F4FSVdSR00+6FIBeU7Ak6rA+GIkndG?=
 =?us-ascii?Q?D5emyklgMVAdgJS+ChuqqW45ZGEwLY9c/xVWweYTp8QijUeK9boNGh8Q0sPQ?=
 =?us-ascii?Q?FlDai+KiV+N6evHFk5Uzp2cTv9hXTN92df/qIy86XdFkoi2A0Q1K?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272ab20b-a5ee-437c-4961-08de6b1cf695
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:28:47.4315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTJ/pIoXtX/6jQ+lGWYU9NQnGX3B1jYqjAqHmAMl3ZW0V0sPf2Uyv8bueLxj3LDhS2sviAp/kbRssy0AgSiQDXGOCZ1IjZ5QArWBsmzJY3pb49FpVPwKWjKKS2UphEnt
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4FBB7137F75
X-Rspamd-Action: no action

Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.

Introduce CLK_PLLDSI{0,1} also, introduce the
rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
constraints specific to the RZ/G3E SoC.

On Renesas RZ/G3E:

 - PLLDSI0 maximum output frequency: 1218 MHz
 - PLLDSI1 maximum output frequency: 609 MHz

These limits are enforced through the newly added
RZG3E_CPG_PLL_DSI{0,1}_LIMITS().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No chages.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 include/linux/clk/renesas.h         | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index a73d12d4964a..8d4c70533a79 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,8 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI0,
+	CLK_PLLDSI1,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -117,6 +120,12 @@ static const struct clk_div_table dtable_16_128[] = {
 	{0, 0},
 };
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+#define PLLDSI0		PLL_PACK_LIMITS(0xc0, 1, 0, &rzg3e_cpg_pll_dsi0_limits)
+#define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -138,6 +147,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLLDSI(".plldsi0", CLK_PLLDSI0, CLK_QEXTAL, PLLDSI0),
+	DEF_PLLDSI(".plldsi1", CLK_PLLDSI1, CLK_QEXTAL, PLLDSI1),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c360df9fa735..0949400f44de 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -164,6 +164,26 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+#define RZG3E_CPG_PLL_DSI0_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 1218 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#define RZG3E_CPG_PLL_DSI1_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 609 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
 #ifdef CONFIG_CLK_RZV2H
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz);
-- 
2.43.0

