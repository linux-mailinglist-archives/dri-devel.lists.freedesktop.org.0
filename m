Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6798CE04
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 09:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D37710E6AE;
	Wed,  2 Oct 2024 07:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oj1MMwE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0438A10E181
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:42:50 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so566596866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727793768; x=1728398568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yK6XSPQeuFyFtbXfA5WqInzgCnLkF64sx+xWC6/eYac=;
 b=Oj1MMwE/lDJRe8nH54yDwRs+kDQrP7WnXtcfw5DlS2k1HKO8oDAoUae/mekQQgsMIy
 mzZZ/KD50RU2sYb56u9cWh3QulJM0iId3irSQHeo/W1Cz6ueBzlaS2pjATd05ncc79Iy
 ssAGhaU+zDywgSRHkoOdnx+Vq7TeYHsc9xsbSKYcgsldDLEJxptxvvuX1zoG/xbc9Jjx
 ebrB2+lOe3Tb32F+SdVROyY8stxJibDUy9lUw1YM7OI2yz5NhJRMxtAQD4Qq0EZUmtdP
 kYhmnZWJdPYVEs2+T0q04jR0t585EPFXnAEgEbu1sEu9YLXSTAiTI0n7NipoNpsJPuq7
 OpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727793768; x=1728398568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yK6XSPQeuFyFtbXfA5WqInzgCnLkF64sx+xWC6/eYac=;
 b=sTQvf35YDhEETUn6SkMftYGXQkn80tqNkOAERJTIrFBC+JQD/OOT5Nx8QeNqflQI6x
 mqBlMiJVVaaXpT9w3ihANXB5zNonwYhzbwfO2iyZGI3SUNi84KIjkqiTire9ydxzDD3i
 sFpo0Pt8d1H0EOxGQHluUaGQF//fzTq+jlyqq3T7WVIp3tXe4AfLOcgX6yDDqBNlPJF+
 sQP7tlRENNjB4ByWCOgtr5pa+GieoKIWZa+vGAQJFrhzQsT69vMfxftpyl1600H/IGen
 4bVQdqdp+OActcHmiXxnv404qOIg03+iibBA91HKIiR4KdAPwe6Mvgit5nZL9+N0qlTm
 bldQ==
X-Gm-Message-State: AOJu0YzNQQ8xfxGfltnbf4SWSVPMT9u0Kh40IuM6lhrtae6dshNi+vFc
 ge1QbfRPA1yZEQ8Sf8MQzhA113CsSKt26aa3lTPhaKF5h5tQQVUvWyfbKMoP
X-Google-Smtp-Source: AGHT+IE7kh06EL2VWdN7W2aFVAAad7D4SzfOGk9meNFpTTkt7+1OhKQtVdHlEftKJX1sxbhH375ggQ==
X-Received: by 2002:a17:906:6a07:b0:a90:3517:6b1d with SMTP id
 a640c23a62f3a-a93c4acab49mr1716270466b.48.1727793767934; 
 Tue, 01 Oct 2024 07:42:47 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a93c2948008sm718681066b.100.2024.10.01.07.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 07:42:47 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: [PATCH 1/1] drm/display: Fix building with GCC 15
Date: Tue,  1 Oct 2024 20:12:24 +0530
Message-ID: <20241001144224.3492196-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Oct 2024 07:47:18 +0000
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
dp_dual_mode_hdmi_id array by one, so that it can accommodate the new
line character. This should let us build the kernel with GCC 15.

Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index 14a2a8473682..295375868db6 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -160,11 +160,12 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
 
 static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
 {
-	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =
+	//+1 to avaoid spurious -Werror=unterminated-string-initialization warning
+	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN + 1] =
 		"DP-HDMI ADAPTOR\x04";
 
 	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
-		      sizeof(dp_dual_mode_hdmi_id)) == 0;
+		      DP_DUAL_MODE_HDMI_ID_LEN) == 0;
 }
 
 static bool is_type1_adaptor(uint8_t adaptor_id)
-- 
2.46.2

