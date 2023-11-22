Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B67F54AD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5910E6BB;
	Wed, 22 Nov 2023 23:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013023.outbound.protection.outlook.com [52.101.64.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBEF10E6B1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQTH/WXFfpLRAVKr9wOnnB3/5dsrtrdWTII9DYbS0qFDCAYQN+Wv2gx+SUVpqbaUxB7dvac2rgQRvqALbrDoPMXgui2ANjREGQ+mGR1Vy0VRnYriTBjSf5GqJDU5jHPp5ZOG3Hhkpqc+6eWHLalRJMfggXD/zSnBP5c3OUdbjNa1YMomrxfJ0A9CiZhmst51VkVm6VnEtR3jQZxLh+3dFQAX/tWyPsCwBrqZfAlKDKQnAKPWBMLvOY+jvWFzFAHknrv/V5NpaNyhZ7RP4gt3T8+t+DyVxsAPxMy4FsfZNncLG3xsiCbPm1L6bfMBHtufyp98huIdmo5U+9yHoj+lAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KufTTWTxBDVDJFf4k/BwR5w4RwkyLCjRKdiUARMhlSw=;
 b=dRuW4dAPTNYSdZZcdIKAkQHjFZ8BCMf/gv/55VWDZ7AN4K+wy4XW9i5Eaoa9nZDm1pWOlksczcwBaymx/rKsH6B4B/yPTHgRFQUOq7q69hLQyzuoOKo18SmL0DC62+7Qudjrbq5FMo6bueTNrJlafX04KA84vFZXjVw14koIYByaY5r+BvvVE/3aRUE0dwqZ1JjetutjTUfDDmert74EAi/ue1vcCT89/zjdhdD3rGNO2BHdAlynCGaPQDjpqDV+n2fYGizrBqW3eeVrN1f7TfF0b+oFBJ5aYmrGPZCYWXhdqSdhyfHhFq/GYNV4wahgoeP4fejyRYKiW+use94yJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KufTTWTxBDVDJFf4k/BwR5w4RwkyLCjRKdiUARMhlSw=;
 b=oJfivouMi+IKY6F7R7Z+lcU9L2wNHZzi3l4HujUy60wCaRP4d1GAa5eT43BTVduYSz1zuZ6CPrZvxclzg++Q+JHFS2ZCx25ejIQuURsI4WtiARKntVcvvAzSAvM0MjhDLtcoDI8PsTajk5RZKppP+IDcVBUdcJtlpH2+Nl1pXXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:28 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:28 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 5/6] drm/vmwgfx: Use vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:57 -0800
