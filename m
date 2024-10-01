Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01598CE02
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 09:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A11310E6AD;
	Wed,  2 Oct 2024 07:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I0EyC/kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1A10E636
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:28:14 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fabc9bc5dfso40601071fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727792892; x=1728397692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yK6XSPQeuFyFtbXfA5WqInzgCnLkF64sx+xWC6/eYac=;
 b=I0EyC/kbABGoZpnwkarl983NZmrgYCNKgPwgaMxPecsLlcVuu14CMbEmey2AGM80BP
 9BqN6aDgsLYAPFuGL34jy1ycVX2GW5+ec3sKsBJfsaXDp25Qxokokg5jy8NHbQ0SE70v
 zLeguAqoPseu6bv1wRAPP5AERtLBDNRSGHuao4NL7wy5gfjJpIvCJf0CJ9tQGpbU8sH4
 +n3Uo34iM9k84IQInK7GWbABJMvm6y9AA+Gr3XGDYdWFHsFBZr0d9JIIEQf1t9rr/Ui9
 vRwy6Tcd7ygc+5vp4sLInfmkE8sw127Q9K5eKINdPSiCA06Z8JoH/cBs/IG1b7W+TIKK
 w1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727792892; x=1728397692;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yK6XSPQeuFyFtbXfA5WqInzgCnLkF64sx+xWC6/eYac=;
 b=ux3/F3blPAL+RPJ8mjFmOGB0JFdI9YbYYgluMhScY3LKJLYkNHAjOJ1Yv0gxFEPZUY
 GShVU0NmaqAoFEE6kOISYkGlpFHkYRyHE3TrMY01cI8SUDpL7ASzmgRifq0xOuVTIdL5
 z9T5zvcu1P/iGgf42Ft6ed08/XngT/Vg85Cl7yIR/RUR4xWD7xu3omXwnyI7GLWzlTHW
 Ir/tMADQDJNkwVH9jKGg83n7yBTNOmcYkz0B6eg+8X1Gmr7ZbQy4zAYc/foh19WiysvH
 Q9HOMP02FDZg1mB96o+OCTB7JLI68mN+AhuDACJ+5TNL4ftnxIXIRTYh7NCOV4X1uQAL
 709g==
X-Gm-Message-State: AOJu0Ywbl0Ao1uZc92fJqZhTfTHf//8GOuSm9tHYuzYL6AC4Nd+LWcoZ
 UjN9LIfJfieJUVDM0yIu9MFuWe8ahk/b/DfYj9++GmvQriAHTQnCXQldXH0v
X-Google-Smtp-Source: AGHT+IFwNSvB5OFTQC5+i3xSNrkEy6O4lUnjOnMWyZBSitigufKnu6QriZt/jeP99QMT0/19djJfeg==
X-Received: by 2002:a05:651c:550:b0:2f3:f339:e68d with SMTP id
 38308e7fff4ca-2f9d3e5d2f9mr92861701fa.15.1727792891454; 
 Tue, 01 Oct 2024 07:28:11 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882495335sm6254320a12.95.2024.10.01.07.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 07:28:11 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: [PATCH 1/1] drm/display: Fix building with GCC 15
Date: Tue,  1 Oct 2024 19:57:52 +0530
Message-ID: <20241001142752.3471847-1-brahmajit.xyz@gmail.com>
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
Reply-To: ZvwDYHgZBth8J7YA@intel.com
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

