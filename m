Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJPcNd1QimmmJQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:25:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36A114CA6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C02610E462;
	Mon,  9 Feb 2026 21:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z7WSIkqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C91410E431
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 16:16:53 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a9057b2ec3so22155615ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770653812; x=1771258612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2aw0A1Q7+XXVhB8aaJQe16/jz0kJyMiPsKTBLCCHa3s=;
 b=Z7WSIkqid3bSNvlmfx455wwtlcl9LJWvKdsARFRlPmbfpZXKxI3gsCmthz531/CyKT
 iietuHYIbSnaditx+ntq9ct7O22T1LsCdbAxkH4Cv8qsKQh3OfvYc/bLlTL/PF9b6dWd
 8n/waYydk8+SHtJZbBf3ZEVEzmyIEIHabfpg+7BuULdxnzTmIphPKc5FzKQ9fzXO+ltI
 J2NnzpCJGG7sGjRUq1sKU+Rhxno/Incb74GX6Y5d/Er7WhsiFV25bnupiOir0QlclqY5
 MXI75P9A/O8CPgABl+b2RJXPupQfKw2cotqGfW+mp+vc8OtQfVkcEccAgqM+sjcnsv6I
 vknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770653812; x=1771258612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2aw0A1Q7+XXVhB8aaJQe16/jz0kJyMiPsKTBLCCHa3s=;
 b=Zh9/q9mCeJKXYWtk2eVY2xZZ/bYcY3fdwImE8z/QjaLY8TdOzgG9JbiFFbeFLpnIkH
 TxJbA+VaFqJySr3FLfibY4OzprhbHB+DqKXhn4IRtBKp/PJO77kJ7j2GIb+UkDgSTz5V
 dlw0qCP9gsp+y+KWKNXmpT3+hINt0m/tlyIFY87VycsR1PFss7580Qm19DdIt2CSQM0C
 uL1Dhkew/tQmoP63tLP38dX7XDASkERIbbySLUp8kxiNsnNfmSTXmKhzdGc/QJsk+DwT
 a6AHkN7ubwtfoW8xDseiSQhxgLMsiHq3/e4/Oj3y365Ja1hM5aiJJ601CfdMCC61oZ7T
 omnw==
X-Gm-Message-State: AOJu0YwKLO3LFuM/pDCANUFGVNboOoic7sk8qHBxfcuSo/FXi3mantqi
 NGF3TMsYPkZSCNChAIeDn4jRFztl0GcNlik+z/r7FVMni2IOCw2AXMg2
X-Gm-Gg: AZuq6aL0uK96BbxUIujzwWB0sO+az9CSMjtfHP10GDWXLQKwyyI7iPi26NUIsElH2Vs
 HMFprAF3TJJsqwoIoPfWT6AIEfOtO15UoZj+H+45zEFqVmiZGhgx+cvtkllrPYw1PgCBjdq+7lE
 Ug61wsdg/YqBOQerA0MkNMcakFcqW2P2x3phyBPEzMqWRk+onMjI1aI7zFun3zWHrthm9BAuUWw
 x05gRLbIVx30eC3xbmqHPOsSVSvr1qiIV1KBgxnyS5wT89Fq2A+i1kyro+M9fg1OPwOttgWWv6l
 S0rnkfggic1mCvxXaZoZGcrGmahMGZGj2SWbyOFx340yBRf8DiOgG3fWbeQWVY4/jo93zZbPD9h
 CnwDbdfiBnz2MlzZQbDdx9I8Z24tVaNcmMG/m2DPwTIli/hJaWk4fVKjFGGoN0Ee8MGW6MfUcio
 aEw7mf06r6yDYR9hGs2nI3CWXx+UsQafzYvI/op1fB4lg8VlwmJvExUFvsqA==
X-Received: by 2002:a17:902:fc86:b0:2a0:e532:242e with SMTP id
 d9443c01a7336-2a951607ae3mr114928935ad.11.1770653812464; 
 Mon, 09 Feb 2026 08:16:52 -0800 (PST)
Received: from localhost.localdomain (1-165-93-187.dynamic-ip.hinet.net.
 [1.165.93.187]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aa3ec42e2asm110116805ad.53.2026.02.09.08.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:16:52 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH] drm/rockchip: vop2: Use drm_err_ratelimited() for wait
 timeouts
Date: Tue, 10 Feb 2026 00:16:21 +0800
Message-Id: <20260209161621.6136-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 21:25:44 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hungen3108@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hungen3108@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hungen3108@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3A36A114CA6
X-Rspamd-Action: no action

Replace deprecated DRM_DEV_ERROR() with drm_err_ratelimited() in the VOP2
register wait timeout paths to align with current DRM logging helpers and
avoid flooding the kernel log when timeouts repeat.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index f3950e8476a7..02a788a4dfdd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2106,8 +2106,8 @@ static void rk3568_vop2_wait_for_port_mux_done(struct vop2 *vop2)
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_port_mux, vop2, port_mux_sel,
 					port_mux_sel == vop2->old_port_sel, 10, 50 * 1000);
 	if (ret)
-		DRM_DEV_ERROR(vop2->dev, "wait port_mux done timeout: 0x%x--0x%x\n",
-			      port_mux_sel, vop2->old_port_sel);
+		drm_err_ratelimited(vop2->drm, "wait port_mux done timeout: 0x%x--0x%x\n",
+				    port_mux_sel, vop2->old_port_sel);
 }
 
 static u32 rk3568_vop2_read_layer_cfg(struct vop2 *vop2)
@@ -2126,8 +2126,8 @@ static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2, u32 cfg)
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_layer_cfg, vop2, atv_layer_cfg,
 					atv_layer_cfg == cfg, 10, 50 * 1000);
 	if (ret)
-		DRM_DEV_ERROR(vop2->dev, "wait layer cfg done timeout: 0x%x--0x%x\n",
-			      atv_layer_cfg, cfg);
+		drm_err_ratelimited(vop2->drm, "wait layer cfg done timeout: 0x%x--0x%x\n",
+				    atv_layer_cfg, cfg);
 }
 
 static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
-- 
2.34.1

