Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JSUFcw4jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA41220CC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C40210E226;
	Wed, 11 Feb 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="YBCsz9wT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Wed, 11 Feb 2026 07:54:23 UTC
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6B410E04B;
 Wed, 11 Feb 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1770796010; bh=YqFokUIpet3/IwlomwvK/u3r6G+uZCj84Osd7zB0kL4=;
 h=From:To:Cc:Subject;
 b=YBCsz9wT5cpxtWWRId9Vul/4w/LijVcLn+b2vIj3ej/8wULm14CcEjqqdLwt3VuEh
 doPg1ykF1ErkjmdNoyydvtY55v7GeDlSZEMAqfIis6cFVG2BjpB5YmHM9kJx9tjjtt
 px/z2fK/Pjx4fQz1x+aOEvlVSiaGempb7JbSpWwUjZXs0zM4ZJehsc5ip6RjzTMvFg
 /42v2fIoK3eUybgWmQevYNK/vmeR2rhXy5rGRzo16vTxMpPzopkO9fnEz7fTGhBeDv
 qJxEjxZrkoiG09nu/OaJOU6cRqphGUi3AO0nFaQLxl0ay2pcFjg9pkbSDWPTEaCJU+
 5o+hhV1mqGfzA==
From: Michele Palazzi <sysdadmin@m1k.cloud>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, mario.limonciello@amd.com,
 Rodrigo.Siqueira@igalia.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 stable@vger.kernel.org, Michele Palazzi <sysdadmin@m1k.cloud>
Subject: [PATCH] drm/amd/display: add module param to disable immediate vblank
 off
Date: Wed, 11 Feb 2026 08:45:29 +0100
Message-ID: <20260211074529.131290-1-sysdadmin@m1k.cloud>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[m1k.cloud,quarantine];
	R_DKIM_ALLOW(-0.20)[m1k.cloud:s=mail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[m1k.cloud:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sysdadmin@m1k.cloud,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m1k.cloud:mid,m1k.cloud:dkim,m1k.cloud:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C1DA41220CC
X-Rspamd-Action: no action

Add amdgpu.no_vblank_immediate parameter to optionally disable the
immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
a 2-frame offdelay is used instead, matching the behavior used for
older hardware and DGPUs.

This works around flip_done timeouts and GPU hangs that some users
experience with the immediate vblank disable path, particularly with
DisplayPort connections. The default behavior is unchanged.

This is a temporary workaround, to be removed once the underlying
vblank/DM locking issue is properly resolved.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3787
Signed-off-by: Michele Palazzi <sysdadmin@m1k.cloud>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h             |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         | 16 ++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 ++++++++++++++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b20a06abb65d..5de60af8c5f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -213,6 +213,7 @@ extern uint amdgpu_dc_visual_confirm;
 extern int amdgpu_dm_abm_level;
 extern int amdgpu_backlight;
 extern int amdgpu_damage_clips;
+extern int amdgpu_no_vblank_immediate;
 extern struct amdgpu_mgpu_info mgpu_info;
 extern int amdgpu_ras_enable;
 extern uint amdgpu_ras_mask;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 39387da8586b..94cab76805ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -924,6 +924,22 @@ MODULE_PARM_DESC(damageclips,
 		 "Damage clips support (0 = disable, 1 = enable, -1 auto (default))");
 module_param_named(damageclips, amdgpu_damage_clips, int, 0444);
 
+/**
+ * DOC: no_vblank_immediate (int)
+ * Disable immediate vblank disable on DCN35+ non-PSR CRTCs. Use a 2-frame
+ * offdelay instead, matching the behavior used for older hardware and DGPUs.
+ * This works around flip_done timeouts that cause GPU hangs on some hardware
+ * with DisplayPort connections.
+ * (0 = use default immediate disable (default), 1 = use 2-frame offdelay)
+ *
+ * This is a temporary workaround and should be removed once the underlying
+ * vblank/DM locking issue is resolved.
+ */
+int amdgpu_no_vblank_immediate;
+MODULE_PARM_DESC(no_vblank_immediate,
+	"Disable immediate vblank off on DCN35+ (0 = default, 1 = use 2-frame offdelay)");
+module_param_named(no_vblank_immediate, amdgpu_no_vblank_immediate, int, 0444);
+
 /**
  * DOC: tmz (int)
  * Trusted Memory Zone (TMZ) is a method to protect data being written
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a8a59126b2d2..e18ad3949826 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9335,9 +9335,20 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
 
 			config.offdelay_ms = offdelay ?: 30;
 		} else {
-			/* offdelay_ms = 0 will never disable vblank */
-			config.offdelay_ms = 1;
-			config.disable_immediate = true;
+			if (amdgpu_no_vblank_immediate) {
+				/*
+				 * Use 2-frame offdelay instead of immediate
+				 * disable to work around flip_done timeouts.
+				 */
+				offdelay = DIV64_U64_ROUND_UP((u64)20 *
+							      timing->v_total *
+							      timing->h_total,
+							      timing->pix_clk_100hz);
+				config.offdelay_ms = offdelay ?: 30;
+			} else {
+				config.offdelay_ms = 1;
+				config.disable_immediate = true;
+			}
 		}
 
 		drm_crtc_vblank_on_config(&acrtc->base,
-- 
2.53.0

