Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E226A49880
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8210EC61;
	Fri, 28 Feb 2025 11:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="AadxIHYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115610EAA0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:content-type
 :content-type:mime-version:references:in-reply-to:x-mailer
 :message-id:date:date:subject:subject:from:from:received; s=s1;
 t=1740654233; x=1742468634; bh=QSKou7xcZ5p7NC7E+19lDLqUDEdEEQZi
 vjX761QpEAc=; b=AadxIHYGYFzxQg7p5K6TOm2YsZmOY/rdt1/tDCvROpgKnYTb
 xF+cr591x0XY2OGVHy3H69BawryaZvXZhYxQ+ywtqkhG8yfbEKZlcjZXot5qcxlu
 Xv0odE9OLeUGaJDQ17gKW38+8unu9j5YOk2O+k8qEPFd4bDtlWHCytZtjX8=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 5A0092C013A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:53 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276591; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>,
 Frediano Ziglio <freddy77@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH 04/10] dcc-send: Encode and send gl_draw stream data to the
 remote client (v4)
Date: Thu, 27 Feb 2025 12:03:26 +0100
Message-ID: <a9e3373ebac2d70c4eee225f1222d3bd55ec0f7b.1740651328.git.michael.scherle@rz.uni-freiburg.de>
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

For remote (or non-gl) clients, if a valid gl_draw stream exists,
then we first extract the dmabuf fd associated with the scanout and
share it with the encoder along with other key parameters such as
stride, width and height. Once the encoder finishes creating an
encoded buffer (using the dmabuf fd as input), we then send it
over to the client. And, as soon as the encoder notifies that it
is no longer using the dmabuf fd, we send a gl_draw_done async to
the application.

v2: (suggestions and fixups from Frediano)
- Moved the DisplayStreamData initialization code from
  red_marshall_stream_data() into a separate function that is reused
  when marshalling gl_draw_stream.
- Used new/delete instead of g_new/g_free for creating and destroying
  dmabuf_data object
- s/notify_mem_free/free
  s/red_gst_mem_free_cb/red_free_fb
- Removed the usage of opaque from red_free_cb

v3:
- Obtain the key params such as fd, stride, etc from the stream instead
  of the scanout
- Replace the switch with if in red_marshall_gl_draw_stream() to avoid
  printing a warning (and spamming the console) when a frame is dropped

v4:
- Slightly improve the readability of red_marshall_gl_draw_stream() by
  adding checks at the start

Cc: Frediano Ziglio <freddy77@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 server/dcc-send.cpp    | 158 +++++++++++++++++++++++++++++++++--------
 server/video-encoder.h |  13 ++++
 2 files changed, 143 insertions(+), 28 deletions(-)

diff --git a/server/dcc-send.cpp b/server/dcc-send.cpp
index 2c40a231..c418f375 100644
--- a/server/dcc-send.cpp
+++ b/server/dcc-send.cpp
@@ -1637,6 +1637,60 @@ static void red_release_video_encoder_buffer(uint8_t *data, void *opaque)
     buffer->free(buffer);
 }
 
+static void red_init_display_stream_data(DisplayChannelClient *dcc,
+                                         SpiceMarshaller *base_marshaller,
+                                         Drawable *drawable, int stream_id,
+                                         VideoBuffer *outbuf, int is_sized)
+{
+    SpiceMsgDisplayStreamData stream_data;
+    SpiceMsgDisplayStreamDataSized stream_data_sized;
+    SpiceStreamDataHeader *base;
+    SpiceCopy *copy;
+    uint32_t frame_mm_time = reds_get_mm_time();
+    uint16_t msg_type = is_sized ? SPICE_MSG_DISPLAY_STREAM_DATA_SIZED :
+                        SPICE_MSG_DISPLAY_STREAM_DATA;
+
+    dcc->init_send_data(msg_type);
+
+    base = is_sized ? &stream_data_sized.base : &stream_data.base;
+    base->id = stream_id;
+    base->multi_media_time = frame_mm_time;
+    stream_data.data_size = outbuf->size;
+
+    if (is_sized) {
+        copy = &drawable->red_drawable->u.copy;
+        frame_mm_time = drawable->red_drawable->mm_time ?
+                        drawable->red_drawable->mm_time :
+                        reds_get_mm_time();
+
+        stream_data_sized.base.multi_media_time = frame_mm_time;
+        stream_data_sized.width = copy->src_area.right - copy->src_area.left;
+        stream_data_sized.height = copy->src_area.bottom - copy->src_area.top;
+        stream_data_sized.dest = drawable->red_drawable->bbox;
+        stream_data_sized.data_size = outbuf->size;
+
+        spice_debug("stream %d: sized frame: dest ==> ",
+                    stream_data_sized.base.id);
+        rect_debug(&stream_data_sized.dest);
+        spice_marshall_msg_display_stream_data_sized(base_marshaller,
+                                                     &stream_data_sized);
+    } else {
+        spice_marshall_msg_display_stream_data(base_marshaller, &stream_data);
+    }
+
+    spice_marshaller_add_by_ref_full(base_marshaller, outbuf->data,
+                                     outbuf->size,
+                                     &red_release_video_encoder_buffer,
+                                     outbuf);
+#ifdef STREAM_STATS
+    VideoStreamAgent *agent = &dcc->priv->stream_agents[stream_id];
+
+    agent->stats.num_frames_sent++;
+    agent->stats.size_sent += outbuf->size;
+    agent->stats.end = frame_mm_time;
+#endif
+}
+
 static bool red_marshall_stream_data(DisplayChannelClient *dcc,
                                      SpiceMarshaller *base_marshaller,
                                      Drawable *drawable)
