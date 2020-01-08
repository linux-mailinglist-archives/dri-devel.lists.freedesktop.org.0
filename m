Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E913388A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 02:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640F86E165;
	Wed,  8 Jan 2020 01:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FD86E15F;
 Wed,  8 Jan 2020 01:39:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i23so777230pfo.2;
 Tue, 07 Jan 2020 17:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qmrdZKjfoj5CPPpFPntvvUb8XA6zxvuRpATASktYgx8=;
 b=RLBhSXVpuH7bSToM7ryiPRACsQBWcixdah7WbPGr3+ch0C2MAzFehC4pepjTsc+vVP
 xNiK5Fxxzl+cV/ntZjvoCz0VY5LDpmrib9uDBk2fC2O54Q0Tl0VjA/FCgFmsKwho/oyd
 gWoZWPrXx3rZ8CzgKHIT4KiSU4PcMGDE7zXv9xmhm5sQkK4NAVJVFnIvYp3FY+qijYrl
 R1KdCkSnjAd3P7yIvGRsNaoTqM/X/Eb+maIZ+/4Jb96uudk78emR41mqefCTDhU80mPt
 yBx1K6qaFffaVuTz0d/Wdw5p3QfpTFrozHnxxBW10HED3MND5AJnBPuHsHKp6ce6ym5u
 m0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmrdZKjfoj5CPPpFPntvvUb8XA6zxvuRpATASktYgx8=;
 b=K6j4GTx484T9/Je9N+OgKO1JXyyYdfEhsvLL+gC0q677bePEL0PZN7/xwSPsrbuPID
 pBApu/1ltSLzD2ZhfHME/d4cu9Jq0xxMk0cwXvH+a5RK1bYSs3hNDjUAJpY/30/QIdln
 8PZ8TLJxP5+Mys4Cfkler5qqltn/loMC85iFkSnNC3tntLMIeN8LzPXSmrj/g7mNs5M0
 0tfajxu4ViYAUzfYAurxblCjZYjnECnMYrHAdUelEhhvDIH8Spi5IVFEUsmlRHQ9Cri9
 eEJVt8A4oiYHv5aME0q5N9S7IPigIvBSf/vfrc+I/tFKjLSzqy9g+rgTkZFMlI/18jGj
 aMfw==
X-Gm-Message-State: APjAAAUpIwe2TtU+RmKDh5sQuV1GqRRPSo8SLsWlhP2jSIUjJJi+Wdsi
 g3m9r6FvBQ+S+80N41pOFDIGZZbcjHo=
X-Google-Smtp-Source: APXvYqw3ceWxjw28vQ+TgLakMSeqysklWmwq8fwM3OqFKNf2PYqo7dzAgVYBAG4GXWDjHotd4QIKBA==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr2448554pfn.245.1578447546754; 
 Tue, 07 Jan 2020 17:39:06 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id j2sm867160pfi.22.2020.01.07.17.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 17:39:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm: support firmware-name for zap fw
Date: Tue,  7 Jan 2020 17:38:42 -0800
Message-Id: <20200108013847.899170-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108013847.899170-1-robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Since zap firmware can be device specific, allow for a firmware-name
property in the zap node to specify which firmware to load, similarly to
the scheme used for dsp/wifi/etc.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 112e8b8a261e..aa8737bd58db 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 {
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
+	const char *signed_fwname = NULL;
 	struct device_node *np, *mem_np;
 	struct resource r;
 	phys_addr_t mem_phys;
@@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 
 	mem_phys = r.start;
 
-	/* Request the MDT file for the firmware */
-	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
+	/*
+	 * Check for a firmware-name property.  This is the new scheme
+	 * to handle firmware that may be signed with device specific
+	 * keys, allowing us to have a different zap fw path for different
+	 * devices.
+	 *
+	 * If the firmware-name property is found, we bypass the
+	 * adreno_request_fw() mechanism, because we don't need to handle
+	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
+	 *
+	 * If the firmware-name property is not found, for backwards
+	 * compatibility we fall back to the fwname from the gpulist
+	 * table.
+	 */
+	of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
+	if (signed_fwname) {
+		fwname = signed_fwname;
+		ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
+			fw = ERR_PTR(ret);
+		}
+	} else {
+		/* Request the MDT file for the firmware */
+		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
+	}
+
 	if (IS_ERR(fw)) {
 		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
 		return PTR_ERR(fw);
@@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
-	if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
+	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
 		ret = qcom_mdt_load(dev, fw, fwname, pasid,
 				mem_region, mem_phys, mem_size, NULL);
 	} else {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
