Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D3A4987A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783E310EC6E;
	Fri, 28 Feb 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="GftgFe1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CD710EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:content-type
 :content-type:mime-version:references:in-reply-to:x-mailer
 :message-id:date:date:subject:subject:from:from:received; s=s1;
 t=1740654231; x=1742468632; bh=phxh/JgzX4NWg7lRuEb+hes0uG8A2Nrn
 YcWnGVlVQMQ=; b=GftgFe1IOePSB28Wu/9WJfYQT5kD2ShxqaSj8sxBcnElDrEV
 lvTPjTRKZYgl/yHRBOBOdfwlfePlV1zwYB8Mxa1H5BQydH0RbHtPrBobe/yimzLc
 yI3gdJtyWey1++3ugc2ub7U40N5dNQKRVVhAQcZcBK5g/nO8WMZrkpHb/GM=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 2DE542C012D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:51 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276272; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>,
 Frediano Ziglio <freddy77@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jin Chung Teng <jin.chung.teng@intel.com>,
 Hazwan Arif Mazlan <hazwan.arif.mazlan@intel.com>
Subject: [PATCH 01/10] gstreamer-encoder: Use a h/w based encoder with Intel
 GPUs if possible (v5)
Date: Thu, 27 Feb 2025 12:03:23 +0100
Message-ID: <f99d272c67a1e76fa47b62c550461e0492d87c94.1740651328.git.michael.scherle@rz.uni-freiburg.de>
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

Once it is determined that an Intel GPU is available/active (after
looking into udev's database), we try to see if there is a h/w
based encoder (element) available (in Gstreamer's registry cache)
for the user selected video codec. In other words, if we find that
the Intel Media SDK Gstreamer plugin (libgstmsdk.so) and associated
libraries (such as va or vaapi) are all installed properly, we add
the appropriate h/w based encoder and post-processor/converter
elements to the pipeline (along with any relevant options) instead
of the s/w based elements.

For example, if the user selects h264 as the preferred codec format,
msdkh264enc and vapostproc will be preferred instead of x264enc
and videoconvert.

v2: (addressed some review comments from Frediano)
- Moved the udev helper into spice-common
- Refactored the code to choose plugins in order msdk > va > vaapi

v3: (Frediano)
- Added relevant encoder options for mjpeg and vp9 codecs (Jin Chung)

v4: (Fixups from Frediano)
- Free the encoder when we cannot find vpp
- Change type and find plugins array length using G_N_ELEMENTS
- Fix gstenc_name UAF by freeing it at the end of the function
- Use g_str_has_prefix instead of strstr
- Include the string "_hw_" in function names that deal with
  h/w based plugins
- Rebase on master

v5: rebase on master

Cc: Frediano Ziglio <freddy77@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Co-developed-by: Jin Chung Teng <jin.chung.teng@intel.com>
Co-developed-by: Hazwan Arif Mazlan <hazwan.arif.mazlan@intel.com>
---
 server/gstreamer-encoder.c | 123 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/server/gstreamer-encoder.c b/server/gstreamer-encoder.c
index 40882f69..be8e3111 100644
--- a/server/gstreamer-encoder.c
+++ b/server/gstreamer-encoder.c
@@ -38,6 +38,7 @@
 #include "red-common.h"
 #include "video-encoder.h"
 #include "utils.h"
+#include "common/udev.h"
 
 
 #define SPICE_GST_DEFAULT_FPS 30
@@ -861,6 +862,116 @@ static const gchar* get_gst_codec_name(const SpiceGstEncoder *encoder)
     }
 }
 
