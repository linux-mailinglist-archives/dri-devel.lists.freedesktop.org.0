Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1BC717DAB
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 13:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2803410E4B2;
	Wed, 31 May 2023 11:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11A110E4B2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 11:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zca6WHh8+x7eDDEnRIFLlbafGf/EaHJDdIRojOzRyk1OSf9cndv9SIFENQk0iIyRlc9Djft1vX8i5ZYJhGTHb4UIIUmGbxqll8L+8qLAOtNepL6gKTXIs5q+29KEaJyRcUGLGXa8vyZQf5toFHkCbcceudGC+QoZWpgASVvOV/P/+9nZLG0bPYi609lPEzHDQyMWU68ZDGUvo6QcCXdubmJA6MYq8KloH1mMYfwIz+gkV2AyF9+AF3+RfcEqkz4lwNRuJH48lG1r3N3DiBmukcObHlxFMowmHsoLcQuFiDuA7DgCV495Q2DpfAlHBoIwLGq9N5AV+JRR/S1qhkwSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5ulo8xH+IL2ybb8ZLIc6SEoHZL6IqKA6/fga5EvJyI=;
 b=ImvQ1pqNUahxDRwzVOAQyRL/ksemo+vmtWL9l9kKgGn50tQNfdAGanzcxUYGYFJJlLiPyhyJnvExUXV6uUoyHZvbzBwEIuM/TN3GOxO0NOM7lAxSJG12i5vZIZpp1DJrwGheN14RxzpughCONw2iz0FrhskR8bR2tvwsroQKjBNEWX0TKXlxKaBoD07XhkjpJgwSIHOhKV7kxZ7c8UlFA1seRK9hq+JW8bQCm9NN+QY7bp2VEWc4RvmpybjARywEHWyaSZKIVKnjJBjgVbBD6DTEc9yIiXyefLwym5T3evkpg4SVQZOY5PhmSe5ZG0ePKRiRoj9A9kvOViJPCWFGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5ulo8xH+IL2ybb8ZLIc6SEoHZL6IqKA6/fga5EvJyI=;
 b=T6fObKUZsimtbxUatnRvlfnSqBdEqA3HmT89dt2WLiGTp0HcU1+wUFjhNmSFpsRiRCE94q5tDPgZvatBL+Aokv1Aqo0C4M2o4n7unFXnFedA95N5/CYNgWF9xHUec5xWc1NQKBYVeYfTc5XPRCQK7Y9fOrg3IdCmTfvAjn3tr4CBoJhWwSUyAgm4ZZF4/O+zg/djhMmWm9wE+8c0b37S0X6CC0cWd11gpzHeZIP/mlodWIyNh4AufDUYdSZFeFLTo75ES10/nmjqdm6kyzbef76khB3EoGXqAZO92R6WGT7epQqzM+XeoaZF6EVU2GMFntWYLcCKMR8xFo7+s7xz+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by TYZPR06MB5075.apcprd06.prod.outlook.com (2603:1096:400:1c5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 11:07:26 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e%5]) with mapi id 15.20.6433.018; Wed, 31 May 2023
 11:07:26 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu: drm/panel: Optimize the workflow of s6d7aa0_lock
