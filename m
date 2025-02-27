Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F7A4987C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2A510EA49;
	Fri, 28 Feb 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="fXW7mjVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C7F10EAA7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received; s=s1; t=1740654236; x=1742468637;
 bh=JqrDFvKMMAgRlPdNufuNTqNV47pR6HSL7IFjhAPJ/+I=; b=fXW7mjVEDQ4e
 ght0uH6mNmCHcvRV7exrpsTdmS4BXlg7Vl1YCldcUnlikciBie3Sv0rQHvB1xd97
 m/49SS5zAKiIr6eevFyjTsgre2KU5mIhdvUvO+ox82JrjrHwZxNpPD1Iu2/l/YNF
 ZboxSd46UeSKyxJR35Pvv2PRKJEm7uo=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id AC63F2C013D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:56 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276627; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
Subject: [PATCH 09/10] gstreamer-encoder: Include dmabuf encoding
 conditionally for Linux
Date: Thu, 27 Feb 2025 12:03:31 +0100
Message-ID: <036fa70a60bc9f657476280de7494791b5cf2c1c.1740651328.git.michael.scherle@rz.uni-freiburg.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
References: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
MIME-Version: 1.0
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

add dmabuf encoding if `drm/drm_fourcc.h` is present and
gstreamer is at least 1.24 due to
`gst_video_dma_drm_fourcc_to_format()`.

Signed-off-by: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
---
 meson.build                | 10 +++++++++-
 server/gstreamer-encoder.c | 34 +++++++++++++++++++++++++++-------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index d6aea60a..d5591d2a 100644
--- a/meson.build
+++ b/meson.build
@@ -131,15 +131,23 @@ endforeach
 spice_server_has_gstreamer = false
 spice_server_gst_version = get_option('gstreamer')
 if spice_server_gst_version != 'no'
+  gstreamer_version = ''
   gst_deps = ['gstreamer', 'gstreamer-base', 'gstreamer-app', 'gstreamer-video', 'gstreamer-allocators']
   foreach dep : gst_deps
     dep = '@0@-@1@'.format(dep, spice_server_gst_version)
-    spice_server_deps += dependency(dep)
+    dep = dependency(dep)
+    if gstreamer_version == '' or  dep.version().version_compare('< ' + gstreamer_version)
+      gstreamer_version = dep.version()
+    endif
+    spice_server_deps += dep
   endforeach
   spice_server_deps += dependency('orc-0.4')
 
   gst_def = 'HAVE_GSTREAMER_1_0'
   spice_server_config_data.set(gst_def, '1')
+  if compiler.has_header('drm/drm_fourcc.h') and gstreamer_version.version_compare('>= 1.24')
+     spice_server_config_data.set('HAVE_GSTREAMER_DMABUF_ENCODING', '1')
+  endif
   spice_server_has_gstreamer = true
 endif
 
diff --git a/server/gstreamer-encoder.c b/server/gstreamer-encoder.c
index 196b27ab..a83cf846 100644
--- a/server/gstreamer-encoder.c
+++ b/server/gstreamer-encoder.c
@@ -27,11 +27,13 @@
 #  pragma GCC diagnostic ignored "-Wunused-const-variable"
 #endif
 #include <gst/gst.h>
-#include <gst/allocators/gstdmabuf.h>
 #include <gst/app/gstappsrc.h>
 #include <gst/app/gstappsink.h>
 #include <gst/video/video.h>
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
 #include <gst/video/video-info-dma.h>
+#include <gst/allocators/gstdmabuf.h>
+#endif
 #include <orc/orcprogram.h>
 #if defined(__GNUC__) && (__GNUC__ >= 6)
 #  pragma GCC diagnostic pop
@@ -41,7 +43,12 @@
 #include "video-encoder.h"
 #include "utils.h"
 #include "common/udev.h"
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
 #include "drm/drm_fourcc.h"
+#endif
+#ifndef DRM_FORMAT_INVALID
+#define DRM_FORMAT_INVALID 0
+#endif
 
 #define SPICE_GST_DEFAULT_FPS 30
 
