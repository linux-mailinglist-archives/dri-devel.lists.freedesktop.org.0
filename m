Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9338A33F38
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 13:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371A510EA7D;
	Thu, 13 Feb 2025 12:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="MHc4eOJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11020120.outbound.protection.outlook.com [52.101.56.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E7F10EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 12:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln/zJi42KuwCj9gCAdtYmJT+bN+od/xvrLBGAlEim/+Ypq65C7h67uG4dONjQ40pVzis/ZSR7HUpcZDxAzVe+/cnFRwjoQQxLUH16KnLJ34NygxwMcTA9/5sKkXb+mNwKI1tfKzTovRyEwBBa+VP22+5OJsvxxve/yaKz6PNu13LLozscGsXqPnvuBQ6bqH0IFqUuAq7YRxY+k1Y4pSAS/KLbXHtVQNbLKW4yqcrh+2GTyAgre59rxJCv+oa/sGgwIUKuBoBmZeqrk07Y5NWFAVoBW4Jsr50o72hQLBS+jzeuCB2PDj6bYClpG4MS+bnzIEYpAH5jArAVD36Iy9Axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyuhkLiSd3DLPGa1/SVI4AATqiVzjfkDU4NHpNBTc3E=;
 b=IDVqBiV1sl3BkCWdoasDzNpM+0W7mKq94iRNGvNhmBqn2bGaGVr4Mr5t7DDJLUWsVVAGs7JRcEqKJXVLn47Ptt9JCU1sf3gt6KHF+3kJ6Bqy2krMsZqmYhLY7XeCCDoRUtYLs6KnAhDug+WZLAXJYXAuYyNGhRNbI4zLysI/U9LcmpyIo8Dx4j6lgjtBiRUNDseSt01gdJW2XyyOdo3DOpH+CLnDcdpo/YvSBCXez45MToMSXdLqehgW/S708EPTraA8MURJT3IT6j9FaCXoYXdTWYxQPJmabg5HgJc7y1y5nuyLl67clp1gmqENmoLY1NG22aMj108ri0xDOzsnEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyuhkLiSd3DLPGa1/SVI4AATqiVzjfkDU4NHpNBTc3E=;
 b=MHc4eOJgec4z9HELiy0JsSE/f9eaFtFNG2028tVmWOYhrEEbCpzwJk85oJyY8FluebTU3TXkWOBPYpM3LDCr58VsWGVATCYvTta4sCexU30Ojm7gl9MFQEVTD60Um5EF8pKv+ZkTeg1u+tbsa9rAGT2Hr2BUED7DYVEkeheuSdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MW4PR04MB7218.namprd04.prod.outlook.com (2603:10b6:303:76::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 12:34:22 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 12:34:21 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@google.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge:anx7625: Enable DSC feature
Date: Thu, 13 Feb 2025 20:33:30 +0800
Message-Id: <20250213123331.3016824-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::9)
 To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|MW4PR04MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: efdd7b95-1be8-49d0-d1ea-08dd4c2abde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iL9EO/vberFS7E3yoKgRnl4RHqHkBI/ZKBW8RZTgz7HyvOmiCOHa+ZPMZ0/U?=
 =?us-ascii?Q?XnKy5cVffp39w/yLX23DA60QQz2idUhNP6fqgoGDVsDo/PaxCqGOGJgp3vm9?=
 =?us-ascii?Q?IT+2Q4qkverpcuClB+9z7YZt9IcCG9ERtLVDxeb53tPWm2tGa8A3Y1JC7Jos?=
 =?us-ascii?Q?87EqudIRI+L1bZRjl/SaEgKNfvdxsfOXrHF/zJU5sPKCNP+6y13y/bf9XuGq?=
 =?us-ascii?Q?7O8pwuFjLpJ6/bodIolqJhzDNYfyzMVOeqXlbo8DrUADcZfpsgjoiJofHfbK?=
 =?us-ascii?Q?IM+TTCGEK0DipAlye7ymUmM4cKNfwa4OjuN74b/9giay9LBjBnHjP3eHQ+cu?=
 =?us-ascii?Q?gv/n2ZC1magBP5ZEQDOJTsA+NIXBMCZ1OANTSucj5VFPDgh5HZ/jZVX/x5OG?=
 =?us-ascii?Q?Ev+37wTHAVhSGumh5XlGsNOnygZuVdEfAfOAyr3msyyhKoCSJputOm5J+Vod?=
 =?us-ascii?Q?abmxg+Jnm921JT/Sb4LDDNO2GquaYRlc3VLBfAK/9f224QB9NonnIrlIrh3b?=
 =?us-ascii?Q?qauDlBCf/CE6rICTq1o9MydRi+1vAN3hdR0Ip8bHPESs/qZH2XYlKVIex2Qr?=
 =?us-ascii?Q?76vBGDIFPLWDJpTpFryWAoNWYBLNSe9aPhh2gZD7ZhL+P25BvjsEsPZtyr8a?=
 =?us-ascii?Q?XxJgGNFQIwNomdPxZ99S7XwXQ/Xxu1/54hm061Hqbe0ql1JEM72eqEZoTuwU?=
 =?us-ascii?Q?j7v8Zlx+6P6JHnuMoY1OtdkaFbJzoWbshYiFhvre+tZv7vb0iU3PQQJxMiox?=
 =?us-ascii?Q?p1egplX5ten6GMxdM+0UMlDxa54ap+dildwF+74qFa5MEzWsyyOK79ZLkTan?=
 =?us-ascii?Q?CjeF26JFFZHKZQYf5e9PqnTNESMgSh5+F2TftkUEmPxBX0Ib8XU+iAzgfNp6?=
 =?us-ascii?Q?8oXOR39VF1VUSpob1ZnOYkSl0cV/CMx360vkvlHdaaeq5EacJyAeJb0Un6rC?=
 =?us-ascii?Q?0YbaTunQiJ41fU6rIT1py7k/WGw8RsEgwIGDwoo4YIxHkAlxq1b4IKMEGWx2?=
 =?us-ascii?Q?2jKjhhTBiGXq99xU/L5rqoFPZJrnGvzJgTGd9mw6sG6rkpxFyB95LXlnzyfv?=
 =?us-ascii?Q?4Fa0c3n7AwhJfgIJviZF0iNIltN+6rTDa3u8/Hr71790eyX4iamn3cYL6UgI?=
 =?us-ascii?Q?KO+am6qHHseDSlE2ezmGmF71TlkRGnVFyGYIeoy9QzYfQp9lPMJrTf6lfGr3?=
 =?us-ascii?Q?te/pFQd2XbQ0r4yxtmbiajLB3EEAMPgxc/SvcpNyROeDhThFTxuKSYB8TALV?=
 =?us-ascii?Q?ln8lG5CC8zG8fZ8XcEwQllxYj+s0i+RL3QU/JAJU0rNyp85br7+WZG5c7PnQ?=
 =?us-ascii?Q?eiFWakkZtAtGxNqmOo0E45XCz+eKaG6y0K4r+IzuXKbSqT0MotuZq8crNTYf?=
 =?us-ascii?Q?cFVomtiyE47NOSk2kznd3B+SLp7w/VetSb5W1eLwXdqUd8/Of9G7XdKVLTup?=
 =?us-ascii?Q?O8IY+7YHi3BuEMQUynF4VLUlL55AOvgLc8s3j8lG8u9dqID+h+Oczg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUZN1/vdh8co7Is2E5txYbfk1BhHxx5mk40gGjhYioT6hOzhrEo0KuksZEEw?=
 =?us-ascii?Q?JQ+4zYjhtFFB7vk/m195KUUCVhEhvhXTTemGz+y5bfoA9CFAxIzOHws1pVB/?=
 =?us-ascii?Q?7mFAUXdSwIKpfmp/Ol8JzQFrgUq7s2a8OCPUMfceCxc2U/AIpdQuHJ8u1oCz?=
 =?us-ascii?Q?5lawyHmmGacVMzVEb0qcVM6TlQuMBtItE2dvvhspa+kVwx9VhU2yuVEuhFgL?=
 =?us-ascii?Q?VvWs68Ji/1888nDxXeM8n/0OMjJiqwPXYiaLrVx+v/i6YMX1tJalQvNuHkdb?=
 =?us-ascii?Q?OMSldWU3niCBOxq5kRiEE6ZQL2+Zvq8B0ZYoTXblmnr08/NdVNFaMPyTLeby?=
 =?us-ascii?Q?gbpR1zIKI8wZVtn4+Q0UU+1/97uyXZReHr9OwvFVTOjepQyyyp0sHSeoET0U?=
 =?us-ascii?Q?3pz206HVkSgLYkTUTQs4EAtDwO9o5+K3sID+A2Hb/YwiZ7SLkEnUoutqjdoA?=
 =?us-ascii?Q?CpaPXZgrOtlQVBuRpTqUqcftaT3UdIvLW41U7pVhBsp/6pGqXQ4ZUMSiMOKm?=
 =?us-ascii?Q?AFTl0wnndurkPBbS9Yyo7WhyYuPlRv/78fviEgPc12r6kxdC1tacNZPNkMvR?=
 =?us-ascii?Q?hSM1PoxMfGRKFtWW5KzCyqjWygjKZ5U/7YeY4fdrDyGFyPTPaiBgGZbsVRvL?=
 =?us-ascii?Q?jIl+7C/HbYD1cMSKL8ICaNDb8ePZ+hwh2W7jVvLydpjwQeCpB07vkhomHkHt?=
 =?us-ascii?Q?8N1L8GlJI5o219Hh/SIaVIK4MNYZM2CLbuS77cvinG24rzIuS0gAfhcXeHA3?=
 =?us-ascii?Q?O+8qx1cITuxylIP6QlKC+7UDs+/N10EDfVMPiMXVp5FGEt9J5LKTmLgsUYmo?=
 =?us-ascii?Q?2E8zX32ZXgeyk22EK391u4LVTUnZ9HhQB7XkX8+eI9imX8fAHdPOt7UUd7BZ?=
 =?us-ascii?Q?wl3ZKXaH6f7XpcUUOtQl7QqGmjpbxNN32yubD06EfCZzSrNmO+1gWxqcRKMT?=
 =?us-ascii?Q?QGijKskf8Zg5BMelAJbBoQc5QA1vNVJJJc2m2E27eTMksAjGUqb4Kqxw0MH1?=
 =?us-ascii?Q?ijfWm5Z+NtbAbx9w8uuufssXBpMYxpscKZarvwQW0jDWoEpketkQQItovWO0?=
 =?us-ascii?Q?EXHU+neYoQvxi8glrIWmZdkVs+UbpTdVp3r6ENR3X8h/m1AaYAKK23/7dp3u?=
 =?us-ascii?Q?mwtxZPfR5HAa0/r/HSmJwXqoyuQjcc4+LrdqLYMyJAfqOWB8QLPnJtd7szyQ?=
 =?us-ascii?Q?Oqo76pb11VBaNwX+k90bjs6FK+5zKXqcPLxIs5ePVToBIUj89z64Sw0jMr6P?=
 =?us-ascii?Q?VN9qFK5wgko6WfB1U6BN+mzGBJaR+T+Gz0IqibuaXiS+WQ5SgQxbqDklpqSg?=
 =?us-ascii?Q?o0B87wcmgqIQdW8K29sFXWJ+fcEUwmmvhvZLX2awYz+SJ7Z8z5y3uaj7MFDd?=
 =?us-ascii?Q?JmhtHHXWrqqZscCUK5VtrdzoiLoqCzMSLZssDv7mn1qSTbtdrf4aYuq7a3GY?=
 =?us-ascii?Q?c+P4TZfkcThIQGJnfWRMSmQlKWDe1ac20NVhq8cuOVONLrHLnUEdu5DOx7+5?=
 =?us-ascii?Q?lmLMDaGfa/fzv/QozInxqiBOZ/X8gMi/5UL/RQQ0TNbvB7BNb+xOyz2WrBIp?=
 =?us-ascii?Q?1g9X2y/heAFCiLAH1KZNVBBgXWX6te8FxtJDjaPF?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdd7b95-1be8-49d0-d1ea-08dd4c2abde9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:34:21.7123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZFfHn2wnh00uKqPeycA6+rtP1h7pAl9lzIJ5+37A9+fT2DmCAxRmYnAMFxEkfvQ1wyjX01qKmleKTLOPkPB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7218
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

