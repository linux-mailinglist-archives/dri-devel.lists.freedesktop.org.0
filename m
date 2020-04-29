Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6967D1BD4E7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0296ECAC;
	Wed, 29 Apr 2020 06:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8986E0D8;
 Wed, 29 Apr 2020 03:02:15 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k133so495865oih.12;
 Tue, 28 Apr 2020 20:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vat/A+5wAq17/5/tk88DCdniaj1GWzYrag6w3vBmDBk=;
 b=MXsmR3gGPgc/++kp1hntr5cCxudY82uhEJERwYydQonzsULfllXVQPX6adl0wfHxCR
 hN6XVdnbVjjxXY2qQZMkskbIdxMo0H0h1Vdo0c8HFek4FtH+stf1cTeAGtt1XayCTVNS
 ymmyBQaT50MAq2bWzATfqIlepoWQDKOQp5XpiaFvtzaIaeNw5AcFve7Heu0cL/JSsInO
 bzcbGgJDT2SChMtGsLWO3JK8QxWlImqiVnHx4o5mHnWuBZiBXVBxy4TJ9JEXWSXwKzPr
 +xrDm+pvPlYWWfdzamcZHFa1yGp89tCY6y86l7biE2VA4VAE+/znnWga31lPSHWhQQcf
 PI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vat/A+5wAq17/5/tk88DCdniaj1GWzYrag6w3vBmDBk=;
 b=sheahZuUhYy7bAZGeX3M4wDzA6cJGNInw1D59kMeTKnfZojkbMMMWifePFzXSFrG6V
 vjTNhcY7ayvw8BCJpqwelzicQqq3dhZmhay8HZ/gz5q2/uDDj6ZwnO5GgF6ufcpSHo1c
 8aoiaqDurgMzcR10nVsWcsJ5k7QlmLw0/nvbjmLpSEJ/lnI0DyS1liEfE/DdetlHH6sC
 vimPbmcsY/BD5d8MMkK1C3EEQgIPRJ8Ju6Sxi4pTw3/ftBoTtDDk6YtbxKmSLX1BvT3j
 fT66o6zWl1FYmJB4NX2ybpefjDpTFGufweNfVVG3gbVaCHtaCHCDZS5eMi6iMpY2rjaK
 W1Qw==
X-Gm-Message-State: AGi0PuZ+wB51XoO0mnrGW8x659GoK9zXEjZtTNHRWlqvpiUKDDU/Xo+c
 Oq9P0VIkftHYz8zv/zoH6pg=
X-Google-Smtp-Source: APiQypK+U07j9oOnyToDeRg0xLGngsqomu6PGJKgQyDCGupw7N9RnvAMb2gAndIHHsn3o5VFfOujVg==
X-Received: by 2002:aca:fc0a:: with SMTP id a10mr323869oii.77.1588129335074;
 Tue, 28 Apr 2020 20:02:15 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id m189sm4262046oig.12.2020.04.28.20.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 20:02:14 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] drm/i915/gt: Avoid uninitialized use of rpcurupei in
 frequency_show
Date: Tue, 28 Apr 2020 20:00:52 -0700
Message-Id: <20200429030051.920203-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building with clang + -Wuninitialized:

drivers/gpu/drm/i915/gt/debugfs_gt_pm.c:407:7: warning: variable
'rpcurupei' is uninitialized when used here [-Wuninitialized]
                           rpcurupei,
                           ^~~~~~~~~
drivers/gpu/drm/i915/gt/debugfs_gt_pm.c:304:16: note: initialize the
variable 'rpcurupei' to silence this warning
                u32 rpcurupei, rpcurup, rpprevup;
                             ^
                              = 0
1 warning generated.

rpupei is assigned twice; based on the second argument to
intel_uncore_read, it seems this one should have been assigned to
rpcurupei.

Fixes: 9c878557b1eb ("drm/i915/gt: Use the RPM config register to determine clk frequencies")
Link: https://github.com/ClangBuiltLinux/linux/issues/1016
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
index 3d3ef62ed89f..f6ba66206273 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
@@ -336,7 +336,7 @@ static int frequency_show(struct seq_file *m, void *unused)
 		rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
 
 		rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
-		rpupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
+		rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
 		rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
 		rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
 		rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;

base-commit: 0fd02a5d3eb7020a7e1801f8d7f01891071c85e4
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
