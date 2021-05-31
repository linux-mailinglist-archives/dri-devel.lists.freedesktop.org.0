Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F2396921
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 22:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC86E514;
	Mon, 31 May 2021 20:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14BA6E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 20:47:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v23so9700672wrd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptDSkNNvQjDdl3nFcdxuQjfCtEwzKbJ3OmaY2YN6oTo=;
 b=GPEy78kYnOdp5iqNGzgboB4zuArq3mG/XopxoWGoph9sZ2KW0WK4a0XgwDsKQrgDYR
 t+3NEdmPRJI3aiY1F7LAfJtemZb1Yp75wG/ISmUhND4Ics0dIB6HWAQ1H+6eHS/OLusy
 hDm9vFoh/yUdn1mEwcz/uIFCkzuf1AxiJl/KS092uMxELde9ZMHkq0y+qp9TJi7qWFGQ
 Em/FuDN5S5bbhPToaDEhEBegHerkAZgoMiyzyQpngzsU1a31H/ntcMfjMF4Ijk4qhFKj
 FHYgtq23w1EcbLi7THcDxn5paqKJj4uzjs/InUV1+1pvGOV0JiXz2ToxNmjJf9kirHfr
 Zd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptDSkNNvQjDdl3nFcdxuQjfCtEwzKbJ3OmaY2YN6oTo=;
 b=rq7UHj/mTsVENGPtyiZcSEItFTq1AqUOBJzKXllodfd0skVPvNcqNsth9I4KthJsC6
 A02wABRg7pHoZnxItceofLtETYq6Jp1+HSNHoY963RWvRpUcfbwqqmven2g/A67WYuES
 7cCLjcukfWyiOXIZANDY2l2+c0SlPESztMIRYYaHeQ4/Qx3a77XAL2NQbshuX0NaJCAL
 9curi8+ml/KEZguk5wvxK7bGIJk8yl8trspqHrzde1M347ACg8kBBfzlhAFMMYS8Hehb
 k/bEH+1/PGdTXEqQ1YRoKgmoADujAfFYfP59iMoNIU8bvYZ1/JIPuwYgHF98p3uHrbkj
 mRug==
X-Gm-Message-State: AOAM531Vf+3a4A5VrWGoMB8HWAx8e8ra2ixE9+hXgK0bIKoKDBt9SP85
 oJX/g7Owoi00BiMMFH1uTxJjcA==
X-Google-Smtp-Source: ABdhPJzEEjwSnjavmItqbdm3ZQTHxJD05Lb6HkmnzryKVoP126i6sT749RLkW1kRLwvHQ6dduC4GNg==
X-Received: by 2002:adf:e109:: with SMTP id t9mr24030864wrz.372.1622494035593; 
 Mon, 31 May 2021 13:47:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 m7sm874240wrv.35.2021.05.31.13.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 13:47:15 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: Add orientation quirk for GPD Win Max
Date: Mon, 31 May 2021 22:46:42 +0200
Message-Id: <20210531204642.4907-3-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531204642.4907-1-anisse@astier.eu>
References: <20210531204642.4907-1-anisse@astier.eu>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Anisse Astier <anisse@astier.eu>
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

