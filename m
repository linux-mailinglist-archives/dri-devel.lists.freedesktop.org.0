Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D7711230
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F0C10E6EA;
	Thu, 25 May 2023 17:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128D10E6E3;
 Thu, 25 May 2023 17:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgI7ZGv0BixI+hYwbXjT+J7Kty427DeU3pToUVne+xaEmJs5589/3Kqc8y76H1t7Gpvl1JfkjSicJkA6mwOQ4d2eM9eWhTVsAsqdVxMlO/NuFBcF+pseuABz5pFQ+Cne8nGeViYY93hNMZILBeUkSE3k1COlqB0U8XhS7Hva8IcvCSSi5ylCzqzPH6Zitutoo7yRU951ifSiI8yMF6AQnNkbx5oI4rnXfaK6wPo/9QVO8OKotS+WUt2t23TmL05FnrQFzscpEN+GQ2fXnXIYoSf+1+AZMxIm8oYidxdO0m5kMLnk+sZ+NSvKy/8MWlpZDSzjd1R4IQbw9H0KrB+uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w21aWOq22tIxa+0MHBaiBo9pnnOkaEv6rAVNfWx+FIE=;
 b=KjGyQIDjSspDN/fEZdZ1pjZ3dk8z0chp0k6sCZKaiUs2DOwGPyJ9CerzsCKW6jpYmwkchbHCtStYwbfiUF6LpntM3wcQSUOgnti4XCsJnuqqBvHK0rJfJRKahLn4A6bnGKJ8wTCDi1k1zUZ/M5d99mSKbosoiqzRUpKe3RwdzNJMUEvjaj4jNcwsjh/gn6DkvP+3P0Yg2mIp2gomv4AI2hJh1LnHtD/X/wd/BoY/LpDOZAMIkyaPCXHwcBoQ+xT8QrBiK+ZyerezMsrZL66YNDzO5UJH4/Y+Wb5MX/D/oGh2fKIPfMoEam/cX7DZNIOjxEQLPF3EwAF/hdp+bUP6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w21aWOq22tIxa+0MHBaiBo9pnnOkaEv6rAVNfWx+FIE=;
 b=z53Ay6ypj2xIUvUw8QAXw4mliO+Ur4MF7yxcMxfCt+CmmhdWPrNanliR5//XnhZeo+Dp3CWsw9VgQhiXP29KUzR1YJp1SXybiPlQiK+lyhpGKtw15hWGeuvkyDKwzyBBdXHMPw+f2nI4/ZzMnt43etyGdW/T3iuV8K33uRws/54=
Received: from MW4PR03CA0144.namprd03.prod.outlook.com (2603:10b6:303:8c::29)
 by SA1PR12MB9248.namprd12.prod.outlook.com (2603:10b6:806:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:28:01 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::c7) by MW4PR03CA0144.outlook.office365.com
 (2603:10b6:303:8c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:00 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:57 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 08/33] drm/amdkfd: fix kfd_suspend_all_processes
Date: Thu, 25 May 2023 13:27:20 -0400
Message-ID: <20230525172745.702700-8-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|SA1PR12MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b2b4a0-5457-4a4b-542c-08db5d4563c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zyh+vwZbzW75sfEEkOzkxG4gWfuzMq7LNB1mgXbGsUiKJ5Qorura4L8BgrsPu5Z5w7OYAShGnr2zKyGWQ8sygy3hMd/p82f2+9BaR3Ni+T0ZnbTCOGZZBBkV8n4C7GtgUK6zToINa1dipDtnjm14Bpaio133S+EQlA5f0dQYXEM61D9SxdaA8BpM95kFUVgFNhBR8v+gDTeiwjSN6xXY2z0/xJn55E36SucQvR4PHmEzk2t5mRTS+HOGLpiT8tdMSJz4Q2neMrMpinTZkAPWyoXm4aNRqWWckfzGMUjGxXJP0F6W8HR52r9QQXhM4MNjVyOTtwnxsT8NrSBaJdGpTY9WcVa7Ci90Utsdr/N5C9pjG9jbo/l2Q5OgZRkFaeFaYV0y1ZegpXxrcVtCKPZrU3PxQfivShJ8VJkraZSd6/3+KN1Xl1NtHC0iGZnNMNFs1VD0VNSQigfaaHwn16RrKCDMac0ONlnMzMCizOhoB8gOvlEm14kb4/aipjny5NaUDLIpC5ExZ+ErEo02gkZkBkKTLPLKXPCf5TKgJUYwGAe6IEbCnbnaTTb6jR3HUcdr02O+h2TRrwJsulgmCHL8zoxCVsuSmN323lvfZPWrsxLlmEG2vSuKKs6wK6nNuJq/xLi/JpjjAeZiWwWVpbz6fthLhzulKQOCfmX83rR2z3uvADpU0ElU/HmfqL/fiuuTbHl9488TTjERLb2hO9IUtMcGLMIUordxjgwejKJQKFbmVtZrHSw0xEqX/HTRn1bAs/0gknqJ3SJ0RYcJFg6rHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(6666004)(41300700001)(40460700003)(7696005)(44832011)(1076003)(8676002)(26005)(8936002)(5660300002)(36756003)(36860700001)(2616005)(82310400005)(83380400001)(2906002)(336012)(426003)(47076005)(16526019)(186003)(86362001)(356005)(81166007)(82740400003)(40480700001)(450100002)(6636002)(4326008)(70586007)(70206006)(110136005)(478600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:00.9391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b2b4a0-5457-4a4b-542c-08db5d4563c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9248
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flush delayed restore work in kfd_suspend_all_queues instead of
cancelling. Cancelling the work before it runs results in the queues
becoming permanently disabled. Flushing the work ensures that the
queue suspend/resume state stays balanced.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index af0a4b5257cc..d63a764dafb9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -2014,7 +2014,7 @@ void kfd_suspend_all_processes(void)
 	WARN(debug_evictions, "Evicting all processes");
 	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
 		cancel_delayed_work_sync(&p->eviction_work);
-		cancel_delayed_work_sync(&p->restore_work);
+		flush_delayed_work(&p->restore_work);
 
 		if (kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_TRIGGER_SUSPEND))
 			pr_err("Failed to suspend process 0x%x\n", p->pasid);
-- 
2.25.1

