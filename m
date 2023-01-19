Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A2674256
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9710E1FB;
	Thu, 19 Jan 2023 19:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7687910E009
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 19:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnMHfewCgjP2FNx//CkAbca12RiGa+W919BPbcxSzkroV/k0qKtX9JI4zgodh7JDtQx2gdtRyox6z9OKYvFvN1SdDuVwHZm3N41/PdiiKoxX35uq1vqAXMg/UWr9NUyxU1sC8KgUlz+WGnu6dZoFWqUtnGHF7sv/lW4xSsvvsvFSUP5SPyfJhLbjZOJg7weKXqQvJhdG4nlaetUpg9Oif12orOPqm12++prhfg8r338NkVvPPFOKY37rnSwYvp+gfdE+R02gec3kNBbyFUbNCemJnEs+7jtvj0Ii5+QJb5ZpfoQlMdL90BavTandZmX6WFKrMpNQY3ydNT0sDw7hig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qtd7Gexc5Wvbqmm6TKQo3l/jWme77CL39jcSGG46bc=;
 b=QIW8k+wSarEAVqAwqSyOew4x0TFWx7kRI67yjsTBZRfbiVQQwBaBowkwmPaAtbmLyfoiyZv7o0+LzCziyFgu2CAXANbehSjJJ8rYzW/qYND0ECwgZJsfMZlg0ml84ZjBV01gRi67BVuHqBiQqkkMf8O1m34gRR/b5GCB7BDQZj+DSHNuSvnxN5FRwHCAp789lDWMhi0fPt7hTVRPgnpEJqaSMLsAWf0PfJlmJ0xFAk6/j0XtvrDal7JnG+0jl/rE1qUFfYvp66oRxtErGOaPi/fgPm/CsgoVBGTmwVkg8oPSpHPz8AwHwKTayV+6VESd6Dxo5WUlrwKoGCTrnyrrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qtd7Gexc5Wvbqmm6TKQo3l/jWme77CL39jcSGG46bc=;
 b=L5a0giWxlm8r7BzRZA3s4AS/GXAePAOUt1s9e8Lll1sCDaJL4Kgu9R1yoOiP+U++UAJuj1W/cLCjGPxr4YdJ4mpjYcnVpG0XrMIDzMBK/U6k9AgznMLKO6LIVYV6DqClFf1Q8Uzj6Iz8N+4HDYXe/9W0t/JBwybRhrYB6Wl9mAC8ZNv2r2MfOC3deC1Qi9Rxv6vDpN2g+ACLdnmAKgZ74afDyLvVnCfgBvnNCp0gPQIgauwwVrdFNhT6vZPbXtsO2yEDPz40cD5NZTYzXI9qHzzThLWGXPtI0cAsjika81GppXn/RmdOQYqsmi4jNY0lVqQlhaMU6z77Rs9C8O1cBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8259.eurprd03.prod.outlook.com (2603:10a6:10:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 19 Jan
 2023 19:10:55 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 19:10:55 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] component: Add helper for device nodes
