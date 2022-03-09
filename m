Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762D4D3560
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 18:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC3110E47C;
	Wed,  9 Mar 2022 17:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EA210E442;
 Wed,  9 Mar 2022 17:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgP4WDhYvZl0CsiEMB5yC4tT84HJ54DmvOKS0n4G7tM12wUsF7Imadk7OYu7BX/bYbDc355G6+2+Agfa+lZPwMVSsceyrxoeT+Bwc4x6prVTypbIIYXD+CP2qzyslidSpUJNTACcArEtppxNpX/yV8oXI8YHgy7sXawA8KsxEjkZ991LhJHb8Iukq1XQ1cviobqryMEmMGBxyey0NjdWGjsATdxb8Wwlgd6tZJ+Bqp6d9Q6AFUAoxpGZpZl1racJkllAIoIiU08jru8II3yFHohSuDvrMEig3ELCExQWPpJnLLhNl5cX4x5caeRDU8sBWv4Qt/rzns+HMpL24F50YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p/P779eNcer+g12N09+owMHCs7CQPFS2exyJkoqxNc=;
 b=gT8RxGxEEPbsgVJjj3SPCDGvECL/Y1GWZOKIUVj42D0IKdmpYCI+C95y5RxLv8oWVEqvYmS/d81s+muDHwiiTMQTEyB80d7YuduirdrEWvFbOATWhcR7LHRd2qacrF9+w/gIqawJVw7leuduY/mhGMC9Op/ZBiGkRs4pIAOnShj4F+UDfDwPxq3h9IuawjmgqgmJ1bG/fjKvXu/pAQqFJtndT7qr1mkHy+JInHJM8aKr/CLTLH+dgZRdT1nn6bowWb5jnr7N8RePaleYTcFSTmZRyli2RypFv7kfHqxq7JhoQErEVxGYkW6A5SASArtplWBCq6DmvjwWlzHt2LDcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p/P779eNcer+g12N09+owMHCs7CQPFS2exyJkoqxNc=;
 b=JgUCQl2Nj3x81aKBZSKJ5eGM4cknOX9k6c4JUxqy9rbz5FZyAPbjr03sHtObct/jxobTDIIMPoY7IzxiFtsKF/6V4kyR4QK/qHigyeDGp6KkFBWoFy37BvjLu4ghR6b2AdkUgCJK4EUa7EdZILauvIH9zeszcikBYSzQtfTUzDs=
Received: from MW4PR03CA0350.namprd03.prod.outlook.com (2603:10b6:303:dc::25)
 by DM6PR12MB3081.namprd12.prod.outlook.com (2603:10b6:5:38::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Wed, 9 Mar
 2022 17:41:49 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::7f) by MW4PR03CA0350.outlook.office365.com
 (2603:10b6:303:dc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 9 Mar 2022 17:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 17:41:48 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 11:41:46 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Set handle to invalid for non GTT/VRAM BOs
Date: Wed, 9 Mar 2022 12:41:33 -0500
Message-ID: <20220309174133.14454-1-david.yatsin@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451ee1ca-1676-4fc9-787e-08da01f4167f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3081:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3081F0E5CE9D8F0C03AFC8C4950A9@DM6PR12MB3081.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OW9FZ9MzmP+WlKWHGjvZdCLakBgSm9Q0Mx8rDzDT/CcuBf9W0aaY8cnsSZS070m6xNXeU/kpJzoInCqTOWlNuOwrq4+yB8GyRPXigswl8yp4gM/b/tYTS2gUygVOk3ifRkgk7j7mCB/IvGB7/6RwPlLxB8kwW0ItNt0Bghw0Q2j5weV1jziUaohSv7M2be4B0GiJ8+wTl/7oiUjx+nLGjvKZyyPXFSJx9YkeTj1XF48nxiFnLxSeGe3ghqGeWDLDNO1wy8cBEQQix9MMI0wLVCPkVJQrOskhVIeIW/nSS4cmcy6Rd9s+o+YXCasDtL9RUQfRgjEOzn1kyOSrEZECJx0roKhQqokbcsM5DtCbWGZwlZiFB3HqeGqPB4T09lXPeYilyW5wg4qD1Un6fB+bJH0SlB2u6nwGMZD7smxUwc/30nEm+dOJue6hxNpfNMKD6/2TdKTFAU6Qv1v/YI5vTTM+S6mllO4RoFHkjOfOrvZcOvqN7Lvdaujdn4Uy1uY4GfB20mceiRgM7YSh9hDG2v5dLiUPUiAT+2bbS2uwC0S4dyCRO/DI+YkkpNjOLlEaDygSp0h2N3+oTl6YaYJCwnFhn1CEscFSBucNFLkB7ITygZjoktHWb6akmEbwB2OUkkK1IszZsY9MI216s8N9xocZlQzXCZQZfGwa9e8k4ovTOVQC80KHQGFnfrzfJS/q5qcZqX9LUtZOuBB34BtNwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(36860700001)(450100002)(110136005)(81166007)(8936002)(508600001)(1076003)(8676002)(70206006)(70586007)(82310400004)(4326008)(356005)(5660300002)(83380400001)(2906002)(47076005)(7696005)(40460700003)(16526019)(336012)(426003)(6666004)(186003)(2616005)(316002)(26005)(36756003)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:41:48.5572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 451ee1ca-1676-4fc9-787e-08da01f4167f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3081
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
Cc: Felix.Kuehling@amd.com, David Yat Sin <david.yatsin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set dmabuf handle to invalid for BOs that cannot be accessed using SDMA
during checkpoint/restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
 include/uapi/linux/kfd_ioctl.h           | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e1e2362841f8..1ffa976ad318 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1767,7 +1767,9 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 						&bo_bucket->dmabuf_fd);
 				if (ret)
 					goto exit;
-			}
+			} else
+				bo_bucket->dmabuf_fd = KFD_INVALID_FD;
+
 			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
 				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
 					KFD_MMAP_GPU_ID(pdd->dev->id);
@@ -2219,7 +2221,9 @@ static int criu_restore_bo(struct kfd_process *p,
 					    &bo_bucket->dmabuf_fd);
 		if (ret)
 			return ret;
-	}
+	} else
+		bo_bucket->dmabuf_fd = KFD_INVALID_FD;
+
 	return 0;
 }
 
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index eb9ff85f8556..42975e940758 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -196,6 +196,8 @@ struct kfd_ioctl_dbg_wave_control_args {
 	__u32 buf_size_in_bytes;	/*including gpu_id and buf_size */
 };
 
+#define KFD_INVALID_FD     0xffffffff
+
 /* Matching HSA_EVENTTYPE */
 #define KFD_IOC_EVENT_SIGNAL			0
 #define KFD_IOC_EVENT_NODECHANGE		1
-- 
2.35.1

