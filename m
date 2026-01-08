Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10316D054E1
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 19:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE1010E155;
	Thu,  8 Jan 2026 18:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KH3S1M4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACC410E155
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 18:02:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso17530745e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767895327; x=1768500127; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ofstAZxnHRW0myvgwQHd5VmIucA9twRraLf9vJfmRbE=;
 b=KH3S1M4Mj8x3GnLfnYSGvqMPT7O/XkhpyThS8Ay05Rz9epeoW2O+3mJ7yz2ZfmMYOS
 MLlqER7da16hrZnbO+QkmksBuNz4Lj6Rowr8umvkddjNWuEY4L3UAJ3xZ8tawuGG2jH8
 H1zVyJUVUWnKRlUyWHRCJiDaSR3SnBUGgrDcahrOlReJ0xmBg1VDpgFdhq2Bq5F3gyWl
 qP76qPbbcSIUcl3cRebnY+nU7K5AIEIb3VRBJs5upjnIW3ozBVv2MwJemwBgc7m+wJDT
 hB+dUpNu6ipG5hf6wqhwvlf8oRrPWltIj1C5QTPs5QJQ+Cm6Mr3O4PYNdtwAyFvxXh35
 v6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767895327; x=1768500127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofstAZxnHRW0myvgwQHd5VmIucA9twRraLf9vJfmRbE=;
 b=cDcPI/S3ADUh7tfNC6TL3iFxs2w3OrwsNvGKHcsCBQWZLSaVcIFQrX+kUkv88arDrP
 iujzXl/gRc+MOx9tklyN0ZYUrTeFK0782ZM3eASk4ZUhdUh9qCQoCM9AxnR3AAgc7p8B
 WLG3DGfJg1dt3UemWJePPi2t+IgvZyAbvBlTsIyB7EhxpZpnzIqPdTkBKwgnnROecFLU
 FYiDEO6tHJVCwbSVg3yLlEmYnKkk2m50d2kJZ2fTrCI0m/Cu9CyCZGFYVDz3VoH5H7N2
 y4A8vbMFnnE35Jci6JfI/lenL9WeSCi1JeS0fGY/HuVYx1o5/36W0gDZbA9tGN5KWk4f
 wwIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX41ldm6hSfP76shSjtgRiEk14PIYpMBUD2h0Uw9YdTmQ2PlHfHNx01JLw5ADa5l9a/j6yvffgiXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfTrur75A7rudNPZrcaWhV8lbl3CXr5PXJUBO382st2E+ak70f
 vTwVJStRm1Z0Cqj5bRN9VBhlTxdnpBTVdUW/T0PvRlYBcSPa0z4+oVmxM8zSVfHEyvk=
X-Gm-Gg: AY/fxX7MTr8QhejKb0U2oIHUkwM2e721/FnpNh3EVLVhUFUAMzwdy5kWhOOuUhLOfTo
 GcImr3zENfh6tUqMBWXaHEZwFlVPQi0lS2Lp/osf9PGWi9IYL+V9S2GmzUZ/SvOH3COb2kzQ5Ax
 xkZ0lnfRdca/oHQts/ckV5vVdkG1z4SmI0ULwPuL/HWZExkZWNYrgY/47gpX8QuMGn/OsBCgb4I
 YHJVWnFP/iTaXjDEzl8/ewNAyVZ+DlPrPtBqgsh+0by6D7Bvb5gFZIF6PIWd7Hznt94XDMCa075
 GXQWAmKsIxmh2TuOP6nUBpCbBixMXaCqQR6wV8VLW02/bpLw2XvVy8VkTpiHJVHIEvyYdOrASqD
 Ao4W5ekQdIqnSNV88RrIsA0qGWbYJZN7lu/Jy2tIQA12w0yx7oJCyWvP1xDJaribAfjo4JPlux9
 9ZUfrkqx5A2wJl
X-Google-Smtp-Source: AGHT+IHuJPs2pwNlk9eJ8NAkY60O93gd4KzJGgDlQPNgcPwE17tnxzmYkkPIJLWzyVbgAz7j3VGjLg==
X-Received: by 2002:a05:600c:1392:b0:477:a9e:859a with SMTP id
 5b1f17b1804b1-47d84b3b5f6mr81282245e9.22.1767895326008; 
 Thu, 08 Jan 2026 10:02:06 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6f0e15sm159929665e9.10.2026.01.08.10.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 10:02:05 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: fix WQ_MEM_RECLAIM passed as max_active to
 alloc_workqueue()
Date: Thu,  8 Jan 2026 19:01:48 +0100
Message-ID: <20260108180148.423062-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Workqueue xe-ggtt-wq has been allocated using WQ_MEM_RECLAIM, but
the flag has been passed as 3rd parameter (max_active) instead
of 2nd (flags) creating the workqueue as per-cpu with max_active = 8
(the WQ_MEM_RECLAIM value).

So change this by set WQ_MEM_RECLAIM as the 2nd parameter with a
default max_active.

Fixes: 60df57e496e4 ("drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM")
Cc: stable@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ef481b334af4..793d7324a395 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -322,7 +322,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM, 0);
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-- 
2.52.0

