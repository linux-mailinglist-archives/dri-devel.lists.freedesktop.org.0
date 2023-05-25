Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D84711263
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639EF10E727;
	Thu, 25 May 2023 17:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D47A10E4B6;
 Thu, 25 May 2023 17:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhF0Iy3p30C+oZaKWc0yzL9rRngJK+IWMlF9I8HXIzL2u18upOFSH1VMpzNzGeLlSjfQNFy+wej3lS6XDkbECAepZmEMhoeguCYmR//HhTDI/dUOaMv51n8rrnwtR02nFO0FLWucmQWfYOjF/yjBEEHMQyfvDy5yIEnUkn0cPs2ML2/QMZM1xBhJC7lY074PqLIts4rd7ooTGLuf5kSVvjcsa7DtMRsnJt3KxlVf8Z9OAkq6efICAcuTsb5uuQ9Y2FuUD1gZNflazALJ+SHmPnLsQ7+QkNAmtclNwbFSbc9+fWwPzLUZrCS2RPKnwoaAjV1VFA1yWQ70EOSqtMUe2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZyS5BHWIAvu7ep0qiCx5KdxTLSbPbtD1jTeweCHfFQ=;
 b=MHSK3GtU+EoJo9GFbtBCsOkK78TJXpOYDl6YCwYgDyTd1DT0I9HOlwUYqnnFSSiVvRVNYhBJF3JPIrliO5qWcaakNkd2ZFfObANz3yHa/7ZtIdwP9U3pN4GFUlKs1ehdlYfinKG18Y1UTz2RXWVChgEMQqhlQCuagBrP8tPT6X8jdOJw8jArEs2jZbATzSwthW6SEjlGLTkvr6AwPerph+ridVNlJXz5m78AaBSQxAuGRDBhIqn2HneElnVMHwRY9M2hOD9ROQlYOTJm4XoQ1b2Gx2Qyzj2zke3l2PfjwBM6yDiQ1Ml7KiliBEXTE2JB27slfa0DQxyWGSDr6+REKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZyS5BHWIAvu7ep0qiCx5KdxTLSbPbtD1jTeweCHfFQ=;
 b=Yw5UhPvBrJxoHpjTsmH2kNqvSu0whHGA3BN2PHOD3yg/V6VrM/Yk7lzvLxFXXLaFUTLc1x+PPa1cWsrJ/n6cQm7iJEqykQ+Trf5gyfVz+Tx2KbRDVKAcQztaEFHB4pXftNdEndoqFWHmOGOwHiNWZmJursyqE61MIaQxTd9LCl8=
Received: from MW4PR03CA0146.namprd03.prod.outlook.com (2603:10b6:303:8c::31)
 by DM4PR12MB5723.namprd12.prod.outlook.com (2603:10b6:8:5e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 17:28:06 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::cc) by MW4PR03CA0146.outlook.office365.com
 (2603:10b6:303:8c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:05 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:03 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 21/33] drm/amdkfd: add debug trap enabled flag to tma
Date: Thu, 25 May 2023 13:27:33 -0400
Message-ID: <20230525172745.702700-21-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|DM4PR12MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7853f6-548a-4c21-ad33-08db5d4566b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nh6ScIPHQGpmANDcfOflUOXGfIyWyrxFA3vOKHrv3s4EOcCYXQpkqJnGqMrgre9LNx3KswLjoxwgrXsjYY7NkunbZu/tGEtj2VJP5e/ybW4sxivrOCU0PVm3da+PwYxJRAPPm6JoWXJfWO9RbZaNEQS6Zi1aUTXaLLhCvOFAnRdxVYGmDa4CneMoFr28agvIg5vzWFadXxhFbPdcQqstGvicAu2oR5vcCK4Ff1ed69UPZsf5ipxy1DdNNcgsvBXfq6duwo2fTuIqENWrr6tTytEGo4KfoDSE1U1IDODbWkQjQ9ok+TrqwsgR19sD/WFbyTmBiM3YZeNexQpoIuvRPS2qGw8YD5+ZRmMIiw/FNbZBlnxoGuLTzh5NZ/i7KsAKv5yK9KCqR2THqmXojnOCoil9KmjolV3EvvwJHAzEtsPqfMWdDG6815LEl4S9W/Vs3py5A60p7sd9rujrR8ZS8ywb7fTClqRs3N8upg4hQaEnWQRwQ/RG9okwb2erpydUrqCk7RRLztiYayfb1xiKmltGdd4U3hF/bnuPixh5UTMw0GoRHOXR8dqCyQNAgelUzQt5JeOgff6v2W9ceoiTofssGazPXHNswQf9Wud7G84nztBs4v5zUEK0tRIQwihnua9PrdAkIMS9GQyd0sF27tY49W4sDB9mipxSt810zlmNCHCpm8oCqU2x46MqEboVcDS8VvsvA4OQUducrxm/ZqNvDg6n/b0J6MOiMFKn2FWNt1NiZkgCopvV9ROTNojYWrLCF+0OIxvR5jVOYjbxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(6666004)(426003)(110136005)(478600001)(40460700003)(2616005)(47076005)(83380400001)(36860700001)(86362001)(40480700001)(336012)(82740400003)(356005)(81166007)(7696005)(1076003)(26005)(36756003)(16526019)(186003)(41300700001)(8936002)(44832011)(316002)(82310400005)(5660300002)(2906002)(8676002)(450100002)(4326008)(70586007)(70206006)(6636002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:05.8763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7853f6-548a-4c21-ad33-08db5d4566b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5723
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

From: Jay Cornwall <jay.cornwall@amd.com>

Trap handler behavior will differ when a debugger is attached.

Make the debug trap flag available in the trap handler TMA.
Update it when the debug trap ioctl is invoked.

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 11 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 15 +++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index a19c21d04438..17e8e9edccbf 100644
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
 
+		/*
+		 * Setting the debug flag in the trap handler requires that the TMA has been
+		 * allocated, which occurs during CWSR initialization.
+		 * In the event that CWSR has not been initialized at this point, setting the
+		 * flag will be called again during CWSR initialization if the target process
+		 * is still debug enabled.
+		 */
+		kfd_process_set_trap_debug_flag(&pdd->qpd, true);
+
 		if (!pdd->dev->kfd->shared_resources.enable_mes)
 			r = debug_refresh_runlist(pdd->dev->dqm);
 		else
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 4b80f74b9de0..a02fb939614a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1157,6 +1157,8 @@ int kfd_init_apertures(struct kfd_process *process);
 void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
+void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
+				     bool enabled);
 
 /* CWSR initialization */
 int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 8bfd0c91fb92..2a60c630ab5d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1309,6 +1309,8 @@ int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 
 		memcpy(qpd->cwsr_kaddr, dev->kfd->cwsr_isa, dev->kfd->cwsr_isa_size);
 
+		kfd_process_set_trap_debug_flag(qpd, p->debug_trap_enabled);
+
 		qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 		pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
 			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
@@ -1345,6 +1347,9 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 
 	memcpy(qpd->cwsr_kaddr, dev->kfd->cwsr_isa, dev->kfd->cwsr_isa_size);
 
+	kfd_process_set_trap_debug_flag(&pdd->qpd,
+					pdd->process->debug_trap_enabled);
+
 	qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 	pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
 		 qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
@@ -1431,6 +1436,16 @@ bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
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

