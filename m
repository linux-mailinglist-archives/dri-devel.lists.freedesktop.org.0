Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHrRMcORgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086ECC02B
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4225910E48E;
	Mon,  2 Feb 2026 12:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AjBcuSoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0928E10E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmmDYMre4TTgE/RtAXpHJMxSusdhiNPo8nlYNtiWSMNqxpNjfquv1Jnr2aoPrPBx3YPNbsvF0MIe8O+R3TmcjJjcEoCvNt+xamZJI1zl2aqFu/NTkhRa1RI/tSa4Fd5ascRkSUci5QH9EuwOFT5hJOsMUQzDmRJwyk1UfYI8W4yXzOilU3I1C7LK7cLm7pC0zUWUkE+NSZhenHl9hOi4gPIonO2SpxTxVsnxE4lXfZoC89MJ5mzDIsXAWJCVhKx8GkG/Cko8DDTrRcdFcsMmv9FugOrrHFnmlFawiSjcGoVXO7YeEVF86eKD83kXMBa4FGnhq6JTsbBdYRXUlMlOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEBtFMtCueh4b2qrbyVMS7K2jXTvn27Ff/fLLuc9yDM=;
 b=GLUJ5mqCggwABZZoV7JdbYR9K22/CJ7lF5T+L/7DubZd8mm4ur68cLhfiCTVZXnsHc3B2gBT5fsyHZnGZKFrbpKYhj0XdilJI7FjLcsvHZOds+1DE5LNyghFY8E7ipsgvQEVhhCTEcDMtLZed3msGOZLSw8Ftu3W6QA3CzZt0Qt5d0aZ9ahq1Z1i0wX7ZwXfkQ8wTICa/ubdUXKa1Mrv2DDekL23e+zeMwxjGu2jZtDfiKPM6rZrZuB7g521zEpyhhTQJKmaccBfs1l50mjUYcUP6fvmXnbClxCwzuT0e8QTqYRc0zr3CLAgB3QqETBS8/carESSE5gMwjvHInDtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEBtFMtCueh4b2qrbyVMS7K2jXTvn27Ff/fLLuc9yDM=;
 b=AjBcuSoYbFuhZ0fn7ckkhw2ek9fWhCQD7sTncOrKoUIdQxb3DtIRV3o6l3YellkijgKKNwoJ6z3cVma5DB+4ShITcSJKagjWeR8DOGYOJ5R9BaOuljddzkUU1m76z8KOp/TMRtlcB4du6GSGCDw5LESQh0U00n42pKlJZpXw2XU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:57 +0000
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
Subject: [PATCH v4 10/20] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/G3E SoC
Date: Mon,  2 Feb 2026 12:57:41 +0100
Message-ID: <9ae5c0d817ba697084be9022ad7fa20e9e167073.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2f7275-47e0-4d93-7656-08de6252956b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OgX7liXyLvzGmhSloAy7HXZJKw5vyhPd5wM7objdm8ZLK4svK7iG//nZHhsn?=
 =?us-ascii?Q?fMkHLkjoI2vB1mbS9KRH+6gSbb3ukOTecowQewVsLHe3NyPzsJxiTimbwE+z?=
 =?us-ascii?Q?bQhkxKmnA4JTuclK1rBcGmbSNHbmEK3VasHkGLvfVM8fUri3k24NGuzrlGgD?=
 =?us-ascii?Q?7we9BQLZLs4LuJ2TwFOlXv1iX4P1GrtC9nYgr8OBKZv/+Ub968nLX5Sew0+8?=
 =?us-ascii?Q?7uGGrb5upwPH5k3wZ2/arN2uP+8h33Sl3HwCH6qglQKllaeBuZtnNPaAk/V0?=
 =?us-ascii?Q?d1yHqtA6vvq7fr3F4Ykv5pQGBJ5ACm/5TN/DpmILNmx900ZIkhVkmREKd3k+?=
 =?us-ascii?Q?sVr1QlIxPhrVNDRGeRYI0RfO3ptVbwl4SJt/RLptdW/IVCnKAd8y17agMrkf?=
 =?us-ascii?Q?2L0jblJp6xcD7vvT/vqFaoAquAmhEu/awIDjrK6VR4Ly+L9PyVgrEyJHALCN?=
 =?us-ascii?Q?6LTbr7/EncnLYL25b/j+cW9Tfnp2UkuxR69es/xFs1pL0Fito+Pm3oBO04Xd?=
 =?us-ascii?Q?CQRzEchXSjxR8lIaKCYQREb0xcFYIBQFX7L45E/1Aokots18yMG2VlzBO+Kc?=
 =?us-ascii?Q?BImzrQ8MfAGpPfOlUHohKQDijtPtC9rY4+Xn2Ym5id7HSHC43UWiZ0cFnVhY?=
 =?us-ascii?Q?ps5Yob7W76WeaPlN1IAtdyDlsmioqBoBmpgwIHNUtTqVdKx8P9bb31SP8J6f?=
 =?us-ascii?Q?+2qnRTcHS3NUcPrIKZ/7nlKXE/QuF6xUcwVdHpmxwKEP1eSw7N+fics4ULFK?=
 =?us-ascii?Q?RXtsd9LcLg323Q8perZJc64yD04WWGaR7Sj352+BHOBsyZ3iVDlG0NECkri+?=
 =?us-ascii?Q?IDvs8qKgOBPO5NU3YV6TvjKrKeJ6FyaJGlgpiSK6/8zPazbM0OnrtPeo7lx9?=
 =?us-ascii?Q?tWO7xRjXtOjNYh2+zbglIa1H1SWchcXzs1F2E4OmTKKZdTE9heEbQPhjm0OJ?=
 =?us-ascii?Q?GuAzc3ly0bX8lxkgipRw9WpKWe0OdLXYAA02A1zI86n8ocfarGikvDj0gGmQ?=
 =?us-ascii?Q?T2McDjZDjQ2nMSBH+xPKSapFzw45Gaz0zRwE1ccRFTcAc/cvF3+UQ+8nVhVK?=
 =?us-ascii?Q?HUhsmtIoFy16MTHNmTS13iHSEE5to4g+dUZTAOYnHhJdeDec0t/l/Po1fG0E?=
 =?us-ascii?Q?HY0DDtLIhJ5aukRIPXeRPUXREwCrSiBDKv/JKJZ7scOQyLTgTjRxh37QW82t?=
 =?us-ascii?Q?s7U5cMQgWqxeOJkUPQDyGTBPhK6zPY3SlA9qQOJOwhOj/wP+b6UP/eZiCF6a?=
 =?us-ascii?Q?8gZ4zly9dCkj4zk7+vGKGnmsEMla7KD4lCOVnkhdZgAeiKuo6P7WVRebuGVX?=
 =?us-ascii?Q?a3LUbdnv+EKLeVlAgn1UzAHzF+AAAfsDRtsW+VpALsa4secCdLOTwOjzqo8s?=
 =?us-ascii?Q?V7AIHfgfueRIPvQs21maHkY48xmNc3ZbU4Mhs2wtPyKhgGulXhmDB2wY6omj?=
 =?us-ascii?Q?Q9eydA/6s+MdA+qfCYx+Rc/pgDwgeJAzYj1Tqzx1RNWJnzwkft+gjwHuugKn?=
 =?us-ascii?Q?q6tx9ewnczgKF6XOAkXC5yknJpYe5f4W446WzmnGy9FB5wVBDpoML5JcBzS+?=
 =?us-ascii?Q?1D0uuAa6HqcwxSuJapKxuMlwEgx8co0fESQs4Trf+AkAaUnac6yVduAqW7R5?=
 =?us-ascii?Q?8b4nPie+5Ra8v5cBeoL7c6c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5zMhOlxg6LsOSWjDJjCkMjsBJ9y4dR0lCg+wuHDelPg0lKH2qC7GE4BJSOIJ?=
 =?us-ascii?Q?fMlhTI5BntDmUuy9HTqYYeiO9lmDjA+d3ac31AnWl2H8rXfhqjjdcQJV6TWv?=
 =?us-ascii?Q?XKCovGQLZ8CDSyciyd/HBNFFdVm9GJYdwt0WzzQO0kxYc1DSJkVEEt9iV0wy?=
 =?us-ascii?Q?FfEJgGYC+4SGtzNLOXQ7zS2nZLWVkfhWIcfONYyiSXUvjiycFmiC2h+j14+4?=
 =?us-ascii?Q?Z5/aXC8D4cnerEwUosqWp2aSKowe9bDoEUc9YccHOH+AyjOFReg3OCUZuC0m?=
 =?us-ascii?Q?S9KSe0J72KeSGr6XiIj2Q3SZYTwxelhL5iBOjDTr9YSsLmqkbb0WNPIImvqy?=
 =?us-ascii?Q?ZAGPJoyQda5Wp89XF5LiyWgWN76mQ9e5iNYVQTRpEE/6/BTnxwYOoManiXFK?=
 =?us-ascii?Q?N1kxA04XKI40evUqa5Zw387HiRlOTAW6oS0hHRw6N3F13FMEA2rrEb0I1mzz?=
 =?us-ascii?Q?zJYpcNW9j2iV9NiPF4bDOYsdmXjpX/dI7yUeROSDcOrLSIMDg4oxmRJZb6aV?=
 =?us-ascii?Q?YsFhlTO/q8HG1PneBwX6vv54kuV2zoAEQA2/JJMnD0e5FL9TjpyQsy6Y+QSF?=
 =?us-ascii?Q?C1UqVqA+/BEzkWZFVtjx+sQHaQV1aseozmTKef98Cw5mxzVm2GmQDRMrWCH3?=
 =?us-ascii?Q?fCBc+TCl2v/Jtsfd6gHZLwOidOvRdkMeqL4smuK40rsyUVG+UWZCDW6G7ut4?=
 =?us-ascii?Q?6rnEbiImRlEnyou9bmqUU3ZJZF2STps5hB6V9zZXHydNo3MayJ7CekvSS/fL?=
 =?us-ascii?Q?mS+k9MpU+TaUhtY9Xv1sfdhuqQBriM0ILt7Wl1i2dOdDvr2o7Q/jsLHKCS55?=
 =?us-ascii?Q?fBDpY2WP6AMJObRzfzBKbACnLk+qRRb6yM2fZd/8khpZjSEh1A7VlNfWMEFl?=
 =?us-ascii?Q?yjPMvn5GRKFdjfDVh/kUdpbcV4+/iSEFKIqDnK/3D3tTLz6X/jGCsBm9UdKP?=
 =?us-ascii?Q?6UaqjaVjy+KF1DdXrl+Ev5kFZtu9wp0cC4xhGD0a2WAwkVQ16FIgrZWQ7/AF?=
 =?us-ascii?Q?bWAxM1EQYAAyn6pskQdTUkRx8scEdNAepsZiusDh/kbrFnx7+q6lIv6REqwj?=
 =?us-ascii?Q?KDwODxgyRTg/GOSoYgVqyM9g7w0HqzLxCaZbSic2gMeAoyCzdhhk2IBcgSCh?=
 =?us-ascii?Q?ALQ8brIgRd7yhh/LeTO2KH1u9j2cccf5rTtYaOfQu7sCmJCLL0rnoiuKYGgs?=
 =?us-ascii?Q?tbVBjETvj48VJ6UqCkpkcjDEISKzbe1YvXsbNDUO7mL9UADKxKAyPIi2+7Xz?=
 =?us-ascii?Q?V7BLsMnmP7Acs7XoxQZjh3RTxgn1nWd1Kbjf6s+ZBvf+eIKkY3ehdxK0vI9Q?=
 =?us-ascii?Q?YgWP8cHKfHGCAQsHCaKGESP3kT/+u5fCh+JmFPTDp+JwP6ZBpMfuzUcDSWxT?=
 =?us-ascii?Q?/F7sIEA+5d+IFL3ejXEVdYazDKBFsnplK+eq0EaOfZp19c7oHscieT7cw97d?=
 =?us-ascii?Q?scFnz/mGVJ5nC/FrzqYwyzApSvnT5/Rb/oEJQ3cwTJuAdjmbS7KzcQONQUXC?=
 =?us-ascii?Q?RqHbY2i1z9jAW6HF/kwwZ6AQIMZMtezLb8l7O4fPePAswDvD4+a9hKnieZ6G?=
 =?us-ascii?Q?rSP4BuIQOLROhBrj2MyaAzTj9L1CMzZP5p+F519AcY3zaGVPMKhuimLpxTtA?=
 =?us-ascii?Q?a0EowUOAbVRfIKBartbOiBexFZZwTj5i/vztSuuR9KU0YFDmeVAXvhmEQKHa?=
 =?us-ascii?Q?tS0rlVEKpgJ6E/W33Z1QpB31BDssiiVAkMwwt5qySBF4HZSLmuFKmlTfOMri?=
 =?us-ascii?Q?pNWFGtfa4MTJvhZC/+ycRl5uAQnOADa+2tMJpZDDl+e/7XiKEMpl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2f7275-47e0-4d93-7656-08de6252956b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:57.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlNRdLUecwGll7xicK/VRAiMdZZaBoCaZa7VCM4HBZdg7gadXOkvOvFr5kHI+ollnBSxY8PSmz/9Aljjg9Ukyi3ZqSDq20mtOwlP3mghXTXITjLyc5zVWzB9ORsRdUti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
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
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.1:email,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 2086ECC02B
X-Rspamd-Action: no action