@@ -793,6 +800,7 @@ static const SpiceFormatForGStreamer *map_format(SpiceBitmapFmt format)
     return GSTREAMER_FORMAT_INVALID;
 }
 
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
 static SpiceFormatForGStreamer drm_format_map[] =  {
     DRM_FMT_DESC(DRM_FORMAT_INVALID,  0),
     DRM_FMT_DESC(DRM_FORMAT_XRGB8888, 32),
@@ -822,7 +830,7 @@ static const SpiceFormatForGStreamer *map_drm_format(uint32_t fourcc)
                 }
 
                 drm_format_map[i].gst_format = gst_format;
-                strncpy(drm_format_map[i].format,
+                g_strlcpy(drm_format_map[i].format,
                         gst_video_format_to_string(gst_format),
                         format_size - 1);
                 drm_format_map[i].format[format_size - 1] = '\0';
@@ -833,6 +841,7 @@ static const SpiceFormatForGStreamer *map_drm_format(uint32_t fourcc)
 
     return GSTREAMER_DRM_FORMAT_INVALID;
 }
+#endif
 
 static void set_appsrc_caps(SpiceGstEncoder *encoder)
 {
@@ -1579,7 +1588,9 @@ static void spice_gst_encoder_destroy(VideoEncoder *video_encoder)
 {
     SpiceGstEncoder *encoder = (SpiceGstEncoder*)video_encoder;
 
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
     gst_object_unref(encoder->allocator);
+#endif
     free_pipeline(encoder);
     pthread_mutex_destroy(&encoder->outbuf_mutex);
     pthread_cond_destroy(&encoder->outbuf_cond);
@@ -1619,12 +1630,17 @@ spice_gst_encoder_configure_pipeline(SpiceGstEncoder *encoder,
 
     if (spice_format != SPICE_BITMAP_FMT_INVALID) {
         format = map_format(spice_format);
-    } else if (drm_format != DRM_FORMAT_INVALID) {
+    }
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
+    else if (drm_format != DRM_FORMAT_INVALID) {
         format = map_drm_format(drm_format);
     }
-
-    if (format == GSTREAMER_FORMAT_INVALID ||
-        format == GSTREAMER_DRM_FORMAT_INVALID) {
+#endif
+    if (format == GSTREAMER_FORMAT_INVALID
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
+        || format == GSTREAMER_DRM_FORMAT_INVALID
+#endif
+        ) {
         spice_warning("unable to map format type %d or %u",
                       spice_format, drm_format);
         encoder->errors = 4;
@@ -1738,6 +1754,7 @@ spice_gst_encoder_encode_frame(VideoEncoder *video_encoder,
     return rc;
 }
 
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
 static void
 spice_gst_mem_free_cb(VideoEncoderDmabufData *dmabuf_data, GstMiniObject *obj)
 {
@@ -1806,6 +1823,7 @@ spice_gst_encoder_encode_dmabuf(VideoEncoder *video_encoder,
     spice_gst_encoder_add_frame(encoder, outbuf, start, frame_mm_time);
     return rc;
 }
+#endif
 
 static void spice_gst_encoder_client_stream_report(VideoEncoder *video_encoder,
                                              uint32_t num_frames,
@@ -1997,7 +2015,10 @@ VideoEncoder *gstreamer_encoder_new(SpiceVideoCodecType codec_type,
     SpiceGstEncoder *encoder = g_new0(SpiceGstEncoder, 1);
     encoder->base.destroy = spice_gst_encoder_destroy;
     encoder->base.encode_frame = spice_gst_encoder_encode_frame;
+#ifdef HAVE_GSTREAMER_DMABUF_ENCODING
     encoder->base.encode_dmabuf = spice_gst_encoder_encode_dmabuf;
+    encoder->allocator = gst_dmabuf_allocator_new();
+#endif
     encoder->base.client_stream_report = spice_gst_encoder_client_stream_report;
     encoder->base.notify_server_frame_drop = spice_gst_encoder_notify_server_frame_drop;
     encoder->base.get_bit_rate = spice_gst_encoder_get_bit_rate;
@@ -2010,7 +2031,6 @@ VideoEncoder *gstreamer_encoder_new(SpiceVideoCodecType codec_type,
     encoder->bitmap_ref = bitmap_ref;
     encoder->bitmap_unref = bitmap_unref;
     encoder->format = GSTREAMER_FORMAT_INVALID;
-    encoder->allocator = gst_dmabuf_allocator_new();
     pthread_mutex_init(&encoder->outbuf_mutex, NULL);
     pthread_cond_init(&encoder->outbuf_cond, NULL);
 
-- 
2.48.1

