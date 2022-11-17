Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6862E613
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 21:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2EA10E680;
	Thu, 17 Nov 2022 20:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ECC10E657
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 20:39:10 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id d3so1544004ils.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gf8nhbkFhV5ptHrI9veNeEBBvPRhZbZD4Iy3OsOWDI=;
 b=k0wtomc04CLFQ/oimpQEAfFsC/wFKEOaxydy/xnMuiwqXbbATpyDxEBzbOsUZYGMQl
 qinO5vMHF8KVson4eE9qULhgf8njZDv7dGRuYQHaYrKdDRJ/ahSFYuTM2zUI5MsQ74s1
 cPkpZpgPjpWjQtTvwoC11osToRj8xlIdMq1zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6gf8nhbkFhV5ptHrI9veNeEBBvPRhZbZD4Iy3OsOWDI=;
 b=RfQbtofx9aPfeQ7jdf1/brzCB4XjnifUat4arGRX31yVZwLk+bREXM9gc6OWtgli/a
 2IVVtx0ac203RQJX0uinW5RvPSH07utWpt92C7w6SrVN6wuC1eLHtwkkmBnxUqpY1zca
 lgVy+TFMHnlENHUC3qDlvGlR6A5G1k2VMz3HBmZdgcT0hyEYjvBiLLqZV3QT0/KSx25S
 zvZ9nhL3e5g6kUIlkMTir5E6jI5CHVIbBhMt9+6Soag9tG2BawoxPlSnzdUe85fLJRnz
 fHHp5AGLUs/4otpacmSWb+UgOuTZd45PkgkHcY02wUzujkg5OeI7aT3mKm08I/8tNgFI
 I7dg==
X-Gm-Message-State: ANoB5plJ3FulsHfWwJM+0WFOh2jn5NHDpveh1aFmBftN5Hyd0FucWgMy
 apywpAhfE3tVshjVCMQljA6yrZ3+r/F01A==
X-Google-Smtp-Source: AA0mqf4tJHcO2Ouv5AD2ke3z2Di7gzp4vSmuxtlE/UGTeC6ckHk83kP8c4sK0i+mhkakqYR2crIuuQ==
X-Received: by 2002:a92:c506:0:b0:302:4981:64b with SMTP id
 r6-20020a92c506000000b003024981064bmr1998342ilg.200.1668717548714; 
 Thu, 17 Nov 2022 12:39:08 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:b285:6808:3f3e:f538])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a0262c8000000b00363da904602sm570192jac.13.2022.11.17.12.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 12:39:08 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/panel-samsung-atna33xc20: Use ktime_get_boottime for
 delays
Date: Thu, 17 Nov 2022 13:38:45 -0700
Message-Id: <20221117133655.2.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
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
Cc: dianders@chromium.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ktime_get_boottime continues while the device is suspended. This change
ensures that the resume path will not be delayed if the power off delay
has already been met while the device is suspended

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 5a8b978c64158..f4616f0367846 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -53,7 +53,7 @@ static void atana33xc20_wait(ktime_t start_ktime, unsigned int min_ms)
 	ktime_t now_ktime, min_ktime;
 
 	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
-	now_ktime = ktime_get();
+	now_ktime = ktime_get_boottime();
 
 	if (ktime_before(now_ktime, min_ktime))
 		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
@@ -75,7 +75,7 @@ static int atana33xc20_suspend(struct device *dev)
 	ret = regulator_disable(p->supply);
 	if (ret)
 		return ret;
-	p->powered_off_time = ktime_get();
+	p->powered_off_time = ktime_get_boottime();
 	p->el3_was_on = false;
 
 	return 0;
@@ -93,7 +93,7 @@ static int atana33xc20_resume(struct device *dev)
 	ret = regulator_enable(p->supply);
 	if (ret)
 		return ret;
-	p->powered_on_time = ktime_get();
+	p->powered_on_time = ktime_get_boottime();
 
 	if (p->no_hpd) {
 		msleep(HPD_MAX_MS);
@@ -142,7 +142,7 @@ static int atana33xc20_disable(struct drm_panel *panel)
 		return 0;
 
 	gpiod_set_value_cansleep(p->el_on3_gpio, 0);
-	p->el_on3_off_time = ktime_get();
+	p->el_on3_off_time = ktime_get_boottime();
 	p->enabled = false;
 
 	/*
-- 
2.38.1.584.g0f3c55d4c2-goog

