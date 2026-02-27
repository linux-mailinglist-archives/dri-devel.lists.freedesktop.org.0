Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id clikBvzpoGnynwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 01:49:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0061B14CA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 01:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEBE10EA13;
	Fri, 27 Feb 2026 00:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hykA39sp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011038.outbound.protection.outlook.com
 [40.93.194.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425FB10EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 00:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDYMGyFS/KM2k4KjBFi7CfrJCN8MJotPrnzMgbKizJbgFOfVIlRwcFZ7MUomyJ4INCcs0s4jJfBhAIr6Myyd/bGiAphWQew/PaFqm/V/qLNNx+7WrVt0/08PFtxFBNF6yylFvO14pcyAGiethGOOxkJAx9joDdtgODah0h3D/XFmj/PIuWPCS0PIZklozdwOSqAETfYxInHj2XPl2EJGhHcvt4ZuXQWAa1OVCoX7eXADIEpBRLfnZCx/xmbeasql1JBgTmTbOXFXDSpMuV4r/g2i7ECuUaxO8LQU1V4S+4Diwhhue0uxqjb8c4cv9/ZezFksVy6tF8+pgtdgkUJe4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy7l7BtXMeAgWMl0l46sw/5K8mmfTBRpqyqehHzf2kg=;
 b=LNMiKOt8DNytClMcQ+BXsP41MzRfH6N4qhaa2zNzaEy6nUP1T2fJGQjbUy8VhNarzfs+zkBfen8qtxgrtgU9cBsiT7aEB+99wbxWNRFZUsD8q4lQaFE9a9A0xa089CZAyUGdZsdOKPOfwA4DwXSBO9aRXRztUoGNUhqEgcxNi/N3zplsIX+g2CuzErF9zgqotwYC8ejUgHUtmCyLdrtkQ2ls2eiZajRA7Q6n1lpDo890GYEh1FM/5kLnibAgNaCtl4TiaYmRBH2vTvfEjA3bVuty51+p9Pg+ry817LBy5BEweI8+f0DLj/9SAywgzKKMhChfKg8Peb7Xp31JnKkH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy7l7BtXMeAgWMl0l46sw/5K8mmfTBRpqyqehHzf2kg=;
 b=hykA39spj8LqLAkIFrue5aYSFJI/9vD/9X8TbANAjS24ftoSUHhutViOGfZ/J6EA5uQIbh82K1Kot/kiA6wYXG4KZBa43xRgg+Y65Ot0RWvjeN9aidq8CpPvnRAEcUk0LEGHsBax7izytpMCjy/fZl5a+VKDHcY4Xo6QCpr4eBA=
Received: from BYAPR07CA0057.namprd07.prod.outlook.com (2603:10b6:a03:60::34)
 by MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 00:48:47 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::3c) by BYAPR07CA0057.outlook.office365.com
 (2603:10b6:a03:60::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Fri,
 27 Feb 2026 00:48:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 27 Feb 2026 00:48:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 18:48:45 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Feb 2026 18:48:45 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2 9/9] accel/amdxdna: Fill invalid payload for failed command
Date: Thu, 26 Feb 2026 16:48:41 -0800
Message-ID: <20260227004841.3080241-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 5709d286-6ef7-40f0-f8cb-08de7599f6ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: heuyBV6CBtDotr7xLHyuEn+LpDXU8/G7cnJ9H+dAWP5GqAqWOAzUbOB6ejJbF6mBA4JtXUHbM4YEZcIkBMnpVoSriaxidYxvIqU+BI1Wu+Het/8iWisZKTRjv1ZTgLFc/DTQotNnz6/LDZEacmk1VGDEiqBu+r2jtSV8S5m7JX5yVtOdFcFyFCQvdFitNrbnH5qPWvr47LufutA5u6Goo1YlIquHYvFhKJyZNrudWFxu99XFI/s4wTJr50ePXhoraap8/txyPVcbtfollTefRafMeXPk/XhZCysmeQm9VSV276uNjB3ix2HTSdugc0VHNoRu4QWGD2xEu9axg7BoA+8WtRn0vAIGxK/W6aD5VDBaihqAIp5r8iXBJsqWJSi4FJIEwKlPaEq5HpCwuRoPLGgMdLKbvyGo6ncZymRllVdYTC3A2Vv07eBOs8wQN+9f4OCANBG2GiA1B/MdrG2U6mb5+vmSd6RFEAHIiVsU5zqYsjKNbv6p0ycDVfJcmyhmhCdNV3f1hDL2pl+JKO04k/r7fPcGnIGsW05AowxEDPrfmgsT2NnriP538z9Ljyt3eRi4yeHP7cDNzY7Wp/hkgd1yBtkaPRo/xBBOrmUa/Sg32s36AMPrcZor/0kXzjuL6Z0U6au+dsdtN0KlhIJjh1W4ESIv0QA8b2hr0Djdga1p+n/t73G71LwIBC3yEaAL1Tp9AV4NsFHkTf3Zkp0KP2T3CeeYGVpS+w1oHyjXaXOOz7LItwf3ruUa7y+X/aWGB73sORINnp0F/qWhxtV+HHnlOve4KSgx4LNr4l5aLA+RxxZKkznqExKxPdAPRfxHqFM9+OxNOA4mNTxZP26zZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r3kzehL18LHH68U6biHRcARQCUQGC68h+IB+oZQ0jgUBRbmf5AxhVW1OjS5fNAlI7kGnumwgJ3y37e9/ISNDdsX9bRPEOp5mrk2Ad4SN5HY7t5tktW9/LAwWQaCrJxUwCkWGbXgmzNks5PL2XxTDtWhrJPTWSac3ZCoRD35uBVmkacFG+X/uKVfHygGPs2tRRn3GyaVPdVZaagVyqJeGsQQgzyNc3IEkdjKu8TPDBqo1oCd8uYMArGKpnCFuaU2Eile6Xn0/DuWkTLESS4V0Z8SHe5k8p5XvNGmf6VGXl+7C11hdVxQeAAyCbKhAm/N23+v1/e25TpXeh2F/5FwQoamIOGybIHr3QKUBqAPXNYZi+3hzbK9O9sUAznnrte/VZ0R83+opGott6njveZr+95yhdvpZiutRlYsJS1nVUUJ4/V9IP6YUflb3kmF+PKCW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:48:46.4835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5709d286-6ef7-40f0-f8cb-08de7599f6ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B0061B14CA
X-Rspamd-Action: no action

