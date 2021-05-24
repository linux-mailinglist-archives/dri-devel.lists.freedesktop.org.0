Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E64638FB6D
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FA389A59;
	Tue, 25 May 2021 07:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0B46E8CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 16:47:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so1963166wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cFulLOXj3mZBbP4W72DWkmRMm2f9CvykYPFY+mOZJP0=;
 b=BSEi2aEPJ8q5P0sbLOi6kRfHHynyuq2U3PYBui3kN98vEeNgckbggTJWxScGqdgvPh
 38WjhJrMRbkLfaQzZ91Jo+ACf2OzJsjKW/DxPyq90ipXideSYyNq9VW3raAvVMizMeqL
 BfTTmUNV5wCeG+QbbldLc5WL0SO8fCIlMymmtseXfjJgEifkR8T8neF99SUmYbldVq7f
 xWdAzOv5/Q9gna9JTBG4gpnFJxOOHQ91atFmsAY8/zF9F1oLLC+UqhrbM7hkEgJNVy1M
 M5c/zP9rN9BDkZF3mLkKUOnBvc7i+/Nj+PCkrFYuZl36w8LCDdSj6lW/Ww3vS7f0CLvL
 oWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFulLOXj3mZBbP4W72DWkmRMm2f9CvykYPFY+mOZJP0=;
 b=UNg6R95RjnE7EbjjqGYH7R7rqhVpt2zsjbdCDfDkp+r+mvt/dWj/5DofZguSZXnIPn
 nOCp3uUiYgCM80fLb6+uGOhBl0rd2zkLI4YivVWlg8oqs/I2YmhRu26FGDHDl9QLwbsp
 1Ljhe2pU0MKYHcETaFC5Yw9MqzGfY5M3yHl274/GvVO26Y/8LQ5OXfAQyEjm0reXdBmS
 q1cExARDw5DbfEM6tCZdVS0s7gmbG4Kz6IbkMJyusairyYghX6emHT1BXZcQizCQzgSN
 W+37hEFWbsRPeV7ieoQq3jZzWSBmf1wg+WG+ptSlo94FnbknmEcKtOZsSxIwV24LGPcb
 M0Tw==
X-Gm-Message-State: AOAM530ld49Nb6OqIXPw9sT5+bj/IRPBgP9X9IvjiHKoIPkyzFToeRdW
 DWKhXb5pOecxSNFV1YQtMAxx0A==
X-Google-Smtp-Source: ABdhPJygaQUYN5BRBk8qSPniQ7xfsS02EtynEHMHhRl5kmit2Hp1qi2oHyFlju7HGEr/myXLZSPLtw==
X-Received: by 2002:a1c:a98d:: with SMTP id s135mr14202wme.147.1621874870900; 
 Mon, 24 May 2021 09:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 b10sm15226358wrr.27.2021.05.24.09.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:47:50 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/dp: use opregion mailbox #5 EDID for eDP,
 if available
Date: Mon, 24 May 2021 18:47:18 +0200
Message-Id: <20210524164719.6588-3-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164719.6588-1-anisse@astier.eu>
References: <20210524164719.6588-1-anisse@astier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 May 2021 07:09:22 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Anisse Astier <anisse@astier.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

If a panel's EDID is broken, there may be an override EDID set in the
ACPI OpRegion mailbox #5. Use it if available.

Fixes the GPD Win Max display.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>

[Anisse changes: function name]
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5c9222283044..43fb485c0e02 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5191,6 +5191,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		goto out_vdd_off;
 	}
 
+	/* Set up override EDID, if any, from ACPI OpRegion */
+	intel_opregion_edid_probe(intel_connector);
+
 	mutex_lock(&dev->mode_config.mutex);
 	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
 	if (edid) {
-- 
2.31.1

