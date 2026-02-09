Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCH4I4V6iWlm9wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200C10BF1C
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130A710E0D1;
	Mon,  9 Feb 2026 06:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cOGtOhJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2510E0BB;
 Mon,  9 Feb 2026 06:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNbVvGADjqgL0mufX/e8998UZ+S8199yTtf6WbNlkY8EzEE85NdLYnUSYGRuJPYBHZX1UN4L3wp0+HJTsQSaKDyXN1bECvbLqz/k4EuSj5yLVtBiERWyyXvYppPSUoiiVj+YOxDTClh/23ixyfuYB0WOxCPJzgvJ9tJyfTjZ/m9KjzC8rfF5UT1OlNw5WZBPgYr7doqpAS9NTomjOvNEHBb8aX40Iuos3NXlrPTnQjZMpmKmKFWauOu4Kfq+TSILHunT73iUgBRz+jwE9g892dpFs+AwhknQUZPRTJ/ejgOygzvY56pYtotndQjxTorKAsK1BFFv59PGyNeCluCRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMbvLyaAvNXsFoSV0KbS9N3tGeqxMjOmorgMDw9FoPY=;
 b=C+ehacZe7zN5WinWTA0wvTr03Uuv+CDVCM/0Xds3geXg0lFxALbXC59GcJxx3R2eQEY0I7wMeCjQDVfB/FRRH8RhzpKQjdTVnkVyvuy1xRwqABwupLd+FaYi4TUeDWL6MuXtDHI3bOQndfJA9xZsXcQJa8GY9tmlZ/YmEI0A7l4nClmlaeW8GXKeIIwcaVlZFBaee5NmsrHVNxJWGytBpW0UK47VSUNnnmOI+S3I+2A3HBaPurv1fR10peH58tDpoKl+ZGqU/pAs6o01wmgY3wyjjYPZGlYPANpylj2iwAPf0CnJAPjd6A145avQutR2jj2hvPDXfhHlPeDFCIICeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMbvLyaAvNXsFoSV0KbS9N3tGeqxMjOmorgMDw9FoPY=;
 b=cOGtOhJs1h3LTfrB7CHZbxDk3hfalIFPl7nUfcBuUN7uvTr1JJE1/6E6f4LfU5MBJNUj1DZ5FI9D4G8W6ami+C93H5h3ElVFE+YLKYPTOQUlYcDSocg0kFPGkm1jbi71qFHyOm0w23HdTbaBApKITCm3Ozt72DeW7nehtpM0OqA=
Received: from PH8PR02CA0050.namprd02.prod.outlook.com (2603:10b6:510:2da::19)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 9 Feb
 2026 06:11:06 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::7d) by PH8PR02CA0050.outlook.office365.com
 (2603:10b6:510:2da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 06:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 06:11:06 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 00:11:02 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Philip.Yang@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v4 1/8] drm/amdkfd: Add userptr batch allocation UAPI
 structures
