Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71F481741
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 23:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4BF89B03;
	Wed, 29 Dec 2021 22:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E489ACD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 22:22:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t26so46892897wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 14:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Etcfx2vmjUNZXxo6uDLTR9v67H3OM7/KpAb6Ygdbd4=;
 b=xUYc7H5drDU+Q3+VMT+BCXdA4iCgJoUwwqP33aW1l1jFhRYkzmzyA1lj+C/1VFVLeB
 ha956sSINdK2Xb+njByR0fNGtA6M2e3USUV3nbyKRIpd8kqub3La38cHgM3ZIoqP6isv
 lYcMz2y8qjTP9q3nXu7rfchZ3DTaNlW08ilFVgH637avmfYOelc7RO0+sldzYU5k2TEF
 5ifPFQa2Un+Riw5Js9IZDVnJ0YojESbcVZZusLvbBASESMoCsPOp7gNBUxBzG+uwiAy3
 dr/huIS/Dx461epBeXaPQ90mAFHcHiXjNIZ4EwNPpddyv4a8jsEvsQ1cWqwAYFg0oaDQ
 wRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Etcfx2vmjUNZXxo6uDLTR9v67H3OM7/KpAb6Ygdbd4=;
 b=q4cv0ej7/RzV9AwGAOZo1eQWp0xVaF7/noYG/l/kiorzBQkbHQgEuluj8DCNwzMsh4
 +VtuU1M8tA4VowpGoI0Ty6yzFhtZ44UTAsOoJiAfEItNdJlqsjZUjNxX9cUsnGWzYV6j
 +RQiuFg4ma4lIlvBwbKtWq35qoSStB07lqMavCegnC5XdHAOsPbKkWywELqEGn2EWBq1
 K7AHpVMKFoJhokwTB+lG9woPpktWpMHSo+qJYEj4m3LfzPsb6f/QAKUHa3j7fADV6zfa
 nsKf1a0a+p79dRD0huzmvXI1eyGrnvkEaE1YNMxg+xFTfFPLb1qPbv6wcOc+hV+8DCiN
 XUiw==
X-Gm-Message-State: AOAM531gbqX5YP/fKbSl8TEVVjLNQbCcx0jj160fxif1DjBVoRdVXE8x
 51/1PPNORHrvKnekr24CjV5Zywa9n1ejhg==
X-Google-Smtp-Source: ABdhPJwQx0dAWhN0s82Rj/V59WvzhWufUdUP3dhUtEpz8weacw59e7fXQtRABTSQi/e7nDHna+ncwA==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr21836192wrp.552.1640816526510; 
 Wed, 29 Dec 2021 14:22:06 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id m5sm19700686wml.14.2021.12.29.14.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:22:05 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/2] drm: Add orientation quirk for GPD Win Max
Date: Wed, 29 Dec 2021 23:22:00 +0100
Message-Id: <20211229222200.53128-3-anisse@astier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229222200.53128-1-anisse@astier.eu>
References: <20211229222200.53128-1-anisse@astier.eu>
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

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 042bb80383c9..3dc383b1e2ba 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -174,6 +174,12 @@ static const struct dmi_system_id orientation_data[] = {
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
2.33.1

