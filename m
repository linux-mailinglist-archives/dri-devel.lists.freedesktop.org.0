Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7DC350B1
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A0E10E6F4;
	Wed,  5 Nov 2025 10:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Srk88/n2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F309710E6F4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 10:11:50 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso3704245f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 02:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762337509; x=1762942309; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6IOSSXQpeyOMWOQdM3N30XqGgJttW4GxAyefGZ0B4U=;
 b=Srk88/n2EGodpODulaeBCV2Oj2JJEkZJYFYLGszkVT747iDICKRY4QDv/GV7zxbGfA
 NlGVFSu/qv9VekR3TnTDSBe7xefKCEYu9QJaukbayE/k1A+FEpqLY/gkLObhM9ikYnUJ
 5/nr8QAouUqD2efs5q7w9JmPrf2J8j6Lfe4Npk8ONDYp+jytgURAZI4FUk68rtkoDW0j
 nBAfHHImQTaHfDG7mihJIQ1ag7tUixyvMOMatZsELKuf8GeV2KQXxpC0wKq5gIPW/pe6
 xIXkt/EsrY7e6iZENmwnfXBBvCIw3c5nEvnlwsLuuJwwUscVLVh8vFIkK3nAGN402H6e
 xxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762337509; x=1762942309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6IOSSXQpeyOMWOQdM3N30XqGgJttW4GxAyefGZ0B4U=;
 b=tD+9osmgBUaDQoZdxtGqMxeh7Vd27PAqxy6HFNbmP2U4B0lWftTho9FDqdY720/f9M
 ZCmNXbJbBQhiezESwSW+YArPQkcXaKiRZ3+7WCPzDxagUFIXDZ/OG5GFqWnDbSrPTj6K
 PKufmTGqSK43vXI+Ig9KGGKq6XIUcb/RiGrBF6POitiuGuP8gdEMbM6orMKCuIK/+a1X
 RsVqjj0T3EC1JlTh7q6MfDlTuu5fnodFCjk0iA01Y7OhhDq+2VegElpqHtQPCNTKLob5
 QD+70046qNBB0uScLga1jmQj9AoPH+zSYQAQO1zEXlXsseL4B1zaozuEqt48buUfbaJT
 nckQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdUz6Q1p0Fy7rdV+Tsq7Cq3rlG3mneaC7FWiOMzbM+mF45+6EK3lL3gwWTsIh5972JTAOvP/FCPZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywew0Bzq5qethj2Ek0AmkjMYzCf5VPzm41m7pSySn9yLXpXCHxQ
 /ZxBhgNyS38IwsccMorAD5UF5dmEgygNO4fIAt6kYe6zohcmVEN0irl6Sm7J36OLRkI=
X-Gm-Gg: ASbGnctIvSCOSpFuna/3oy/pb8xAQ4Gq90nOGIQl086j/R39sQJ5oFsnVbDWvOBxCbM
 DwXBHLfaAD5M8JxVGoTpgj46NSsY72xjpwt17JU9USLmNtJLi7mUKoMdtZ+5JlWxgCO/DLG9fSS
 krgj07VPLrickW0dVp3y4Ucneidcn4t4qqQ0w20UTcnQ/fEwrTWI0CE9x0feygltbr1dS1l41Ei
 KzJXxJW85ol4s0neBmrGEJ6R9gqhmkPE+eh5blLgwzrGNwBxsDcrJd8/15kRTnqucUVvLBvGYiY
 wseomvn32fZMvd1hFSCYVQA+3rgMZgFBgOpBjHrTwRPCa2jbzIs2q7lMGYYWAGxL/6aV0gpi089
 4Tt6JEkZu017ohvUEejpyJiUVwIspMcjw3WSIl8x+LQSQNKXfDyDBWvlZGmzpTGoUHyLRaBAmY7
 g0ElapLz6k6F3QA4AmRRg2zr1m
X-Google-Smtp-Source: AGHT+IFJg5iLqlMomvWLLSqs7mgunbxsu0SjUFjBymO69nvB6yBPIReaX/Fm9l5lX9rWprCUSBoxfw==
X-Received: by 2002:a05:6000:2084:b0:429:cbf8:1765 with SMTP id
 ffacd0b85a97d-429e3305c61mr2310886f8f.33.1762337509440; 
 Wed, 05 Nov 2025 02:11:49 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1fd2a7sm9294925f8f.39.2025.11.05.02.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 02:11:49 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/vc4: hdmi: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 11:11:34 +0100
Message-ID: <20251105101134.82064-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 07c91b450f93..c39cf1530f23 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -745,7 +745,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	vc4_hdmi->scdc_enabled = true;
 
-	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
+	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
 }
 
@@ -794,7 +794,7 @@ static void vc4_hdmi_scrambling_wq(struct work_struct *work)
 	drm_scdc_set_high_tmds_clock_ratio(connector, true);
 	drm_scdc_set_scrambling(connector, true);
 
-	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
+	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
 }
 
-- 
2.51.1

