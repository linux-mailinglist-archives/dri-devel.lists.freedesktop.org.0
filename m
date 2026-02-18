Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHZJFWQXlmkUaAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 20:47:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE21592EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 20:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560F710E12A;
	Wed, 18 Feb 2026 19:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=puri.sm header.i=@puri.sm header.b="X2Ijk19Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB6910E313
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 19:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
 t=1771444060; bh=byfHtp57m9IMqLmYrdU7ESaBCBeVFDK18WlpBRd1tUQ=;
 h=From:Date:Subject:To:Cc;
 b=X2Ijk19ZSwqr4Sb+5nmhNY4ZSqIQt5pSegC/5p8L6SI2+qANXjH7Fdvn/Smnxxs2F
 TQJv54VoKLv0AjtPRDFzFOZociGQJqw166HsGPLavo6VckduxolZ/pl48V50zYIAZF
 xoEhKjvhGr8TBZchkB8CvntA4P81huqdFGuOMpxiUYd4NxrAn2CJDjjxAKKGOwpVuD
 TMrSjcYPFaH7BwC5ZTOlVs76zVOdjF8RzkpJNF+hK7drqn3lJ55YeeIB6P/1MjfsSH
 +KtDMUXmpCPxA7MWcii3eYJWa0KP+t8HLDXHVqEVDMKhfqfKrF3CvRyewNlTRi9/Fe
 5UlFamlSA9L8A==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl
 [79.184.40.11]) by ms.puri.sm (Postfix) with ESMTPSA id 27CD11F6B7;
 Wed, 18 Feb 2026 11:47:38 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Wed, 18 Feb 2026 20:47:23 +0100
Subject: [PATCH] drm/panel: mantix: Set the pixel clocks for 60 Hz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-mantix-pixel-clock-v1-1-c22c034ba5c1@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/xXMQQ6CMBCF4auQWTuxdKGNVzEupmUqE0shHTQkh
 Ls7LL+8vH8H5Sas8Oh2aPwTlbka+ksHaaT6ZpTBDN75m/N9wInqKhsusnHBVOb0wXvOIbgUiYc
 MdlwaZ5vP6PNljqSMsVFN45kqUr96nUhXbnAcf+WEDM6DAAAA
X-Change-ID: 20260218-mantix-pixel-clock-7ff880cbaedf
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=byfHtp57m9IMqLmYrdU7ESaBCBeVFDK18WlpBRd1tUQ=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBplhda2UDAhYptq9xKDZylsenvGhBk1DCvoA0E3
 ZVaqBF8/IKJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZYXWgAKCRDo8jXPO9vD
 /xZKEADS5CsNEWMKtv7iC/gqlBErmOLdE+ho+cr/XQ033KzW8PLEgxIniY9kIJRtK5dhg/R3sNi
 +JDdfWXyVNmxK05hIvaQgqhtMoXzsmxtPEcbdbPYB/7YDE1TsojvMVko+Lab43vxCGXONPo9dFa
 T2zpXK95p3OsSVCGkapUVbWZdMbaHuPmoO8NOw9TD8BXvTHVIGpOkFfGVYcBvGlOneR+xmqXVCF
 cN+wvUX+/semHo9voAUvTRyK0ka+WuN7FnS4ibn890Yz5XDjVUh8X5JMUH9mflGiffAujX0ymAe
 4yiv8LR9hV9K5kuixrinQZAG/bT7VEg8Y3xL0ttK46BqKBtBg+KOaelxRmnN9jo7+gUBsyAPzR1
 khBlSjKnJAwYlvmlRngXWL3qycvA9k6MFmRNWIydhjdd83BLX7N3A2G68OYxDFFpoRFDQNCvCwo
 JY2cs6AGJhvZv+8sByUSweZ1/kufjFd8GDoi58kXZ/bI8pWMdgXixxzuBUOqCFnyIZ7yeVJO2Jt
 FSjo56jDghpgL2es9wmoH2V5djDh5HwxbGXYiwpjno8QHvvEQW0q9ZCjuZc8lTQ7xahdXNXA2Nn
 brbVxiuEemsqP1Sw9GAnmobWv7EOr6nzmnSRI4fyN7nzM3tRwTu+5pujFYcIxvh5D9wTR1CFYa1
 pvSGQ07/2SDZNiw==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
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
	DMARC_POLICY_ALLOW(-0.50)[puri.sm,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[puri.sm:s=smtp2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:agx@sigxcpu.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:sebastian.krzyszkowiak@puri.sm,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sigxcpu.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[puri.sm:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 73CE21592EE
X-Rspamd-Action: no action

These are 60 Hz panels, but the currently set pixel clocks result in modes
with refresh rates of 63 Hz and ~63.41 Hz.

Adjust the clocks to target 60 Hz.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 13352cb4ad77..3d454ac7a1ec 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -168,7 +168,7 @@ static const struct drm_display_mode default_mode_mantix = {
 	.vsync_start = 1440 + 130,
 	.vsync_end   = 1440 + 130 + 8,
 	.vtotal	     = 1440 + 130 + 8 + 106,
-	.clock	     = 85298,
+	.clock	     = 81237,
 	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	.width_mm    = 65,
 	.height_mm   = 130,
@@ -183,7 +183,7 @@ static const struct drm_display_mode default_mode_ys = {
 	.vsync_start = 1440 + 175,
 	.vsync_end   = 1440 + 175 + 8,
 	.vtotal	     = 1440 + 175 + 8 + 50,
-	.clock	     = 85298,
+	.clock	     = 80706,
 	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	.width_mm    = 65,
 	.height_mm   = 130,

---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260218-mantix-pixel-clock-7ff880cbaedf

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

