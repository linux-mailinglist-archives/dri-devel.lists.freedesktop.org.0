Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHWXMzbddGkV+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 15:54:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD77DFA9
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A8510E335;
	Sat, 24 Jan 2026 14:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="I8wHhZ1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D7010E339
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 14:54:38 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so2788114f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 06:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769266477; x=1769871277; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHc4Ub/6LqQBr/dlSGg55syvwKsNbB8vfiClU/RuIFk=;
 b=I8wHhZ1vFk6bZvULKD6DEtv8CalgXadwi1o86Jhar4i48zW8WtXceGHvZeXf5+Il8F
 8mJC0kE9+aoFR1C8q+ZKQuyxa3hza1dP/vx7F8uGwnR/iKChSvp5HzjuJpZ+k2PX20Vo
 soNiUxDOT16w3gpwpR4e7Nj7ecxL3dzzKZtDWBVrjL4sBQiaBA5nFCdPbdABdPwk1vig
 AkpsY/6THlu4El5jo+1sQHSLoOEnwOcpexQpFHvhlxzh3pRnY8lb4MY1tIxSLk/TVzq7
 JgHzmh6fifULM+5RrtjD2HAVLFJLRuGqAUPY3bOB12f3Jblo68pTMEx8l/gSVEufMzJY
 efxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769266477; x=1769871277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LHc4Ub/6LqQBr/dlSGg55syvwKsNbB8vfiClU/RuIFk=;
 b=inOrcl4YdsdOD+RdlyoAeyBRGhokmz1/lFQ3FTvRXaNQSzhs/eCeIS0Fixe5JvBS37
 vOxUqio0gj5FlFuTa1hAshcc6dYPgkRufEdoW8KEEv3Afmn4RLMBN9N76tVhqsh38FYE
 PBZ3avMtzMfs2HZdtaA5MdcieB8gTGTAhrLoFW99uQWf46hMsgo6fZ6eLcCDaJx+GdGu
 ilBWnzO+0FylV/rdEUTeV0marBNZXjYz5jpKYfz+sb+Pt5k/dFtWksPc0zn3hrkbX9YV
 YkXZ6FUWS8figyDXQMU5WSJC0FwmguiyahQXeGaMlgZAkf5co2riY/nVLsFldSx23QKM
 DIDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWtjXJfMk1rshlx0yvTl6HjH3UKFrihxAzzFg9JRF0TWlB2+hpH6IboK6F8RDVF++cG1m017oIAMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdnxdEqdYZfAeIbiCE9LqhL7Cox4SWZVWxJw+wJXI1sFvOVe2L
 rIJ7rsgFbD27d5ymBpDobk7qTAT8oToDUxYBhLjKGL0L74lLViECJYFLfpRXPb6QTD4=
X-Gm-Gg: AZuq6aIrmyOaYoV8pSfDo9FpSZl08TycT3CffpTphVz8fxzPGqb471CHlVskSmewXvW
 NfFY8DtcGNAcAB0S1lSLW5Jdxseutw9aisCxFXotNjHGvAta8eQ1+nZphlojpPZsgrBiUlp0dN7
 SJpi+JxDjBbUj+E7kOiI6niZ8gtd13Fa4gUfZXMxFdzFenHnFbqun0YPp2fwTycNTFUj6ZlkZx+
 4ANzjyugLw6fUXTm0NJIWqdrBDc5G1SAu69c7SwhFuVQSZpaVuRzR+doVro5tFx61I9oO5xmCQ2
 rV2fwZXqbKX7KQMWM+Mlom+O0ykEmLaNsbY9fpEscVlur0MhbaG3HnKLeKtGQq0Uumef/67D5ZQ
 uBlchmUcdrIDj6NLTsTIDKum0q05tFQZrGNNCz/b0EbQdVWNh/MjZzQIyiGsFe+OhPB1XaZL+5Y
 WJXD9C18AnTWSa9g==
X-Received: by 2002:a05:6000:144a:b0:431:1ae:a3ca with SMTP id
 ffacd0b85a97d-435b1587d00mr12343074f8f.11.1769266477265; 
 Sat, 24 Jan 2026 06:54:37 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f73855sm14846241f8f.29.2026.01.24.06.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 06:54:36 -0800 (PST)
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
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
Date: Sat, 24 Jan 2026 15:54:01 +0100
Message-ID: <20260124145401.44992-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124145401.44992-1-marco.crivellari@suse.com>
References: <20260124145401.44992-1-marco.crivellari@suse.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,intel.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:marco.crivellari@suse.com,m:mhocko@suse.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 79FD77DFA9
X-Rspamd-Action: no action

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Link: https://lore.kernel.org/all/20250221112
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cf29e259861f..1b20ea03a938 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -488,8 +488,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
-	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
+	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
+	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 793d7324a395..0849917b16c7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -322,7 +322,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM, 0);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!ggtt->wq)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index fa4db5f23342..8526addcdf42 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -48,7 +48,8 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
-	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
+	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", WQ_PERCPU,
+					   0);
 	if (!group->resume_wq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index ea411944609b..f3835867fce5 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -120,7 +120,7 @@ int xe_sriov_init(struct xe_device *xe)
 		xe_sriov_vf_init_early(xe);
 
 	xe_assert(xe, !xe->sriov.wq);
-	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
+	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", WQ_PERCPU, 0);
 	if (!xe->sriov.wq)
 		return -ENOMEM;
 
-- 
2.52.0

