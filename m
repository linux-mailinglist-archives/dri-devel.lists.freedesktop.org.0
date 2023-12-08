Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A022A809E3C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D01A10EA18;
	Fri,  8 Dec 2023 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD35810E24B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 02:15:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeX+sTEVVYEx1EHB8vnHbphwU01rBy/oKytrjCzGpYLUgwQAISTCriXcva4hAzdgqxLtR6I0YskqBn0jImyoLaaG42eb83cWigwimmz8GEoyZYQoh+mEYxGpicPE4ht5IUN6/k5fNps0Jo6CDWlY4jdh0zSQ+oryBbBVqwXMyhLVUfrTk+QD8u1vhkX0K8nFbA8hfBRQIEc/yLVnliN7RVSyyo2pi+uhVEln9pdvQF+adeKjbVYdpt2bGzPwyTk/9qIl6QLNBJOBtbS+n+qDo1CHKGtRUzcC25CVJqgIg1viniH4OiVHdnP7+tQX6wP6+qISGMpI9WE4RCcHhmKCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhpzfX9C41j+azhm0yG1hl3wKGMFJo02kJXUyO8By1I=;
 b=QevPTeB+VJa0vQ3DqOElySI4Mx0lyyFVx7jyRD0ATOrWXqGEZAx0sq/0/BRVvv+RNnMlnH5yMI0aGHUIg9d92+HPMWkl2j3JM5JzAMB1mmLsnhPuhWr+NjsSVRpQ5prpuLkyJd7uw3zMslUZ+94nBHmhqg8mV2nvHS1EQWvmcJEvo6A5p4MsJnxaUH75wHMC3nL8TaeFOZDCTnEAiY0u/gNwQN/G8/mjObJk0Y+BsDbhfJM5y7DQYgZ+q733CfGROsvaJ/Of3QspcTQwv9S22XYkNkSEcoraAyXvbJ8VVx6avpv4L/V2R3tjcW1P5EIvBFW/kXRd2Lhr0IU+qGcvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhpzfX9C41j+azhm0yG1hl3wKGMFJo02kJXUyO8By1I=;
 b=RwgkgwaugXJvNP3OVbdHt94CR4dNqRmvZ/qy5R/vHJyjXQLsLIrKZQk5E1GbUH7++mjoe3yr8MLODEohvs73hBF4tmrmaCe0EN5EtRINfXb6mX/ZZ14pjq3eDwoLWeuvxUEv9jXm88WFpTK3JGXtFdeVaRpPc00C3KhOX9jDucI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5463.eurprd04.prod.outlook.com (2603:10a6:20b:28::26)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 02:15:26 +0000