As anx7625 MIPI RX bandwidth(maximum 1.5Gbps per lane) and internal
pixel clock(maximum 300M) limitation. Anx7625 must enable DSC feature
while MIPI source want to output 4K30 resolution.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 300 ++++++++++++++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h |  32 +++
 2 files changed, 284 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4be34d5c7a3b..7d86ab02f71c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -22,6 +22,7 @@
 
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -476,6 +477,138 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
 				 MIPI_DIGITAL_ADJ_1, 0x3D);
 }
 
+static int anx7625_set_dsc_params(struct anx7625_data *ctx)
+{
+	int ret, i;
+	u16 htotal, vtotal;
+
+	if (!ctx->dsc_en)
+		return 0;
+
+	/* Htotal */
+	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
+		ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
+	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				HORIZONTAL_TOTAL_PIXELS_L, htotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
+	/* Hactive */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_ACTIVE_PIXELS_L,
+				 ctx->dt.hactive.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_ACTIVE_PIXELS_H,
+				 ctx->dt.hactive.min >> 8);
+	/* HFP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_FRONT_PORCH_L,
+				 ctx->dt.hfront_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_FRONT_PORCH_H,
+				 ctx->dt.hfront_porch.min >> 8);
+	/* HWS */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_SYNC_WIDTH_L,
+				 ctx->dt.hsync_len.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_SYNC_WIDTH_H,
+				 ctx->dt.hsync_len.min >> 8);
+	/* HBP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_BACK_PORCH_L,
+				 ctx->dt.hback_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HORIZONTAL_BACK_PORCH_H,
+				 ctx->dt.hback_porch.min >> 8);
+	/* Vtotal */
+	vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
+		 ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
+				 vtotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
+				 vtotal >> 8);
+	/* Vactive */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, ACTIVE_LINES_L,
+				 ctx->dt.vactive.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, ACTIVE_LINES_H,
+				 ctx->dt.vactive.min >> 8);
+	/* VFP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
+	/* VWS */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
+	/* VBP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
+
+	/* Htotal */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
+				 htotal);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
+				 htotal >> 8);
+	/* Hactive */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
+	/* HFP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_FRONT_PORCH_L_7E,
+				 ctx->dt.hfront_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_FRONT_PORCH_H_7E,
+				 ctx->dt.hfront_porch.min >> 8);
+	/* HWS */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_SYNC_WIDTH_L_7E,
+				 ctx->dt.hsync_len.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_SYNC_WIDTH_H_7E,
+				 ctx->dt.hsync_len.min >> 8);
+	/* HBP */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_BACK_PORCH_L_7E,
+				 ctx->dt.hback_porch.min);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 HORIZON_BACK_PORCH_H_7E,
+				 ctx->dt.hback_porch.min >> 8);
+
+	/* Config DSC decoder internal blank timing for decoder to start */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 H_BLANK_L,
+				 dsc_div(htotal - ctx->dt.hactive.min));
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 H_BLANK_H,
+				 dsc_div(htotal - ctx->dt.hactive.min) >> 8);
+
+	/* Compress ratio  RATIO bit[7:6] */
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
+				(5 - DSC_COMPRESS_RATIO) << 6);
+	/*PPS table*/
+	for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
+		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
+					       R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
+					       &ctx->pps_table[i]);
+
+	return ret;
+}
+
+static int anx7625_timing_write(struct anx7625_data *ctx,
+				struct i2c_client *client,
+				u8 reg_addr, u16 reg_val, bool high_byte)
+{
+	u8 reg_data;
+
+	if (ctx->dsc_en)
+		reg_val = dsc_div(reg_val);
+
+	reg_data = (high_byte ? (reg_val >> 8) : reg_val) & 0xFF;
+
+	return anx7625_reg_write(ctx, client, reg_addr, reg_data);
+}
+
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
@@ -506,34 +639,33 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
 				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
 
