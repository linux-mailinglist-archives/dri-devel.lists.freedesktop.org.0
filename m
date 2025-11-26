Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD60C8A33B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB18B10E62B;
	Wed, 26 Nov 2025 14:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uYH02fNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A71010E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIc+hmtF6zCsrdZH7m8sxH88betg9hRFeLd51BDtp2vaqkW+GxuBJH6BRn3NV6xo/3XcEIVwuODeZNnYyNDWW92RiCaIoJiGnnInKBMtzP41qmO9kjZjBkmjz9Urvmg9p4/ihI//EdN7zERpMkYV6o3UbVAJ61Ty2VGxsicHz9aglJ4Jm3UQZAUF3M3yg7khLGa3jPMj1xLxv2Zpvi4PM5VqAOt2M7fFfYb/RQl5tfSonyIpHsz73+CYci0Kz8DNYbKuoQ3gjtKyuCQE6HsLdUuL5n5AiYF0kPZ4kEDsbrVVGwELwN7eR1aN5CP/C7Z3yCGnPxod5ZQelFTkyC3GEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3oEcAkvGgwlV3D84bGmpZbgs7hpzlRwxEyb2PqkG98=;
 b=d/VZITFkYHcVMrkeuz5OrD9Wip/IRCasE17+wxN/qbJ4r38qGM4llZ9fBuMQlH84Wxi9lxmqALz2WyO9Pr4ZrTkIh8MDsRU8OX/h9xxfoPxp5tE/3Yt2JkJ6wxncGiqIJQI4FHBIUGk4buEWoCI4aU51UDmXtVeshPcVpeIhJQ2RlAK8B50KpS1CRPgPXNmpiFqZZaePn19RAye0Mg40P/g9vMyNUw8w250cXNCiBo8vR1Yax9rQAaqVSt7mSyf1k3aquDAABCX0vGkNt6KXe5VtuTjQ//Z6K5sYCvJSD48H/IQ6E0eDe32Ey1DDm9j0AtiqbYwvaQobIHHtzt9M3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3oEcAkvGgwlV3D84bGmpZbgs7hpzlRwxEyb2PqkG98=;
 b=uYH02fNXxRE29TLkjB2hsff5NFRkZLaK7PDMWSz7c/ueRWlpoX6b03XU6mCL44Fw4YGcFjNsVQFCbalRkEJCwo8AzP5AquxuyENtfAyqO/SRCwlDgGLhZHK8tWLE6KCocbJu3yOwpb6Ua7+XLO+8SMFV6yO0XnUJijeHvgzmABI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:11:04 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:11:04 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 19/22] arm64: dts: renesas: r9a09g047: Add fcpvd1 node