The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
or vclk2 as DSI Video clock, depending on the selected port.

To accommodate these differences, a SoC-specific
`renesas,r9a09g047-mipi-dsi` compatible string has been added for the
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Removed oneOf from clocks property, which is no sufficient to
   differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L.
   In particular both RZ/G3E and RZ/G2L have 6 clocks with different
   meanings.
 - Use the already exist vclk instead of vclk1 for RZ/G3E DSI bindings.
 - Updated the allOf section accordingly.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
 1 file changed, 109 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..00ef279129fd 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a09g047-mipi-dsi # RZ/G3E
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -54,20 +55,8 @@ properties:
       - const: debug
 
   clocks:
-    oneOf:
-      - items:
-          - description: DSI D-PHY PLL multiplied clock
-          - description: DSI D-PHY system clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
-      - items:
-          - description: DSI D-PHY PLL reference clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
+    minItems: 5
+    maxItems: 6
 
   clock-names:
     oneOf:
@@ -78,12 +67,14 @@ properties:
           - const: pclk
           - const: vclk
           - const: lpclk
-      - items:
+      - minItems: 5
+        items:
           - const: pllrefclk
           - const: aclk
           - const: pclk
           - const: vclk
           - const: lpclk
+          - const: vclk2
 
   resets:
     oneOf:
