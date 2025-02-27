Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0EFA49873
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAA710EC6C;
	Fri, 28 Feb 2025 11:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CEC10EAA2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received; s=s1; t=1740654235; x=1742468636;
 bh=YoSH+mt4pZZAw6M5OviugL2nAqCFIHJqxgF1lqJ50Qo=; b=eodo+yaryiSX
 y7FwqmK6LPzB3/2YLZN6lb5O7EpindcdWG1loLodWYGC1ZKb4O6EexumDXqe6kXV
 cazFUODWY7g8qCgEylEwRmJZ9J9HLvk4BRkVjoAB04yYU78oU2chA1oTupv54RaZ
 tuVX0jgGo3LcG2yVHYlWjnRG0zFRSOM=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 8CED72C0132
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:55 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276643; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH 07/10] gstreamer-encoder: Map the drm format to appropriate
 Gstreamer format
Date: Thu, 27 Feb 2025 12:03:29 +0100
Message-ID: <4088d64b91bfa44191129f1e92ea1a6137534076.1740651328.git.michael.scherle@rz.uni-freiburg.de>
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

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

We need to convert the scanout's drm format to the correct Gstreamer
format while configuring the pipeline. This can be done using
gst_video_dma_drm_fourcc_to_format() API, which will take the drm
fourcc value and return the appropriate Gst format.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 server/dcc-send.cpp        |   1 +
 server/gstreamer-encoder.c | 103 +++++++++++++++++++++++++++++++------
 server/video-encoder.h     |   1 +
 3 files changed, 88 insertions(+), 17 deletions(-)

diff --git a/server/dcc-send.cpp b/server/dcc-send.cpp
index c418f375..7bc20a22 100644
--- a/server/dcc-send.cpp
+++ b/server/dcc-send.cpp
@@ -1790,6 +1790,7 @@ static void red_marshall_gl_draw_stream(DisplayChannelClient *dcc,
     }
 
     dmabuf_data->drm_dma_buf_fd = scanout->drm_dma_buf_fd;
+    dmabuf_data->drm_fourcc_format = scanout->drm_fourcc_format;
     dmabuf_data->width = stream->width;
     dmabuf_data->height = stream->height;
     dmabuf_data->stride = stream->stride;
diff --git a/server/gstreamer-encoder.c b/server/gstreamer-encoder.c
index d4efe732..196b27ab 100644
--- a/server/gstreamer-encoder.c
+++ b/server/gstreamer-encoder.c
@@ -31,6 +31,7 @@
 #include <gst/app/gstappsrc.h>
 #include <gst/app/gstappsink.h>
 #include <gst/video/video.h>
+#include <gst/video/video-info-dma.h>
 #include <orc/orcprogram.h>
 #if defined(__GNUC__) && (__GNUC__ >= 6)
 #  pragma GCC diagnostic pop
@@ -40,19 +41,26 @@
 #include "video-encoder.h"
 #include "utils.h"
 #include "common/udev.h"
-
+#include "drm/drm_fourcc.h"
 
 #define SPICE_GST_DEFAULT_FPS 30
 
 typedef struct {
     SpiceBitmapFmt spice_format;
+    uint32_t drm_format;
     uint32_t bpp;
     char format[8];
     GstVideoFormat gst_format;
 } SpiceFormatForGStreamer;
 
+#define __FMT_DESC(spice_format, drm_format, bpp, format, gst_format) \
+    { spice_format, drm_format, bpp, format, gst_format }
+
 #define FMT_DESC(spice_format, bpp, format, gst_format) \
