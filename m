Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B670A49881
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0C10EC78;
	Fri, 28 Feb 2025 11:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="XrJpBqmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8510EAA0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:content-type
 :content-type:mime-version:references:in-reply-to:x-mailer
 :message-id:date:date:subject:subject:from:from:received; s=s1;
 t=1740654232; x=1742468633; bh=nNe+wr4gCcvck0Cc7fjEsivdn53BdJTH
 YGszCMg7gls=; b=XrJpBqmCQCE96GxuZrGtmqfVvB7eTb043JYGjGCpOWIqQd4F
 DT7LKJBJi7EJXfvhiDOPahB/A3uWhmuBrnlutVOIaahFdv1IxZETvP0PnfMVQzcC
 7Aa6QsZ9tFqU5/715OsTlucJgQcvvnUsuE0c8IVduUE5cOaLwKZ/YbtFsC8=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id E48902C0130
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:51 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276637; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>,
 Frediano Ziglio <freddy77@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH 02/10] dcc: Check to see if the client supports multiple
 codecs (v2)
Date: Thu, 27 Feb 2025 12:03:24 +0100
Message-ID: <7596dfeff23c76c0309097e67e2207365cef680e.1740651328.git.michael.scherle@rz.uni-freiburg.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
References: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

We need to determine if the client is new enough to support multiple
codecs -- which might include any of the Gstreamer based ones.

v2: (suggestions and fixups from Frediano)
- Add is_gl_client() method to DisplayChannelClient instead of a
  dcc_is_gl_client() function.
- Avoid the usage of XXX_CAST macro.

Cc: Frediano Ziglio <freddy77@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Acked-by: Frediano Ziglio <freddy77@gmail.com>
---
 server/dcc.cpp | 22 ++++++++++++----------
 server/dcc.h   |  6 ++++++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/server/dcc.cpp b/server/dcc.cpp
index b04e5bc0..edec429d 100644
--- a/server/dcc.cpp
+++ b/server/dcc.cpp
@@ -494,29 +494,31 @@ RedSurfaceDestroyItem::RedSurfaceDestroyItem(uint32_t surface_id)
 
 RedPipeItemPtr dcc_gl_scanout_item_new(RedChannelClient *rcc, void *data, int num)
 {
-    /* FIXME: on !unix peer, start streaming with a video codec */
-    if (!red_stream_is_plain_unix(rcc->get_stream()) ||
-        !rcc->test_remote_cap(SPICE_DISPLAY_CAP_GL_SCANOUT)) {
+    auto dcc = static_cast<DisplayChannelClient *>(rcc);
+
+    if (dcc->is_gl_client()) {
+        return red::make_shared<RedGlScanoutUnixItem>();
+    } else if (rcc->test_remote_cap(SPICE_DISPLAY_CAP_MULTI_CODEC)) {
+        return RedPipeItemPtr();
+    } else {
         red_channel_warning(rcc->get_channel(),
-                            "FIXME: client does not support GL scanout");
+                            "Client does not support GL scanout or multiple codecs");
         rcc->disconnect();
         return RedPipeItemPtr();
     }
-
-    return red::make_shared<RedGlScanoutUnixItem>();
 }
 
 XXX_CAST(RedChannelClient, DisplayChannelClient, DISPLAY_CHANNEL_CLIENT);
 
 RedPipeItemPtr dcc_gl_draw_item_new(RedChannelClient *rcc, void *data, int num)
 {
-    DisplayChannelClient *dcc = DISPLAY_CHANNEL_CLIENT(rcc);
+    auto dcc = static_cast<DisplayChannelClient *>(rcc);
     auto draw = static_cast<const SpiceMsgDisplayGlDraw *>(data);
 
-    if (!red_stream_is_plain_unix(rcc->get_stream()) ||
-        !rcc->test_remote_cap(SPICE_DISPLAY_CAP_GL_SCANOUT)) {
+    if (!dcc->is_gl_client() &&
+        !rcc->test_remote_cap(SPICE_DISPLAY_CAP_MULTI_CODEC)) {
         red_channel_warning(rcc->get_channel(),
-                            "FIXME: client does not support GL scanout");
+                            "Client does not support GL scanout or multiple codecs");
         rcc->disconnect();
         return RedPipeItemPtr();
     }
diff --git a/server/dcc.h b/server/dcc.h
index bb441905..4e7150d5 100644
--- a/server/dcc.h
+++ b/server/dcc.h
@@ -47,6 +47,12 @@ public:
                          spice_wan_compression_t zlib_glz_state);
     virtual void disconnect() override;
 
+    bool is_gl_client()
+    {
+        return red_stream_is_plain_unix(get_stream()) &&
+           test_remote_cap(SPICE_DISPLAY_CAP_GL_SCANOUT);
+    }
+
 protected:
     virtual bool handle_message(uint16_t type, uint32_t size, void *msg) override;
     virtual bool config_socket() override;
-- 
2.48.1

