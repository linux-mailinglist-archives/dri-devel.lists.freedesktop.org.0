Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPKFMVRRj2noQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C08137FB5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7591A10E823;
	Fri, 13 Feb 2026 16:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ODLeL1QP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747B710E826
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPjNA7NVs16Y5pBr9GOE0PntgoNVlNKFNDeLe4KI2ralPeM6bxPOd1YI+TLiu6ILZKWLBwrIN1SfFHy5u0uwVjd446wOyKbYZc9Izq1avGcMMzgSyE523xL3Wy/GsRELO+0LSnP7JICI4in/H4u9aNcxUbQPBx1WDPVR099XAjmixHo3aG4LVyNQBpyEsdTFyAknWkBXeJmUSq5RakcgPOOxihcVkIzOJ9R8l+i4nyWyniD6d5DcHAzlGmWV8v2jrUThx4Jc/KsXYYOYJSxcN2LCkgaK4+GhHTcvhzgB628BLyk/iNSPktifI9CD1DeDLguz+nUfbdl8ufsPCNfHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PLizsqf0Hoigd8nqJxHTCAQzEoICte1ol9Ngrz7A9Q=;
 b=g4ZGY//6pjm4khC1hoKqddKXlNY6HOg5H7poct8dDIwO0qDCXw3C8WPNL60k9M/Y5JIaWhxq4Awh221SZ5xwBR6Np8IWDBrsr+B/yH0TO21HEKXNlSPZEBHcsnIdiP7Sq5rSLuuKu2SDdFIQVlgYeC4KE6FO3rbHkWY5oh/qJUBXphXH/DRP2cuy1S2esH8GLbIpGvVpGiO4Ooxr+TgchJ79l7WHio+JW4amGi3Motqz8StOXIqoPt2ES9ne6dL+QPwgyYJKn7OL0relk60xwTvUI2W54RPT1SwpClPn/PVSOAYzbjorFHqG1FNzFpmvm0OpIdT42NotwtTRGMgXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PLizsqf0Hoigd8nqJxHTCAQzEoICte1ol9Ngrz7A9Q=;
 b=ODLeL1QPpKXrfcBp6IfhgTzcRvj8SHNDVw6fI3cij4Dks4UG48mTmhJBGxAADDAbS9ZNMeGfcg955xH7ootb1Flh0QEssXTRYOyCbsy5ewgt5CUrf0/dU0aGdQM+OIFsAXr0vDgSkw4WqJLSRfanqCXecvyVJkVzjeU8W8b+gWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:03 +0000
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
Subject: [PATCH v5 05/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_CSDIV clocks
Date: Fri, 13 Feb 2026 17:27:31 +0100
Message-ID: <91e29fc2faef57b156660fb00f5e132dec3f7d00.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7a079c74-2389-4487-72ec-08de6b1cffff
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qA4Ahst6tZ/772IU22XqSn8CisyMdlMj6KS8cGHoTubHyhKJ8SSoR4/NiZJw?=
 =?us-ascii?Q?igTC24Fhnc0+dXeAYKLPuuCHj2QYP0tYRB5vmx+31ExZXNMbai8B16rGHbKp?=
 =?us-ascii?Q?+HH1pbWaNUZn+nBIdp2aNALpmVkicgRuHUSpuzm7HrE75JRP/5p0fF1hub4v?=
 =?us-ascii?Q?UzVH13dJHQKTHkwrsrMutozZKSOzaxto2b4ohxzBtSw5hSwt2Mj8HcgBXP7R?=
 =?us-ascii?Q?vmrO0Ei3nHMu8VmU4ihfz8bLNhpLYBTphdXSWacTLTWKDWu228jPrHveT3YS?=
 =?us-ascii?Q?jeLPVs40aoXou9Q/0zzAUekJNiMewyTuCwuMewcPaWlskuDg4i1Yi9CQys6U?=
 =?us-ascii?Q?MrEm9Oxx8tQHEnAlWP+osLVN3zAYa23R5B1F9uAvktJQh7VXE+0owF5t3xNA?=
 =?us-ascii?Q?0lRrLPOrmvHv4aoTwaW8PYuR9apyGOzTSCh/7mJiABJwy7DyPuateGEpH7U7?=
 =?us-ascii?Q?zaA76E/YpAgEY2nxSE78BUZKcTURfjOSYoaL+IvvSI85vod7yaavNdpvXrD/?=
 =?us-ascii?Q?OT4sBU91Uacsw2nMUQdUtb5KY9vNHXjNZ2uqLA9sxvtT3xU8Qwl7Vhvf4Cpt?=
 =?us-ascii?Q?jq9a2qQlWMBrbfxlx6kc4LITIi5iWPN9PGm65itPM2vzc6z2NM6C94Dkcuaq?=
 =?us-ascii?Q?i0lw81YH5fshEL5C7rSCKa6dmoLs2NEwAffQid5UXb7Odqzm9lBPxcZf9uOS?=
 =?us-ascii?Q?5PcowgCCLHos+rOHPghJu92ZHiJddTe8sYzaatt7gvHYoa1xet8zaIYS+AR8?=
 =?us-ascii?Q?biZYhYi8YIWPtpvk3KayA1zIg4mQw8UgF3LS/b5Lz/5lDXYTUH1ZAFYtTyYB?=
 =?us-ascii?Q?f2xpTW5t2dygQlPxTeM9oENUN3873OR0bsOfnoKAfn6zWOT7iCve9G3rJVwe?=
 =?us-ascii?Q?iYnVZeKKsGuHLNYBmHBWEjZIKWmy5wElRef2CMWPr48v32WRlsz361C6yt0Z?=
 =?us-ascii?Q?qI1OhU62Ak1JNTXqgl38kvwUFRBwPctOr8c61OaWtrFj2v2hUOKJiEQ6P522?=
 =?us-ascii?Q?PWVSAeu+5ERUXSfH5GOP8vDhOrZSuqqFbvzInmM3fpmrtGK6USLdrYdqxeuW?=
 =?us-ascii?Q?zK/dE2ZNMaQU3IfSoASwSYL6U9DwulAZ7DBRIrPioPF3vIUd6QMz320u8vrE?=
 =?us-ascii?Q?N8lzphexVm0F7KPtHwLbVyD9u2jIADnKyila6FnKOkruByhB1RGrJZL1oKxd?=
 =?us-ascii?Q?NYL8zMDHEj8kCcsoTDEk9cvrjHrHrmDMnvezpk2CvLDTUEDLZLLqdcMbiEsX?=
 =?us-ascii?Q?86p97jcztmDmQoJzt7Ke6e6bUd047Wfh1BByHhnj1YDzgHjO7Z2ecNxwqNPL?=
 =?us-ascii?Q?kqTCW3kB1sDHzPryIq1qM4Njkog+5K7Z2ynxhmDomoOQsLemt5m5tQJcKO1k?=
 =?us-ascii?Q?OXUV+XjIpOZ30Ww/BuVKU2WEUyQekm7H8D8t7Z3dhDRW7Z4VuvKFd/JHhKBo?=
 =?us-ascii?Q?ld72B6fkaWHaIhBLij29YACDSl711fBf09vmIB36Z3lW8o/kPxxU245xHuOX?=
 =?us-ascii?Q?QpUqreBMQsRhdHrqWNe/cXOUs73e0Xrf7uWQLeek1duxZdHmaBY2Lnx8jcUt?=
 =?us-ascii?Q?BtSuchogHdG0qVDX5jZufPI5yicAxUSc7wWpYq6o8jtmaAPPeJlJJDvOgolw?=
 =?us-ascii?Q?zKA/Vk24RE4tj+wY+Z2yl4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NL3Mx8Br9AAWZfVmEyDkfunKjx2VxZcUY3ljYIqlD9HxKj+Kf0paUb4EUftP?=
 =?us-ascii?Q?OLSabQSSQZLBanu8XSQO7GvupMtv6IkvwYhyaVU/NdNfBZIaYY6mf+w4MV6B?=
 =?us-ascii?Q?5CXKZvTs5ZSbwuFP9PKPuVn3k4oGliqzUjRVvTRsxQ6zeBYEvzmvEYADxOWi?=
 =?us-ascii?Q?61XvQv4MC1kK6LqmawEUqebeT5TyXeu3XQLuV40ZG3prs3cGNBmF5h/zcTRy?=
 =?us-ascii?Q?RMB7Rp507RzqpBCuw8zl7JyIRDT0h+Q9FmEQwme2mJwtHjsppbCXUJdiDjz2?=
 =?us-ascii?Q?ZanA2fGzdT520XJ6/sHEKZb7piPj/8G17NMiUZRQXjc649hq+OoKo/YZvhGG?=
 =?us-ascii?Q?AtOjjC2Lw3UNPArPDDkInTojQp1MNgoZ1rKyELkUBDVC3hHjc0X2MMvCIVUx?=
 =?us-ascii?Q?/601Blc9/HZhZiFX4iSEtLaF0SCa0Ixnvup2fc0d4ttNmFRs5zACpCJZR7zY?=
 =?us-ascii?Q?JUsfCdw2fN0WJnJbCGwcD2fazi3OWJnfoBbWhU7QqpvVRn0wV2s5DzJnR/EP?=
 =?us-ascii?Q?q6T2Ww5vDayvhBUJcX3ApGS7rA1NnVuWJpUrDrOKtFsZ3VWzKs6O66XKom5g?=
 =?us-ascii?Q?QxVrNhiag7Pltd5afqO0zFblCz0wVkiYTEG4RdC2QQFvDZANiDb8SZIN0NSC?=
 =?us-ascii?Q?Nk6Yi97SvU1SV7WPQVT1lI+CFX/xIrWv5Lytx2HfEe0Oju6dEedv+HZs0aum?=
 =?us-ascii?Q?V7LV9fnq1JZmLMS5cUvHYzNI1Fzzw9n/24tG+FfJUYg/v8Rv/FiXcawCg4ud?=
 =?us-ascii?Q?H6qspOR4ItPajieu5wnWnkcfxlFHml5ULou1I/jN+q+YCMCgZb4uA/qfr+XI?=
 =?us-ascii?Q?7n4D3+KpKHbchzqe4CaqBZMciqDKZbZ0aOuJLnzKMeRQLXqCY+6WxxWCU6U2?=
 =?us-ascii?Q?QrvFp7VmvnhVvL3rtudG1xGwoi1+mxE8i2nZJwvr1E1mqv1pYaEGTydza4ha?=
 =?us-ascii?Q?lcGA8ggH1RuH81KBJcYzk/5jcQl3Tx3zlYkKAhHW+AvIOn89AsKttXNZLh+2?=
 =?us-ascii?Q?OajoTpQAJ2rkwv586yd66Eqsgm2pvmRTsRb3ULGoE1mHdWHVh8rXNzDf3H5c?=
 =?us-ascii?Q?hFSUwRkq5/l4xAwyTE0e40Ah5OZbnV8YsMXtedjNHgPp4rCqZP59O0/HiiXk?=
 =?us-ascii?Q?tSOxoBPxT/bD80LLFJFEINhoyyHxPE57mr+9vPxcRuoYPrkXYHwHqAIuErtX?=
 =?us-ascii?Q?fcLb/HppxWdzOHntL4RepzOFWcwUDxeMAAFwCTy4mQnR0pmhfhGTXG8i3oWo?=
 =?us-ascii?Q?FiyzaOuBjRwamixqbly1KJFV671fHksLmjxGax0Iv5jxiJ5GocpeeFAAbi50?=
 =?us-ascii?Q?1engSX3jqgkyp3aM6l8JI5cV7w1ubiWlHawOXIQ2kfXzzfyLOMgTpnrFHn7i?=
 =?us-ascii?Q?H5+a8RjZhnK4T0RuqKKIK/aWLs6G+/Lum43VN/yvlyaukgEXnebQkbEAANUn?=
 =?us-ascii?Q?bj0vv+v50AlXpwLj1HMBhlSdUBdOzA8+kC+Wkd1V+//ufubQOYJh8UGEHcuu?=
 =?us-ascii?Q?H7wsXOKoDH8zaFlnAlLM+klDCGf3xOTB6qcm6/utZRpsARUOVMnCGeJZPJen?=
 =?us-ascii?Q?OcsPK0Mqzw+dCj7P/hqomWMsHySl0PQQlnI5dGcc1JyuwbubzAWqKug62fTV?=
 =?us-ascii?Q?UVtm8CwlU6s53QaEfRW+rMiv4ghBgl6CflYgvT7gpFp+qK6eM70vlPn5ulDJ?=
 =?us-ascii?Q?S5W/K+eL+r37RUfnHHVrJYLD6wPgaxIFFT+zwDpF0B5591UNUQ3rp0woxLKh?=
 =?us-ascii?Q?/0mJZmcDvLPu3J8yYOVZN+wlMYpVFRmIHsvkA+n/aO9ohvxgO0CK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a079c74-2389-4487-72ec-08de6b1cffff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:03.4594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJ/viA57f9WDCG/9tUdwG/TLvAaORI7awe1lsIkboVX45PdxJiSP7xpX9xnSY5dGZta/EByZEtSHsP0NenrQDPSm53NKH/1ZjHYzN02LtwA66bLf9wQvbllzoMcct93J
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bp.renesas.com:mid,renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 62C08137FB5
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable DSI and RGB output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 18 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 0e707391283f..aa6528b72cef 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -71,6 +71,8 @@ enum clk_ids {
 	CLK_PLLETH_LPCLK,
 	CLK_PLLDSI0_DIV7,
 	CLK_PLLDSI1_DIV7,
+	CLK_PLLDSI0_CSDIV,
+	CLK_PLLDSI1_CSDIV,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -98,6 +100,18 @@ static const struct clk_div_table dtable_2_16[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16_plldsi[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -198,6 +212,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_PLLDSI_DIV(".plldsi0_csdiv", CLK_PLLDSI0_CSDIV, CLK_PLLDSI0,
+		       CSDIV1_DIVCTL2, dtable_2_16_plldsi),
+	DEF_PLLDSI_DIV(".plldsi1_csdiv", CLK_PLLDSI1_CSDIV, CLK_PLLDSI1,
+		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 74a3824d605e..33bc3c27291c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,7 @@ struct fixed_mod_conf {
 #define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL3	DDIV_PACK(CPG_CSDIV1, 12, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.43.0