Message-Id: <20231122233058.185601-13-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122233058.185601-1-amakhalov@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e538fc5-edbb-42fb-4cb1-08dbebb3269c
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OL2EBnMIhYRBexUyLJi7o4lvAK5DV0SuN7TjjXGtA0s64JfxF91roML4GPpUkFVkscHHmkla54rDOF1T9uGgJ16G924hPR0Xas9g/BS9WucToyY/hq+afoWNPRYZFVmkCKs5g1yCR7VWb2x9g133zVLspymx50Tsxk3DSQxWxdowVIpgkIH2in6eN8lR5mkwDD+InZd8ZKKDvCXTDNDfD4DRTKBPlzYxJUcdS+3g6jE/cqmUtZCDChTKd4VDTyr/sRUHcjY6esG/9o+o2yFuRVMFKAaC1i43Q93oGjElyLkApUO04Q4ompXXDCRN8rsF/PpiHIENsg9OKbt68EsyYagq1om+vMO0twUXO6faMr1xZjLhnhfUb7SYgxbdmy9IrSQPisYR5w9637DA3N0bmMSUYqT6xRoFC5FjiPXEkxMKnueXet9oCQ+4q2Xv2NhhUxz+6Ayp7dkGZNnTq0c8/4gKdvxcn1XR9PANvjUuAnyqmSocfpalJ0RYri+jE2eVdopFAyBHNdSQOaJwzQskeNAzYyxCuRBq27f3act1LZSuwaxa3vDEpdhja8J+QUBtB9fqqX7awl0Alg9h17HqO7EeRvO4mn4OxCjX+5jGIs3YaK5kg31Aue6BZd9dUrxusfwk9lgqh+kBUiCQno9enC8sz0nrsGwsabNQF1EyyqDVACgqdAv2pBDyGliQRCDY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(30864003)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYz69B7bFeuIueKRlqDF4v6uMyg0KLlsjC9kNEJk+k+JrOiC+K4zp9CZumdN?=
 =?us-ascii?Q?/2gfssaM1xstpDcde6jsL6UU3s9DR2P7rTtqLlAhsrT8vwgiogoGkcsj0AW1?=
 =?us-ascii?Q?+FTLS3tq0suGUIkrxekBMA3/AjAmsmPamFzf4k07DffDdH6j6rh+tVGdP+vB?=
 =?us-ascii?Q?Gkxsue2ThXgDyzf5k/mMTcdAittK2int5tEqkAGXkbhfAW1kahnTeAYkkma1?=
 =?us-ascii?Q?5cNJFyG23mNlt+frIvrHqPtuIW2UQj4pb0dvxuEDd8f+37m9Z/SV8TdE/o09?=
 =?us-ascii?Q?RNtENfEc7FK+qVBWPVkl3cPFGiXl48NjvLgRiRoKyVG0Bp6I8cDnaaRD43Ax?=
 =?us-ascii?Q?EAv3Y8MqJwwqtOfGkupeBEwkXDaQzXHkULRAg/hur3cRqVC5ZQcSufKzXyPS?=
 =?us-ascii?Q?y3aQznwtpHyzPGm+zKdNiLJbJdMsu7hMOyK48giUEqDrJjvWCALMU7S+d3cY?=
 =?us-ascii?Q?/JNPPIhkgcMr0T0Iae4ieB/hok/CEOmBttYLAnT0bc3JXatDNLhCEMzM6Miz?=
 =?us-ascii?Q?URDoC8jvfXuzbKjOBLVXuEu42JLlV0jKmmAvLo7pVHXG1Xe2GqmRySiwAWmw?=
 =?us-ascii?Q?jySIx7ugt8rB2JC3vOvzlZLzMm0jC0QQFghoQOtNU980Jsxl59Hpx40lJzt+?=
 =?us-ascii?Q?vQsLpuZGQamV/PokfQH7WwCAh261PeEyt8SXNHDtMI/E7QzjWeuCh+YUm7nn?=
 =?us-ascii?Q?vLmH53rweQIj/YPImjekV/ne6gCPQNA3zUAUotdxz8XpNHSwJKdN/yR/LOIt?=
 =?us-ascii?Q?wim2NEC+WFN6rkKMPEJ0KYyo4bJocFOD3qKP2waUQy5j1hKVZKGyhMDIhkrS?=
 =?us-ascii?Q?p+KKepX+BLWv7gIyp47nwux/OECsiKExw7nrLddO/tDPsUIgzE97QZO9WVl5?=
 =?us-ascii?Q?8CUCFDcFpZq/kEInb9XBlimrWuVtyAgCL5NGGLjuWihPMfo16KebOniE40Na?=
 =?us-ascii?Q?BsaRIQgIld8AF/94zQGpzp+ouG4VOuTMjwXYmYLQgIdhhFjtAYWus8EVG/rn?=
 =?us-ascii?Q?1JKq7+1pWxxAyU7Yju5vEJZEJMMJ9GK99AOj5hl9UAUcDJJpdmia5ZhcXBGy?=
 =?us-ascii?Q?cs59jF3cPweP6A925tsfpzaxBnyqOYx7OK/mTsy9BbWVqD3WTt2Nr62MYP+G?=
 =?us-ascii?Q?RmhVPXhqv/YD/MfBZL3YwsAyFnWjTO3y8FdO8Vn2e53JbRdaw2xJZWLdhY7O?=
 =?us-ascii?Q?7iIjI4zfUP0KvQ7bqocCumE0vWwYjiy4hTWG4zbZADvajWerrffyeY+HT6OB?=
 =?us-ascii?Q?+ljMbaT7c560Z8zkcZlAqnDwVEVhHz3x3IzfjHEhnO5g4sVqFw8ReggzsnAB?=
 =?us-ascii?Q?XWhZDDgVh6uookvO8uyOadry30gU3JUQi70CbD9ntJnpYz//GiOAjDHFZbEG?=
 =?us-ascii?Q?EE9QPMHDVxSiePaS/dSVMbX9zkbHHnNMZPRvveNigZ8gMemyrxuGtkLenM6+?=
 =?us-ascii?Q?VQVGSsifbWJsdTEFOqrdtnuRqsyYrBf+JAUGLz5qHiGQelKudBxIot+n201N?=
 =?us-ascii?Q?5vK+kSpOnNWW2tKtYnH7tZ8k48HKhc4UR0tf4Tn5treDeIpD+SnctIAfATu4?=
 =?us-ascii?Q?/85QkWVhXkt8hNR8Diaap5K1cmGYG1OMWrlqatIc?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e538fc5-edbb-42fb-4cb1-08dbebb3269c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:28.5482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7a9JAheI0SmwX2td4Bot1iVIelKYPFKNXWxQoIRfMur/m+WF44xxypyrxkZn0mlCcCCNGH+eaLUXXFFBJtyLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8275
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
Cc: Alexey Makhalov <amakhalov@vmware.com>, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, dmitry.torokhov@gmail.com,
 akaher@vmware.com, linux-graphics-maintainer@vmware.com, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code.

drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h: implement arm64 variant of
vmware_hypercall here. To be moved to arch/arm64/include/asm/vmware.h
later.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 +++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 +++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 --------------------
 3 files changed, 197 insertions(+), 358 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 2651fe0ef518..1f15990d3934 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -48,8 +48,6 @@
 
 #define RETRIES                 3
 
-#define VMW_HYPERVISOR_MAGIC    0x564D5868
-
 #define VMW_PORT_CMD_MSG        30
 #define VMW_PORT_CMD_HB_MSG     0
 #define VMW_PORT_CMD_OPEN_CHANNEL  (MSG_TYPE_OPEN << 16 | VMW_PORT_CMD_MSG)
@@ -104,20 +102,18 @@ static const char* const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] =
  */
 static int vmw_open_channel(struct rpc_channel *channel, unsigned int protocol)
 {
-	unsigned long eax, ebx, ecx, edx, si = 0, di = 0;
+	u32 ecx, edx, esi, edi;
 
-	VMW_PORT(VMW_PORT_CMD_OPEN_CHANNEL,
-		(protocol | GUESTMSG_FLAG_COOKIE), si, di,
-		0,
-		VMW_HYPERVISOR_MAGIC,
-		eax, ebx, ecx, edx, si, di);
+	vmware_hypercall6(VMW_PORT_CMD_OPEN_CHANNEL,
+			  (protocol | GUESTMSG_FLAG_COOKIE), 0,
+			  &ecx, &edx, &esi, &edi);
 
 	if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) == 0)
 		return -EINVAL;
 
 	channel->channel_id  = HIGH_WORD(edx);
-	channel->cookie_high = si;
-	channel->cookie_low  = di;
+	channel->cookie_high = esi;
+	channel->cookie_low  = edi;
 
 	return 0;
 }
@@ -133,17 +129,13 @@ static int vmw_open_channel(struct rpc_channel *channel, unsigned int protocol)
  */
 static int vmw_close_channel(struct rpc_channel *channel)
 {
-	unsigned long eax, ebx, ecx, edx, si, di;
-
-	/* Set up additional parameters */
-	si  = channel->cookie_high;
-	di  = channel->cookie_low;
+	u32 ecx;
 
-	VMW_PORT(VMW_PORT_CMD_CLOSE_CHANNEL,
-		0, si, di,
-		channel->channel_id << 16,
-		VMW_HYPERVISOR_MAGIC,
-		eax, ebx, ecx, edx, si, di);
+	vmware_hypercall5(VMW_PORT_CMD_CLOSE_CHANNEL,
+			  0, channel->channel_id << 16,
+			  channel->cookie_high,
+			  channel->cookie_low,
+			  &ecx);
 
 	if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) == 0)
 		return -EINVAL;
