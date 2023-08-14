Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860F77B2A0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06F10E13E;
	Mon, 14 Aug 2023 07:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F110E13D;
 Mon, 14 Aug 2023 07:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmqrXxPZMjapiYT5y0RT78F9a+vDUcp2Z2QXKCRKFD1rbu+AbpcWn2JcraIXLU2m++8MI24ynAgxpbIvk57ZriRc7AYh1TBCf2igjNozlDfqPezhd8jRREMwKAtJWo1vs4fbqGs2OvMIUyEGYd/6tWHEYorhUlF/bY+xTR/nsV1AwDxm8tUINRvu2eR5ETZMRN+d+AVU9HMsYe2wKml3FCToq2oKu8j3YHoHXfWJJxRbLyl6ibg3V9EgXWkweMuihQgZpL+ZcNuP52b+w7YD3jc/vFJEB8+knIuu+TWoVZM0H4TU7BdrPEqj4JdOelAbq38gTzqbHmBTl82FCqszUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssPZDeV4HZQy47PEfCjEFtGh6x1WaVTJhUl3ZPJp8q8=;
 b=PTrdmyZbKoHlLzupchDgecn8YjiNtGipBuX7ONXsakabucqEaH4E9Zo0WNO1sJvpGBMQrtrJvy5AA9LRoFA2tJzN/zymw9eCLjc4fZa08ypkuYcdwczJNjY8g81bEoiK7dm8+rHX2nkh3JUUA1QRpaslEdwuKABa4g6k67ZW2wK8fTYnfwk4S/Hr5TqSIDc/OBQoh00oDR9Dof8WNeF6pFLsR45PTM153Us1pHskNItN85f0PaXnGVZCeVUK5u2AajChZW7X3Yrq7FcDQt3cj+vX9hbXXj6DMXAhHgqJ9hZKi8QVWzvuqXAl1OsAObwlvUZ/WlfkmhC+mrH0oc8RCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssPZDeV4HZQy47PEfCjEFtGh6x1WaVTJhUl3ZPJp8q8=;
 b=amJ3ArbbuDfU/Rk8Xa1/CNvP/2CarRWHmAKYppMM9VBXxBtGGID+20RL1GWJbn8VMOeIBE3rAcf2Y/fZBIW3EWShhZa7+sI0WxuzXktivMxmog+7jokf1yzBES7j+sAMswV2FY9TB1ESs3BrRez9138/aAAxD+AUxAcS8fNPTDg=
Received: from CY5PR10CA0027.namprd10.prod.outlook.com (2603:10b6:930:1c::26)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:36:09 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:1c:cafe::91) by CY5PR10CA0027.outlook.office365.com
 (2603:10b6:930:1c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:36:09 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 02:35:32 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm/amdgpu: Switch on/off GPU workload profile
Date: Mon, 14 Aug 2023 13:04:37 +0530
Message-ID: <20230814073438.10682-3-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814073438.10682-1-Arvind.Yadav@amd.com>
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 53770b98-16a1-41c0-f1f0-08db9c992080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0AVLfVrE1zU+jlgftu48t13Fktr20ejCpI14EhguS7EjJmaQmCy8hCrk1ZN3nxHf6iz+pYWuHqhfinWUvI60ayDFKAQFu21HOLDVFbfO161bODsvW8LJq90K7f0r66xBHjqs+E7lZvlKL8BdSZ9hCRjsvmtLjQUrFAaDdfBSVJ98OULA8EAY3BN2dyJVgQML/cfXVuHts6vyIoiVjxfpQGkE5f9F+sznqEkfnGqzs0hTsZ0P7iZnPm1ypwFAdPtVURQK0TXEGtOxm8I2Vmc4Un2i0MtR1sdzwxvYotshG2eTa/0TJSiKpWCbjtO/OZOVOdZetrPjcyA1pI6z+aR/4Scz/R0+POv8lVOgbWky64xqlbOlhpEB6BdcM+U/Nkb8QtpsD0M7yRDr9iRBuAy3aAlpmp+Wh7ksIbF6d+8V9sL2rOS7jPb+m/RE5iHMhUKCer1dY2IYipunONHmK3XyxsqEpJusHjKkJP1leob5IOh/JhyY/pbFEWU5FvtGZb6I49hOAJ1iHYG+UA9P/cf8a//LnhlM5RyE7API4rd7V/cMZ/t3GvvNUgrCIAcZgQtaJiTPw7G8OzIFxjTQgdojnYpBnkZvpecmURPux71LYp8XFyv+MAy7+p7nDoDBzU09HloUFEf+tSltOa6yAUkY84sdZpYJxKnfD3hLuFrS1MOqewvX7zOX8LHv7KY35gsGnST0p2u+3T/09mvY5Muz+HbNebosZ+h07XQLROrrItlLNCK4Nt4ar5+gHTiFDANJ5GkujliBaqJP+TvKZPWLDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(1800799006)(186006)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(7696005)(36756003)(356005)(81166007)(82740400003)(47076005)(36860700001)(86362001)(26005)(1076003)(2906002)(54906003)(110136005)(40480700001)(426003)(2616005)(16526019)(336012)(478600001)(8676002)(41300700001)(8936002)(70206006)(5660300002)(40460700003)(70586007)(316002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:36:09.1214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53770b98-16a1-41c0-f1f0-08db9c992080
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is to switch the GPU workload profile based
on the submitted job. The workload profile is reset to
default when the job is done.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..8457d2468fd8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -176,6 +176,9 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
 static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 {
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
+
+	amdgpu_put_workload_profile(ring->adev, ring->funcs->type);
 
 	drm_sched_job_cleanup(s_job);
 
@@ -295,6 +298,8 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 			DRM_ERROR("Error scheduling IBs (%d)\n", r);
 	}
 
+	amdgpu_set_workload_profile(ring->adev, ring->funcs->type);
+
 	job->job_run_counter++;
 	amdgpu_job_free_resources(job);
 
-- 
2.34.1

