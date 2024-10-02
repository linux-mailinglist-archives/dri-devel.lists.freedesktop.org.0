Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10998EA6B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3410E7B4;
	Thu,  3 Oct 2024 07:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSyKfguy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE14910E6D4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:07:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso956038466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727860036; x=1728464836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FcvIViQVlDS2WsqVsa06bUuiyL4w3XFOgCNxRQLBe1I=;
 b=ZSyKfguyhTmuTbLQ5bHfpn1bqxm5lqdZ+u8ZEmf3JcEuMXfzWmby1O+VBKHRQoyS8l
 m80/Kdt8Qc+GViSsL/SE3nNlU09FgsbAujoYKobaySaPRTza0hxayKy3PZD6AbZs4+nf
 TIc1g0GYPzE52AqZ/RXTKCW5UA6UEObRyVvKNbIPe+Vaphyqd0OPo00FDnZVb1MBUIv8
 KdJClx2ECADID3q+pkk1mb7OG9MFF4fvdLNEOn19Cmve49VtnW8WYXhzByKeGEUKMCbE
 87ED5zYHbU1//itqIDT0G7TG1QhWpPcpQ3Xy2mSnIyPTGc61hPuVMk+az6LNv109iswA
 lLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727860036; x=1728464836;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FcvIViQVlDS2WsqVsa06bUuiyL4w3XFOgCNxRQLBe1I=;
 b=UmIkuYWC16RwkD1gxoCz0iGEGy1/LcwmkxnkrqXwO1DWQFjgQEK8jKfcMaCStYdyZy
 2fQu4jNTnGtE3ByzrrvL97Do6HiChHqNKJ+pFFVh0JhUhn18uwx1imyI5Z4LpfwGkL/e
 BvjwFHSCIWc8LSGryV5MFYHgIcdrYan70VdjxXgJT22rPFQ1Z04iGqV+Z4gJ7F/SlIdM
 AbQzltxMAqEvLmxvbvYTx5bU94VV7+sqDRiHM0srAKVwUJ1HwxjvIp5vPPqsbY5qHnHI
 E/sVHfejyUkzL5FEp3jINMxZdCsy8EJqgppP+26mzenG/OtPTVieUodjcCKMuVzBdvZA
 Nwpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6WfHUfigBLAqAtlcHnZBVpNyoYj3eU4gWLN6w/RdUktxoZlEvD9yBgqTVurHY3czTBA4P1mkzW0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwnfMK7+m9o+mpNu+M0JYArkvVSrYtlq8Nz99l+Qc/DeXelLuz
 qcj8hajaNADsGm1YoqZup5PXZNUCK8RpSwtBWgkqJzFSd6rfXuX8
X-Google-Smtp-Source: AGHT+IHQZVXuaMWh2VB25DsRX8UC/S20xLekqiyAEm37jrmrC6fSlzCwQBFF0r65Pp5bDEcpksqupQ==
X-Received: by 2002:a17:906:478b:b0:a90:b73f:61d7 with SMTP id
 a640c23a62f3a-a98f836ee63mr309695366b.42.1727860036030; 
 Wed, 02 Oct 2024 02:07:16 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a93e49542afsm609373566b.205.2024.10.02.02.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 02:07:15 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: jani.nikula@linux.intel.com
Cc: ville.syrjala@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/display: Fix building with GCC 15
Date: Wed,  2 Oct 2024 14:36:37 +0530
Message-ID: <20241002090703.919591-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <87a5fmvrkt.fsf@intel.com>
References: <87a5fmvrkt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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
Reply-To: 87a5fmvrkt.fsf@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GCC 15 enables -Werror=unterminated-string-initialization by default.
This results in the following build error

drivers/gpu/drm/display/drm_dp_dual_mode_helper.c: In function ‘is_hdmi_adaptor’:
drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:164:17: error: initializer-string for array of
 ‘char’ is too long [-Werror=unterminated-string-initialization]
  164 |                 "DP-HDMI ADAPTOR\x04";
      |                 ^~~~~~~~~~~~~~~~~~~~~

After discussion with Ville, the fix was to increase the size of
dp_dual_mode_hdmi_id array by one, so that it can accommodate the new
line character. This should let us build the kernel with GCC 15.

Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index 14a2a8473682..efb3c3494579 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -160,11 +160,11 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
 
 static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
 {
-	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =
-		"DP-HDMI ADAPTOR\x04";
+	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN + 1] =
+		"DP-HDMI ADAPTOR\x00";
 
 	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
-		      sizeof(dp_dual_mode_hdmi_id)) == 0;
+		      DP_DUAL_MODE_HDMI_ID_LEN) == 0;
 }
 
 static bool is_type1_adaptor(uint8_t adaptor_id)
-- 
2.46.2

