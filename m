Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC8A4987B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB5010EC65;
	Fri, 28 Feb 2025 11:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF53B10EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:content-type
 :content-type:mime-version:references:in-reply-to:x-mailer
 :message-id:date:date:subject:subject:from:from:received; s=s1;
 t=1740654232; x=1742468633; bh=6U6NZwdvUjXNW/ku7Nb0YKhGLqApZqKa
 vWhVNwpENzg=; b=oTS7UKeHqSRyhEfjFIUMzZndMY3oOmELhpyr8JCC8KYgyacg
 942b+Y2aCJZpc7kUol5GRxJ1lzRV1kjn7k+HArfRwFYWOsWUDT+9mcTJqyjjb9zI
 lqmX3PfpkU4JkQw28QjnVkPMeKdHoY1aoAsqOlybsOMf4tTgop6AIYsz96k=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 7C1832C0133
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:52 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46275184; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>,
 Frediano Ziglio <freddy77@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH 03/10] dcc: Create a stream associated with gl_draw for non-gl
 clients (v6)
Date: Thu, 27 Feb 2025 12:03:25 +0100
Message-ID: <ff60fa5a85e9052637b5ca17aec38d6ef62d35b2.1740651328.git.michael.scherle@rz.uni-freiburg.de>
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

For non-gl/remote clients, if there is no stream associated with
the DisplayChannel, then we create a new stream. Otherwise, we
just update the current stream's timestamp.

v2: (suggestions and fixups from Frediano)
- Moved the gl_draw_stream object from DCC to DC
- Moved the stream initialization code from display_channel_create_stream()
  into a separate function that is reused when creating gl_draw_stream

v3:
- Create a new primary surface whenever a new stream gets created

v4:
- Use nullptr instead of NULL and true instead of TRUE (Frediano)
- Create the stream as part of gl scanout instead of gl draw operation
  so that if would be easily possible to obtain key params such as
  stride, flags, etc
- Store key params such as fd, flags, stride, etc in the stream so that
  we do not have to look at scanout again

v5: (Frediano)
- No need to pass scanout object to create_gl_draw_stream as it is
  always NULL
- Don't compute the stream's last_time if drawable is valid
- Let the default input_fps be MAX_FPS
- Use uint32_t type for stride
- Make sure that a newly created stream is provided to all connected clients
- When the scanout's drm_dma_buf_fd is associated with a stream, take
  an additional reference on the fd to ensure that it is not closed
  when the stream might still be using it

v6:
- Add a new helper is_new_stream_needed() to determine when to create new
  stream
- Add more checks to see if the encoder is created or not
- Don't share the dmabuf fd with the stream and instead keep the
  ownerhip of the fd with the scanout

Cc: Frediano Ziglio <freddy77@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 server/dcc.cpp                   |   9 ++
 server/display-channel-private.h |   1 +
 server/display-channel.cpp       |   1 +
 server/video-stream.cpp          | 194 ++++++++++++++++++++++++++-----
 server/video-stream.h            |   4 +
 5 files changed, 180 insertions(+), 29 deletions(-)

diff --git a/server/dcc.cpp b/server/dcc.cpp
index edec429d..58170681 100644
--- a/server/dcc.cpp
+++ b/server/dcc.cpp
@@ -523,6 +523,15 @@ RedPipeItemPtr dcc_gl_draw_item_new(RedChannelClient *rcc, void *data, int num)
         return RedPipeItemPtr();
     }
 
+    if (!dcc->is_gl_client()) {
+        if (!display_channel_update_gl_draw_stream(dcc, draw)) {
+            red_channel_warning(rcc->get_channel(),
+                                "Cannot update GL stream");
+            rcc->disconnect();
+            return RedPipeItemPtr();
+        }
+    }
+
     dcc->priv->gl_draw_ongoing = TRUE;
     auto item = red::make_shared<RedGlDrawItem>();
     item->draw = *draw;
diff --git a/server/display-channel-private.h b/server/display-channel-private.h
index 04ac2c0d..e0693f54 100644
--- a/server/display-channel-private.h
+++ b/server/display-channel-private.h
@@ -110,6 +110,7 @@ struct DisplayChannelPrivate
     uint32_t stream_count;
     std::array<VideoStream, NUM_STREAMS> streams_buf;
     VideoStream *free_streams;
+    VideoStream *gl_draw_stream;
     Ring streams;
     std::array<ItemTrace, NUM_TRACE_ITEMS> items_trace;
     uint32_t next_item_trace;
diff --git a/server/display-channel.cpp b/server/display-channel.cpp
index 4bd0cf41..53a4724d 100644
--- a/server/display-channel.cpp
+++ b/server/display-channel.cpp
@@ -2172,6 +2172,7 @@ display_channel_new(RedsState *reds, QXLInstance *qxl,
                                          video_codecs, n_surfaces);
     if (display) {
         display_channel_set_stream_video(display.get(), stream_video);
+        display->priv->gl_draw_stream = nullptr;
     }
     return display;
 }
