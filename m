Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1384C1271
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 13:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A2610E9DD;
	Wed, 23 Feb 2022 12:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04CB10E975;
 Wed, 23 Feb 2022 12:09:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so1420243wmj.0; 
 Wed, 23 Feb 2022 04:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XthWtcx8CQQ6z/Lfovl9ePMxpx3VHx/bDsastA+Xo/Y=;
 b=Y22cedrxeR+ywyVnUEBJ3MqpAQqnxuukkkbsAQRovrWabWEHabwzrgc17KdGiGOdno
 IcSfsG9xcKK/PzvfrAjNob+muSRsfRTssCmuqTuG2BcIK+G5n7awdRq11RmEftEXZvnh
 PCT24MiKvnplpPn91CXRNja1ceFgaPanB3ZtW3+5KplWtYVJtR2pm6BkopWOTggGr4MS
 fmfN8LKpVjtncGQs8v1RFqREMxuSg4hop2IeekPD+7BaebKmkEfRS3ZqoYIoUYHB2RRZ
 ffRba93CCry6mCGYojsiRTXVXoL7uzphXPQVl8sBZZSt8wYt/+IstT9JYggESauX2jFg
 BfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XthWtcx8CQQ6z/Lfovl9ePMxpx3VHx/bDsastA+Xo/Y=;
 b=D+NlO6enh1eVNzQS93ngSY+ouWmoyycxUPOAWzeRjaZ8IOkZq6/MS1zfbxp3cXvvMY
 0iB5KqrcdFjJIaZedrfDRBBUb0uB5UUUYYamB7w2vG4RIiSUoAXRHUmlDZtDbQp0l1Pt
 keYWPn0b+5sv4vApDQWhEEoP7mXUcexPPOMA/o+p+ESvqDCBTMJ5kEol8N+TOQZRWQcv
 xnZE0x1oGUHWegKXk0hCgbV+KzVTwcu3i0ckWlIzhORbMUW+kNkAgocSYiVvv02ldvJH
 p2ecanQk4NHMLCIK4U26TIRrQ/UN4/Y1Z3mvGkQ/oJgjcYuZifAohzYOam7WtpOh8MMk
 uT0w==
X-Gm-Message-State: AOAM530uGZ6uEG8i6mz0axn05O4hRrA0Ora8tuIkbZRwaw11RENP5606
 aKDVoEfTirarK3Pl3ODbVeQ=
X-Google-Smtp-Source: ABdhPJwhENDV0VlSU5f4YqTw2faSx1qMsaw+VxmLxp2w2HX7Rtqr3nK3WWBoH9/uoF2ijiMQmEtPug==
X-Received: by 2002:a05:600c:48a:b0:380:3f3a:e08e with SMTP id
 d10-20020a05600c048a00b003803f3ae08emr7160797wme.1.1645618164119; 
 Wed, 23 Feb 2022 04:09:24 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id j10sm6733042wmq.20.2022.02.23.04.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 04:09:23 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][V2] drm/i915: make a handful of read-only arrays static const
Date: Wed, 23 Feb 2022 12:09:23 +0000
Message-Id: <20220223120923.239867-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only arrays on the stack but instead make
them static const and signed 8 bit ints. Also makes the object code a
little smaller.  Reformat the statements to clear up checkpatch warning.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Make arrays signed 8 bit integers as requested by Ville Syrjälä

---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 3faea903b9ae..d49f66237ec3 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -378,10 +378,18 @@ calculate_rc_params(struct rc_parameters *rc,
 {
 	int bpc = vdsc_cfg->bits_per_component;
 	int bpp = vdsc_cfg->bits_per_pixel >> 4;
-	int ofs_und6[] = { 0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12 };
-	int ofs_und8[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
-	int ofs_und12[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
-	int ofs_und15[] = { 10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12 };
+	static const s8 ofs_und6[] = {
+		0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
+	};
+	static const s8 ofs_und8[] = {
+		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
+	};
+	static const s8 ofs_und12[] = {
+		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
+	};
+	static const s8 ofs_und15[] = {
+		10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
+	};
 	int qp_bpc_modifier = (bpc - 8) * 2;
 	u32 res, buf_i, bpp_i;
 
-- 
2.34.1

