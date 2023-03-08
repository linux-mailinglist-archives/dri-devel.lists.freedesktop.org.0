Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF416B06C4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6E610E676;
	Wed,  8 Mar 2023 12:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435F410E2CA;
 Wed,  8 Mar 2023 12:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ/+jJMc0B60J9OBUCaTPEvjX/QEeeV/1rbRvkOHvYT9cfHTNmpSPXwoWdhkI6gFi5q3L+i6WMZuojm2B4kkHOlUPlHUoIPUeQuMhPrAigPz8GFxJsJpApjJTYeG29uu+ZZCVEzsbsrQNliRUn0xnm6e6kK838rHiLX75Oq010KwelU/on4floysFEMma/Hsvz8D8BfxDE5C8uIKX0No5rFj0zAYh9sBfOgyKE0BjhGdNfRfGa3dgaXen25xUTG03q9P20POWl1YrLhuEjslbCyt+BjjxsKi5hasMPpZ/Hk7fY25wsB4B3AHPSAMaWGa9ijUU//mgFXAiYOCLslqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f1jc7JEegY3TTqi7KArcSPfplPcav3nTCioCR9V7Es=;
 b=PQCi64dB5tAw5X1In0fCD5z/yCTCa5C8qGXKsAobqHz9JCtjZ0wRdhFNFr+jHmE2g2O6D2k2EVxb/jAE063iw7475EM0SinCcc5ikSscnHbepmg6Gf09NsHKLqgO+JxmiZUYnp30FiVByJCuO/DkSiH8JhI+94gicy8p45/kXPqsAdJag70F/rVIUTfef9QbYLx3RLvhL97P5/s/yJfIlNHLStFEk92mjWUlsC2X17ZjkibscI0BuI8P87hWsKid6MiT9IZLdL15KW/ZrZpi99AJd5wZ05FqH3HIY5aD5t/Izx1g7bxYLx+9EU5cZyGXRV5GMt++JkrAa1Y95O6H9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f1jc7JEegY3TTqi7KArcSPfplPcav3nTCioCR9V7Es=;
 b=xcoPwFn9pS88mwGV0H/F5jXm1eseTUtxP2SgBNPkKvehrbf8eioGpj48dSht5a+1C7wNZXtoMIWmUKDcCVEiE0m3qr7+UsWwO/Z9Ku5rO0cCG8IzdgvP3cuSBrEIeYA6rxOkM1o2Vv2Y2R/DkIh3qLRGbEGlM669UFL1pHdtmxQ=
Received: from BN9PR03CA0161.namprd03.prod.outlook.com (2603:10b6:408:f4::16)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 12:17:34 +0000
Received: from BL02EPF000108E8.namprd05.prod.outlook.com
 (2603:10b6:408:f4:cafe::60) by BN9PR03CA0161.outlook.office365.com
 (2603:10b6:408:f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17 via Frontend
 Transport; Wed, 8 Mar 2023 12:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E8.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Wed, 8 Mar 2023 12:17:33 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Mar 2023 06:17:31 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>
Subject: [PATCH 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
Date: Wed, 8 Mar 2023 20:17:18 +0800
Message-ID: <20230308121718.2586933-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E8:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 791432a2-d3bc-4b9f-c5a1-08db1fcf18db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/Zfyz22MRixUKv0ir8QYTpq6GmGpDvQLp/dI81NHYFzXbss7xlHMd74qM8pn0/e3OaN63PVdsS3GAdA9Evd4hot0VZnNAkb9ROyh18YnCgvwCLx/ibMbbxBM7hgjqqJAZKocnujPcSsz/b8+z6aYmOwYySyntvhBJ8J7Ec8RXnVh57X/47EYs9/50syY54v94i6fQCDtfbCSJYohph4zNDkDRZi1Pa6GxeipizLAuaM+uteC6i6UkfnHm2ZZglV0VaLULbtTPiYQ6rk/se8U/S8KhrWA0tlQijWBoiUj//q6eRyiV3Ip5pSTAVD4ZnssqhWp7RU+l8NTJVGCF2dtFx4n86u7QIsNiCRdCcBim3H8Q3M1w+FGbj0N6hUJ3B+XHnYUwezKv8hwKLYoN4bKmWSjtHLtYljQnVY1iB9XWcRfF7JlPLlplRMia04wsagNgHb5uzqvgp4AlhSZra4KwUZ0HUo84T33G9XvhPYKqkOcH8MoSEAz46xVSV96yUtDZrR9HI7+Fi4Fb7qDNp7lD9wOmH4zY8IYOlrBTwiURCGdE6J6b6dYqDGSOeQ4intawTRRZGnT8oMMUxdt/KsU3IIqHMQKLXZFY6EN5W9fTJ6SBB7iK8rKA4y5kj+oll6MpwOpyPNkl9ERQxWQPiAilll69qb3oYSccUY2jpNl8VvXBivE/OsOvcEXy0XYuFD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199018)(36840700001)(40470700004)(46966006)(356005)(26005)(186003)(70206006)(70586007)(6666004)(44832011)(82310400005)(1076003)(8676002)(16526019)(8936002)(4326008)(40480700001)(966005)(2616005)(86362001)(336012)(316002)(83380400001)(7696005)(5660300002)(40460700003)(426003)(478600001)(47076005)(36756003)(2906002)(110136005)(36860700001)(81166007)(4744005)(41300700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 12:17:33.8335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791432a2-d3bc-4b9f-c5a1-08db1fcf18db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765
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
Cc: Guchun Chen <guchun.chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to catch issues in other drivers to ensure proper call
sequence of polling function.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 8127be134c39..85e0e80d4a52 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -852,6 +852,8 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
+	WARN_ON(!dev->mode_config.poll_enabled);
+
 	if (dev->mode_config.poll_running)
 		drm_kms_helper_disable_hpd(dev);
 
-- 
2.25.1

