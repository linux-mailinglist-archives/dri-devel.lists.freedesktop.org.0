Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FHhNTyJkWnHjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9B13E518
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B5810E357;
	Sun, 15 Feb 2026 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F5tQ+SJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7140A8994A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:52:06 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b8f9b5240a2so318132966b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145525; x=1771750325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apz6SKQjxrkiY9Y8cAWfLh3BY8/2ZKfxWZr/8LI9FLs=;
 b=F5tQ+SJc1+mfVtfnGOlYIVQmVZxG96N95p4E1FTIROipiaVrawKIr6bTrYwz8azQXa
 EL4eaF5UqYJ0UlxTKVJ0JWj0fg4r5Zm2ifBIHWiQtFLsXMI0nOA7n5u3AOc+YaB2g1ir
 pazIGmo/mpX5XuXaG99gVaky1MfrR+V0jFo8r4HIkm3F6tMQsaRubGpg925JbJqJRJU+
 KA/UfeTGY/Y7B3AUVGxAT1UJ1vw4jQ0keKTHrRQvIqV0UnHkQ1wwrIaE29efNxNRLwmo
 kOxhPOaCVlSrZoBdM+x5ciyAEf+2KfKOPg+d8QDBR3wa2sL8gpyIOA1lufqDatT9zGX9
 z0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145525; x=1771750325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=apz6SKQjxrkiY9Y8cAWfLh3BY8/2ZKfxWZr/8LI9FLs=;
 b=OByeOwzXUMOOgOlylNoWl7N0LPdF1dwp1d8dbQn0RXzWXFzOBhl7BWiXY2PsNgsgiL
 xmXPRCCIoV6owKEi7q1bW8Gh4LWoF6Lg09ooyRU34oNstA8uHxUIRkj4Ny6cqjauloxI
 nqviDOM0/KUq6thrh2XLBF1ldsypwPX6tfj/bXgtCkk8/SEDNgcLqQK3Zkk3hSEeLYQN
 7wnJ5S6jx1gxiH1MjcKjQxjkFPUQ+4fsY+CjPNmGDH9zP5joFvjL26NFn5H5JfgXrOS/
 Ir875yczvGLiAw8Mg4QCkbZrPYRxqJ3Kmjd6oMHr+Tr+JTVF30XLmchfA3upMG4P5/Gj
 /N4w==
X-Gm-Message-State: AOJu0YwKDfThRkbIY0AiSoenln8+RWwNQr4Ngft9qa6ZIMzxHUKksQ9i
 ta7fGswZCpalwu6165/32SierwkWCQYT0+6+04/HmrAvTAtRshNC4gYc
X-Gm-Gg: AZuq6aKoDmPkzC0hrheUHUWOE++d61j/M+Pq0KHIwy/6cDh7uf5+KTru0BO/mNltnrb
 YFJ8ECVCpU3JoLmbkicEFuIinGLRtFuQjE/lH0h7FHBH04schPMchLiLtME5IDu3UsjF7X0OlDV
 8MrR98Eu0QKSoC6lXZw7Q0KphAPok/KFfAO9/QggvZPUyTUclG/TGzZ1r9sYbJXEkQD7KZk7FkG
 pHbzAnivimOlR7xThwomVbmTK7tqgo8KuoPbszpM+wTmwPYSz8rMhQZz4pJGyKCvySNeH//kteW
 36R4nwI+cYPbScXoSKORRzk1i6p3PyfhRTfBhKGhssi7gfvSRr7Jn5Z/qSQfrkicLTjv11AAIax
 oLEac+cDmDSHiUERpjCr81HHKvmh6uZOvIyfTxUMLks9O+xnMNL6AB+pH/z994ZIDcHkPsgqGBW
 B6FHe4r3UqzjbP
X-Received: by 2002:a17:907:8690:b0:b86:e937:d097 with SMTP id
 a640c23a62f3a-b8fb44767d7mr372985466b.38.1771145524794; 
 Sun, 15 Feb 2026 00:52:04 -0800 (PST)
Received: from xeon ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7629b63sm139799766b.35.2026.02.15.00.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:52:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] drm/panel: r61307/r69328: convert to
 devm_mipi_dsi_attach
Date: Sun, 15 Feb 2026 10:51:39 +0200
Message-ID: <20260215085140.20499-6-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 8ED9B13E518
X-Rspamd-Action: no action

Switch to device managed version of mipi_dsi_attach.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 7 +------
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
index 70bda074dd0d..d8185cc1b5d6 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -261,7 +261,7 @@ static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&priv->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret) {
 		drm_panel_remove(&priv->panel);
 		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
@@ -273,11 +273,6 @@ static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
 static void renesas_r61307_remove(struct mipi_dsi_device *dsi)
 {
 	struct renesas_r61307 *priv = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
 
 	drm_panel_remove(&priv->panel);
 }
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
index 0ed143f77e50..bfe2787f8f53 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -217,7 +217,7 @@ static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&priv->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret) {
 		drm_panel_remove(&priv->panel);
 		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
@@ -229,11 +229,6 @@ static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
 static void renesas_r69328_remove(struct mipi_dsi_device *dsi)
 {
 	struct renesas_r69328 *priv = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
 
 	drm_panel_remove(&priv->panel);
 }
-- 
2.51.0

