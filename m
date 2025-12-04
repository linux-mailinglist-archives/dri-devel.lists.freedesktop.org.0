Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98DCA4E68
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 19:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECAF10E997;
	Thu,  4 Dec 2025 18:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eYRgQZYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010059.outbound.protection.outlook.com
 [52.101.193.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D986210E997
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 18:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4LN/QVBHz3zRagmK7fCteJWPVE/qvq1gzt9R8gFZ55lVGdr9j92fgegkXXKxWWd1BslctD5ET8DNf1s4ahgraaqoXJI7EQNYKbh59mO9ZiJ77eiiRrKDWEJ9hUmDtywF7wLNc7jdHdU08GSrwwJ44yOReM6j9VeBiyACxJivvDrVqBAWUa53dvhke2W58rj/OT2i018MqdLqY0oV/JNsCj97LvBGt7PmgS7Miv5ZxD5pIMo3opExaY0zG5jLgMCCD1f8Fgw/LmxMAZC9zD2FLebDDsn3YvEmuf/mEdIOh73cJvozohVYQPG9MuDM7PgENWG/XOhBQ5YZVa06aljLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1Xi7Ud7daFfWeznw8aA+O9Pv3vN/9Mhay6oUcrtLjc=;
 b=uCTxQexzadsmlAXR11ka60VNK3Kam0lHsZjZqqOKg8XLbPb5eRrCSCMcxAGJ2isg1f7gKOroCIQ5pB0FWbRTDJ6osW2RcN+b1KRoCFTRo06g+8xmtd2HAlCEXttlAcb4AjdKBWsMSqx9br2rOe2qagfzenpq/SsHABMYSjqIGozPuNyrPFVxzUT0hOBnyu/ucXHAKuYWxYMI/iDOZmKv7rhGPBcL8c6MkKGe7gXNfk5II3gHqUrgZex69e9ZYpklZcn3t6AilUFAE8Q5zYx5l2WmyzuC9Wqx5wy1tCYOj7xUJkr/dTckshpEwlPSUhBSOvhAxURu9DdZtBkF+9Pjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Xi7Ud7daFfWeznw8aA+O9Pv3vN/9Mhay6oUcrtLjc=;
 b=eYRgQZYzctZbxUj7CU33PxgG7Fblql+O89T4gyC+nE8wccGTHuDM6edrqNmOy6/ZHC6KTXc1DPW+bmeHzf2bt1WTOo6h8okIlSmX47eLekj7/lAa0a+av+5C98gwXpV9iCCimPU8cflOONp3H55FzhH1E5JKTe0QmOWSM42ZE+Y=
Received: from SJ2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:a03:505::11)
 by CH3PR12MB8901.namprd12.prod.outlook.com (2603:10b6:610:180::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:16:05 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::cf) by SJ2PR07CA0001.outlook.office365.com
 (2603:10b6:a03:505::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 18:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 18:16:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 12:16:04 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 10:16:04 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 10:16:03 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix tail-pointer polling in
 mailbox_get_msg()
Date: Thu, 4 Dec 2025 10:16:03 -0800
Message-ID: <20251204181603.793824-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CH3PR12MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: d9dbf1e5-74f0-4d85-bbae-08de3361307e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qNLnvHMuvqeebzpPKj+FWwbY/sBxD93nIZKNLs5auDCiaA9om1dXLQ8v+Cpy?=
 =?us-ascii?Q?4x+fLLTwDBWA3RhqNqFJHndsDRR94YBmGu+RNGXMxUiT6vpsMz7aX+w37d4o?=
 =?us-ascii?Q?NPYnHT3BHFj9hEJ838LHvbD+QnGrj7mFgTdfT+6LigMFeTJKC8rROfm4ZyEx?=
 =?us-ascii?Q?FlIdGnvnmhrU41uQC1fB/f6qH9DlHSDB/q69y/0KV72gk3927nAR0fXLL6XR?=
 =?us-ascii?Q?dtLJgS3bmy6/l8smCMJIe3bPMrD597gbojoniw2ylqwXRqrFfOazIA8kkG7x?=
 =?us-ascii?Q?sNF31DXuJNt6JI/D8QQMAK0SxNkDtH5LTiubgaaJLoPFvkBJ2x84PswNqYGy?=
 =?us-ascii?Q?oynx2eDfXt3keCIt/Qmi2pA5MjIv/++QSugmZlmDacGB0+AsS7IOYlh10Aj4?=
 =?us-ascii?Q?E0IJa5IE7AEFM4cWdK7kewHpFg97SMQrfGA0gWlsWavPCa+9/kWqDA03Yfy4?=
 =?us-ascii?Q?E729FEr4VjLLoopaGVq3DcxfqepRQ1GkLD47OYo8zi7VFStBju0KSdRn41gY?=
 =?us-ascii?Q?WxlmVpGFFwdv27IZoXm8Z9u0imEau+Bbo1KqjxtVC5qMHI4kQeOthdDrbNWX?=
 =?us-ascii?Q?xUYhyGQLxHI1BxyD/P42AkFlwWFjM31OgNR44eTzDZQaXjq1vANNZ+c01Dy/?=
 =?us-ascii?Q?y9mZKtUxQmdYLKgzxzOhNiEoRqpl706KULzHFI6I3gdjGP8Pvrk7D4Cb1K0e?=
 =?us-ascii?Q?SZE+EzPfosoMFSgffIhw6dL/3/idnOBsAOmRuo72MbK20yC36ZCfrzM293Gf?=
 =?us-ascii?Q?kQ/MZEAB3NXJyxS+g628FQ2Yh4cKFfzpe46TeiAcx7AeLMd8edmxp2Wg+lgi?=
 =?us-ascii?Q?XW27SbIpqMkOAVuXXVzy9YAb0EntCA+kygo//3nn0MgZKnj3ctpHUbA8T8ue?=
 =?us-ascii?Q?Oy7zYz/aSQFEgLOrGsCytiA6cOnDw1urBhEvNy0iwqQJG/A8iMn8Osr/XiSw?=
 =?us-ascii?Q?u8RpQ8segZo1jOVaODJCY5kDdV9V0NP4FhLXimMdLvlL5GUjFvAX0UllQxqp?=
 =?us-ascii?Q?vJiB8KJ2q012tVz1YhbL5MfXYonDCDlMnXiBmkFKa8qKjRSXotnYtimhJcvX?=
 =?us-ascii?Q?uaUMeyIniyh1Hh+yVf7+GrFKGNUdnKZCXECuavUaJdIq4qHuV5Y/AFnpJh0N?=
 =?us-ascii?Q?iQxjtCDaKNCY+DfrpygOnwK0qp8uYwpOlzdPOnqK/yorH0fkhO32dzyC/xmg?=
 =?us-ascii?Q?CAQD4YPHcycfFkXMI9KhmZeO9Wb9PHdFWXBmqMSWzjBtIdv8az1JFmxcaCzc?=
 =?us-ascii?Q?vSVxydmVQ6iuYqknmqr87E9QuWFnxtyGGSMJU+s4QEJ6yfEOds0UppKucRzA?=
 =?us-ascii?Q?YuuB8mMGI5QiUjen/htVXUrjgQl/NNTr5ZJE2ZcvZO7NpafKvFd2VFYTHWGw?=
 =?us-ascii?Q?OgH5ZyTWWulPlUYpa143ooaI76VG3IowVYmHnbVW9xINp/WXNSC5u6betGFu?=
 =?us-ascii?Q?0/eC8ML+jJpsn4pqSq/EgTWYMB0zWQf0nIignNTPHCQBmA3XXvlHL/RrPZfn?=
 =?us-ascii?Q?R9a7Ory9WD7aadLF4QLG7NsWfz04RKohHGYSJZ+UKEToZ2zlsWx2+7v0Hw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:16:05.0773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dbf1e5-74f0-4d85-bbae-08de3361307e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8901
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

In mailbox_get_msg(), mailbox_reg_read_non_zero() is called to poll for a
non-zero tail pointer. This assumed that a zero value indicates an error.
However, certain corner cases legitimately produce a zero tail pointer.
To handle these cases, remove mailbox_reg_read_non_zero(). The zero tail
pointer will be treated as a valid rewind event.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 858df97cd3fb..a60a85ce564c 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -112,22 +112,6 @@ static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
 	return readl(ringbuf_addr);
 }
 
-static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 *val)
-{
-	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
-	void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
-	int ret, value;
-
-	/* Poll till value is not zero */
-	ret = readx_poll_timeout(readl, ringbuf_addr, value,
-				 value, 1 /* us */, 100);
-	if (ret < 0)
-		return ret;
-
-	*val = value;
-	return 0;
-}
-
 static inline void
 mailbox_set_headptr(struct mailbox_channel *mb_chann, u32 headptr_val)
 {
@@ -286,8 +270,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
 	u32 start_addr;
 	int ret;
 
-	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
-		return -EINVAL;
+	tail = mailbox_get_tailptr(mb_chann, CHAN_RES_I2X);
 	head = mb_chann->i2x_head;
 	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
 	start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
-- 
2.34.1

