Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC1CDC8FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0610F91B;
	Wed, 24 Dec 2025 14:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Rga8Xl7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF78110F918
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:47:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso3607187f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766587637; x=1767192437; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/n2N4LnmCtF9W2G5kEXd8AwOxl6hnhqTX0TO2AWbjcs=;
 b=Rga8Xl7UD3ZbHZ6NE/u73DiMuVLDpX9L3M8zaT2NE+JqxxHJKM0NrUIq52rdFWGF0e
 jzizhJ7yU00Usxol6utjDa7PcJFlUkR1eGDbh5gRZ0tmDwG01M6dsZvtHuzlCagP9nBq
 CFdLgPqC2/P0yJxF9BR3j3kqMixH1iOmD/lLPnelgOA1Z9dSdJyWlyGHt/8e0MxHAdDa
 fr885vt2MZly68MWXja4VqQYfey7wvW9eHCF1Xg/XTqYkcYVya8yudgHDbjKFstS0pdu
 A+BbGRuUnclBGJCHLaWysxskIH/KzhLgjCLU5m+H2XQj69mio0h8SWdiP9iSUszTiCRV
 T1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766587637; x=1767192437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/n2N4LnmCtF9W2G5kEXd8AwOxl6hnhqTX0TO2AWbjcs=;
 b=q7oYmRUlnvvaVTRRtwcWAo+eeQt3c9u2LnIO+DLUeJIMCZuresrqMR9frLF7yfmGLa
 4d/wQX3w3P60NTFYqKh37peH6C424De6mumCnXMxAhMQ7gMhftAnWp1MPDX4AXHx2Bay
 COfTbrqXwvzUnLATeVfum/hYwcPkUj4YI/JOTZymEtAp3RLG3UttmHxFuEQnlKUaHVPn
 k1P9N/qNiAch79iIhLnoMvorvDZL3gybcxc/MfhRPMXkf11bJ9U5nbsqGttukB/ovhS1
 iul4+RqE21NnEjf+eQOIqz4I+sgnYYjL+9uuF9BI/I7MhPM/sJ1DxpMPItCXg1nV0aPT
 7WWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8OV8jtOXTtKX+isZba8XBV3jtHLnAw2TvTJwVX+XfRqevH8t4eMMmRnIlAQ3C2wt+6F20wnEeXi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzabx5LChxYxrrPGJBRaTQTcklV2zFeylFNPNUY4qt88L41ur+c
 sEmUkHVFc52I4o6iDR7+hjNs6hQGDU+rZgDjgwDDG9s76WKUG/BbavIv6BHoSD3L5dQ=
X-Gm-Gg: AY/fxX5JzCidhEwWQUWJfh4BalcyRMlbFtoeP/u7f2w199rmYQUGnKshy5wCf/mTYrF
 l6huWSg7oE3og/AQn4Np24m87kDDU2vLbZJKAHqPltemBJ+m3ECpA68t+MIpovXFuNxtG6UYL8t
 Tomt6y1E8VVcU3zh6sFPSDJr1X8nbSZqIw87USSo0n4ORMQXK521oUotazKm+k5k2GN6Z7wlXj+
 gpATMo84Y/jVGuBGuFpdMEZptk2kSL4Kjkj8FEYCcIqYxcUvBBArGFRxCFhgUpLU5E/3RqJ52b+
 lIVEChaVoepdIWokUGh0K3uMf24iWjpG1QEXn4WjJIg7QYRcOfsIaGOJLLY5hUHTCvdOFYAqUDe
 W2DsAefPdQsnhAyw7zNBqMKzrNmTcHo0TvxTij6iWopO0MLq4LmmPy2h0pf458dzq5TwvByzycW
 13FvXa2BMpa8av/TWiD3aIrlQEjdr+0xAU+qA=
X-Google-Smtp-Source: AGHT+IGBgdmlFeZGuAraEKzTOnYGzJONLAgugomtD+mpTKl8xRyC02+N053pGm6O+M5QjGZJai8psw==
X-Received: by 2002:a5d:58e9:0:b0:432:5b81:480 with SMTP id
 ffacd0b85a97d-4325b810a80mr11186649f8f.24.1766587637437; 
 Wed, 24 Dec 2025 06:47:17 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm1041109f8f.6.2025.12.24.06.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 06:47:17 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>
Subject: [PATCH v3 3/4] amd/amdkfd: add WQ_UNBOUND to alloc_workqueue users
Date: Wed, 24 Dec 2025 15:47:07 +0100
Message-ID: <20251224144708.61167-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224144708.61167-1-marco.crivellari@suse.com>
References: <20251224144708.61167-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

This specific workload has no benefit being per-cpu, so its behavior has
been changed using explicitly WQ_UNBOUND.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a085faac9fe1..5ecdb338b390 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -690,7 +690,8 @@ void kfd_procfs_del_queue(struct queue *q)
 int kfd_process_create_wq(void)
 {
 	if (!kfd_process_wq)
-		kfd_process_wq = alloc_workqueue("kfd_process_wq", 0, 0);
+		kfd_process_wq = alloc_workqueue("kfd_process_wq", WQ_UNBOUND,
+						 0);
 	if (!kfd_restore_wq)
 		kfd_restore_wq = alloc_ordered_workqueue("kfd_restore_wq",
 							 WQ_FREEZABLE);
-- 
2.52.0

