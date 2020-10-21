Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECA294C4E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 14:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4A36EAAB;
	Wed, 21 Oct 2020 12:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381D86EAAB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 12:12:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF70BB30E;
 Wed, 21 Oct 2020 12:12:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: b.zolnierkie@samsung.com, gwan-gyeong.mun@intel.com, sam@ravnborg.org,
 daniel.vetter@ffwll.ch, bernard@vivo.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH] drivers/video: Fix -Wstringop-truncation in hdmi.c
Date: Wed, 21 Oct 2020 14:12:41 +0200
Message-Id: <20201021121241.17623-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trying to copy into the string fields with strncpy() gives a warning from
gcc. Both fields are part of a packed HDMI header and do not require a
terminating \0 character.

../drivers/video/hdmi.c: In function 'hdmi_spd_infoframe_init':
../drivers/video/hdmi.c:230:2: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
  230 |  strncpy(frame->vendor, vendor, sizeof(frame->vendor));
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/video/hdmi.c:231:2: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
  231 |  strncpy(frame->product, product, sizeof(frame->product));
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Just use memcpy() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/hdmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index b7a1d6fae90d..1e4cb63d0d11 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -221,14 +221,18 @@ EXPORT_SYMBOL(hdmi_avi_infoframe_pack);
 int hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
 			    const char *vendor, const char *product)
 {
+	size_t len;
+
 	memset(frame, 0, sizeof(*frame));
 
 	frame->type = HDMI_INFOFRAME_TYPE_SPD;
 	frame->version = 1;
 	frame->length = HDMI_SPD_INFOFRAME_SIZE;
 
-	strncpy(frame->vendor, vendor, sizeof(frame->vendor));
-	strncpy(frame->product, product, sizeof(frame->product));
+	len = strlen(vendor);
+	memcpy(frame->vendor, vendor, min(len, sizeof(frame->vendor)));
+	len = strlen(product);
+	memcpy(frame->product, product, min(len, sizeof(frame->product)));
 
 	return 0;
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
