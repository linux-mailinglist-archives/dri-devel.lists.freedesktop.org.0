Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00880821F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 08:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E01610E7DD;
	Thu,  7 Dec 2023 07:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987B710E7DD;
 Thu,  7 Dec 2023 07:43:17 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a1f0616a15bso17172066b.2; 
 Wed, 06 Dec 2023 23:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701934996; x=1702539796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4tM450hhK81w0oM7jZEhaWUepBXozQ46MIkYyj0Nte0=;
 b=BTdRIiJAJaVbNiKEk0ybCF+4PqZ0qjB7/5+fftBpV5+1fNds/H+2TP+gr6U7IqPX/B
 ftnfUvXnc4Y8VXZDAOkDYav+E8D3aBj9CAcPyiMqtPkYpyqIk0gKy+Spst0uW89TdcCB
 b7RWeWb8So8r4qtxRaEE8NBuQH45/TY8VOaWPOGT0wDP67J5PGFOWN9P7jt6QBqzrM6a
 dkZmvZNMxHVP1jiomG/2kfcHtKcEgX0lXfVV2A0/feevLHc8HdrnVuDpDM0WzChNiPfB
 A6C+kk8sSO7X5+hm+IC600w9nzRmGRW4NMRxv46l4pR9WNUQWiFLFGbzk8r5oF0mC8c0
 86MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701934996; x=1702539796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4tM450hhK81w0oM7jZEhaWUepBXozQ46MIkYyj0Nte0=;
 b=WuR8TsmZ/4gHRsnNju0kz93E0Ku/SsLMd/ehuKjd5KgVXCmmcsuVZnf8oZzzaceAPG
 Z/24HFrJMBtq622tnIz4AR/Vm2BqVL7Xzsyf0KJFTeWZbPKHQ+MyVe7bROeeVMB8GLfG
 AVYECeW9go0gG9Zf3cM5L2MpwtNUT5xQCbgIbmrL/FQRNZUIQkPoHeBwcBii2E+qMqpT
 DBJSGgNzcGr3POOIyiaVb/7gyrnzA53AfPcsTYPqDKTJygjheb5v5XJsHBMkXg5l37jC
 TL/t8HH0sEGOuK28KiCS2U0SIG9wek9hSPABzFS30ue0KMJ9sJXaOPI69fnBudDj0Acb
 +HXg==
X-Gm-Message-State: AOJu0YyyevqnSJgavd9WvufyGWIr1udZHyA5TGopi71wWxxUr310yZSi
 M4bb/F/930hhl1STTS1RWMU=
X-Google-Smtp-Source: AGHT+IFIsSA4zdfdGgHUigFW+l+XxGe2W7Jx/7n0J2vlXZxYJ4Cp8IkegNM+J+rTrQVtTpLuRJG9JQ==
X-Received: by 2002:a17:907:1a58:b0:a19:a19b:78b0 with SMTP id
 mf24-20020a1709071a5800b00a19a19b78b0mr1160791ejc.115.1701934995649; 
 Wed, 06 Dec 2023 23:43:15 -0800 (PST)
Received: from localhost.localdomain (80-108-76-242.cable.dynamic.surfer.at.
 [80.108.76.242]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170906369500b00a1e3ce0948esm451435ejc.141.2023.12.06.23.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 23:43:15 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: add sensitive state for PE_RT_ADDR_4_PIPE(3,
 0|1) address
Date: Thu,  7 Dec 2023 08:43:08 +0100
Message-ID: <20231207074308.393008-1-christian.gmeiner@gmail.com>
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
Cc: Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian Gmeiner <cgmeiner@igalia.com>

0x1540 is the address of 4th render target address pair (two pixel pipes).

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c b/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c
index b106e8b288ad..9bf47327f436 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c
@@ -54,6 +54,7 @@ static const struct {
 	ST(0x1480, 8),
 	ST(0x1500, 8),
 	ST(0x1520, 8),
+	ST(0x1540, 8),
 	ST(0x1608, 1),
 	ST(0x1610, 1),
 	ST(0x1658, 1),
-- 
2.43.0

