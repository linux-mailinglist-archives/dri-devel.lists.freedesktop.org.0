Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563023BF1D0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 00:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744E16E1E6;
	Wed,  7 Jul 2021 22:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C1B6E1E8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 22:02:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t15so4781995wry.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 15:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptDSkNNvQjDdl3nFcdxuQjfCtEwzKbJ3OmaY2YN6oTo=;
 b=CVt74IOKlyHF+rvkcThRHSvB0vN+SjJIwV23WXqVlgnjXuWLqb3ljW7ottIQdhIJNc
 EpGpF3UySusOvz18WaoSqL/vJJZRp0yMdLTzXP6bGn6FZOvgYCIik0aQQ9YmVjKWGJ9V
 Tlp2EKGL1aIRwPM4WmHyafYdko3Ll6tTfW8UdfAoWDflfC7lXTUAEYsq1Zczbkp2DyhS
 +ecJrP0JOWxiYx8feGFvX3XkfquiueBfO2TlmMzMz4tIVsR25HrnuZKfuyYi57etyyWb
 Of+yhC9fEhY4p+9H4aiRhAWOW/Vx29rZjzKemg/ltElYN+fgDjBLy8pz+VhWyW1CvhOH
 MkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptDSkNNvQjDdl3nFcdxuQjfCtEwzKbJ3OmaY2YN6oTo=;
 b=eRgz5SYU+M+ov5Dl/1GjVdif3Tzn8MESwMYnc8OLLs6MCj2L6FVWmUnxvcBz/VhRot
 0Wh1pLp81pcz5JWVLubQbRAAGa/8XiOP3L9zsCUjpM2q2D5psuryqHIOOuhcDishY5SO
 KvmDAxFyLU4tTiqczcs5GcFR0NOQ2/70ixtsCoFIKZVWo4Tu7awHmQJYy6GNTnMQK8is
 opbwpUC5XskG7aj6NNoKLAI7PpWcvu4xUj7gjCkcRLnRHjV6E6wsWNAp1KsRUnszPTSw
 VEVjr/Q3vxa1Grj0uFuw19sSgnTLest5I5dYfXdfbqh9foiJRPVd767tTe9PBTpqJH2B
 TAIw==
X-Gm-Message-State: AOAM530ni34tiLxrgwJsFF4l3GiOpKzr+Y95fxdqZ6M/iLs/eE7EhSrZ
 x0GwARN3DplKu7VHf0ZAc96AlQ==
X-Google-Smtp-Source: ABdhPJyj33zoYkSzcvzwT1pigmbVKPWXEH5A+xEDkKci/N66XnaVwpUcYVFP9zYCE/XgvzGKSH8UKw==
X-Received: by 2002:adf:decf:: with SMTP id i15mr28054162wrn.197.1625695351904; 
 Wed, 07 Jul 2021 15:02:31 -0700 (PDT)
Received: from gpdmax.. ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id t6sm178370wru.75.2021.07.07.15.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 15:02:31 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 2/2] drm: Add orientation quirk for GPD Win Max
Date: Thu,  8 Jul 2021 00:02:12 +0200
Message-Id: <20210707220212.4808-3-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707220212.4808-1-anisse@astier.eu>
References: <20210707220212.4808-1-anisse@astier.eu>
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
Cc: Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Anisse Astier <anisse@astier.eu>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel is 800x1280, but mounted on a laptop form factor, sideways.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa925..3c3f4ed89173 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -148,6 +148,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MicroPC"),
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Max */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
 		 * GPD Pocket, note that the the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
-- 
2.31.1

