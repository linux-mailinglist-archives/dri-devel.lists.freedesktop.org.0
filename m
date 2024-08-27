Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50329607C3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9D710E2E6;
	Tue, 27 Aug 2024 10:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JTYATEcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E1110E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724755537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uCxCKM9tr/DIaXbgLi/KJ7H0CCAJnocDLV63/pu+C5s=;
 b=JTYATEcOQK9Kbmr0JySD6/sKRqUinRXRhmADugVDH3H6TlB0o62zdihOSzb21wSG3ADFoX
 cNyagiyKo5i4xt7j/OBa3L/4/qLu4rKBNddlrPziahLkBVNi6tw40cjIm0c02JvSdY8H9V
 lwwkih5ipFVxvYjP1WWspg74RWuzH0E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-aGtvpUfoMcGUSNtMt694NQ-1; Tue,
 27 Aug 2024 06:45:34 -0400
X-MC-Unique: aGtvpUfoMcGUSNtMt694NQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 198A21955F06; Tue, 27 Aug 2024 10:45:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 367541955F1B; Tue, 27 Aug 2024 10:45:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH resend] drm/vboxvideo: Replace fake VLA at end of
 vbva_mouse_pointer_shape with real VLA
Date: Tue, 27 Aug 2024 12:45:23 +0200
Message-ID: <20240827104523.17442-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the fake VLA at end of the vbva_mouse_pointer_shape shape with
a real VLA to fix a "memcpy: detected field-spanning write error" warning:

[   13.319813] memcpy: detected field-spanning write (size 16896) of single field "p->data" at drivers/gpu/drm/vboxvideo/hgsmi_base.c:154 (size 4)
[   13.319841] WARNING: CPU: 0 PID: 1105 at drivers/gpu/drm/vboxvideo/hgsmi_base.c:154 hgsmi_update_pointer_shape+0x192/0x1c0 [vboxvideo]
[   13.320038] Call Trace:
[   13.320173]  hgsmi_update_pointer_shape [vboxvideo]
[   13.320184]  vbox_cursor_atomic_update [vboxvideo]

Note as mentioned in the added comment it seems the original length
calculation for the allocated and send hgsmi buffer is 4 bytes too large.
Changing this is not the goal of this patch, so this behavior is kept.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Resend, can I get an ack from someone to push this to drm-misc-next please ?

(this has been tested with a vboxsvga adapter in a vbox vm)
---
 drivers/gpu/drm/vboxvideo/hgsmi_base.c | 10 +++++++++-
 drivers/gpu/drm/vboxvideo/vboxvideo.h  |  4 +---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_base.c b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
index 8c041d7ce4f1..87dccaecc3e5 100644
--- a/drivers/gpu/drm/vboxvideo/hgsmi_base.c
+++ b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
@@ -139,7 +139,15 @@ int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
 		flags |= VBOX_MOUSE_POINTER_VISIBLE;
 	}
 
-	p = hgsmi_buffer_alloc(ctx, sizeof(*p) + pixel_len, HGSMI_CH_VBVA,
+	/*
+	 * The 4 extra bytes come from switching struct vbva_mouse_pointer_shape
+	 * from having a 4 bytes fixed array at the end to using a proper VLA
+	 * at the end. These 4 extra bytes were not subtracted from sizeof(*p)
+	 * before the switch to the VLA, so this way the behavior is unchanged.
+	 * Chances are these 4 extra bytes are not necessary but they are kept
+	 * to avoid regressions.
+	 */
+	p = hgsmi_buffer_alloc(ctx, sizeof(*p) + pixel_len + 4, HGSMI_CH_VBVA,
 			       VBVA_MOUSE_POINTER_SHAPE);
 	if (!p)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
index f60d82504da0..79ec8481de0e 100644
--- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
+++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
@@ -351,10 +351,8 @@ struct vbva_mouse_pointer_shape {
 	 * Bytes in the gap between the AND and the XOR mask are undefined.
 	 * XOR mask scanlines have no gap between them and size of XOR mask is:
 	 * xor_len = width * 4 * height.
-	 *
-	 * Preallocate 4 bytes for accessing actual data as p->data.
 	 */
-	u8 data[4];
+	u8 data[];
 } __packed;
 
 /* pointer is visible */
-- 
2.46.0

