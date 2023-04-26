Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0616EEC1C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 03:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74BC10E315;
	Wed, 26 Apr 2023 01:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFB810E219;
 Wed, 26 Apr 2023 01:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAItYFyAdBhhdEy9B1H9uwsKNk9v2DXY2zs5RcMDaX/1YQN2LlirgOchi96oVdj+MjDNweGeDwecfJfP06N8j/9JrMOQp2ukPswimUJ4t/EV+xSWcluvfYyRUaFpFHoZFmOv2m+5y/IWfA88TTL9Bh521rCVFCPg9UqzstnNtppTdM4RFMXCDFmBAfNKQfrU2+H+UjEO0vubkY6ma6Pg9eiSqC4533mASy2tmLa9JRU9Dt/jl5EKMlWCevPMID0ss7+mz7c7Z1zFm1CAsVR32Na4PO35tVjeMk4VYmpwHcMhYwAeX/c37ID28ne1UxERML118PxrSX0/itL9m+xh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4qiBB5aG/Awe7v3DHzcgOybTBkAN/Tq5iS7RYSmHMo=;
 b=lf36B6CoHTKCw2E5jKXP5WxcKIKO6bS5krinK6JCx1OxEEWPSjTOHDmy0ZhkGG2zFSsUdzlBgZQcyg6EuOvUsRp2XOKUuHI6/bZYYeWc4iXcGe2mHWGT9R+ghd0jgKX+RwXlm0kPhKBqV1/nQCuOqCWrxx13fZZK16xqigDdjGhO07GygU2ivOOO/oh3Tdp6uGIlnGOg4NRStYo9ekKaJC7uUJbeeLtow0TMtm2AOl9Gpe7RU999dm5kWTySaGnZ46PO+dmkEXQ0KW/PG+Z+7+Z3EznwQgocTD4fqfWNcwWIey+nnKotRqLBY/PcvX/nSmi8uGwZXB4SgAdfdqsCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4qiBB5aG/Awe7v3DHzcgOybTBkAN/Tq5iS7RYSmHMo=;
 b=HusJTXKtrMqN5B5XpwstpGHM71Tdcl0dWTok177QqY9ng6qwKUfwQczpjjsvcZM/nnu8PPI6iOBcPgelaT1iR5k0aO3fXuj/jxxTJ73qRteSJg8pC9KAd2au0t17UavTlkI7Fk1fd+vo/DrLHG2F1IPPTealgnwzVkeEFegK4Vg=
Received: from DM6PR21CA0026.namprd21.prod.outlook.com (2603:10b6:5:174::36)
 by SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 01:53:18 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::bb) by DM6PR21CA0026.outlook.office365.com
 (2603:10b6:5:174::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.5 via Frontend
 Transport; Wed, 26 Apr 2023 01:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 01:53:17 +0000
Received: from mukjoshi-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 20:53:17 -0500
From: Mukul Joshi <mukul.joshi@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/ttm: Helper function to get TTM mem limit
Date: Tue, 25 Apr 2023 21:52:49 -0400
Message-ID: <20230426015251.551223-1-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|SA1PR12MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ee4e25-e16c-4854-d167-08db45f901a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oEmziNpGaafYdhKiM97/AdsZBL8OuugvHBw56sfOjlpI86RF4k7y1CUml1U/1fpRDDTmYhh/J9it/OH1pZ50atMeH4ldEgy5h0oaFFNVpqluiP2iNwrJCF0cAsuj3dgUYlsSvjwmR8m7ISMJgZyNS4Z2CMj71C5HxKv7OzUkkK2YceoUUbbDBiC/yaCjmnK7CpI97f7qOT18dJ3tHnXqmp2FBGtY8tjP6kGGS0KHRPKUMOa0eRGsoI2GFjtqPsNXXuBxNKYzKiTZsYemaGT/G2t2CBFE6VjzBcOkCZuDf55q3A0yUDomsUAMlsRaaRA6cDvsTx2d5mVDxXLnUZUHfFPDN2dxRxTyK66vHotqx9HydCua4gfIsvr4jz3nRW5NWdBToYEKEZDnvVSHYR1CBillG3+NeS28hFIyLtsMB7r7N1lChkNlwzvXTocSzikdBnq8K1s535fIvF/0VGsn4mIS90NFx831sHCFKbYOx83NUe+ha+ShWOySNVFXj2G5tYwBhXdfYaxFcPsSUCVyA8KRCokbl6u3C30YREPNXcoAnManZkx6LHrRBJjQQVrBGsEecfDD2tukelkiME+UOgvFEEJ7v7epExqN8mKIRNaIEOpH/qjy3mNGPX9ufQV95niceaijwfJk8GrcIcVAKCn6QQrUvFuZBRukIHLSqjCxOtZcvKk2N96JUYoBLWxNxl/bWRl12JWDydJsEDYXrjj4hLOsIoPVTZDsAhypH5k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(1076003)(26005)(40480700001)(426003)(336012)(2616005)(36756003)(83380400001)(36860700001)(47076005)(82740400003)(186003)(16526019)(40460700003)(356005)(81166007)(70206006)(86362001)(70586007)(478600001)(8676002)(8936002)(54906003)(450100002)(44832011)(110136005)(5660300002)(7696005)(2906002)(41300700001)(82310400005)(4326008)(6666004)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 01:53:17.8831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ee4e25-e16c-4854-d167-08db45f901a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to get TTM memory limit. This is
needed by KFD to set its own internal memory limits.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 6 ++++++
 include/drm/ttm/ttm_tt.h     | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index d505603930a7..1f765dd7792c 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -449,3 +449,9 @@ ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
 	return &iter_tt->base;
 }
 EXPORT_SYMBOL(ttm_kmap_iter_tt_init);
+
+unsigned long ttm_tt_pages_limit(void)
+{
+	return ttm_pages_limit;
+}
+EXPORT_SYMBOL(ttm_tt_pages_limit);
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index b7d3f3843f1e..d54b2dc05d71 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -222,7 +222,7 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
 
 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
 					    struct ttm_tt *tt);
-
+unsigned long ttm_tt_pages_limit(void);
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
 
-- 
2.35.1