@@ -136,13 +127,6 @@ properties:
                   - const: 3
                   - const: 4
 
-            required:
-              - data-lanes
-
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -164,33 +148,123 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-mipi-dsi
+            const: renesas,r9a09g047-mipi-dsi
     then:
       properties:
-        clocks:
-          maxItems: 5
+        ports:
+          properties:
+            port@0:
+              description: DSI input port 0
+            port@1:
+              description: DSI input port 1
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: false
+            port@2:
+              description: DSI output port
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      description: array of physical DSI data lane indexes.
+                      minItems: 1
+                      items:
+                        - const: 1
+                        - const: 2
+                        - const: 3
+                        - const: 4
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+    else:
+      properties:
+        ports:
+          properties:
+            port@0: true
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: true
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL multiplied clock
+            - description: DSI D-PHY system clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          maxItems: 5
+          minItems: 6
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
+            - description: DSI Video clock (2nd input clock)
+        clock-names:
+          minItems: 6
         resets:
           maxItems: 2
-
         reset-names:
           maxItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
       properties:
         clocks:
-          minItems: 6
-
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          minItems: 6
-
+          maxItems: 5
         resets:
-          minItems: 3
-
+          maxItems: 2
         reset-names:
-          minItems: 3
+          maxItems: 2
 
 examples:
   - |
-- 
2.43.0

