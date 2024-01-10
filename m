Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8526F82A301
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 22:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B9010E68D;
	Wed, 10 Jan 2024 21:04:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E6210E699;
 Wed, 10 Jan 2024 21:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704920670; x=1736456670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IKh2uVnW2bz0CgCKI3oi9r+Ie5VGsP8rbG0Vdbj+YmE=;
 b=X05xw0FmR7yp5ifSnbFGBzhE9UQAOFk4k7g6bVMOZ1U3v8G9NyJ8VIwK
 A/phvbH5Luudy4drfJrkB4g8nC9pmGrsTN9DcpRq2NGZ/sj8s/Wp76Nho
 1HQtGL+hED2moUaQqbhvOANB3CcGYQt5a3qCUdTPyHRilgEu6IVcC+cMY
 nZoAvYClut4rKXznCkI3LBx9kmnmphx7wGtnJNFNASjnL6+Q9cvvKPp9j
 wP9gdLyIMUfXoF0531cvBh/xUSvPrgQsdehWZKxTagdkorH+E0y8Hjx4X
 OXGxYsrpFRmjfpmcSQol7yWHnWOOxaNJaP+mfkHCk4IgvvWyC8AO8KsiF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="20135195"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="20135195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 13:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="731959295"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="731959295"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 13:00:14 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/gt: Restart the heartbeat timer when forcing a pulse
Date: Wed, 10 Jan 2024 13:02:16 -0800
Message-ID: <20240110210216.4125092-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The context persistence code does things like send super high priority
heartbeat pulses to ensure any leaked context can still be pre-empted
and thus isn't a total denial of service but only a minor denial of
service. Unfortunately, it wasn't bothering to restart the heatbeat
worker with a fresh timeout. Thus, if a persistent context happened to
be closed just before the heartbeat was going to go ping anyway then
the forced pulse would get a negligble execution time. And as the
forced pulse is super high priority, the worker thread's next step is
a reset. Which means a potentially innocent system randomly goes boom
when attempting to close a context. So, force a re-schedule of the
worker thread with the appropriate timeout.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 1a8e2b7db0138..4ae2fa0b61dd4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -290,6 +290,9 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
 	heartbeat_commit(rq, &attr);
 	GEM_BUG_ON(rq->sched.attr.priority < I915_PRIORITY_BARRIER);
 
+	/* Ensure the forced pulse gets a full period to execute */
+	next_heartbeat(engine);
+
 	return 0;
 }
 
-- 
2.43.0