-	/* Htotal */
 	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
-		ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
+			 ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
+	/* Htotal */
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_TOTAL_PIXELS_L, htotal, false);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_TOTAL_PIXELS_H, htotal, true);
 	/* Hactive */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min, false);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min, true);
 	/* HFP */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_FRONT_PORCH_H,
-			ctx->dt.hfront_porch.min >> 8);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min, false);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_FRONT_PORCH_H, ctx->dt.hfront_porch.min, true);
 	/* HWS */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min, false);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min, true);
 	/* HBP */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
-			HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min, false);
+	ret |= anx7625_timing_write(ctx, ctx->i2c.rx_p2_client,
+			HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min, true);
 	/* Vactive */
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
 			ctx->dt.vactive.min);
@@ -663,9 +795,15 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
 
-	/* DSC disable */
-	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
-				R_DSC_CTRL_0, ~DSC_EN);
+	ret = anx7625_set_dsc_params(ctx);
+	if (ctx->dsc_en)
+		/* DSC enable */
+		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+					R_DSC_CTRL_0, DSC_EN);
+	else
+		/* DSC disable */
+		ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+					 R_DSC_CTRL_0, ~DSC_EN);
 
 	ret |= anx7625_api_dsi_config(ctx);
 
@@ -2083,6 +2221,7 @@ static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_HSE	|
 		MIPI_DSI_HS_PKT_END_ALIGNED;
 