Date: Mon, 9 Feb 2026 14:10:40 +0800
Message-ID: <20260209061047.3881808-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209061047.3881808-1-honglei1.huang@amd.com>
References: <20260209061047.3881808-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd66dde-d3c2-48b3-e25c-08de67a202e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e3yRY+/GarfzaibHXTf0+KPddfVu3sGpJ4EVj5TkQTAXxi6jXTTikNNhRgK6?=
 =?us-ascii?Q?ERvzAEa7PRWPDcNDTJqbztVT5fXG9dN83/+WPFa4MgncnPGxD6HIMPL9U0Qw?=
 =?us-ascii?Q?Mvk10s+PZlctRCH3QVtWVukTHYg956BfP93d0QBtbWwAYS8vA0/IHDfzU2xC?=
 =?us-ascii?Q?l1CQFypEaXwvBYhwT3qArDQjdOOKq1RYIk3PO/LW932jbBC1AdI95OZZ1aWS?=
 =?us-ascii?Q?5E2dFkWdPCjCEip8ZRB7PNYTdVlDwjw/4niKz6GjjCPyipt2St8sEaqBnsNx?=
 =?us-ascii?Q?JmztUZ3U8a3qw9xPieg+wQZ+UaOu8QnF/Yz+7Nlj1+1JfDRfGgTv8WFx/+gK?=
 =?us-ascii?Q?q+uhtPfCZdsWTiMFp0YeQmv2Q2OhivyTBRMMbdujhY9bmr+ncNfOZW7tHLyl?=
 =?us-ascii?Q?Ay0wmSXtSQbGMp/PAhCRAssiqotQEU4NgRrqqwOuTsc8r4CLhAd/Rn96rEda?=
 =?us-ascii?Q?a5AuBeKQe3JEjAimNRmd9PWHB3BieoQC2tLg4WcZPhFnTNhyo2a5etnNLSSz?=
 =?us-ascii?Q?7TY/teYYPp1IIgLBiF0QE8eRLXGlq7MiJD0v71/opTbZDtn0jPh/tNilxENk?=
 =?us-ascii?Q?XgxJ70se2o5u8obveFJCyaLLOJ3NUWxCeDtN+omMk2Zyz//+dEh9VVX6Ww7+?=
 =?us-ascii?Q?ii3dSKbnFkjUNsrqxPEZxzG3JwRrnunhbycyX+T8WE3d2Z+DTVNRvsTU42rq?=
 =?us-ascii?Q?2IS5BkCGJYP/Eaq6OWvzY/DqfQY9liAvV7z+lqL+mM3O0IS/iRKhSXufxEM2?=
 =?us-ascii?Q?xwh5Q/kQjbT/DcDXh0mTi6LIV/KUY3m5TfjN9rEvui6HVFUUK8wkAjRUF2qb?=
 =?us-ascii?Q?tMz9W4uC69auO7R22gBRSLBr2nR4cY6T8U0axYtoRrGRCn9TolSUHb+ZBYr8?=
 =?us-ascii?Q?A2m+n82KbdJq2VXv0To2oxYvfXtr7NwpKaLXv1+UNf9TQzHB3a5FCOjH2KmK?=
 =?us-ascii?Q?wG0nXCJjqWGNPoGaoll6PXHJVPs9PFmDPXfKQBzAlWzT6qh0dw982rs/6tTS?=
 =?us-ascii?Q?VEUA+rvtvoMiaGbS5zE2wY0BcGoS9oTZA/F91etsgbhXK0vrVX0y3q3YiD7x?=
 =?us-ascii?Q?4KNPBFqrS1G4xLtaXk1Iqln2Tz94WoFjPi3TOg7Sb2qxhh9KjZ2fKbHAbl2o?=
 =?us-ascii?Q?XhznIdlKM30iAMq2lXc1mS8FhL8EsOoJY4mGQZviADy4zbCGOzZXMvWrLSIf?=
 =?us-ascii?Q?08BXyg0b7bwsPirvloSKPKErItudAqOZjvz4chlh7BI4+U0jEh8XbR7YUxW9?=
 =?us-ascii?Q?uAuNXKu2Xd3Q2LotQCcdon9ogAEKKSSKj6S04zfaPpUqeTNw6oPiR0qb3iZ5?=
 =?us-ascii?Q?tPuSCpjwrx8IsYNbEoFD3eLqhhE5bUs8NysYXIf2AZoUEJFmEFA1rXbQrS5Z?=
 =?us-ascii?Q?I1psWQ0NtpC0s4/4+st6ktPaR80TZEhfBSQn9RLh31t+buZIl179Zzo7eD8Q?=
 =?us-ascii?Q?W6yK3buZ/1f4xQ/IoJJp7bcRpbOcZYAfcxKWiXJVbgd2WXNGSztnVAtTL7Re?=
 =?us-ascii?Q?LnQEAvZKJoSpBCh8wMI9IUhtFPtbcmD9FFt1cbkZZQhfHtmY2YKWVG/PNSlU?=
 =?us-ascii?Q?5w5xxe+wRePpcl1ORJiWImuIagKfVxR+UxFKZjhjHfaPC3Er8+DFm+gLwqtC?=
 =?us-ascii?Q?vt2GyfQRTJe4R2rmC18CgRPPMRdeIZAjk7Lkjp07mqdrzlWXScDoHhFOvmFb?=
 =?us-ascii?Q?nc5JIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DIwr0nfyLuZSisxEtrxayr68n4ckDhCol9Rri6OznEHzFmsEQEeZHrRo83YMCWee4KbdLpmj/I6BjDhKMRwHpEqdEIwxHPKi2RW8TOwBcGGacJJLNCkJ/T4T65MqfHJm4NW1U+zNGxgm7G56fK3pbUBxzCJ3mQPZq+OAr+fj4KlZnP7hxtvpFD8TcUlTnYubdeKRanKEfA0FBBWwLm4UbezpM4Ka8S7D0cs66gMfU1fiXVDfmdXiHV+64/UMuLmzdPZhSl3I5caHrCDfPwSWc/v8Q3Dxgd1FuE6wns3DRKknZbtcs5DibUcUzrcSW0I1wMWyWzLhanIbzUuyStaXduUAFVh8LHmEcq1NFhHmiLjXyflAryWAjs15cRJoHR2lKE7fWvcxAzbMDvVo6FhFZ8RjUBLKCUowjwTm4B8NUmQ/EuP3zkUyCnOKXHqqHWfl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 06:11:06.3627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd66dde-d3c2-48b3-e25c-08de67a202e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org,amd.com];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4200C10BF1C
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Introduce new UAPI structures to support batch allocation of
non-contiguous userptr ranges in a single ioctl call.

