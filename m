Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2C47F2CC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Dec 2021 10:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9643A10E4AF;
	Sat, 25 Dec 2021 09:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694F410E4AE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Dec 2021 06:32:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u13so22990123lff.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 22:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gBC/jkuk/B4JtGyE/txGFQBheaZg+UFBXoPs2zfVHSs=;
 b=MYBkV0Cw7aKwMZaylqS4a1e2X2UBwRRiRoh48xR7jBspW3CzOiAPkEQCnyJTen0E1U
 u8uR4kNeIRX6rcL5r8YuinWJ8dUyMXdpuYzV5FAUNcVa2flcJb+srKLpDlX1fh67jccb
 47tOjI0zH52GLzDoQCLlEYONaNuqAt9BtVDvQcsT0mGKk+9hbdw2zSJs+73L0k6glE2k
 FaF3aRXA5CKM/v9YxnUvjmZUg5RcgcIyw3p1l1kVPiKbaAeAo4z5xS0Vtdm6dNUeqZG7
 SEc19GusnbE/cqzAzQmDAHu/KY6tte1kcudh/58iWuyUbI66sfvtd/5cP1Gveme681sO
 8kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gBC/jkuk/B4JtGyE/txGFQBheaZg+UFBXoPs2zfVHSs=;
 b=1q8zLrYV+gLEi9eFug36N444JOyJrwDMbSCTammnH5zgd9C95jDORlunvHEaaO6cSQ
 FY92tdTMSAwk1gl5VZ/ouPPOTwvJBIdmIALanTZBKOEOn3AIinP5WcjFITPLsk1S2hif
 lRiYtKG26sXm0fo7HAfdLnIjVLicFXQOJ9rtPmgYowNuAI/qIDfHyWsZkq2ZjKF9/GP9
 s4bnWp9PQBk1eIPEJmZmd5klBsiMpUTuLWgXMHritOpoMwSCEhtS/9rbmCEy5i0AIB2b
 juOqLHgJ8xTKaytmiGYfe8IO4B1EeuUxY70jx2ZwKLHprtCljZ3DqAsTyViyuumd7DJK
 9XaQ==
X-Gm-Message-State: AOAM531p5ZlqWIxH410GF6F8rzYUwYujPDTJRGh/uk1yL6WGWumLnbkW
 qr1ikhbrpXuJnsjCapKPyvksGQ==
X-Google-Smtp-Source: ABdhPJzXtwR95Gpe7oGsl9hPF+1Jcjq5nAzRJ6mv0rM94onIZv7Ckec8p5i9R2e/Z8D+SlMJ9dzYFg==
X-Received: by 2002:a05:6512:a8e:: with SMTP id
 m14mr7547760lfu.423.1640413946488; 
 Fri, 24 Dec 2021 22:32:26 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id m7sm1022490lfr.133.2021.12.24.22.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 22:32:26 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] drm/bridge_connector: enable HPD by default if supported
Date: Sat, 25 Dec 2021 09:31:51 +0300
Message-Id: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Dec 2021 09:57:43 +0000
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hotplug events reported by bridge drivers over drm_bridge_hpd_notify()
get ignored unless somebody calls drm_bridge_hpd_enable(). When the
connector for the bridge is bridge_connector, such a call is done from
drm_bridge_connector_enable_hpd().

However drm_bridge_connector_enable_hpd() is never called on init paths,
documentation suggests that it is intended for suspend/resume paths.

In result, once encoders are switched to bridge_connector,
bridge-detected HPD stops working.

This patch adds a call to that API on init path.

This fixes HDMI HPD with rcar-du + adv7513 case when adv7513 reports HPD
events via interrupts.

Fixes: c24110a8fd09 ("drm: rcar-du: Use drm_bridge_connector_init() helper")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/gpu/drm/drm_bridge_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 791379816837..4f20137ef21d 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -369,8 +369,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				    connector_type, ddc);
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
-	if (bridge_connector->bridge_hpd)
+	if (bridge_connector->bridge_hpd) {
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
+		drm_bridge_connector_enable_hpd(connector);
+	}
 	else if (bridge_connector->bridge_detect)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
-- 
2.30.2

