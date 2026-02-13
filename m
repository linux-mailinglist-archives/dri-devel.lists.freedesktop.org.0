Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLATA11Rj2noQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188E137FEA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FF710E826;
	Fri, 13 Feb 2026 16:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FZWLD+oQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA89D10E826
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTvXwTA0Wd/CzP4Ifebwp21zpC/3UIva0sdGYC390Zr78bz8p3vIbUhFcRyF9hfAKj1UcvNqgg3rVCL8qN5MqTiINy2sZNZz6BL2v+ClosjPF8/3BRCRA2+aZPGRwv77AQkwB5RyuN2pXFtypAkaRTOKRt4XeQ1iDZ7rBpcQlzgT5Paqxr0z44UGhfCLTKSbIkG7Wyhmqlxt+IJISx+SEs3Rb+Tb9I46zA4qdc2Ivy+7ZejKGT2bqmhIXAr7mLZN2sYTAm7SVQ/kaz6UV80AZ9/E8itTjZLiUGRupzyHjpVdEYlxsygfaj06dXfgTbgm6+q0nx6thutnzO+eSDAM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESO4gcZZ1nD3Y2YnOQicoWm3GsMgR0yHLyZgRfd9lIk=;
 b=UKuXCuVxxXJbeXkAgahmn922scIHSRj054PHbnHSYJ+pZd7sAnJ7D+g2RHfJhsr0iCtiB8y5L6KOlcONehS8w3SUiitSl2JA5G1j9SsYxVKNOuPbM3PSsBOx/cd7srVxrXqwYCsbJ6r1tEAfZJEZYgqhTg4OQZeIlU80L7HAfzuTPTfCuO3LjqKxmwP8n7haulaupVWFjnHkGRxjk67Q8NTEgXig2DDEOEA0RevNAVyNWu11UzQtzCKL25behYZakzbV85P6j2w0O2eoBRGd6R4SjoCOSm2Ko0i3UaUqvs+DJOaWCQwBl7KxJ4Hs6DnEQRBZEp45aQ5yEpR8mEYONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESO4gcZZ1nD3Y2YnOQicoWm3GsMgR0yHLyZgRfd9lIk=;
 b=FZWLD+oQ/R22ZY2qyQPt3MT00PFYUK/IGZeMwED0yByLG1x7Eo1V+5vrVG8sakzdq6nEDPMGULP55zRGzL2Ua3lH7nYHlhIj2K5JNSnt7cyBY+PSate+WYNN3L5aKUIJdStpqIpQODA8gIj3jO+FC/wqGcGqk/ooU/M2lCeJlfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:11 +0000
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
Subject: [PATCH v5 06/20] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0, 1}_CLK
Date: Fri, 13 Feb 2026 17:27:32 +0100
Message-ID: <3a5938b3f123d994ad1fe14b049cea01415f0e45.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d358bef-dedc-433d-3db9-08de6b1d04ae
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ll0luJihD3eTtXtoQFvl3niZtnOdu2fYzcd6dO3JCk1p/t1i/6J0ML8EWwLX?=
 =?us-ascii?Q?yXCaa6khO4q2RoAcvXEg43S5du5iu7Eh0Px56KY3e+Ru9MpQ/U9rQbzDEoxk?=
 =?us-ascii?Q?NIJK5CMZm4dpymkVZil073FpohsKJ97uoqFU5t0+R1VFJuzwvuUJrmiccZci?=
 =?us-ascii?Q?ltkn6mLA9UKEbBEZXsIAHuIgAybCASxmxcO/6yrFjPeWfRRLdwDia8jJhp5x?=
 =?us-ascii?Q?IL4EzYY1N9fUhAk8jrFP6VmUVk/wwUg/rBP9OVhh2x6Md7yHKT+agAVq25xg?=
 =?us-ascii?Q?2sVQR5GFSSVqFAE7jLjw2DzPDb9GxSiyqvMgM9MBf88AVcg5w80Mi/cas0NG?=
 =?us-ascii?Q?sDGA0jcuDdnoMd1Jk56QS7Lkikwdd+C7OV8RpZJX1L3jajY6wJJQIvMLj4X3?=
 =?us-ascii?Q?mavOfNEFA47k/rsXXuN5YL7UVgpEd4woS++RCCw0nY4ZvJJiYcZ224IfvknD?=
 =?us-ascii?Q?0eoaOQ8NmiOcYTbdQqCHvBQQ5DpjyRhbKiV9P9caHgMUcFXY5u71UhmlEGjB?=
 =?us-ascii?Q?Sba7J7F0Q688+3+fMxsvVAH1Yh0jUH9rZEYrzzU8jle0OPmCiJuXnivmM6/X?=
 =?us-ascii?Q?vvyshp7iDGy+VU3if0FFZ3+W5iKehizRBJg4BH10d5+pqi6omtCmZOHkBYHP?=
 =?us-ascii?Q?c+Ci5JW1/AUdwGbNWeU61YB6jr1lrj5oRaugfQulFwj/kDidxZJl8IOqaIg4?=
 =?us-ascii?Q?hwYtYvl7dBGIHWstgE3Zi6/Dl5nPHquNftfSxWd5ITmIOaJxMNPaSqsjB51b?=
 =?us-ascii?Q?Wj+36k2ihlRuUWp6inYOflEzoIcCXFSvMHJ8jopR0oef+T0BUCGOMem+M/VS?=
 =?us-ascii?Q?t7CNjvKTr4C3uwSnmtIKyYlg8zTbSM0SbRNhsUBzt4M2aAmg8RHOl+lvBpAk?=
 =?us-ascii?Q?7n5ImLc5M/KWZVfoVBhkY7XiRV4l6iybuQnjHMQjz58CudbAeTBCxHc5mKqT?=
 =?us-ascii?Q?hfQDxeWfV9hY0SS5NdguskyRN4kpc86I/EX5VHZR/SI1ZTwxKsQJiaREN5X2?=
 =?us-ascii?Q?TPuiUzbLLMfk+tegKnsOPxFbCUKDBv4IuYWyjESI/Tou4Ll8QVDVVo4V5eu+?=
 =?us-ascii?Q?h8Nav+uAh16fwwkCxzfoYTRQ6Cm03aZzoSwvOo7NqujeSSpNwcvhLql3ZlU6?=
 =?us-ascii?Q?eaiuPc8aVzN8huJv/ORdUzrGkuCh+zcxy+eJf7hNEfix2Bxd6QkYCwabvkdd?=
 =?us-ascii?Q?xaekh2ypVG78DOTw+DlSW6UHAGqkEgjSbapg/cJwKK+J6VI2SBKGCW4UncRt?=
 =?us-ascii?Q?n7Gx0DVhZsx7VpcMw5C+VxUWEvap15N3Xko2xu0LpOmawv/W31/joAerlaKs?=
 =?us-ascii?Q?0wh8qgJuKtZWagF/0HYhVVOyNX/iIVa14bXe/aG9X8VhsHIq4QjkgFZT44jz?=
 =?us-ascii?Q?KO2Sb7QkssnF+AMBvKJUynEHpaZlrgMb38N7BriM5QwueyvxQaGRMuvD+viR?=
 =?us-ascii?Q?0qq8I5nPd9LYgZYQO8m1rvr2SdjLS+xskuxyZiGWnAwHGnfsoksbNTDX0ss2?=
 =?us-ascii?Q?rPctHr/Fjq30Yo9tDm5ihh0kJVxnuilDeC0mmSJGUuYAgd+H2aK0ePXcpVVF?=
 =?us-ascii?Q?GKQ2eSYV4ZGVKFqLLL5sDmnrBzotj6l5OwP2mXkPPV7tWAZblc3YIE2HKSAb?=
 =?us-ascii?Q?kqKPepkkUy5Rf0Jp1IVSg4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aWkPdiPgDxfgPtiNV8p0UEIXDnrKfcDu5U2pbMP0xM7UQ624qR1b5eW+UMuf?=
 =?us-ascii?Q?N6fVl1UdJAHO7CtWmGsBVXJbAzEoSm1oL3RlkxgQZf3mjJ7BpITobnRLFqX6?=
 =?us-ascii?Q?5QzSAZoQDxwsL8gZ0xA8e2Mhcyl1Fwc+UEiy+zXi4Qv8e2oVv0m9+EfZ29Fi?=
 =?us-ascii?Q?CfWZXkDBmLAG8wOujI6nwHXHTD2dNBhuMU/525bSgpZhHStapb+cTy0XF+TS?=
 =?us-ascii?Q?GIT52TU/xEBFIChWvkhEtTicjSxlFeEWpF1+l9PhLoTZxjZ2r11mbrMDKzev?=
 =?us-ascii?Q?Uy5bFcWFayxvBJxcoM5dDFLhrhQHIjb9XMFQL2VoxmJDb4vX95MAwc8qrBRJ?=
 =?us-ascii?Q?XzYGgcMU7c/k/iGPywwY5wm44voeLDVi8sAd3wWEixFPEULe13fgHOmgEqgK?=
 =?us-ascii?Q?OgyiFPiIM9gTBk3vX/rT1vedQNr6dzTCaeV5LE/TP2PtjvBDtsnlSZ0OwhXB?=
 =?us-ascii?Q?Ii9aS5CDhz33W9XHgQavfPm8aEEKfMPBbGg59izt/N2FzriE6SUyLJaY1X66?=
 =?us-ascii?Q?NjgawTUAXfxUnfTnRuhRw5sBqFzqaiI7q8zjvj/S7ac8vtmkrLNt2UhTOm18?=
 =?us-ascii?Q?xERXCXW3NJIuTH55iRdr7a2aMmt0vLspusCOf2f4H+v5/npig/+2TTxP5/uf?=
 =?us-ascii?Q?KZb1a3K+CiTWf5S5mFX6hinOrtUAKD3NEtjpiB1wgx8nWSH8VPfMX1lsiK1c?=
 =?us-ascii?Q?4wq1PeEeXAINjtGZKNIysbA6esXk2ak5LjVs4dd+HVC8rwEw2FR62LZINXtZ?=
 =?us-ascii?Q?kZAslrRl+cXrbAbT65gCXbSqFX6FMEGIdP6iQeaLrgginivgytTf7zz5TZwk?=
 =?us-ascii?Q?VtkC+PoDD0psuV6O7L8CD8nUozMGf2xzA5rYfIczGc4NhVG98VZst8FMEOJ3?=
 =?us-ascii?Q?AqSEHVNzdoggNpla20fXHK9fPvxtVcbjcmgi/OETWZiLLWzQEBhTxU4NrNvk?=
 =?us-ascii?Q?GmeBrrIPZVT3USsX3bP7yLaZsJT80Q0iTrXBbhCFMqWTDQ3MwdnYbNvG48pK?=
 =?us-ascii?Q?rEyYZvceFIw0qAHnyM19TYG7L9MGIwWBGE8fgvo2HVt4A2XfFnJFNyyW8fEZ?=
 =?us-ascii?Q?Xw29PGfm6tHRDlvDniomadvCK3+poVtL89Hi1EInboJnXeNcNyUbS+YMIOYl?=
 =?us-ascii?Q?2Cd0gDsJb9gLKLAGSvuAG7pqXb668apgRNzGQQvOGYza8yFe9zfxZu0WEb7/?=
 =?us-ascii?Q?2obaNXNd/q6dPSNBTOErMJ0W1FGHYM9aDa923Demc9q6d4yAFRmaUx1avNdX?=
 =?us-ascii?Q?3/vVhyAQmgRPpbahZ4iW5Un3XGfQzLcl94HQKc4sF+18kBG32UEs0O3l11rL?=
 =?us-ascii?Q?fGwt3V8cF7xFoCKKR9NTqJzpoWEMzcIoDddS4JINgXKhRmt6dcwyPBq2X0Lk?=
 =?us-ascii?Q?B1jdcK/whh4AMR6KlQB+rXuj+h/mP6rWvsUpXePn6AUqKOv/ej2Z4riwjkGg?=
 =?us-ascii?Q?laNgvhEvYLRoZsUO6Bdx0Cxreird709kyB4O5rAqu0+upz39cJhRIdhbJ+qm?=
 =?us-ascii?Q?uTX3vilOYPQqKGLGY4f1LSXajW9Ir2zgh41nVTuS0cMwVA6Fo44m/4pPl8tQ?=
 =?us-ascii?Q?+OTrCASFSwdv+drcdwBTZHsBQ6QGxS8EiYr/H0dQm8CHymzDKfjztOb/9cqr?=
 =?us-ascii?Q?56bhpdeY/4UjIoQISu1OQF247RMGHXNaVE9znEXpPPyZ9IWwPV58ihGk09Rt?=
 =?us-ascii?Q?mIOtkD9ly0Z04ZetOf/2Kq6O2kGn1rOsKnfqLzxSuoNTbHFOMEKNwZFl8hJu?=
 =?us-ascii?Q?YVFcQmW1lEOz7dlaOJLBzfEQ2wJ9TlMmu1oqQBxPoSQNz7aRbEni?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d358bef-dedc-433d-3db9-08de6b1d04ae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:11.0711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltsW8Sl/lQHVBqbjvvvm6DR+5mk6dMPvId2kSRvrnWP0kO9K++z0Nfn2JO1tMeOvGldZQQ6eSTy8dICVafsxhQUIV9/jDUWcwmihyT5rwq9FhTfauaPHSdyoqKH3oDeB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7188E137FEA
