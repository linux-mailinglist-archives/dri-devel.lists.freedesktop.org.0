Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593797AF65
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3210E469;
	Tue, 17 Sep 2024 11:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OyZUnBq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608B110E461;
 Tue, 17 Sep 2024 11:14:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53653ee23adso4891882e87.3; 
 Tue, 17 Sep 2024 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571665; x=1727176465; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
 b=OyZUnBq5naBMU15plwwYghZ+HREjrILikiot8tXeC0pEJKdoapfsj6OdZaWv+dI7mf
 aGWRr4w07ftwxm4wqpzx1KCcKnwa5skx/c7CJ++/Bnn2+tuSnshEHP6yVv484CVwkWCS
 dZc1WBeGCTznX6xar+R0lXWyBtunVIJNyoRpPFMbtmE5/ylXjL0l+aUCj1fzzQrvTafq
 hGv8Pgq9V3o0R2qyBYm7YG5JnYWFVbBgJmQ+yqOVisV3SplrCqMyIW0lCqFxvrmSKbvE
 ARjB6fU+/vD7+wV5drBcXrTgEOoYN0PiqVRZxFXTuJvK8cD/84aSO3twodM/aRtcwA2U
 3icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571665; x=1727176465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
 b=HMvrPoFnqAAP8j00bmXBo3NC+CbMTRZ6xVvadG9HpXrPrrYIPqTdnVx+WYEjTeCjDW
 M/qBWVW5GqbEx8Q9Bk1UtY+HodHuXM2hsmcKZPy8gvJ02Jj101X0AkVWkTeRxt5S+rdF
 7gTzlb6uU30k/KIaGhK6RSEU7c2eItI6xfaKZFWJnaIdgg9qy+bEg+A9aOo+b+3RzRFK
 ZGXEUnVDVG+890I4fbgGTkXorGi0xpQ4HUGAVgzndhaWpeAl+I4EXDNahzp6G0RXfZjv
 IRWh36N6HzD/vC6cCAO3KTyRvGISRDwr7mTt8kSn41QDvXAFTGMIwiptvOnSbuBrQYFy
 1WXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJbD4G1xUVwR4Lj14EwEDYhJJhbZ5foguz2lpF1c8gnqDAvF0upcs3xRTjZOaf2BQ4lWPVE+nmlBg=@lists.freedesktop.org,
 AJvYcCVOkaKSf4Z3vI6LJrImFwHkk/FCTQqZxVNYpWqi5Yeoskpdp0VrM3hYr36MnGBm61l6rh6Np0XyTSF0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy55FAXZk28vL+5mIIhyIUlYX2vriqAAQaNxcH/T9NlJwyHRcBH
 SZHfclAMqCFKNKWqrBGrC+gJ7n8gneF/x8/cYWOD/rRmEUeLyW1x
X-Google-Smtp-Source: AGHT+IE43HUTMcvg5JPGXBf28PLzvI1fH4Km7StHBX+xWMhU+QpuFfK2hgWczU0D69DxDYdSxCzUFA==
X-Received: by 2002:a05:6512:110d:b0:536:5816:82ad with SMTP id
 2adb3069b0e04-53678ff4b27mr9354969e87.57.1726571665303; 
 Tue, 17 Sep 2024 04:14:25 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:24 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:16 +0200
Subject: [PATCH v4 06/11] drm/msm/A6xx: Sync relevant adreno_pm4.xml
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-6-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=3764;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
 b=LavGzjE0gZg8Jbw1qTXAm9ohHGbmvmV5uqhK5TpSFaHXALTVqMsf4VS3aKzyRdChm90JHepAR
 NG5HoyAZn+hDbXNjPE9jVC9gu77SGobCE8Gzod4x/omBen6tlwG+nG4
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

In mesa CP_SET_CTXSWITCH_IB is renamed to CP_SET_AMBLE and some other
names are changed to match KGSL. Import those changes.

The changes have not been merged yet in mesa but are necessary for this
series.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 39 ++++++++++------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22..55a35182858c 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -581,8 +581,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
                 and forcibly switch to the indicated context.
 	</doc>
 	<value name="CP_CONTEXT_SWITCH" value="0x54" variants="A6XX"/>
-	<!-- Note, kgsl calls this CP_SET_AMBLE: -->
-	<value name="CP_SET_CTXSWITCH_IB" value="0x55" variants="A6XX-"/>
+	<value name="CP_SET_AMBLE" value="0x55" variants="A6XX-"/>
 
 	<!--
 	Seems to always have the payload:
@@ -2013,42 +2012,38 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
-<domain name="CP_SET_CTXSWITCH_IB" width="32">
+<domain name="CP_SET_AMBLE" width="32">
 	<doc>
-                Used by the userspace driver to set various IB's which are
-                executed during context save/restore for handling
-                state that isn't restored by the
-                context switch routine itself.
-	</doc>
-	<enum name="ctxswitch_ib">
-		<value name="RESTORE_IB" value="0">
+                Used by the userspace and kernel drivers to set various IB's
+                which are executed during context save/restore for handling
+                state that isn't restored by the context switch routine itself.
+  </doc>
+	<enum name="amble_type">
+		<value name="PREAMBLE_AMBLE_TYPE" value="0">
 			<doc>Executed unconditionally when switching back to the context.</doc>
 		</value>
-		<value name="YIELD_RESTORE_IB" value="1">
+		<value name="BIN_PREAMBLE_AMBLE_TYPE" value="1">
                         <doc>
 				Executed when switching back after switching
 				away during execution of
-				a CP_SET_MARKER packet with RM6_YIELD as the
-				payload *and* the normal save routine was
-				bypassed for a shorter one. I think this is
-				connected to the "skipsaverestore" bit set by
-				the kernel when preempting.
+				a CP_SET_MARKER packet with RM6_BIN_RENDER_END as the
+				payload *and* skipsaverestore is set. This is
+				expected to restore static register values not
+				saved when skipsaverestore is set.
 			</doc>
 		</value>
-		<value name="SAVE_IB" value="2">
+		<value name="POSTAMBLE_AMBLE_TYPE" value="2">
                         <doc>
 				Executed when switching away from the context,
 				except for context switches initiated via
 				CP_YIELD.
                         </doc>
 		</value>
-		<value name="RB_SAVE_IB" value="3">
+		<value name="KMD_AMBLE_TYPE" value="3">
 			<doc>
 				This can only be set by the RB (i.e. the kernel)
 				and executes with protected mode off, but
-				is otherwise similar to SAVE_IB.
-
-				Note, kgsl calls this CP_KMD_AMBLE_TYPE
+				is otherwise similar to POSTAMBLE_AMBLE_TYPE.
 			</doc>
 		</value>
 	</enum>
@@ -2060,7 +2055,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 	<reg32 offset="2" name="2">
 		<bitfield name="DWORDS" low="0" high="19" type="uint"/>
-		<bitfield name="TYPE" low="20" high="21" type="ctxswitch_ib"/>
+		<bitfield name="TYPE" low="20" high="21" type="amble_type"/>
 	</reg32>
 </domain>
 

-- 
2.46.0

