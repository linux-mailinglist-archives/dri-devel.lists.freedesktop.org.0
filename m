Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B947C9C79
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 00:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985F810E109;
	Sun, 15 Oct 2023 22:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBEB10E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 19:43:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so507125666b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pqrs.dk; s=google; t=1697312589; x=1697917389; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9HxHVZc6YcEpPz9+wvy4GvoTV26RHqH6Rd4h4faexEg=;
 b=BZgYcZNvGuKvAWgHPi9bttdo5ZOFK7Ziit4wWg/CaPABydjbpnZ8P1BU5fLM6AKsyi
 2AdJUeQ2Q+8WKMCkchR/TrpBLn5JLlbVq73TU2bT+DnNkEw1m+NnFsOCDOwjNfggpot0
 aMd/LsOsZhJHxMoU7YS/NOOZaUO2N3kiquZYXdT07D85d6bE0y1wPdb720HziwxM5nZv
 XA2hQXzKc5wCK1zLONg8LN566sb3GJpAi8oK3DDtMYPLrLhOK9X+RGYewENGC7W4hfJC
 zGcf4p5dgPzduMQyIVEllzm5vj71eme6kagXRFvIi0lmFQ//ztvHYTDHx/m7mJm664Yj
 A15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697312589; x=1697917389;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9HxHVZc6YcEpPz9+wvy4GvoTV26RHqH6Rd4h4faexEg=;
 b=r4kCym0tPXyTIfIBSar1pHVZjfwxALohUn/CY4cxL2vRGEHgMt3TLhSOSo/SAVYY3a
 AJhhpZYGCnYoFesusk3DX5BNnl3wqDsipTSxYtKyn/ieBxW5AqPKNlzovfiusmzz1Jwc
 qvtnFO1MI8xrPcqKrv+37hwuI0vGTm6h3LlOdehZUfxcbwbAjEwCDNVmyOpRtVIGqICD
 aWbelvmqB7SKz9y1wwrnQ6BrIoI49rXDv1j0D/AoDIol9/E+PhBKwZo0s4fY0u8BxgUp
 08DoOPS4TUUltxc9RUmuoOK+i5EagtCmgZ4BuosjW1rQxBMeYQbasR1V1sO2WWLF7A4U
 0fPQ==
X-Gm-Message-State: AOJu0YyiUEIUmobm358xtqqH0GiVvgFyvvg5hvi5567aTzRokKiWSsZl
 PnhzhLNmxnuP+ZlUQlKxJ06lc4d/P+fsnc54apdFfw==
X-Google-Smtp-Source: AGHT+IGl30Gorqg9oio+b+sZtLdUF1DgfPaothJCR+sUNvv/emVXwerBBHvRMx2mnxP8dh03QHmoBQ==
X-Received: by 2002:a17:907:31c2:b0:9be:30c2:b8ff with SMTP id
 xf2-20020a17090731c200b009be30c2b8ffmr3129489ejb.61.1697312589449; 
 Sat, 14 Oct 2023 12:43:09 -0700 (PDT)
Received: from capella.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18]) by smtp.gmail.com with ESMTPSA id
 fi27-20020a170906da1b00b009934b1eb577sm1301000ejb.77.2023.10.14.12.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 12:43:08 -0700 (PDT)
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Sat, 14 Oct 2023 21:43:01 +0200
Subject: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
X-B4-Tracking: v=1; b=H4sIAETvKmUC/x3MMQqAMAxA0atIZgNNVYpeRRxqk2oWlRZEkN7d4
 viG/1/IklQyTM0LSW7Neh4V1DYQdn9sgsrVYI3tyFCPnm83EGGQgMLKGKMbVu58GO0INbuSRH3
 +5byU8gFL8yvAYgAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Mailman-Approved-At: Sun, 15 Oct 2023 22:39:59 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The adv7511 driver is solely responsible for setting the physical
address of its CEC adapter. To do this, it must read the EDID. However,
EDID is only read when either the drm_bridge_funcs :: get_edid or
drm_connector_helper_funcs :: get_modes ops are called. Without loss of
generality, it cannot be assumed that these ops are called when a sink
gets attached. Therefore there exist scenarios in which the CEC physical
address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.

Address this problem by always fetching the EDID in the HPD work when we
detect a connection. The CEC physical address is set in the process.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
Pardon the insertion of the ugly adv7511_get_edid() prototype, but I did
not want to clobber git history by rearranging a bunch of functions. If
this is the preferred approach I will happily re-spin the patch.
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 2611afd2c1c1..3d32c109963c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -424,6 +424,9 @@ static bool adv7511_hpd(struct adv7511 *adv7511)
 	return false;
 }
 
+static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
+				     struct drm_connector *connector);
+
 static void adv7511_hpd_work(struct work_struct *work)
 {
 	struct adv7511 *adv7511 = container_of(work, struct adv7511, hpd_work);
@@ -457,6 +460,9 @@ static void adv7511_hpd_work(struct work_struct *work)
 		if (adv7511->connector.dev) {
 			if (status == connector_status_disconnected)
 				cec_phys_addr_invalidate(adv7511->cec_adap);
+			else
+				adv7511_get_edid(adv7511, &adv7511->connector);
+
 			drm_kms_helper_hotplug_event(adv7511->connector.dev);
 		} else {
 			drm_bridge_hpd_notify(&adv7511->bridge, status);

---
base-commit: 4366faf43308bd91c59a20c43a9f853a9c3bb6e4
change-id: 20231014-adv7511-cec-edid-ff75bd3ac929

