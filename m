Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2D2B7BCD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 11:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C756E3F2;
	Wed, 18 Nov 2020 10:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB876E3F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 10:52:18 +0000 (UTC)
Date: Wed, 18 Nov 2020 10:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605696736;
 bh=gwd2Kc82sw8Rc6Ptst6h4DMIyMS4TPsTm/hGcu8vZUM=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=ksknoyvQYpTawA3MhcDdWVpbRiBtHdEEaE4oapA4MbT3R2/uIMAydzOFdu8aFTfie
 rDCTXffm717uuY0TC930oxGvoi9yh/WjdSQ5P6pv96ah0FNLuopfvDIZeB3th+bOD2
 DbzqcvQ5RLcaMUJVQqHg+FQy2RnThVAlSSvvRlV7VJkzxaTeslCvSBqDPHIoQYED1n
 +GnRPXeFvIVoge0gcFYXz/YjdR9WdX9sYSOS6XtlWcRfrQawywJa0eOainPqknf33t
 v6emoucaX1R8BeX1hWHkOLCwU1ypVlx7NkBMzdkznN2nuabn24z2TUzI5dMPXjI2Yn
 nepqsKe3tZ1Rw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document drm_mode_get_connector
Message-ID: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
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

Document how to perform a forced probe, and when should user-space do it.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm_mode.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5ad10ab2a577..09647b799f39 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -368,6 +368,19 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
 
+/**
+ * struct drm_mode_get_connector - get connector metadata
+ *
+ * If the @count_modes field is set to zero, the kernel will perform a forced
+ * probe on the connector to refresh the connector status, modes and EDID.
+ * A forced-probe can be slow and the ioctl will block.
+ *
+ * User-space shouldn't need to force-probe connectors in general: the kernel
+ * will automatically take care of probing connectors that don't support
+ * hot-plug detection when appropriate. However, user-space may force-probe
+ * connectors on user request (e.g. clicking a "Scan connectors" button, or
+ * opening a UI to manage screens).
+ */
 struct drm_mode_get_connector {
 
 	__u64 encoders_ptr;
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