Received: from AM6PR04MB5463.eurprd04.prod.outlook.com
 ([fe80::db2c:c4ec:29f6:5d0f]) by AM6PR04MB5463.eurprd04.prod.outlook.com
 ([fe80::db2c:c4ec:29f6:5d0f%5]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 02:15:26 +0000
From: Alice Yuan <alice.yuan@nxp.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
 martin.kepplinger@puri.sm, kernel@puri.sm, linux-media@vger.kernel.org
Subject: [PATCH linux-next/master 1/1] media: staging/imx7: Add handler the
 abnormal interrupt BIT_STATFF_INT
Date: Fri,  8 Dec 2023 10:19:40 +0800
Message-Id: <20231208021940.883259-1-alice.yuan@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AM6PR04MB5463.eurprd04.prod.outlook.com
 (2603:10a6:20b:28::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5463:EE_|AS8PR04MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 8874faf5-5c00-48de-90e4-08dbf7938a82
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNPk0N4rGm+Co1QQzG16ONJtW1CV04s4lUL0fqSVZ0A8CXyWoaaYeKanAYIWOBROBJgGWICFN6+htK6cuRg63YvQduTOaa3454UWIWYNB9Sg3wRsY/XoCsF7nCxrdl8DU86HNlpZW8XEfAi0qGoqBcSfhmhXoK7F1n1Y5BzNTHxugxMUP4xNxxtQTsqQ/DwCkUDUJD7vXnpIX+vPEbQ3TezA00VVDCUdaLdWF6NM8RN8DAttcccnOknk9TRJcCwK4JtFNiQpC5Puo7+At9d0lTvN0ap7hFUJR30K74VgmHjyIQcZzdG+HNXrJtSn5XHaGhLYyR3+JitRUwQTQCXqP0MbT0ArUBuxYA7/HBOos7CDRvVI7X7d8Dy8sG8LiukB/RohfmzyuKyZkuXFh8vXE7j91pmHSyBWvjvYyW4WVjbMryyaYWgeHPp4HyfAztz5Eegto/P4ZZjmxvWgqeUhDb/puObvX3LXBo74yANqGzNuc8P+/ODhKev8KWQccw8/2IoDvGGomuVWOu8dE+YnctzsQxgrPYutv9brca9W7NiIAZcxEhNrnzRnSduFXQldis1/DFrM0lqCelq2buIR9WY3uPPicq+/lpcir088WpyZYQR//nWtygwRHeryyMdj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5463.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(8676002)(4326008)(8936002)(86362001)(44832011)(38350700005)(36756003)(41300700001)(2906002)(83380400001)(1076003)(26005)(2616005)(38100700002)(66476007)(66556008)(66946007)(316002)(52116002)(6506007)(6512007)(6666004)(6486002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Z4xInSKU9Yj5k2sz4jbHy1BZO1VTyJNhtOgiTm7j0CjJ3hppBKzaOwRD/6E?=
 =?us-ascii?Q?9UIdeetrvFocGrnqxBVMHuBGaXpeSxA8HN77xyqinxA6x4M5gpxuN82XVgCX?=
 =?us-ascii?Q?RLK2n0hmUswmzMaBMNxUH9LD1pUJX4xytIZX9MgGDzX+Ub0DaS7u/raHc4UC?=
 =?us-ascii?Q?0TZIkJr5Nw9PokvF9dzhbvdaFIyGlu0wGVpl6krhcy+/ThhQx6cXSbRyhcGB?=
 =?us-ascii?Q?iZOQfj0PkBgO1vIny0Q1P9CS1TxCB+I+6kJMygOpLoTNZdtUW2Vipk+VyfOw?=
 =?us-ascii?Q?dapqsjt2WrontrMmuqFX+HUnAGeEKldqkVsWetO1AmmgUBjH4KWzfYdSemCd?=
 =?us-ascii?Q?jf033eQFMnJ4FO/NJJklCLGjZRo5PaMNLGvAAEMWAL7Alz6ry1u4qTHD9vmj?=
 =?us-ascii?Q?WEQhRKOBJh12gyW4uWKMbhsH949QEt0Utqn+FdTVoravOYQBlnbST0bVdcei?=
 =?us-ascii?Q?s/hkers4yAcz3tDqBaQaTJhaBJ6yWZLwjwm9P0HbYcIIL1YxjiosfGArynKx?=
 =?us-ascii?Q?uDP+LwbpzHf40Gb5ZcOMSBIYqrihh1zHl+Mq8pWStpS8IptT/Q1cVTA2hpk7?=
 =?us-ascii?Q?K898F1aC4DiDC/Mxb8WPW4RGzXINvVrnUvox1LG7/7KRNwNr3wj1YdfwnOzh?=
 =?us-ascii?Q?eyGDvsj+KJgyJFHY4bcFwsDOkqUs2+WyC7bC7zX6lqJdXgF1lWbxiyOkLnNs?=
 =?us-ascii?Q?cO27ovhZ/VGEFzchrJbkz1wgrum0DApgP5CkIUmMkPwYC+jXxLEWf3JJJvbt?=
 =?us-ascii?Q?tepS4NLviPONXUso9iP4KQ4BQjJ647hzqZD/EKLkZ0T+PzkBYVFmeMqovvRP?=
 =?us-ascii?Q?URhhw0ynpbUrzRXCFyXB4sq3cZRkvGcodXcNGtPEMehRKR5EFmwA6mzYw1iJ?=
 =?us-ascii?Q?haDXjXq0Myp2uoSZ9Hv6nNE+n0TCJB9QA2OijysSWfpHvvVoOG3qT1hVa/9l?=
 =?us-ascii?Q?APSoYb+6DuISK/apFEfeXIvxR9wGtBl/ZyXsUbBxnWwqoNfP/1497I5TUUFj?=
 =?us-ascii?Q?nYQtlMXbuUeOo9dIDcpQ0YSXWkcRl4XKuWoSbv+bu71F9YWN6OImEYS1KJkd?=
 =?us-ascii?Q?mHxsCViupnkI0/DJ6jLCgPZwBoiZ+vkeiebOctF2mrkioYpYq7AIn75QZYDA?=
 =?us-ascii?Q?aANmpkS2Xv1O7n0q1nN44YAewM2OmGBLSDweTF8IaZxNllb/F5YlpJAuaNsj?=
 =?us-ascii?Q?B/xXl7KqMg6qhmad3sgjkJb83jABvfiSvEFoWPDrzqcFbkkOwIkO22qU6XCf?=
 =?us-ascii?Q?MBWvgh6F8Yl2WzY6EYs1B/a1rvaBtcEL4as1FqhkqFaW9u7HiS3kAmLP6RUb?=
 =?us-ascii?Q?jvL2yBN/edUsvRyhLC6KyaJJn1FX5v9Ku0Fjjg24oypqQzMtINVvtb0fMyrT?=
 =?us-ascii?Q?/+jab9tsziEEhQIBTQ/v8ta05gNObWb9zj9cPpK/b2hDRDj9BU48VozCxxcx?=
 =?us-ascii?Q?0v6F+Ne0pq1UPqyiPs5QdaVKjojbRs4ibt695Bu4y9mdu2g7W/oW0A48wbh0?=
 =?us-ascii?Q?m4hysnyJu4Nqm2EIXKvdgq6slhJ3naf0d0Tj13pIx2o3TZ4LfWDbOBl11lfe?=
 =?us-ascii?Q?mF1cg8/695W+iDpd2eJPRdN7Ao7ESQMiYf1ruYpk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8874faf5-5c00-48de-90e4-08dbf7938a82
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5463.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 02:15:26.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA/msxNHA69fkYltv6+8XINLeE2fjBweV2BhVm5jKmID2/P41x8aJfzcUtcylVgPJoCRwQXe4GBDkrggHAK7Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927
X-Mailman-Approved-At: Fri, 08 Dec 2023 08:35:22 +0000
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
Cc: dri-devel@lists.freedesktop.org, LnxRevLi@nxp.com,
 linux-devel@linux.nxdi.nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "alice.yuan" <alice.yuan@nxp.com>

When do 2592x1944 resolution capture, we found some times the
"BIT_STATFF_INT" is abnormal, the stat fifo is not full, but
still the DMA transfer done interrupts generate, at this time
we will get broken frames.

From the reference manual of imx8mm, we know the STATFIFO full
interrupt status, that indicates the number of data in the
STATFIFO reaches the trigger level. It defined clearly about
BIT_STATFF_INT, 0: STATFIFO is not full, 1: STATFIFO is full.

So we should handler the abnormal interrupts when BIT_STATFF_INT
is 0, the stat fifo is not full, we need to drop the broken
frames, and recovery from the abnormal status.

Signed-off-by: alice.yuan <alice.yuan@nxp.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 25 ++++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 15049c6aab37..9012b155c2d7 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -249,6 +249,7 @@ struct imx7_csi {
 	bool is_streaming;
 	int buf_num;
 	u32 frame_sequence;
+	int frame_skip;
 
 	bool last_eof;
 	struct completion last_eof_completion;
@@ -686,6 +687,7 @@ static void imx7_csi_enable(struct imx7_csi *csi)
 	imx7_csi_dmareq_rff_enable(csi);
 	imx7_csi_hw_enable(csi);
 
+	csi->frame_skip = 0;
 	if (csi->model == IMX7_CSI_IMX8MQ)
 		imx7_csi_baseaddr_switch_on_second_frame(csi);
 }
@@ -764,6 +766,12 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 		imx7_csi_error_recovery(csi);
 	}
 
+	if (!(status & BIT_STATFF_INT)) {
+		dev_warn(csi->dev, "Stat fifo is not full\n");
+		imx7_csi_error_recovery(csi);
+		csi->frame_skip++;
+	}
+
 	if (status & BIT_ADDR_CH_ERR_INT) {
 		imx7_csi_hw_disable(csi);
 
@@ -790,14 +798,19 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 
 	if ((status & BIT_DMA_TSF_DONE_FB1) ||
 	    (status & BIT_DMA_TSF_DONE_FB2)) {
-		imx7_csi_vb2_buf_done(csi);
-
-		if (csi->last_eof) {
-			complete(&csi->last_eof_completion);
-			csi->last_eof = false;
+		if (csi->frame_skip) {
+			dev_warn(csi->dev, "skip frame: %d\n", csi->frame_skip);
+			csi->frame_skip--;
+			goto out;
+		} else {
+			imx7_csi_vb2_buf_done(csi);
+			if (csi->last_eof) {
+				complete(&csi->last_eof_completion);
+				csi->last_eof = false;
+			}
 		}
 	}
-
+out:
 	spin_unlock(&csi->irqlock);
 
 	return IRQ_HANDLED;
-- 
2.37.1