+	dsi->dsc = &ctx->dsc;
 	ctx->dsi = dsi;
 
 	return 0;
@@ -2186,20 +2325,68 @@ anx7625_bridge_mode_valid(struct drm_bridge *bridge,
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
+	dev_dbg(dev, "drm mode checking\n");
+	if (mode->clock > SUPPORT_PIXEL_CLOCK)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
+		return MODE_CLOCK_LOW;
 
-	/* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
-	if (mode->clock > SUPPORT_PIXEL_CLOCK) {
-		DRM_DEV_DEBUG_DRIVER(dev,
-				     "drm mode invalid, pixelclock too high.\n");
+	if (mode->clock > DSC_PIXEL_CLOCK && (mode->hdisplay % 3 != 0))
 		return MODE_CLOCK_HIGH;
-	}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
+	dev_dbg(dev, "drm mode valid.\n");
 
 	return MODE_OK;
 }
 
+static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en)
+{
+	int ret;
+	struct device *dev = ctx->dev;
+
+	ctx->dsc_en = en;
+
+	if (en) {
+		ctx->dsc.dsc_version_major = 1;
+		ctx->dsc.dsc_version_minor = 1;
+		ctx->dsc.slice_height = 8;
+		ctx->dsc.slice_width = ctx->dt.hactive.min / DSC_SLICE_NUM;
+		ctx->dsc.slice_count = DSC_SLICE_NUM;
+		ctx->dsc.bits_per_component = 8;
+		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+		ctx->dsc.block_pred_enable = true;
+		ctx->dsc.native_420 = false;
+		ctx->dsc.native_422 = false;
+		ctx->dsc.simple_422 = false;
+		ctx->dsc.vbr_enable = false;
+		ctx->dsc.rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+		ctx->dsc.pic_width = ctx->dt.hactive.min;
+		ctx->dsc.pic_height = ctx->dt.vactive.min;
+		ctx->dsc.convert_rgb = 1;
+		ctx->dsc.vbr_enable = 0;
+
+		drm_dsc_set_rc_buf_thresh(&ctx->dsc);
+		drm_dsc_set_const_params(&ctx->dsc);
+
+		ctx->dsc.initial_scale_value = drm_dsc_initial_scale_value(&ctx->dsc);
+		ctx->dsc.line_buf_depth = ctx->dsc.bits_per_component + 1;
+		ret = drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_444);
+		if (ret < 0)
+			dev_warn(dev, "drm_dsc_setup_rc_params ret %d\n", ret);
+
+		drm_dsc_compute_rc_parameters(&ctx->dsc);
+
+		drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set *)&ctx->pps_table,
+					 &ctx->dsc);
+		dev_dbg(dev, "anx7625 enable dsc\n");
+	} else {
+		ctx->dsc.dsc_version_major = 0;
+		ctx->dsc.dsc_version_minor = 0;
+		dev_dbg(dev, "anx7625 disable dsc\n");
+	}
+}
+
 static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *old_mode,
 				    const struct drm_display_mode *mode)
@@ -2244,6 +2431,11 @@ static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
 			     mode->vsync_end,
 			     mode->vtotal);
+
+	if (mode->clock > DSC_PIXEL_CLOCK)
+		anx7625_dsc_enable(ctx, true);
+	else
+		anx7625_dsc_enable(ctx, false);
 }
 
 static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
@@ -2258,26 +2450,33 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
-	/* No need fixup for external monitor */
-	if (!ctx->pdata.panel_bridge)
-		return true;
-
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
 	hblanking = mode->htotal - mode->hdisplay;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "before mode fixup\n");
