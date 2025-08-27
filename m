Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC9B37F80
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228FF10E79D;
	Wed, 27 Aug 2025 10:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="fY/menky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438010E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:08:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b55ed86b9so25663765e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1756289290; x=1756894090; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sXT1+ZhdRYw9on7KamKzgM97PHmPN2Js9ftnngLmHdk=;
 b=fY/menkycaa6L4hUt3RDrDF+FCRiJD9OEfNHD2nHUPVk4pj3RvkZPc31WR8Ie8MZfl
 G9DMaSNr9rDI5Vqnw0dJltPC+nzuCh3GkASmeM3oRpcvxgazYBmBjBMY/j/9Xwg1vLYa
 yMBG07x//cl+7EYebAFX5M9sqmcqguKalBRHTqfkNKqWlmBayul9rcDgqUaD77Iq2Qkm
 qEcrq2P7MDs3n0koujAOM37iM41YwaiT5wNKvgnrwgb4S/eVh2xFSfo1hfcJOu/5CG84
 DWpwnFQhZpfb1gZMDoha/C+7+ZPhJ3iUOYr4la8SuPSwBc7XcJ6WWUlzGyzlBsOk2oOh
 54ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756289290; x=1756894090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXT1+ZhdRYw9on7KamKzgM97PHmPN2Js9ftnngLmHdk=;
 b=NJW5SiDvFN6Z80l0D1c3DV66X6UodnT6CHSFlSNzq8E9uDEF3CHJ+QbKidaD48g6hp
 ckiT6Z17Z33Gf191q4ADsdc2c49CQKPrnFJgBVWT7HnaLYtxu52pUqupZOntRze5q2+H
 QD/vo9Jl26KCgpWnS9AdGcq5nLTscMpx2Cb3YfgjQ44UslNJ29JQ+PMf5/XQ6O1eKMg1
 y522swITUXRxKjIEzxsHqE7ExsWWr3miDTr6E9MijvX+iozCRGSV3BGe8121ap6xGDOK
 /ftZByv5q67ffzmx22WYzGpLdp6DL5PY63YQ76q8BAYFhzAielf2OYUiL2NLfOIVuPwp
 xTfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQRUi4FtT+uEP5IkfClkqm5qhHenHWaTT+N3qmjnI4Ny/7MH6GKMmYUx+g4NVcd01oGachOgmeWnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF7xYOONLenzHTqnbV4KPV7o3ZKkst8K2yhvVjPP+Kppnvd+aZ
 ngBVY3/imnWaQfipYuGMB6lZfRt63dYtqeS1LaKQBpq8Py8tUhf9kCZ/UtQvujQrwls=
X-Gm-Gg: ASbGncsiC/0m6qzrOksnDI3ziFxig+kGiXnx5RM7E8wRBcf4S0z3PuxhrjsPZA21kk4
 GRoNZz7Sn7n+WsKfEAy4civYNAUHXApvC92MFyL89AZzGRBH83f+UJFxWhxuRa90uSKhI8NZRIR
 WqQn1tvsaUsQffxgdSMDs4O8buwOa/HuweQFKIfAISaH09cNCjBX3Q/ax4t8Fcfo2AJObSxyxWv
 O61tnKfTV8XnwEyJGvjFjvsxY8DJKSl3SoQ051ou1+hhvel7Fbak4v+8iZpg9XICxcH4Kn2Cag5
 EgJilQ3lrTnEGm2kDEN+2sKspn2PHcJAkp3rbc2tcH0/KSwMOZjjo1tnI1058OdI6XNPyP5IVNC
 8Y/0n9asMxG5lsu9HqEizyiJCFOOLBjJzP7fBUp16FkAhhcoXD83Bc4URAUOC7WSpwqiMRL48t/
 /9vOWcYxgcjJfr722s
X-Google-Smtp-Source: AGHT+IGhD1atCfo4ZwImu6PpxS5A/Aon596DElxCkBAX5H/h4QkS48jyqdKtBal8nCISAnOuiKWemg==
X-Received: by 2002:a05:600c:1c87:b0:456:173c:8a53 with SMTP id
 5b1f17b1804b1-45b5179cdd5mr133811985e9.2.1756289289948; 
 Wed, 27 Aug 2025 03:08:09 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9..
 ([2a02:2f04:6103:4200:a5a4:15e6:5b6a:a96])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b723a1ff9sm16471855e9.22.2025.08.27.03.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 03:08:09 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, claudiu.beznea.uj@bp.renesas.com,
 saravanak@google.com, treding@nvidia.com, ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: display: Drop dev_pm_domain_detach() call
Date: Wed, 27 Aug 2025 13:08:04 +0300
Message-ID: <20250827100804.926672-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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

