Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22972A14B67
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D0E10EAA7;
	Fri, 17 Jan 2025 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F8710E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:53:02 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7231e2ac9e4so283945a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042782; x=1737647582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSgi3kw7bFscI4U3pI0dPYp1l5hHbgjpKx8NF/oyVvg=;
 b=mjBfKpmgFzjRhEmYlDgcu6mut2DWeCXHe3oJPs9So5W8JU0KMRXQmfVm46OwVlTMO6
 cHB2r/kv1FpCSyNohxehidfP3kA7WEaqMqlSBuoyT9YDEwT+1yGRVbybLRSDADrurrQA
 PUQoBNmU3WSQ1VhKQz0kwEcKrgLUeQrntCawuF949WRAjHSLtI/yYZPJduDlzvM0VZhb
 JgQLIxzGkNTIk0NjJLZ5vEmDrDyqWbdB0G9NpWRB9DNQ6MdeWetKM7pplVUIszwTNRRJ
 VCRiKPO+IDDvZ5guaRadXwORPA/mkKPcrGvMv4rYW+WbfpCA3sltpISzWGqsvkx77LNv
 hVQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1rgrpcngKNHFmQxPz1YJF+mdz7MIFiP3B7iFWUUbNEPyCu83sh9DdzVnfaGKLfXIngNu4I5ddWjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2QLrgNwX0XedTYNcLsqyfa0PND4sA1zP0421MNp7jV/fVSiZ1
 u70h/HRCEz7uJjqqkttUUUme/uuKqgpl+WCbpNJbGHzJ4e5G7oOH
X-Gm-Gg: ASbGncvExreZ5OpvxUxcrG80E8cgV1LFLD84gle7aWbW3P4OBlS1U04iVUFvZSX/c/n
 V1CveQS0wJUYsLBtJxT57XvC76Ks3BG2odST6CUzTMsjcqZVoFQJndiqwrHgZXLKtgKwqhMqkkL
 bufmsGQpaOeG880KWT5B0O0Nf6Q2eCwrU1aoCtuqV5FonDsUYAJmyDXGUKK4YKcEVtQE36MwEB+
 owu1Vd+pxmVXVOGA2KWnmpeD9xKeq4JI5WaDITeIbUIqPFTvD7DRKExlA==
X-Google-Smtp-Source: AGHT+IGMxtpB+0yWH5AZLkYo0fesbnQW+efhzl15OoxO78C0NUVByzsq1cXARwqbqgol1KPp7nqNxA==
X-Received: by 2002:a05:6830:6115:b0:71e:1392:80b5 with SMTP id
 46e09a7af769-721e2ebe8bamr25019632a34.24.1737042781599; 
 Thu, 16 Jan 2025 07:53:01 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fa35f05bbdsm70538eaf.13.2025.01.16.07.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:53:01 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
Date: Thu, 16 Jan 2025 15:50:49 +0000
Message-ID: <20250116155049.39647-8-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116155049.39647-2-uejji@uejji.net>
References: <20250116155049.39647-2-uejji@uejji.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

From: Andrew Wyatt <fewtarius@steamfork.org>

The AYANEO Slide uses a 1080x1920 portrait LCD panel.  This is the same
panel used on the AYANEO Air Plus, but the DMI data is too different to
match both with one entry.

Add a DMI match to correctly rotate the panel on the AYANEO Slide.

This also covers the Antec Core HS, which is a rebranded AYANEO Slide with
the exact same hardware and DMI strings.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: John Edwards <uejji@uejji.net>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c5acf2628..9e6708cd1 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -244,6 +244,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
 		},
 		.driver_data = (void *)&lcd1600x2560_rightside_up,
+	}, {	/* AYA NEO SLIDE */
+		 .matches = {
+		   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		   DMI_MATCH(DMI_PRODUCT_NAME, "SLIDE"),
+	},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {    /* AYN Loki Max */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
-- 
2.43.0

