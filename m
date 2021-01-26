Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD553055A8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7476E5BB;
	Wed, 27 Jan 2021 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03A16E44E;
 Tue, 26 Jan 2021 20:59:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id r12so24980939ejb.9;
 Tue, 26 Jan 2021 12:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkWc8jdaLg/m0l0bUIXMZoNlWUmtThzXolrQWgPDX9A=;
 b=SFgx+1jwDHwJl5/pYtVEUsFV+wBy/bBhSy0FXJgKgD+ttppOw8/W/4THhlOgTHHSjW
 5LV23rvCou1k0Vl3fhFTbbFDO6sPwRbDQOu73Yfdvo8i4hzlBH2dU8kyAJzcnnyryHDC
 CxKjBL+GGf/k33tub7BYkHJzDr9CSoVSkePsFaT/rjhT++hqA33QE2CwyKgfHjk2G9Nd
 cWGLm7Jh/Qs3kbVDKsurij+3rxco0k9O67c7e0f0v3sOf63I452GqmLfROKpbkUn7keW
 ZntnhN/MSqUTcje+Z2rZ2pGKDovVxUpzFu590X9P06W9Ef/YBFm34vMp0/bN/TBwd9C3
 72wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LkWc8jdaLg/m0l0bUIXMZoNlWUmtThzXolrQWgPDX9A=;
 b=Aaa+pmnZgCRNIqogsYXbNb93eiWGzg2OxaViFFRXaOgRH6xP1DvWch7gNk1a6BNZPZ
 tNnBctQR7utg7X/aM8ascIaQoWQqd0CJIRYvvi4V/qsdqh1qlHoPhwv0gIzOnlYrHTwd
 uteLK8Ci+28M00BesOZIhxnyntSW8YWklaI9BbsBUWUekMI97b9k1Vxvf/O5CcjcxC6J
 QG0VpUjAuRU5uSW4UCOXprziiMKhwMaQryeyaaEUzGuzIyPran+aC3ge0E6zt3FWXhHh
 4ahVLvZMOueqYVXZY+R2r5gtxXcfu/lsGZ+48EcHvHI2HLVz9b3dPBI+IVCvFxfQqfiR
 DnNw==
X-Gm-Message-State: AOAM531VVwA3aQTPleGnaBqCsxg1s4j3ReBeRklwdUKQabriPqQPp4Qc
 VUo7Z8aBXAnUDmNymnhviZTvU6OstsiM/g==
X-Google-Smtp-Source: ABdhPJxFRsDnpx0/61JI/BZ8ao9iHInjvmWiWg+yTrONOjF/ZpTZgSOaez4fYwoHjCfeEeLRCb967Q==
X-Received: by 2002:a17:906:4451:: with SMTP id
 i17mr3044930ejp.436.1611694748684; 
 Tue, 26 Jan 2021 12:59:08 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:9ff1:8caf:ad1a:a1f7])
 by smtp.gmail.com with ESMTPSA id bd5sm12660434edb.86.2021.01.26.12.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 12:59:08 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: Chris Wilson <chris@chris-wilson.co.uk>,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: use new tasklet API in execlist selftest
Date: Tue, 26 Jan 2021 21:59:02 +0100
Message-Id: <20210126205902.5584-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the execlist selftest to use the new tasklet API in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
Hi Chris,

I seem to have missed some tasklist manipulation in the execlist
selftest.  Feel free to squash this into my previous patch
("drm/i915/gt: use new tasklet API for execution list")
or leave it like this. Whatever is fine by me.

/Emil
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 264b5ebdb021..ba55cd018f5b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -609,7 +609,7 @@ static int live_hold_reset(void *arg)
 		}
 		tasklet_disable(&engine->execlists.tasklet);
 
-		engine->execlists.tasklet.func(engine->execlists.tasklet.data);
+		engine->execlists.tasklet.callback(&engine->execlists.tasklet);
 		GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
 
 		i915_request_get(rq);
@@ -4610,7 +4610,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	}
 	tasklet_disable(&engine->execlists.tasklet);
 
-	engine->execlists.tasklet.func(engine->execlists.tasklet.data);
+	engine->execlists.tasklet.callback(&engine->execlists.tasklet);
 	GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
 
 	/* Fake a preemption event; failed of course */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
