Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB624EBBC3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DEA10F5AA;
	Wed, 30 Mar 2022 07:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2038.outbound.protection.outlook.com [40.92.41.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3E910F18F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 06:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBudT+rwl21AHyBzU2POLxTpW1ICJ82cR8RHom2kgMBld5xFRGBBS1Hj0aRyP5M6tdXGgDKTACRPPjzVUl/Ql9liCTeg6mPLh7ttQOrxiZCRXha9e4kccdKkdAGykz6e/uNNVYn2DvWJfUeT+vGURKHZJFtByYPr3emkd5p8PVUawnrKxS534DhUhvBEHUo4twY4K/iiy9/gqjVU6yQPCFcLmXn+st6OFYCpQflGRe95kMk/PEKNQy9KqghceTIcoXIzl8jPcF4GM0RFMGqElICwAXPIIMSMiqCALXwo+ktTPv81ech9AUv80ttSE3thWV57qakTrYJaqweM5G+rfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbPsUtwrZMl0rRdrnl1F5pmp8TVBbs0jz14nBenYCRE=;
 b=grLbf5S7NUtX7ojlInk4b8qRpIql+0bFaFynsMPt1/IM5T7+zAw/nQx5wSRALGhVBek2PQuBIRXuZYChPJq4qBqWcWz17g3qzNL4kqqh9DSnO9GHQakHyoacoiGwnufVFrj7JihJLBUOS6H19lcGMFC7Ty+opm0kLACBov+IJ5v3q5tMT8HlIHu9LBEMYGrCfCla8VW65rRPPeSOtl/V7tRobO1Td2nDTB4idCYXM8LYgWbHBCcUsMMxrvdf3Cep2PsoSFWJnl8OgmGtlfOhqyKcaSkIeFBo4mv2yZw1FovebMy3aGh+kYXf0p+QOU9OeJJ/iS9ov5qJwOdy6OUonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by CH0PR02MB7899.namprd02.prod.outlook.com (2603:10b6:610:100::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 06:57:38 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.018; Wed, 30 Mar 2022
 06:57:38 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/3] drm/panel: nt36672a: add backlight support
Date: Wed, 30 Mar 2022 12:26:37 +0530
Message-ID: <BY5PR02MB70099887C262C57B3A6FEC13D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330065639.245531-1-jo@jsfamily.in>
References: <20220330065639.245531-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [IbgmfZI3PGm9lwBE05X5MKCeNC9tUKzi6UwtF/JvN0t9sjD3SCKTQyX/WclE6kTw]
X-ClientProxiedBy: BM1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::25) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220330065639.245531-2-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9ccd7a7-60f3-4050-1069-08da121a9384
X-MS-TrafficTypeDiagnostic: CH0PR02MB7899:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhDyzpVXH0DslW3zH6GBCuV/iSgLKZAjKduL7HY8rdkXkKujdpWDhBYlua431h2WRiGlpvI4xrN7jalWM/MiAYn2ZzYJIbg3RpBz4WxvTkYvnIXAaI7mstCV/XNk7FXJQHJFAsGr+K51mTDEgSQKYW5mYcpGDeYQNPnk7kt2JR2Av7eEoo+OgHff3KFvJJII7HCW5m/G4WssfDugCMCsPQy0yABrXAfE9+5/OfWwTrTfk1PaduoW4FFGB5x3AOVkgdHeD4UvpS1CiKvO1NXtEroJTgePGD2LjN675rVmA4vQRB1cZr59OIGaYPDD8BEDZAR4KWCiRBYAPkTIa73oV0KBW99VUsVHCN0do7yK2/kMuX6djccBZdWzBjJOjpTUxsTHmrLwe+67zyMGZTRtKfyl+NcXGcl3URnxekA/4RU67yPbYw7sZlwJ7KQde4itUG/qTWNjnSfWARKcnPO7bCw/x2zIusFB+DhHlrZqOmRrcIwmSNsBDjxenBphkyxKABUbTJxzRsmRN32wfcO/oPLb4kWcpr4wlA5Oaf7Jazi/u4RaiiB+8hMquFcoUO89xL2PvJQYZk7sk70f3Jqv9g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pa2OD2Zg0qcWjUonyiqA8f6z/L7X/Cd4N+i6bu6M9tux1sU6d9Wy+r9C2w2S?=
 =?us-ascii?Q?4rNu6Mqb9SQjx8eRSqk4tbDtC4NaBBnfTAk4GNzlrrzGJNFd0z2y4cjz11VA?=
 =?us-ascii?Q?BN/KC4jinQrYC5FvKgsrb/AymM4dgfbP9VmxYb2zKXQilnsiPeVxGYcsmFpV?=
 =?us-ascii?Q?ib4Q1hljcNpm2Rt/rdDLXXxCCizFzbY4Shg3wneQj4eyVcImuhjxKkCShbBt?=
 =?us-ascii?Q?jkntHmK7zROn2fp821Oioe1LYuFGK5XhvvHlCDBFIH+vOs3wftpDQubC2oFT?=
 =?us-ascii?Q?Iqjuq2e+1TP+Z+P61C5DhcQGMlk4JORPASSM9R+wFKjINe/8FzqlnpaQNP6i?=
 =?us-ascii?Q?78jjXpnIrCzD5OuCOwodtqXjzy+qh2NaJWPEZ69vCYl83pTbp3uFgl5SYaDE?=
 =?us-ascii?Q?BUYEh58VVWfJy2MvfKbrb0l0gsYk5MW0EbPLLtvWF2sJuuPmNF7cwParp/HI?=
 =?us-ascii?Q?LCjmh7qU3FuNY414m/n7H2/ftuZPpZeztVTw5EYx7s5kRZ1C5rKQqO8x6G/5?=
 =?us-ascii?Q?4rjVIF9sNTUMSmqOphT3jaH2cYoXH3W+nz31wHOuyZYhZ15g6YnyBFRioPLT?=
 =?us-ascii?Q?coFvh/2hCjrWEm5qRJu9oFMJtoBAQDsfMgqovhVYykchd6OYnJFLuH49kslx?=
 =?us-ascii?Q?ptZZZmI/d38HBD83jglOEpphjFMj94zMS7ndJuVMXx1KPRrExLXGJvNQkC6I?=
 =?us-ascii?Q?FVjgf7ugfyaJCTg4wysFN89+pUuWztD4Qv+KEl2U46B8xAQU0C96mBY7M+Ji?=
 =?us-ascii?Q?6VGjR1/kqeIbYwB/yHFW+H1CqBR+tD7FdjJnNf6iBUhAHzKe8VjTBoW19DSg?=
 =?us-ascii?Q?MSCCG9OT3EtijeR3Ari3zNh9qzZhYLoT840vGxezLRpItqUiSdqi6BjYO8eb?=
 =?us-ascii?Q?9ffM41eClhAYMcJKoHp/Q2DaE7j9pchEWgBlPjUhfvfVnWlBvN25b2toIzgB?=
 =?us-ascii?Q?zL48SSlhuyz8OlR//ha5rdC2JQ9FQpRgtYcG77QLVP/ijfFpugXVpHGLt8pi?=
 =?us-ascii?Q?PXfxH/gN081QRA8R1S1Sr+9cDwfnv9pJTotBE+ZN/yG0S+Bvg2QadNZ1TmSb?=
 =?us-ascii?Q?RSek+wAaLpgFR953JxEcz30VNh7WjrKarbx8kDTz3VAFShtQXQAopAtNtxhq?=
 =?us-ascii?Q?hHGYLWbdpfrsoHkwoSHG3noDWba5xZ6Qg52ddgMDjWKPwhcWFXINQcM/dQ+P?=
 =?us-ascii?Q?8lRCk46fqvt62L6is+kppFSqwDYJucAGrdjeub7VlbSWxYvib66Tk84Lrlo1?=
 =?us-ascii?Q?4JenHOcWBEZxF7OipuyQZywGO93bIJPna9zuMFJV3Xer3VoWMpljdA7VY84X?=
 =?us-ascii?Q?wg6AC6PbgG22ZNS4UXcBLqG+wp4J2Tbjo7cUCgPkAUkr12+DuhWW20CkoqgL?=
 =?us-ascii?Q?xBQn7QR0y6e+cklEoabGnEXiC2yQkpoQLykAxJvlJ26T34RTx4sMsJJTUuev?=
 =?us-ascii?Q?g2N9zr5Gwj3X9p8Dri70pC/nLOVNCy8+N53Rx2PAyLTjOhxZ/QfqIw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ccd7a7-60f3-4050-1069-08da121a9384
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:57:38.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7899
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:32:47 +0000
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for backlight. This panel supports backlight control
through the QCOM WLED driver in Xiaomi Poco F1 device.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 231f371901e8..6d6ce42787e2 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -628,6 +628,10 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 
 	drm_panel_init(&pinfo->base, dev, &panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&pinfo->base);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
 	drm_panel_add(&pinfo->base);
 
 	return 0;
-- 
2.35.1

