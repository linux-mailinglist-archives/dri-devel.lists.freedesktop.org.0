Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8BF98EA74
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C649710E7BC;
	Thu,  3 Oct 2024 07:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BzoHx2rP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818210E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:21:25 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a8a837cec81so516931866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727860883; x=1728465683; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iaQhpnhHBH69krl2w1/dGjBTBlNuiT9+NdutbasOvZU=;
 b=BzoHx2rPMqDXeAHnlIkh9z20vgYCSajLiDytQd6zBhOms2eOdCDR1Hn52E1iCljh7W
 3UYdpHf2wjRcluM1tH7qew/f/P2WtYx2aa32JrQ5TUmcbZu1Nid9vC67Xka9+8mRUrE9
 fXWAkEoRYVPjqYxK2msxVNp9cqozXCtsz9QBXyckz8wNsyHE5sgJTHhpZ87iFOEOp9z8
 2Y0MXK/KoJhkagESaHhUP2zn2s1BHCXjUv1U/M7dGi+3AEOsRxTA/CjMjhxx2LWwPjcc
 9A1+IW7ihWjZVa0Bes5g8jC1r8EH1M92KlNP1k7PyFw4wZVTyBNIECevN9uBInODmHUI
 dfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727860883; x=1728465683;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iaQhpnhHBH69krl2w1/dGjBTBlNuiT9+NdutbasOvZU=;
 b=Eww0FrqKl6WocgN39qF5/SRsLpSHt103+HER53XKVKAk+g+i5n55hjAC4aj68aYUah
 jKVWbumKOnotdjMziC6EKzs09abWQuNH4RqqCeTzv4wfCNKucES/k9nBEyLkTONBLcnz
 p52gmPfK0FFbrowm2K1b/B+Z5XX5NiaLlHh26cnDxc/2GJ+NblMPdlb34hjIk5QRcmBz
 RxKfag50tzD4L2OMMDo6Ucn16B96OQb7UBWAh4ZSkRBvznhrkP37/owUrmM6e1ZLQ4iS
 +tgG80jZqiRfbZ9Le8ctZdPQvR5blyY2fq5Y5TP1pLvjwtZ/22RW4iGQ7JE9pUirucP3
 5G/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBwRjD2QbGS+A53mJdkkmLDFoaKynIXEOz4mc+oi1a/1mY5UXd++YnVR+Q1KNjFd+SuzS3+YkgMCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztQCrzPcFksC0wPNBwoCspzjp9/kXCSHaOQXtvwrdsOo/Y7t4+
 oIQjw9PJmCEdthBldlCh7N6i8vaOLsv7Z8DigMJkwu9unnwPXYH1
X-Google-Smtp-Source: AGHT+IEgh4YMVp0DWDZTtM7faSwwuQzu4C6+F5HcdFDDYHFOdqjA5nBFn1Ka8W5+KuNPegpRhx+czA==
X-Received: by 2002:a05:6402:2809:b0:5c8:85eb:9d9b with SMTP id
 4fb4d7f45d1cf-5c8b190d707mr2070614a12.13.1727860883148; 
 Wed, 02 Oct 2024 02:21:23 -0700 (PDT)
Received: from azathoth.prg2.suse.org ([45.250.247.85])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ad571a92sm1933989a12.51.2024.10.02.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 02:21:22 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
To: 
Cc: ville.syrjala@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/display: Fix building with GCC 15
Date: Wed,  2 Oct 2024 14:50:46 +0530
Message-ID: <20241002092111.939469-1-brahmajit.xyz@gmail.com>
X-Mailer: git-send-email 2.46.2
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
Reply-To: 20241002090703.919591-1-brahmajit.xyz@gmail.com
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

