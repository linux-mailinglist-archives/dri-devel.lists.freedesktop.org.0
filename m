Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59232B842
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FD06E973;
	Wed,  3 Mar 2021 13:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761E36E947
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l12so23738655wry.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWkqFrvWeK76Y3iFCArRn0HDFC1AVp5EXu1AxGszpQA=;
 b=JDYmcNANhdbTHQufB6+ZlXI755geSXoJ34u2EDuKznl+G+oe16GAYHFpK8LqJ9InRv
 fb+qv2vU1wNpRN8GkIu8B78Z9MhFPYLvQ5RZBEPVwe9xuPfwJW7Uge8z3AMY/48S0sss
 L7Sfc3DpMwdYY3ITiVVa8R8wd1eD+keB1/dsz1g5oBRdrkgFPTiYrxT6iXC0QT2JHt8V
 uCSetT/eGRfMpqBjZy4oegCnccSqN6Qit6SfgAMwLFF9LOesQL3inwicuh4H/Ok8US1J
 pwqppOTdwzXNgF2uSPZdxJ9pkMK7AOSjheVbugoiIyOollZSLbhMV4S3GJ3PE3nHwso+
 +WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWkqFrvWeK76Y3iFCArRn0HDFC1AVp5EXu1AxGszpQA=;
 b=YCQVrld8oIQw7EZ9WdJH/liFeinoa0bNoHCN9KkQ+JPVpkCGS2KfjAAVjBPhRAzuz/
 pbunP/tNxnz6TRjtX3at4jyfyXN0s1IIlkAKzhheJPHXWXGfaAuz7uiPzz3t/3xqAiuv
 5raYqfN+OVou4K4D6YFMSpUtO19Jz0mKp+mZ87QWTBecoW1SYhmF0eWnp+7dIwNT6UGS
 /S7ZN+pWsUQhxedQ/pdCygm3Hh94452fwZ6LvkMDbuwSFTkQDctboVq4BUUSInFctxpF
 rNBR6EvjexdlAMrChDnEQ8ytGyL+qsFQOwd4/JJUI3BiVNsCVY2EbT3MoYy1lBUDYA0G
 /isg==
X-Gm-Message-State: AOAM530mhc1HVjeDcv8xCrWGYbyJkfOj/eNZXI6LIqYsqwo1FFKn3j95
 OiaFuxJB/fVy/5RSd7E9iEcuS0Os0cWvCA==
X-Google-Smtp-Source: ABdhPJw7H07jnRLOoG6m43qVmpJvmWYKHbzSMHAjc3d+Wg2Kjmi+Ql4lLmruLVzvUO8jjio1P0hjCg==
X-Received: by 2002:a5d:528f:: with SMTP id c15mr27393903wrv.142.1614779057184; 
 Wed, 03 Mar 2021 05:44:17 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 41/53] drm/vmwgfx/vmwgfx_cmdbuf: Fix a bunch of missing or
 incorrectly formatted/named params
Date: Wed,  3 Mar 2021 13:43:07 +0000
Message-Id: <20210303134319.3160762-42-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:58: warning: Function parameter or member 'block_submission' not described in 'vmw_cmdbuf_context'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:109: warning: cannot understand function prototype: 'struct vmw_cmdbuf_man '
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:164: warning: Function parameter or member 'handle' not described in 'vmw_cmdbuf_header'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:257: warning: Function parameter or member 'header' not described in '__vmw_cmdbuf_header_free'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:380: warning: Function parameter or member 'notempty' not described in 'vmw_cmdbuf_ctx_process'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1168: warning: Function parameter or member 'context' not described in 'vmw_cmdbuf_preempt'
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1193: warning: Function parameter or member 'context' not described in 'vmw_cmdbuf_startstop'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-38-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 45fbc41440f1e..3158924ffa852 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -48,6 +48,7 @@
  * @hw_submitted: List of command buffers submitted to hardware.
  * @preempted: List of preempted command buffers.
  * @num_hw_submitted: Number of buffers currently being processed by hardware
+ * @block_submission: Identifies a block command submission.
  */
 struct vmw_cmdbuf_context {
 	struct list_head submitted;
@@ -58,7 +59,7 @@ struct vmw_cmdbuf_context {
 };
 
 /**
- * struct vmw_cmdbuf_man: - Command buffer manager
+ * struct vmw_cmdbuf_man - Command buffer manager
  *
  * @cur_mutex: Mutex protecting the command buffer used for incremental small
  * kernel command submissions, @cur.
@@ -143,7 +144,7 @@ struct vmw_cmdbuf_man {
  * @cb_context: The device command buffer context.
  * @list: List head for attaching to the manager lists.
  * @node: The range manager node.
- * @handle. The DMA address of @cb_header. Handed to the device on command
+ * @handle: The DMA address of @cb_header. Handed to the device on command
  * buffer submission.
  * @cmd: Pointer to the command buffer space of this buffer.
  * @size: Size of the command buffer space of this buffer.
@@ -249,7 +250,7 @@ static void vmw_cmdbuf_header_inline_free(struct vmw_cmdbuf_header *header)
  * __vmw_cmdbuf_header_free - Free a struct vmw_cmdbuf_header  and its
  * associated structures.
  *
- * header: Pointer to the header to free.
+ * @header: Pointer to the header to free.
  *
  * For internal use. Must be called with man::lock held.
  */
@@ -365,10 +366,11 @@ static void vmw_cmdbuf_ctx_submit(struct vmw_cmdbuf_man *man,
 }
 
 /**
- * vmw_cmdbuf_ctx_submit: Process a command buffer context.
+ * vmw_cmdbuf_ctx_process - Process a command buffer context.
  *
  * @man: The command buffer manager.
  * @ctx: The command buffer context.
+ * @notempty: Pass back count of non-empty command submitted lists.
  *
  * Submit command buffers to hardware if possible, and process finished
  * buffers. Typically freeing them, but on preemption or error take
@@ -1161,6 +1163,7 @@ static int vmw_cmdbuf_send_device_command(struct vmw_cmdbuf_man *man,
  * context.
  *
  * @man: The command buffer manager.
+ * @context: Device context to pass command through.
  *
  * Synchronously sends a preempt command.
  */
@@ -1184,6 +1187,7 @@ static int vmw_cmdbuf_preempt(struct vmw_cmdbuf_man *man, u32 context)
  * context.
  *
  * @man: The command buffer manager.
+ * @context: Device context to start/stop.
  * @enable: Whether to enable or disable the context.
  *
  * Synchronously sends a device start / stop context command.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
