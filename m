Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF3363BC5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 08:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A90589E52;
	Mon, 19 Apr 2021 06:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Mon, 19 Apr 2021 03:11:25 UTC
Received: from cvs.openbsd.org (cvs.openbsd.org [199.185.137.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD7C6E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 03:11:25 +0000 (UTC)
Received: from lenny.nest.cx (localhost [127.0.0.1])
 by cvs.openbsd.org (OpenSMTPD) with ESMTP id 43f383b7
 for <dri-devel@lists.freedesktop.org>;
 Sun, 18 Apr 2021 21:04:44 -0600 (MDT)
From: Greg Steuck <gnezdo@openbsd.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/drm_edid: Read within initialized memory bounds (fix
 off by one)
Date: Sun, 18 Apr 2021 20:04:43 -0700
Message-ID: <87wnszm0tw.fsf@lenny.nest.cx>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (berkeley-unix)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Apr 2021 06:42:50 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is my first patch which I tested to work on OpenBSD and then
confirmed compiling in Linux.

From c4f815bf0fa55a3a68caa7c721ea3dd8ac5c3d29 Mon Sep 17 00:00:00 2001
From: Greg Steuck <linux-drm@nest.cx>
Date: Thu, 15 Apr 2021 21:44:57 -0700
Subject: [PATCH] drm/drm_edid: Read within initialized memory bounds (fix off
 by one)

The problem manifests as a memory out of bounds kernel panic in
OpenBSD which uses this code. The buggy error reporting code path
likely never runs with nominal hardware.

drm_do_get_edid at carp used to invoke connector_bad_edid was num_exts
of 1 even though edid at that point is only allocated a memory block
of size EDID_LENGTH. This in turn led to drm_edid_block_checksum
trying to read memory in the range [edid + EDID_LENGTH, edid +
2*EDID_LENGTH) i.e. outside the allocated boundaries. A similar if a
bit more complicated analysis applies to the other call to
connector_bad_edid. Switching to using valid_extensions limits
connector_bad_edid memory reading to the memory previously written by
drm_do_get_edid.

OpenBSD bug report https://marc.info/?l=openbsd-bugs&m=161794843427437

Signed-off-by: Greg Steuck <linux-drm@nest.cx>
---
 drivers/gpu/drm/drm_edid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 81d5f2524246..f731bf7ac715 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1831,20 +1831,20 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
 }
 
 static void connector_bad_edid(struct drm_connector *connector,
-			       u8 *edid, int num_blocks)
+			       u8 *edid, int valid_extensions)
 {
 	int i;
 	u8 num_of_ext = edid[0x7e];
 
 	/* Calculate real checksum for the last edid extension block data */
 	connector->real_edid_checksum =
-		drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
+		drm_edid_block_checksum(edid + valid_extensions * EDID_LENGTH);
 
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
 
 	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
-	for (i = 0; i < num_blocks; i++) {
+	for (i = 0; i <= valid_extensions; i++) {
 		u8 *block = edid + i * EDID_LENGTH;
 		char prefix[20];
 
@@ -1983,7 +1983,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (valid_extensions != edid[0x7e]) {
 		u8 *base;
 
-		connector_bad_edid(connector, edid, edid[0x7e] + 1);
+		connector_bad_edid(connector, edid, valid_extensions);
 
 		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
 		edid[0x7e] = valid_extensions;
@@ -2011,7 +2011,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	return (struct edid *)edid;
 
 carp:
-	connector_bad_edid(connector, edid, 1);
+	connector_bad_edid(connector, edid, 0);
 out:
 	kfree(edid);
 	return NULL;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
