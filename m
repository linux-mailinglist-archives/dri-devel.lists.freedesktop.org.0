Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1427907C2E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605410EB6B;
	Thu, 13 Jun 2024 19:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PmZrk4X1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AD810EB6A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:33 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6b08d661dbaso23029306d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306252; x=1718911052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OeFOBxZFxTzdnnXRsZnjMBkE00GC4mlA0ngLj7a9ZUQ=;
 b=PmZrk4X1+1B6N45cvpGObL8LgqLd6cNfce6+KnSVlbBbniqjrCDQtavEL/yJB6nc8d
 WyTi5ijDVr8mfzUmMN1dkvPGfGRHuRbf3u8uF97wSmKaU7kGj/SeFV+W/HlVNj/61beS
 fL3c39NE6uGlM+v32sDX3PhF1deJR3sjdYCCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306252; x=1718911052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OeFOBxZFxTzdnnXRsZnjMBkE00GC4mlA0ngLj7a9ZUQ=;
 b=oIqJ60ITHggrriTHt7GtOkIeMQMhvbA0Y+OOeVD13cKxvRwcKFGn7Tm7ktBzXumi4D
 7Kq34pxanagiCaipoxW38C/LO1ga6bAZb3R32pwfH5Iilkh6pYJ5x/GE3UpkbMLbj29q
 dRY6t842I524zm96125iQPOJ/CSG8xoL1pJWGwA8TGMl+FDk+tKqZ02KhvFumabbt21G
 A5wUYOfo1kbAXhdgmU8r8WXXnQvwK4tU2f/hDRrbwJZ2nytS8CdidlHQMn+lhmoqgH7z
 tUNxCxskLvlHNbJemsvGs/rH/5wJSdXFfolxct9YrHkyeXxQz3DH+KbEPQxUt71GeW02
 9FYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNx9SXaVSMm5ANxRC9yKzqIew1pw462ZyMoHmqtaYH9O3mCG6TCITyLQMYJkfb2XQOru0Mx5AJRvwLMcJZmGCQSr20Jf5y49AHcZ58h12b
X-Gm-Message-State: AOJu0YxYiAAIAxX4LMb5v4GZB6CwgZCPp0GNFluieBJnC78fL/WRzxE6
 f3U9JaXe96FVhJHQvg9gMGoEkbeXiHyIh548izFncU7vEChf6WapouH/+Jl4Ng==
X-Google-Smtp-Source: AGHT+IGEuud6+wiphVPqkwT7gf/jNJfRrkzAfqu7P2KAvpuUbXds1IAUqsI31S2W7cZJBuignrTM8w==
X-Received: by 2002:a05:6214:2a47:b0:6b0:7365:dde0 with SMTP id
 6a1803df08f44-6b2a33de160mr68380586d6.18.1718306251169; 
 Thu, 13 Jun 2024 12:17:31 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:30 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH v11 4/8] drm/vmwgfx: Use VMware hypercall API
Date: Thu, 13 Jun 2024 12:16:46 -0700
Message-Id: <20240613191650.9913-5-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code.

drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h: implement arm64 variant
of vmware_hypercall. And keep it here until introduction of ARM64
VMWare hypervisor interface.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 +++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 196 +++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 --------------------
 3 files changed, 196 insertions(+), 358 deletions(-)

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
index 4f40167ad61f..3c78e9338b54 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
@@ -34,6 +34,8 @@
 #define VMWARE_HYPERVISOR_HB  BIT(0)
 #define VMWARE_HYPERVISOR_OUT BIT(1)
 
+#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
+
 #define X86_IO_MAGIC 0x86
 
 #define X86_IO_W7_SIZE_SHIFT 0
@@ -45,86 +47,158 @@
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
+				unsigned long in5, u32 *out2)
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
+				unsigned long in3, u32 *out2,
+				u32 *out3, u32 *out4, u32 *out5)
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
+				unsigned long in5, u32 *out1,
+				u32 *out2, u32 *out3)
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
+				  u32 *out1, int dir)
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
+				      u32 *out1)
+{
+	return vmware_hypercall_hb(cmd, in2, in3, in4, in5, in6, out1, 0);
+}
 
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     u32 *out1)
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
2.39.4

