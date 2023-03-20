Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A756C154C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A96C10E1D7;
	Mon, 20 Mar 2023 14:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D918910E1E1;
 Mon, 20 Mar 2023 14:45:11 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id c18so12648759ple.11;
 Mon, 20 Mar 2023 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HW0myZZejO7uNMRvPlac+lbEnpvRrjfPGVZeXhkTeDU=;
 b=PhP6+MY2gm+VfsWU6J4UMRMOHIYbVs8+vizsPZv168wBOIB9PALpYVfd6ZivPoEngY
 t/VUJFnA/t4Ix6GsI7xwhIXMkAYpKhhRp3xvngTue6Yr2fFXbtmHtWpAQB/s+naJOTYw
 IRTZeCf/1OLyWnQopg4LLMR+VeOJW0SWboQWMJmtAUiYKPEyPfrp5RIa7I8htQgDrv7u
 Id7p9NjiUuVcsJhDDDBEShANjbF6FYb4DklqnEW405YxDUdx+2496YftV81PkBEMAJVb
 1iddGsKJ7Zt798qVPBcNgXNRq0rx7b3ZiQPIaKcFfUSv7FPK9Xd9DR2vPRCvRDOQgqRi
 4D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HW0myZZejO7uNMRvPlac+lbEnpvRrjfPGVZeXhkTeDU=;
 b=qlKzLbF+G8CzN35/4UEcBQxk4fkD2T1URMXrnjCIMi2lsqp91YB07J8mnVML3igHH7
 O1sajuFJwK9UIf4maPJxz44ryEM66G3HpGMaqqhvTpnT1ozFrXCIyy6WBeEuBpGCv48U
 oe6VG/SATUZlMAKAuA/WJOso4dFrvI8jfuNG5TNUOa8eVSMymirItqTSs7A664A2Gycy
 /0TkkbhCvx/v6p4Mk1pQLoGVFuOSWl73FPhZFH3uzu6+vl7Ft0ewGPBw18Dwgm2Mm5DP
 kczcbEquv5c2GChy7mfHbO6KfPnJk9/lTtbce28M6pWQvcYJpMnuAtjK8tVpK2yBTQ5T
 oSbA==
X-Gm-Message-State: AO0yUKUeUSkJgboeX166MvEvg36heIZLeiK9sNACWvK983ecbwd/O07H
 IJ6ryJEwveKrWOYDHxWMD+zLD6fBm6g=
X-Google-Smtp-Source: AK7set8dqJQ+HWWTlRCoB9bVOq+YmX/QlpDsIah5XuQdk5bfZ+gnkND2WAlzEoISE8F1IrVQp/Nnmw==
X-Received: by 2002:a05:6a20:be09:b0:d6:9e5e:f240 with SMTP id
 ge9-20020a056a20be0900b000d69e5ef240mr13319951pzb.4.1679323511174; 
 Mon, 20 Mar 2023 07:45:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b005809d382016sm6433907pfh.74.2023.03.20.07.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/23] PM / QoS: Teach lockdep about dev_pm_qos_mtx locking
 order
Date: Mon, 20 Mar 2023 07:43:41 -0700
Message-Id: <20230320144356.803762-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:HIBERNATION aka Software Suspend,
 aka swsusp" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Annotate dev_pm_qos_mtx to teach lockdep to scream about allocations
that could trigger reclaim under dev_pm_qos_mtx.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/base/power/qos.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index 9cba334b3729..d4addda3944a 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -1012,3 +1012,14 @@ void dev_pm_qos_hide_latency_tolerance(struct device *dev)
 	pm_runtime_put(dev);
 }
 EXPORT_SYMBOL_GPL(dev_pm_qos_hide_latency_tolerance);
+
+static int __init dev_pm_qos_init(void)
+{
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&dev_pm_qos_mtx);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return 0;
+}
+early_initcall(dev_pm_qos_init);
-- 
2.39.2

