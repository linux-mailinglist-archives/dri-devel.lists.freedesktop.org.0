Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312893E522
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 14:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DCA10E15D;
	Sun, 28 Jul 2024 12:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DifSX186";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C942610E165
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 12:47:51 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so331196766b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722170870; x=1722775670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Rz1Sa7FCJDcDDRHYUxSDE566aPhABjKPXfQVVOA3+c=;
 b=DifSX186WuR115xTHxC4G4lITa8dyr0oCYtuhjxJDUA2EDo/WT77ot/YQYjGzpGbON
 ne3yewGqvsYxDeeJFmjEPmzt2AoPIDkyJ/wX5gX81acq/SUqE10BbdG/LcXVbG/88zrr
 qpg9QJyECswRQXiHUpcvDtZF9KKgirv/qDGTjMyzPn3QCLqSMcS8UmoXb7YxZDJwPQRo
 t1a/9xsJ1xpEsiLebxxk4eeeuNUsEXtL098C1cG3yNW0C461MST4h9m5rqp4YQv8OwYb
 OEoMaO5Txnxqnn/sdK1M1lA9CcKsx1HlviMA/Kj3c2dh/soHgIZDl3LtmMTprdIov0mn
 yGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722170870; x=1722775670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Rz1Sa7FCJDcDDRHYUxSDE566aPhABjKPXfQVVOA3+c=;
 b=RCmqCHKhE+KXEqTHTmLWCgFnCmHHOwQHsLLluKZgF19cTKFvyGTgckusn6Czd9+f+z
 x4cJIc6/I3oN9XcmHw9qI1qzlIq4e4/12EktQCnkaZ8b8PNTOGpOFSfIKyVAkFI7kk3W
 y4LVLiYraohiWPGDxk1fI/8jpJrLSUcsn5yKccCGDGPCszNwD4zv8yLghe0HGYe8YWDl
 PgAgs0RyAZFazqGZPiH2/FWVfN9vUpfecg4bPGGSRisNWxjdeoFNiidhjheeRW0lKIkN
 Y09SUNq0mMksRHYFF+M22jpTyuv+S70xpsRbICvo0qyQc6Yp33MMDxuD8Aw/p239U8Z3
 4Naw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJZLxbcP3blFAdfglvuHdyHoqp1UdnX+kbndXySDEHQkxAdhIw7qdYiVzApVCtYAKBSHlLPIywMAlwXELLdvCc8EtVCj6zyux78zPlQtVB
X-Gm-Message-State: AOJu0Yynt2YC9/FfKdYnWcbP3JMqN5XVxsc1QLjh47jnJ7WBuVBmqy0H
 9UufhVSPY0JnkixdBxgNDO/k5hdn5wAuMiTaZKZ6b5o8YHSKQ2k5
X-Google-Smtp-Source: AGHT+IHEP2W4c4cuNq+677hX1/5oKQxE9h9C9dsqXF6zLDDzYSj4m2N672LJ2VpZFYw/WZ4yBiHy3A==
X-Received: by 2002:a17:907:1c19:b0:a7a:a7b8:adae with SMTP id
 a640c23a62f3a-a7d3fdb7dc9mr451783866b.4.1722170869976; 
 Sun, 28 Jul 2024 05:47:49 -0700 (PDT)
Received: from Slimbook.lan (134-248-201-31.ftth.glasoperator.nl.
 [31.201.248.134]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9d3cbsm381125166b.182.2024.07.28.05.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 05:47:49 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	hdegoede@redhat.com
Cc: mripard@kernel.org, luke@ljones.dev, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
Subject: [PATCH RESEND 2/2] drm: panel-orientation-quirks: Add quirk for Ayn
 Loki Max
Date: Sun, 28 Jul 2024 14:47:31 +0200
Message-ID: <20240728124731.168452-3-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240728124731.168452-1-boukehaarsma23@gmail.com>
References: <20240728124731.168452-1-boukehaarsma23@gmail.com>
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

Add quirk orientation for Ayn Loki Max model.

This has been tested by JELOS team that uses their
own patched kernel for a while now and confirmed by
users in the ChimeraOS discord servers.

Signed-off-by: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index a1dfeaae644d..0830cae9a4d0 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -208,6 +208,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
 		},
 		.driver_data = (void *)&lcd1600x2560_rightside_up,
+	}, {    /* AYN Loki Max */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYN Loki Zero */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
-- 
2.45.2

