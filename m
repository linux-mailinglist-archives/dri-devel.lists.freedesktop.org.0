Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147291B10D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6C110EB40;
	Thu, 27 Jun 2024 20:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="QSJNttYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39F810E364
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 20:31:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-6c5bcb8e8edso6281298a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719520295; x=1720125095;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puKEntbYEmMEidhzP0NA7FT52xgsmmmBOCRFF0y7bVk=;
 b=QSJNttYZTem6T2Ldb0bc17+Q+E4TL6Yi0/uxBSJeLrBBpJJz/tel7dWMQW325pgf/L
 PCuTiB9D4d3mgvOCUA4NHV4BF1HJsWf3vJT8J+INiImc4OGZVYajkW8F0VTa9sTp/FDo
 pAGhAWyG9FyZjsRNQMfQtytH4cKtAq9r3MpcjPcSSKPhs9RxZyRwH9gHClCXwqBJ9qRP
 MaxeabfMA4thCfXIA9ih3ue6qkacbCkzQCKtC9tgSGsTCImjRH4a7aO5jLs2GHyhjFzf
 37jZYEx2BFJ7DxwU70/RM7l5J7dl7OJr4RWQcP3X+2VzT0Sa016M1hT9FAJ5hWdjdWZg
 +hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719520295; x=1720125095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puKEntbYEmMEidhzP0NA7FT52xgsmmmBOCRFF0y7bVk=;
 b=jgyucTRTMZwLnckcgtF/3fuYNVDDiBIAUwmeZTLno8VgA0SXuCSDWoyCvHMvfRXcuS
 cdA7X/3bXkJsnim+yzfijXYdd4UrKquIrPGOyS5tqHH1rv4nfOXBJLLgeL8DuAHoZC6i
 A/koHqLkaQX3qVOaaXNywbNRiScAj/EcnMW566lW/xjVrEmFG/Sl/ofLToE2zc3errF5
 iCgTq2MQzhoZHM9N2RVxmeNKunFYT5zpBZDgVJlTQMC1CMtiGHkzs68mMjTGqKKxSd7N
 tdHmnbb4+P1oM1OJ8Ac1wgBISb28LQ+64CArxeXelAmprf/Sooi7JJ/kkBPCAagRG3P6
 vrhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwELt2BKJf25BKH3PP0kKxxCufkKUE+0HhglNx+09dhtpsIuJEUn08Ac9nWjXZlqK6iGJC6qaA/6HYSGCchmSfmNcjulcwxhLehIThcAMN
X-Gm-Message-State: AOJu0YyQc50/BOgIgoqKM79Y3lZEg/b94nPiuGwb7TEXlQCyI0jYqFUw
 pYdpf6uxnKIsd7kvXzvEYqgoXhaZLjXvu5lT0VAjHPW6OenU7uS/ZVjuCYhipg==
X-Google-Smtp-Source: AGHT+IH4yJEM2wH6Qd0uhyZ3YRcR+RRXG2M0fbCW7SjsmuVY0ysvtcnP0gO0nNFo9Kngj7OGCtFLAg==
X-Received: by 2002:a05:6a20:c481:b0:1bd:2a48:2340 with SMTP id
 adf61e73a8af0-1bd2a482929mr5734664637.61.1719520294993; 
 Thu, 27 Jun 2024 13:31:34 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70801e63250sm140514b3a.29.2024.06.27.13.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 13:31:34 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH v3 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
Date: Thu, 27 Jun 2024 13:30:56 -0700
Message-ID: <20240627203057.127034-2-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627203057.127034-1-mattschwartz@gwu.edu>
References: <20240627203057.127034-1-mattschwartz@gwu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

From: John Schoenick <johns@valvesoftware.com>

Valve's Steam Deck Galileo revision has a 800x1280 OLED panel

Suggested-by: John Schoenick <johns@valvesoftware.com>
Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b35a8cf6978afbbd55c80d2d53f4f
Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3d127127e7cb..ac8319d38e37 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.45.2

