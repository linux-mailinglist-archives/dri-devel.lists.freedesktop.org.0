Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMBRFJR+gGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:38:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D64CB13C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C479310E41C;
	Mon,  2 Feb 2026 10:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ewbOTWDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4F410E41C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:38:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-435a517be33so2533496f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770028685; x=1770633485; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxwZvnhF3oQwannNLGicFGTT7cRyzihZn9lUXOj4q18=;
 b=ewbOTWDXL9tDLDMpB5xRrWlvXbTJOBPKZN5JNgcHwhSJM5EPf9LvYKgoWCD+MgGoaE
 8ZIeeFK9TjpfDkpiOB5biRnof/IA6wudmRqAheNayXCVKbg8rRfrKIL9Wl5Xy72nLo9c
 WSb4yJLti/rkdr+khnxSrcgxlT/yUOTDVhnW+pjuwlWdo34YQslMh0a9AHeD2q0PMyfo
 SlvdHDEeKNYWsp9o4AFo34OgCPy3DVbCTRH0L6V+fSXF2ORnbh9BLOVXg1R73cUOwm+T
 GSVtNx71xwwWL6S8Oc/mdYumWYbonGQ0dREc6TKD4WCPV9esIF2VZIZlZhtjeWDtxTFa
 qGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770028685; x=1770633485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxwZvnhF3oQwannNLGicFGTT7cRyzihZn9lUXOj4q18=;
 b=QVLP5Mc+sKBY2iJln0rVJrYoghww2DR81EJvCTPmERa12vgq/C0nnvTwi+qAWLdaZW
 zYWsKPkN9wTDKl2nbBlSQE2x2BvI301DJu2gtg9OL/nvY1zQIbjXkVQpUi2X2JsZE7go
 am++2Qj8gtEM4ayR55cZIro94wanm2bwWM26fbKva4LuoJrWdPbS2q7CPgQbj+FYq6ET
 jABMVX3YD3Oa8rXxAGXHe1CHGgAQcV6neIOKMl8pDazzSjr7GY4/WK+HzOM3/ChkV2l6
 uSAbR/4zRylkeirqTZum2d0jzRRR69K47+/YnVPhkaMw42hRvy+JUdJzMNsEVua81ZUy
 16ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeWZJPUb8kEDXPABnkMdAbEi9qoplF+NFOMBRS+EvPunlCxlL2SCPzvv1HdnuXbuGiFHsKnjwWFUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0llDJ4EUH5bOMEzfvHBYb4tyl5oKZTkYnOYNBEyyRvIEWs0cg
 UXYWf4wSe5IvhUN1AgX2T52pZCt8OcbvCwRY6VtIJ2xhpmbdUlsns2NUUSt19U7Jm1o=
X-Gm-Gg: AZuq6aJnr15kjayoeNxUMkNfSCK2FtW9z4jrvre6z7gFDQlyOw/pvn27+WLb/T8PxhB
 yqLjerNaQR1ZyZQfSoprl+RL+9YyeFvZWybMrAvdVZy4yk6hjri7XMUuBhqNFIhpiKx0WNhSp7c
 OpPF6mJsrFRY5PBc7aFBQrvt3TbLYgyh3wV+tDoq7EWs6NtMbaOcxtTAv8YdEjs1zTTen0JuEFz
 vMz5Idp3MpTNOYRb8PDqCYsJcZ+m5fDLXbS1zV71mFDip7Ixs0ufx2tEpC2UNWzUBd//XFxm4/Y
 7WUq9WyNapTCuHoFX7rJR1nukyxeq1mdnbeyAfN5WHt/aUNhRk+urpkpNsaYLrOTbVNotZKIC8v
 75Kmj2Uf5SbHYsZ8iVA5J1B6lqFlaTmm5wR3jL+WAzhkgoQR2nHjz1SJIaJpZOMnigdxuG08k5r
 tS4cZbAUOM2AsLjg==
X-Received: by 2002:a05:6000:1a8f:b0:435:ad52:31d9 with SMTP id
 ffacd0b85a97d-435f3a824d2mr15416371f8f.28.1770028685377; 
 Mon, 02 Feb 2026 02:38:05 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm47020132f8f.43.2026.02.02.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:38:05 -0800 (PST)
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
Subject: [PATCH v4 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
Date: Mon,  2 Feb 2026 11:37:54 +0100
Message-ID: <20260202103756.62138-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,intel.com,ffwll.ch];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:marco.crivellari@suse.com,m:mhocko@suse.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A9D64CB13C
X-Rspamd-Action: no action

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1]  Replace uses of system_unbound_wq

    system_unbound_wq is to be used when locality is not required.

    Because of that, system_unbound_wq has been replaced with
    system_dfl_wq, to make sure this would be the default choice
    when locality is not important.

    system_dfl_wq behave like system_unbound_wq.


2) [P 2] add WQ_PERCPU to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

    The behavior is the same.

Thanks!

---
Changes in v4:
- rebased on drm-xe

Changes in v3:
- rebased on v6.19-rc6 (on master specifically)

- commit logs improved

Changes in v2:
- rebased on v6.18-rc4.

- commit logs integrated with the appropriate workqueue API commit hash.


Marco Crivellari (2):
  drm/xe: replace use of system_unbound_wq with system_dfl_wq
  drm/xe: add WQ_PERCPU to alloc_workqueue users

 drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_oa.c              | 2 +-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
 9 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.52.0

