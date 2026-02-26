Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFi2DYW9oGkDmQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:39:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D071AFEBE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7957210E9DB;
	Thu, 26 Feb 2026 21:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U/xkYu4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F62210E9DB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=galN+h7YyvKcfR4GFrxKM2vtHLCikggLJ3j7HNxdoqFqHVFB24BY0Qtiw8Rkg58E5GiuKcbCC3OQEYifxhUusfag/0rIJL0CCt6Dm4JwbdUJ6wMjBEg0LKj2wwECtoMhJFfK/YYEjI6bZf8jWMNap/VpWFcRVqCnkmS2+pvduPj9YQ/MmiPQJKjqcgIpjezY/9OcCm2TX6d8GGO8oDNRL+yjtOhZm1aWMR4qdguFZfhtQyiyaw3uglGvl8uqj5RhTTJw8ho16fdrTy5zhAfCTpvVBwShjb5vjDXQa/9UprrSv/ULWUzh54Ci24HaRxQVFu7RyO3RiaBa8Pv1WJbj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEvsGKRKTIxq6N/kw5zsSkVMEsVF6u1ADG8tjS1uRkU=;
 b=NYlaHLh07UPHC2VPuaq7MppXJWtAz5Ma91edagf34tol3xuOm5Hb9N/CEMZohm7NyN4eeJ3nkns1WHt6yJtWBw6wkwbxN9ntP9hZgRH/WfGuqgJNMPxuFt+YjjDr3D+Du4gnSV2Gk1K5A2sii5nQSsGgn6JNvKgyj6c4R2daxdfen5/Hv5JR+TFBBII//GmVXexfuQar0gGqr/WwCNbi5RLfy34mLUqbogBtdxXUiBu/cB58JlKwlcqFAJCURoOKTVfDlrWmxMG0tPwx5HRl9AYD1047DpCHGbQq4R8c9G7qfaE54nIy+3jkVZ7CX+eCk2qpZXJD/K0hXd+pqhtcGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEvsGKRKTIxq6N/kw5zsSkVMEsVF6u1ADG8tjS1uRkU=;
 b=U/xkYu4HLoBtITrFWXMaYYikEyqT848XoZaQBRPs6y2PYYLDKWFN2LW2pScfZhOhN3EVatWANEn3jbwCLyuxzMPaIfRmo1mmZlpvXL8MpwUikXAQMfu6uZ/wcnrjcRzWF8A1X/6zeuT1Fp79f1VmwYKHMp3PhJ/UuasG4PSuEVc=
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by IA0PR12MB7752.namprd12.prod.outlook.com (2603:10b6:208:442::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 21:39:05 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::ef) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 21:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 26 Feb 2026 21:39:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 26 Feb
 2026 15:39:00 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Feb
 2026 15:39:00 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Feb 2026 15:38:59 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
