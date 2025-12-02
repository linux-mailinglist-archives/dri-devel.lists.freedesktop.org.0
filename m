Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC7C9E283
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6210E72D;
	Wed,  3 Dec 2025 08:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="fBmt28m+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0310E09B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:To:Cc
 :Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r4yy5wD39o8e15O2aqcJR8022NKgKo8GxG0hqIMNDs0=; b=f
 Bmt28m+yrtY3uwB5IIUp6MZiY4EWZNCLdNczaJ0otXE9fvQUAuu5JScQxemSgz6v5vyb+lsiPW5Cn
 JOniydczidthVMMYnH5+fC8xN1/rNgpElUSUdaK7RX1u5l95B3FYlW0G7xwL/r8eDK6eqZVdFaPWr
 0fjs507SV5UenYw/w16Elg3VHHddtAllxSEcmhZXmJoemGsCS+H62V0M/b0XJT2bV5Y2JZocGxLWI
 ivODYCUcuJQpDSkpYPzb46KKJPFbHthnGnT50dPQzcrOT1vi/WkGvQEI9t9JucG2qEqvrtjNgvV7H
 UmA9NS1M/ciNVRNjk9+Z4Kr4OjQfP3GxQ==;
Date: Tue, 02 Dec 2025 16:42:28 +0100 (CET)
Message-Id: <20251202.164228.1439289308743755090.rene@exactco.de>
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mgag200: fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Dec 2025 08:11:25 +0000
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

Unlike the original deleted Matrox mga driver, the new mgag200 driver
has the frame-buffer RGBX swapped on big-endian RISC systems. Fix by
enabling byte swapping "PowerPC" OPMODE for any __BIG_ENDIAN config.

Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Signed-off-by: René Rebe <rene@exactco.de>
---
Tested on IBM 43p Model 150 (7043-150) running T2/Linux.
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 951d715dea30..9073063f6473 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -655,6 +655,20 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 	else
 		mgag200_crtc_fill_gamma(mdev, format);
 
+#ifdef __BIG_ENDIAN
+	/* Big-endian byte-swapping */
+	switch (format->format) {
+	case DRM_FORMAT_RGB565:
+		WREG32(MGAREG_OPMODE, 1 << 16);
+		break;
+	case DRM_FORMAT_XRGB8888:
+		WREG32(MGAREG_OPMODE, 2 << 16);
+		break;
+	default:
+		break;
+	}
+#endif
+
 	mgag200_enable_display(mdev);
 }
 
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
