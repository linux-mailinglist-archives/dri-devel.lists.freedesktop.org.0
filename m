Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFiTOmm5lGlmHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 19:54:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D714F648
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 19:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC9810E0CC;
	Tue, 17 Feb 2026 18:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XGFNSrj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013057.outbound.protection.outlook.com
 [40.93.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A039510E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 18:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvIDyQAAUtiPAzhIL9c9FFGPRg0jq/SbvKQz+51tmy8OjlWzGl2VzDrGU3FSa7DuYpJRYS/3IQPXbD3y7fpnL/ioA49tc5V+Q+YuxFQ5l7/UwIT8FA8fZCArJOUjWpfeRCAXwT0UcJFwGrCWEVDablaMpa5c67ooJHYigO2xNRQ+FUtn7z6+UXbXPxDujQ7Z4A3P7Zt6o9UqwVdSKPSnw+YCZN43MrTFyz0TW/75iwN6hc563laswGRMVEdfXscEORRtK3cscAeh5QkcUYoVuzlqMXfC5GbIT2SCh+VfMtiHbGvQds8+2MTkbOC3rhJcddxPMFKQwsttG059CDBYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XS61bmh/y9aEBOxG8IGN444kAtL7W9m9c09RNwTc0yY=;
 b=G0QTNhk9mld1hUdngeKqLekh8vpFtBPqt4vOQ0TAVS8mFMFxOxTaambHVQQyuC4JLjUs86FIAj94Q+azV42Z/k/EKXF+S5gzLzZkDF4gf7t/ig2NTeMAvkWhc2E1xLPgGzxFTRu5YobSPiWnErw9DbD0blr0z9xZeG+2FHtquec9VcWtub4K8Ii3nbCLxj60WyfeNn7tR5mN5NtDHMeJBD4mCeL6q6+YISbMn0h1fFIBVfcnT9Nt8TQODwGOCetg89hC6DMK5Hb5YQ/0leQxmjjW5HTY3vErGbn6kN4DUPhpyMT+4nCvIGmGMHvs4ajXTQftMB1rQ87Ryd2IpB76fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS61bmh/y9aEBOxG8IGN444kAtL7W9m9c09RNwTc0yY=;
 b=XGFNSrj4lfj1gP4mIfp8tHv4Ud7XBrrqULPd0fVYG/fSdzg6I6AxA+RSp2HTXpyiJ3lvUPwvsm6fuLq4G9LLU/+F4nLC+rmuEoxfJd7ewWnM+mCv0rQ0VBC0GO1KVHHWT639xmthhErhoFZ8xd9sSZ9hoxewcpnJOPZYXlJD1QU=
Received: from SJ0PR03CA0143.namprd03.prod.outlook.com (2603:10b6:a03:33c::28)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 18:54:20 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::f4) by SJ0PR03CA0143.outlook.office365.com
 (2603:10b6:a03:33c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 18:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:54:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Feb
 2026 12:54:19 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Feb
 2026 10:54:18 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Feb 2026 12:54:18 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix out-of-bounds memset in command slot
 handling
Date: Tue, 17 Feb 2026 10:54:15 -0800
Message-ID: <20260217185415.1781908-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa53049-98c6-465c-c63a-08de6e55f53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nOS2y9QEbFWmiUXk6chM6H0f8ovNrXfg2w9TX/GMa8SH1+8bmn0Jtu+TtWFO?=
 =?us-ascii?Q?yiHM3LEVylRbvYIT5HTJZ0SuT8y2bm0wZJbZbvv3Sa2zhLjXB7naI6gxmlwE?=
 =?us-ascii?Q?2BMnQIe1S+xAMHWTwZ9TyJ95Y5TpEctS/Ohk+z9hnc3lkinz449vuvDW+pze?=
 =?us-ascii?Q?ZvP/QxFkN2CSmNZKaxdg3Z2AWKaIW4zma84JpZmR8tTL4y4Nu+w77D7atAtR?=
 =?us-ascii?Q?5iDRsiDPUOa41w4OFFMBFBrSGBHdQxv1qz+nIFgmhRu1FAtyynqwtEq2AmCZ?=
 =?us-ascii?Q?vhpb8Dawc3YDTH9IcQIvf+yJBGnM++LErT952Hj0bRQUDr2tLb3nLKtAkmYx?=
 =?us-ascii?Q?i6Lz7iyTZWT4y3OK5eKULRZJij961Mdcak51cRZyPUUoVRGf8vprusPdC4O3?=
 =?us-ascii?Q?nrm9GKJrQaL3zpXV6uGRDN9i0y6el2SyxxJmaOZySqH6EhCvfwimfOwzNLd+?=
 =?us-ascii?Q?tjDVg1MwzriPqZWIlrNT17ta6Kd174pjAroxUL94kQRhNuZaQRL4EYKRB/pv?=
 =?us-ascii?Q?B/opyxmxzxSgmiUUGRi4OpkLf/CtRP3o5PygiW4BomqM4GRDytfC+yx0vmWi?=
 =?us-ascii?Q?e2ZRckICPnzORNnx1o0tZRpk3ufinCzV+qL3VI/oL69xlNDvOmsrjrqzWxYC?=
 =?us-ascii?Q?64lmAa3Y2kIkSMjgUhRMDMyXs3i7Nf+JBmspO+i9FZ8rNAW7WF7gJhLxH1Fu?=
 =?us-ascii?Q?uRs+fh1B8IUC0Pv41X+V74Vsr3kFWEmCWSbVPsCgFZ+fhJWo406xZ7N1x0Tk?=
 =?us-ascii?Q?BjRIGeZIu+zAoFD9W9x+xW31rfNhEUEqo8llrhnsdYd6gsS5BdPu7RwbsUbt?=
 =?us-ascii?Q?dqhypFqcw7a9+WZ3bGN0R/pjQKL2DsmVZ6yw6FR0HXmrPxnPYdfkqG64Qm1k?=
 =?us-ascii?Q?TuBbCvTmMZ1Xf/lZvxjKWoofmQyEGnkukdg4mYeROh5OhZNDdPwiuaQa0G7c?=
 =?us-ascii?Q?XYqKjUo0KbtCEnL+mKSooYiGtvj7BElmU5tSYlbhfdsxHjJVwUUUiTbpFvBD?=
 =?us-ascii?Q?ENlSeLPkFnur+BWTNTIEdNcDQ94t1qmYS3DM2+rzBGJiRDs7dg0e1/fzkOZE?=
 =?us-ascii?Q?3MomlrTQsseJ9rCksnxhJb9wTe3w+28mLRAn4TxJtDCmgtbwgxVuJIw3HO0Z?=
 =?us-ascii?Q?Q1g+GGLfsBw1kSvznCncKONE/3yQoQMi3Sw8MDn1+XoR0cXIDXQb6sbSNLbU?=
 =?us-ascii?Q?syVc8z6dr90EYkuUBTC9iNciypwmxX+j8pm8tZh+QKGnkcpZuK2FpXaeoghu?=
 =?us-ascii?Q?FBqTPwldxQob8myLDNDZFZl38uAn9ctQvtkbeHF75OdL9ahvdC8y6tOkVxaj?=
 =?us-ascii?Q?TkfNgb8kqEt8JrT+VXlBrmNFhwS9gDmkGvlDVGrTrSN8UXyl0TjaGYkYkc0N?=
 =?us-ascii?Q?bTDjLHf2cbsSfS9OVjuPqO3R7S3yJ4U+jyw8KWICMfdw5hJYW9jLNKRjpJlG?=
 =?us-ascii?Q?px2y3a50DTNmd/3RfKsGbjGHTU/c/NPRYvr07Kwj4QN06soocd3b/Y4K+VnL?=
 =?us-ascii?Q?4A4147ZDZDuiWnK/17vm69LieTlSzlpkshSz2TtQKsTOPOb6f/59t5aMbGyi?=
 =?us-ascii?Q?eG943sOf27ONVHbYNExquvFakCgrWfTypK/g2j7qRQ2kuP6rDdpZgvqJkNsW?=
 =?us-ascii?Q?d6m7EaU4DXLuuUIlnzcD3ZW7vH4ciR1jaul+AdONso0hFPsHevva3/OvQmrP?=
 =?us-ascii?Q?DBufBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rU5Kc1+ikR0LiFqvE1wgmZc9/OSPcwniFc+7CXFvekz1QrR9/kx2GJrq2ShEikKsOCK+TT+E/IkZR6DB4k5QALBYgxCbhB5Vmfqjge/UWwa8lfdbQk8JBvo4qrpBkP9BFCm+Ew3IPvZ7Dxb3CnqVJsYl+GRL3ratY3hqheMJUKnu+6KMvOP7mckf/WQyzWxN4am3U1LSfp0ARJ1g+OgwD9MacFj6uj39o5jrZYLI4iwHxNy5U8bFyd33fazK1+jjJ+hd6sZXVHq9fKsxIs2vjM2BLbWN/rhU77bxGV/yCtFkiCe9vDxEtvOp6o4U3KkhlNaCbDHgJxZ0Pdu2L6qZxoj+P1E2AgyTAaBg5M/ho2/cQvX/O2ydG/0fdwwPP+154L/nr0goy8W6jRCGvSpR8nmPE3mOaisX5MYzpNxj+RP3S5XjZHhEFKBSuv77OMkH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:54:19.8282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa53049-98c6-465c-c63a-08de6e55f53f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 498D714F648
X-Rspamd-Action: no action

The remaining space in a command slot may be smaller than the size of
the command header. Clearing the command header with memset() before
verifying the available slot space can result in an out-of-bounds write
and memory corruption.

Fix this by moving the memset() call after the size validation.

Fixes: 3d32eb7a5ecf ("accel/amdxdna: Fix cu_idx being cleared by memset() during command setup")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 7d7dcfeaf794..8fbbc3280468 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -694,11 +694,11 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
 	u32 cmd_len;
 	void *cmd;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	if (*size < sizeof(*npu_slot) + cmd_len)
 		return -EINVAL;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
 	if (npu_slot->cu_idx == INVALID_CU_IDX)
 		return -EINVAL;
@@ -719,7 +719,6 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	u32 cmd_len;
 	u32 arg_sz;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	arg_sz = cmd_len - sizeof(*sn);
 	if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
@@ -728,6 +727,7 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	if (*size < sizeof(*npu_slot) + arg_sz)
 		return -EINVAL;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
 	if (npu_slot->cu_idx == INVALID_CU_IDX)
 		return -EINVAL;
@@ -751,7 +751,6 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
 	u32 cmd_len;
 	u32 arg_sz;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	arg_sz = cmd_len - sizeof(*pd);
 	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
@@ -760,6 +759,7 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
 	if (*size < sizeof(*npu_slot) + arg_sz)
 		return -EINVAL;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
 	if (npu_slot->cu_idx == INVALID_CU_IDX)
 		return -EINVAL;
@@ -787,7 +787,6 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	u32 cmd_len;
 	u32 arg_sz;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	arg_sz = cmd_len - sizeof(*pd);
 	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
@@ -796,6 +795,7 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	if (*size < sizeof(*npu_slot) + arg_sz)
 		return -EINVAL;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->type = EXEC_NPU_TYPE_ELF;
 	npu_slot->inst_buf_addr = pd->inst_buf;
 	npu_slot->save_buf_addr = pd->save_buf;
-- 
2.34.1

