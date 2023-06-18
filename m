Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87B734867
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 22:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F1D10E0F5;
	Sun, 18 Jun 2023 20:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B7010E0F5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 20:52:35 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id AzNvqYsw5LSaaAzNvqfd41; Sun, 18 Jun 2023 22:52:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1687121552;
 bh=hfE30K9IK7rXEnDLZJeVX8ddHPQiVgEhsGvxibEOfaw=;
 h=From:To:Cc:Subject:Date;
 b=bwidpUFgI5FGBLro01LZRgpEap6F3W1IkW3seMmj5UxJFMSQriDW4ce4ecJekQVmE
 /F4Daw9LSApRqZlPO5WvJxYlH9/0OCOp+KmMSkuopDvXrII04NEDSYaexqdEjmxcya
 JNNe1Qb0dVIu21NrGyL6g5PQNlw+tnFIKL8Z3AjXAmCLK3Ellvdh0PT6B6uzB65ogz
 ciyULM4rnNFOD0fE4xlYctcSZxbtRFHSi9UO1AYIHGyxJvcLcxPxVVvhYdbQoa7hqb
 VALI6p0MFdPLrzmVcZvp176RdPifi5QqpHmevB5PM0UUPbeDdcqd+r4IFlbnWecMWm
 QiJfraQOT5gvA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 18 Jun 2023 22:52:32 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: deller@gmx.de
Subject: [PATCH] video/hdmi: Reorder fields in 'struct hdmi_avi_infoframe'
Date: Sun, 18 Jun 2023 22:52:28 +0200
Message-Id: <f5745aeab896f8d4622ff4c3cd0475d9be6bafd8.1687121400.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Group some variables based on their sizes to reduce hole and avoid padding.
On x86_64, this shrinks the size of 'struct hdmi_avi_infoframe'
from 68 to 60 bytes.

It saves a few bytes of memory and is more cache-line friendly.

This also reduces the union hdmi_infoframe the same way.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Using pahole

Before:
======
struct hdmi_avi_infoframe {
	enum hdmi_infoframe_type   type;                 /*     0     4 */
	unsigned char              version;              /*     4     1 */
	unsigned char              length;               /*     5     1 */

	/* XXX 2 bytes hole, try to pack */

	enum hdmi_colorspace       colorspace;           /*     8     4 */
	enum hdmi_scan_mode        scan_mode;            /*    12     4 */
	enum hdmi_colorimetry      colorimetry;          /*    16     4 */
	enum hdmi_picture_aspect   picture_aspect;       /*    20     4 */
	enum hdmi_active_aspect    active_aspect;        /*    24     4 */
	bool                       itc;                  /*    28     1 */

	/* XXX 3 bytes hole, try to pack */

	enum hdmi_extended_colorimetry extended_colorimetry; /*    32     4 */
	enum hdmi_quantization_range quantization_range; /*    36     4 */
	enum hdmi_nups             nups;                 /*    40     4 */
	unsigned char              video_code;           /*    44     1 */

	/* XXX 3 bytes hole, try to pack */

	enum hdmi_ycc_quantization_range ycc_quantization_range; /*    48     4 */
	enum hdmi_content_type     content_type;         /*    52     4 */
	unsigned char              pixel_repeat;         /*    56     1 */

	/* XXX 1 byte hole, try to pack */

	short unsigned int         top_bar;              /*    58     2 */
	short unsigned int         bottom_bar;           /*    60     2 */
	short unsigned int         left_bar;             /*    62     2 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	short unsigned int         right_bar;            /*    64     2 */

	/* size: 68, cachelines: 2, members: 20 */
	/* sum members: 57, holes: 4, sum holes: 9 */
	/* padding: 2 */
	/* last cacheline: 4 bytes */
};


After:
=====
struct hdmi_avi_infoframe {
	enum hdmi_infoframe_type   type;                 /*     0     4 */
	unsigned char              version;              /*     4     1 */
	unsigned char              length;               /*     5     1 */
	bool                       itc;                  /*     6     1 */
	unsigned char              pixel_repeat;         /*     7     1 */
	enum hdmi_colorspace       colorspace;           /*     8     4 */
	enum hdmi_scan_mode        scan_mode;            /*    12     4 */
	enum hdmi_colorimetry      colorimetry;          /*    16     4 */
	enum hdmi_picture_aspect   picture_aspect;       /*    20     4 */
	enum hdmi_active_aspect    active_aspect;        /*    24     4 */
	enum hdmi_extended_colorimetry extended_colorimetry; /*    28     4 */
	enum hdmi_quantization_range quantization_range; /*    32     4 */
	enum hdmi_nups             nups;                 /*    36     4 */
	unsigned char              video_code;           /*    40     1 */

	/* XXX 3 bytes hole, try to pack */

	enum hdmi_ycc_quantization_range ycc_quantization_range; /*    44     4 */
	enum hdmi_content_type     content_type;         /*    48     4 */
	short unsigned int         top_bar;              /*    52     2 */
	short unsigned int         bottom_bar;           /*    54     2 */
	short unsigned int         left_bar;             /*    56     2 */
	short unsigned int         right_bar;            /*    58     2 */

	/* size: 60, cachelines: 1, members: 20 */
	/* sum members: 57, holes: 1, sum holes: 3 */
	/* last cacheline: 60 bytes */
};
---
 include/linux/hdmi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 2f4dcc8d060e..3bb87bf6bc65 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -170,19 +170,19 @@ struct hdmi_avi_infoframe {
 	enum hdmi_infoframe_type type;
 	unsigned char version;
 	unsigned char length;
+	bool itc;
+	unsigned char pixel_repeat;
 	enum hdmi_colorspace colorspace;
 	enum hdmi_scan_mode scan_mode;
 	enum hdmi_colorimetry colorimetry;
 	enum hdmi_picture_aspect picture_aspect;
 	enum hdmi_active_aspect active_aspect;
-	bool itc;
 	enum hdmi_extended_colorimetry extended_colorimetry;
 	enum hdmi_quantization_range quantization_range;
 	enum hdmi_nups nups;
 	unsigned char video_code;
 	enum hdmi_ycc_quantization_range ycc_quantization_range;
 	enum hdmi_content_type content_type;
-	unsigned char pixel_repeat;
 	unsigned short top_bar;
 	unsigned short bottom_bar;
 	unsigned short left_bar;
-- 
2.34.1

