Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBF517586
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6181D10F03F;
	Mon,  2 May 2022 17:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2033 seconds by postgrey-1.36 at gabe;
 Mon, 02 May 2022 17:10:59 UTC
Received: from na01-obe.outbound.protection.outlook.com (unknown
 [52.101.57.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4E10F03F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkkIzjsJANnG9Sl44ODMcf9Tf9vWbHeI9vlmqtj06ivqEcA1dltckYq+nk75Aso4bhPVnMahV6jZ+/AcMzXNDFoaRo9d/mSTl6Jnqm+DP1ARxP2Ph8P/704XzTKHtG0NclHyleZ1R0IMG1zB9u/XKsydjws4FW0GBw9l2edFKPzMLAkHlq/wGd6vn6P7mdPwpHmY5sf28MPVir8CAPYFEega5xPXyKUiUHBEcSC7IOrDU2IqHs64dlIbBkSokbRy3CbbiH9p6nxwxZPR4LvkFvEz85vy5jNK/imyurzYWqWODkot5ngdkH4q6VNhqali/fSNEn+NVOcOlHSaUNDPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9t+A4uN1sq4GLloROfjHSsKjKH/3OhaJ3pY+r2HBBuc=;
 b=DUumBBE/Qae3ua7HdSBJ4HDuzQT1pPgU0knyRBcDKKuhrdNzYYpI6NF1L5TFya6orufdEqUBJnMEX3xDPLgF7CzAz6ZE+sKKmiQuIOIZIGFW3Zx2gOYyabpq0qJaNCR+5rSeMA+Cu7Af+QDggO0CFQF+TRfeTepnwEqqk4ZoQBZrwyqDtqbUIlHhySGmtqLMH6Zkry8iurS3etxrDUIeiQEqtVqLAMRKqMql46qRCP73fK1yKVGSTL24Lvmjo3zYMa44vSBZJtV1AwwOtm/8e6z4GYhAbquxJ7N1UsptN3LkjYKp3O95UgDtP+6Sq+c1wW/YMZFo+wTORwnTyfmKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t+A4uN1sq4GLloROfjHSsKjKH/3OhaJ3pY+r2HBBuc=;
 b=j1rOwVq93nviGk/JnjkD+A1KwuPiDoV2HTNK0fbIb0sE65zQ2HGNqm1qe2Bn5k9GyZR8885bc4NnkkZgeQ3yYLFsIwpIo9X1IbvgC1A3qUZbA04jmpk1lWl41fHUj5y/BcSzo+8kUCkW/EsjjtStoE4DGLnnxRCt+4uHyRffynk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1370.namprd21.prod.outlook.com (2603:10b6:5:16b::28)
 by DM6PR21MB1180.namprd21.prod.outlook.com (2603:10b6:5:161::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.4; Mon, 2 May
 2022 16:37:03 +0000
Received: from DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372]) by DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372%4]) with mapi id 15.20.5250.004; Mon, 2 May 2022
 16:37:03 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, vkuznets@redhat.com, decui@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jejb@linux.ibm.com, martin.petersen@oracle.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 1/4] Drivers: hv: vmbus: Remove support for Hyper-V 2008 and
 Hyper-V 2008R2/Win7
