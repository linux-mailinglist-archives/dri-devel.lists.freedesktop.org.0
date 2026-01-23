Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNqbKrm9cmk9pAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 01:15:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC666EB81
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 01:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA60C10EBBF;
	Fri, 23 Jan 2026 00:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 562 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jan 2026 00:15:48 UTC
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com
 [162.0.218.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937BD10EBBD;
 Fri, 23 Jan 2026 00:15:48 +0000 (UTC)
Received: from MTA-06-4.privateemail.com (mta-06.privateemail.com
 [198.54.118.213])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4dxysZ1qmCz2xGn;
 Fri, 23 Jan 2026 00:06:58 +0000 (UTC)
Received: from localhost.localdomain
 (bras-base-toroon4332w-grc-44-142-112-152-160.dsl.bell.ca [142.112.152.160])
 by mta-06.privateemail.com (Postfix) with ESMTPA id 4dxyry36k8z3hhTH;
 Thu, 22 Jan 2026 19:06:25 -0500 (EST)
From: Hamza Mahfooz <someguy@effective-light.com>
To: dri-devel@lists.freedesktop.org
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ce Sun <cesun102@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
Date: Thu, 22 Jan 2026 19:05:28 -0500
Message-ID: <20260123000537.2450496-2-someguy@effective-light.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123000537.2450496-1-someguy@effective-light.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[effective-light.com];
	FREEMAIL_CC(0.00)[effective-light.com,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[effective-light.com:mid,effective-light.com:email]
X-Rspamd-Queue-Id: 0FC666EB81
X-Rspamd-Action: no action

We now have a means to respond to page flip timeouts. So, hook up
support for the new page_flip_timeout() callback.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
Hi,

I have tested this on 7940HS system and it appears even a MODE2 reset
will reset display firmware, so I don't think we need to force a full
reset here.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h      |  1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 28c4ad62f50e..bd63f0345984 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -343,6 +343,8 @@ void amdgpu_reset_get_desc(struct amdgpu_reset_context *rst_ctxt, char *buf,
 	case AMDGPU_RESET_SRC_USERQ:
 		strscpy(buf, "user queue trigger", len);
 		break;
+	case AMDGPU_RESET_SRC_DISPLAY:
+		strscpy(buf, "display hang", len);
 	default:
 		strscpy(buf, "unknown", len);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 07b4d37f1db6..53b577062b11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -44,6 +44,7 @@ enum AMDGPU_RESET_SRCS {
 	AMDGPU_RESET_SRC_HWS,
 	AMDGPU_RESET_SRC_USER,
 	AMDGPU_RESET_SRC_USERQ,
+	AMDGPU_RESET_SRC_DISPLAY,
 };
 
 struct amdgpu_reset_context {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 697e232acebf..2233e5b3b6a2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -28,6 +28,7 @@
 
 #include "dc.h"
 #include "amdgpu.h"
+#include "amdgpu_reset.h"
 #include "amdgpu_dm_psr.h"
 #include "amdgpu_dm_replay.h"
 #include "amdgpu_dm_crtc.h"
@@ -578,12 +579,29 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
 }
 #endif
 
+static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_reset_context reset_context = {0};
+
+	if (amdgpu_device_should_recover_gpu(adev)) {
+		memset(&reset_context, 0, sizeof(reset_context));
+
+		reset_context.method = AMD_RESET_METHOD_NONE;
+		reset_context.reset_req_dev = adev;
+		reset_context.src = AMDGPU_RESET_SRC_DISPLAY;
+
+		amdgpu_device_gpu_recover(adev, NULL, &reset_context);
+	}
+}
+
 /* Implemented only the options currently available for the driver */
 static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.reset = amdgpu_dm_crtc_reset_state,
 	.destroy = amdgpu_dm_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.page_flip_timeout = amdgpu_dm_crtc_handle_timeout,
 	.atomic_duplicate_state = amdgpu_dm_crtc_duplicate_state,
 	.atomic_destroy_state = amdgpu_dm_crtc_destroy_state,
 	.set_crc_source = amdgpu_dm_crtc_set_crc_source,
-- 
2.52.0