-    { spice_format, bpp, format, gst_format }
+    __FMT_DESC(spice_format, DRM_FORMAT_INVALID, bpp, format, gst_format)
+
+#define DRM_FMT_DESC(drm_format, bpp) \
+    __FMT_DESC(SPICE_BITMAP_FMT_INVALID, drm_format, bpp, "", GST_VIDEO_FORMAT_UNKNOWN)
 
 typedef struct SpiceGstVideoBuffer {
     VideoBuffer base;
@@ -93,6 +101,7 @@ typedef struct SpiceGstEncoder {
     uint32_t height;
     const SpiceFormatForGStreamer *format;
     SpiceBitmapFmt spice_format;
+    uint32_t drm_format;
 
     /* Number of consecutive frame encoding errors. */
     uint32_t errors;
@@ -784,6 +793,47 @@ static const SpiceFormatForGStreamer *map_format(SpiceBitmapFmt format)
     return GSTREAMER_FORMAT_INVALID;
 }
 
+static SpiceFormatForGStreamer drm_format_map[] =  {
+    DRM_FMT_DESC(DRM_FORMAT_INVALID,  0),
+    DRM_FMT_DESC(DRM_FORMAT_XRGB8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_XBGR8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_RGBX8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_BGRX8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_ARGB8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_ABGR8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_RGBA8888, 32),
+    DRM_FMT_DESC(DRM_FORMAT_BGRA8888, 32),
+};
+#define GSTREAMER_DRM_FORMAT_INVALID (&drm_format_map[0])
+
+static const SpiceFormatForGStreamer *map_drm_format(uint32_t fourcc)
+{
+    int i;
+
+    for (i = 0; i < G_N_ELEMENTS(drm_format_map); i++) {
+        if (drm_format_map[i].drm_format == fourcc) {
+            if (drm_format_map[i].gst_format == GST_VIDEO_FORMAT_UNKNOWN) {
+                int format_size = sizeof(drm_format_map[i].format);
+                GstVideoFormat gst_format;
+
+                gst_format = gst_video_dma_drm_fourcc_to_format(fourcc);
+                if (gst_format == GST_VIDEO_FORMAT_UNKNOWN) {
+                    break;
+                }
+
+                drm_format_map[i].gst_format = gst_format;
+                strncpy(drm_format_map[i].format,
+                        gst_video_format_to_string(gst_format),
+                        format_size - 1);
+                drm_format_map[i].format[format_size - 1] = '\0';
+            }
+            return &drm_format_map[i];
+        }
+    }
+
+    return GSTREAMER_DRM_FORMAT_INVALID;
+}
+
 static void set_appsrc_caps(SpiceGstEncoder *encoder)
 {
     if (encoder->src_caps) {
@@ -1561,26 +1611,41 @@ static void spice_gst_encoder_add_frame(SpiceGstEncoder *encoder,
 static VideoEncodeResults
 spice_gst_encoder_configure_pipeline(SpiceGstEncoder *encoder,
                                      uint32_t width, uint32_t height,
-                                     const SpiceBitmap *bitmap,
+                                     SpiceBitmapFmt spice_format,
+                                     uint32_t drm_format,
                                      uint32_t frame_mm_time)
 {
-    SpiceBitmapFmt format = bitmap ? (SpiceBitmapFmt) bitmap->format :
-                            SPICE_BITMAP_FMT_32BIT;
+    const SpiceFormatForGStreamer *format = GSTREAMER_FORMAT_INVALID;
+
+    if (spice_format != SPICE_BITMAP_FMT_INVALID) {
+        format = map_format(spice_format);
+    } else if (drm_format != DRM_FORMAT_INVALID) {
+        format = map_drm_format(drm_format);
+    }
+
+    if (format == GSTREAMER_FORMAT_INVALID ||
+        format == GSTREAMER_DRM_FORMAT_INVALID) {
+        spice_warning("unable to map format type %d or %u",
+                      spice_format, drm_format);
+        encoder->errors = 4;
+        return VIDEO_ENCODER_FRAME_UNSUPPORTED;
+    }
 
     if (width != encoder->width || height != encoder->height ||
-        encoder->spice_format != format) {
-        spice_debug("video format change: width %d -> %d, height %d -> %d, format %d -> %d",
+        encoder->spice_format != spice_format ||
+        encoder->drm_format != drm_format) {
+        spice_debug("video format change: width %d -> %d, height %d -> %d,"
+                    "spice format %d -> %d, drm format %u -> %u",
                     encoder->width, width, encoder->height, height,
-                    encoder->spice_format, format);
-        encoder->format = map_format(format);
-        if (encoder->format == GSTREAMER_FORMAT_INVALID) {
-            spice_warning("unable to map format type %d", format);
-            encoder->errors = 4;
-            return VIDEO_ENCODER_FRAME_UNSUPPORTED;
-        }
-        encoder->spice_format = format;
+                    encoder->spice_format, spice_format,
+                    encoder->drm_format, drm_format);
+
+        encoder->format = format;
+        encoder->spice_format = spice_format;
+        encoder->drm_format = drm_format;
         encoder->width = width;
         encoder->height = height;
+
         if (encoder->bit_rate == 0) {
             encoder->history[0].mm_time = frame_mm_time;
             encoder->max_bit_rate = get_bit_rate_cap(encoder);
@@ -1640,7 +1705,9 @@ spice_gst_encoder_encode_frame(VideoEncoder *video_encoder,
     uint32_t height = src->bottom - src->top;
 
     rc = spice_gst_encoder_configure_pipeline(encoder, width, height,
-                                              bitmap, frame_mm_time);
+                                              bitmap->format,
+                                              DRM_FORMAT_INVALID,
+                                              frame_mm_time);
     if (rc != VIDEO_ENCODER_FRAME_ENCODE_DONE) {
         return rc;
     }
@@ -1691,7 +1758,9 @@ spice_gst_encoder_encode_dmabuf(VideoEncoder *video_encoder,
     VideoEncodeResults rc;
 
     rc = spice_gst_encoder_configure_pipeline(encoder, dmabuf_data->width,
-                                              dmabuf_data->height, NULL,
+                                              dmabuf_data->height,
+                                              SPICE_BITMAP_FMT_INVALID,
+                                              dmabuf_data->drm_fourcc_format,
                                               frame_mm_time);
     if (rc != VIDEO_ENCODER_FRAME_ENCODE_DONE) {
         return rc;
diff --git a/server/video-encoder.h b/server/video-encoder.h
index 0261bfca..a4cebe0a 100644
--- a/server/video-encoder.h
+++ b/server/video-encoder.h
@@ -61,6 +61,7 @@ typedef struct VideoEncoderDmabufData {
     uint32_t width;
     uint32_t height;
     uint32_t stride;
+    uint32_t drm_fourcc_format;
     void *dcc;
     void (*free)(struct VideoEncoderDmabufData*);
 } VideoEncoderDmabufData;
-- 
2.48.1