+static const char video_codecs[][8] = {
+    { "" },
+    { "mjpeg" },
+    { "vp8" },
+    { "h264" },
+    { "vp9" },
+    { "h265" },
+};
+
+static bool gst_features_lookup(const gchar *feature_name)
+{
+    GstRegistry *registry;
+    GstPluginFeature *feature;
+
+    registry = gst_registry_get();
+    if (!registry) {
+        return false;
+    }
+
+    feature = gst_registry_lookup_feature(registry, feature_name);
+    if (!feature) {
+        return false;
+    }
+
+    gst_object_unref(feature);
+    return true;
+}
+
+static gchar *find_best_hw_plugin(const gchar *codec_name)
+{
+    static const char plugins[][8] = {"msdk", "va", "vaapi"};
+    gchar *feature_name;
+    int i;
+
+    for (i = 0; i < G_N_ELEMENTS(plugins); i++) {
+        feature_name = !codec_name ? g_strconcat(plugins[i], "postproc", NULL) :
+                       g_strconcat(plugins[i], codec_name, "enc", NULL);
+        if (!gst_features_lookup(feature_name)) {
+            g_free(feature_name);
+            feature_name = NULL;
+            continue;
+        }
+        break;
+    }
+    return feature_name;
+}
+
+static gchar *get_hw_gstenc_opts(gchar *encoder, const gchar *codec_name)
+{
+    gchar *gstenc_opts;
+
+    if (strcmp(codec_name, "mjpeg") == 0) {
+        return g_strdup("");
+    }
+
+    if (g_str_has_prefix(encoder, "msdk")) {
+        if (strcmp(codec_name, "vp9") == 0) {
+            gstenc_opts = g_strdup("async-depth=1 b-frames=0 rate-control=3 target-usage=7");
+        } else {
+            gstenc_opts = g_strdup("async-depth=1 rate-control=3 gop-size=1 tune=16 b-frames=0 target-usage=7 min-qp=15 max-qp=35");
+        }
+    } else if (g_str_has_prefix(encoder, "vaapi")) {
+        if (strcmp(codec_name, "vp9") == 0) {
+            gstenc_opts = g_strdup("tune=3 rate-control=1");
+        } else {
+            gstenc_opts = g_strdup("rate-control=cqp max-bframes=0 min-qp=15 max-qp=35");
+        }
+    } else {
+        if (strcmp(codec_name, "vp9") == 0) {
+            gstenc_opts = g_strdup("min-qp=15 max-qp=35 rate-control=16 ref-frames=0 target-usage=7");
+        } else {
+            gstenc_opts = g_strdup("rate-control=16 b-frames=0 target-usage=7 min-qp=15 max-qp=35");
+        }
+    }
+    return gstenc_opts;
+}
+
+static void try_intel_hw_plugins(const gchar *codec_name, gchar **converter,
+                                 gchar **gstenc_name, gchar **gstenc_opts)
+{
+    gchar *encoder, *vpp;
+
+    if (strcmp(codec_name, "vp8") == 0) {
+        return;
+    }
+
+    encoder = find_best_hw_plugin(codec_name);
+    if (!encoder) {
+        return;
+    }
+    vpp = find_best_hw_plugin(NULL);
+    if (!vpp) {
+        g_free(encoder);
+        return;
+    }
+
+    g_free(*converter);
+    g_free(*gstenc_name);
+    g_free(*gstenc_opts);
+    *gstenc_name = encoder;
+    *gstenc_opts = get_hw_gstenc_opts(encoder, codec_name);
+
+    if (g_str_has_prefix(vpp, "vaapi")) {
+        *converter = g_strconcat(vpp, " ! video/x-raw(memory:VASurface),format=NV12", NULL);
+    } else {
+        *converter = g_strconcat(vpp, " ! video/x-raw(memory:VAMemory),format=NV12", NULL);
+    }
+    g_free(vpp);
+}
+
 /* At this time, only the following formats are supported by x264enc. */
 static const char valid_formats[][10] = {
     { "Y444" },
@@ -900,7 +1011,7 @@ static gchar *get_gst_converter(void)
 
 static gboolean create_pipeline(SpiceGstEncoder *encoder)
 {
-    const gchar* gstenc_name = get_gst_codec_name(encoder);
+    gchar* gstenc_name = g_strdup(get_gst_codec_name(encoder));
     if (!gstenc_name) {
         return FALSE;
     }
@@ -947,10 +1058,18 @@ static gboolean create_pipeline(SpiceGstEncoder *encoder)
     default:
         /* gstreamer_encoder_new() should have rejected this codec type */
         spice_warning("unsupported codec type %d", encoder->base.codec_type);
+        g_free(gstenc_name);
         g_free(converter);
         return FALSE;
     }
 
+    const char *codec_name = video_codecs[encoder->base.codec_type];
+    GpuVendor vendor = spice_udev_detect_gpu(INTEL_VENDOR_ID);
+    if (vendor == VENDOR_GPU_DETECTED) {
+        try_intel_hw_plugins(codec_name, &converter, &gstenc_name,
+                             &gstenc_opts);
+    }
+
     GError *err = NULL;
     gchar *desc = g_strdup_printf("appsrc is-live=true format=time do-timestamp=true name=src !"
                                   " %s ! %s name=encoder %s ! appsink name=sink",
@@ -967,6 +1086,7 @@ static gboolean create_pipeline(SpiceGstEncoder *encoder)
             gst_object_unref(encoder->pipeline);
             encoder->pipeline = NULL;
         }
+        g_free(gstenc_name);
         return FALSE;
     }
     encoder->appsrc = GST_APP_SRC(gst_bin_get_by_name(GST_BIN(encoder->pipeline), "src"));
@@ -1003,6 +1123,7 @@ static gboolean create_pipeline(SpiceGstEncoder *encoder)
                                   SPICE_GST_VIDEO_PIPELINE_BITRATE |
                                   SPICE_GST_VIDEO_PIPELINE_CAPS);
 
+    g_free(gstenc_name);
     return TRUE;
 }
 
-- 
2.48.1