-	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
-			     hsync, hfp, hbp, adj->clock);
-	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
-			     adj->hsync_start, adj->hsync_end, adj->htotal);
-
+	dev_dbg(dev, "before mode fixup\n");
+	dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
+		hsync, hfp, hbp, adj->clock);
+	dev_dbg(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
+		adj->hsync_start, adj->hsync_end, adj->htotal);
 	adj_hfp = hfp;
 	adj_hsync = hsync;
 	adj_hbp = hbp;
 	adj_hblanking = hblanking;
 
+	if (mode->clock > DSC_PIXEL_CLOCK) {
+		adj_hsync = DSC_HSYNC_LEN;
+		adj_hfp = DSC_HFP_LEN;
+		adj_hbp = DSC_HBP_LEN;
+		vref = (u64)adj->clock * 1000 * 1000 / (adj->htotal * adj->vtotal);
+		goto calculate_timing;
+	}
+
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	/* HFP needs to be even */
 	if (hfp & 0x1) {
 		adj_hfp += 1;
@@ -2349,16 +2548,21 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 			adj_hfp -= delta_adj;
 	}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
-	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
-			     adj_hsync, adj_hfp, adj_hbp, adj->clock);
+calculate_timing:
+
+	dev_dbg(dev, "after mode fixup\n");
+	dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
+		adj_hsync, adj_hfp, adj_hbp, adj->clock);
 
 	/* Reconstruct timing */
 	adj->hsync_start = adj->hdisplay + adj_hfp;
 	adj->hsync_end = adj->hsync_start + adj_hsync;
 	adj->htotal = adj->hsync_end + adj_hbp;