Date: Thu, 19 Jan 2023 14:10:37 -0500
Message-Id: <20230119191040.1637739-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230119191040.1637739-1-sean.anderson@seco.com>
References: <20230119191040.1637739-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:207:3d::24) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DB9PR03MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: b4744fa8-134b-4674-0c38-08dafa50e3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iL+wGpVUT8/tK9SfNHgcx7HVZy5tlrIo/Pae9cBDhEaPtUVN+gfTqCu4vJSMNSdsyDkzHvaZs7GpmYK5JI6x0VmxwygG5gxUzLtdiv/19ZExGWH3Ro9+kWlwRYO+wHVRQ3lVVN1DSJ4kgSIbsAthJzTNKUMK0o+iqu/+zxSkg0UmpXMNf+3TVQQQ0b8iplvsng73/G59GqAWDmVZH6Wx5/+EeW1oNCZVmmjSkIQjLxRoVz+y6g3iQm7ySrnVBuuJn9T/fNcrwdSX1et5RQZIgo6/J/gJNtax3gESb0x6BMFwQ5AzN0yOe0/ShIu/npWa0/SGzy335KteNf8hSsH+vGDoqIgK7nN3ioruXXnyGF+81IOiXlkb9EwPCyKCCu6/60nnTuBDRFW1Bz9nVJO7qmKgexEoV5ROD8xOUzdJpsREbve87KNKjuMcP+7ty6mE8ETz/EiBOTtf3VpuGmdUpcf2o0E9qNTcapMZsxD5bjLBXDFTEheE74H2o6ipM/wCj59DMlix1Sp0e/zFQHad7o+KRNMfgzGbSATc22wpG6YXdMz6bioer491ihL+a7Ju6e6drTAY73mTBHd1URo9xr2CYMhYyCEWgtWsnXPXd16jbHk74ymsfldJy2/9jE/HjgollhCp62u6I8b7dLGnOMJN6gOGdYqvVaiVlJ74EqewfRgB36s04L8FDNBUudao
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199015)(66556008)(44832011)(5660300002)(8936002)(41300700001)(2906002)(316002)(66946007)(4326008)(110136005)(8676002)(66476007)(478600001)(38350700002)(6486002)(107886003)(52116002)(38100700002)(26005)(6512007)(6506007)(36756003)(6666004)(186003)(1076003)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NirrV57d7hFSZjQYA6DnD2JBxSX60pwpDlE0wx0k/feKELj3OWJGJpNLAWBv?=
 =?us-ascii?Q?jXVAdPPipdtvKqYLp3I5YgINyfGT1WCRxOoDrWHPmntiANUeH7JTS2TUQi/5?=
 =?us-ascii?Q?VGiwHbquG9OtB9jvggnYr43AOTTpNk1BHH6mhmpDwiypZoqikTBSlQRZC6ZQ?=
 =?us-ascii?Q?sEG5OT5R8xWtpvYEuoFJVeWXF2SR54pMOZ4vWXUCN9N5+ot1MZs0NiXKKCc4?=
 =?us-ascii?Q?cZYRG2wZeIfiqPDfG/w45Ea7PDX+dDQP9LQBHqyQl/xi+GOL/a+2qDfQdkXB?=
 =?us-ascii?Q?RrIfNm6RD/nQz2ZT8m9EVZNT1Z9NgvgIR63RfpT3zMrEcfeq+HNYjd0NiBxN?=
 =?us-ascii?Q?PBT1R7H5eqwa1ehDmxJ7jBBFO4FusbEFonj9YpgvDqRVEwSgWgI21WH4EeK1?=
 =?us-ascii?Q?QJUSLnHGVukArjR5MsRNT9nsHPtTv9V/rQHeTNh59zky0uAykLLw77z/w5M/?=
 =?us-ascii?Q?fm4uXdHeD5z6rvH8w+bvr4L3rMJ6tZeL34BZwYUlftaPHp7GfPPmAoLROmyl?=
 =?us-ascii?Q?9R0q5U2VZ90na5GNozWTkDxbovH6WR9qwy+WKIvXvPuzVLDYeKXrBf13gpcw?=
 =?us-ascii?Q?P+VSTuVLZItaO1zXYt8WnECpU8pV0yMXqq2ZNet4WldRSxy20uSoEtshFRQY?=
 =?us-ascii?Q?4OgNV+LH6vUsUoG6jtDVi5g+8hxDVPUKG0DnT1WX/HrfJXLndJVZU/elWUl1?=
 =?us-ascii?Q?CRpRNm1ZVcUZMci77ScziGdaI5xdhzvLGRDyHXRIQNs9QPI+ZSt6EhnltKPg?=
 =?us-ascii?Q?KP4IBDDvz08MSg3mP/wTUcYsoYn0Hdo3guDH3f0mMjaMevrjJMY04Gwpjyra?=
 =?us-ascii?Q?eMz6IueTMxa6FRuWC/eg8ktJkmKIvAWVho1GSybgdr4xqx+X8cLbLPIWQtl+?=
 =?us-ascii?Q?5jtij6IoNoV3vGM1XEGDUxvULHVLpAHYjEHV16nKdms7QNGyU33Xq311cPFg?=
 =?us-ascii?Q?r8cuHOfPvuuEjV/++BIzjOK9LTTH7yaY2+ertQfQ6KUreGmqbMwrc/g5NgDL?=
 =?us-ascii?Q?rTKuRXvLphZsIUozjeKLvV1BLzpjGJZgn++z0g+j9w+Ls13HS6E2dtDZT0kt?=
 =?us-ascii?Q?iDqCFUfDd5TzIHW90uzS0TdG0o7ccnayXcY4kj0FKcZds/xqVyPCxHlK02XM?=
 =?us-ascii?Q?PzePg4HjfgENQ9CJ00vZjWAxm8X00xmykkex02PMfyVa5vPFNqQGTIEL5t5n?=
 =?us-ascii?Q?oIhvWmgXiKyxMwj/XBOhWUa+lIah1jTPSMSqWAcX/KPimF2UXLk3D4p+/heD?=
 =?us-ascii?Q?fRNOx/lys0vpEELT6UP0nndm92T16KepSXQDSykUcjy1ZNYZARz+4Z+W/xRA?=
 =?us-ascii?Q?LE1bZUABqgheEZRhc/gANATfKj9AOMogZXZjZuu5s+i09++W2od10dmpPXFE?=
 =?us-ascii?Q?C6Vc5D5vG7PG+4cOlht3Sy7DZwwJT9FyMkbU5cwH1591VOtfKSJYCcBYyzWS?=
 =?us-ascii?Q?7uv7AXyMvcXV/xYL9Uk/nhLUUTgm0mhH6Q+yRXt0yu89r1uARsoc05+KAcl/?=
 =?us-ascii?Q?eEovbi9k4E1lu4qtkm77i0fpyixSkUJ1X8/dRx7UIMdO/0I05hwAxieavYR8?=
 =?us-ascii?Q?kqx3ZErTTuwxigq0Nw5jYeweIdeCbaqMezlqrigYZ/okO1/4GrKVjXwWMpDf?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4744fa8-134b-4674-0c38-08dafa50e3c4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:10:55.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJez9lrl6/M0xk3RJgb5mZopZ7T/ANJT0sZedM8N30z7z3GdaeQb1uRVRE8SVg0qDPfuSQJvBwHzj00hvPRlhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8259
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
Cc: Sean Anderson <sean.anderson@seco.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a common case where component_patch_add_release is called with
component_release_of/component_compare_of and a device node. Add a
helper.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v2)

Changes in v2:
- Split off conversion from helper addition

 include/linux/component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/component.h b/include/linux/component.h
index df4aa75c9e7c..fb5d2dbc34d8 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -6,6 +6,7 @@
 
 
 struct device;
+struct device_node;
 
 /**
  * struct component_ops - callbacks for component drivers
@@ -128,4 +129,12 @@ static inline void component_match_add(struct device *parent,
 				    compare_data);
 }
 
+static inline void component_match_add_of(struct device *parent,
+					  struct component_match **matchptr,
+					  struct device_node *node)
+{
+	component_match_add_release(parent, matchptr, component_release_of,
+				    component_compare_of, node);
+}
+
 #endif
-- 
2.35.1.1320.gc452695387.dirty