add:
- KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
- struct kfd_ioctl_userptr_range for individual ranges
- struct kfd_ioctl_userptr_ranges_data for batch data

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 84aa24c02..579850e70 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -420,16 +420,45 @@ struct kfd_ioctl_acquire_vm_args {
 #define KFD_IOC_ALLOC_MEM_FLAGS_UNCACHED	(1 << 25)
 #define KFD_IOC_ALLOC_MEM_FLAGS_EXT_COHERENT	(1 << 24)
 #define KFD_IOC_ALLOC_MEM_FLAGS_CONTIGUOUS	(1 << 23)
+#define KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH	(1 << 22)
+
+/* Userptr range for batch allocation
+ *
+ * @start: start address of user virtual memory range
+ * @size:  size of this user virtual memory range in bytes
+ */
+struct kfd_ioctl_userptr_range {
+	__u64 start;		/* to KFD */
+	__u64 size;		/* to KFD */
+};
+
+/* Complete userptr batch allocation data structure
+ *
+ * This structure combines the header and ranges array for convenience.
+ * User space can allocate memory for this structure with the desired
+ * number of ranges and pass a pointer to it via mmap_offset field.
+ *
+ * @num_ranges: number of ranges in the ranges array
+ * @reserved:   reserved for future use, must be 0
+ * @ranges:     flexible array of userptr ranges
+ */
+struct kfd_ioctl_userptr_ranges_data {
+	__u32 num_ranges;	/* to KFD */
+	__u32 reserved;		/* to KFD, must be 0 */
+	struct kfd_ioctl_userptr_range ranges[];	/* to KFD */
+};
 
 /* Allocate memory for later SVM (shared virtual memory) mapping.
  *
  * @va_addr:     virtual address of the memory to be allocated
  *               all later mappings on all GPUs will use this address
- * @size:        size in bytes
+ * @size:        size in bytes (total size for batch allocation)
  * @handle:      buffer handle returned to user mode, used to refer to
  *               this allocation for mapping, unmapping and freeing
  * @mmap_offset: for CPU-mapping the allocation by mmapping a render node
  *               for userptrs this is overloaded to specify the CPU address
+ *               for batch userptr (KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH),
+ *               this should point to a kfd_ioctl_userptr_ranges_data structure
  * @gpu_id:      device identifier
  * @flags:       memory type and attributes. See KFD_IOC_ALLOC_MEM_FLAGS above
  */
-- 
2.34.1

