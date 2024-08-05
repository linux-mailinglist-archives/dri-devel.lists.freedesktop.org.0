Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD15947A44
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 13:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4B310E1C6;
	Mon,  5 Aug 2024 11:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YPwWjWrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3410E1D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 11:09:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so94106255e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722856165; x=1723460965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=79Xuj9rgFrPC1HSTEfYDoVNpMSfRb2MPhZi+uIGhKp8=;
 b=YPwWjWrJJBPwJXdDgsdOtJ5UO5Rc00eRXlj4ET/YDaa5mW9OJRA/kHWwFXvhBXXve3
 womlWXf7aVxyVkCOKDAi/o32C1fPdNnWS4zV7LtAjnYCbA6NAlUp2+6eXzVI++qXGuZU
 NF8IdVzqBc0ebZKTnZl0AU3o6YmivLuJJHIWIb13UKLlzbBlltxDUmlyBGN7PSzQ5hhO
 zQ3UrMmwXJyzC5vS4/kJzjBitrFSEFANrRATqs5YfdbVMyfV1P0o+5n5c6/M+BhxVZyR
 gD+NQkbW8+dfL8p0mm6LzK2oljEhYtD6D8pesO8Q1+BkOtRfdpS32nnUSdMuwaD8fVZx
 h+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722856165; x=1723460965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=79Xuj9rgFrPC1HSTEfYDoVNpMSfRb2MPhZi+uIGhKp8=;
 b=MhmsWGJs2r0xFe2KMtHwolNG6RcxdhNUCe62MXWGipyaDXkrkpoOkXOethB4BxW3r0
 FA/rZrXIyONYRyIKC9sHTP/vak5U17bcxefkNvItZWQPKhM6kK5olS0qNrLWgClQRcpq
 q3F+G6TyLxGB6EBNLmfP06V2Npxo79JO0k1tN5lkbf1vbZ0dKg9NcgBP0JWXM7AkfY2E
 Kf+o5mP6YoSf6J+LyGIusI00Kz+bMGFQWdaJDfC1ntipZkSPO4jrNNrQfb0f0hG+I4eU
 IoREAe4l5b23SIF5DaM18z7J/q18JBCeS2211yWutooggGR+NApQw8UXw00Ur12nCPD8
 3iuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5fYqK31YpjFaWs4jWQqo3QhbIKouwTtT4TPPKbWwj2cChHWMg0qgzRZ415jcTd6jKYE5GmsrWqZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTD2XdwT8Yy5ghnmsDxfw7+sMnI8Wn+6BWtgmnDU8pDrJf5hNx
 X3OXxPweT2V9RH78XsaIXYKys19WOl4yhWC0LHgmSiAm7CRdeak=
X-Google-Smtp-Source: AGHT+IF+enJmt09S/10X5NmbZmmJNuA9POvDDdzkcGMSH1Tm7mGKoejjHFjJOqEc4a0d6wLh557zUA==
X-Received: by 2002:a05:600c:3504:b0:427:f196:c549 with SMTP id
 5b1f17b1804b1-428e6b7e954mr106869695e9.23.1722856164258; 
 Mon, 05 Aug 2024 04:09:24 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:2127:8412:5ec0:5b4d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e8d6555fsm131275485e9.26.2024.08.05.04.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 04:09:23 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] drm/rockchip: inno-hdmi: Fix infoframe upload
Date: Mon,  5 Aug 2024 13:08:56 +0200
Message-ID: <20240805110855.274140-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.2
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

HDMI analyser shows that the AVI infoframe is no being longer send.

The switch to the HDMI connector api should have used the frame content
which is now given in the buffer parameter, but instead still uses the
(now) empty and superfluous packed_frame variable.

Fix it.

Fixes: 65548c8ff0ab ("drm/rockchip: inno_hdmi: Switch to HDMI connector")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 2241e53a2946..dec6913cec5b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -279,7 +279,6 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 				  const u8 *buffer, size_t len)
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
 	ssize_t i;
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
@@ -291,8 +290,7 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	inno_hdmi_disable_frame(connector, type);
 
 	for (i = 0; i < len; i++)
-		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
-			    packed_frame[i]);
+		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);
 
 	return 0;
 }
-- 
2.45.2

