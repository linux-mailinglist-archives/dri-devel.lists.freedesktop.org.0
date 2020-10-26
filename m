Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86696298DA6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A356E174;
	Mon, 26 Oct 2020 13:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18386E174
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:17:08 +0000 (UTC)
Date: Mon, 26 Oct 2020 13:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603718225;
 bh=PTSApkk3ASYdkVdJl8Vv/zY3AnAjoynNACsXSOxnfhc=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=XRMggTarJWrwH4hEDcRcXaFyQMoR6/ON5hxSlyp0zbd6UrhHNcY5yrSNlrxChVSAx
 Fppib6YtqSebgU2iIyHCJkHxMveZFDY+x5o4i2jWJ0wP/iXi31XchkE12bq3x7hZIV
 B2u/kuglfKV84DRT83ouL61A2LdzcLAVGkQKQEek2x7xc5y1HKL76uNd/y0k7g34X1
 clvQr0ETwjsGIv4hqjmEUfcuhnoO3JW5u1deq5ZgEP+Rla7Fusg2PvVfR19G7S1IMQ
 JS5ET56lWDKuKzF1o+ItD9HjfLlYGz4KWIYJlRt827uh9RtCdW7yITN9JuDZmPokM4
 XoGRzbv7w3Ysg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: deprecate DRM_FORMAT_MOD_NONE
Message-ID: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_FORMAT_MOD_NONE is in the list of vendors, which is pretty
confusing. We already have DRM_FORMAT_MOD_VENDOR_NONE. Move it down in
the list of format modifiers.

DRM_FORMAT_MOD_NONE is an alias for DRM_FORMAT_MOD_LINEAR, however the
name is confusing: NONE doesn't mean that the modifier is implicit,
instead it means that the layout is linear. Deprecate it.

Signed-off-by: Simon Ser <contact@emersion.fr>
Suggested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm_fourcc.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index d720f1e8ae5e..ca1d5587b5fc 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -350,7 +350,6 @@ extern "C" {
  */
 
 /* Vendor Ids: */
-#define DRM_FORMAT_MOD_NONE           0
 #define DRM_FORMAT_MOD_VENDOR_NONE    0
 #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
 #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
@@ -422,6 +421,14 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_LINEAR	fourcc_mod_code(NONE, 0)
 
+/*
+ * Deprecated: use DRM_FORMAT_MOD_LINEAR instead
+ *
+ * The "none" format modifier doesn't actually mean that the modifier is
+ * implicit, instead it means that the layout is linear.
+ */
+#define DRM_FORMAT_MOD_NONE	0
+
 /* Intel framebuffer modifiers */
 
 /*
-- 
2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
