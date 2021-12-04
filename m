Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85945469374
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796B73F2B;
	Mon,  6 Dec 2021 10:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9946E8A0;
 Sat,  4 Dec 2021 10:55:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id i63so11210802lji.3;
 Sat, 04 Dec 2021 02:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FRw9Z/k7zeeiNfBUE+umq2119RMum5Jsk+yzoGV5ttU=;
 b=mffbyXP3UEabJcohGAVBweaKlRVvaLvWhp40NNMlB15F0iAULi7Qvwj0TyvQIFCQlh
 3Gp2LHiOj/UsV+qXK1IRpMQ+2pOAX2mTcHeAvqlptWx8xhMuYXe5ij+7y31uDB96v2iE
 piaWlw/naJfy+HJoU8ICm7i+u6w6/wwupaa29wSYjMOUuX2IHxpBVmyy/HprzjDZOAUj
 hUQwcdqJLmWBWQbncHt2KNtZxA0s5QVh6runclkelo/elM+jfmlAjAjcdyxHCAmFu60u
 O93i051wihWOBOW+WutVeeOttoIa1DmJmBxB+RnYBXOYfFB0OY3qaMs2v3WKCw+Hh7Qv
 VSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FRw9Z/k7zeeiNfBUE+umq2119RMum5Jsk+yzoGV5ttU=;
 b=UpCA2dXbK46RMPqv/O3zBCGbF6hkUJQyKGVC7/5uhADdeLuasyQzvlCEul8tMCYbfy
 1EN3jrlhysbtHiE8PQgOvnBMYHSjFhAotyb6NPaMYHXwrGd4hZQWODWA+WwFeItIrJ9f
 RQMVUS8xunqHjtBFhs9FbH8kVAciQ6xTV1zyWqJXk4vC1ZW01PIkWNfeyFlFUednNfnZ
 XJ6J5uC4uRjsviNVuWMngMDPc1b5xeOx3FhYcAcwBKU8vRebL+QolXa6hqoufdmBduXV
 yRN9sH/GnMiSa+nCIJP1K/megcJIYRSmRdlevsiFdEbisRO+PHcLWMltqX+O9FNi6C8T
 P0PA==
X-Gm-Message-State: AOAM530YPzJybqozSxQ1i0VzlQcOBDlbpo/o1oht/uMjkVbzZz+tgcEq
 2GTpTWMDxUENY4UyQvdkOm+uMIJH3Wl2Lw==
X-Google-Smtp-Source: ABdhPJzm3adkZwkrbPosQPC+A83POT4UTPAfvrjJhT/oRuC2hlF4cf5i+N1oOCcqIgXtmDRF15SaKA==
X-Received: by 2002:a05:651c:54d:: with SMTP id
 q13mr24237727ljp.498.1638615337926; 
 Sat, 04 Dec 2021 02:55:37 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:37 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/9] drm/i915/gvt: Constify intel_gvt_irq_ops
Date: Sat,  4 Dec 2021 11:55:21 +0100
Message-Id: <20211204105527.15741-4-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are never modified, so make them const to allow the compiler to
put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/interrupt.c | 10 +++++-----
 drivers/gpu/drm/i915/gvt/interrupt.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 614b951d919f..9ccc6b1ecc28 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -176,7 +176,7 @@ int intel_vgpu_reg_imr_handler(struct intel_vgpu *vgpu,
 	unsigned int reg, void *p_data, unsigned int bytes)
 {
 	struct intel_gvt *gvt = vgpu->gvt;
-	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
+	const struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 	u32 imr = *(u32 *)p_data;
 
 	trace_write_ir(vgpu->id, "IMR", reg, imr, vgpu_vreg(vgpu, reg),
@@ -206,7 +206,7 @@ int intel_vgpu_reg_master_irq_handler(struct intel_vgpu *vgpu,
 	unsigned int reg, void *p_data, unsigned int bytes)
 {
 	struct intel_gvt *gvt = vgpu->gvt;
-	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
+	const struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 	u32 ier = *(u32 *)p_data;
 	u32 virtual_ier = vgpu_vreg(vgpu, reg);
 
@@ -246,7 +246,7 @@ int intel_vgpu_reg_ier_handler(struct intel_vgpu *vgpu,
 {
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct drm_i915_private *i915 = gvt->gt->i915;
-	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
+	const struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 	struct intel_gvt_irq_info *info;
 	u32 ier = *(u32 *)p_data;
 
@@ -604,7 +604,7 @@ static void gen8_init_irq(
 	SET_BIT_INFO(irq, 25, PCU_PCODE2DRIVER_MAILBOX, INTEL_GVT_IRQ_INFO_PCU);
 }
 
-static struct intel_gvt_irq_ops gen8_irq_ops = {
+static const struct intel_gvt_irq_ops gen8_irq_ops = {
 	.init_irq = gen8_init_irq,
 	.check_pending_irq = gen8_check_pending_irq,
 };
@@ -626,7 +626,7 @@ void intel_vgpu_trigger_virtual_event(struct intel_vgpu *vgpu,
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gvt_irq *irq = &gvt->irq;
 	gvt_event_virt_handler_t handler;
-	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
+	const struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 
 	handler = get_event_virt_handler(irq, event);
 	drm_WARN_ON(&i915->drm, !handler);
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.h b/drivers/gpu/drm/i915/gvt/interrupt.h
index 6c47d3e33161..0989e180ed54 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.h
+++ b/drivers/gpu/drm/i915/gvt/interrupt.h
@@ -203,7 +203,7 @@ struct intel_gvt_irq_map {
 
 /* structure containing device specific IRQ state */
 struct intel_gvt_irq {
-	struct intel_gvt_irq_ops *ops;
+	const struct intel_gvt_irq_ops *ops;
 	struct intel_gvt_irq_info *info[INTEL_GVT_IRQ_INFO_MAX];
 	DECLARE_BITMAP(irq_info_bitmap, INTEL_GVT_IRQ_INFO_MAX);
 	struct intel_gvt_event_info events[INTEL_GVT_EVENT_MAX];
-- 
2.34.1

