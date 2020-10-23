Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26A2974F8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83B56F8F5;
	Fri, 23 Oct 2020 16:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FD96F8EC;
 Fri, 23 Oct 2020 16:50:29 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id h7so1804741pfn.2;
 Fri, 23 Oct 2020 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1nFWz7TauCZeK9jB7qRHq2/DLyA1MoAVvcU8Ul/qSVc=;
 b=AjUHdScRbMGE0mb7wPFvxl2OkcajrtiwNnNTYoW4VNn95/pHATQekqrYNMB35rNdfE
 DlyAKcTOQmVWtuWK/Y6dNzVHpNs/AxONzsZU9N1r6o+HAjZhr5WemklERI/8JkuGce49
 bi9kLWgn7SozK0QUTp2+h3yppZ0RjcbVukc52uSwu3tMQ1VaJ6rwdzYTsbYtn5JrRziv
 RkTT6vH1NYnOSptD9tyzxkvDB9pM4LaFI80SR+PKOL/LAQMN5UodLG9jLoed+ptidhtB
 NnUViLYmbPs6hyl8BGTpdVXNlck7m3RAEOAh/x6/sB8IH7DVkxrn4nLhuAHZUrXzoF6F
 c52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1nFWz7TauCZeK9jB7qRHq2/DLyA1MoAVvcU8Ul/qSVc=;
 b=hCm22yt6M4tf70ebUQnuoH/LidokFDU6ZbK2mHu0kbi0ddjjVRfBdjF0HSxEWlNx+/
 4BHjamBKZN44cD+GVrgHvDUL/ffPJ5FYk8l6hLzQ7cGDIe5pY6jj8Gk7hVZtN1bkl18o
 uS7XBfTpQ1t9RyXPlZjCfF94QfH9rgS8LkSyZ+/rXo9eJiEDJepPynlL36m2/jaH71x6
 dB1QbqhnWzYwGEMls8fWFcHXwksxlnLeDXDRuL/lGoGlzyUO4EHyYqg26ZJ7p6vF5Gvp
 kDWgEXDMO0ptLc5NUMwsks9R65TEDFUJ1X6nyFHIFjGeoL/4XAL3SfUN15FlwgTXwBHB
 t5wA==
X-Gm-Message-State: AOAM532W/JDik7DUsa11+PSzhMoDWzIAz0ciWe3gEnw+oOqmFZv0RzDa
 mKTOgwYkEoES8EDWumAf/vslwAtSO9rcBQ==
X-Google-Smtp-Source: ABdhPJxClr5yl2UDdlPhpEcmq7MchF1xsGWuH2QJzB2FK+8JOjLnLaUbvyvCGaXCRQpd+dnyymFjuw==
X-Received: by 2002:a62:1856:0:b029:155:1718:91a3 with SMTP id
 83-20020a6218560000b0290155171891a3mr94730pfy.66.1603471828701; 
 Fri, 23 Oct 2020 09:50:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u14sm3443232pjf.53.2020.10.23.09.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/23] drm/msm: Do rpm get sooner in the submit path
Date: Fri, 23 Oct 2020 09:51:09 -0700
Message-Id: <20201023165136.561680-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Unfortunately, due to an dev_pm_opp locking interaction with
mm->mmap_sem, we need to do pm get before aquiring obj locks,
otherwise we can have anger lockdep with the chain:

  opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex

For an explicit fencing userspace, the impact should be minimal
as we do all the fence waits before this point.  It could result
in some needless resumes in error cases, etc.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b6c258c89290..aa3c7af54079 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -750,11 +750,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = submit_lookup_objects(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
 
 	ret = submit_lookup_cmds(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
+
+	/*
+	 * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
+	 * in the resume path, we need to to rpm get before we lock objs.
+	 * Which unfortunately might involve powering up the GPU sooner than
+	 * is necessary.  But at least in the explicit fencing case, we will
+	 * have already done all the fence waiting.
+	 */
+	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
@@ -831,6 +840,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 
 out:
+	pm_runtime_put(&gpu->pdev->dev);
+out_pre_pm:
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
