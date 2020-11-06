Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE482A9192
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794B56EE2C;
	Fri,  6 Nov 2020 08:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAB56E08A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 07:05:37 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z24so242605pgk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 23:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OM4R8kvz7DcEDGoVL/+jwadYBnqD63FlUWgPugvm78I=;
 b=vJ5Si/G8zW5asLYK4yzoXUH4+0noPeaZCYzJx6PYHk+ao2dzwXa9pytvIQHVFHK5Ne
 vBEoN04Ch3a1Gg8/qxcpogXvPkWOJK7Xa6Vsrg9HJ2iRgrSkLzwZzJ5HojbFqYCCbXZt
 aFK8L8fkGrFm88BWuj5hBUoXR/aSe0H1TumxaT3sDKDCMe82hj6cjfywQElRrKHacejx
 3d9cbL/yM4akOHEJ3TUOn/TniQKyGE5eQiOcAv7hO2OPghXeHc2WFIH3nzHf88MGZwTr
 AlctnMbWTwX7sMvAQcgDy0+W45oH8VVJyBoXLwuHYQZt1YYKxtFOV2vgpByiR71Aznl4
 XJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OM4R8kvz7DcEDGoVL/+jwadYBnqD63FlUWgPugvm78I=;
 b=t+OX/ZWlBm37j+14oM4AR1BhJTITPrcPBvTaKSUNZUpZcrtvRimtSbkvQ1MsuzkxC0
 qd27aAeVY9Ti09f7UL1q3T90xdDShoYjm99TxMHSNzeDb1NaRHDPyaLpPepSjJyfSjfJ
 8kKpAym0oPIYgs9HIKMCDBjZIMuKgimAo6CDUtdCsBDdHUnxxMMEDfPwVX4nsO92WjKW
 myBcqRx/U6TN72ifH4Y6O5H/Iz+c+7aT3CYJ0cmvnP9Hz12uoiw+cNVeFxANjqyBdENe
 yGC510iuQjG1UEeQKfn/kZ8pjVCALz0hk+lVULSrKjibbeE/tXqyx+Je6/tzNHBSaxDm
 FBpg==
X-Gm-Message-State: AOAM53251ElCnBApe+V/iNADNXK64GP/44pJHiRQce2Fp+iCunrryC+H
 7FJqI1TRsRsZe/YIqaBw9FOxXA==
X-Google-Smtp-Source: ABdhPJwE+7aKzU0Jx/bREINzle5y+qOHgpi0m23MkC+FXdDxSl8y9riR1SAMwq1YP0KhdPSWuKLI5Q==
X-Received: by 2002:a62:1c92:0:b029:15c:aff1:b16f with SMTP id
 c140-20020a621c920000b029015caff1b16fmr687698pfc.0.1604646336961; 
 Thu, 05 Nov 2020 23:05:36 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id z11sm819019pfk.52.2020.11.05.23.05.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 23:05:36 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/7] drm/panfrost: dev_pm_opp_put_*() accepts NULL argument
Date: Fri,  6 Nov 2020 12:33:26 +0530
Message-Id: <43be6d118201f9feb70fb030390fddce0852ab0b.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1604646059.git.viresh.kumar@linaro.org>
References: <cover.1604646059.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 digetx@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
there is no need for us to carry the extra check. Drop them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 8ab025d0035f..97b5abc7c188 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -170,10 +170,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 		pfdevfreq->opp_of_table_added = false;
 	}
 
-	if (pfdevfreq->regulators_opp_table) {
-		dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
-		pfdevfreq->regulators_opp_table = NULL;
-	}
+	dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
+	pfdevfreq->regulators_opp_table = NULL;
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
