Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKhqE6m3n2mKdQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:02:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2009C1A048F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD11510E859;
	Thu, 26 Feb 2026 03:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlJC8SS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ACF10E0F9;
 Thu, 26 Feb 2026 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772074915; x=1803610915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mXzmsPGRB+4z16krNY0r2QNcwnkslNqgei1WpqL2E7Q=;
 b=NlJC8SS4tyOm5YqoezwZeQnLFFV4e8F6MW9YDzqg5LCClGTKu91mlklk
 dKjmdiWp+I8zn4QC8ii02m++5+aWd929m+befjRa16d3HEE00MmVFtFqn
 8ZDu9GKqm/bpwiaPCN1PmT3BrTsPaHUbb0D00A8K2dhR9bkQ3BJ8/9Tvs
 WzHKkJYgR2Hg5ZockeJHaA+E8Ux78P95CB/T/OWY4jmveBcemBuGmcs2r
 sWws2G1oyR76lhxX2VHDGZqFFLjcaEMQaWQp3a0PdqDXQ9/hheCHZivnS
 quGLJlGJjbrj2VM9TNL+AsbJkIomSNn/GQN62bIVQSccvboI/dfypZC9e A==;
X-CSE-ConnectionGUID: l0N3DFtoRLmwd5QqBDz65w==
X-CSE-MsgGUID: /ZxZ+lmqTfG6wvEqxUVA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72160368"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="72160368"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:01:50 -0800
X-CSE-ConnectionGUID: s+oV0KhDQrGZ7pZTmH96WQ==
X-CSE-MsgGUID: DlYdLRq0RBq/1p8ScYnh4g==
X-ExtLoop1: 1
Received: from x299.sh.intel.com ([10.239.159.77])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:01:43 -0800
From: Yujie Liu <yujie.liu@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/7] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
Date: Thu, 26 Feb 2026 11:00:33 +0800
Message-ID: <20260226030038.1182961-3-yujie.liu@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226030038.1182961-1-yujie.liu@intel.com>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[35];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2009C1A048F
X-Rspamd-Action: no action

Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'

Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e6ee35406165..fe4c1017734b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
+ * @result: 0 on success; -errno on failure
  *
  * Finish the job's fence and resubmit the work items.
  */
-- 
2.43.0

