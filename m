Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C652581401
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9030210F592;
	Tue, 26 Jul 2022 13:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168798B5FC;
 Tue, 26 Jul 2022 13:16:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v17so1171237wrr.10;
 Tue, 26 Jul 2022 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Duf9LNn9G+2SxZbSGdM9LaiaWUfM9ULAz6lC3vIn2Ww=;
 b=O0nWXBcRZRg9NMM5pVwln7f7CutSP5ljI6MDNHGsSg4V4kZMp6DqJAI+1T04VHrlDA
 Z7UYCiPID76oZOvAw5uKWf1R/oRb5OcrKZfm14qHQC4Hj4KMQRfUlKdSvz/UaWTfFOWS
 MOdF8J2wFUv1zEZ6Xv5JY51HNSuS81S5lf3VvpuCWyzixwSCgGthghcAdfTbzx8uwvI9
 3x7JTbeOTt3EF9VvIQ1TWiaiYG3h2xC09KuI4V2nPnMq23dgZTymF+m+OS3NaaXGipfl
 1y33AnMWL0I3kTda9zTWVHt7jLqvMT2loEo2vEsS0Ytk3ga1seCAqPsToJ4XVqc43em8
 Nv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Duf9LNn9G+2SxZbSGdM9LaiaWUfM9ULAz6lC3vIn2Ww=;
 b=0Rc8Dx0P6pvt8Upg3rcR+j86gw7JwLsab3jhr3vf+0yjeQ54zBhoSvIEN6q/scsDL9
 aGuhpS1Z2lk7NutwpzMrh9lM5bbrzM1Cmv6u8HGClMZ7nO4EQjZEmgvig7iA9bizaajH
 k8350o1kcTWfSq9UMv2SU6rkp64yGTJ1iPfJK2myqJOjUMBnH7m55oYhoHyb6TSlncks
 nTbRFe01UF8Ce69e/SQVitvgmkhehSQelVdL0MIvaYkeo+8IzW3w8yokZAK4Zgr6oCTy
 ST4sfWHkVJosI3wXN4M1WKvCEKqoNlgSlmRMStuAw8rISDwOgJXJQFBf5RLgHGmV5Rhb
 AMmw==
X-Gm-Message-State: AJIora/WwPaAoIcSR+WFmROCynWZCrvnbwSiZn1FjX16uR+vw8q6cAVN
 PAYAMsmtEEjFSO9v4jsfEMA=
X-Google-Smtp-Source: AGRyM1u/y0Lpgy3onUxB/fFhSH4nTKydssx+mfUucmbARsinAuebYkKCLc8L7oHivhtbm4ywR7V/zQ==
X-Received: by 2002:adf:f452:0:b0:21e:86ac:cd74 with SMTP id
 f18-20020adff452000000b0021e86accd74mr7280992wrp.194.1658841414530; 
 Tue, 26 Jul 2022 06:16:54 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 az14-20020adfe18e000000b0021e529efa60sm9052731wrb.1.2022.07.26.06.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 06:16:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/gt: remove redundant pointer sseu
Date: Tue, 26 Jul 2022 14:16:52 +0100
Message-Id: <20220726131652.46462-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
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

Pointer sseu is being assigned a value that is never read. The pointer
is redundant and can be removed. Cleans up clang scan warning:

drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c:300:2: warning: Value stored
to 'sseu' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 75257bd20ff0..c0578194ab16 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -286,7 +286,6 @@ guc_capture_alloc_steered_lists_xe_lpd(struct intel_guc *guc,
 	const struct __guc_mmio_reg_descr_group *list;
 	struct __guc_mmio_reg_descr_group *extlists;
 	struct __guc_mmio_reg_descr *extarray;
-	struct sseu_dev_info *sseu;
 
 	/* In XE_LPD we only have steered registers for the render-class */
 	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
@@ -297,7 +296,6 @@ guc_capture_alloc_steered_lists_xe_lpd(struct intel_guc *guc,
 
 	num_steer_regs = ARRAY_SIZE(xe_extregs);
 
-	sseu = &gt->info.sseu;
 	for_each_ss_steering(iter, gt, slice, subslice)
 		num_tot_regs += num_steer_regs;
 
-- 
2.35.3

