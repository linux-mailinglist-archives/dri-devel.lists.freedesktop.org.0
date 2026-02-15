Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB/hNTuJkWnHjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42813E510
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B972B10E1F1;
	Sun, 15 Feb 2026 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hf9Z4twa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7932B890D2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:52:05 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b885e8c6727so350549066b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145524; x=1771750324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwGBtXFk1MdqTYWNq1qSMVdXV9NE9jqVwCgbeAQpywc=;
 b=Hf9Z4twawp73SriSB/JZZt0t9+JxL+tDcQeFxps2x/3l00C1eHLxEnivlqE/c55Zu2
 NxUVnqBzIJmHsk0cFy8ve59BexOpp6ni8SNfSOHfDuaN/S22FUudbOMYZxkZjPUSHPoj
 U9W/wZlU4xDj6PIFD3vD+Az2gDJ572aw5UfLWn94l4uUbQtGJQVSjn+y1tKhID2AI0ba
 HLJhsGfdz2EFdV4pfjFbwP+XoURewdgEewkYLxoXbdJBxM8JRjVLgfq8hvm/4CF/ZyoE
 kSg9h4zr4gpedQhpguRA8+/c9NDm90YX/3YMPkp4f3hFg2X6jdHZbZAurBBCfAOT3PX/
 ugwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145524; x=1771750324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vwGBtXFk1MdqTYWNq1qSMVdXV9NE9jqVwCgbeAQpywc=;
 b=WYVAR4mdcHiF5NWhq7+LgwJ5aHp/SR3wYoLe8hQEQeeoJKQDFkcL56ZP0fn7y5vASz
 O6KFVd4CW04JwkUBfTQBZdTms0oxzP2rMTWUtuwbymecf/g2PbmHd7eEE0EM9XN0Lwgl
 ZlPNFlPjzm5y+ZRT/u1gGzIWAaXw6EIOp1jUj9HB1psj5XTLatGdLHfg1PrSxkOK/XU1
 6C52CuZBsfWjVlm+SBcAjY785T7l3dXxXwBYvCpuiPBlMQ32dCm1c/E3BeKYX2i/4CLf
 EeOWeuTDnDSnVQhnMa74Mobn9VC4le/YLIe2dO7mxXfeCbYrerijG309YnVBHCQ9yNj6
 SnYQ==
X-Gm-Message-State: AOJu0YyeMw9gjDc/ggwJMqFTGz3jRZ9oD6nkFpFusI+rOQWWtKJi/R+b
 ip5peB/xMJjhrA7N7145Uho9n4QoXRejcD8oiw+Toig1JlQ9Qr8njKmr
X-Gm-Gg: AZuq6aJWuIIPCUiYWgQEyNqV91Nfm0V0HJLlesGoIDf7sm7ZK4vfIXEPfiaNWw/7VNI
 VtHPLJKtpPalNOeTmuWzHkdOyEG8rlXBiBmGho7OR7XO4w8z8Dn8oHUwdXqNXjYik01J2+104Ji
 rEvgvLJ29A6Hppt6AUdAo/ldB8PEHyVIYeEkS2lmvieXzFuaMA0tdlyoBR0HfNMkAf8i72hZcsE
 sNKuBWFRWvTk6ObTnTQip03GW3QScFt79iq32IMGyK2Uw5Bztyn3/f5Exk0oJWlzLMZsPWOdzQ9
 dASGTT0sfNiCKbVeNj11fCFJSEQle5BvrQ86jzN//G7+vnx+NCYpv4ke9kvotiPYz/Iu/+ZR8aY
 Di/wAnr9HJxfjnDF2CcR0WMUrVDuZNbv2mfoNAJfa77EIeohtclZlxtBxvhZHjGRw5DjD1Pmwla
 TyOu2yDzd7Riyn
X-Received: by 2002:a17:907:c0a:b0:b88:58e5:86ff with SMTP id
 a640c23a62f3a-b8fc0216b5emr402120566b.0.1771145523737; 
 Sun, 15 Feb 2026 00:52:03 -0800 (PST)
Received: from xeon ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7629b63sm139799766b.35.2026.02.15.00.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:52:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] drm/panel: r61307/r69328: return accumulated errors
Date: Sun, 15 Feb 2026 10:51:38 +0200
Message-ID: <20260215085140.20499-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215085140.20499-1-clamor95@gmail.com>
References: <20260215085140.20499-1-clamor95@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8B42813E510
X-Rspamd-Action: no action

Return accumulated errors from dsi function calls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 4 ++--
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
index 2cc3bd66d6d4..70bda074dd0d 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -150,7 +150,7 @@ static int renesas_r61307_enable(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_on_multi(&ctx);
 	mipi_dsi_msleep(&ctx, 50);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int renesas_r61307_disable(struct drm_panel *panel)
@@ -162,7 +162,7 @@ static int renesas_r61307_disable(struct drm_panel *panel)
 	mipi_dsi_msleep(&ctx, 100);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int renesas_r61307_unprepare(struct drm_panel *panel)
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
index b5fe127634ae..0ed143f77e50 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -117,7 +117,7 @@ static int renesas_r69328_enable(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_on_multi(&ctx);
 	mipi_dsi_msleep(&ctx, 50);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int renesas_r69328_disable(struct drm_panel *panel)
@@ -129,7 +129,7 @@ static int renesas_r69328_disable(struct drm_panel *panel)
 	mipi_dsi_msleep(&ctx, 60);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int renesas_r69328_unprepare(struct drm_panel *panel)
-- 
2.51.0

