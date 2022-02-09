Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B74AFF8B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2A410E5F2;
	Wed,  9 Feb 2022 21:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFBC10E5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:56:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bciXlOzgDOeLXgf5zKgAWDfSo4HAigJolDRGpsar3JEZYIyBlkaHTWIYkv6aDCWt67bYdN3WwgajG1SbnYvTsHV89WlOJ8gFq1YEKjlhwcY1qFk1pY0j0fPgkZXTr47snafrkGcsUbakxbsQ6ISv1GlCtjdXldxX3/QyXrxjMIXonl5YS6TwKS5XgiXdAaHHQaZDbiBAeEzllEChh3xYezYhzVjbp5UflCsoVh0/PqP41w7JP5XupJ0e44DcxRMb9X1AqifcUtkR2pi8EOlVCbM+RaOhhNpZ+0G6n6cWo+3zCKwN5MGH85O476wpwtqwEq4l2ePeJ3rHt49dduTCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gcqtk8JERjBYgVYJAmds3gb0AFb3R3KmOp9CD1Uczo=;
 b=ZDxq1xgrffa8+29EvpvUiS36Db5k+yBZ/9PCaahHWpDyPWnUFxML7itRwWwdnl2VLiYV4GHA7sw+Wa3nZvsj0GU/HhtG1W20nWjt6a5CD/SQ6yNufDgJwfbQqLh4HeL5l0ks8MGTGATOgtK2j1hhMJEzo7L84Kf4HHA+lh0tvZ5HdCIoAXiR1oZJQAhl6T3pKdfmL92QGs8Xx7tvQ/48nM7ikVDa+yuheo7bXZkLoPdrx+0Mrcz3FulOjuZNa20xhrBo3nQaUl1q1q0BPznFYJKWbkz+m8m9FnhE7hk68XGvSHGCKLrbCyMscIbO5XBwaHTJj1NeOzSrcktChv5ivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gcqtk8JERjBYgVYJAmds3gb0AFb3R3KmOp9CD1Uczo=;
 b=MNouepg80qIRU/ImwH+6siCCa4z7LhZpg6MVME9soHF8lBaep+HkHKIVRDCSRwHOGEhUIXddVxdvzFoc9dNXKtSRZY+iyUYSt1YyTi+tn3LfEpRbKeHZHqfLM2lvaTSNYwZpt7cQD5iw5bEz/hMLkjUHhI+XtLhNzlBPD7uSOb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB4575.eurprd08.prod.outlook.com (2603:10a6:803:eb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 21:56:08 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 21:56:08 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 3/5] arm64: dts: rockchip: add cooling map and trip points
 for gpu to rk356x
