Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3851353C09
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 08:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6656E12A;
	Mon,  5 Apr 2021 06:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F2A6E12A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 06:14:33 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id t20so5171036plr.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Apr 2021 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/IfExfus1vocG71Vx4LOl+ryphcS1zaeMleudxBDVe4=;
 b=LNqJUbOBmtkq/pIR+aMV8v+ADtgKF2hv6BhM2ORxRQAZYP+bDu2hZ5gYWoWmyxTVoS
 gLAv7dTIaUTUYZVJiIC8oQJ4JR8znjaC6xNwgQI2Fd9VokuQTyYtujXadRn/mnURerSI
 LgSFFeJYRzp9D7ZTJTcjBP2Fc/eRfgutsP3PJw2i9GAjaiz8hluidJFTtv/BCJPODZWM
 btpw5ZU9iSNccmFwvTxGBh+SNs9hZQkkb3jgpgcedQw9q2D4aYeQnk/CrXVonQtg+Z3H
 1iPENJ9vTO5Jj+AkW0UHvG2Y67y4mQUAUaG1nkZid/MEet/sWRm2PVtLZJltdDF/X5TF
 kDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/IfExfus1vocG71Vx4LOl+ryphcS1zaeMleudxBDVe4=;
 b=pUw4ZtVhtDRLO3a4KmZr2u4LipEBqaF8oLjm6WA2VPJn0xB9E3txJM7prrXxglQq7o
 XpMp8jgOPvLdBcY31txyhrBlvgUFIr3TrZu384PCSykNlwfQ4vxmjX1LxYMa/OjQmal+
 1At39M2D3n8QowxFCcQurYIfN5IRAl7609UtD0aiteNRLyDJpJKcVzX8uQghmV3rbSdN
 WFKPJOK7tPjvp5wOd/wVTyWgtpPZOic6ox+hlSbpHynuMCjGaXObLvw0OZPbuRGex0kN
 A+Ns4R4Y5EZkGfVPTpPCjwcVaYPrsa3wuApYqb89B+fW3NQhYJDhFiAVPQGMPWoejCGo
 W0rA==
X-Gm-Message-State: AOAM531N7OHXkYehq8DAJeme2tZA7tzVbvoR8tjoRa2HpS8sdpiSJwHd
 Mv2vnmN45e+Ans144jQuf68=
X-Google-Smtp-Source: ABdhPJw5C1RHbU+Vyv09zgSuaDM1ux/Oavq8hzT4zWBRDFqRDxRcDHwcb/ShyV5d2O9IJpBovppm2Q==
X-Received: by 2002:a17:90a:eb93:: with SMTP id
 o19mr15106473pjy.59.1617603273447; 
 Sun, 04 Apr 2021 23:14:33 -0700 (PDT)
Received: from adolin ([49.207.194.193])
 by smtp.gmail.com with ESMTPSA id em16sm3320954pjb.43.2021.04.04.23.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 23:14:33 -0700 (PDT)
Date: Mon, 5 Apr 2021 11:44:28 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V4 1/2] drm/vkms: Refactor vkms_composer_worker() to prep for
 virtual_hw mode
Message-ID: <ab3492843ea631c51a3ff8dcf8e3f7af96aaed60.1617602076.git.sylphrenadin@gmail.com>
References: <cover.1617602076.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1617602076.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add two new functions vkms_composer_common() and vkms_crtc_composer().
The actual plane composition work has been moved to the helper function,
vkms_composer_common() which is called by both vkms_composer_worker()
and vkms_crtc_composer(). vkms_crtc_composer() can be used when we
implement virtual_hw mode.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
Changes in V4:
- Fix warning
Changes in V3:
- Refactor patchset (Melissa)
Change in V2:
- Add vkms_composer_common() (Daniel)
---
 drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_drv.h      |  3 +
 2 files changed, 58 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 66c6842d70db..0d2bad3ff849 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -169,6 +169,44 @@ static int compose_planes(void **vaddr_out,
 	return 0;
 }
 
+int vkms_composer_common(struct vkms_crtc_state *crtc_state,
+			 struct vkms_output *out, bool wb_pending, uint32_t *crc32)
+{
+	struct vkms_composer *primary_composer = NULL;
+	struct vkms_composer *cursor_composer = NULL;
+	void *vaddr_out = NULL;
+	int ret;
+
+	if (crtc_state->num_active_planes >= 1)
+		primary_composer = crtc_state->active_planes[0]->composer;
+	if (crtc_state->num_active_planes == 2)
+		cursor_composer = crtc_state->active_planes[1]->composer;
+	if (!primary_composer)
+		return -EINVAL;
+	if (wb_pending)
+		vaddr_out = crtc_state->active_writeback;
+
+	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	if (ret) {
+		if (ret == -EINVAL && !wb_pending)
+			kfree(vaddr_out);
+		return -EINVAL;
+	}
+
+	*crc32 = compute_crc(vaddr_out, primary_composer);
+
+	if (wb_pending) {
+		drm_writeback_signal_completion(&out->wb_connector, 0);
+		spin_lock_irq(&out->composer_lock);
+		crtc_state->wb_pending = false;
+		spin_unlock_irq(&out->composer_lock);
+	} else {
+		kfree(vaddr_out);
+	}
+
+	return 0;
+}
+
 /**
  * vkms_composer_worker - ordered work_struct to compute CRC
  *
@@ -185,12 +223,9 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-	struct vkms_composer *primary_composer = NULL;
-	struct vkms_composer *cursor_composer = NULL;
 	bool crc_pending, wb_pending;
-	void *vaddr_out = NULL;
-	u32 crc32 = 0;
 	u64 frame_start, frame_end;
+	u32 crc32 = 0;
 	int ret;
 
 	spin_lock_irq(&out->composer_lock);
@@ -210,36 +245,9 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (crtc_state->num_active_planes >= 1)
-		primary_composer = crtc_state->active_planes[0]->composer;
-
-	if (crtc_state->num_active_planes == 2)
-		cursor_composer = crtc_state->active_planes[1]->composer;
-
-	if (!primary_composer)
-		return;
-
-	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback;
-
-	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
+	ret = vkms_composer_common(crtc_state, out, wb_pending, &crc32);
+	if (ret == -EINVAL)
 		return;
-	}
-
-	crc32 = compute_crc(vaddr_out, primary_composer);
-
-	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
-		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
-	} else {
-		kfree(vaddr_out);
-	}
-
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
@@ -247,6 +255,20 @@ void vkms_composer_worker(struct work_struct *work)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
 
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
+{
+	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	u32 crc32 = 0;
+	int ret;
+
+	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
+	if (ret == -EINVAL)
+		return;
+
+	drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
+}
+
 static const char * const pipe_crc_sources[] = {"auto"};
 
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 35540c7c4416..538315140585 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -125,8 +125,11 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 			   size_t *values_cnt);
 
 /* Composer Support */
+int vkms_composer_common(struct vkms_crtc_state *crtc_state, struct vkms_output *out,
+			 bool wb_pending, uint32_t *crcs);
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
