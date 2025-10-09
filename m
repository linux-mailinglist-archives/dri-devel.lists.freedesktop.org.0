Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F974BC9058
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9C210EA0E;
	Thu,  9 Oct 2025 12:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LxfF2qG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F56B10EA11
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyzFZxJbO2L5avzgNukRA/OHc7c+vIBxWzW6CopjW/U=;
 b=LxfF2qG58XU55Lx3CEY7AxaDL+/Gqk6jF6+f9HpbJybSC/wpXzVsFi9DjE+0YJ/vkDtdxM
 fanpHD+NOb1yFZ4pan9X36uUgFGYUgIFDNTShbTZymotuRpHeyH11AyfVl62baprlLEDYI
 cNa9oYSx1afxHf16muKkaubwJCgQ5qw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-Ys3Hi_-hOVit_MVKA0Ie8g-1; Thu,
 09 Oct 2025 08:30:39 -0400
X-MC-Unique: Ys3Hi_-hOVit_MVKA0Ie8g-1
X-Mimecast-MFC-AGG-ID: Ys3Hi_-hOVit_MVKA0Ie8g_1760013038
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 027001800587; Thu,  9 Oct 2025 12:30:38 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.212])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A9328180035E; Thu,  9 Oct 2025 12:30:34 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH 6/6] drm/panic: Fix 24bit pixel crossing page boundaries
Date: Thu,  9 Oct 2025 14:24:53 +0200
Message-ID: <20251009122955.562888-7-jfalempe@redhat.com>
In-Reply-To: <20251009122955.562888-1-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

When using page list framebuffer, and using RGB888 format, some
pixels can cross the page boundaries, and this case was not handled,
leading to writing 1 or 2 bytes on the next virtual address.

Add a check and a specific function to handle this case.

Fixes: c9ff2808790f0 ("drm/panic: Add support to scanout buffer as array of pages")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 46 +++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index bc5158683b2b..d4b6ea42db0f 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -174,6 +174,33 @@ static void drm_panic_write_pixel24(void *vaddr, unsigned int offset, u32 color)
 	*p = color & 0xff;
 }
 
+/*
+ * Special case if the pixel crosses page boundaries
+ */
+static void drm_panic_write_pixel24_xpage(void *vaddr, struct page *next_page,
+					  unsigned int offset, u32 color)
+{
+	u8 *vaddr2;
+	u8 *p = vaddr + offset;
+
+	vaddr2 = kmap_local_page_try_from_panic(next_page);
+
+	*p++ = color & 0xff;
+	color >>= 8;
+
+	if (offset == PAGE_SIZE - 1)
+		p = vaddr2;
+
+	*p++ = color & 0xff;
+	color >>= 8;
+
+	if (offset == PAGE_SIZE - 2)
+		p = vaddr2;
+
+	*p = color & 0xff;
+	kunmap_local(vaddr2);
+}
+
 static void drm_panic_write_pixel32(void *vaddr, unsigned int offset, u32 color)
 {
 	u32 *p = vaddr + offset;
@@ -231,7 +258,14 @@ static void drm_panic_blit_page(struct page **pages, unsigned int dpitch,
 					page = new_page;
 					vaddr = kmap_local_page_try_from_panic(pages[page]);
 				}
-				if (vaddr)
+				if (!vaddr)
+					continue;
+
+				// Special case for 24bit, as a pixel might cross page boundaries
+				if (cpp == 3 && offset + 3 > PAGE_SIZE)
+					drm_panic_write_pixel24_xpage(vaddr, pages[page + 1],
+								      offset, fg32);
+				else
 					drm_panic_write_pixel(vaddr, offset, fg32, cpp);
 			}
 		}
@@ -321,7 +355,15 @@ static void drm_panic_fill_page(struct page **pages, unsigned int dpitch,
 				page = new_page;
 				vaddr = kmap_local_page_try_from_panic(pages[page]);
 			}
-			drm_panic_write_pixel(vaddr, offset, color, cpp);
+			if (!vaddr)
+				continue;
+
+			// Special case for 24bit, as a pixel might cross page boundaries
+			if (cpp == 3 && offset + 3 > PAGE_SIZE)
+				drm_panic_write_pixel24_xpage(vaddr, pages[page + 1],
+							      offset, color);
+			else
+				drm_panic_write_pixel(vaddr, offset, color, cpp);
 		}
 	}
 	if (vaddr)
-- 
2.51.0

