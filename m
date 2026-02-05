Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO8vHkkMhWlm7wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767CF7B25
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5664A10E109;
	Thu,  5 Feb 2026 21:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NCf0dAmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380B910E109
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KKhgLID6E/ib1BFgAJ2h390kYEUnOEV1KY53Ldb25Gc=; b=NCf0dAmNxLjyItOeoLBFONyZBG
 ZpAHjFyzu6clhzWXH0MbtFBT97s/hYuTXwatqsyvc8uiZytHxb8vuiKRPIxQDHXieqUINQc8o0DFp
 yrUsSiCjBDZkzK2L5BymaKa/Fo2vw6NdMkAJb5vnyE8PRNit/4KhHV+zf8h314O7V9dmBN50TFBYd
 u1w7pElutNfjpGN7ljPS2jzWZTP54PX5NQIbT/S5m3avzCvz7hGK7J/SSEY2Eo3nEXYWNR0DOK9ut
 /418Tip1uFknD90ndDWqIpgCDVF7mYGf7BFqhUGzGgBzbDxtUSdaRLAuiPPpA8Ygi1L12poBjttXo
 BX82XKYg==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vo6ww-00EZx4-Cb; Thu, 05 Feb 2026 22:31:42 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 05 Feb 2026 18:31:09 -0300
Subject: [PATCH 10/11] drm/vc4: Get PM reference before register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-vc4-drm-scheduler-v1-10-c6174fd7bbc1@igalia.com>
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=xADQXc2JhS0t68U2FfOoLlb0jPZ2igZYWzV4DiGIAho=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBphQwe5arbe3PMBuQ5w31Nb8yZl/qla2PviCLfX
 UTjNrED48eJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaYUMHgAKCRA/8w6Kdoj6
 qqkgCAC/DJ+JQ98pVgrOHsF2I5Ovaz3l5fFNJtJWwflutyW6pLdrtTrQ2OSlopKBJyD0LAekd7q
 m0GvCJUs8kR6d8NT0yS8Hofp18PTNQi2vKsqxtHgAmlDGSFwrbYrk3kMXNeBSv7lkWQZskhrDGI
 8NkUpUeOTGsW7k8qaypfbIDnVo7FBR814/r999Yc8i4hYti/MzwPaZw8cEwhr3QEBS91G0FHTOz
 /OL+koI/GQzp9RxhXq/k8e0KOri/aHhkHSHxyZJhWEtJVH6k3kcU+CqJN9Zy4hZ/AQms1XIBk+Q
 IWL3803+eoy5dowrfvtIVW/MfU8axvPYLwywi09RuCkF2dLW
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 4767CF7B25
X-Rspamd-Action: no action

The function vc4_save_hang_state() reads V3D registers to capture the
GPU state after a timeout, but it does so without holding a PM
reference. Wrap the register reads with vc4_v3d_pm_get/put() to ensure
the device is powered on while capturing hang state.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 1aa54c49b033ac0c85e49988d7fbe9cbaa37b000..856b30c6d8a70f4a3b515ff892ce9d7de7de02ab 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -207,6 +207,11 @@ vc4_save_hang_state(struct drm_device *dev)
 
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 
+	if (vc4_v3d_pm_get(vc4)) {
+		vc4_free_hang_state(dev, kernel_state);
+		return;
+	}
+
 	state->ct0ca = V3D_READ(V3D_CTNCA(0));
 	state->ct0ea = V3D_READ(V3D_CTNEA(0));
 
@@ -233,6 +238,8 @@ vc4_save_hang_state(struct drm_device *dev)
 	state->fdbgs = V3D_READ(V3D_FDBGS);
 	state->errstat = V3D_READ(V3D_ERRSTAT);
 
+	vc4_v3d_pm_put(vc4);
+
 	/* We need to turn purgeable BOs into unpurgeable ones so that
 	 * userspace has a chance to dump the hang state before the kernel
 	 * decides to purge those BOs.

-- 
2.52.0

