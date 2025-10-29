Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47363C1F105
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B0F10E8FE;
	Thu, 30 Oct 2025 08:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="o3i/V8xy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64E10E71A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:11:34 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-27ee41e0798so98577605ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761725494; x=1762330294; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPNxLxt9UFuIm8EyMGboZ19yWXNZhoYOkYVl+88dGJ8=;
 b=o3i/V8xycQnleZpDq+QwNTxK93dyPkPgpmQQaV0HO0bDEuxLyjBXTUoDxi1HZXZxb2
 1RFETkFh2OTwpzdVuuqtmaaRkrxTC8Rghmgaz7nrAueOLJnHzSNjuV7OR3DvcsPCH+1O
 4WLHEFfb9Jok1Th6uyc8KbP7SdKeK4pdnlm4r7aF8i84Tx4XC6na/jn5WeK5e4wlPkvG
 dwkLHfM8EFhTtqHl+AYA7trtALzCpv+xaMTSB/+Ee017HEx/rxROqsQHULsZ+c5Z2++x
 eZX7ylxdu0oS6kXXOn14A2FicRGLl9TvDJKFczDm97JiVypXW7gqlumG+60Z9BtQAeWE
 3gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725494; x=1762330294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uPNxLxt9UFuIm8EyMGboZ19yWXNZhoYOkYVl+88dGJ8=;
 b=L/xiCxFqRjAXjNrKaaAsHt5wcCRfW6/s419KsaIREN4mhU+2QVG0XiV6MJauee7Bou
 k6y8hOsqmtLJUkxePO0KwF0/3Y2NWs8wtxiiWabYHNkwt+Y+KWOaT5srazzc1jvetlUz
 hcTMuzXKF+jfSASby3zHXjzdh63IbYNXjXPMY270I7IFEcNyxFGYypXMMFKmPOtrcRFv
 6XVM0qlRAZmSPyRqtkgxHJqEcYkFimZByAmT9GPHLAc8kNSjT7KS10NxhwsCopWzZ+zP
 VipibS/ieuIr9Q1WkNqFeqyhAQPES0gXq7IuFT+5qkBhcFesTILajcBhDrwLKAKeQFEL
 cEwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0L5NCd8lrWvUXcKQm5Luqiyr9fuKCFDU1fAEAWsdQK0GAFfqnfmfoS4Ro1CEFbBu/qCuAJk9Rifc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkOI+kQLQZ1/m/pFIq1dyW140z6/uzFPeR4fTT/R0hascfspDv
 OPosHTbxCjZ9XiaK3V4s2uFfUkydVixxe3m5HlugCM9MIH5Trfnz+KJarPifFieERro=
X-Gm-Gg: ASbGncsjxquO7xO5fSzj9Uq5mx1ArngwFhLJ6yrxUD/pIJ1mye8TiJb5zJ3DERnly7r
 /9/Q7lStxbT9W0Zbcu+gDlQdyuwKx1LUH+TnOUfKKm6rSzGRoMHJpiiCyPHUmGWtV3ZG5J3JQg0
 aiNXbaSZ/1pntZDbXsmBmTFhc90RpCAdzxxyPg9TsD+khVYKaFZd0QaT31/T8agMsFQkrW9ybWA
 ygCosJtbj84XEldBdOa06MYR2TLvSS9f065sHMvBJCmUhmrCP0YV71MmouXIJFm6eGp8mduQiYM
 fMDkBXsFONp7By9NO/NETRlKF0rlw7LNoqfBGLaNyLtjrHitRv9mUu50gxq9+b85gIGEZ8saQG2
 ircERuFG3pdO2bkoP6qqiQV1O3c4RkuhAzDixUE3jQsXC3+DG4QiKy2t0smVJI0Gout41ixs2V9
 TKkxR2JaBA3F4O3sOT5xEKa9Wykm0XuMzP8jJyrhPkIWpxA7Z2gKUWs7RbiCyUFoQcVVi8fn+RW
 09GOub2jopro0Lfjum9A3h1
X-Google-Smtp-Source: AGHT+IEMzPuQ84Yst9JnKoJdLmf5H7SKCpoyZzuKbvoGK7sUDl7n6fuflS9kU+3WtdCFpWiOXbuokQ==
X-Received: by 2002:a17:902:e809:b0:290:9332:eebd with SMTP id
 d9443c01a7336-294dee0e654mr24011855ad.10.1761725494261; 
 Wed, 29 Oct 2025 01:11:34 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (61-219-175-100.hinet-ip.hinet.net. [61.219.175.100])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d23226sm143988155ad.49.2025.10.29.01.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:11:33 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>, jazhan@google.com
Subject: [PATCH v1 2/2] drm/panel-edp: Modify LQ116M1JW10 panel's bpc to 6
Date: Wed, 29 Oct 2025 16:10:48 +0800
Message-Id: <20251029081048.162374-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:46 +0000
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

The link training is failed when bpc value is 8.
It sure seems like the panel simply doesn't like 8bpp,
Changing the bpc to 6 allows link training to succeed.

The 8bpc log shows that link training failed.
6bpc
----
rate_mhz: 1620
valid rates: 30
bit_rate_khz: 2399760, dp_rate_mhz: 1500, ti_sn_bridge_calc_min_dp_rate_idx return: 1

8bpc
----
rate_mhz: 2160
valid rates: 30
bit_rate_khz: 3199680, dp_rate_mhz: 2000, ti_sn_bridge_calc_min_dp_rate_idx return: 2
Link training failed, link is off.
Disable the PLL if we failed.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index da3e8f223ec3..13755168cd75 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2094,7 +2094,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
-	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY3('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10", 6),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x158f, &delay_200_500_p2e100, "LQ134Z1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
-- 
2.25.1