Date: Mon,  2 May 2022 09:36:28 -0700
Message-Id: <1651509391-2058-2-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:302:1::33) To DM6PR21MB1370.namprd21.prod.outlook.com
 (2603:10b6:5:16b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebb8b28d-41b6-4f1f-0835-08da2c59fd06
X-MS-TrafficTypeDiagnostic: DM6PR21MB1180:EE_
X-LD-Processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR21MB11807A9135F5A33DD571EE66D7C19@DM6PR21MB1180.namprd21.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJXUOFiQvyo+D5QJoq9WT1xTdM/rkRwMcrl1ng4HLjR2SGemsQ1Fxhq56j1TmJizwm7VhdbPD/9HOGycbkTuB4d2fH1U2btk4vAbdGuNV9TodAc1exxrIonODPiEuqRXKSTt0utMH6Yiy/5qedkxKdkyQfDliAC7XL1YvrA0qAAb6j9JNYLYMm1WYHMO1l221VmS1pwwp8brvA2Iid9IyZjhyI6CBMBSVS3pL1ZSP2cljPaDIyCUGJkU8VZtlz3UrDxhxe3SyXPwhvK0dcf0PJwf0ulPsVDyTGUhkfEXSRqXu2k3dM/iNI+tZd72fBuPg971XRyjXeKMnDATPT5lyko9veM32erqZLa5y0VGzG8x+tuHN/a8GGBRHbqFmBpG2xYSKlJJLz4LlFRcXKK3x6lLF75jlrwc7s12Z6h/ErGR8eBcuJEMvufL7WZJAebnm/B4gBYia29mEYTSnkqnAzJgoMdw7n+F9HPauGpIxmacT519IRiRvrMSHeKNV6CExnTsZD2Vz5BkU9Cy+sjP6xHZeMG2ABFmJeulix9/ZKyUTHwyErPd0jj54fNf4ckY4sF7HDUUe8/9XzT5V+SlZXKIy56hSrdFjMtWDHMlt4gl7ZRAHc1I+/xTu3vugBsbQ0zFS6NQlxovMsZ/rFI+PPrr2RRuc5aq4ea9HnZcGm1YlC27MXJ2kmbcUbfoqDsGSVFnaitjiKlJg88/lq2+tZJoDS4uN3/gEEDkAQixzwhygMoeZRlxzCpAg4r/De7H2VxxrS/sIdERzFFd5C5H3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1370.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(82950400001)(7416002)(10290500003)(66946007)(6486002)(66556008)(66476007)(2616005)(107886003)(6512007)(26005)(921005)(5660300002)(6506007)(83380400001)(508600001)(82960400001)(86362001)(6666004)(316002)(8936002)(38350700002)(38100700002)(186003)(52116002)(4326008)(36756003)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ckJIgJixQjXfAA0va3Cvg19wP8StWisivfjXaidoxwYgQ7T7MxaLkX/G5SM?=
 =?us-ascii?Q?WfPv4AnDUV6HQi3gpX5r57eJwmRbm/4AaAOsio3P6DPXYyba6AFR5ogIEV/a?=
 =?us-ascii?Q?Fyhc2OzysoedpVvyhuBMDYhAN2Dxky+UY9jH37rHME1iyuu8pd1eJfidXvSF?=
 =?us-ascii?Q?Y6uu2yBcb4qUG400S8Wmd+AeEcKDadQDTBtFVQJ7k9VK9QfLLyGM0vhq9+FO?=
 =?us-ascii?Q?hL35p4y3DETrC7G8PHY+31oTqFYdmDqV3/ebXSKFXex4eixs4oTBM97keBWt?=
 =?us-ascii?Q?LuDJEkih1rFLMZgHogL97apqO1T8xmp0ItGSrWWc7bUc8PphWIvHiNdC4RgT?=
 =?us-ascii?Q?ynQpxGhHjyToWuzU05QAL710ZtTeli+gNu2q6bKb0ngu1Fp/dPlF/HS1jc0o?=
 =?us-ascii?Q?UQjBLLtzBvAb0BrwwkRODNVseM601CSOIeLrDHNfqVQutSjUNqdz9xui/f6T?=
 =?us-ascii?Q?G/y2Zw1U3W+R4IrN5ydI+KT3nzfx+zs1gFPG7/M9KmiTb6lE9R6AYduNbeVV?=
 =?us-ascii?Q?Rn5rYga/69fvXFK8J83mFTvAhb+5PDXRX5eM/GrudJsqPveU57v4sGmLQUTP?=
 =?us-ascii?Q?PAKneCZCSe3KDlTORW+VJE8Xk22tcLMmpAmcTfGd5H0VP1vVVIP1/PUuA6Lq?=
 =?us-ascii?Q?T9FFFAQ7i44jmJSZXTtiK6ayPLoFy7NhZhCgmtCMXfgWYKyGflIK2JpaWAD3?=
 =?us-ascii?Q?4Ds6NDkHEGkBDBf64WxR92o9XZ1wfpXDE5KRuuYRzQ0umfY4frajbkXINMuh?=
 =?us-ascii?Q?+cOGfONkZrJzz2Bg+Tb5YPIZnUwF/PqRgD1WnUAA879zvorkMmiUT5u21EIE?=
 =?us-ascii?Q?V5Xk4VeBHxIXeLuVwlufXQfIJhtSTgOusl2qx4sjZ5u47gVkbZTNPocp7QgA?=
 =?us-ascii?Q?/JKoZHJrLUnfoa/jAx45lhTPayQliUwnbPnm/D8OyKm0j70QSlieg6Sgl4Zr?=
 =?us-ascii?Q?NtbpR9+6qAOsN2CuUINtPY2lOU9rxZY9eV+i+kQhYi7ZvMu/KovDt09RD4eA?=
 =?us-ascii?Q?URnX+05pwZI0BidPVK0Crkw6dtrM817Xsknf6FqQUgWio+NtL0TKNoPU5zT0?=
 =?us-ascii?Q?FVwr9pC/YHhwpaL/5dnB2q9nd/DAu+oLGXLfaQ4SvCL0QY+7Ba5vnG/xgqFI?=
 =?us-ascii?Q?A1a8Ti6Gjq4yksnL1W18QJrYdnLC+yVaehSuTYaavI5HesbU9L4hRE10kuah?=
 =?us-ascii?Q?3a/jW5zwOSU0x+jsUeR5HHXQ2ovK2vw/srLX2c0LeU9NN6phDe2/Ri2aTBuH?=
 =?us-ascii?Q?I2NnSpIo3Ft631vsIWoK/juU7MJidHuIlwDKfDFQSp26N5fKJuSF9OECbo7+?=
 =?us-ascii?Q?RPNCmNfCtkX41N1buO8U564QLxaBJTnhrzzATjBXbmcBi2DZDgt27+lCogcr?=
 =?us-ascii?Q?iaq/LLhxAHBrc1NQXNeA5ZdMAHpn9Vij8E0vqlZYKK2B+N5rMl2Rr0ugWqFv?=
 =?us-ascii?Q?1xzW0sqjhQ1PVDe45J6WyYZ06tkHSlfNnzsf4SUojX032U96Jgs+XM0Xjd8o?=
 =?us-ascii?Q?QCkyXkzVqQVqiTciErCvdnhpr95PdN7PJAVoWb78al5sh95VWNAji20NONLA?=
 =?us-ascii?Q?WRKKV9HLdpQAlp2u8/F09l5XYyHuy1Mq0AqfCuRB4tzL3GrQTbrZjm90cKNU?=
 =?us-ascii?Q?+leODNkS0aaLli5wOigIcDllUGV6q5GhIwnLBLK6o1V92WBOROB8EH7oZesn?=
 =?us-ascii?Q?5orQlnGMMGBuhT6Mq56MWMoNgLKxqkUf8gZ6/pNbNpPqQuJJDp+sUYVFsJG9?=
 =?us-ascii?Q?sBZ6y25sF6w6YKGZh75D/pfQjbK1OHw=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb8b28d-41b6-4f1f-0835-08da2c59fd06
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:37:03.5988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5j6gi+tXXVNWcnrcjHf3mJFxkX5oBGwa8b1VKGRcbAd2lmXzuPoJLLbEpgOh4aNFEs5mTuxnhupdZ+qA8AtDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1180
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
Cc: mikelley@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VMbus driver has special case code for running on the first released
versions of Hyper-V: 2008 and 2008 R2/Windows 7. These versions are now
out of support (except for extended security updates) and lack the
performance features needed for effective production usage of Linux
guests.

Simplify the code by removing the negotiation of the VMbus protocol
versions required for these releases of Hyper-V, and by removing the
special case code for handling these VMbus protocol versions.

Signed-off-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/hv/channel_mgmt.c | 29 +++++++++--------------
 drivers/hv/connection.c   |  6 ++---
 drivers/hv/vmbus_drv.c    | 60 ++++++++++-------------------------------------
 include/linux/hyperv.h    | 10 +++++---
 4 files changed, 33 insertions(+), 72 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index 85a2142..575459a 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -713,15 +713,13 @@ static bool hv_cpuself_used(u32 cpu, struct vmbus_channel *chn)
 static int next_numa_node_id;
 
 /*
- * Starting with Win8, we can statically distribute the incoming
- * channel interrupt load by binding a channel to VCPU.
+ * We can statically distribute the incoming channel interrupt load
+ * by binding a channel to VCPU.
  *
- * For pre-win8 hosts or non-performance critical channels we assign the
- * VMBUS_CONNECT_CPU.
- *
- * Starting with win8, performance critical channels will be distributed
- * evenly among all the available NUMA nodes.  Once the node is assigned,
- * we will assign the CPU based on a simple round robin scheme.
+ * For non-performance critical channels we assign the VMBUS_CONNECT_CPU.
+ * Performance critical channels will be distributed evenly among all
+ * the available NUMA nodes.  Once the node is assigned, we will assign
+ * the CPU based on a simple round robin scheme.
  */
 static void init_vp_index(struct vmbus_channel *channel)
 {
@@ -732,13 +730,10 @@ static void init_vp_index(struct vmbus_channel *channel)
 	u32 target_cpu;
 	int numa_node;
 
-	if ((vmbus_proto_version == VERSION_WS2008) ||
-	    (vmbus_proto_version == VERSION_WIN7) || (!perf_chn) ||
+	if (!perf_chn ||
 	    !alloc_cpumask_var(&available_mask, GFP_KERNEL)) {
 		/*
-		 * Prior to win8, all channel interrupts are
-		 * delivered on VMBUS_CONNECT_CPU.
-		 * Also if the channel is not a performance critical
+		 * If the channel is not a performance critical
 		 * channel, bind it to VMBUS_CONNECT_CPU.
 		 * In case alloc_cpumask_var() fails, bind it to
 		 * VMBUS_CONNECT_CPU.
@@ -931,11 +926,9 @@ static void vmbus_setup_channel_state(struct vmbus_channel *channel,
 	 */
 	channel->sig_event = VMBUS_EVENT_CONNECTION_ID;
 
-	if (vmbus_proto_version != VERSION_WS2008) {
-		channel->is_dedicated_interrupt =
-				(offer->is_dedicated_interrupt != 0);
-		channel->sig_event = offer->connection_id;
-	}
+	channel->is_dedicated_interrupt =
+			(offer->is_dedicated_interrupt != 0);
+	channel->sig_event = offer->connection_id;
 
 	memcpy(&channel->offermsg, offer,
 	       sizeof(struct vmbus_channel_offer_channel));
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index a3d8be8..6218bbf 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -47,6 +47,8 @@ struct vmbus_connection vmbus_connection = {
 
 /*
  * Table of VMBus versions listed from newest to oldest.
+ * VERSION_WIN7 and VERSION_WS2008 are no longer supported in
+ * Linux guests and are not listed.
  */
 static __u32 vmbus_versions[] = {
 	VERSION_WIN10_V5_3,
@@ -56,9 +58,7 @@ struct vmbus_connection vmbus_connection = {
 	VERSION_WIN10_V4_1,
 	VERSION_WIN10,
 	VERSION_WIN8_1,
-	VERSION_WIN8,
-	VERSION_WIN7,
-	VERSION_WS2008
+	VERSION_WIN8
 };
 
 /*
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 14de170..9c1b3620 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1263,23 +1263,17 @@ static void vmbus_chan_sched(struct hv_per_cpu_context *hv_cpu)
 	unsigned long *recv_int_page;
 	u32 maxbits, relid;
 
-	if (vmbus_proto_version < VERSION_WIN8) {
-		maxbits = MAX_NUM_CHANNELS_SUPPORTED;
-		recv_int_page = vmbus_connection.recv_int_page;
-	} else {
-		/*
-		 * When the host is win8 and beyond, the event page
-		 * can be directly checked to get the id of the channel
-		 * that has the interrupt pending.
-		 */
-		void *page_addr = hv_cpu->synic_event_page;
-		union hv_synic_event_flags *event
-			= (union hv_synic_event_flags *)page_addr +
-						 VMBUS_MESSAGE_SINT;
+	/*
+	 * The event page can be directly checked to get the id of
+	 * the channel that has the interrupt pending.
+	 */
+	void *page_addr = hv_cpu->synic_event_page;
+	union hv_synic_event_flags *event
+		= (union hv_synic_event_flags *)page_addr +
+					 VMBUS_MESSAGE_SINT;
 
-		maxbits = HV_EVENT_FLAGS_COUNT;
-		recv_int_page = event->flags;
-	}
+	maxbits = HV_EVENT_FLAGS_COUNT;
+	recv_int_page = event->flags;
 
 	if (unlikely(!recv_int_page))
 		return;
@@ -1351,40 +1345,10 @@ static void vmbus_isr(void)
 {
 	struct hv_per_cpu_context *hv_cpu
 		= this_cpu_ptr(hv_context.cpu_context);
-	void *page_addr = hv_cpu->synic_event_page;
+	void *page_addr;
 	struct hv_message *msg;
-	union hv_synic_event_flags *event;
-	bool handled = false;
-
-	if (unlikely(page_addr == NULL))
-		return;
-
-	event = (union hv_synic_event_flags *)page_addr +
-					 VMBUS_MESSAGE_SINT;
-	/*
-	 * Check for events before checking for messages. This is the order
-	 * in which events and messages are checked in Windows guests on
-	 * Hyper-V, and the Windows team suggested we do the same.
-	 */
-
-	if ((vmbus_proto_version == VERSION_WS2008) ||
-		(vmbus_proto_version == VERSION_WIN7)) {
-
-		/* Since we are a child, we only need to check bit 0 */
-		if (sync_test_and_clear_bit(0, event->flags))
-			handled = true;
-	} else {
-		/*
-		 * Our host is win8 or above. The signaling mechanism
-		 * has changed and we can directly look at the event page.
-		 * If bit n is set then we have an interrup on the channel
-		 * whose id is n.
-		 */
-		handled = true;
-	}
 
-	if (handled)
-		vmbus_chan_sched(hv_cpu);
+	vmbus_chan_sched(hv_cpu);
 
 	page_addr = hv_cpu->synic_message_page;
 	msg = (struct hv_message *)page_addr + VMBUS_MESSAGE_SINT;
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index fe2e017..9a4ac13 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -230,15 +230,19 @@ static inline u32 hv_get_avail_to_write_percent(
  * two 16 bit quantities: major_number. minor_number.
  *
  * 0 . 13 (Windows Server 2008)
- * 1 . 1  (Windows 7)
- * 2 . 4  (Windows 8)
- * 3 . 0  (Windows 8 R2)
+ * 1 . 1  (Windows 7, WS2008 R2)
+ * 2 . 4  (Windows 8, WS2012)
+ * 3 . 0  (Windows 8.1, WS2012 R2)
  * 4 . 0  (Windows 10)
  * 4 . 1  (Windows 10 RS3)
  * 5 . 0  (Newer Windows 10)
  * 5 . 1  (Windows 10 RS4)
  * 5 . 2  (Windows Server 2019, RS5)
  * 5 . 3  (Windows Server 2022)
+ *
+ * The WS2008 and WIN7 versions are listed here for
+ * completeness but are no longer supported in the
+ * Linux kernel.
  */
 
 #define VERSION_WS2008  ((0 << 16) | (13))
-- 
1.8.3.1

