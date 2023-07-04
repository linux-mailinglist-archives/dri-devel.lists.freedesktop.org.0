Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559B7476D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B872010E301;
	Tue,  4 Jul 2023 16:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E6710E2FF;
 Tue,  4 Jul 2023 16:36:49 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-55bc22375b9so495754a12.2; 
 Tue, 04 Jul 2023 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688488608; x=1691080608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LFRDc3E8OmLDCka2bpsiEu+dF663MCo3+8JyB3tlqiA=;
 b=b8lDTLFAR2docihZsVjV18uNg9C8vC/+5Q0wSbALcHKwcbEq5Ff+VF+6DTFrHT1U6d
 ct4yryNfOCCR0UftSWdth2TX5yqzp8eGg/bJ9farhTywo+5aWW6iqxdhslhTDHwsGND0
 rkNhb232i9REaZeEgcoN48m237QjGAW9P8cmYpQ3xjRjOhIXyOxqWc0WXIW4KfCKDipC
 JoRQwvdyXvFWDAGN3D/o+tyrXe8SE7rfbLYyg+YffM4PFnCmNX/5QzTIQhXPQ4yNqHZR
 DpXo0rINg6gg/hn/acFSGOQM21bImVdG1ZJ4Uto6TT5BeyXc+bg7nAY8Pb0VEUveC+8H
 qUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688488608; x=1691080608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFRDc3E8OmLDCka2bpsiEu+dF663MCo3+8JyB3tlqiA=;
 b=UzSRJv8XLjOwu9N9SkRNl3GeeEbA/mczRoKE42KhUZBDpLnN8SMVwB0uenRfuJCN8b
 waaHIpUMh17xvkfddRCBX+M+Vun5oaZivhuHWCkprAE+WvkX26Wsim7/YW9e91a0WIGh
 TdrccTADvAQrLlUDXTYGWl8l+UIBYllK/pZhof75h2JqPcWdOwujWBHh778kbuI/xwid
 VDCqvRUW1XL6xvfKc91nF0gQLlJpTaacnVqtfbDPwJC57GOt+blEvXi91YDVEr2s3gH1
 EmY3miJ3sxylCn2XtGeXkuYSoLK9vc4PtH+KNDylyB3fJjvfOqPI9lKgYxX5uMLnNxY/
 6Ssg==
X-Gm-Message-State: ABy/qLaIjzZEa3DETH4ziYcn35mZsgyi21GuSC7ip0A7Ho1ESQ4f+hjg
 nyzTT04l7JSJv2/2B4NCtLe/efefpQI=
X-Google-Smtp-Source: APBJJlEbj7WnCbDxIv9ZoCO8MVBlhz3BBSYckJj3OB/5xPq/MNXLATSeykAMPdtKJgs3TAubTtnI9g==
X-Received: by 2002:a05:6a20:a11a:b0:12f:7a6b:63d2 with SMTP id
 q26-20020a056a20a11a00b0012f7a6b63d2mr620338pzk.6.1688488607612; 
 Tue, 04 Jul 2023 09:36:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 m12-20020aa78a0c000000b00679d3fb2f92sm13044627pfa.154.2023.07.04.09.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:36:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without revn
Date: Tue,  4 Jul 2023 09:36:39 -0700
Message-ID: <20230704163640.6162-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Recently, a WARN_ON() was introduced to ensure that revn is filled before
adreno_is_aXYZ is called. This however doesn't work very well when revn is
0 by design (such as for A635).

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 65379e4824d9..ef1bcb6b624e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
 static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 {
-	WARN_ON_ONCE(!gpu->revn);
+	/* revn can be zero, but if not is set at same time as info */
+	WARN_ON_ONCE(!gpu->info);
 
 	return gpu->revn == revn;
 }
@@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
 
 static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
-	WARN_ON_ONCE(!gpu->revn);
+	/* revn can be zero, but if not is set at same time as info */
+	WARN_ON_ONCE(!gpu->info);
 
 	return (gpu->revn < 300);
 }
 
 static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
-	WARN_ON_ONCE(!gpu->revn);
+	/* revn can be zero, but if not is set at same time as info */
+	WARN_ON_ONCE(!gpu->info);
 
 	return (gpu->revn < 210);
 }
-- 
2.41.0

