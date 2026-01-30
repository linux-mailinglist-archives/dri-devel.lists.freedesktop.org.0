Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHdkOwL5fGmTPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2142BDBC4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC810EA3E;
	Fri, 30 Jan 2026 18:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vo3VNwZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB7410EA3D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVc+C9xNcd6WQZtwjnSs/uOmd/r3Laha4RL61IheTbXTj20n2wHWdM+fJ8IHnLDN0eYtjxprTZq4HvXU2YIeiJwn40wsFa20Oi6kn0EnLu2LvgjSXLruPB5sLSrjgmHbil47isxPGfJuPIIRNbBrJgduCItjK+5La1+tjGnhrLgjlcDkHq+Kq7UHHLRnaTapkiE5Cmg/MXDGlMQpUjV3MUVWJFGNZ9+nvE3E1dp0PraG3cshpuUk1B01Eh4K4e/Ji4xVDV9ZIujqMUv7xh19Fv7ITH29Hnwad+ZevC+s47+L+pz4mKbhhNAwZ21eLjSKy4l4wjaToyucwZRUVykXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bysytzme7xM3DLA21mgthme0lUPOEcalO+CR9ZeWo2U=;
 b=CUFcHTw1PbBmaV9y2zeiyRJZDLYoyb/xtnzwV4KIKK0XprdwUPm6dE0tiudqWGdOM/yqCZBDAx36LynGEPXyRCAeniJSunJQ4Mc+CKOU8MKNbumiLD31ZmPdWj8N6YcB2TlNAgp03zRu5+NCOo2e0qMY8AsSux6Kiq7D+mbmy6aaPKB5XzJhEL+sA2zYj6UGG700MA6qhv2emA5dIGbP2dqNUGvPJdDKTF2OzAnU6WQOTSGetetstbPlhRaDQlCaMXeabm+sFHy/2W0AlIwFqVkZuR00dJLT0zR1ZH6K6y1tyUhMMoVwPJAyEl2wG2QPIoRUuBMaBz8Dis37zgvXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bysytzme7xM3DLA21mgthme0lUPOEcalO+CR9ZeWo2U=;
 b=vo3VNwZWxOzn8QNRtzRjArmjQbXHW2VxO0tmWYFONmXI7S6r7FxPXT7XVMeSaKi3Wdjm8VBtvnQSF3q3nBgf7vOACc1EEzTiQkdohBi2ACCv9DJ1Msgv+dL+VH8jgUWMwKLhExA29xQt+8PBm5MoS66EGWtFCPwp9VwRgkZB8Yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:25 +0000
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
Subject: [PATCH v3 06/20] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0, 1}_CLK
Date: Fri, 30 Jan 2026 19:29:58 +0100
Message-ID: <058057fd5c25d2bfb4b3b1583a99496e6989eea1.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ed35555-222e-491a-cdd1-08de602dc6a3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FuRFgyP/c8Xqt7oSWBAT0okScn3or+LQe/EIH6WT+Bxj6bXBJNM8B60z2tE3?=
 =?us-ascii?Q?Sxw1W3VWJ3mEbxA4IpDQvwlwIsUGl1PMlLcfAYOWU9hC3YwyUYkcB9oUx+V6?=
 =?us-ascii?Q?kLOUuaaiKzIXc7BPHQoHTjYejiz34xH8QsnPDL0Q+SEMhowOQbG3KwcHebsF?=
 =?us-ascii?Q?9oFMYRmWWxNKRBtH8fmkYgGhPNDhxX66jIORjR2R2dafZV3cSH/ZC1oo1ScK?=
 =?us-ascii?Q?Y7Ot3SauJZ2QMzo5zlyk8iyJ6JwPT3RfkIEj+inX5EMciVOp5myNqt0KTxUP?=
 =?us-ascii?Q?JiWHdEssIbAUZszkaUqLrc6ZnkzSmfXtE8A+sYAk2yCnRaB14H4OPb3XUpQg?=
 =?us-ascii?Q?2dNNzOVWE2hnMczXKCRfwW+ZOGOYR3vlc6/YaJIV0ux1EaKc2ZPm2sHwMNAy?=
 =?us-ascii?Q?IL5Qtowb3HO/+jfNDP7AyPx0POAilQ0rq1b204s3+YmWb0gqo9BgDN/yhMrq?=
 =?us-ascii?Q?e6HUsvNV4a/7LrnhM/4uJPGk2Y4KsypAxEnOdaSG1aTWnBfIvZSf6b5/5j5g?=
 =?us-ascii?Q?e0QWHjU//r4kJ4BGKc4Qv8lizKLpEIwA+e1YtgY9QXCiEeMYkjIEUvxyK/U+?=
 =?us-ascii?Q?qiPqcfBDR/9I3V3E+iPNgqlqbLmJ7BZMoAdhNJTpP9+pq8MC/06kOLuS7KXL?=
 =?us-ascii?Q?2QT2kKPqBp9Ah0+TEcrGZaEyJMDyBtEwsKDTNHVTTBU77r2zMjSbDXrSKL2d?=
 =?us-ascii?Q?U1kZwaddAiSe8H/dQN1PayzFN8SFErdc3V4PdL8m+v3hVK1unAfgZz8pTWSo?=
 =?us-ascii?Q?0p0RhhPDk9ojd8uvqpR/C7kY9r27gKPx50KdEj09HC1zb1eNWrcjb5mFINFT?=
 =?us-ascii?Q?KqxbisJ6gYBkau9C0rv6xBdSmpcL7BAmZbmrDY5VERhmE8kmI7oow0XwsvWz?=
 =?us-ascii?Q?rtqkFyxr/Mbmzd9bISPYAPYp7b6V7ZZqhdhcjqb1OC4PbjoWvB10oQR9Zb0J?=
 =?us-ascii?Q?ox0RrsrbfbAWwg0iihkmjRSMcxSDRvAhbLONSb+e9XLpAkrivbwhasurJ2Nl?=
 =?us-ascii?Q?rnJfuHrL2TxL0dVkl7vbPx/esOdI/hGdjBw/6g+jrobzERn+seCQ4gfCfj/z?=
 =?us-ascii?Q?2gZG8B978rEdqlVoDMy7CxNN7njLNHpbkLXzB+gpIXxjuZRAmkQkouET+Jm2?=
 =?us-ascii?Q?eeYessZxfoTrjXmZN9Zv7pcR/+f4KhMda2kSyk4RGdHMnNSunZQ4CnRMcEdR?=
 =?us-ascii?Q?X/m/yeh72IuQZ4q+n7nopDvaoKjHfOwEfU3956lISlY3G9MXGHUaBYhLp8uC?=
 =?us-ascii?Q?PDwgtoiD98v7GjDfmO1ahbF1t7jDngJLEbqjFEnwtFJBYjotPT69FBInkWGx?=
 =?us-ascii?Q?siOsgGNgICRYqFTu7WHB4E3tECZPbX/vQ2L9Jby+OEhdr8BZ2uHSErpdJEWZ?=
 =?us-ascii?Q?KNX42EqMKYiGNvuF+kRXJd7DmbgDzDpo6aVLym/AzBExmhOEUbXOHt35A6s0?=
 =?us-ascii?Q?WnnIEVIMxot3fSPs5tiy+MDWs06piD0ozl+57XSCSFvLfMPLWrhpbAFB77rM?=
 =?us-ascii?Q?p99f3kVI+7z6u2qCZAunIV/zht2y0/BfANoaHS7swXeoseoUz72ss+viWC4v?=
 =?us-ascii?Q?dy8ggsDK4HReS5x06HRtuJ8DZcLhq4A2l4CthYRaQuPK7WRufZ/BBzWNWyUr?=
 =?us-ascii?Q?t2xd1Lpuy1v+whgqIusoESs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kqEyXXb7HCgQP4/YnHze0WK6+5XnzH1nMXex5rbIrUgkiWfmPsiqG/o5ptsS?=
 =?us-ascii?Q?hhYRZIZG4iuch4TGv8SacwyR0aHPkHeoAdcOLONnGIeCc9l3QYsdylgNMLqE?=
 =?us-ascii?Q?70Qxbuj5142oluew7XJ1r5LNPcKt8IBTaycIbmG3RDz90qJ9msmn3cVRXyl0?=
 =?us-ascii?Q?BdO5UO9qjm5uL/0bpQeE8uJjaU4J5nq+MUi6v2bocNhYHPUwMxF8OlQZQZwB?=
 =?us-ascii?Q?L4f5/3nMyShWIk+gKxdT6R4FZQXMN713jmEaaJdJOU4xGZj8W4lDodegCnoh?=
 =?us-ascii?Q?lSFPPGRTDzsRbTFiFWd+sCtNtpmYPrIQUvAsVLj7Dv78M/VFHwpqIoLVECcA?=
 =?us-ascii?Q?FzClgcUnTtH2aICfZYd+PyPHgkupCVYDMi/mGBVpADKHo+uQA7iu/aXLxsew?=
 =?us-ascii?Q?jn1zwqcgGcqbTdotf7yBf+O+XJse82c+qpLd8Y5ysQ2HjE1c4OzbcMFfdype?=
 =?us-ascii?Q?y7N5OM8jPCoAOYKv3b4UWG5399YrlvI3iRT9ZgYl/gQ+iddgJhkcwIw7vEiR?=
 =?us-ascii?Q?T08Pa20G0/bFHwXwAP9+Oubc29qhPFcSZiSdCVRvgvnbcrYqDTnP0wuHwohh?=
 =?us-ascii?Q?D7EgLSK+4yfh0a+s+14/y1+kNBfy2MUh1mBVVgVmYONDhZ38K+kL2XADDKIZ?=
 =?us-ascii?Q?X8S+zi681tWySirHjLm5FizCl9wBNatMxe6F544AVvJByIP6oxi2GuWQEVZT?=
 =?us-ascii?Q?QebJQ2BFDvQWTRuSs1uYeZWIODxh74fTdtoW7CrWHAwpnfmRu6i9HuW/AhGG?=
 =?us-ascii?Q?uHHlYWx9sDe1lhWwR1gPkhlIIng0Id2fxCVQzNxPqlL9hihjf5xo7Jy69jL3?=
 =?us-ascii?Q?vGWwA9xFUv7WWxgSA2bH8eJ03D3zVi6i1jrNcr1hlMoIE30+UAe/2dR5eW2D?=
 =?us-ascii?Q?q3Fii74wb0o/k5R4SSQsy76ffP6GiUVbpiDlYRLbciMkbW4TtJGIWD3imsBs?=
 =?us-ascii?Q?E/c1cZSWFHeo4xah22zFpNA+4qugQWJjWJsLs2xeqBU8hjePpkMmfQ/HW1vG?=
 =?us-ascii?Q?Fmbrhcx08jdwo3xBwzjWdbX1k3chEj4GWnUpKbWdjTzB3vvAEsf0xcvn/IWn?=
 =?us-ascii?Q?kbKIkRdEZWcmiEwkpDtSckVhS+jzU2H64IuZluT6vuz2uep9/zljOGFw/cXr?=
 =?us-ascii?Q?gluwUzAaDtfUi0ChLaoUgezD2ZzVdb/FBKWAqBoSuGpcC5fjETwGwug/Mkzj?=
 =?us-ascii?Q?90bsMjm0i7ATCdnZKI8IiGzHZ339DQXbvdsnd5Q43bmJBdnyBGHVJSp4pt3m?=
 =?us-ascii?Q?X5tDWXLcGOLA9yMDeZNx1yHWLpY3+cHeQ6FR9H1OWvVi7HyvaZ24G86JO8or?=
 =?us-ascii?Q?bIXoLMaXTNSfqfbLzMgVeB9f+2XZMpU3pjdvQVdPc4Qyw2t3P++qmzL3CbcQ?=
 =?us-ascii?Q?t41Frx23DQptM5cKUb9Eqh+GWxExUls6LeGAm6Ic7Mn13iBwViJh4hXmPRAt?=
 =?us-ascii?Q?+tGXaPuvEY2VTLGPKgARnryHvu2h6I+zpfcIDZLZ5rcSUzl44vkI2MbWXydY?=
 =?us-ascii?Q?TeL9NJhAowB679V9K82up811rueyadenuzjEiFPjI/mLuDy2UPCKwvFi1fro?=
 =?us-ascii?Q?vRNzfHFIbEsx4bTgjNvw0R4VDGZbb7KtEwPo6DtodoPfSncSVontxR1jfSH7?=
 =?us-ascii?Q?t7azgGL3Lx/outtY/13iINt7jmVPTSAjgkCC5yzvyXj/yBNsnAzsqPpxZzQ/?=
 =?us-ascii?Q?GOLBuvAvO1GkJpRmJ3GjJqxPDs3SJvYifuzI+PAVIT/Yb4HX+KKemGdxi/zb?=
 =?us-ascii?Q?X0UVqQZEAs9OmAyYYRIeoJTUt8xJ1TJAhoxMBuHFdj1a6Z1OKa1Z?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed35555-222e-491a-cdd1-08de602dc6a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:25.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46O27W5Yji28wIHMfjxmMFCtyTytbFvxsYPTBbd8oR7nWPmF+NgzaWjp7Z61jp7qIXyGBnrlfgFdqu50kPzY+kYUSsMP6ya1CcBViTVrStcDr8VvPVJZ7e+b/fmZUP3X
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A2142BDBC4
X-Rspamd-Action: no action

Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
present on the r9a09g047 SoC.

These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).

According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
SELCTL0 or SELCTL1 must be set accordingly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Moved clk_ids to match enum order.

v2->v3:
 - No changes.

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