diff --git a/server/video-stream.cpp b/server/video-stream.cpp
index e453f11d..691c50a3 100644
--- a/server/video-stream.cpp
+++ b/server/video-stream.cpp
@@ -20,6 +20,7 @@
 #include "display-channel-private.h"
 #include "main-channel-client.h"
 #include "red-client.h"
+#include "red-qxl.h"
 
 #define FPS_TEST_INTERVAL 1
 #define FOREACH_STREAMS(display, item)                  \
@@ -366,7 +367,53 @@ static VideoStream *display_channel_stream_try_new(DisplayChannel *display)
     return stream;
 }
 
-static void display_channel_create_stream(DisplayChannel *display, Drawable *drawable)
+static void display_channel_init_stream(DisplayChannel *display,
+                                        VideoStream *stream,
+                                        Drawable *drawable,
+                                        SpiceRect* src_rect)
+{
+    SpiceBitmap *bitmap;
+    uint64_t duration;
+
+    ring_add(&display->priv->streams, &stream->link);
+    stream->current = drawable;
+    stream->last_time = drawable ? drawable->creation_time :
+                        spice_get_monotonic_time_ns();
+    stream->width = src_rect->right - src_rect->left;
+    stream->height = src_rect->bottom - src_rect->top;
+    stream->dest_area = *src_rect;
+    stream->refs = 1;
+    stream->input_fps = MAX_FPS;
+    stream->num_input_frames = 0;
+    stream->input_fps_start_time = stream->last_time;
+    display->priv->streams_size_total += stream->width * stream->height;
+    display->priv->stream_count++;
+
+    if (drawable) {
+        drawable->stream = stream;
+        stream->dest_area = drawable->red_drawable->bbox;
+        bitmap = &drawable->red_drawable->u.copy.src_bitmap->u.bitmap;
+        stream->top_down = !!(bitmap->flags & SPICE_BITMAP_FLAGS_TOP_DOWN);
+
+        /* Provide an fps estimate the video encoder can use when initializing
+         * based on the frames that lead to the creation of the stream. Round
+         * to the nearest integer, for instance 24 for 23.976.
+         */
+        duration = drawable->creation_time - drawable->first_frame_time;
+        if (duration > NSEC_PER_SEC * drawable->frames_count / MAX_FPS) {
+            stream->input_fps = (NSEC_PER_SEC * drawable->frames_count + duration / 2) / duration;
+        }
+    }
+
+    spice_debug("stream %d %dx%d (%d, %d) (%d, %d) %u fps",
+                display_channel_get_video_stream_id(display, stream), stream->width,
+                stream->height, stream->dest_area.left, stream->dest_area.top,
+                stream->dest_area.right, stream->dest_area.bottom,
+                stream->input_fps);
+}
+
+static void display_channel_create_stream(DisplayChannel *display,
+                                          Drawable *drawable)
 {
     DisplayChannelClient *dcc;
     VideoStream *stream;
@@ -381,38 +428,127 @@ static void display_channel_create_stream(DisplayChannel *display, Drawable *dra
     spice_assert(drawable->red_drawable->type == QXL_DRAW_COPY);
     src_rect = &drawable->red_drawable->u.copy.src_area;
 
-    ring_add(&display->priv->streams, &stream->link);
-    stream->current = drawable;
-    stream->last_time = drawable->creation_time;
-    stream->width = src_rect->right - src_rect->left;
-    stream->height = src_rect->bottom - src_rect->top;
-    stream->dest_area = drawable->red_drawable->bbox;
-    stream->refs = 1;
-    SpiceBitmap *bitmap = &drawable->red_drawable->u.copy.src_bitmap->u.bitmap;
-    stream->top_down = !!(bitmap->flags & SPICE_BITMAP_FLAGS_TOP_DOWN);
-    drawable->stream = stream;
-    /* Provide an fps estimate the video encoder can use when initializing
-     * based on the frames that lead to the creation of the stream. Round to
-     * the nearest integer, for instance 24 for 23.976.
-     */
-    uint64_t duration = drawable->creation_time - drawable->first_frame_time;
-    if (duration > NSEC_PER_SEC * drawable->frames_count / MAX_FPS) {
-        stream->input_fps = (NSEC_PER_SEC * drawable->frames_count + duration / 2) / duration;
-    } else {
-        stream->input_fps = MAX_FPS;
+    display_channel_init_stream(display, stream, drawable, src_rect);
+    FOREACH_DCC(display, dcc) {
+        dcc_create_stream(dcc, stream);
     }
-    stream->num_input_frames = 0;
-    stream->input_fps_start_time = drawable->creation_time;
-    display->priv->streams_size_total += stream->width * stream->height;
-    display->priv->stream_count++;
+}
+
+bool display_channel_create_gl_draw_stream(DisplayChannel *display)
+{
+    QXLInstance* qxl = display->priv->qxl;
+    SpiceMsgDisplayGlScanoutUnix *scanout = red_qxl_get_gl_scanout(qxl);
+    DisplayChannelClient *dcc;
+    VideoStream *stream;
+    bool ret = false;
+
+    if (!scanout) {
+        return false;
+    }
+    SpiceRect dest_area = {
+        .left = 0,
+        .top = 0,
+        .right = scanout->width,
+        .bottom = scanout->height
+    };
+
+    if (display->priv->surfaces[0]) {
+        display_channel_surface_id_unref(display, 0);
+    }
+    if (!display_channel_create_surface(display, 0, scanout->width,
+                                        scanout->height, scanout->stride,
+                                        SPICE_SURFACE_FMT_32_xRGB,
+                                        nullptr, true, true)) {
+        goto err;
+    }
+
+    display_channel_set_monitors_config_to_primary(display);
+    display_channel_push_monitors_config(display);
+    display->pipes_add_empty_msg(SPICE_MSG_DISPLAY_MARK);
+    display->push();
+
+    if (!(stream = display_channel_stream_try_new(display))) {
+        goto err;
+    }
+
+    ret = true;
+    display_channel_init_stream(display, stream, nullptr, &dest_area);
+    stream->top_down = (scanout->flags & SPICE_GL_SCANOUT_FLAGS_Y0TOP) ? 0 : 1;
+    stream->stride = scanout->stride;
+    /* This is the upper bound; it should be possible to stream at 60 FPS
+     * with a hardware based encoder.
+     */
+    stream->input_fps = MAX_FPS * 2;
+
+    display->priv->gl_draw_stream = stream;
     FOREACH_DCC(display, dcc) {
         dcc_create_stream(dcc, stream);
     }
-    spice_debug("stream %d %dx%d (%d, %d) (%d, %d) %u fps",
-                display_channel_get_video_stream_id(display, stream), stream->width,
-                stream->height, stream->dest_area.left, stream->dest_area.top,
-                stream->dest_area.right, stream->dest_area.bottom,
-                stream->input_fps);
+err:
+    red_qxl_put_gl_scanout(qxl, scanout);
+    return ret;
+}
+
+bool is_new_stream_needed(DisplayChannel *display)
+{
+    VideoStream *stream = display->priv->gl_draw_stream;
+    if (!stream) {
+        return true;
+    }
+
+    QXLInstance* qxl = display->priv->qxl;
+    SpiceMsgDisplayGlScanoutUnix *scanout = red_qxl_get_gl_scanout(qxl);
+    uint32_t width, height, top_down;
+
+    if (!scanout) {
+        return true;
+    }
+
+    width = scanout->width;
+    height = scanout->height;
+    top_down = (scanout->flags & SPICE_GL_SCANOUT_FLAGS_Y0TOP) ? 0 : 1;
+    red_qxl_put_gl_scanout(qxl, scanout);
+
+    if (stream->width == width &&
+        stream->height == height &&
+        stream->top_down == top_down) {
+        return false;
+    }
+    return true;
+}
+
+bool display_channel_update_gl_draw_stream(DisplayChannelClient *dcc,
+                                           const SpiceMsgDisplayGlDraw *draw)
+{
+    DisplayChannel *display = DCC_TO_DC(dcc);
+    SpiceRect dest_area = {
+        .left = draw->x,
+        .top = draw->y,
+        .right = draw->w,
+        .bottom = draw->h
+    };
+
+    if (is_new_stream_needed(display)) {
+        if (!display_channel_create_gl_draw_stream(display)) {
+            return false;
+        }
+    }
+
+    VideoStream *stream = display->priv->gl_draw_stream;
+    int stream_id = display_channel_get_video_stream_id(display, stream);
+    VideoStreamAgent *agent = dcc_get_video_stream_agent(dcc, stream_id);
+
+    /* Just a sanity check to make sure that an encoder was created */
+    if (!agent->video_encoder) {
+        dcc_create_stream(dcc, stream);
+        if (!agent->video_encoder) {
+            return false;
+        }
+    }
+
+    stream->dest_area = dest_area;
+    stream->last_time = spice_get_monotonic_time_ns();
+    return true;
 }
 
 // returns whether a stream was created
diff --git a/server/video-stream.h b/server/video-stream.h
index fc5b03dd..d3f25bb3 100644
--- a/server/video-stream.h
+++ b/server/video-stream.h
@@ -112,6 +112,7 @@ struct VideoStream {
     red_time_t last_time;
     int width;
     int height;
+    uint32_t stride;
     SpiceRect dest_area;
     int top_down;
     VideoStream *next;
@@ -123,6 +124,9 @@ struct VideoStream {
 };
 
 void display_channel_init_video_streams(DisplayChannel *display);
+bool display_channel_create_gl_draw_stream(DisplayChannel *display);
+bool display_channel_update_gl_draw_stream(DisplayChannelClient *dcc,
+                                           const SpiceMsgDisplayGlDraw *draw);
 void video_stream_stop(DisplayChannel *display, VideoStream *stream);
 void video_stream_trace_update(DisplayChannel *display, Drawable *drawable);
 void video_stream_maintenance(DisplayChannel *display, Drawable *candidate,
-- 
2.48.1