Date: Wed,  9 Feb 2022 22:55:47 +0100
Message-Id: <20220209215549.94524-4-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209215549.94524-1-michael.riesch@wolfvision.net>
References: <20220209215549.94524-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0197.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::8) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55b43b3c-cca9-4b47-99a0-08d9ec16f9f4
X-MS-TrafficTypeDiagnostic: VI1PR08MB4575:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB4575170E4C8D9A18DEBE9489F22E9@VI1PR08MB4575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFA9FRdjMaR5hNb3t8cmAfCr2rtDH6SWQhL1pX+VZZNUxDCiffvQv5LY7czI7PHZgPotHousvIA0qn/aWyz/KwY3m2jSZvmVwHAzsUEdVwrt7jo8Dlk1cVzhkR0xaIOIhP6cLJMjwdVhpBJXX08mAnGK03KCAXyX3hws+hxAkoHFB9ijFyC8fkAz0AEisLGRclDtIpFO6ovsbM7hjHUt9f4isop3CcHbf8sIxrSU/G/jZ14GR3jAMdXZz6OFBEiV5zhlA4Bmb62hxdM3azLOS8h6JmXRfEoniEHZsHsOS8P+LorOG3OlVf4Bw9YQP0L6bovPQPzbUM69731pxhFAsd8HpXLNJJ9ZZtBuReml2cKJoYF1bOKQtrQkl7YlxZuQS0fuX+73R4HvOHkR85bOT6c74rlIl1v4UR+nw4OeeveZ1EoKbze1T2yTt/abQdaBvTbei1f0qHlcdrTEL3ik6tK7+MFwvhg91MCRMIpXkpyVRQsg6BILX3fMjWGeFj6KIN/bqv8i729X7+k4rfGHHVN3gxES4hY28kZOOVuzAokrgvM6To8HK6XBHXB9LtBy34xI64JC5W4eZcDcNyu708kTlJAH8YM6IAxIxQ+gJNd8z32dzPisa/1t8XeTnzhHUrt4WyIwVN7WLMUeOsIZTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(2906002)(4326008)(508600001)(316002)(54906003)(52116002)(36756003)(6666004)(6506007)(6486002)(2616005)(44832011)(1076003)(86362001)(7416002)(66946007)(66556008)(186003)(8676002)(66476007)(8936002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33HCziqWOjk0BomOiFUO1/1Yzn7mmsOC0LGjo0t6bjMrMuytrmfNUGJDdEDe?=
 =?us-ascii?Q?jyK9oZ2OBMe2b8UvKMptKTHyETU5x354mzGohOFTyRRb0/6TrVyFGZKlNo+R?=
 =?us-ascii?Q?8v5DG1ajr3eHThKOX3JpsUESxV93TY/6ASVvhDMt3YGsAJNEC0a06mG/mo+9?=
 =?us-ascii?Q?ECF7mvr+iE5fpXIuvNeXd7BUUW1ZHPb5lyxZQ4fqD43n0kbOnu2SVf+T+I7f?=
 =?us-ascii?Q?JVHAI+z9WSbdOauZFBN2gNr/HoTHsT1QjZK1XwPKZgrP6B1OucjW868048hh?=
 =?us-ascii?Q?lZmivUDu7fMzWGUtpWgQTtPzlF2bFNKV6FRzoP1MhLpgLn5/1vdhcGoH3nlG?=
 =?us-ascii?Q?GWlbz4hrl1DpQ/5Ztzd/fX7rq7GY6fWc2KyLak7pLkkGX9J4qdC5CtS2nrwe?=
 =?us-ascii?Q?2Rk5a4zZ+vgv+YZD7gfGCpdMRXeWrnP35kti02PFX3SeUz/ICiHr9hBYG56L?=
 =?us-ascii?Q?iC92YflalDYKbqvHRLmaCgExtqFyBvY4nK+2FavmYuoARfV/EU+pexzU7HP/?=
 =?us-ascii?Q?MKGxdyNpTfz3o2KUEawIf2s4imimMOO2uSzyXs1+OY+WoxZnA3GMDwnMmU3r?=
 =?us-ascii?Q?kEe+g9s/I5Lcudgr26NuTHm8ikJTE+4kgSPfFjzDqHgu9r55YtQLFOwRogZj?=
 =?us-ascii?Q?BlXEVtDJWCSo3om7yTpFZGBxQRX8ioVC4R1qYeGUbkY1BJSFZN/sMnnAvYQ7?=
 =?us-ascii?Q?JmmnbGG1sy5A9MV9a5G6Y1/fbfzhclQH2zORdwuRPwyZajkYM4o3WXLe4+8w?=
 =?us-ascii?Q?Qt1oOvqxcibC7YvAeOQ2+1EloLyQ7ceJox7jxbk6yFyvNsQNwqplZD0w+dDj?=
 =?us-ascii?Q?H4N2xGjR9pzPHlWongLUEvq2ZDllkQUo3oO7wOoy1KIyXn8TLc2YLSp/mu5u?=
 =?us-ascii?Q?sQzFN3nqarw/hfjOcjZ/vE2fkBPsVqymKhI//s2ELBvzyYCb9QPrc5EBLHZP?=
 =?us-ascii?Q?/N9HW/mt0Zo6R0Bd2qJpYEqFEBPVEGrx9SYWOzqF7fMNTUUPA1i88qIrsgSr?=
 =?us-ascii?Q?koLcXBHtJZjrHLxo2UiaLqOZDXNmJGsIofwjExtQFinCbajIwzXLcu67Km+y?=
 =?us-ascii?Q?qNBIM345jinSpbgcQWqeMzaMFxnObUQmTACCYqdCCwv6RsSqinw9VSfY2WCF?=
 =?us-ascii?Q?5fEbh/P/C0MxHzbAaBGs8yNAnNb5X8Z/78SfKfeis1GNmIwmQCGL/ZYVjV0e?=
 =?us-ascii?Q?m9QZDqKjU7dNRWxTuQhWCbJxRS4oLGIyLEtWEg2UkztQg7smRQRoPOaP+5cd?=
 =?us-ascii?Q?KoOlcGM5KkrfbmdpMdjjKzmbIR0rbBoMi0qQQSS4aGofplvMxTxzw6tQvHTP?=
 =?us-ascii?Q?oilR2HiHHdSpbFapgirnE0ZTeeXpcEI7XyvjjUNB1fq/97PCconaHxicy8QF?=
 =?us-ascii?Q?pb8O93AEa3TWBiQcf/NBCLZwFe4tVdoJ3iWRDLgSJymx7BdvdZFF3jxpFsHM?=
 =?us-ascii?Q?qnDH2yeok+5x1OBtsceugulPXfmtxaEGoyffiFnzc+Yphn6W9EuZ0Va7B0z3?=
 =?us-ascii?Q?GCMffjkVcve/kdxogfx7G8CPd9sh1tpZTXtK6j8FnUw7cP56gSY1QYDD/3jx?=
 =?us-ascii?Q?zplCCj3+hfElonDT00rpu0XrW6BJbAmvT5n3J8xqUiDP4M/6DCRJbBPHfpf7?=
 =?us-ascii?Q?mtCZGpQ24gPY2weR/e00X26aK5LRU1KXZ8HdBrhGfrRtBNJHQbkF3Iezjx8T?=
 =?us-ascii?Q?6CDGg6UMXfkuHn0wygE5aIPr25ug3aXl/Crq/cMeVts/P4JomMKB0VfKoSX6?=
 =?us-ascii?Q?bnCJk4oUAQQ0nAUGYEtJi9JfS5AQNMg=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b43b3c-cca9-4b47-99a0-08d9ec16f9f4
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:56:07.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrWl0wR9OWIqqS9VlNzgqjLU/302gs++zhv+WGpdqejbcx4rmucXfCF1+CITS1AX553xuN2dXgq2NXbbn8IOch27Uxzxls7MftpsIi1anow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4575
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Bee <knaerzche@gmail.com>

RK356x SoCs have a second thermal sensor for the GPU. This adds the
cooling map and trip points for it to make use of its contribution as
a cooling device.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 50bbea862a6a..37194d735028 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -1093,6 +1093,33 @@ gpu_thermal: gpu-thermal {
 			polling-delay = <1000>; /* milliseconds */
 
 			thermal-sensors = <&tsadc 1>;
+
+			trips {
+				gpu_threshold: gpu-threshold {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				gpu_target: gpu-target {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				gpu_crit: gpu-crit {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_target>;
+					cooling-device =
+						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 		};
 	};
 
-- 
2.30.2

