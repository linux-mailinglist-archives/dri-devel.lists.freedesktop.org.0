Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B41C245CC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DF610EAEC;
	Fri, 31 Oct 2025 10:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="eam9D8Lo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7630F10EAED
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:09:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso14544495e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761905379; x=1762510179; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AR6DCodMEiRozMtWWQUdsBs+LPg+2s6MkeWZ5TMIU0g=;
 b=eam9D8LoH2KHTz8LTAN1EI2U5Lbyj02hXTV64u+PZ6GHBqw3kDo1fR6540UabmRDHX
 peq2XK9DmhhTCp6RQ3GkziMMLJDaHOKs0UnPB7Itpp01mwe3TWisL5PmF/knub5kHeVQ
 FM+JvBfK13GkBXX+QLQwfXk+Ehl812MRCBLoBumFeUwJie3gs7GlZtruHeRXoHmWSYMJ
 HZi2TAyv2NHv8tRPu6tHfqF2UtjMW8Cii/2Ole84yQb5dSCgJegzMMRP7XZ4sX8cIzJg
 H0ecSCEBdiSx2x73Fl67rAY/MlsIZyitK4HADaBhvPK2b33H9m64l6tC2fU0zI7hDYmF
 Pl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905379; x=1762510179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AR6DCodMEiRozMtWWQUdsBs+LPg+2s6MkeWZ5TMIU0g=;
 b=ijINpaY9EZAL3Tez02Oqt192Zj/ioQa9sRGHDJk6MfS1n2gqr0yACKykubUNN2VTPP
 XEznsFt3ooNuwYD6mSscdsxQ3vsn5DxNkuKRvzADRNpARcBTLMU8p5TSwjIDdDEpi2JJ
 +MbVyyuHNmQ8ZSe6eK2D4usn/FgSg0yffsXoySQ/kUKOh2HYjzCGD0zcjRw+tnM6aY4+
 Q2/9iNTq7n1/oY3HHMr82+RERxSnJuHyZ3Q6A1YX2Lr3x7XjDa/Ef7d18MWFaxD8iDIk
 piGiheuIpLGTgiO9X38sTcncamwM3pxq8vXnPFAA7f7wnyUXYdKgLH03zQE8FCpbZtHK
 mpLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5npdEirtMwOhR8toy8UbTzIZmbQlop6F8m91NDw/RYpU2vR8VlAOkxnZM10ErImG4K5Wi/pfqGt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJixNFgwAc3765Fd2JbUugI4nVbAxe4Srtz0UZXHn8SPMK62qp
 2iTxBEKuEYl9g+z/Kp+x+7fOOiStn7HMVNtBKhEFWyqb5UYqCrWleTvcUmdjoEw3L38=
X-Gm-Gg: ASbGncvfghKcjEC8RM6OOdJs1s/DA8LdyuPX5xxPBsdkrVi/sumDMGfU/1uK/5+Q9Rt
 VQnq0Stkca6guW4VKQ3S/6wcFZVs1IpUgbzOt8k8CzEZUB8SuDJ4Y1ElvGfoIHcrrB8DtAgs/Da
 5YTuzQ9Ynaydsk5F+D0izLyWE0TqCogJ9ce6fw4p1yNs7wUhkVmI7lk2gJ3aCifQiAx69xGRU8q
 Y6B7OI/F2NsdrpV097pn5tza+GphtOXu/2SYetqJxhixCWV/m8sLqvv6h4NvhSldUN9a4nrSdpF
 EyWCRQR38csK1hzQqe9ciwwp7ejtdH8GwXJQgFYomJuv3FIJKpnVeLSYsZCISOGzbMIhZY2xBWn
 rFviy3qTKo0xw+Dq5u8TO0Je87OthlwjnJm+0Jc3GFBITtaQcVE3tu/xBJwVSqs4DQWKNNVXf9P
 elt32+Wn6Knmi5+GAFCSJGcUde
X-Google-Smtp-Source: AGHT+IF5CL1Q/oaHD87zPjFp4KiqyMUDxM2HoYOoLKtrm0XnT5ekaMI5s76J1xMKBksDY9h87GST6A==
X-Received: by 2002:a05:600c:3e06:b0:475:dc58:39e5 with SMTP id
 5b1f17b1804b1-4773089b541mr25699695e9.27.1761905378913; 
 Fri, 31 Oct 2025 03:09:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1c9esm2839171f8f.22.2025.10.31.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:09:38 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/3] drm/i915: replace use of system_wq with system_percpu_wq
Date: Fri, 31 Oct 2025 11:09:22 +0100
Message-ID: <20251031100923.85721-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031100923.85721-1-marco.crivellari@suse.com>
References: <20251031100923.85721-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index a28c3710c4d5..0f33cdc11736 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -140,7 +140,7 @@ static int i915_workqueues_init(struct drm_i915_private *dev_priv)
 	/*
 	 * The unordered i915 workqueue should be used for all work
 	 * scheduling that do not require running in order, which used
-	 * to be scheduled on the system_wq before moving to a driver
+	 * to be scheduled on the system_percpu_wq before moving to a driver
 	 * instance due deprecation of flush_scheduled_work().
 	 */
 	dev_priv->unordered_wq = alloc_workqueue("i915-unordered", 0, 0);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 6a768aad8edd..d9f73b9995cf 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -256,7 +256,7 @@ struct drm_i915_private {
 	 *
 	 * This workqueue should be used for all unordered work
 	 * scheduling within i915, which used to be scheduled on the
-	 * system_wq before moving to a driver instance due
+	 * system_percpu_wq before moving to a driver instance due
 	 * deprecation of flush_scheduled_work().
 	 */
 	struct workqueue_struct *unordered_wq;
-- 
2.51.0

