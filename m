Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB5469375
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4B873F6D;
	Mon,  6 Dec 2021 10:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD876E8A0;
 Sat,  4 Dec 2021 10:55:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z7so12770143lfi.11;
 Sat, 04 Dec 2021 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J16kucgpxxFj0SceQv3cDVzmFp/VklNjZX1TRul+m8Y=;
 b=KTxS8CAlcFPuXjGbMPumG7q97zGouOde1CcmY7L/uLuhADnM4BcoJMaeom0EXCX84t
 pny52CZzamXSPOcEbdxdNpKGjGeanjhnAT56YOLMDbwy6NgskLRwtl29B+r7HOWTrSEP
 3YJbDPxh1P7Hxb5p/8UtPbREgpkKOXWnS/rZJVrSZ/agE9Ih+6o7nzIHAle49Mkth6fs
 AniTatkRxe5vpY2hGkli8edWmJbyz34xDpWZPmbAPO1Di55UFktRXW0U+8XWCjtGh8YX
 Y6FzqFJ8BC8YDfuJ4/r4TMHLD8Iqco18BRrI0hdg03pH44+5ngMJ9G/OpWhKkZFpjqx8
 65qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J16kucgpxxFj0SceQv3cDVzmFp/VklNjZX1TRul+m8Y=;
 b=ilDdmsz2MSyfAS57RPeCqZ6JPWG2alIU72atjtK3fEtKGVlZ0yuIGcanBHued99G8T
 5zRTZgWqKI/QizRMcqSFC+o7pQVqD3cXCR1dlWLVGaWJERNGk+l20NrF9tUCjRdCrPEP
 3yb0T/tWHhAsxR+golhKNuv9d7GPRSlBRJgJ4+SReIHNWHbeUjfgRFXqyuIWusiNLSfI
 qYRIi0f8OrdH+ehm13m0bUceMcRKHAk9xfMbmkD3d1japPRc0ArL/9gv3gJG7cG+Wi2l
 pFuodSnS+i2t6/Q4ve+9pVdriL+PoT0NHogd0wDz9SamsT16IJQTnmHD65J5vYV/fl9E
 rEPQ==
X-Gm-Message-State: AOAM531LogKoUzpGsSaWeIpSuLE3m85VMV8ytBR4QxoxOa7id2sD0TuY
 cT49LmXc5A7YbyroFuPbj34=
X-Google-Smtp-Source: ABdhPJxnHBBiPnzp0Q9S5ostX7DrJZwnx/uVFjAfrciWbmhTvWDenGzboQjNhJgA/NdKbesvHKcvRQ==
X-Received: by 2002:a05:6512:3ca4:: with SMTP id
 h36mr23357327lfv.411.1638615338968; 
 Sat, 04 Dec 2021 02:55:38 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:38 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/9] drm/i915/gvt: Constify intel_gvt_sched_policy_ops
Date: Sat,  4 Dec 2021 11:55:22 +0100
Message-Id: <20211204105527.15741-5-rikard.falkeborn@gmail.com>
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
 drivers/gpu/drm/i915/gvt/sched_policy.c | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.c b/drivers/gpu/drm/i915/gvt/sched_policy.c
index 036b74fe9298..c077fb4674f0 100644
--- a/drivers/gpu/drm/i915/gvt/sched_policy.c
+++ b/drivers/gpu/drm/i915/gvt/sched_policy.c
@@ -368,7 +368,7 @@ static void tbs_sched_stop_schedule(struct intel_vgpu *vgpu)
 	vgpu_data->active = false;
 }
 
-static struct intel_gvt_sched_policy_ops tbs_schedule_ops = {
+static const struct intel_gvt_sched_policy_ops tbs_schedule_ops = {
 	.init = tbs_sched_init,
 	.clean = tbs_sched_clean,
 	.init_vgpu = tbs_sched_init_vgpu,
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i915/gvt/scheduler.h
index 7c86984a842f..1f391b3da2cc 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.h
+++ b/drivers/gpu/drm/i915/gvt/scheduler.h
@@ -56,7 +56,7 @@ struct intel_gvt_workload_scheduler {
 	wait_queue_head_t waitq[I915_NUM_ENGINES];
 
 	void *sched_data;
-	struct intel_gvt_sched_policy_ops *sched_ops;
+	const struct intel_gvt_sched_policy_ops *sched_ops;
 };
 
 #define INDIRECT_CTX_ADDR_MASK 0xffffffc0
-- 
2.34.1

