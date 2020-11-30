Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A662C8965
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 17:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856006E588;
	Mon, 30 Nov 2020 16:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36DD6E588
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 16:26:20 +0000 (UTC)
Date: Mon, 30 Nov 2020 16:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606753577;
 bh=dZ+2Pl+KVgCtGUYNX9hD5fpJINhreoChb+IeaNn/Xjw=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=TUJrPO3U9CZf6q3VU1qvaW9rb8KFSof/RyFJTH6I88xMp7f/bO+NICKrTaduA8B3s
 AF5FFwKZbM7VEJFZ77AcpQ3AxsecGiuRbhsTMoqq3l1T+v8t+/by/VLideDqFP3hSN
 T/7qaguWtIGggEUc3hi/Qdbk0c3E7C+PcatD4cmHBjUnQSP5/nKxIZumVX2PQzGkeL
 yGoPH9OK+njzudCZZk+lBzQuURodupE6sXPpxwg5btzvBXrpCPqNIHtmwe5bFv2QXZ
 qYnM3aNDo+w2Of3uPLTQc+1TT8unkttZBztjgc6SzPGVIddFBYiMPAmh+l7UG3I5/O
 5M+QcnTjNsY+Q==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document that user-space should force-probe connectors
Message-ID: <AxqLnTAsFCRishOVB5CLsqIesmrMrm7oytnOVB7oPA@cp7-web-043.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems like we can't have nice things, so let's just document the
disappointing behaviour instead.

The previous version assumed the kernel would perform the probing work
when appropriate, however this is not the case today. Update the
documentation to reflect reality.

v2:

- Improve commit message to explain why this change is made (Pekka)
- Keep the bit about flickering (Daniel)
- Explain when user-space should force-probe, and when it shouldn't (Daniel)

Signed-off-by: Simon Ser <contact@emersion.fr>
Fixes: 2ac5ef3b2362 ("drm: document drm_mode_get_connector")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/drm_mode.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index b49fbf2bdc40..1c064627e6c3 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -414,15 +414,12 @@ enum drm_mode_subconnector {
  *
  * If the @count_modes field is set to zero, the kernel will perform a forced
  * probe on the connector to refresh the connector status, modes and EDID.
- * A forced-probe can be slow and the ioctl will block. A force-probe can cause
- * flickering and temporary freezes, so it should not be performed
- * automatically.
+ * A forced-probe can be slow, might cause flickering and the ioctl will block.
  *
- * User-space shouldn't need to force-probe connectors in general: the kernel
- * will automatically take care of probing connectors that don't support
- * hot-plug detection when appropriate. However, user-space may force-probe
- * connectors on user request (e.g. clicking a "Scan connectors" button, or
- * opening a UI to manage screens).
+ * User-space needs to force-probe connectors to ensure their metadata is
+ * up-to-date at startup and after receiving a hot-plug event. User-space
+ * may perform a forced-probe when the user explicitly requests it. User-space
+ * shouldn't perform a forced-probe in other situations.
  */
 struct drm_mode_get_connector {
 	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
