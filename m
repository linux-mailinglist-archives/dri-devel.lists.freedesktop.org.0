Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABC6CAD7C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDB210E6D2;
	Mon, 27 Mar 2023 18:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70F510E6C8;
 Mon, 27 Mar 2023 18:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jw5oTcenWv7qQ6rHnujqQl3D60272BqoBwgvlBMF3Kk0ubZXFQeuTYkFw/f0+RO10YTjEJUFLaGFJNpk1N0Nl2J7vZbO6+nOlbPtp05M3oM6wohCp89evzvC3VCMjkJhrhgx3LFZ8GYRKjwJAZQH9Yqk/z1ZJDTiyh1c4Ezs1bNOQKhMBMeLRBFX0fKGg6/NouVLMcR+Ryr/bCibj/81+es83WqgYUkzJjYeKf0ibG7L+78Kdu7fjRNuj9cX/PkbGqLcHUUM6Bn40Fb0FEhYs8k1dvlmVenWfHsex+gG+gd2Hsa7gp/izjCJMkdKcTAyO8jpJ8tC2FtS5Dm1GBV9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqM74mH0OYz5f+cxKDnbMccinjcT27DG5dqxZyQ56Yo=;
 b=cEKpmFj+1GLo/RGHTJ7IshbDK/kCGFJvxqcZWllJPH75FR583IVgOy6orxEPnq7w7ltvt7aEglKE6kEx7wVaTQ8N21Sn1xO+PsSgdKWTRrMitpGCAGyP1aPzcNO1iGpvaZ6TO8u/XU49XFnxBri6s/I7DKj3nxoqN/x/C8AQESaFSNiMAdh6D2PZEKkiK1UXz1HolIMLQuGLd0571AAcm0P4KBZpD1jPZYlGdiJIXZqTepMDawuuvmciqk+WcrJXYUPFkkRdX8O+5GzdJ4KEuLBuSJaHIib/N7rppU3xnVOZmeJOQedZk2KImauEDMOw8pZcHJ8PH6TgUOIZj1DCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqM74mH0OYz5f+cxKDnbMccinjcT27DG5dqxZyQ56Yo=;
 b=leXfZBbqL/a25IhfPJeCuuMqzDnFnKoRHRvQ5Gh2mVwwDWKMCdeEx2AtArC+nC8pIJ8s7epuuYpK/fjqLu3hSZPipGfzkMN2sTANGp+9nFCa/0XHDLnJsyuxYH9voJF57jZc5fLs60lGiOlWfL6PkkHVu66C6tO0Ch4YvQTOiSs=
Received: from CY8PR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:4d::11)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:57 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::71) by CY8PR02CA0006.outlook.office365.com
 (2603:10b6:930:4d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:57 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:55 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/34] drm/amdkfd: add debug trap enabled flag to tma
Date: Mon, 27 Mar 2023 14:43:26 -0400
Message-ID: <20230327184339.125016-21-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 999884ea-637e-4b17-b792-08db2ef33917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8YK/qSHggoNf58Nd5EJeW/Dy9N6xt9rXDwDlUTvZdHscHNwKvECKFa0L3o+8puTfbQ68DkSHVnSoyZGzNeYFpQvsVbTPkRwkO2ioEMd4fOVQwFqkkZwlee0+yJ3CCb0sikRXtws0TjcoagENbL888OBz3CyGo2JHfLbnCxP38UxhgQcja9QnZ7XV1pk4fwIcUAj/0RbgjX/1bwoNIjnmxTmmxcp6/5yZa9i/VPvV+V7l9MS7MJBgDtr57icmKEGnEYKFqh1+4HW6AjnKon6sn0it9nIDEOtYpkpHoVc5rGoTPyOI5BuyZVy7+SVmcoXStWeQiEDety29+cdS6V0VlYj2AYWQW31I/tBeaS90ha2XODUHH3yoqz1S6hr7iM4dEP2o5K+Td9/bL7NuNnE1AnuXdWff+2RcAr2BWT4XrZb5u5UmmGNNpGR4SwrGBl/qGoj0MLgI2eL8VgpscY7wrWX/INpfVAMxN10kYadZdXDrtl34/Ud93kVxhgbNFeDkyX06AxutPQRN3HoDINMh8evPNMmJ3E8xZ3/0Z9jqMNMDP1py6bSVX8DRQbqucoAscYE5ubSzBQ5W/gRvsJOlyJRU50JXjayORp1uiC4aoL52QdlGOHveKC+RTaeSp+FJbTbnTDk6gShRcaqdg7tm4Ao1UC3KWYVpMYo4CLHdOfnrPGgDCJ+7wBleDhCz4JPFQcTckcvE/Yb/kbQNmmtVCTFZrwJ3g2OrgumSbC2rwE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(426003)(1076003)(40480700001)(41300700001)(186003)(6666004)(7696005)(83380400001)(336012)(2616005)(47076005)(478600001)(54906003)(110136005)(316002)(36860700001)(40460700003)(4326008)(70206006)(450100002)(44832011)(2906002)(70586007)(8676002)(81166007)(82740400003)(356005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:57.1749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 999884ea-637e-4b17-b792-08db2ef33917
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jay Cornwall <jay.cornwall@amd.com>

Trap handler behavior will differ when a debugger is attached.

Make the debug trap flag available in the trap handler TMA.
Update it when the debug trap ioctl is invoked.

v4: fix up comments to clarify flagging implementation.

v3: Rebase for upstream

v2:
Add missing debug flag setup on APUs

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 11 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 15 +++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index f498987dc21d..c779acb9a623 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -256,6 +256,8 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 		if (unwind && i == unwind_count)
 			break;
 
+		kfd_process_set_trap_debug_flag(&pdd->qpd, false);
+
 		/* GFX off is already disabled by debug activate if not RLC restore supported. */
 		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
 			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
@@ -351,6 +353,15 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
 		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
 			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
 
+		/**
+		 * Setting the debug flag in the trap handler requires that the TMA has been
+		 * allocated, which occurs during CWSR initialization.
+		 * In the event that CWSR has not been initialized at this point, setting the
+		 * flag will be called again during CWSR initialization if the target process
+		 * is still debug enabled.
+		 */
+		kfd_process_set_trap_debug_flag(&pdd->qpd, true);
+
 		if (!pdd->dev->shared_resources.enable_mes)
 			r = debug_refresh_runlist(pdd->dev->dqm);
 		else
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d092c81c9dc2..42a4502287f2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1105,6 +1105,8 @@ int kfd_init_apertures(struct kfd_process *process);
 void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
+void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
+				     bool enabled);
 
 /* CWSR initialization */
 int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index c6a4d01bb1b5..d26aa339fa6b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1303,6 +1303,8 @@ int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 
 		memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
 
+		kfd_process_set_trap_debug_flag(qpd, p->debug_trap_enabled);
+
 		qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 		pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
 			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
@@ -1339,6 +1341,9 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 
 	memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
 
+	kfd_process_set_trap_debug_flag(&pdd->qpd,
+					pdd->process->debug_trap_enabled);
+
 	qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 	pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
 		 qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
@@ -1425,6 +1430,16 @@ bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
 	return true;
 }
 
+void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
+				     bool enabled)
+{
+	if (qpd->cwsr_kaddr) {
+		uint64_t *tma =
+			(uint64_t *)(qpd->cwsr_kaddr + KFD_CWSR_TMA_OFFSET);
+		tma[2] = enabled;
+	}
+}
+
 /*
  * On return the kfd_process is fully operational and will be freed when the
  * mm is released
-- 
2.25.1

