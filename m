Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7D133CCF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8E6E85E;
	Wed,  8 Jan 2020 08:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65C46E14C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 23:06:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f129so602274wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 15:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OMmRwlsdJ8B0kThVmC1teyeuGIZ28R3SGQmOXkOZCg=;
 b=Jwsj+YaWZljQ8pVmlO9Qg4ZcVd6YTIaUwlN4E6/YRZXVupsZDBCT/IG6YD11LfvIC/
 wjubzJKkd+EnH9ivm1vzUrC9AahftMhox5ChzHfqAmpmu/1Jjf34KITt92zTYh9Ccer4
 BajpuRcy+q5Yr7VOOc3TBrZxGv1yTiSbaMIQQALctcEalMwOrS9YBAk0s6XznaDoa87x
 B+EtRQk5P3BEPsKrIR94ZCh9/aYzCUZ6C4dDGIKIWIH9d0IJnWHyNEmYEODKlcdmyiro
 VIjh7IxwSKbbuUP7LniDN/REatFU3fByJiPTFH/dFD8CG816+WaDRy+1coyGQQZruUOB
 jlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3OMmRwlsdJ8B0kThVmC1teyeuGIZ28R3SGQmOXkOZCg=;
 b=ALnCaD+Yz4dbYMvFbPRuVU9nl45iEti1OSRIS+mZE1oBpVTPsBIQwXafcJgZxcnHo6
 b1DOHr2hRwoUIZPOCkl5/84KenXCsY1DJzrzzgH/oTUgnV+z3WI2NN1oReC3dGVEB2gF
 kBxYQbKgAJXo/U2yR02E4rv/IoMgi3ezAd1Z6LttBpAT4qGVslRZVMUVTpx6B49vmky6
 d0JQsStAwByICCJFZrmZdaIYeT8+I6WFW32EyilthS4aaNTWQzaJOxhr9OL08iVcs98R
 6ZPxsrsuI1Z2bLdtHJzLRV6Bv+mNfmklpE4keTNdk5lbjXgLA9fodYrdN4yuTZSMU8Cp
 sPog==
X-Gm-Message-State: APjAAAVmO2tm4vIlnzm0WPZY5KJp6JY2h7HGm8bsL3jXPLJgJwWBYUpb
 oSNk3vQK/Ut/ru9THaMqXsjRQZqzwPk=
X-Google-Smtp-Source: APXvYqx4pOW8OEjv1gMruzFtuQEsNgeqBVsbKCG8agEZlBX/w/EIHafixJNy4g1otnUEt/LO8xsr3g==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr584150wmb.73.1578438410327;
 Tue, 07 Jan 2020 15:06:50 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g21sm1335912wmh.17.2020.01.07.15.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:06:49 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v1 2/3] drm/panfrost: call dev_pm_opp_of_remove_table() in
 all error-paths
Date: Wed,  8 Jan 2020 00:06:25 +0100
Message-Id: <20200107230626.885451-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If devfreq_recommended_opp() fails we need to undo
dev_pm_opp_of_add_table() by calling dev_pm_opp_of_remove_table() (just
like we do it in the other error-path below).

Fixes: f3ba91228e8e91 ("drm/panfrost: Add initial panfrost driver")
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