@@ -1693,41 +1747,81 @@ static bool red_marshall_stream_data(DisplayChannelClient *dcc,
         return FALSE;
     }
 
-    if (!is_sized) {
-        SpiceMsgDisplayStreamData stream_data;
+    red_init_display_stream_data(dcc, base_marshaller, drawable,
+                                 stream_id, outbuf, is_sized);
+    return TRUE;
+}
 
-        dcc->init_send_data(SPICE_MSG_DISPLAY_STREAM_DATA);
+static void red_free_cb(VideoEncoderDmabufData *dmabuf_data)
+{
+    auto dcc = static_cast<DisplayChannelClient *>(dmabuf_data->dcc);
+    DisplayChannel *display = DCC_TO_DC(dcc);
 
-        stream_data.base.id = stream_id;
-        stream_data.base.multi_media_time = frame_mm_time;
-        stream_data.data_size = outbuf->size;
+    dcc->priv->gl_draw_ongoing = false;
+    display_channel_gl_draw_done(display);
+    delete dmabuf_data;
+}
 
-        spice_marshall_msg_display_stream_data(base_marshaller, &stream_data);
-    } else {
-        SpiceMsgDisplayStreamDataSized stream_data;
+static void red_marshall_gl_draw_stream(DisplayChannelClient *dcc,
+                                        SpiceMarshaller *base_marshaller)
+{
+    DisplayChannel *display = DCC_TO_DC(dcc);
+    VideoStream *stream = display->priv->gl_draw_stream;
+    int stream_id = display_channel_get_video_stream_id(display, stream);
+    VideoStreamAgent *agent = &dcc->priv->stream_agents[stream_id];
 
-        dcc->init_send_data(SPICE_MSG_DISPLAY_STREAM_DATA_SIZED);
+    if (!agent->video_encoder || !agent->video_encoder->encode_dmabuf) {
+        spice_warning("No video encoder available for this stream");
+        return;
+    }
 
-        stream_data.base.id = stream_id;
-        stream_data.base.multi_media_time = frame_mm_time;
-        stream_data.data_size = outbuf->size;
-        stream_data.width = copy->src_area.right - copy->src_area.left;
-        stream_data.height = copy->src_area.bottom - copy->src_area.top;
-        stream_data.dest = drawable->red_drawable->bbox;
+    VideoEncoderDmabufData *dmabuf_data = new VideoEncoderDmabufData;
+    if (!dmabuf_data) {
+        spice_warning("Cannot create memory for dmabuf data");
+        return;
+    }
 
-        spice_debug("stream %d: sized frame: dest ==> ", stream_data.base.id);
-        rect_debug(&stream_data.dest);
-        spice_marshall_msg_display_stream_data_sized(base_marshaller, &stream_data);
+    QXLInstance* qxl = display->priv->qxl;
+    SpiceMsgDisplayGlScanoutUnix *scanout = red_qxl_get_gl_scanout(qxl);
+    if (!scanout) {
+        spice_warning("Cannot access scanout");
+        delete dmabuf_data;
+        return;
     }
-    spice_marshaller_add_by_ref_full(base_marshaller, outbuf->data, outbuf->size,
-                                     &red_release_video_encoder_buffer, outbuf);
+
+    dmabuf_data->drm_dma_buf_fd = scanout->drm_dma_buf_fd;
+    dmabuf_data->width = stream->width;
+    dmabuf_data->height = stream->height;
+    dmabuf_data->stride = stream->stride;
+    dmabuf_data->dcc = dcc;
+    dmabuf_data->free = red_free_cb;
+    red_qxl_put_gl_scanout(qxl, scanout);
+
+    VideoBuffer *outbuf;
+    VideoEncodeResults ret;
+
+    ret = agent->video_encoder->encode_dmabuf(agent->video_encoder,
+                                              reds_get_mm_time(),
+                                              dmabuf_data, &outbuf);
+
+    if (ret != VIDEO_ENCODER_FRAME_ENCODE_DONE) {
+        if (ret == VIDEO_ENCODER_FRAME_DROP) {
 #ifdef STREAM_STATS
-    agent->stats.num_frames_sent++;
-    agent->stats.size_sent += outbuf->size;
-    agent->stats.end = frame_mm_time;
+            agent->stats.num_drops_fps++;
 #endif
+        } else {
+            spice_warning("bad ret value (%d) from VideoEncoder::encode_dmabuf",
+                          ret);
+        }
 
-    return TRUE;
+        dcc->priv->gl_draw_ongoing = false;
+        display_channel_gl_draw_done(display);
+        delete dmabuf_data;
+        return;
+    }
+
+    red_init_display_stream_data(dcc, base_marshaller, nullptr,
+                                 stream_id, outbuf, false);
 }
 
 static inline void marshall_inval_palette(RedChannelClient *rcc,
@@ -2126,6 +2220,8 @@ static void marshall_stream_start(DisplayChannelClient *dcc,
     if (stream->current) {
         RedDrawable *red_drawable = stream->current->red_drawable.get();
         stream_create.clip = red_drawable->clip;
+    } else if (stream == DCC_TO_DC(dcc)->priv->gl_draw_stream){
+        stream_create.clip.type = SPICE_CLIP_TYPE_NONE;
     } else {
         stream_create.clip.type = SPICE_CLIP_TYPE_RECTS;
         clip_rects.num_rects = 0;
@@ -2275,14 +2371,20 @@ static void marshall_gl_scanout(DisplayChannelClient *dcc,
     red_qxl_put_gl_scanout(qxl, scanout);
 }
 
-static void marshall_gl_draw(RedChannelClient *rcc,
+static void marshall_gl_draw(DisplayChannelClient *dcc,
                              SpiceMarshaller *m,
                              RedPipeItem *item)
 {
     auto p = static_cast<RedGlDrawItem*>(item);
 
-    rcc->init_send_data(SPICE_MSG_DISPLAY_GL_DRAW);
-    spice_marshall_msg_display_gl_draw(m, &p->draw);
+    if (dcc->is_gl_client()) {
+        dcc->init_send_data(SPICE_MSG_DISPLAY_GL_DRAW);
+        spice_marshall_msg_display_gl_draw(m, &p->draw);
+    } else if (DCC_TO_DC(dcc)->priv->gl_draw_stream) {
+        red_marshall_gl_draw_stream(dcc, m);
+    } else {
+        spice_warning("nothing to send to the client");
+    }
 }
 
 
diff --git a/server/video-encoder.h b/server/video-encoder.h
index c2bdc811..0261bfca 100644
--- a/server/video-encoder.h
+++ b/server/video-encoder.h
@@ -56,6 +56,15 @@ typedef struct VideoEncoderStats {
     double avg_quality;
 } VideoEncoderStats;
 
+typedef struct VideoEncoderDmabufData {
+    int drm_dma_buf_fd;
+    uint32_t width;
+    uint32_t height;
+    uint32_t stride;
+    void *dcc;
+    void (*free)(struct VideoEncoderDmabufData*);
+} VideoEncoderDmabufData;
+
 typedef struct VideoEncoder VideoEncoder;
 struct VideoEncoder {
     /* Releases the video encoder's resources */
@@ -84,6 +93,10 @@ struct VideoEncoder {
                                        const SpiceRect *src, int top_down,
                                        gpointer bitmap_opaque, VideoBuffer** outbuf);
 
+    VideoEncodeResults (*encode_dmabuf)(VideoEncoder *encoder, uint32_t frame_mm_time,
+                                        VideoEncoderDmabufData *dmabuf_data,
+                                        VideoBuffer** outbuf);
+
     /*
      * Bit rate control methods.
      */
-- 
2.48.1

