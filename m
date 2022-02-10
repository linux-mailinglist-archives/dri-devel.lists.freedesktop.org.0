Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4C4B083F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F92A10E796;
	Thu, 10 Feb 2022 08:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E3210E79C;
 Thu, 10 Feb 2022 08:30:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ3MXsHv0MWU1shpo5N6ClSxNLSByFvpl1x25MsckzysGdNmstPW6ihH1AIcDWUmFyWKt/AOR/I5fAaI4seig43FppiVWkeIFRTTHz54Qug0xeTmbgxLmtYONs+vhtrpmkhmV+01Rys0gbn4o1ScP+sroET5fznzs0EOOqmmlNynN6HBvBIS1es7Y9GFlBSoTd2IKDwmGXL2MusiyZnadCieZdOVX09s5xOgoGC6GjRK3MA07rlSxn3y/NrcfU8vDT8KcWhbQ+qXd4IBZ/9yua85dzO/ScEa8iFi/Kth81aW1u+LNw2kU2vTLTWL8f9B7P4ZIhZtnnd5iP1L+c5aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSrZrMejNhwSEpVtiYbEvG+nnbQJCjcunapuQFmhY2E=;
 b=diWvzTd183pAf9y7+2A6AYWPW+qk7beWQ6w9uHN3PrbwwZg8EHDV0rWmSdNHIXJq12tSv+etceUpfVBtpmAAz8NxDWt1k2Kcmzj8qjCsFWCl3gJkbLQU2KYx0PsglnWSttsm9ilVsG1qzcp5NcfxT2AFs0RPzOCYKbSk+kTMfq7ad6tL9kAuSTgqzJrhZNaB+BiuJb3xRUd1G1ZFv+YeJBf3qIV/55d9RpsRjmhoaeNj3vhl0LkxzEya50IQ8DknxQQ/0YrcU8cwbwMcMs/bPOO32zPn5XnXp8l1PWCvz09r1XBkNLgx6FhySWkdVDROQt4p0aIcpS/pbQWVw2M+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSrZrMejNhwSEpVtiYbEvG+nnbQJCjcunapuQFmhY2E=;
 b=Yu6ta2ilLZQvnkQM02Ww/BzXW5gWLE1f3WdOR972ObqZfpBD4rjvrs+zSMQJa32ymV7DxZmwOaICwSV3aBISDFfwJOv+4vKfHgaq7kPd2blbcyVqKOOuwwu2/DsLa/CFC5z9yJDJUtaefVk4tAZkAz5NGXem8T3IyelHqVXvV74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PSAPR06MB4005.apcprd06.prod.outlook.com (2603:1096:301:3a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 08:30:26 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 08:30:26 +0000
From: Qing Wang <wangqing@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: radeon: use time_after_eq() instead of jiffies
 judgment
Date: Thu, 10 Feb 2022 00:30:17 -0800
Message-Id: <1644481817-14624-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:3:1::21) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80895627-6212-4cff-cfb2-08d9ec6f964f
X-MS-TrafficTypeDiagnostic: PSAPR06MB4005:EE_
X-Microsoft-Antispam-PRVS: <PSAPR06MB400519D5B59F66D7775895D7BD2F9@PSAPR06MB4005.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DiPzyRK7tKjmRwy+11U9pKmSllGvyE78ghHE+xvBfa9cNTC/PJg3b1iVC3O+yBxpxI8ARzQl6Yj6kOZrMiE7dapljOtWQKNz1DAAQWFSsT0HgKoMn26q5XlvKj66Qagk2kOShbeU6us6uYK8dnnnO9U6FmogJ+UMzrwXqGTS5AMJhFRbb2Fk4+oh0x96n1/cO5G+C2tNtfTNOWjBwgZpjP+SH+lyVxabZm3Apk/W13gy6pZ9qyuhRFLAnn2Dzd7/sJI97G4xJnYdTRDl957S5RqGMP1HsBSvrDuF4JeQB3NQHJalRRS8WiZeXvhYUsKRZQalyTaNnDt5XlIiaWpxy8D4LNhuNGSQHyZQResAfLhg2EsuYU5NE1xz+wy1ZiZia8PjxExxDsAXSyvEaXIard/22zN6yQzYnmMjhzLuZef2KnoH3SYR4gRcd5u/UZiddI0eFA7Yrno3zJx1I30PwGfmWqMYn9XnSMokfq7M8nfeKtqFRQmSnP1CzD0QCaG3+U3iT0YgBQZdu+yY/EkiZ29hA0l9AMPnXRHIY/ZRocIMwv96DfM7WrrlkZvCxcycsNl35uAmtRbQCl+QXeI/e+Pr/zdnzvF1tICW/RQxQKScTPPfOi/UerQT1ZUtfn+T5ti2SxnyySEzC1LbP+WXFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(8676002)(66946007)(5660300002)(4744005)(52116002)(8936002)(38100700002)(38350700002)(66556008)(6666004)(6512007)(6506007)(4326008)(6486002)(316002)(186003)(2616005)(110136005)(36756003)(86362001)(508600001)(83380400001)(107886003)(26005)(66476007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Xmbz4nGi3dVb4Tx8T3hawf8RX6a6h3z/rDicCgQ6xOgDT9xbhaRRejk9lLpPCM7izIuwMV1R+DPx2usRsPIZVLb5dU0Y2AmJF7vNMkwgxp3mGdC5i+PU6yF+XeWVF653db+Dj38Jt1chRpN+bTSkrkMotym5iwxtthYcUKPIZTPLsk6BztSfT4d3Qz9Bw1CAAi2uPoasWPoKMpWdxNlTLkNfBLX+4xEga6M5hQajwSVFPRntdGKk4flWBMwfSr7fwjrmwVRuKs3lbjeZuJlVBl8O6XgtYAS0QjjrPJKQoNhUKxzNrfcdnb8No7zpIYgu03DgopWn3rz4vvCTl6q+//aVDWJUBGgbi9DriH2eWqa11u/mmLlNFZjsTsK3/L/yU/HaESDD2hubJOYMxIJRl6I4AVgapxwZJvVUksT06X0UHHdLmgoDwaR50kCRNqVS
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80895627-6212-4cff-cfb2-08d9ec6f964f
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 08:30:26.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sxj0umM1itkF1T2g9R+PcW4OjIxSelzMkm96DB6j8UubZ1A7zbjNg/NrqdMuvSZ6rNL60mo7lu8gjuAfLPP8Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4005
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

It is better to use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index c67b6dd..53d536a
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -25,6 +25,7 @@
 #include <linux/hwmon.h>
 #include <linux/pci.h>
 #include <linux/power_supply.h>
+#include <linux/jiffies.h>
 
 #include <drm/drm_vblank.h>
 
@@ -1899,7 +1900,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 		 * to false since we want to wait for vbl to avoid flicker.
 		 */
 		if (rdev->pm.dynpm_planned_action != DYNPM_ACTION_NONE &&
-		    jiffies > rdev->pm.dynpm_action_timeout) {
+		    time_after(jiffies, rdev->pm.dynpm_action_timeout)) {
 			radeon_pm_get_dynpm_state(rdev);
 			radeon_pm_set_clocks(rdev);
 		}
-- 
2.7.4