@@ -163,24 +155,18 @@ static int vmw_close_channel(struct rpc_channel *channel)
 static unsigned long vmw_port_hb_out(struct rpc_channel *channel,
 				     const char *msg, bool hb)
 {
-	unsigned long si, di, eax, ebx, ecx, edx;
+	u32 ebx, ecx;
 	unsigned long msg_len = strlen(msg);
 
 	/* HB port can't access encrypted memory. */
 	if (hb && !cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
-		unsigned long bp = channel->cookie_high;
-		u32 channel_id = (channel->channel_id << 16);
-
-		si = (uintptr_t) msg;
-		di = channel->cookie_low;
-
-		VMW_PORT_HB_OUT(
+		vmware_hypercall_hb_out(
 			(MESSAGE_STATUS_SUCCESS << 16) | VMW_PORT_CMD_HB_MSG,
-			msg_len, si, di,
-			VMWARE_HYPERVISOR_HB | channel_id |
-			VMWARE_HYPERVISOR_OUT,
-			VMW_HYPERVISOR_MAGIC, bp,
-			eax, ebx, ecx, edx, si, di);
+			msg_len,
+			channel->channel_id << 16,
+			(uintptr_t) msg, channel->cookie_low,
+			channel->cookie_high,
+			&ebx);
 
 		return ebx;
 	}
@@ -194,14 +180,13 @@ static unsigned long vmw_port_hb_out(struct rpc_channel *channel,
 		memcpy(&word, msg, bytes);
 		msg_len -= bytes;
 		msg += bytes;
-		si = channel->cookie_high;
-		di = channel->cookie_low;
-
-		VMW_PORT(VMW_PORT_CMD_MSG | (MSG_TYPE_SENDPAYLOAD << 16),
-			 word, si, di,
-			 channel->channel_id << 16,
-			 VMW_HYPERVISOR_MAGIC,
-			 eax, ebx, ecx, edx, si, di);
+
+		vmware_hypercall5(VMW_PORT_CMD_MSG |
+				  (MSG_TYPE_SENDPAYLOAD << 16),
+				  word, channel->channel_id << 16,
+				  channel->cookie_high,
+				  channel->cookie_low,
+				  &ecx);
 	}
 
 	return ecx;
@@ -220,22 +205,17 @@ static unsigned long vmw_port_hb_out(struct rpc_channel *channel,
 static unsigned long vmw_port_hb_in(struct rpc_channel *channel, char *reply,
 				    unsigned long reply_len, bool hb)
 {
-	unsigned long si, di, eax, ebx, ecx, edx;
+	u32 ebx, ecx, edx;
 
 	/* HB port can't access encrypted memory */
 	if (hb && !cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
-		unsigned long bp = channel->cookie_low;
-		u32 channel_id = (channel->channel_id << 16);
-
-		si = channel->cookie_high;
-		di = (uintptr_t) reply;
-
-		VMW_PORT_HB_IN(
+		vmware_hypercall_hb_in(
 			(MESSAGE_STATUS_SUCCESS << 16) | VMW_PORT_CMD_HB_MSG,
-			reply_len, si, di,
-			VMWARE_HYPERVISOR_HB | channel_id,
-			VMW_HYPERVISOR_MAGIC, bp,
-			eax, ebx, ecx, edx, si, di);
+			reply_len,
+			channel->channel_id << 16,
+			channel->cookie_high,
+			(uintptr_t) reply, channel->cookie_low,
+			&ebx);
 
 		return ebx;
 	}
@@ -245,14 +225,13 @@ static unsigned long vmw_port_hb_in(struct rpc_channel *channel, char *reply,
 	while (reply_len) {
 		unsigned int bytes = min_t(unsigned long, reply_len, 4);
 
-		si = channel->cookie_high;
-		di = channel->cookie_low;
-
-		VMW_PORT(VMW_PORT_CMD_MSG | (MSG_TYPE_RECVPAYLOAD << 16),
-			 MESSAGE_STATUS_SUCCESS, si, di,
-			 channel->channel_id << 16,
-			 VMW_HYPERVISOR_MAGIC,
-			 eax, ebx, ecx, edx, si, di);
+		vmware_hypercall7(VMW_PORT_CMD_MSG |
+				  (MSG_TYPE_RECVPAYLOAD << 16),
+				  MESSAGE_STATUS_SUCCESS,
+				  channel->channel_id << 16,
+				  channel->cookie_high,
+				  channel->cookie_low,
+				  &ebx, &ecx, &edx);
 
 		if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) == 0)
 			break;
@@ -276,22 +255,18 @@ static unsigned long vmw_port_hb_in(struct rpc_channel *channel, char *reply,
  */
 static int vmw_send_msg(struct rpc_channel *channel, const char *msg)
 {
-	unsigned long eax, ebx, ecx, edx, si, di;
+	u32 ebx, ecx;
 	size_t msg_len = strlen(msg);
 	int retries = 0;
 
 	while (retries < RETRIES) {
 		retries++;
 
-		/* Set up additional parameters */
-		si  = channel->cookie_high;
-		di  = channel->cookie_low;
-
-		VMW_PORT(VMW_PORT_CMD_SENDSIZE,
-			msg_len, si, di,
-			channel->channel_id << 16,
-			VMW_HYPERVISOR_MAGIC,
-			eax, ebx, ecx, edx, si, di);
+		vmware_hypercall5(VMW_PORT_CMD_SENDSIZE,
+				  msg_len, channel->channel_id << 16,
+				  channel->cookie_high,
+				  channel->cookie_low,
+				  &ecx);
 
 		if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) == 0) {
 			/* Expected success. Give up. */
@@ -329,7 +304,7 @@ STACK_FRAME_NON_STANDARD(vmw_send_msg);
 static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
 			size_t *msg_len)
 {
-	unsigned long eax, ebx, ecx, edx, si, di;
+	u32 ebx, ecx, edx;
 	char *reply;
 	size_t reply_len;
 	int retries = 0;
@@ -341,15 +316,11 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
 	while (retries < RETRIES) {
 		retries++;
 
-		/* Set up additional parameters */
-		si  = channel->cookie_high;
-		di  = channel->cookie_low;
-
-		VMW_PORT(VMW_PORT_CMD_RECVSIZE,
-			0, si, di,
-			channel->channel_id << 16,
-			VMW_HYPERVISOR_MAGIC,
-			eax, ebx, ecx, edx, si, di);
+		vmware_hypercall7(VMW_PORT_CMD_RECVSIZE,
+				  0, channel->channel_id << 16,
+				  channel->cookie_high,
+				  channel->cookie_low,
+				  &ebx, &ecx, &edx);
 
 		if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) == 0) {
 			DRM_ERROR("Failed to get reply size for host message.\n");
@@ -384,16 +355,12 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
 
 		reply[reply_len] = '\0';
 
-
-		/* Ack buffer */
-		si  = channel->cookie_high;
-		di  = channel->cookie_low;
-
-		VMW_PORT(VMW_PORT_CMD_RECVSTATUS,
-			MESSAGE_STATUS_SUCCESS, si, di,
-			channel->channel_id << 16,
-			VMW_HYPERVISOR_MAGIC,
-			eax, ebx, ecx, edx, si, di);
+		vmware_hypercall5(VMW_PORT_CMD_RECVSTATUS,
+				  MESSAGE_STATUS_SUCCESS,
+				  channel->channel_id << 16,
+				  channel->cookie_high,
+				  channel->cookie_low,
+				  &ecx);
 
 		if ((HIGH_WORD(ecx) & MESSAGE_STATUS_SUCCESS) == 0) {
 			kfree(reply);
@@ -652,13 +619,7 @@ static inline void reset_ppn_array(PPN64 *arr, size_t size)
  */
 static inline void hypervisor_ppn_reset_all(void)
 {
-	unsigned long eax, ebx, ecx, edx, si = 0, di = 0;
-
-	VMW_PORT(VMW_PORT_CMD_MKSGS_RESET,
-		0, si, di,
-		0,
-		VMW_HYPERVISOR_MAGIC,
-		eax, ebx, ecx, edx, si, di);
+	vmware_hypercall1(VMW_PORT_CMD_MKSGS_RESET, 0);
 }
 
 /**
@@ -669,13 +630,7 @@ static inline void hypervisor_ppn_reset_all(void)
  */
 static inline void hypervisor_ppn_add(PPN64 pfn)
 {
-	unsigned long eax, ebx, ecx, edx, si = 0, di = 0;
-
-	VMW_PORT(VMW_PORT_CMD_MKSGS_ADD_PPN,
-		(unsigned long)pfn, si, di,
-		0,
-		VMW_HYPERVISOR_MAGIC,
-		eax, ebx, ecx, edx, si, di);
+	vmware_hypercall1(VMW_PORT_CMD_MKSGS_ADD_PPN, (unsigned long)pfn);
 }
 
 /**
@@ -686,13 +641,7 @@ static inline void hypervisor_ppn_add(PPN64 pfn)
  */
 static inline void hypervisor_ppn_remove(PPN64 pfn)
 {
-	unsigned long eax, ebx, ecx, edx, si = 0, di = 0;
-
-	VMW_PORT(VMW_PORT_CMD_MKSGS_REMOVE_PPN,
-		(unsigned long)pfn, si, di,
-		0,
-		VMW_HYPERVISOR_MAGIC,
-		eax, ebx, ecx, edx, si, di);
+	vmware_hypercall1(VMW_PORT_CMD_MKSGS_REMOVE_PPN, (unsigned long)pfn);
 }
 
 #if IS_ENABLED(CONFIG_DRM_VMWGFX_MKSSTATS)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
index 4f40167ad61f..29bd0af83038 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
@@ -34,6 +34,8 @@
 #define VMWARE_HYPERVISOR_HB  BIT(0)
 #define VMWARE_HYPERVISOR_OUT BIT(1)
 
+#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
+
 #define X86_IO_MAGIC 0x86
 
 #define X86_IO_W7_SIZE_SHIFT 0
@@ -45,86 +47,159 @@
 #define X86_IO_W7_IMM_SHIFT  5
 #define X86_IO_W7_IMM_MASK  (0xff << X86_IO_W7_IMM_SHIFT)
 
-static inline void vmw_port(unsigned long cmd, unsigned long in_ebx,
-			    unsigned long in_si, unsigned long in_di,
-			    unsigned long flags, unsigned long magic,
-			    unsigned long *eax, unsigned long *ebx,
-			    unsigned long *ecx, unsigned long *edx,
-			    unsigned long *si, unsigned long *di)
+static inline
+unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 {
-	register u64 x0 asm("x0") = magic;
-	register u64 x1 asm("x1") = in_ebx;
+	register u64 x0 asm("x0") = VMWARE_HYPERVISOR_MAGIC;
+	register u64 x1 asm("x1") = in1;
 	register u64 x2 asm("x2") = cmd;
-	register u64 x3 asm("x3") = flags | VMWARE_HYPERVISOR_PORT;
-	register u64 x4 asm("x4") = in_si;
-	register u64 x5 asm("x5") = in_di;
+	register u64 x3 asm("x3") = VMWARE_HYPERVISOR_PORT;
+	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
+				    X86_IO_W7_WITH |
+				    X86_IO_W7_DIR |
+				    (2 << X86_IO_W7_SIZE_SHIFT);
 
+	asm_inline volatile (
+		"mrs xzr, mdccsr_el0; "
+		: "+r" (x0)
+		: "r" (x1), "r" (x2), "r" (x3), "r" (x7)
+		: "memory");
+
+	return x0;
+}
+
+static inline
+unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, uint32_t *out2)
+{
+	register u64 x0 asm("x0") = VMWARE_HYPERVISOR_MAGIC;
+	register u64 x1 asm("x1") = in1;
+	register u64 x2 asm("x2") = cmd;
+	register u64 x3 asm("x3") = in3 | VMWARE_HYPERVISOR_PORT;
+	register u64 x4 asm("x4") = in4;
+	register u64 x5 asm("x5") = in5;
 	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
 				    X86_IO_W7_WITH |
 				    X86_IO_W7_DIR |
 				    (2 << X86_IO_W7_SIZE_SHIFT);
 
-	asm volatile("mrs xzr, mdccsr_el0 \n\t"
-		     : "+r"(x0), "+r"(x1), "+r"(x2),
-		       "+r"(x3), "+r"(x4), "+r"(x5)
-		     : "r"(x7)
-		     :);
-	*eax = x0;
-	*ebx = x1;
-	*ecx = x2;
-	*edx = x3;
-	*si = x4;
-	*di = x5;
+	asm_inline volatile (
+		"mrs xzr, mdccsr_el0; "
+		: "+r" (x0), "+r" (x2)
+		: "r" (x1), "r" (x3), "r" (x4), "r" (x5), "r" (x7)
+		: "memory");
+
+	*out2 = x2;
+	return x0;
 }
 
-static inline void vmw_port_hb(unsigned long cmd, unsigned long in_ecx,
-			       unsigned long in_si, unsigned long in_di,
-			       unsigned long flags, unsigned long magic,
-			       unsigned long bp, u32 w7dir,
-			       unsigned long *eax, unsigned long *ebx,
-			       unsigned long *ecx, unsigned long *edx,
-			       unsigned long *si, unsigned long *di)
+static inline
+unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
+				unsigned long in3, uint32_t *out2,
+				uint32_t *out3, uint32_t *out4,
+				uint32_t *out5)
 {
-	register u64 x0 asm("x0") = magic;
+	register u64 x0 asm("x0") = VMWARE_HYPERVISOR_MAGIC;
+	register u64 x1 asm("x1") = in1;
+	register u64 x2 asm("x2") = cmd;
+	register u64 x3 asm("x3") = in3 | VMWARE_HYPERVISOR_PORT;
+	register u64 x4 asm("x4");
+	register u64 x5 asm("x5");
+	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
+				    X86_IO_W7_WITH |
+				    X86_IO_W7_DIR |
+				    (2 << X86_IO_W7_SIZE_SHIFT);
+
+	asm_inline volatile (
+		"mrs xzr, mdccsr_el0; "
+		: "+r" (x0), "+r" (x2), "+r" (x3), "=r" (x4), "=r" (x5)
+		: "r" (x1), "r" (x7)
+		: "memory");
+
+	*out2 = x2;
+	*out3 = x3;
+	*out4 = x4;
+	*out5 = x5;
+	return x0;
+}
+
+static inline
+unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, uint32_t *out1,
+				uint32_t *out2, uint32_t *out3)
+{
+	register u64 x0 asm("x0") = VMWARE_HYPERVISOR_MAGIC;
+	register u64 x1 asm("x1") = in1;
+	register u64 x2 asm("x2") = cmd;
+	register u64 x3 asm("x3") = in3 | VMWARE_HYPERVISOR_PORT;
+	register u64 x4 asm("x4") = in4;
+	register u64 x5 asm("x5") = in5;
+	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
+				    X86_IO_W7_WITH |
+				    X86_IO_W7_DIR |
+				    (2 << X86_IO_W7_SIZE_SHIFT);
+
+	asm_inline volatile (
+		"mrs xzr, mdccsr_el0; "
+		: "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3)
+		: "r" (x4), "r" (x5), "r" (x7)
+		: "memory");
+
+	*out1 = x1;
+	*out2 = x2;
+	*out3 = x3;
+	return x0;
+}
+
+static inline
+unsigned long vmware_hypercall_hb(unsigned long cmd, unsigned long in2,
+				  unsigned long in3, unsigned long in4,
+				  unsigned long in5, unsigned long in6,
+				  uint32_t *out1, int dir)
+{
+	register u64 x0 asm("x0") = VMWARE_HYPERVISOR_MAGIC;
 	register u64 x1 asm("x1") = cmd;
-	register u64 x2 asm("x2") = in_ecx;
-	register u64 x3 asm("x3") = flags | VMWARE_HYPERVISOR_PORT_HB;
-	register u64 x4 asm("x4") = in_si;
-	register u64 x5 asm("x5") = in_di;
-	register u64 x6 asm("x6") = bp;
+	register u64 x2 asm("x2") = in2;
+	register u64 x3 asm("x3") = in3 | VMWARE_HYPERVISOR_PORT_HB;
+	register u64 x4 asm("x4") = in4;
+	register u64 x5 asm("x5") = in5;
+	register u64 x6 asm("x6") = in6;
 	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
 				    X86_IO_W7_STR |
 				    X86_IO_W7_WITH |
-				    w7dir;
-
-	asm volatile("mrs xzr, mdccsr_el0 \n\t"
-		     : "+r"(x0), "+r"(x1), "+r"(x2),
-		       "+r"(x3), "+r"(x4), "+r"(x5)
-		     : "r"(x6), "r"(x7)
-		     :);
-	*eax = x0;
-	*ebx = x1;
-	*ecx = x2;
-	*edx = x3;
-	*si  = x4;
-	*di  = x5;
-}
+				    dir;
 
-#define VMW_PORT(cmd, in_ebx, in_si, in_di, flags, magic, eax, ebx, ecx, edx,  \
-		 si, di)                                                       \
-	vmw_port(cmd, in_ebx, in_si, in_di, flags, magic, &eax, &ebx, &ecx,    \
-		 &edx, &si, &di)
+	asm_inline volatile (
+		"mrs xzr, mdccsr_el0; "
+		: "+r" (x0), "+r" (x1)
+		: "r" (x2), "r" (x3), "r" (x4), "r" (x5),
+		  "r" (x6), "r" (x7)
+		: "memory");
 
-#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di, flags, magic, bp, eax, ebx, \
-		        ecx, edx, si, di)                                      \
-	vmw_port_hb(cmd, in_ecx, in_si, in_di, flags, magic, bp,               \
-                    0, &eax, &ebx, &ecx, &edx, &si, &di)
+	*out1 = x1;
+	return x0;
+}
 
