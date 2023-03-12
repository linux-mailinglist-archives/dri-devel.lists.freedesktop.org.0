Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999226B6B42
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B31910E2BF;
	Sun, 12 Mar 2023 20:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65DF10E413
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 20:42:46 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so9746714pjp.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HW0myZZejO7uNMRvPlac+lbEnpvRrjfPGVZeXhkTeDU=;
 b=OcKKy6gVGc8H4VoVwynfn9rLrmB49TMArwvdNaLd0OLRizVZmNpM/2AJ8YkHz4zJoq
 wKJFyuNS3Av4vAwobgw/ePwL42Ik2sdz6JcwsCi+SJYlKrOvYxkWaWWk9xnZBDHEH9B7
 +p56vX3oKPUNiRm0OcsnoJJ05CMcFdIwTpY+S9u0NJxeBz57F/mwzvauoXj8fvl0hmqN
 xSqhTz3Pk+ArgvEdVetcUGjV3K3eVsv7stiatC53RduzetDd6uik24+yV3dgWApu4M5Y
 EiHcBej9o6nb/mOF7R8r/TTBpBANCDpLOlevqjbGfycwC+d6cGEyNbEHP4VTWoGJEYIi
 XJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HW0myZZejO7uNMRvPlac+lbEnpvRrjfPGVZeXhkTeDU=;
 b=g0H7DA4YN6kjoz6Re5Vb2zBXY8z8FVlA7loSyBo0yPMfROXX0G7zz90/Xn6irkXqRo
 HBCbwlY97HsOhti+7/VevQ8Olz0f/luF2GNfZukY1OU9/8kizwLyyJ1sjbWyrzWB5NUf
 S2wgNXywTBayefcF7yUQAEYwlxIRzWIQQ1t7+Jr1e72gD5fme4zPTGZ+7GDm3QBaaYKw
 HB1790iQ++4pwi1s9EMWbEcX/m4aWGeasA2HSTQzETiblnn1eQ9B4rjpEhxpCkQtDu7o
 FWs5sQDiKc6Fdf2E1XFQAOWGERAZb7dJyidgqMSB0XMYbmPqZymWYpYIVkJdvR3VEduN
 eD9g==
X-Gm-Message-State: AO0yUKUnLtwi7oFNBGl26mYSjEix8+OI/K9/HTb+7WFeh4UOXcVUNkmC
 1WJn/na5MBN3buwOGG70U0LpIBFbPwc=
X-Google-Smtp-Source: AK7set+sD263BqssJAZPFv92dbfz/7mD09CQaAZCBC16ymLx6FwS65EELyTh63Y7NjozxBRelVggiw==
X-Received: by 2002:a05:6a20:b71d:b0:cd:929d:27ea with SMTP id
 fg29-20020a056a20b71d00b000cd929d27eamr25973342pzb.52.1678653766045; 
 Sun, 12 Mar 2023 13:42:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a62b405000000b005a817f72c21sm3058416pfn.131.2023.03.12.13.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/13] PM / QoS: Teach lockdep about dev_pm_qos_mtx locking
 order
Date: Sun, 12 Mar 2023 13:41:38 -0700
Message-Id: <20230312204150.1353517-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

