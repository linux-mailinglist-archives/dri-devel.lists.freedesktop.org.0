Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE1EMkQMhWlm7wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B614F7B0E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7540210E0FF;
	Thu,  5 Feb 2026 21:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jEjGUzVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A43810E0FF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0K0ZAqKoBtLFhqh8XZ4JlO6sxkPQUy0/CLX8oJupbdE=; b=jEjGUzVDVXZViNk2di6/1YDrC8
 SyIoT3jv/a/ZAZUiNbzw0Eu1oySWH07I3OXVfu/nd2Pb2g4447hm3uBdJ7IS6mjDgYzT+OGCHwu8a
 5GzUOg36MdR4hvyM9Vmn1FtTHHhIrWD9vTsunM01i1eCPepynrvVGTiNuL7ybiTN0s2FBqfpFCGF0
 M46kdjBzL7mFDqARFMAHsPGWPBFn0f6mBe7wIYlmMkHQfS9FZZWGIYGz/eJvPz9egwWthVxaJrNxW
 wVso4EQQyneOEFIUe+jK9xuxEOtxD4ST3wq+EbGshtu7/uQplEeD9zDT007QLiSjiRHlJY8/cRPim
 ambLg8pg==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vo6wt-00EZx4-Cs; Thu, 05 Feb 2026 22:31:39 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 05 Feb 2026 18:31:08 -0300
Subject: [PATCH 09/11] drm/vc4: Use unique fence timeline names per queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-vc4-drm-scheduler-v1-9-c6174fd7bbc1@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=6oIwKCiez0UfkVkNQG4rpFvAugKLBbEhdMLvdbHp0JU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBphQwelVAIUSdmC5cg8EGAo1QSbjxydC46j41la
 TrrOsgZlqWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaYUMHgAKCRA/8w6Kdoj6
 qmdhB/9E6AYC6yuDl3qXO9aTRqcoom3+WKxIG5viVikzskR8U6gllG4hp+goL5yqT0a82Ra326z
 Bdi7nkhyDCu6cCRV7RcDpfVPZVRjM80JnqSScyu9i0nqMOgC7QTHfwpXBIwYF+GxPt0+2NjZMTv
 h424GQwsEmoAwtdhrZCcgG7ZyWt9hLt1AfF9KuOA4YsAe5xNU0gDgyWD+7UBu+DYXEVdRQ6m1r4
 H83wxrg2hGqwhsK+9OR1TS7ZDMbEWKds64e+XfZQ9nkazHHXvu3R1EVzNZtx9s1R451E6etV1ml
 PXoTD5wJuueGkl/3HipE8odccKxXH3+9iK4E3F9Y8JlQRMK7
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
X-Rspamd-Queue-Id: 8B614F7B0E
X-Rspamd-Action: no action

Return distinct timeline names ("vc4-bin" and "vc4-render") from
vc4_fence_get_timeline_name() based on the fence's queue, instead of
the generic "vc4-v3d" for all fences. This improves debuggability when
inspecting fence state.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_fence.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_fence.c b/drivers/gpu/drm/vc4/vc4_fence.c
index 72aa6b8ba4b6b6bd8affe2c73827bd127b18225e..32a2c78fb632b1d2c647402dba434e7168922dfb 100644
--- a/drivers/gpu/drm/vc4/vc4_fence.c
+++ b/drivers/gpu/drm/vc4/vc4_fence.c
@@ -47,7 +47,16 @@ static const char *vc4_fence_get_driver_name(struct dma_fence *fence)
 
 static const char *vc4_fence_get_timeline_name(struct dma_fence *fence)
 {
-	return "vc4-v3d";
+	struct vc4_fence *f = to_vc4_fence(fence);
+
+	switch (f->queue) {
+	case VC4_BIN:
+		return "vc4-bin";
+	case VC4_RENDER:
+		return "vc4-render";
+	default:
+		return NULL;
+	}
 }
 
 const struct dma_fence_ops vc4_fence_ops = {

-- 
2.52.0

