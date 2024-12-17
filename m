Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14689F400F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 02:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F8B10E1DB;
	Tue, 17 Dec 2024 01:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Tthv0tKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FB410E1DB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 01:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=vvJ4qNUEi44vMx2Ffy89gG0D5fOc9H17NxvnqOiuKjQ=; b=Tthv0tKFt2LU2XGk
 vA2H11+SwzVqEq/3jrRSHr+BMxewubJ7/w/7x6d/+6/DV+kXFCFGWJgKxblzpx4RHxd7As41234o9
 2Cz9jzWdYav8T1JQXRVZ+eEGfllIY3XBq4fqlyniFHe7UN0De7w5Fchc4zhioWbYYDCXya77xoQKF
 H532etx1TcRcE/8k84kzdo1qTJLLDYo2vFd2UARsFogTKQib/QIxQMy6KJIynL5i2fPvSGOJCnFET
 aYjsxSQSvEH9PvJS9/sPwf3H4ag3wkSEs//EZJ74g5uVF7r4ngUdC/Oz9cWva6gVZ9DvO/+qGKVBK
 eiNyJFaC9vVdsTwVNQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tNMY8-005lOw-14;
 Tue, 17 Dec 2024 01:39:00 +0000
From: linux@treblig.org
To: deller@gmx.de,
	linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] video: hdmi: Remove unused hdmi_infoframe_check
Date: Tue, 17 Dec 2024 01:38:59 +0000
Message-ID: <20241217013859.2132527-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hdmi_infoframe_check() has been unused since it was added in
commit c5e69ab35c0d ("video/hdmi: Constify infoframe passed to the pack
functions")

Remove it.

Note that the individual check functions for each type are
actually used, so they're staying.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/video/hdmi.c | 28 ----------------------------
 include/linux/hdmi.h |  1 -
 2 files changed, 29 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index ba301f3f4951..45b42f14a750 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -894,34 +894,6 @@ hdmi_vendor_any_infoframe_pack(union hdmi_vendor_any_infoframe *frame,
 	return hdmi_vendor_any_infoframe_pack_only(frame, buffer, size);
 }
 
-/**
- * hdmi_infoframe_check() - check a HDMI infoframe
- * @frame: HDMI infoframe
- *
- * Validates that the infoframe is consistent and updates derived fields
- * (eg. length) based on other fields.
- *
- * Returns 0 on success or a negative error code on failure.
- */
-int
-hdmi_infoframe_check(union hdmi_infoframe *frame)
-{
-	switch (frame->any.type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		return hdmi_avi_infoframe_check(&frame->avi);
-	case HDMI_INFOFRAME_TYPE_SPD:
-		return hdmi_spd_infoframe_check(&frame->spd);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		return hdmi_audio_infoframe_check(&frame->audio);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		return hdmi_vendor_any_infoframe_check(&frame->vendor);
-	default:
-		WARN(1, "Bad infoframe type %d\n", frame->any.type);
-		return -EINVAL;
-	}
-}
-EXPORT_SYMBOL(hdmi_infoframe_check);
-
 /**
  * hdmi_infoframe_pack_only() - write a HDMI infoframe to binary buffer
  * @frame: HDMI infoframe
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 455f855bc084..96bda41d9148 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -445,7 +445,6 @@ ssize_t hdmi_infoframe_pack(union hdmi_infoframe *frame, void *buffer,
 			    size_t size);
 ssize_t hdmi_infoframe_pack_only(const union hdmi_infoframe *frame,
 				 void *buffer, size_t size);
-int hdmi_infoframe_check(union hdmi_infoframe *frame);
 int hdmi_infoframe_unpack(union hdmi_infoframe *frame,
 			  const void *buffer, size_t size);
 void hdmi_infoframe_log(const char *level, struct device *dev,
-- 
2.47.1

