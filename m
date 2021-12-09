Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344E46F65C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F7210E394;
	Thu,  9 Dec 2021 22:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30F10E384
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 22:00:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t18so12016150wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 14:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBT+Bo+JugjtZ2kT7aaQIcYQDl1vT3SMacbUPRi1MAo=;
 b=lYO2OMLCnPsA34QyK1y707HcmkT7ulqJpki5hB/a9c6SXnfYLwBPMlY8wnCZ2FMqgs
 HKVMRvJpcm7BrKlbUxe1XjG1NfTSMRTW6H/xkret/o4yQcvZk/Q7pI6XR2enfVo8hhxe
 sylBb7DczAwYKO5C9NNDnANBjO0OJv3CoimLQPjD3u6g2zBGxjKuOxOjygrgY69crtnN
 56hg0lIF81rd79EYkBk7PrBBL6+XY2xl54GP/DvNE4H644brYlCNRnp8s6KcVfdOYh5W
 26w3tnLG0VPN4D8gz7sXHg3mlBHhpUigOP97Ha9MTjbQT9+wceCKBKDACNJHFy4H9LYm
 aibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBT+Bo+JugjtZ2kT7aaQIcYQDl1vT3SMacbUPRi1MAo=;
 b=dPt20RygKFlmNjp7XakG6aiadHgEMKiNKeaWBZcnhIrpot6AMV/559EjSUsG/4HkNY
 StPWs4LfJ7aOGejTmI8IOG27pWb2RQll4VnIIYOUkFX+bH2Tj2cNQOP518ym6S76sTLa
 tUJ99VBgSltWBE67kgnI2R6QEDNds1IcdFf6Sv60m5DE9EV3BSjLMn0mrKmFd83L/Pdd
 Xtj5NmLBoOGa+OesD1jtiXAOhNbFHEctY+jLoXHtrJkVrG6hj94q4Euc7Vtd4xxNrGPp
 mUwGkj0k7Jz0W6sTjFxM2L99uXyMK8PD5NwDO0FtEIZEz7CgEs9a6KhJcpYmvnu+Vv/i
 cGGg==
X-Gm-Message-State: AOAM532BeHUEpwChwp0SzVMPXX9pbJi2x4c+YVBuyahuW/GKbHpS94GB
 RpLFovTClUwxqaiF8j4Yk2EAKanpfaPx5A==
X-Google-Smtp-Source: ABdhPJzgv9ob3mqrAubTfgc38gMWaKYGzAlPKe67AqpZQk/iwcpEVi9zOicF3mEr4b7xaaSkGugUXg==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr9568813wrz.215.1639087257809; 
 Thu, 09 Dec 2021 14:00:57 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id f7sm1061524wri.74.2021.12.09.14.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:00:57 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 RESEND 2/2] drm: Add orientation quirk for GPD Win Max
Date: Thu,  9 Dec 2021 23:00:42 +0100
Message-Id: <20211209220042.310848-3-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211209220042.310848-1-anisse@astier.eu>
References: <20211209220042.310848-1-anisse@astier.eu>
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
2.31.1

