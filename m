Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D29805453
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B2710E516;
	Tue,  5 Dec 2023 12:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA94910E516
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:36:49 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6cde4aeea29so3897875b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701779809; x=1702384609;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UwqFDeGV6eW6XdPYpX2kE/NInLRVcN8eq+ZIooofQY=;
 b=hyExEgeZqfk6nIA00rndNtojzg4hqlSLsXJbNcMfrX1/k+/MQG7bZiZvPYl2GA06/+
 obo9aORtz6Pu4NvmcKNhQEBv0vwPSwST78ji6QbAe+F8jwLGej9SLHfrFwDUYC0z91F4
 f4KMWzBDlreylEBhQ0Y21CZNZGdGc17h5rpbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701779809; x=1702384609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UwqFDeGV6eW6XdPYpX2kE/NInLRVcN8eq+ZIooofQY=;
 b=RQ0ls+zjsNpZzyuT+dFT1knhy9Nl4TnCQNd6Vdlqdl0pU6j/NojJdmYj10SBp3EvgJ
 0uaIQHzmxWASOKk+QIJU0qITJMhzwujQaVvkLGxnkFSl0ov9lECMJXMtsnRcpTJRpZoH
 nvjuIYN0iLjWE9RRqDAyKjDDaB0han/IeSTamsdnzielCFGpGTFCGTtUZ9vACJHYjcKx
 6o4RKs1CbssaHZGOD8WrvytYjQ94+Qvq8OVOdc614VW9FnWh8t0XigLiFxrGMQn8rsHM
 oSlNhivhK4kqzfhG66glby2dO3ZSr1Nw3Dn7ILlkGQDGBYApK/WKNhunrN9KockhGRrH
 R3Fg==
X-Gm-Message-State: AOJu0YxHjzBWCWAJwcVm1z5tZXQ2CNYIhdYZtMD2+v3b5u7sEYXJJK+f
 5MbCKBAyvJsaK3D+jZs9hdy78w==
X-Google-Smtp-Source: AGHT+IFHozXEbLedjhGxYPoLzJBDZRAuFZw6UtdjR8BL72A6PhNEbQM53COb7FZCJSMVj2+wWbAoAA==
X-Received: by 2002:a05:6a00:21d3:b0:6cd:e046:f3ec with SMTP id
 t19-20020a056a0021d300b006cde046f3ecmr1073933pfj.5.1701779809258; 
 Tue, 05 Dec 2023 04:36:49 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:433d:45a7:8d2c:be0e])
 by smtp.gmail.com with ESMTPSA id
 p26-20020aa7861a000000b006ce7abe91dasm285115pfn.195.2023.12.05.04.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 04:36:49 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/4] drm/edp-panel: Sort the panel entries
Date: Tue,  5 Dec 2023 20:35:35 +0800
Message-ID: <20231205123630.988663-3-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231205123630.988663-1-treapking@chromium.org>
References: <20231205123630.988663-1-treapking@chromium.org>
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the order of CMN 0x14e5 to make the list sorted.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 819fe8115c08..e0a18e17d3a2 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1987,9 +1987,9 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140HGA-EA1"),
-	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
 
-- 
2.43.0.rc2.451.g8631bc7472-goog

