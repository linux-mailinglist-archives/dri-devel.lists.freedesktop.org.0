Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BE98EA6A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BE210E7B3;
	Thu,  3 Oct 2024 07:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gV8RZKAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057F10E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:23:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so935407766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727861001; x=1728465801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iaQhpnhHBH69krl2w1/dGjBTBlNuiT9+NdutbasOvZU=;
 b=gV8RZKAkRessu6CIdBfpDTzylWlGpLnPuLbQ5wjv61FIblffhNOyFWyn3qzz6+rMjC
 GmqWlCrPG+blLPS3foaEvXTVSprKiNIuayD14bZoK6RYZLkSXInoWOkBN3AoEcz7cl29
 5HD8pF87c3VDoI8jglvv1Uh5yq7KZfhk56YbUspZevqFC5yXU4L6eyArYNBf1D1mRSdU
 8QVTuJhkHVj3KUf6xnsVW6vKa8JiPaXxCkYL2r+mLBPmlWbP4lqIEUlr9eA44lunOOLl
 3wRouTNMi9klo6M/UyVuM9haH0yr4sWZ6QpaIpMwy09kxa/iTF5LfEAPqlUchqRgEtc8
 LasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727861001; x=1728465801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iaQhpnhHBH69krl2w1/dGjBTBlNuiT9+NdutbasOvZU=;
 b=gfz9qWhujDN+DTpcwIhv4MQs1PJgNbND+9a2zxC+mVaqdX1Wel45rUGyHYU+UHtlLi
 R3NZPtRRdSqrv+n89J5AbGHiCjxpxG8zEbRVchSJJCvE5JuvuBZNSlmMS+yWeALT1hcq
 fmBNSkil/62QAMzLCFfk09nnUuxEoVG2HRznQi4FBWDVdelgN+JwyS6uLoXmdxhGT0hW
 nxRke1c5uxM5N1VrNXwEi5ls7X03GDM2xIFBoYUwDOPMaA/hILo+xvdwJnC1o3fS80vT
 aviK3/HSQCz/8ADZGFu8170J3qsPfOugYbZHYlH0EEhGC79O2f6psMoOvmIXscYUK5Ta
 hAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXww3GEzOEC2iKXOOt5p/hdc7mvpxZpp/N5REJ8L6j76aRpATDmb3W8g8Ee130cupbTo75njBotCp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqs20T7NRxcOX0x5KaScSZcMvrjZOpjXJA2NXYHDbodIkcDA+U
 Kjo3D4c/Y1m1F2vh2ULwPcb//l7vt0sbQFUTpOdv0i32HNsdSrz5hJHyDXQQRlg=
X-Google-Smtp-Source: AGHT+IHECtzHGvAL9MP9q1EegqpZ9Z5rAkGSfkKWxlawz84CqPVj/i9yLtPvROVMvRA6Fq8rP6IHcQ==
X-Received: by 2002:a17:907:a0d:b0:a8d:4b70:b09a with SMTP id
 a640c23a62f3a-a98f82342fcmr248114566b.20.1727861001256; 
 Wed, 02 Oct 2024 02:23:21 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5a7dsm836931266b.62.2024.10.02.02.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 02:23:21 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: jani.nikula@linux.intel.com
Cc: ville.syrjala@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/display: Fix building with GCC 15
Date: Wed,  2 Oct 2024 14:53:11 +0530
Message-ID: <20241002092311.942822-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002090703.919591-1-brahmajit.xyz@gmail.com>
References: <20241002090703.919591-1-brahmajit.xyz@gmail.com>
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
dp_dual_mode_hdmi_id array by one, so that it can accommodate the NULL
line character. This should let us build the kernel with GCC 15.

Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index 14a2a8473682..c491e3203bf1 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -160,11 +160,11 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
 
 static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
 {
-	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =
+	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN + 1] =
 		"DP-HDMI ADAPTOR\x04";
 
 	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
-		      sizeof(dp_dual_mode_hdmi_id)) == 0;
+		      DP_DUAL_MODE_HDMI_ID_LEN) == 0;
 }
 
 static bool is_type1_adaptor(uint8_t adaptor_id)
-- 
2.46.2

