Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE5C316F1
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1F10E5E5;
	Tue,  4 Nov 2025 14:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="krUukYFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9E10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:12:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso72099885e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1762265526; x=1762870326; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/trNHTcNj2oZzYDiffhX3l1sAkB1xmIMnTsuBGEOTQ0=;
 b=krUukYFx4Lf9IFe9oCXwDXuh3Ln04FQL6X/4axpnExeFl4hPMgglDkzRcYJjCzON2T
 D4rdAcPHai1mo3dsLp/py/IQ6526EKkRLeVbqz1dS+SqsTFPdWqAALDB2R1dp6+Bt0v7
 neR6+4WOPWNwrh6Sxbw4B1qkLLXKWUR9pchcDZGh/gve42Eyzpd99bFRp4MNXhludtXs
 To+bBfzbPTFPfRdG+9AVlJYPMLmT5G+viO7GyZbsKAhgzAAdhtrtpzSIXzUuoFZro5fN
 +7Mp6ySMIN/d/D/3kYrOLDwWWyFCWFuex6BDaQnEzfXS2FKdsIid6xLlSgrq6pFX18jw
 Yy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762265526; x=1762870326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/trNHTcNj2oZzYDiffhX3l1sAkB1xmIMnTsuBGEOTQ0=;
 b=AtUbjfn6kkrKZ8g3xpFhhLkXHCsRR04cbFvRFXcO+3Xb+bC6l5gcQOp1zVnhJzazDs
 lcrVPH2oxx481yZxWpxaY1mb7KHIEAZohAktsfqpJF2tWISWuzm6eWv8/0JyhkLdZ4Gm
 MGxI3yoLSaOuzBU8n3nbYBdTAAYSjPILFkS1DO8XfiSP+Srjr8kGCR6+qFnBubagyb43
 37HflDQ6DxgQKJac7dAL9p9ItXS47+RKsQgqig/Hkj10xCBo6bzFxTU34zYYWzljIkdh
 RLTdC8wguAEhhiS7i2TclqtSUxeKi/Nd10EAIJqHq0hd7KW8Fv1DpuSwfd37QxOTynF/
 QzGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt6LXaB68KwiWEXj+xeRvS6n3Nrq772S/RynKZ/NsRzRpiuC1oJhvZtPGDx/7SF5l8RkQup7jWxNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziHwrw1e8PFNCmC6ARNZLoemD5u2Yn3MidE8bsZNnPY7NoWXn4
 mG+OOaGoIv4ywcQjT/gBEDYjPf3iZ75nmXLYOD3tRJuMgRtRHQbFyg4ADNUI/sxgJp4=
X-Gm-Gg: ASbGncsUqmWQePcen093bj+hAQd5O+RAmMOQonE+V3cSXQ+OZWpgSnZkhYaGfpHOP20
 rRIo02+MHP5h4esjufhyKpOBzR5f2umn2HvSmyWpYVZowcVyyMqoI0agU24XPUd2LtPlgMniB+X
 J2NZO21f3pfzmXDV9oKaw1D2pMbExB5S43FB4tNr3ZxFmGajUoXklxwFKRAzVXiDb5BM2DiHxR8
 6sxTcgO6JV9bu71P8izPXAZdb1IZC8DRVsCdqYqwQ5Z4D8Wal1yjoVhHy/4VONtMTqxuIA2/6ou
 gdzIDs0NmjjbgkZf03s6/tXyXCvIPMimREhaWWX0ywJ3mW4zjCvaGmG5K/H1GRVP5fAL179NhCV
 jQHfwjtPwwAModYuR36ng++9zGihWoBd2z1cZLIDrYZ3T7j1e6tO5VroRYGRlejwcclRDjaXMZ3
 qStaHG5VZt0qX12qSX0xqNvb2DVyhvGg==
X-Google-Smtp-Source: AGHT+IEdlrhro/dTXAOyxOHGqemT1j8QaxkeVCtOQCBl0nf9g4eBQBRJrGzSMNhT1VXTufZYU7Ms2Q==
X-Received: by 2002:a05:600c:1c93:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-47730794401mr148414025e9.4.1762265525341; 
 Tue, 04 Nov 2025 06:12:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc2007afsm4903630f8f.44.2025.11.04.06.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 06:12:04 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2] drm: display: Drop dev_pm_domain_detach() call
Date: Tue,  4 Nov 2025 16:11:52 +0200
Message-ID: <20251104141152.2323788-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Starting with commit f99508074e78 ("PM: domains: Detach on
device_unbind_cleanup()"), there is no longer a need to call
dev_pm_domain_detach() in the bus remove function. The
device_unbind_cleanup() function now handles this to avoid
invoking devres cleanup handlers while the PM domain is
powered off, which could otherwise lead to failures as
described in the above-mentioned commit.

Drop the explicit dev_pm_domain_detach() call and rely instead
on the flags passed to dev_pm_domain_attach() to power off the
domain.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/gpu/drm/display/drm_dp_aux_bus.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index 2d279e82922f..191664900ac7 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -58,13 +58,14 @@ static int dp_aux_ep_probe(struct device *dev)
 		container_of(aux_ep, struct dp_aux_ep_device_with_data, aux_ep);
 	int ret;
 
-	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
+	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON |
+					PD_FLAG_DETACH_POWER_OFF);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to attach to PM Domain\n");
 
 	ret = aux_ep_drv->probe(aux_ep);
 	if (ret)
-		goto err_attached;
+		return ret;
 
 	if (aux_ep_with_data->done_probing) {
 		ret = aux_ep_with_data->done_probing(aux_ep->aux);
@@ -88,8 +89,6 @@ static int dp_aux_ep_probe(struct device *dev)
 err_probed:
 	if (aux_ep_drv->remove)
 		aux_ep_drv->remove(aux_ep);
-err_attached:
-	dev_pm_domain_detach(dev, true);
 
 	return ret;
 }
@@ -107,7 +106,6 @@ static void dp_aux_ep_remove(struct device *dev)
 
 	if (aux_ep_drv->remove)
 		aux_ep_drv->remove(aux_ep);
-	dev_pm_domain_detach(dev, true);
 }
 
 /**
-- 
2.43.0

