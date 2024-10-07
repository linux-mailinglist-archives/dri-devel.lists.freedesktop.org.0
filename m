Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C822995069
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A0010E542;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqp4EsoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302510E2EC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 02:03:49 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71dff3b3c66so364718b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 19:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728266629; x=1728871429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hH8n23sDEKbwaTmLkfdoZ+DyRO45NetuWgQWtqCNa5g=;
 b=nqp4EsoHbZ1G+k1o8MmPJQlNRZXT//DDIZOLlSG7rA2hdtLmLJp0XA69LgxSyZRpbf
 j5Z3k04ZXQ1z7paHpvTU5w1yIoCkoxN+1Hubh5LRHB5+wgVhqnTkYnvlhuLQWp/Z16fy
 RVhBRI1+pjJTr6x9lidTR0fPbg6mxrtjFYKTX3FWD69BPQ1UF0YQOBgqTriypDZa1WeT
 GDbLC318Dcp2PlPPlAuDLJOJZbbfmUfj7SnZJZRgSBEWfOfZN6jWbfUL/x6bZSBa8dyt
 rwuJLtB1NELQl8esz4eDDj2VdSkmkYStl+wPXaMiqQHzr0dVtpP3aK0JVOSGL1gfBL7B
 MYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728266629; x=1728871429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hH8n23sDEKbwaTmLkfdoZ+DyRO45NetuWgQWtqCNa5g=;
 b=ghqLGBe384WU3sZbEDb99FNJwG2MDeq7wzRpmGfkAbfa3E4PydGHk6rCsBPne627qy
 h0PHkGRgfg65TOTWcqiCpZOWFzHz3cYHWhYtYS08ccXHV6IhxChHD4gOIqwwmkPE2JOc
 LWURp2SUCKnVE70NA2uu6elNzMajCu9b6qMD5W5dBWY2k00M8ZU/j4LHrJc8SoA0VuR7
 VRm76Rg6j8ODcMFyDdbyzahl6UtW4cdn0NUEYxye/Qc6dJxsdi1erNuiBIT6ghbQOv5q
 /lslbZOEpLcfTa/WAZcyNNn5BV/c65M54faziOXGLyHbpVaccVJtd6+m1p1HH1VEWNFe
 HMNA==
X-Gm-Message-State: AOJu0Yym3L3zrgf4WSdE6KET+mV+XWjnqoo/nwicgxIZMum3EWjD9b40
 xz2qaNjYTZ4t1DU6nTxQItXZvZYqOn+xof0pAdmDKthY5kRsNUEOPc/G3IhMFv8=
X-Google-Smtp-Source: AGHT+IFmL2pAxARWCe0kDikhq0H2GuyhDlOp6loTG4gTtUTjS9cAkcIXigtrDoSH6+5HD+N8M7QCUA==
X-Received: by 2002:a05:6a20:841a:b0:1d6:e227:c34 with SMTP id
 adf61e73a8af0-1d6e2270c35mr14526492637.0.1728266629071; 
 Sun, 06 Oct 2024 19:03:49 -0700 (PDT)
Received: from raven-lpc.. ([158.62.27.110])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71df0d65283sm3470369b3a.146.2024.10.06.19.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 19:03:48 -0700 (PDT)
From: Raymond Jay Golo <rjgolo@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Raymond Jay Golo <rjgolo@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Chuwi Hi10x
Date: Mon,  7 Oct 2024 10:02:23 +0800
Message-ID: <20241007020258.2202786-1-rjgolo@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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

The Chuwi Hi10x uses a panel which has been mounted
90 degrees rotated. Add a quirk for this.

Signed-off-by: Raymond Jay Golo <rjgolo@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 0830cae9a4d0..2fe1e85b97bb 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -234,6 +234,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Chuwi Hi10x */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "CHUWI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 X"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Dynabook K50 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
-- 
2.46.2

