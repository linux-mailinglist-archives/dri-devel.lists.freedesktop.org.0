Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C86BC21CD0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D517410E997;
	Thu, 30 Oct 2025 18:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="MMw6R/KC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFDD10E292
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:20:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-429b9b6ce96so583456f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761841253; x=1762446053; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OxksKMOC0fIZKUeOpeJVdapuRlnKQu02ijU5lY2UL60=;
 b=MMw6R/KCHz3V1Mq7Gye2QvMQwiZAn0lrsx9Uy2vACVPf/y0hGca+49sWLoFla8MBXK
 t6Iv1usdWkyEYriypc2O3gXBlYXTNrNGPyA1vba+3h6rGJu77/NzjzABfgbQ6y2D2mXl
 fFLPNdVIZttxqaMkDzu2IBT8I1RbmIJ+MjnYKE71MvYygXdeZ9frflxTSR4TpePOYIwc
 utybV0k0YtUWoJG8DlI8eQCJWIawTr6KnEuVMIj1f1Icm6qzKyxsYA3temOWXyDLbfnx
 prybbdwr0ql2yxuRPDUIhDUQwf+T4sIZYZ2nLOVSCzIBExYCYTlAK7gekGIO6D1yfdnb
 Yv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841253; x=1762446053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OxksKMOC0fIZKUeOpeJVdapuRlnKQu02ijU5lY2UL60=;
 b=ZE70eLQ0TnPlmqtzZJIqyakSgOOkWMFCIIyoEvvGaOTGlFwHXJmu66t93A+iHF79gU
 ieVE4f/Fr/96OH2FWoDiV6p/ojoAd6vL3JScYb2ze65IsX65hDEK48GrVih/tf8zbnYh
 pC9PYYqv/9JCDC5wTPsxM9sm5yznQgOg3C5RsS2J6lhX8aOVGKDFxiVM4fnc96Y14JPt
 0Nw6zE3KCs3FDf3omuohexWfGkz+q46Ipz7JYxDpXIEsoujvsARBCFYnHJl59LlWpYyJ
 sqojXDFIby6BwAD7w6wP0RhBu7e5HHkp+fxgBB0AC3ZPh9tG1l05as93GzF5+zZtxd4t
 fBfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvwDVu7J9OpmCNGbSuid+zbEQCwrSGHlqUayYc6AqgdOp9FDxBbuCw4a+akyC/3AWz+lGmp3utung=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtQMA0S6zID202YxOstcfJB/OcJzrxaYSzCcOSI63ZTNcfXjpy
 839Dz+JhAO/4qeiaMe6JlMlu1CwLBSOZjClbjA9NWwO3FPPYlj1lvVaVwoj38iMcO0I=
X-Gm-Gg: ASbGnct1L0prcIjSwrpRoEHRrB9G81F3TbVjhLHzCPxpXWG2lF5wEYqggUSn25mlWCZ
 59Uh6AWmEtiAekwRIjH++3MIu1PgjAmLtKWW6+cp79D4GjBbfb+rOmvLfLS1yqmsvye8Ylje7g8
 yTCPRBBj5OTtDwwysDrcOhV6N//wuAO+X2F6TNHksplVfK80QWcfefRHVveljak6/K5qAKXrBND
 M8uBO6mLVcGfuNWOuDbCAst3GFzH4glLY+5f1JuOFA1pPtQZ8a9tooGdeGZB19fiKDcuFjEEYhJ
 UksdXSA72VdkfRHAw+ojR2Tu/n0WdsvAVSQtjVaVyn1Sy6PzYrjidi0MUHQj3fhmQpNAYuYmxbV
 I3k9GuYzWOwLvCoH2ftnnU0CtWG2klylR//V2s/xkqiy5qJXoQxdPLz9jnJFNRMEIUWuZZ5J0iO
 rKVGg6x6JxiBbwVpc=
X-Google-Smtp-Source: AGHT+IGUorMh3PHS7NpCSCwVDESBgHpWURsMbI8izhP27/wehUJo+fPmCOzel6gZtahb2PzgMGlW5g==
X-Received: by 2002:a05:6000:2006:b0:427:526:16a3 with SMTP id
 ffacd0b85a97d-429bd6adc66mr153018f8f.29.1761841252702; 
 Thu, 30 Oct 2025 09:20:52 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df473sm32758678f8f.42.2025.10.30.09.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:20:52 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/3] drm/atomic-helper: replace use of system_unbound_wq with
 system_dfl_wq
Date: Thu, 30 Oct 2025 17:20:41 +0100
Message-ID: <20251030162043.292468-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030162043.292468-1-marco.crivellari@suse.com>
References: <20251030162043.292468-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:35 +0000
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

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..166085a7e681 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2222,13 +2222,13 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 * current layout.
 	 *
 	 * NOTE: Commit work has multiple phases, first hardware commit, then
-	 * cleanup. We want them to overlap, hence need system_unbound_wq to
+	 * cleanup. We want them to overlap, hence need system_dfl_wq to
 	 * make sure work items don't artificially stall on each another.
 	 */
 
 	drm_atomic_state_get(state);
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		queue_work(system_dfl_wq, &state->commit_work);
 	else
 		commit_tail(state);
 
@@ -2261,7 +2261,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit);
  *
  * Asynchronous workers need to have sufficient parallelism to be able to run
  * different atomic commits on different CRTCs in parallel. The simplest way to
- * achieve this is by running them on the &system_unbound_wq work queue. Note
+ * achieve this is by running them on the &system_dfl_wq work queue. Note
  * that drivers are not required to split up atomic commits and run an
  * individual commit in parallel - userspace is supposed to do that if it cares.
  * But it might be beneficial to do that for modesets, since those necessarily
-- 
2.51.0