Date: Wed, 31 May 2023 19:07:17 +0800
Message-Id: <20230531110717.36896-1-luhongfei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:404::13)
 To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6697:EE_|TYZPR06MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 571ba621-1a20-4a75-9797-08db61c73797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVepBBS9U2fJNjItGkDPOo5BAF+1PUEx6lQpcR79MnstIS4/diJx1nqa5wrOosJhhCA6uG2VwPgi2ILpo7Q5kRyzinZLMFh4A3n3+YI3WA63ka3u5MuIyyyo752d+8kvVix4F89r6FdjZFegVWjuSE4j8H2FScO44SEPjfnMy/4rM69lVHjq7+azhAHDQRrG3rttLGMp7eud/hDxiucgxIoLc/yug/wASxS1WP2yAvNmpCmuy+ZNanDwk4f8r3YHFvf+F0FQJvurTQLVXCKgpqHNvi7SrIO4EhoxEyGa0/KObEMpgZy6/Xz0G6sEksbf/frVGYJwPHRx5pX/hN0ikkC5sceLEB0oVy4MUiYQw5DsB/kHnWGtwJJ8foJ2epZ6lhJM2uOAbYkFmonkac+cTMMeZErqmgPWqKXI2i5f3MKPI69nkMJL0yxHajq2Z1JLbEEUbanlWlZmKTqZaHnIwiBe5XgKfZbMByCxjRzBK6ydCu6aYi2qxMEVkes8YjkX6J8O+ZDgF4aVlziyM2i13CcOFBADoLuoKlW38eH9m4y3DE+AhugFDHkbeFYpbfYx8C+zMHTOOkJi7p1Z3xVRpOOJEBetE8s34/Wy0oQCB+a8oQPBtgerNB0bq0WhWmYn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6697.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39850400004)(451199021)(110136005)(8936002)(5660300002)(8676002)(2906002)(66556008)(4326008)(66476007)(66946007)(316002)(41300700001)(478600001)(52116002)(107886003)(6486002)(6666004)(6506007)(6512007)(1076003)(186003)(26005)(83380400001)(36756003)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aUysZ0NyWFg82v0qiNMhBGL4QoY8lVMa8b+2fd8W+HUZIT9c/ZDp0F1jEYAi?=
 =?us-ascii?Q?Iz333F11wfSsWUXIvBiJPYG68Xn2eb1tN1SCy7MmMouyLzKohz2oZrjHDuht?=
 =?us-ascii?Q?XqPinNMxLZWmnyD4r0Lgpt/nm7vijySNEG0tDtYXYONBG2xBWzdwdMeXucXS?=
 =?us-ascii?Q?vDJz9vUMwPdBiTmBQqE6xKj+69ivmmCDkCojExRyoab0Uf91czQ+LUPMEk19?=
 =?us-ascii?Q?KzKm2+4egLloYDhwVCmUQ9k2bAhSdenTavoYtxgy6K8DSmdfIm5404eOwaoM?=
 =?us-ascii?Q?+1zQxUB1cKO5xF1dTcRw0Omo+ns4Bondpeb9Lh4O0czEMm6a1tGlcO0j+Ur9?=
 =?us-ascii?Q?t1Oji2LpkX9QOv6k+q03Al0EnFT0XyttuPMOjRFDrLbAO4KIZdzXfXlzSpbK?=
 =?us-ascii?Q?2Pxg8k3C2X9DC6X3FzHn55ujZ4dR2LDmrENylX4NuGT8lYin0l1ximlNFxRG?=
 =?us-ascii?Q?v939B3fCyRwN1M5U7ibBRNW4ha7eQi/BPioqLZWPP3xuAy2kS0yLt4n/i22f?=
 =?us-ascii?Q?j7T2LpfK4iIbreYR+styoPjPTSb5wdMDwR7gUen9ivCL6xOdwz8zVrgSXjuS?=
 =?us-ascii?Q?MC2vTcvTatzdhzXfqUoRrXZ5uT784t/bK2V/06UhnZEHIZ+aNkvSfjfB/bZu?=
 =?us-ascii?Q?CWVtvzrw0fZ/ClH+T+MYUwKr3Uz+3KLUdVWgFLgQNXXnKZ7CZI/4TJa05biF?=
 =?us-ascii?Q?xhGyNmteY15jc0xvvbwYJDEXxxDt6UPubtvDwhzszv98UhWYXJiBu+vYHB49?=
 =?us-ascii?Q?TVjA3N7i27Gk6DFQLpW7I5zCTyyjzCUcntTl6t4CV+pFvaf7IPvcWsB8znw3?=
 =?us-ascii?Q?ulmHIfIEgofXYrsVkZGD46WrasKP+Xm0QQA4amEW8DQZkzSeEO3LWJXlpZbR?=
 =?us-ascii?Q?nmrHHSCc1QREGSGpdQweVIphDoFJjtGPTFW+d7mxuRqUr1X2nK3LjIOc6wzy?=
 =?us-ascii?Q?6w+M/1qaDXPY8CKMjsDImHyIbzmIEz9KCXEHB69WDNuczLHeKzoxp/ul0wrM?=
 =?us-ascii?Q?zemKpLb8/g3R8CfxQx5nzA/FCSlk9x1xDCoR4NDtc5EbsHrT3w4iaV70Wx+G?=
 =?us-ascii?Q?hli0h3iFGyQ6Ci8BzPH3oNDPfdeeKkuA4xM5E7hIctt76ZmlMwYsXt1q32nG?=
 =?us-ascii?Q?iV3aQ56P+JDU2IeSnc1PrQfYH0+9LgGYziBOEngsHE4SxZn2cVQzUSeDGSdD?=
 =?us-ascii?Q?3+/twML4iCOd0dCkv2Rn/TjGSCbqsmMZ5DAFm0njxfLxsSz25PB1UhZb80CG?=
 =?us-ascii?Q?uoLtd36CN1J08QtqrhoV9zB0hrWnSPKAQ55N7YONrMAEskCxXexfET+IfssW?=
 =?us-ascii?Q?q9eCYQZUIQzZKVfhcUlpFfW5YPcaqTRm/GahxgDCWQoxn6EuBLQxj3fc3Qxn?=
 =?us-ascii?Q?xQiF26+GXfUakaWoVpZtxijHeGXLt9tiMOE3rIrFJwKUQ4X1QuxDqUeMkSD8?=
 =?us-ascii?Q?L64YOZKr/WVDjKCXxVyCWPYSdJl5aUJnkGygDKEZoXK/PU0gtlaZ3GKgdvUX?=
 =?us-ascii?Q?cYuxab6P6scZ3gWD/oRJXr0eoXQ6lGGuqoArj64FgR/mohLJR3mxxL/MA/Dy?=
 =?us-ascii?Q?XQGK08Xg0UJQegRW4NmMXpOP4xCs2qfLA88eJ/MW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571ba621-1a20-4a75-9797-08db61c73797
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 11:07:26.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxZfCDty5HzlxVU2Zn+Z9l1ARgf6DmkpazMQUmnjH8aBo62rvqD/L/CDadcxrgkWNP5eMBk9X6PFB+cT2S1EuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5075
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch optimized s6d7aa0_lock's workflow.
Once mipi_dsi_dcs_write_seq failed, s6d7aa0_lock return immediately
and no further actions will be taken.

Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 30 ++++++++++++++-----
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index 102e1fc7ee38..f98df32d1c55
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -69,15 +69,29 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 	int ret = 0;
 
 	if (lock) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
-		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
+		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
+		if (ret < 0)
+			return ret;
+		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
+		if (ret < 0)
+			return ret;
+		if (ctx->desc->use_passwd3) {
+			ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
+			if (ret < 0)
+				return ret;
+		}
 	} else {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
-		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
+		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
+		if (ret < 0)
+			return ret;
+		ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
+		if (ret < 0)
+			return ret;
+		if (ctx->desc->use_passwd3) {
+			ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return ret;
-- 
2.39.0