X-Rspamd-Action: no action

Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
present on the r9a09g047 SoC.

These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).

According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
SELCTL0 or SELCTL1 must be set accordingly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Moved clk_ids to match enum order.

 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index aa6528b72cef..1e10e6ff52f8 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -60,6 +60,8 @@ enum clk_ids {
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
 	CLK_CSDIV_PLLETH_GBE1,
+	CLK_SMUX2_DSI0_CLK,
+	CLK_SMUX2_DSI1_CLK,
 	CLK_SMUX2_GBE0_TXCLK,
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
@@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
 #define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
 
 /* Mux clock tables */
+static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
+static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
@@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+	DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
+			SSEL3_SELCTL0, smux2_dsi0_clk),
+	DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
+			SSEL3_SELCTL1, smux2_dsi1_clk),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 33bc3c27291c..dec0f7b621d6 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -121,6 +121,7 @@ struct fixed_mod_conf {
 
 #define CPG_SSEL0		(0x300)
 #define CPG_SSEL1		(0x304)
+#define CPG_SSEL3		(0x30C)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV2		(0x408)
@@ -156,6 +157,8 @@ struct fixed_mod_conf {
 #define SSEL1_SELCTL1	SMUX_PACK(CPG_SSEL1, 4, 1)
 #define SSEL1_SELCTL2	SMUX_PACK(CPG_SSEL1, 8, 1)
 #define SSEL1_SELCTL3	SMUX_PACK(CPG_SSEL1, 12, 1)
+#define SSEL3_SELCTL0	SMUX_PACK(CPG_SSEL3, 0, 1)
+#define SSEL3_SELCTL1	SMUX_PACK(CPG_SSEL3, 4, 1)
 
 #define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
 #define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
-- 
2.43.0

