Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688202C8092
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181C46E43D;
	Mon, 30 Nov 2020 09:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2A6E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:08:31 +0000 (UTC)
Date: Mon, 30 Nov 2020 09:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606727308;
 bh=IR3DcdjsoRVuVZ4rtvKRvqddXRleaItnhvHKv4WO6xg=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=lDLw0jNxG2eR+iZthRaijL5sMOAC56hGDvqA4zospJObyPFkeg68vMayNpctOPTSo
 lrc9YV5cuX6r9tG0Tcsd0X/+cR+Z553ToZCAtS3IvsHtv/0LJ3y0qu0p2C87oG/rNG
 em+lYHDsAuDaspvLXAQa7bXGlRcecHTQ0jf67fuVt61z/Ewz2xW/th4chXgNvnLJyz
 aDk191fQC5xvoMaXvYqMblQJdU2Jp0n8/r6HKLwbnEdEw2UHoNhp8RUDzf91YXIE3T
 0ETylw5ipMV2ECsXSZgl3J5mgP5e8aMlYWjKUjpWIrw3MNPvkP1K+w28EfOvdBSn5U
 fERX7Ay2Vk1yQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document that user-space should force-probe connectors
Message-ID: <PMgUyeZTj1TlgnS4s5MIkNFDuGbth7EfFW73Gq2fQ@cp4-web-038.plabs.ch>
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

Signed-off-by: Simon Ser <contact@emersion.fr>
Fixes: 2ac5ef3b2362 ("drm: document drm_mode_get_connector")
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/drm_mode.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index b49fbf2bdc40..2e99f29d7f81 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -414,15 +414,10 @@ enum drm_mode_subconnector {
  *
  * If the @count_modes field is set to zero, the kernel will perform a forced
  * probe on the connector to refresh the connector status, modes and EDID.
- * A forced-probe can be slow and the ioctl will block. A force-probe can cause
- * flickering and temporary freezes, so it should not be performed
- * automatically.
+ * A forced-probe can be slow and the ioctl will block.
  *
- * User-space shouldn't need to force-probe connectors in general: the kernel
- * will automatically take care of probing connectors that don't support
- * hot-plug detection when appropriate. However, user-space may force-probe
- * connectors on user request (e.g. clicking a "Scan connectors" button, or
- * opening a UI to manage screens).
+ * User-space needs to force-probe connectors to ensure their metadata is
+ * up-to-date.
  */
 struct drm_mode_get_connector {
 	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
