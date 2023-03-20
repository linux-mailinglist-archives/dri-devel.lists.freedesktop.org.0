Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA1C6C1540
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6B210E5BB;
	Mon, 20 Mar 2023 14:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0FB10E5B8;
 Mon, 20 Mar 2023 14:45:13 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so12623638pjt.5; 
 Mon, 20 Mar 2023 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfAHpBWoMxTHMa2AnmzhjkXruv6iv5Hi+uoFH6JuoB0=;
 b=dvZaXVTGYKr1InrytzOA1sJ4NQK/BXq3NKHKzdudDkqaq0XSBSXf9z3k/Luykto2iP
 c+ZneJL4VSdLkTAQNEKxqGKTXzz+oLy7ySCL//+bGiDqqS8Kos40r9xWpaOKAqeVAX1I
 8ud9G7quF6etshvv3cC+Cfw4AzbUl/5lJl5hQSMV5zMZN1hbdM58wMEWfU4eTlKS0D+h
 8Km10S+bHJjWVXYJC7OKKLW+B6GYh+XLF9XGIOetq1OYyvj5k7FAok2JG+bMRN1OYN8H
 qUwQuvMHK6z5XutxhtjFHU09oWcsffFuyKjkKHs5HxjpqzlLs1cvryGa/JrKx16Z+bb/
 eArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfAHpBWoMxTHMa2AnmzhjkXruv6iv5Hi+uoFH6JuoB0=;
 b=4Uqr4dS8ZZfaFwRwiyOy7E+Tzpcxn4UFtf+UfJaVUYNdq9dnv5zDrV7vWNjX/XRylF
 8yJACqK5sWZdZRlg61rDEGhuDbYU27UJe6dHP7LVOXrRQI/bLwdlDn7kENN1+1Bx3MLL
 RzzeBo8gdcWwaT4DBOuZ8s/6UWCOyT48qfu3s8GKPXH7QUwOlN7ZM8aihUiaS9LuYOn3
 DoibnVlBLI5fLfLgsfZP/9/NaDPgO7gz/OS0nBqv3n1iigggbcTIG6z3MXbT+kYH4L69
 qVYayIFgNNPqeLRx+/fK6m4RYHBvcI6SMukQdzCHC90pnussGFayLULOwMd+vznuVTvc
 u66A==
X-Gm-Message-State: AO0yUKUAK4nE/3XOrsl4cWeSkoN3ic4pknd6R9OrZtHVflnGhcBERnAk
 drfMVA+5LRoGWjsJ5iwEc/rZ9HU4D2A=
X-Google-Smtp-Source: AK7set/kgpnfgYQ39cq6tSqCbmQJlYOTfrb5Xz1qqT6kTEByPM9h/PbOYeIY23ga+5pEL0JwAhoBsw==
X-Received: by 2002:a17:902:f9cf:b0:19c:dedd:2ace with SMTP id
 kz15-20020a170902f9cf00b0019cdedd2acemr15267590plb.18.1679323512781; 
 Mon, 20 Mar 2023 07:45:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 jc7-20020a17090325c700b001a0667822c8sm6818324plb.94.2023.03.20.07.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/23] soc: qcom: smd-rpm: Use GFP_ATOMIC in write path
Date: Mon, 20 Mar 2023 07:43:42 -0700
Message-Id: <20230320144356.803762-21-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Preparing for better lockdep annotations for things that happen in runpm
suspend/resume path vs shrinker/reclaim in the following patches, we
need to avoid allocations that can trigger reclaim in the icc_set_bw()
path.  In the RPMh case, rpmh_write_batch() already uses GFP_ATOMIC, so
it should be reasonable to use in the smd-rpm case as well.

Alternatively, 256bytes is small enough for a function that isn't called
recursively to allocate on-stack.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/soc/qcom/smd-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 7e3b6a7ea34c..478da981d9fb 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -113,7 +113,7 @@ int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 	if (WARN_ON(size >= 256))
 		return -EINVAL;
 
-	pkt = kmalloc(size, GFP_KERNEL);
+	pkt = kmalloc(size, GFP_ATOMIC);
 	if (!pkt)
 		return -ENOMEM;
 
-- 
2.39.2

