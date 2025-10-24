Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A014FC0A089
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 00:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4719F10E0E7;
	Sat, 25 Oct 2025 22:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="V+zXCJiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91D910EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:52:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so12413375e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761299537; x=1761904337; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VB2JNLaaiAn3pH3zpI/FXAb8vE+Bng5cZSPLjc8q0bE=;
 b=V+zXCJiysBNp5alqX1lFup95JSevji8q8qoLn8WfvkRe/Gv8EYgKdOmKgCsAQ8De69
 VRoEsRXM894Nv+HG3j+nWRwqlYCMdhDIXUDeCj1wiAcolYFwkScrghToLyQ1+9PnMxZa
 SzRZp9WFxdHfUt8lvDU5gU9VCyCPHhLBMVraE0N20L7EXDRNETGByNTF/zUz+71U8e6E
 AVlSKXSLX7xS0ghLUm6xzgmUzjQ65xGCCK8BebGSwyEj/OcfVxtx3Aolnjr6b263bPJQ
 e60sfUwMaSKCOLZ6rOKQ0+LsA5xcjl9Yc7Z3VzW4188RrpOwUrZgnEddWsSOGFzKncQY
 4yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299537; x=1761904337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VB2JNLaaiAn3pH3zpI/FXAb8vE+Bng5cZSPLjc8q0bE=;
 b=tbgWdhwFRyQil8KSZB2wQDPkpYd86U03fpXTaQTBtYjwSHE4mY6IQVh3Ffc1lfR89L
 n+OBvOsKuI8KQ/dWWpgjks+Vz0ZwdtC6FiEmUQtglxndBp0QcFMWlZOVWqIFsF6dDmo5
 nDo5gMZIIek8hgQNyq+IsktLGN4pd82u0wMCt+swW5oBsOt9u44DXUtRu9hB68psCVvE
 MEdfD0VSN3KbVpDbzPnbu19hhgiCRIIn2rZjmcYlO1uFgsoM7wPZUwwSFyDM0BFLfgDc
 J5NARiU27lrBQ1p52WK/vIQogWKV1E3YMO8rlGg0sigtpTSWlDvwVuhn6psP1Crb5TOG
 ODkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJV1euRtjRtew/ca+O5WIaLC1QQsJ1o/2yXhzRjna7RS0b9eg5qwkLsz29EIHK6Nt0WjC47vv2zYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcMn8T2uhN94wQ2ZTDStT1m9wPoGhY8TJTH2cQ0d1wrvUdEBXK
 3dcJg30ty6i1q2eo4TdpnTD5eX1tT4tXh3I+jh7/ecCoie9E3AWY6IwhUWe1yX708vw=
X-Gm-Gg: ASbGncvhhz/Pa/yhA3YpQsp3jKmds9kA/LdB8KcJ54alxJ784GkeMZRuxcnCx+PNDgT
 hdbhVUVz3vcXlh+bIX7a4LDor7T0FQnWxY3mejxEBFrsZjkDstm8DJJISOXF7gPm6MaQG4L2Zf9
 iENigIYBywibAQy0v0+crh80A4yaSYrCOo18Vk57qbD4RhoaDGXv6z+GlTAe8V6FJqPf6Ltx2yf
 OoB5kqZo1mzVN9HmYtqWKJI9zp+h/nKiNckwG9CwTfwFQtdnze7pciFmzDH3+2S0K7eb2puD4pg
 itWI4Ct99RIvC6puV+fyXCizLQKJkaVySJB/hRAraVGwY6Bb95v1j1AmbuwHBT5aY867JyDtetc
 pU5hUfYaJEPBvCdb8z2CkzMqef5XhmqUWgzqHNCTUt7J5dhiSfUJzIK290kPwDwXi4JM8FYelN0
 018IUiu91h65PsIuCARi/rPL/A
X-Google-Smtp-Source: AGHT+IG9UrAVJY9k+lxCOX2VOATViY8kr0GIMVcZrOkxf6lTmiRwzoVcbu2hrw9RPBg1Zg3p5iG0BA==
X-Received: by 2002:a05:600c:4448:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-47117912b0dmr203107995e9.31.1761299537249; 
 Fri, 24 Oct 2025 02:52:17 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57b7sm8402376f8f.16.2025.10.24.02.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:52:17 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 1/2] accel/ivpu: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 24 Oct 2025 11:52:04 +0200
Message-ID: <20251024095205.123123-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024095205.123123-1-marco.crivellari@suse.com>
References: <20251024095205.123123-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Oct 2025 22:07:05 +0000
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

This lack of consistentcy cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 475ddc94f1cf..ffa2ba7cafe2 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -186,7 +186,7 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
 	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
 		ivpu_hw_diagnose_failure(vdev);
 		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
-		queue_work(system_unbound_wq, &vdev->pm->recovery_work);
+		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
 	}
 }
 
-- 
2.51.0

