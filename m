Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLaJFwKNqGmLvgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 20:50:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E11207321
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 20:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139D710E1A5;
	Wed,  4 Mar 2026 19:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WHLWLP9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE8610E1B5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 19:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irhpXSuwsL868y17poqpkbi4TNlhyPhB+4uDV7+ks3KTxUrmFcNV3L/idFNySD+AEOLcEQw/NZ1tLy3NU+wp1dFKXZz1snYrT2U21KX3ZWZgxx0W6Z64zH9sYhN9xpPQa5SfEIaxJCYnAIp/Jd+3NrmMjo2Jskw3bZVGhC1HQDXf5I0dD38jRR9y4N7OqmxKlhFQcC3WHWHscxVMwhmQhsqkPTGJw4ZGOw3+6CkNkN9Jaj/NslzsXko2WQxbKoxjDfylTxL9BD42tuSjM0nS6xylVxM7r/AUs+DdZxBjnyIm84DTKM/cIWnjfskwSs4dTh9BpLC0NUjIwslL7oe5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4ji+xj4ziPS0SgQnhFCf8xuwbTEjGjzKLKd91lGmCw=;
 b=YRKyMWO1eotHLzlMortUndOE9jDbLoj47IbabvUnET9eBAJBje8T8A7lmSLWx+Bs7gitxAucCCwk6uF9aKis4j/8UG8t2Weq+IkF8dfEkBtiYlMiPM84LB2p8My0DzxH/FgGF2jFpK2t0zUCp3DN90mN4OughO6F5OnpRs4E1lpO0kC/ZFGQb891Il/z3NELdfx9YBYQhAC0Klm6wMbSZ9qgSSgjz3UpBuvmY7dxRTGiAckS27NWXTGisztUvvIOtFITDYfpxbHzjFXR9lg/ppW0AremTnPTLirNsAM3TUpxfAESVu2+xV3xIU+AIxvefLEH54opr8XazPfAo/R9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4ji+xj4ziPS0SgQnhFCf8xuwbTEjGjzKLKd91lGmCw=;
 b=WHLWLP9o3t/3w1jNJGsQp+edaUXU3Grj5NZG2fN9KdNurD5XQSSQnKF7KHNjpYLdwXFke5zCgTqibCAMQcaA4JiZE8eVU7Rz5E1qWjAJczkAteatZigdNWHKV5EaOsjHbxKJixZHoRiKMXwMW/PF+q+7EiAqRgYTNFiARDQnvms=
Received: from BY3PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:217::9)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 19:50:16 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::83) by BY3PR04CA0004.outlook.office365.com
 (2603:10b6:a03:217::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 19:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 19:50:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 13:50:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 13:50:14 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 13:50:14 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix major version check on NPU1 platform
Date: Wed, 4 Mar 2026 11:50:12 -0800
Message-ID: <20260304195012.3616908-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eec42a-3174-4c24-d924-08de7a27419c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: nt36WU+5cuO8SqySYp6aHwA8QufiWSlgc2i+puiZizuMtzRZFiGmxMXeeGgRW6i6IlGJ/lRFbmst2/2Oq/xwmgYCd5TKaPqaB2NwZJsYuQPGjODXSPDQ+PJJKk8FNTbr//UMAPjIUFR42g6ybWuGBKTXMFGyAS6CutI34APS4Ny+omioNniIBELvOoCOuTG+ne3LfRB52lAvlZpfwJ25FFgKi/ulc1/IQsSgoGrHZbvzzWmRLVuH+8wL2be/heidNvZxwl58RtcKWypkmsz5XOq9/A4+9jpM5CulsvMtbqy7panW1DD3a4X34Bw9uacBpH1JwHw+1ph6a+0GJ+vGntZnycB9Bw3BQJoCD6PZ0er9Kf4HQ/ctXQiC/Z/5TsDTe+HAMwatBqQlPqPzSO/f1Dbc31CJ20VtAuxcccIImgE2hZ48GcLhtWaELXamRtJMig2iCn8E+HvpLEp3H0KfAh3AlhRRCMArk9OFonA2jy31965ceh7E4PnrLEvrtoRu36xP8RnthiMTJulkFAFweT4/wBwKTonxQfsw8OpJknilORDlXeviskWIHe2W/im8GCwzQFDjAl1FWCeFsnLPGStzba3P7PK25QooUOrg46d0wQ/4pdfAmq0NWafsWLJ0RXYCzo4UEYsiuc8NXYtYE+hC7yNmPoKTl/b58nYk7tsPXFnJN378ujxUYDVxknGvMQdfiMeivNRGWyRxRJlSA5SFA5XDlpivpUki8ydvnBwjXLegCKstnKp+iZ8woJOZ8stzQ5ghH7DLY1s7hgQThA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tXL+gW0pUR4X+E9MQljIVERMUXW0EQ8mtP68E5vmRYjlBlGVI9ydoAgeAO2th7KSaXoIr70lM7o9Empc/j7ioghd6ShG3xB1VgrToqL/GNZOurhtAWYdjdzO8BzwdVBMC6Ix9pFyA+I+RAeZih4M3maVkI4MY9wOXHnS7SzOLu5O78H1hKjevujMdxqaJ0RLq6NtWeTtTRa7aBL4ycEGqXjs2X7COQqlFOurX2epznM18YWHidQFamfoD2qs7n1W58iVDiUTt8FwlSrOf8zAo6PijIdnHSXLLNPefoWPVpD1TJJOTQAHFCknljR70UdcQRz121YoXQZ6R57BKhX9iMfFZ5vzw9TXHZidG6yZkIh+0d+yfUumHpZJvI+uEnsbOXFeqLNtcYPbpZvcHw++rJZ8jjsraM6Ue2d2/dBwhvCJK+TNNJZy1L1lwvzi3fED
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:50:15.5232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eec42a-3174-4c24-d924-08de7a27419c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778
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
X-Rspamd-Queue-Id: B7E11207321
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Add the missing major number in npu1_fw_feature_table.

Without the major version specified, the firmware feature check fails,
preventing new firmware commands from being enabled on the NPU1
platform.

With the correct major version populated, the driver properly detects
firmware support and enables the new command.

Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check for latest firmware")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/npu1_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 6e3d3ca69c04..1320e924e548 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -67,7 +67,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
 
 static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
 	{ .major = 5, .min_minor = 7 },
-	{ .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
+	{ .features = BIT_U64(AIE2_NPU_COMMAND), .major = 5, .min_minor = 8 },
 	{ 0 }
 };
 
-- 
2.34.1