Date: Thu, 26 Feb 2026 13:38:57 -0800
Message-ID: <20260226213857.3068474-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|IA0PR12MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: e2dddf99-ae34-49ca-37d3-08de757f75d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: f3S0c7nqmsoscUKScOJlm8W3UYLU+0xqcS5REL0es/KpBxkR+s9t27dZykmmikVJPMQp3yt7sl/JuGVq2g4biSrAhu5d5VNuMAGSTw92DDwhJ+iaaRBq0x8hUuZfR1T4KPuWbDfPUCmCnOnPBOHjOJv7bjMzmNZHr0prpwGHlbe6r3H3V+mea8KPtaojv4wOJIe71l3ejSzxx4PBZFZV1Ee4ihcZL6/5jZPajgAmh0FaND3EbY1BNwPtl7oNtUZllHkbQZc5bZLy8sot+SfMMS1Z+hai01A8Q9nTxe1A1DrYv0bTIYYy8htgsIPEDZdqmAdCM0UMmN3bS2dEtj+MFk+03afB28a1q2k72iDcuh/BvsMtb5avPM86npa0KIVFkKnhQNAaGNpYAD+jUIE8+TjmdbqUS9mMToWkcowyt3uDmcuFxjjfdHiTRe3n60d0s90tBpL6xpDkQVxVrbJtvzeA9jidmwogWkjkd/ZRPJyAbxhwQ1b66jfX6j7lXBnDYNm+n78YHnOlBji+UTx79aMGo6uFR/VlIYP0mN/Vyr/dJhgP3pfaHxIbJMvacdq94BSEIE7YQs2vqpeT2LR1hPx0TYMJ/7ckmFN04nK7VaW4R5CuilNN0fK7G7POSFhq+cXhxbsBJunbRA4SRO5YXRRGuAYSSFdm+UjZd9gyqZBXx6pv4LiNBaLv+FMoT0wmCePzC74UztLdJ8rXUV3nhFBXgRjnMBAPFvbsz9ymiyLj0fOqnmsuZVJWEtxjo8OY3TG77+/RvedjmGSn6JGMHZD2mJgeD7jQ4UM5JYC6GJ8B59CKPzmHjCCyFRZJgqsZjVEnpxM6L0GHsOeM5sB3NQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VuU86zABaf5FPvNBiv0MGWVqfkmfJ2iPKpwju8hKEA9LY4SxqA7ay4RmYyiAvdE1W7mBFKMVevFoN9IrLKm2eVUP8rfLCUn5VE5ZP8mSVwQ2UpnkSGsn4cQt8iHOGU1jt1xji57ubtBhCtZeSVodjOBw43kGiFmU6FdzGuFdFmAqxrun1/xectNvpfW857h8jP0epUhrm0UzzyKA5jRQEQxnBPfRttOw/jdVJMsinyYJ+I7umfyxvLzH/1sEstoZmT1b+P/EBkmjh1OIIlEC0qDkgvQwRwqk603AWEASLInywEtASgwT+AYlrKR5dX3nevan1k46DkKQukKuC44xwa53ukozRkzNYF9aT/xbXpo/RhGpLKllN7Y7xESLpBDDY1aNJCApnWS6xDEEECCIZmj4dTWXU76zmiozopLPVP9UBxdwJ+jGulNbI60LO3qk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:39:03.0265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dddf99-ae34-49ca-37d3-08de757f75d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7752
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 98D071AFEBE
X-Rspamd-Action: no action

mgmt_chann may be set to NULL if the firmware returns an unexpected
error in aie2_send_mgmt_msg_wait(). This can later lead to a NULL
pointer dereference in aie2_hw_stop().

Fix this by introducing a dedicated helper to destroy mgmt_chann
and by adding proper NULL checks before accessing it.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 21 ++++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.c     |  7 ++-----
 drivers/accel/amdxdna/aie2_pci.h     |  1 +
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 277a27bce850..22e1a85a7ae0 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -40,11 +40,8 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 		return -ENODEV;
 
 	ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
-	if (ret == -ETIME) {
-		xdna_mailbox_stop_channel(ndev->mgmt_chann);
-		xdna_mailbox_destroy_channel(ndev->mgmt_chann);
-		ndev->mgmt_chann = NULL;
-	}
+	if (ret == -ETIME)
+		aie2_destroy_mgmt_chann(ndev);
 
 	if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
 		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
@@ -914,6 +911,20 @@ void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
 		ndev->exec_msg_ops = &legacy_exec_message_ops;
 }
 
+void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+
+	if (!ndev->mgmt_chann)
+		return;
+
+	xdna_mailbox_stop_channel(ndev->mgmt_chann);
+	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+	ndev->mgmt_chann = NULL;
+}
+
 static inline struct amdxdna_gem_obj *
 aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
 {
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 85079b6fc5d9..977ce21eaf9f 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -330,9 +330,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
 
 	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
 	aie2_mgmt_fw_fini(ndev);
-	xdna_mailbox_stop_channel(ndev->mgmt_chann);
-	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
-	ndev->mgmt_chann = NULL;
+	aie2_destroy_mgmt_chann(ndev);
 	drmm_kfree(&xdna->ddev, ndev->mbox);
 	ndev->mbox = NULL;
 	aie2_psp_stop(ndev->psp_hdl);
@@ -441,8 +439,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	return 0;
 
 destroy_mgmt_chann:
-	xdna_mailbox_stop_channel(ndev->mgmt_chann);
-	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+	aie2_destroy_mgmt_chann(ndev);
 stop_psp:
 	aie2_psp_stop(ndev->psp_hdl);
 fini_smu:
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index b20a3661078c..e72311c77996 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -303,6 +303,7 @@ int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev,
 
 /* aie2_message.c */
 void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
+void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev);
 int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
 int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
 int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value);
-- 
2.34.1