Date: Wed, 26 Nov 2025 15:07:31 +0100
Message-ID: <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3af29c-a59f-480b-6bdd-08de2cf5a2e9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P4dbdsbKTwkEtVE/t1v8Hz9wgaM0Gl4vyY3CDbI3aPkHPBlmcODgl1smUEEv?=
 =?us-ascii?Q?Vp1osvRA4KxZ0NaK6y7TR7mbLIRTZl1YPPofSiBk37AhFdJrOI1k+DL9HhUV?=
 =?us-ascii?Q?zu4BAaEJawa1kWCEm4DUpWFYf7G3KjkvE6QKqfDaTICR4GhLTmDrnp7KZXPh?=
 =?us-ascii?Q?s/T6faubLmdjMtmNBZzvQwngrdkUWJVjaUIv8SNSKTzCTA79O9Vyqvg1YKxR?=
 =?us-ascii?Q?/+Ty7oPD0Dba20Iowvivv2yCwf/aQh+PRzEnEALUw31mVDUJb9IZ9vORq+ke?=
 =?us-ascii?Q?X2uNMZVpmqyzYVsvrjnzK0gf92+79ssRKseqDzDlAlpxkoOUtfS9n72SQ9x8?=
 =?us-ascii?Q?RhyCH9ndD1b7YJvZrIp9o7hssc0O0/jy4ea51zaqoYDU6kY6a/KyPYduCwjJ?=
 =?us-ascii?Q?RXqmV3uy+bGPKyyMeEsR5UhSXqWYusZ0TNQOlDug9g3N7Gtgsue5uiD1EltC?=
 =?us-ascii?Q?/uOxRDii4cb/lM7K2xTwddngnk+Wc4tXgvSia4XVVeRqIVkXELRcadtyx2Pw?=
 =?us-ascii?Q?p7FCOi5Zv63rHAfeNq39eH1NquWa7VVXMjj19YyFqkle9uEoWIYIOBlydwMC?=
 =?us-ascii?Q?Mw1dpLxsYfZgOdNfDFQ5FpbUAX/GCu9Kxa2+SmV03wU4dG0aN455XYlouzNq?=
 =?us-ascii?Q?VKfT1m7aWBJe6UwNjQVmaBPnNsWVAyd7DuSU6ZYVFkx1AjFfDwQEhwafwLnn?=
 =?us-ascii?Q?CJpUmDR+YkYvykwuYHaO/lBlc6qf2s1M2UHzr+NGWq996pSE3/14tZ8Yic5Y?=
 =?us-ascii?Q?3ekf4Am9xIVIBYxBtdEV6wpCnQ1y0ivs0JONk0ALs5CUdjw0s8YzDB0ftD76?=
 =?us-ascii?Q?kPxYsUORvQjLyUk35GwDvc01L7pVQUNUT7VsbghIPblvHYrlpfr9sfSeO0Gi?=
 =?us-ascii?Q?HCqGjZOhRMbgstpzygdYu/e5f1ljpFAVVV9ufukh+MHOVfYJiLboJ1fpDP68?=
 =?us-ascii?Q?aJW91HNhGcRlVuSSAGL700JE9HpP1b9UZlE3UDDVLSCzNrTo0pNjA+Wr19vc?=
 =?us-ascii?Q?OBLl1zkSN7KGtZ9b3EyS0S7w+jmD9ru41XTyt2P4lV2dNzQmJPKddznvi6P5?=
 =?us-ascii?Q?Qb4I+DRw6ZZyrt64B1msb/MxRARlVK6WV9ZkRuMqImFmDy2izT89ZmVF0Poc?=
 =?us-ascii?Q?zZL/0jWGSuDQivRJYelpreAHYcINgObxKt9O+Mj0cURqeSkD5dDfvHbYEWFs?=
 =?us-ascii?Q?hgbvJU0XEAKBXPEYUChfVRyoytpsohV/WAvtIFuD6iqOFLDsCmVULsJQw+Id?=
 =?us-ascii?Q?als9PWuqgJvvNxKcV4x01TMidy0doobGjSdysQMIGp5cFUtlHjO+8JwWEzEo?=
 =?us-ascii?Q?p4OHzut1iNE6hN2b+XH7MUJudonfj5Zqz5QBL5T7bYlG5AbKXCMQvctQndZ5?=
 =?us-ascii?Q?dGxWdDuXUaXzNlpuVbpo19E7eKYM8N4GELCA8eXmaqYZNdPgvijOKI+jgI2M?=
 =?us-ascii?Q?4ziM7FH343ROXTpRbJS3gGQk2p43RjYyYWAthskjrGldpbjiDelkC2eGtQGz?=
 =?us-ascii?Q?XMJeMOc+xF4JWwMMe1ds/x3VjO6njwl4/hfv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5m8vsddlo2RANLERzI1nrayVspfk4unPWzceKV/QYsceeOWMmTGPParfZYFr?=
 =?us-ascii?Q?JesXU91DbQirWL23rey3icmmF944+62KRQNeFwuyuAiVLoUfTTz4Tn1HzPJ5?=
 =?us-ascii?Q?TNw6CA82AYMvQjXxlAfOtF5N3zysmlgXEB1ZYseMaO9GQoDcpFJNYnHk5tsY?=
 =?us-ascii?Q?V32ql5hAYWZFY1UvDfOW5POA0/CvGgcL1PA+Qd7q4Hu5zxpBmQ5EdOCAb6I4?=
 =?us-ascii?Q?OSDPWUdfJyKKgujIAA1S+4KE4RBPMLK83XgoJtwgg5RwAxHrdV/O+82VPS6I?=
 =?us-ascii?Q?JkBDEBYZKQ90HU4kLGVYE5SXTU7En5vDzMlg95YN3/7YZnn58LnxkQdQCU2g?=
 =?us-ascii?Q?encZuOzswYrq+9Zd4UTFoj2JBFh1orLUCTXrUzTEx8XfK64oncesa8bwx93k?=
 =?us-ascii?Q?qAjdbzPurWPlsZYhVX0baTLoRWy0WCn/9J8BK0ecvhY2gh0E2rh5TxvujWk7?=
 =?us-ascii?Q?HpM/gAUOUxQ6fpcOJ//6UDCvQwO8lt9nDiP0Dv7tx8H+SBG9VOTHTfb3N5Xp?=
 =?us-ascii?Q?U6FmoZcc29pWuNb1K1ARcbhXtWNkD6fbRLjlLXhz6c2In7QWAjNPHq2wa55c?=
 =?us-ascii?Q?YIrtG+rfjL/dtfYks0Tj3mDghxt0G3dmO2WwrRHJSNl9WxwBafdXOZgbpJer?=
 =?us-ascii?Q?58Q4SZaA9PnsH07ntI2rLb32U9VcDnq9eocKYo5dvK+n3conCiEIoGLDQQi/?=
 =?us-ascii?Q?drbleYo6JoTFn3n2rksE8RSraVfOzc9LyaNUIkDIsTJ7+DYCoUPGZXls45K7?=
 =?us-ascii?Q?4gQaSCdTGEL0+5wqCTF136+63mQpRdKW7/Ho6/xucUC27dGMCQKaI1l5di8a?=
 =?us-ascii?Q?ZHXWMLYq6pgXp/2jzBfC6iXyuSOcjL3/lBXUP2tEPlRdmhRfHDeLBb0krhuN?=
 =?us-ascii?Q?t5m4twXnHEe5ZKg8DaiDjg1ZVcLjwHWsSKFlxaHYmJ/ewgOJs8qTAHgKBC9i?=
 =?us-ascii?Q?xZ2F1XCcu3pqyquXLhcUMNXyIX+up1O7z2aZj+dWrMBo3K5JPSNs6eDVxX1l?=
 =?us-ascii?Q?nqpX1eV3/aQt9fRbpHO/gbF9TSApkk3hy9rhhUGMyhpbBJ30ntd12Wj/f3K/?=
 =?us-ascii?Q?r64jPyCDgoihzL0SK2LzMnGtqWU1n/JnNo+KPkNciXfPqLuKiiPwFytr+202?=
 =?us-ascii?Q?L7Df0lpCj1jdwPVGhcA8orWRq/QqF6f2/vRgI72ynKYWiyZEZ9ggpeIrtYR7?=
 =?us-ascii?Q?MUCidwhhf+0IOD9f0kMwDfoqLVsC8bs9TqjDsiGmpdn0El31VnTaDydFH5Sv?=
 =?us-ascii?Q?h6zKHuXx+2v4LxV12QHUgCj9nCLO1xxBc0ajNMxeMP5SBFmZ+NtfTTuwlCTF?=
 =?us-ascii?Q?g2M8Gzl4YFOwF+ODN4IaZFh2B/LwzzpYvc3nO1Par2LpcoisxWyZTLxn2P5F?=
 =?us-ascii?Q?56qXjSVeM13dAEGDM7G864Kqm92ujnDXytXVRZ1rp08hp6NcYv/G5QYVbcDN?=
 =?us-ascii?Q?KgbsNAGQkc0mDIsUJ0YW0cnjPhozvgWtoDfkZy/h6KRAnj9G6YiWKtBJ6QgO?=
 =?us-ascii?Q?7HkDBmP9NzoRQ5TtZtUpb0a5TuxbYfD+yfQs3spFYeeg4GVacZNVCn6rZbtR?=
 =?us-ascii?Q?39Cg0pVles34iVWOyVj9qqQ3AWSlKtUINzLbPtTMDnV6dDgjr+DP5DxSJfp3?=
 =?us-ascii?Q?eXL4MDc2syQrEakYLdmJMIA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3af29c-a59f-480b-6bdd-08de2cf5a2e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:11:04.8362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+VDeIy8pc9JB4tVOvqIiLWO8WSRIHKnPlkTPKSDXlfqe4uvhG23omToC85bFUaiwx+rmp0ymO/OR/TZZVCVWgWQblfRvibna4NhtLS3H8N4t+6euQtVYUVKcOWwIK/K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12821
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

Add fcpvd1 node to RZ/G3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 876d8e3903a2..fe96b412cafd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1207,6 +1207,18 @@ vspd0: vsp@16480000 {
 			power-domains = <&cpg>;
 			renesas,fcp = <&fcpvd0>;
 		};
+
+		fcpvd1: fcp@164a0000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x164a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

