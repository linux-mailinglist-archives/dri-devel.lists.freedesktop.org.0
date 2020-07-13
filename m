Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8521E97A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F6F6E94C;
	Tue, 14 Jul 2020 07:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987C6E237
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 12:49:34 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id BD155BC069;
 Mon, 13 Jul 2020 12:49:31 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vboxvideo: Replace HTTP links with HTTPS ones
Date: Mon, 13 Jul 2020 14:49:23 +0200
Message-Id: <20200713124923.34282-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 drivers/gpu/drm/vboxvideo/hgsmi_defs.h | 2 +-
 drivers/gpu/drm/vboxvideo/vbox_hgsmi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_defs.h b/drivers/gpu/drm/vboxvideo/hgsmi_defs.h
index 6c8df1cdb087..3cb52f2b2274 100644
--- a/drivers/gpu/drm/vboxvideo/hgsmi_defs.h
+++ b/drivers/gpu/drm/vboxvideo/hgsmi_defs.h
@@ -58,7 +58,7 @@ struct hgsmi_buffer_tail {
 	/* Reserved, must be initialized to 0. */
 	u32 reserved;
 	/*
-	 * One-at-a-Time Hash: http://www.burtleburtle.net/bob/hash/doobs.html
+	 * One-at-a-Time Hash: https://www.burtleburtle.net/bob/hash/doobs.html
 	 * Over the header, offset and for first 4 bytes of the tail.
 	 */
 	u32 checksum;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c b/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c
index 94b60654a012..a9ca4d0c3eca 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_hgsmi.c
@@ -8,7 +8,7 @@
 #include "vboxvideo_vbe.h"
 #include "hgsmi_defs.h"
 
-/* One-at-a-Time Hash from http://www.burtleburtle.net/bob/hash/doobs.html */
+/* One-at-a-Time Hash from https://www.burtleburtle.net/bob/hash/doobs.html */
 static u32 hgsmi_hash_process(u32 hash, const u8 *data, int size)
 {
 	while (size--) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
