Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604551FAC6
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 13:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859510E92B;
	Mon,  9 May 2022 11:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7910E92B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652094272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ok1FpLZDp0Pu25TOtufPu/EQBWPCLevxhLnCIaojV84=;
 b=NuOqtMLpx9i5RPHN77pFy0aJxGRtT5avNi7gQLs//O9CpHXuZL9NUaBx4NA5eKxJfrYlIN
 ufHjuUNfbvPVvXuC3NcgsLMo6y/dn7DeMUZNR6pauz8+aijfXQ2n5ltRLS6AElb9LjGd1j
 oGs++MFiX42qLhqkpGTSS3GhxZvG5jQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-m7tP0AjYMGScsomGoCkqvA-1; Mon, 09 May 2022 07:04:29 -0400
X-MC-Unique: m7tP0AjYMGScsomGoCkqvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 789BB86B8AC;
 Mon,  9 May 2022 11:04:28 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 410482166B2F;
 Mon,  9 May 2022 11:04:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	Zack Rusin <zackr@vmware.com>
Subject: [PATCH] drm/vmwgfx: Fix passing partly uninitialized drm_mode_fb_cmd2
 struct
Date: Mon,  9 May 2022 13:04:25 +0200
Message-Id: <20220509110425.165537-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmw_fb_kms_framebuffer() declares a drm_mode_fb_cmd2 struct on the stack
without zero-ing it and then continues with initializing only some fields.

This leads to drm_mode_fb_cmd2.modifiers[0] containing garbage,
which eventually gets used by drm_helper_mode_fill_fb_struct() to
set fb->modifier when leads to the following atomic-check failure:

vmwgfx 0000:00:02.0: [drm:drm_atomic_check_only] [PLANE:34:plane-0]
 invalid pixel format XR24 little-endian (0x34325258),
 modifier 0xffff94d64719e000
fbcon_init: detected unhandled fb_set_par error, error code -22

Which causes the fbdev emulation and thus also fbcon to not work.

Initialize the struct with all zeros to fix this.

Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2072556
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
While working on this I noticed that at least the vmwgfx_fb.c code
has a tendency to declare structs on the stack without zero-ing
them, instead relying on manually initializing all the fields.
Specifically struct drm_mode_set is used multiple times like this
and there also is an occurence of struct drm_clip being used
like this, but that one is less worrying.

This is a bad idea because some of these structs may get new fields
added later. Someone really should do an audit of the entire
vmwgfx code for this pattern and make sure all structs declared
on the stack are zero-ed before use.
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 8ee34576c7d0..7509013818ba 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -483,7 +483,7 @@ static int vmw_fb_kms_detach(struct vmw_fb_par *par,
 
 static int vmw_fb_kms_framebuffer(struct fb_info *info)
 {
-	struct drm_mode_fb_cmd2 mode_cmd;
+	struct drm_mode_fb_cmd2 mode_cmd = {};
 	struct vmw_fb_par *par = info->par;
 	struct fb_var_screeninfo *var = &info->var;
 	struct drm_framebuffer *cur_fb;
-- 
2.36.0

