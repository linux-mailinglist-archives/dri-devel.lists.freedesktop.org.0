Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F442411CFC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022DD6E59F;
	Mon, 20 Sep 2021 17:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB316E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:12:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g1so68930153lfj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/V7PO4oKi+Cdn3boVLzzbggsDJhCE3vfiLfp0i9c8rA=;
 b=JuQc1D7eggnCJORwmJNKVRhuCGoZrE608OuQeEreGHUosyUeSjKhdov70YzPFDmRge
 BsfU0v9yrOoDCHoepSExTAJsQbbJ1AtekwYK3Cj31xc850uEuYHsL/WI6nUVj4RdKd5k
 Tl0KQyQeoBqeG+aMQ9vmSc1Np4p245bj1ALUQF/Z5vwxSH/G+vMuQO/WN2Oi3hJ65EA9
 1ehEIevF8wNc+M4IT4+xRjQ0pcEwy+8dpbRGcRIpYWEq0iOI5iQqwAog+ae4CsOkgeTV
 zxjtEVgie3Si+z/wGD8iiMQAQv+JoxNSXGHYiDNxuVghWQwG0qqontIfVMLA0jUSBfVp
 1a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/V7PO4oKi+Cdn3boVLzzbggsDJhCE3vfiLfp0i9c8rA=;
 b=6t1BdILOLSn8cSqzktOdqUvDJ7hhlOTkNwH0wdnrIFqlGijnoDDqiGYQps2IDrbu5S
 FJVHf996Tfp/msJCwbBMufZ/c33y18sZqlRgLZSfA8F5PJ2GC607OfruFhKocfaNM8Ue
 fGRtg3JjT06oQMg1nRXUPON8tHj9YhD5H9Vi/cvoc5kfZkVVjgflkxWwQ251GRlqOCUF
 QzxTpXhhC666w4iWEe94EvxRaT/zH51gDBgqA+JKnO1tb7A1IZnz54c5qY4eQ3alyMIe
 AzxrBb7cm+r6Z4Vswj6xIxOwGjYQA3JZrftp+6THvQKcPEW8XrkMZxjEhfpGcRHWjxAW
 siFQ==
X-Gm-Message-State: AOAM531V6srlfbh4IMYbzlDbGcdSy2RaZLlwSqOXX3YCzjU4+zk1ZQu9
 0/Dr7yyOyEDSEzBBB+xNFT30+g==
X-Google-Smtp-Source: ABdhPJw3fSrrEgjePCdoFq/02ePMQn26eyLTxe8tnNccEoy/DKbaqGEAhKjOZq/GbDQMuJEKrGiUtg==
X-Received: by 2002:a05:6512:118c:: with SMTP id
 g12mr18941294lfr.143.1632147091114; 
 Mon, 20 Sep 2021 07:11:31 -0700 (PDT)
Received: from lmajczak1-l.roam.corp.google.com ([83.142.187.84])
 by smtp.gmail.com with ESMTPSA id a6sm1389505lfs.160.2021.09.20.07.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:11:30 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Jose Roberto de Souza <jose.souza@intel.com>,
 Shawn C Lee <shawn.c.lee@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 upstream@semihalf.com, Lukasz Majczak <lma@semihalf.com>,
 stable@vger.kernel.org
Subject: [PATCH v1] drm/i915/bdb: Fix version check
Date: Mon, 20 Sep 2021 16:11:01 +0200
Message-Id: <20210920141101.194959-1-lma@semihalf.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Sep 2021 17:13:41 +0000
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

With patch "drm/i915/vbt: Fix backlight parsing for VBT 234+"
the size of bdb_lfp_backlight_data structure has been increased,
causing if-statement in the parse_lfp_backlight function
that comapres this structure size to the one retrieved from BDB,
always to fail for older revisions.
This patch fixes it by comparing a total size of all fileds from
the structure (present before the change) with the value gathered from BDB.
Tested on Chromebook Pixelbook (Nocturne) (reports bdb->version = 221)

Cc: <stable@vger.kernel.org> # 5.4+
Tested-by: Lukasz Majczak <lma@semihalf.com>
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 4 +++-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3c25926092de..052a19b455d1 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -452,7 +452,9 @@ parse_lfp_backlight(struct drm_i915_private *i915,
 
 	i915->vbt.backlight.type = INTEL_BACKLIGHT_DISPLAY_DDI;
 	if (bdb->version >= 191 &&
-	    get_blocksize(backlight_data) >= sizeof(*backlight_data)) {
+	    get_blocksize(backlight_data) >= (sizeof(backlight_data->entry_size) +
+					      sizeof(backlight_data->data) +
+					      sizeof(backlight_data->level))) {
 		const struct lfp_backlight_control_method *method;
 
 		method = &backlight_data->backlight_control[panel_type];
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 330077c2e588..fff456bf8783 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -814,6 +814,11 @@ struct lfp_brightness_level {
 	u16 reserved;
 } __packed;
 
+/*
+ * Changing struct bdb_lfp_backlight_data might affect its
+ * size comparation to the value hold in BDB.
+ * (e.g. in parse_lfp_backlight())
+ */
 struct bdb_lfp_backlight_data {
 	u8 entry_size;
 	struct lfp_backlight_data_entry data[16];
-- 
2.33.0.464.g1972c5931b-goog

