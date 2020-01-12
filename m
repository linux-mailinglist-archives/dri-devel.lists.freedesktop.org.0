Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4B138677
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF8A6E563;
	Sun, 12 Jan 2020 12:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26D36E4AB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 00:16:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so5222572wrq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 16:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/ZwSehH+63Wca8LW+bRhFH9IjAyR/Srx1YNfx4JoKc=;
 b=vFu1zH2Ow9/UtMn8FnIkbj8ye3ZG0bOu0Pf6UW3FtStq7LsxbfNrGKZexZ8gMh+R3w
 LIFytqdtv6aLFMhHeEMrc3wpr7jrdElrel5sEauFkNVjRiOfrYvXTw8u94Lj+OurjBdE
 +OfJby1/+M3z4Bp8z9LZAu6r8bTmnQPnIjvZo7ZZeipiwHJGdmNSgyLu8MW7mpmb+C2K
 BCWoY1HHgjKoR2IQ9afeWq0GbqEQWj+QiIN2BMh7MK8XyJl1gJqiMDAc8AqCo2c2d4X4
 h7wpI+lzeFs+ODa6SRFF1+RffGHidTfLvHQrdHfRWFJ/EnzEfTTrE7pAIiJ9u5jGekbg
 yf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/ZwSehH+63Wca8LW+bRhFH9IjAyR/Srx1YNfx4JoKc=;
 b=uZd1DJYD80xPCl666ZVSO+6eATLJuT3wmUmXBXmQcp8+Yax2/n9IHbI6Z4c8XD3OHg
 8UxJ1GMIXtLchMVi5hmM5tz14P6E44D9htIWLbAi4Qvzgf0jZXwux+NfwOSzM1x6iiho
 sFT5YiCn6aEv2EjcWx6uqOu61vW0PjC4fzVLSLFM4WUcpqxxvx69cq4+ZR7emxUVNqgy
 rFFrAnn+NFcqUiaVxlSttiAIqOD3oL4PaPBzMsrKoN+ZJ2xtYaw/f17b8nhyEPWIezPi
 n0I5uRTAN0FYh4d8tOcV4RM2utao7uphVK+GYqWcdh6M51dxkjso5+efM+Pzj7jGJZYL
 M/iA==
X-Gm-Message-State: APjAAAU8ywZXo//KLCwyIaLlIfdQfxGpwnv0q6p5SVzq0Oco0JPWxn0i
 wW40CVx3yGlayqt83yd588Y1T1bf
X-Google-Smtp-Source: APXvYqzhBnH1QtVtoGevRNkruEHHQpOM3dYTmLALFHsUQVXGJIlv0gbK5NlcKnKn5cWW9AvIFcCrJA==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr10672631wrp.186.1578788206180; 
 Sat, 11 Jan 2020 16:16:46 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id h66sm8575535wme.41.2020.01.11.16.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2020 16:16:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v2 2/3] drm/panfrost: call dev_pm_opp_of_remove_table() in
 all error-paths
Date: Sun, 12 Jan 2020 01:16:22 +0100
Message-Id: <20200112001623.2121227-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
References: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, sudeep.holla@arm.com,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If devfreq_recommended_opp() fails we need to undo
dev_pm_opp_of_add_table() by calling dev_pm_opp_of_remove_table() (just
like we do it in the other error-path below).

Fixes: f3ba91228e8e91 ("drm/panfrost: Add initial panfrost driver")
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 1471588763ce..170f6c8c9651 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -93,8 +93,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	cur_freq = clk_get_rate(pfdev->clock);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp))
+	if (IS_ERR(opp)) {
+		dev_pm_opp_of_remove_table(dev);
 		return PTR_ERR(opp);
+	}
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