-	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
-			     adj->hsync_start, adj->hsync_end, adj->htotal);
+	if (mode->clock > DSC_PIXEL_CLOCK)
+		adj->clock = (u64)vref * adj->htotal * adj->vtotal / 1000 / 1000;
+
+	dev_dbg(dev, "hsync_start(%d), hsync_end(%d), htot(%d), clock(%d)\n",
+		adj->hsync_start, adj->hsync_end, adj->htotal, adj->clock);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index eb5580f1ab2f..db931f5800b1 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -149,6 +149,8 @@
 #define HFP_HBP_DEF		((HBLANKING_MIN - SYNC_LEN_DEF) / 2)
 #define VIDEO_CONTROL_0	0x08
 
+#define  TOTAL_LINES_L          0x12
+#define  TOTAL_LINES_H          0x13
 #define  ACTIVE_LINES_L         0x14
 #define  ACTIVE_LINES_H         0x15  /* Bit[7:6] are reserved */
 #define  VERTICAL_FRONT_PORCH   0x16
@@ -166,6 +168,32 @@
 #define  HORIZONTAL_BACK_PORCH_L      0x21
 #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
 
+#define  H_BLANK_L                    0x3E
+#define  H_BLANK_H                    0x3F
+#define  DSC_COMPRESS_RATIO           3
+#define  dsc_div(X)                   ((X) / DSC_COMPRESS_RATIO)
+#define  DSC_SLICE_NUM                2
+#define  DSC_PIXEL_CLOCK              250000
+#define  DSC_HSYNC_LEN                90
+#define  DSC_HFP_LEN                  177
+#define  DSC_HBP_LEN                  297
+
+#define  TOTAL_PIXEL_L_7E             0x50
+#define  TOTAL_PIXEL_H_7E             0x51  /* bit[7:6] are reserved */
+#define  ACTIVE_PIXEL_L_7E            0x52
+#define  ACTIVE_PIXEL_H_7E            0x53  /* bit[7:6] are reserved */
+#define  HORIZON_FRONT_PORCH_L_7E     0x54
+#define  HORIZON_FRONT_PORCH_H_7E     0x55
+#define  HORIZON_SYNC_WIDTH_L_7E      0x56
+#define  HORIZON_SYNC_WIDTH_H_7E      0x57
+#define  HORIZON_BACK_PORCH_L_7E      0x58
+#define  HORIZON_BACK_PORCH_H_7E      0x59
+
+#define  PPS_SIZE                     128
+#define  PPS_BLOCK_SIZE               32
+#define  R_PPS_REG_0                  0x80
+#define  R_I2C_1                      0x81
+
 /******** END of I2C Address 0x72 *********/
 
 /***************************************************************/
@@ -415,6 +443,7 @@ enum audio_wd_len {
 #define MAX_EDID_BLOCK	3
 #define EDID_TRY_CNT	3
 #define SUPPORT_PIXEL_CLOCK	300000
+#define SUPPORT_MIN_PIXEL_CLOCK	50000
 
 /***************** Display End *****************/
 
@@ -454,6 +483,7 @@ struct anx7625_data {
 	int hpd_high_cnt;
 	int dp_en;
 	int hdcp_cp;
+	bool dsc_en;
 	/* Lock for work queue */
 	struct mutex lock;
 	struct device *dev;
@@ -479,6 +509,8 @@ struct anx7625_data {
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
+	struct drm_dsc_config dsc;
+	char pps_table[PPS_SIZE];
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.25.1

