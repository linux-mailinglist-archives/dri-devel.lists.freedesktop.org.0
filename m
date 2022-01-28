Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB849F629
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 10:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E0410F113;
	Fri, 28 Jan 2022 09:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CDD10F124
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 09:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjDJgIybZ7WDuoQ/W3X6osgBX2XER9Cbjjx5wmNS0FsPp1sr9+pFZcMm7d9bYqgx7l2P80PA3+UDzZv8uYeRmja6Iv7m7c+8MRO5QaRNydvCa6W6Y8eJgNEE5N8LkA8LQ3ytHq8CkkdPW7/4DkWxD4jKgob3ITuZ8C+4SH8cl+ezhbNrlpxh3jyGuibAo/oOgeT44AZ67yoyVFqWNT8WwKacPQVP1KjpDhUhw9owLLyibP04f32HMTq6OlPK/6KAzHwLFalVkOS09i8VUlHTZh0lCRKyEXuKNDyMpNJEuQumt7DrHdiF/uhugJjZCsyOXU+RaOYYAzGzL3QuBEdNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNqNeLHd9928JOy4dCydfe9XRDJi9z198CMfMZzak/c=;
 b=AoYG1GgAwNLMc9inrbV35fDNTbW74Ewgpi55Fv0R+QprG5wEpyY8/VfCLrRYbCQKu2B2Dc0HSpMWXtprr9FJiS4n3GQCEjpvKaUiu0Y4fObPf1Fr05HtO2mYZrv1nFyxr2JkQRypK7YxAGlAutc42ZWA7ALoXMP52qKdz/Gpfo/9LNl4z4hQRflb/YZt91/A55Sb+PW/yVoiMtXXbcHwfR3Kf2OV6FGr6VeOKRi1c5GBTBDPa29beecF8fbu/CyyjzH6ReGxD/bgz0Gb+exNlahwkTADqjCNAj7uNOc/BW67BOb/X7IpQAVyiqKzW/g8PNOFdUNSoL5XwdKxhJn4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNqNeLHd9928JOy4dCydfe9XRDJi9z198CMfMZzak/c=;
 b=CJyYfbsJ0G3h1dZUL1pCVlUbg8utR4KqoIG7mczoEVsCZ7os00QIoe6wRLek/UtEaTxMMdlb68U6NNqwkB/5KWRQh3Z02xWDNFjZPCM60kuGKzznKOvDA4fzAdg8ylJ2ZnSSKyyIp1PoHeUe50r2QWxX06R5RQvHCT3+ouXBgPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6484.eurprd04.prod.outlook.com (2603:10a6:208:178::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 09:20:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 09:20:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: dw_hdmi-imx: Fix bailout in error cases of probe
Date: Fri, 28 Jan 2022 17:19:44 +0800
Message-Id: <20220128091944.3831256-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d320aac7-ea70-4de8-eedb-08d9e23f7757
X-MS-TrafficTypeDiagnostic: AM0PR04MB6484:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB64840CAB49C04D93A9374A8098229@AM0PR04MB6484.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElKU3xwgfwhKH8EO6Eivw1xDiyHTtxRRfQFshhR44ILGVTWeQuMu3z2FL2XNaJTl4kSmz5fV1+RZjfvJSwPBSe2Uw1C48B7xVofXq3BjjMPdq7QU+u3rTY4ns1FbD0F8tJXgz7kOlfD2SkwL+Li6QDoNB1kUqOrMGSfMYlu5t+Tpn8y8LOLxezyw2VVnS9mrkG71JCLRpOytjab8b0y5nL3+ORGyQIrL/XQqPSOhe4PAyt7a0cLUrUEFPC3cVas1cwBh186hgwd0JvllUmx/avUcOw6mEsa0sjRpDgfk/24KU8y5wG5wgvaGTIXMYO6y4f1FH2lzQBYeUqnYKj8ZgKrQq9ndJmM+emc+5WAHlx63NKVJ5RT/WV6n1cvNQ6dLFWWi+O9I6n459saBzRBgnvDfkHjv+ik0B+Vut5kHMWZGkMzZzUI10cRHyv9NYFIjG0YV5jhjPb+qcxagO88+VFCyxQ22kCyKzqiT9nP3Xmo1GZMvP1X2E6iOOleA545afCI+YCUSbFWq8LFNLI3aeWJhVpq95hdNQxqCalib6t2OpV8H35+DbnrJdGK9yD4WDoBErLfmyxq1ugkVl+wBsitjhC344Cjn17pptPxoxA1JPUgnXAUBpJgLH5B6b2fwlTF1XyXRS2s8Vj9ojYL2f5PH2MYShME6CYGZvDTrVfUcTfJieTUOTdc/UZPqDxC55XoWCMfZYu+p4LZAl7Lxqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(83380400001)(6506007)(2906002)(38350700002)(186003)(26005)(66556008)(38100700002)(1076003)(6512007)(2616005)(66476007)(66946007)(4326008)(7416002)(8936002)(5660300002)(86362001)(8676002)(316002)(508600001)(6486002)(54906003)(36756003)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZVy8xEYmJjXhOLblxWeiQG5xYofmobm3v6gYuntFHpkLSuUuFE5Uj4JOmveJ?=
 =?us-ascii?Q?P1igpBYfepb7AlQfml2Ul90yitbGDtmotYbyv7kxK9swjryI2tBiMa6jSOZ9?=
 =?us-ascii?Q?cSoFFA306al9Fid0uJLCSByv9Vq1K2EuS5AZm7huu7A8+fLmjzMtJ/SNWtER?=
 =?us-ascii?Q?o5nnLBIN7foVVuyqfIGLl6+4tKMYdapjx5P5iPU3TtpT/uUCvaKxi56oumxJ?=
 =?us-ascii?Q?7q3in2ED87cdKDZm5imZbBrohuq8VTfZ0cWoQmhN579SJkQFYJo29QoAyHvU?=
 =?us-ascii?Q?64UhEZrDu3gfqTON8+VsWf7dGgsQCUGHQQMYxkDkfSCLGGMydquZbuJ98Da4?=
 =?us-ascii?Q?9FTN32C1Uf+o9ZKF5lVr0kPoirLcNM4VNDWT6XpI1Xis7KZtnOTBGEVcU+Dg?=
 =?us-ascii?Q?I7wEIH0oYaoO7dq9LJTOWjtAgqAfnu8+vaRgCtVPTMGYMjARHr6rsXHicDhZ?=
 =?us-ascii?Q?ngum6ZYqrdtGNFRnFYftfAR5w+ffk901myzuEew2vvmz28HsVOgjP5PcM48E?=
 =?us-ascii?Q?WFNBh5tksCnAd5GwBUe8Q6zj3YdU9bqTKBtxDmSWb04zQhwdXr+acb9BPfNV?=
 =?us-ascii?Q?qBi9Wsz3BVm9G/cafQLCxYLbKlYsogV+26fPVRiMfRceDrpMG5drSkkAZsla?=
 =?us-ascii?Q?uMoRaWPKG4P7MhjDp2Xtix9Yf4yDKvHKjjaZ8wxxexuUu829ZmX/POR6DlmY?=
 =?us-ascii?Q?VuSdCs8HcuGpj4ovEjqi3kJndVo5VXKo5ckV0IFria4y2Uq3Xpt1K25hA0Bw?=
 =?us-ascii?Q?HOP3ipQAeth3nx8AXkjCTUQQxhLz2PtFAWSNf/xyHsGex5o7G4PbnWV1MivV?=
 =?us-ascii?Q?gHwJJTw4LD0tZ5+9wpcMCboG+Ziqw7ddLCgBdvWhSt9WS1YAuS0vXZ41KRTX?=
 =?us-ascii?Q?NFluKetAp2JcVHEDbo1Vlylaaf2e7d0KYiicE1l5w11E6bOzR1FeLNjK0ro4?=
 =?us-ascii?Q?aLtXjijY470LMsobqnrHxCAX6iyFNhcE1x6nsUGdlWCEiV4c+HIf92E4RmcV?=
 =?us-ascii?Q?G2NgsjyVImemV1wn5upqiQe7oZT8RgDCbbVf/R7AUNo/cxCC4Z2zG0We9g23?=
 =?us-ascii?Q?uCykmG4cTMUAv6XmDoEz/al8B7H0Jy6i7yGv4mEqQWmphH8DYff3eE9zT96a?=
 =?us-ascii?Q?vLtyUpTUGeSQMYGZ3LjiLvFIB3qTUEkUdtYLyfpJGBpkSV9aKPd3ked3pdug?=
 =?us-ascii?Q?h/oBLXXMePxkg0lwNA/bL9Cdws8XhEi14ImTEjV5NHp9wa/1ic1/U2AcSsro?=
 =?us-ascii?Q?zzcj2g9D1VsPQBRC0E03bjQJqW6wQ677awnquhJsINlbEL6s3YV6hBQN5HrU?=
 =?us-ascii?Q?4AOD0tWfMST+DVgNmbrFlfRAgiEUFY1XnW6E9H1VfStaS1oy2XAbD39i7fpM?=
 =?us-ascii?Q?oCsIpVCZtQAug3g72tIFAIU5bmMhJWbcKd8a2hOWgsvdyb93ttcz5fzgvbum?=
 =?us-ascii?Q?pKxdvyziPKEe5zQzyZzGCoHpb24bYUAxiC1eP8IZb4MH2phfNuUzvDwC2Dui?=
 =?us-ascii?Q?RVoov8GTRmXJaobeyyqc+rgx27j0EAaBlOYQj4ADYBP91tiC3u2LQBLtSghF?=
 =?us-ascii?Q?WeYUd9wVaXlTkHWcG6tc+u2ySfp0owVBGAK1m8SyyisroVczcJwxOR3CnQ9C?=
 =?us-ascii?Q?o1pELza6S2nG04Ic9Wd+47A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d320aac7-ea70-4de8-eedb-08d9e23f7757
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 09:20:46.5984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jX64J35mum6XezSRBlo5DSD6HP4tCT3Ty1jNrM4hffz97FGvRrlR+DuPhOBW53vGUWxa4WAOLPxJFOe94QK6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6484
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
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In dw_hdmi_imx_probe(), if error happens after dw_hdmi_probe() returns
successfully, dw_hdmi_remove() should be called where necessary as
bailout.

Fixes: c805ec7eb210 ("drm/imx: dw_hdmi-imx: move initialization into probe")
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index 87428fb23d9f..a2277a0d6d06 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -222,6 +222,7 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match = of_match_node(dw_hdmi_imx_dt_ids, np);
 	struct imx_hdmi *hdmi;
+	int ret;
 
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
@@ -243,10 +244,15 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	hdmi->bridge = of_drm_find_bridge(np);
 	if (!hdmi->bridge) {
 		dev_err(hdmi->dev, "Unable to find bridge\n");
+		dw_hdmi_remove(hdmi->hdmi);
 		return -ENODEV;
 	}
 
-	return component_add(&pdev->dev, &dw_hdmi_imx_ops);
+	ret = component_add(&pdev->dev, &dw_hdmi_imx_ops);
+	if (ret)
+		dw_hdmi_remove(hdmi->hdmi);
+
+	return ret;
 }
 
 static int dw_hdmi_imx_remove(struct platform_device *pdev)
-- 
2.25.1