-#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di, flags, magic, bp, eax, ebx,  \
-		       ecx, edx, si, di)                                       \
-	vmw_port_hb(cmd, in_ecx, in_si, in_di, flags, magic, bp,               \
-		    X86_IO_W7_DIR, &eax, &ebx, &ecx, &edx, &si, &di)
+static inline
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      uint32_t *out1)
+{
+	return vmware_hypercall_hb(cmd, in2, in3, in4, in5, in6, out1, 0);
+}
 
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     uint32_t *out1)
+{
+	return vmware_hypercall_hb(cmd, in2, in3, in4, in5, in6,  out1,
+				   X86_IO_W7_DIR);
+}
 #endif
 
 #endif /* _VMWGFX_MSG_ARM64_H */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
index 23899d743a90..13304d34cc6e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
@@ -37,191 +37,6 @@
 
 #include <asm/vmware.h>
 
-/**
- * Hypervisor-specific bi-directional communication channel.  Should never
- * execute on bare metal hardware.  The caller must make sure to check for
- * supported hypervisor before using these macros.
- *
- * The last two parameters are both input and output and must be initialized.
- *
- * @cmd: [IN] Message Cmd
- * @in_ebx: [IN] Message Len, through EBX
- * @in_si: [IN] Input argument through SI, set to 0 if not used
- * @in_di: [IN] Input argument through DI, set ot 0 if not used
- * @flags: [IN] hypercall flags + [channel id]
- * @magic: [IN] hypervisor magic value
- * @eax: [OUT] value of EAX register
- * @ebx: [OUT] e.g. status from an HB message status command
- * @ecx: [OUT] e.g. status from a non-HB message status command
- * @edx: [OUT] e.g. channel id
- * @si:  [OUT]
- * @di:  [OUT]
- */
-#define VMW_PORT(cmd, in_ebx, in_si, in_di,	\
-                 flags, magic,		\
-                 eax, ebx, ecx, edx, si, di)	\
-({						\
-        asm volatile (VMWARE_HYPERCALL :	\
-                "=a"(eax),			\
-                "=b"(ebx),			\
-                "=c"(ecx),			\
-                "=d"(edx),			\
-                "=S"(si),			\
-                "=D"(di) :			\
-                "a"(magic),			\
-                "b"(in_ebx),			\
-                "c"(cmd),			\
-                "d"(flags),			\
-                "S"(in_si),			\
-                "D"(in_di) :			\
-                "memory");			\
-})
-
-
-/**
- * Hypervisor-specific bi-directional communication channel.  Should never
- * execute on bare metal hardware.  The caller must make sure to check for
- * supported hypervisor before using these macros.
- *
- * The last 3 parameters are both input and output and must be initialized.
- *
- * @cmd: [IN] Message Cmd
- * @in_ecx: [IN] Message Len, through ECX
- * @in_si: [IN] Input argument through SI, set to 0 if not used
- * @in_di: [IN] Input argument through DI, set to 0 if not used
- * @flags: [IN] hypercall flags + [channel id]
- * @magic: [IN] hypervisor magic value
- * @bp:  [IN]
- * @eax: [OUT] value of EAX register
- * @ebx: [OUT] e.g. status from an HB message status command
- * @ecx: [OUT] e.g. status from a non-HB message status command
- * @edx: [OUT] e.g. channel id
- * @si:  [OUT]
- * @di:  [OUT]
- */
-#ifdef __x86_64__
-
-#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di,	\
-                        flags, magic, bp,		\
-                        eax, ebx, ecx, edx, si, di)	\
-({							\
-        asm volatile (					\
-		UNWIND_HINT_SAVE			\
-		"push %%rbp;"				\
-		UNWIND_HINT_UNDEFINED			\
-                "mov %12, %%rbp;"			\
-                VMWARE_HYPERCALL_HB_OUT			\
-                "pop %%rbp;"				\
-		UNWIND_HINT_RESTORE :			\
-                "=a"(eax),				\
-                "=b"(ebx),				\
-                "=c"(ecx),				\
-                "=d"(edx),				\
-                "=S"(si),				\
-                "=D"(di) :				\
-                "a"(magic),				\
-                "b"(cmd),				\
-                "c"(in_ecx),				\
-                "d"(flags),				\
-                "S"(in_si),				\
-                "D"(in_di),				\
-                "r"(bp) :				\
-                "memory", "cc");			\
-})
-
-
-#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di,	\
-                       flags, magic, bp,		\
-                       eax, ebx, ecx, edx, si, di)	\
-({							\
-        asm volatile (					\
-		UNWIND_HINT_SAVE			\
-		"push %%rbp;"				\
-		UNWIND_HINT_UNDEFINED			\
-                "mov %12, %%rbp;"			\
-                VMWARE_HYPERCALL_HB_IN			\
-                "pop %%rbp;"				\
-		UNWIND_HINT_RESTORE :			\
-                "=a"(eax),				\
-                "=b"(ebx),				\
-                "=c"(ecx),				\
-                "=d"(edx),				\
-                "=S"(si),				\
-                "=D"(di) :				\
-                "a"(magic),				\
-                "b"(cmd),				\
-                "c"(in_ecx),				\
-                "d"(flags),				\
-                "S"(in_si),				\
-                "D"(in_di),				\
-                "r"(bp) :				\
-                "memory", "cc");			\
-})
-
-#elif defined(__i386__)
-
-/*
- * In the 32-bit version of this macro, we store bp in a memory location
- * because we've ran out of registers.
- * Now we can't reference that memory location while we've modified
- * %esp or %ebp, so we first push it on the stack, just before we push
- * %ebp, and then when we need it we read it from the stack where we
- * just pushed it.
- */
-#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di,	\
-                        flags, magic, bp,		\
-                        eax, ebx, ecx, edx, si, di)	\
-({							\
-        asm volatile ("push %12;"			\
-                "push %%ebp;"				\
-                "mov 0x04(%%esp), %%ebp;"		\
-                VMWARE_HYPERCALL_HB_OUT			\
-                "pop %%ebp;"				\
-                "add $0x04, %%esp;" :			\
-                "=a"(eax),				\
-                "=b"(ebx),				\
-                "=c"(ecx),				\
-                "=d"(edx),				\
-                "=S"(si),				\
-                "=D"(di) :				\
-                "a"(magic),				\
-                "b"(cmd),				\
-                "c"(in_ecx),				\
-                "d"(flags),				\
-                "S"(in_si),				\
-                "D"(in_di),				\
-                "m"(bp) :				\
-                "memory", "cc");			\
-})
-
-
-#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di,	\
-                       flags, magic, bp,		\
-                       eax, ebx, ecx, edx, si, di)	\
-({							\
-        asm volatile ("push %12;"			\
-                "push %%ebp;"				\
-                "mov 0x04(%%esp), %%ebp;"		\
-                VMWARE_HYPERCALL_HB_IN			\
-                "pop %%ebp;"				\
-                "add $0x04, %%esp;" :			\
-                "=a"(eax),				\
-                "=b"(ebx),				\
-                "=c"(ecx),				\
-                "=d"(edx),				\
-                "=S"(si),				\
-                "=D"(di) :				\
-                "a"(magic),				\
-                "b"(cmd),				\
-                "c"(in_ecx),				\
-                "d"(flags),				\
-                "S"(in_si),				\
-                "D"(in_di),				\
-                "m"(bp) :				\
-                "memory", "cc");			\
-})
-#endif /* defined(__i386__) */
-
 #endif /* defined(__i386__) || defined(__x86_64__) */
 
 #endif /* _VMWGFX_MSG_X86_H */
-- 
2.39.0

