Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3E67BB5D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442AF10E838;
	Wed, 25 Jan 2023 19:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186A810E81D;
 Wed, 25 Jan 2023 19:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epxHQauobFKRsDjCI17mn/ABU7Xed47rYPWcxZQ1NP+ncvPD3bBpTQORJH7SrI4sUY9Op2LTYbDFJcydsInrZTTPVzzPBmqWOJ3IFMr+GKeUKNjma9gmasRmZeWaZsStmKri+Icj7FPRbBMxtHNq5kumIyw6GFqgX7Cx+xFgkrEBaYmaOVkXndxwYYBbMZMgjCVQn/ZS1oS9Nn2/YdUJznxYnMHS8o4q/fibtYXrW0e2X6wq9VJhNuJJXGJ/ZlHop4QJR2aBPMZPQs/7b9yoLXG07wvq9e+vD81FxVQMkTDOigPQltARsxno0CSMkcb0j/b9SLjrqTiVO08AY760Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJAX78CExYaNN0N31NbyMQ7WvldpwHKKvFGvA0QWdqc=;
 b=TnyK3HkTFzq7u3wgzmsbw7fNtmMc4kmEvmh5n1/VYvXymauyguJo/qymMrIRIaSVT8xKEo4awUSkcqhg2SXIm0uYDC3Qq8OWOhXlFYa520GvsJtO7WiEIfRoDPErM5VRCBgLV+deqbjMyyEk+mrP//b89mgy8lflv7kNfjS3xkKrCcC1P0nOuuBkdzkQ2Ovu6Yjm1gwckS/KiFqYhHu0XiRL+BB5rj4QjU53QzZPI+5+/2naeaBw2dyAEJD6r5zh1msCh8f8WHdmJoMdI5tGYUpmlH2gkqwN4arbOctqC6U88YnzVvpWFJIDtt8zuQbXhLYRQMDdD6DwMX27C8Wc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJAX78CExYaNN0N31NbyMQ7WvldpwHKKvFGvA0QWdqc=;
 b=RsBGemBfj/eeXjjg1VmULWuEjFlWM/YUDBLFFesFp5IGNOxDcxM53Kbt98qkhHr7cGcblU1OJwUQSKt+7aG6jTflcZ1rd97nVWiAADqLGAL3Ob0whE/41j+lhDk3PQki6Vwz3c3A5eyn7e8wQGzNPAbUh7Huk6su/OrOnGti4C0=
Received: from BN9PR03CA0715.namprd03.prod.outlook.com (2603:10b6:408:ef::30)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Wed, 25 Jan
 2023 19:54:24 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::e8) by BN9PR03CA0715.outlook.office365.com
 (2603:10b6:408:ef::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:24 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:22 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/32] drm/amdkfd: add debug trap enabled flag to tma
Date: Wed, 25 Jan 2023 14:53:49 -0500
Message-ID: <20230125195401.4183544-21-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: babd4e0e-330b-487b-970e-08daff0df556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1N2YV9qvpiLH19bks4U4S7V9OKpdevdd+KnrJb1iEPnzRMyEdjr1g+KNDpiyG5lLWLWcu+muJfllHzinRCINRzq4ayGmjZ9UB9Mxq8IzYEJd+pqLytx9f6nej4OGfOiuYpMrH3p5PUCEH9d1yQmWNul7AT8fCaQo0Oc1VsGW+3Sf2xQHs3pxuCoKanjvClWPpjMUsKUQZpAgJVdJB+6ZMaDtC8SUyk4jkuq+rQK5bwXYjzlOVajZOa1PElgc82t6Q8v4D+rLIZ8RTV6V3ADtBpGIStv4Ggob52CiuOAOAnhX79vLrt2Dak2tYMMiQjA8zJILhw/TjYIE6V2P4ADF/NxdCqcK0v6tPBgsGbu9tzqT1CCL+cRcwllUL22ijJdHoNoAIFTS89YQInOjED9UwbydRJ/xVsP6ruyjIvvAOnbzTkif6P8Ijc4wBB/vr4rQQ5VG6wooEZXySCbKYqC5qpCBVd/DMlxBUyjCCKOZ142FXbkO2oQDTEN8U9sur2xcK6l+alZMbrTB0Zm2PaBwl/YwYms1yWRqsGzZWVQ8ZYpYCjINfSJfh0CMkvyQ5582Rtyy2woONr1CfA1L8t+jm0gxWmYGy5RmsqrlnxTxSjEqsq8IqaXzNugmiG3eS+yTWEd8fRvZOgz92mBqnb1ibPcvCC5K+FT0flZHHdkaH+LM9kBu7NBHZS67cbICDPOZCD75JSj5aFTy9qe6OvZQ/nmzM7/at5ei86grTRsNRI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(1076003)(110136005)(8676002)(36756003)(6666004)(316002)(54906003)(16526019)(70586007)(47076005)(70206006)(5660300002)(86362001)(41300700001)(82310400005)(36860700001)(4326008)(478600001)(8936002)(44832011)(7696005)(40460700003)(2616005)(450100002)(83380400001)(82740400003)(356005)(81166007)(186003)(426003)(2906002)(26005)(40480700001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:24.1784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: babd4e0e-330b-487b-970e-08daff0df556
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
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
index 47f8425a0db3..16acf3d416eb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -257,6 +257,8 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 		if (unwind && count == unwind_count)
 			break;
 
+		kfd_process_set_trap_debug_flag(&pdd->qpd, false);
+
 		/* GFX off is already disabled by debug activate if not RLC restore supported. */
 		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
 			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
@@ -355,6 +357,15 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
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
index 63c59ad2a4ca..d7f00181ae6b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1104,6 +1104,8 @@ int kfd_init_apertures(struct kfd_process *process);
 void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
+void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
+				     bool enabled);
 
 /* CWSR initialization */
 int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 8519604f7249..5da1edd36bd2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1250,6 +1250,8 @@ int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 
 		memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
 
+		kfd_process_set_trap_debug_flag(qpd, p->debug_trap_enabled);
+
 		qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 		pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
 			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
@@ -1286,6 +1288,9 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 
 	memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
 
+	kfd_process_set_trap_debug_flag(&pdd->qpd,
+					pdd->process->debug_trap_enabled);
+
 	qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 	pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
 		 qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
@@ -1372,6 +1377,16 @@ bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
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

