Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2C95BC376
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154A010E54E;
	Mon, 19 Sep 2022 07:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D0E10E052;
 Sun, 18 Sep 2022 22:07:48 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 9so15234378pfz.12;
 Sun, 18 Sep 2022 15:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=oAZa73Ms9QVpxhmjRkhl/oIipHOwLafi4P86QyHcFa0=;
 b=JEqFXyJwbJqlQ1qM4Gt7ZjSBcNjtwpvDggFsPm5D4V0iTzm7x5O/OLEiX2y1gkvfi3
 gBzFqyPlL801WgcyDu9JWXbrzmemvUutUINjW0Lf7zTpYvCCJkMPbAptr0sIPbyRiVhW
 6wWxPRvSYQYYaIwdSvq/F4dgq26b9JUkye7k5mVBqwvUw1QtBcAZDDvH0lqRTHR/9pL9
 8ZvIeVAhaTi645806bbFpTPkjcvkk/KfuUDVGcXn3jIz96y2db72BkM1m3UrHWUaxqzJ
 Xq2vV+BtZfA+HIbcewUbkKwNz4mrhyYNdn/EvYUJVgO3lps7R5f4LZGWNTJIRfftXyd6
 ORjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=oAZa73Ms9QVpxhmjRkhl/oIipHOwLafi4P86QyHcFa0=;
 b=IHeMo0gM7OpXfcSsJ8YiNBXogKEKHjgsbSGW0MORbxY0rohQiFXAIeGsQLEzh0GSKn
 dQidQ5o3mZ21apKRMSUsWzQCcyW86epyT2ELapBctnDKcFmSq5eVCvXp7V22li+H6+rj
 MTMCtcNr66kMd141zaI21F8iMyNWX5sfLZKbEmSrlk1/tpPtW4TiURO1WZ4N1Tx30QLx
 1tieGZ1eTqIPxLjZpcFa2hJ5JYIQU4HhwM/V8/j2j0/uL4MWycqYty8jN6dZi9TW2TzG
 bYRCLtpvUXzXg0kH7U4aDoV57a9M+XRMjv09AMfrkYJqKU3rYdMtFsA/NC22XNzhivdL
 1j3A==
X-Gm-Message-State: ACrzQf26ujbc02KykRTAYwMiiHkQm6ZUxT61i7mCPL0pYp97zxwYLylP
 vNz2k3+8oA5uVwq8dGy7Xug=
X-Google-Smtp-Source: AMsMyM5OITmrhfBXTIMTtYY7kFUoTNgOex+iRyyFQjgfDBr5qfnfxKk5sWU8UnYONKmIlJmDfiU69A==
X-Received: by 2002:aa7:8759:0:b0:540:aad4:b13e with SMTP id
 g25-20020aa78759000000b00540aad4b13emr15687055pfo.13.1663538867560; 
 Sun, 18 Sep 2022 15:07:47 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu.
 [2607:f720:1300:3033::1:4dd]) by smtp.googlemail.com with ESMTPSA id
 u10-20020a170902e80a00b00176b63535ccsm19061232plg.193.2022.09.18.15.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 15:07:46 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v1] drivers/gpu/drm/i915/gt: Check the return value of
 i915_active_acquire()
Date: Sun, 18 Sep 2022 15:07:31 -0700
Message-Id: <20220918220731.1026200-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Sep 2022 07:18:40 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie, sumit.semwal@linaro.org,
 Li Zhong <floridsleeves@gmail.com>, rodrigo.vivi@intel.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_active_acquire() could return error when the acquire fails. Check
and return the error code.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..d8333ab64574 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -211,7 +211,10 @@ int intel_timeline_pin(struct intel_timeline *tl, struct i915_gem_ww_ctx *ww)
 	GT_TRACE(tl->gt, "timeline:%llx using HWSP offset:%x\n",
 		 tl->fence_context, tl->hwsp_offset);
 
-	i915_active_acquire(&tl->active);
+	err = i915_active_acquire(&tl->active);
+	if (err)
+		return err;
+
 	if (atomic_fetch_inc(&tl->pin_count)) {
 		i915_active_release(&tl->active);
 		__i915_vma_unpin(tl->hwsp_ggtt);
-- 
2.25.1