Newer userspace applications may read the payload of a failed command
to obtain detailed error information. However, the driver and old firmware
versions may not support returning advanced error information.
In this case, initialize the command payload with an invalid value so
userspace can detect that no detailed error information is available.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 23 ++++++++---------------
 drivers/accel/amdxdna/amdxdna_ctx.c | 27 +++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h |  3 +++
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 622ddbf7fb6f..eb4c9d919885 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -186,13 +186,13 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 	cmd_abo = job->cmd_bo;
 
 	if (unlikely(job->job_timeout)) {
-		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
+		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_TIMEOUT);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
-		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -202,7 +202,7 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 	if (status == AIE2_STATUS_SUCCESS)
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
 	else
-		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
+		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ERROR);
 
 out:
 	aie2_sched_notify(job);
@@ -244,13 +244,13 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 	cmd_abo = job->cmd_bo;
 
 	if (unlikely(job->job_timeout)) {
-		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
+		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_TIMEOUT);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
-		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -270,19 +270,12 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 		 fail_cmd_idx, fail_cmd_status);
 
 	if (fail_cmd_status == AIE2_STATUS_SUCCESS) {
-		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
+		amdxdna_cmd_set_error(cmd_abo, job, fail_cmd_idx, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
-		goto out;
+	} else {
+		amdxdna_cmd_set_error(cmd_abo, job, fail_cmd_idx, ERT_CMD_STATE_ERROR);
 	}
-	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
 
-	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
-		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);
-
-		cc->error_index = fail_cmd_idx;
-		if (cc->error_index >= cc->command_count)
-			cc->error_index = 0;
-	}
 out:
 	aie2_sched_notify(job);
 	return ret;
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index db3aa26fb55f..405d2c62789d 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -132,6 +132,33 @@ u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
 	return INVALID_CU_IDX;
 }
 
+int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
+			  struct amdxdna_sched_job *job, u32 cmd_idx,
+			  enum ert_cmd_state error_state)
+{
+	struct amdxdna_client *client = job->hwctx->client;
+	struct amdxdna_cmd *cmd = abo->mem.kva;
+	struct amdxdna_cmd_chain *cc = NULL;
+
+	cmd->header &= ~AMDXDNA_CMD_STATE;
+	cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, error_state);
+
+	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN) {
+		cc = amdxdna_cmd_get_payload(abo, NULL);
+		cc->error_index = (cmd_idx < cc->command_count) ? cmd_idx : 0;
+		abo = amdxdna_gem_get_obj(client, cc->data[0], AMDXDNA_BO_CMD);
+		if (!abo)
+			return -EINVAL;
+		cmd = abo->mem.kva;
+	}
+
+	memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
+	if (cc)
+		amdxdna_gem_put_obj(abo);
+
+	return 0;
+}
+
 /*
  * This should be called in close() and remove(). DO NOT call in other syscalls.
  * This guarantee that when hwctx and resources will be released, if user
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 16c85f08f03c..fbdf9d000871 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -167,6 +167,9 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
 
 void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size);
 u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
+int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
+			  struct amdxdna_sched_job *job, u32 cmd_idx,
+			  enum ert_cmd_state error_state);
 
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
-- 
2.34.1

