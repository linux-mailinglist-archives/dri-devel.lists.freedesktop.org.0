Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7A8984B5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEBE11B32D;
	Thu,  4 Apr 2024 10:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T4DFH1Ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5511B32E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:11 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a4e79d7d21dso52456466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225290; x=1712830090; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DOrh7Irjq4f+bzjvRmtdFPtj9HsVRJ5Kf8V2j16C7zQ=;
 b=T4DFH1AbzP2/Sn7l59wUTSxqKY2DkLpmTb8STZ6lVMAziB30z2y4uwQ4zku2OopmG6
 BX/oXHEsj9T/YsgHAJwAUYmifixoOGtk/N2NR+XbvNQx10xuLwPrkGilx6k8LW/1KFkz
 prAJyzudUOhis2WJifO9Ro1ja35YJdzbCYLQQjpCDqWdHoXzTLBNQamnAvqYJI95idzQ
 tDSxu8iPbhQYbvr69ENEOJvouJCd9YL+gMWbJEfOXYEnuQEnPVVWwqVrwLM2skMxt8TR
 Tn1jI1A1s/DrMtOyUBtj2TTiguQdgNUlaDlPJtahUlW4hQR6gm8jMUCG2CUZHfUM3dmx
 iFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225290; x=1712830090;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOrh7Irjq4f+bzjvRmtdFPtj9HsVRJ5Kf8V2j16C7zQ=;
 b=h9Cx63QX0lc+NtdrhuTtA7njs3qkezKrKaA6xN64faT+U1dKo4n2343W8LVlkMmCgf
 VprbzjkiQh5eIlFMyH+f4rqZba+oEPT5us53ODRx7qKIlSIpgUnh2BkBujg3m9kNf282
 GXeWkbjVomiulJLseD/QyE3lLbUGGpJbYt7L/Roz4ULP1AkkYRsDdvMYf/pZZqu5IWuc
 RVk3fD0Fg66qBGl8GJzjHZEizcIybLyHkhxeULt5phsupDhPlNCcYF5qRrPVgFHNl8lH
 7lbSZ7GzCPkC2DtJ+zBenfdfvSXCosfjTemNxgnvepdSLmNgGvUSblYTXxTAfPn+w33a
 8SlQ==
X-Gm-Message-State: AOJu0YznNPNQyq/SPRZzJygD8i8joiivRkGbuIYSKPy3oiNqswN09MGO
 sorExmKDsE0MF678IEJ/8e2Ffuzg63LeHmgj98WmqWxSNayiNNbG1iYSm/ZQfWg=
X-Google-Smtp-Source: AGHT+IFFx0jNeXxS8p/PVfSfopzv8XenHyOICPv85lhOjQmeM3QgrFtbE28snmGj70mzNCw3CZotQw==
X-Received: by 2002:a50:d596:0:b0:56e:a2f:34ef with SMTP id
 v22-20020a50d596000000b0056e0a2f34efmr1734540edi.11.1712225289818; 
 Thu, 04 Apr 2024 03:08:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Apr 2024 13:08:00 +0300
Subject: [PATCH 2/6] drm/panel: novatek-nt36682e: don't unregister DSI device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-drop-panel-unregister-v1-2-9f56953c5fb9@linaro.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
In-Reply-To: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KIPxE7WAFkz5qGRN5hVp/Vx45cUpVvzgjI6wREzKChI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxpfDSv7hI3TUjp563fNvq67k9crjWPPPcY5oismPevXW
 RaeJfuvk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyWNk/x9rm9pqXJBosO34
 jqepk9az65ZM2LRfYa1kTVNiU8W7L1HNBzW/LgzWmLGnjj9pT2qX7c5gy28JfsKTpuzbt2iX6fE
 ziszrD9ybVLOTK6HEPl/JIndJSFbX/0Jpy0U/7zD9yVG0Ojv7VWNr6GZZHXOV1BeZs/8IOTbU3C
 +2EJrkLJ0q5Cha23P75ZErlv0+mlZZ9gL2v7fNnfy72UEmx7D23auIedxlIcz/d19X01FsmP03g
 51JwLvQzf9LSWfLnMb9rjOSFlhL7TqUzNVTPkVHXuDXV8v+5JfK7YlJUWGtrZ2Z7TEy1cJHxRRs
 kler227qOfFAuEN3of7uTXOP8xYqtVX937MrZYLLhAIA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The DSI device for the panel was registered by the DSI host, so it is an
error to unregister it from the panel driver. Drop the call to
mipi_dsi_device_unregister().

Fixes: ea4f9975625a ("drm/panel: Add support for Novatek NT36672E panel driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index cb7406d74466..c39fe0fc5d69 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -614,8 +614,6 @@ static void nt36672e_panel_remove(struct mipi_dsi_device *dsi)
 	struct nt36672e_panel *ctx = mipi_dsi_get_drvdata(dsi);
 
 	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
-
 	drm_panel_remove(&ctx->panel);
 }
 

-- 
2.39.2

