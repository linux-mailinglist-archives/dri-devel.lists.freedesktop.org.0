Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPc0CPT0imkNPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DAA11886B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B5610E50A;
	Tue, 10 Feb 2026 09:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TodUbh0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8D10E508;
 Tue, 10 Feb 2026 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714353; x=1802250353;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XRdQ2mwfjLpcXz7urf5X3M+mlADTIWwKu22HsKumSAs=;
 b=TodUbh0+5OyweVLRjgHdkV3uZ+VswgnNoOwKzbPHO7ebp5Lu5/7pwhfu
 5Cnp1gh6VW2z+yS3p5AhZQQrIWns+3K3AqmhtJU6IPoQ7MhcbhpsKNrkP
 sv07x9m35ArMNZvagFdMAdoIV37cB0mKugJMTxjnVv0qMT4O8TBkVJt8X
 coBvgNk/zC/P2U4QCddYPFluBxUHUs76fNrHD3HwhdNxu9guC8KWTu8ek
 8qMH5eNmhvAAayOkyzMC8Nh3igmFGzDrYMoac0LlGXyP/Wht13gNF2mKK
 gZXOpZwUcOUP9YvhUGfkeDOxBERmKDrWwZviq9U27QF3vCebAffgk34fd A==;
X-CSE-ConnectionGUID: uwuZOZn5ThOHYP/05juS0Q==
X-CSE-MsgGUID: N8GL3yCPSDWwD5X+f9vKmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94479193"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="94479193"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:05:53 -0800
X-CSE-ConnectionGUID: xEJUHNZYTaKFKeQowK3TrA==
X-CSE-MsgGUID: bV8JWUaBQpSN+xvRQZaBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242478997"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 01:05:48 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 10 Feb 2026 14:33:58 +0530
Subject: [PATCH v9 4/7] drm/atomic: Call complete_signaling only if
 prepare_signaling is done
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-atomic-v9-4-525c88fd2402@intel.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
In-Reply-To: <20260210-atomic-v9-0-525c88fd2402@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15-dev
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E8DAA11886B
X-Rspamd-Action: no action

Upon returning valid error code on atomic_ioctl failure, changes have
been done to goto error/out in cases of error instead of returining to
accommodate returning the failure codes. As part of this change
complete_signaling() will be called as part of cleanup. Check if the
fences are initialized/prepared before completing.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c228c9aed75acdb09a80df5dad54440a5c182254..bcd12b6eac4f497d2edb8581d9fb0fd54cbef827 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1569,7 +1569,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
-	unsigned int i, j, num_fences;
+	unsigned int i, j, num_fences = 0;
 	bool async_flip = false;
 
 	/* disallow for drivers not supporting atomic: */
@@ -1725,7 +1725,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 out:
-	complete_signaling(dev, state, fence_state, num_fences, !ret);
+	if (num_fences)
+		complete_signaling(dev, state, fence_state, num_fences, !ret);
 
 	if (ret == -EDEADLK) {
 		drm_atomic_state_clear(state);

-- 
2.25.1

