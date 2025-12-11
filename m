Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA6CB4B10
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 05:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845DA10E1EF;
	Thu, 11 Dec 2025 04:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TJc20buM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012010.outbound.protection.outlook.com
 [40.107.200.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C43810E1EF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uunv5+qiFBZXr5NS+Fky29ofr6DENgdVP5xVPBu8Q2RUYyn/pBDm5XklarIiX4lgXZ/gLDz+Vb1mpmAlJtMU8mOuWD/0QFvvmeB4a9b3C3loEy0RcXLI6h4YZ0UcdqoAVD1ylo2DuLzqL19Bz0C79dcqnyUqEO9VexRsvlZHvAqeEh7+COMs2Y6nEo/SxtnKs5bm7WgoKSCKJYtHx1kcKjnwqIQ55pH0Bgl8IMg77Pppf3M9qOOIchx/qXIw+KcprTSGWbu/bYEXtZF/AVk0/LhhM0UK3qy3PMJ3lC9uboTm+VH0yBeDAI2AFI2eslfuO2ddEdVePfJFtBSI/XNl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxn8WniToz39K5wwpSHEsIGPGsaj/k50KHKTHP1WVhI=;
 b=cYVcZsQhEYffe5fgOYJTK615AVZCS++JTF4yxDkWI8C8+iJeFw/M9QdRUQEupJBbyTrVTUssAjqEQ41Ek/Kzarp+TXMpH/5n4utNw/C4VGTsYTBSbQjlJg9RiWUzds2kmjoD7lwYoun4ReaSW1oGNb/4gY2TbyWE9DCfMtbAzTitecAlL67e8smWzuPg8p9v2kBp4r8QQtocsfhTjDSYn1DMZ8t+d3GMCP5gQ9BT9Adw0SlFYUZJJ5yGD0FKaPseNccyf3aBVt/QqN5zPv2NfxUS21PX/6M7zA+AM8lVvHPwW/meSYkTz8fAaFQDIe1anUHhKOuB0O5CIMJtoGMMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxn8WniToz39K5wwpSHEsIGPGsaj/k50KHKTHP1WVhI=;
 b=TJc20buMPhiO+wqBbILBMqSObYDJeSQD6aXNgCFxIcm6UpdsOwFntPLu9BeSDO1ahYk/l8ZQ0jN0jKpVGA2VpjOIJsqhzNw90T/2CF77AqMVFhvvK70unv2FK3Xg6Sz7rbiVpeJefhLj5ldqcN16Kjb7hrZHRec/BidFz0wloKE=
Received: from SJ0PR13CA0239.namprd13.prod.outlook.com (2603:10b6:a03:2c1::34)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 04:51:28 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::56) by SJ0PR13CA0239.outlook.office365.com
 (2603:10b6:a03:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 04:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Thu, 11 Dec 2025 04:51:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 22:51:27 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 22:51:27 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 20:51:27 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix race where send ring appears full due
 to delayed head update
Date: Wed, 10 Dec 2025 20:51:25 -0800
Message-ID: <20251211045125.1724604-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdd80fa-fb63-4036-f88c-08de3870f271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RxruwzARLXgmvuOdZMOn6TRNLROQVs+v0CQ0ICMlptTf0BtsTYOe4QDxToNc?=
 =?us-ascii?Q?nqW9it9APo36bGlf6XIQ3HkyfNTMkIawjv7sNcajZ6dwlKnSg29wYHLzRk7o?=
 =?us-ascii?Q?HO1HpD+IFzHrDiMzyBWJWB26FVpP1jJhHsHtn7pVRFXSQTrOj90oaqkbML85?=
 =?us-ascii?Q?81K7Vc6f0WVpB5bwC3fLx9ORbTAuwSBcRVfJ64UOfTro/frfq8h8SunCKhC0?=
 =?us-ascii?Q?bBtRa+emR7Jz4M8d3U6hUCE0idOdnfSXf2EfOHAY/KAEw0vyDjnJQYdmm0Oi?=
 =?us-ascii?Q?i6A9Cgy0UYUy/EJseAWNbj9UcDso9iLtCweDkntM3vhenVIhrvHowonjir/q?=
 =?us-ascii?Q?H0/DTX5AXbgh0GHKWWQmdeY8xBASSBkPT5lAcF6csWCe1l7yKUHbPdRFXXJM?=
 =?us-ascii?Q?krSO32n37AFxVvQqXI9aJs+S50PjVUvZxdUDVLjqM/zVDtJKqF6pUfEWoUPP?=
 =?us-ascii?Q?FSc+TSzuiEUS8jyFxtdqSdR0Ve3rehXMdYfLVrs5NBAOXnunJUpWqBpSFxjk?=
 =?us-ascii?Q?QtDlzoaBR4eT672Fd20Lgvb0P9dGje1YBvE/C6w5G4r6AHB8vrxavHgA+rP/?=
 =?us-ascii?Q?uFpH38FMV1zEipWzbNoKbKs8Eiq0Hh2nfNpjkdxEujfAYw4ZQ6q9ySc7tdFf?=
 =?us-ascii?Q?dxrOCfFu/vGxinBZ8bkmJnYwPVqfWoEgEGLCkZh9b20qSBVT3su6JKfIKe9Y?=
 =?us-ascii?Q?I4rC9XKg/9oD/iHZv24C2W33f4jxVbk8NAipfHUZLCz0CRScRxSaEF0qETCn?=
 =?us-ascii?Q?/bimAiZDjV/wTmVTTDgOPTpA66er4gUXwlEr+eTczDAJLT1XAUoP5Wg82VG3?=
 =?us-ascii?Q?Qa8kIz9s4hvHsorcq3MtAq4EY8JzfVJRdW3IGeH73TZx9nrCmV5io1alRTW0?=
 =?us-ascii?Q?oIg5odatdhJH63Lr7Sxtru91IcernDGxWtVgv8J9EFUN+vlS+lQIKRFNFQRB?=
 =?us-ascii?Q?kvRED5fHGP5Pqkj8npOpoUX4Xymh+nsK8mGQIbwGb2NovRdoxRTVqZWaLR6p?=
 =?us-ascii?Q?iMFwVDfC+yHI2LC0rONPcuXMEzc1ls9SrXZem23I2o3ShfkLMg2oG5TnhcpE?=
 =?us-ascii?Q?rHlLa0aRZhAiO0Xjd+HEz74WmgXDIZ98Xy0C9teGOe8A5tTyyEhjxsT8d5Pk?=
 =?us-ascii?Q?wdj53uwrqK3nHhcmTNqca4cn1NLIpQrLj6+07yi8xK2hLX84+NVOBHa4xLxk?=
 =?us-ascii?Q?nvJX+A27/QlmsepNzosu//aiIGPvYwvBmLN/G/8oHtmJjX1aUm5tggzLsRcl?=
 =?us-ascii?Q?7lbjVg0N4/1YSA1dJ3GNeODcFRpkPweuMfayPvLPE89djxKA3jtXoc2VfDbd?=
 =?us-ascii?Q?fbd5MJhCEvwCoggr5MUKZ7OgHuOy7oL0qhvVoCHe81dAj/5HRZOHA+r0fZNj?=
 =?us-ascii?Q?1q1UwmYDG90g3mH1dTBo0ehD+Gp8v5IO171sYVsEN/Ry5tRaKjqzuY+vsmOE?=
 =?us-ascii?Q?jediQHBPCVIkxqE6iKgUcVjSUnSXzo78D/Z36KNyxE65YtrFI6Q9kamCXOe8?=
 =?us-ascii?Q?C9RCwK4v4xKql9w8U+QG5ajxa+S2JRxIqdv6frpJxz58/m/u5LA20SH38hdW?=
 =?us-ascii?Q?viwWrtbz13nltIO1wxg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 04:51:28.6908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdd80fa-fb63-4036-f88c-08de3870f271
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

The firmware sends a response and interrupts the driver before advancing
the mailbox send ring head pointer. As a result, the driver may observe
the response and attempt to send a new request before the firmware has
updated the head pointer. In this window, the send ring still appears
full, causing the driver to incorrectly fail the send operation.

This race can be triggered more easily in a multithreaded environment,
leading to unexpected and spurious "send ring full" failures.

To address this, poll the send ring head pointer for up to 100us before
returning a full-ring condition. This allows the firmware time to update
the head pointer.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 27 +++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index a60a85ce564c..469242ed8224 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -191,26 +191,34 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 	u32 head, tail;
 	u32 start_addr;
 	u32 tmp_tail;
+	int ret;
 
 	head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
 	tail = mb_chann->x2i_tail;
-	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I);
+	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I) - sizeof(u32);
 	start_addr = mb_chann->res[CHAN_RES_X2I].rb_start_addr;
 	tmp_tail = tail + mb_msg->pkg_size;
 
-	if (tail < head && tmp_tail >= head)
-		goto no_space;
-
-	if (tail >= head && (tmp_tail > ringbuf_size - sizeof(u32) &&
-			     mb_msg->pkg_size >= head))
-		goto no_space;
 
-	if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
+check_again:
+	if (tail >= head && tmp_tail > ringbuf_size) {
 		write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
 		writel(TOMBSTONE, write_addr);
 
 		/* tombstone is set. Write from the start of the ringbuf */
 		tail = 0;
+		tmp_tail = tail + mb_msg->pkg_size;
+	}
+
+	if (tail < head && tmp_tail >= head) {
+		ret = read_poll_timeout(mailbox_get_headptr, head,
+					tmp_tail < head || tail >= head,
+					1, 100, false, mb_chann, CHAN_RES_X2I);
+		if (ret)
+			return ret;
+
+		if (tail >= head)
+			goto check_again;
 	}
 
 	write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
@@ -222,9 +230,6 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 			    mb_msg->pkg.header.id);
 
 	return 0;
-
-no_space:
-	return -ENOSPC;
 }
 
 static int
-- 
2.34.1

