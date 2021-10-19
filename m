Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338744334A3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 13:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713F89276;
	Tue, 19 Oct 2021 11:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D88D89276
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 11:27:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u18so47291086wrg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EMk4Y2s5N1nhLJBTb44zhoYF8ebvGOWpERzdxIsNFw=;
 b=l4vv22hCEVrD0ypGhy+TdvBKcUyubPDP8nJ+fBURwRejMGbdjcLqPkW8mAUOwb+l9C
 akgMKx/+ud3ORTVAkXR9jsiaFnnv1KYbqeoOGYDgr12ePfqhPUzUULqBluc/+ELHOe7/
 EaoRrDAnqLiuaQP+LeuVyYAeOtJYuO7XZcl764CjS5RizqY7r13z8GcU5e31kI5j0WlX
 8qufjyx1PN7PvW5mkAhePuv9s5otiDVAWsr4o2iWxiJ1zJk4OBD1+U1a8ecJg5txIjHM
 tzkpef38uKQVkByUKq4jry6G+Oz47c2NzznIN1sK1iiRGTpHxf34JHUC5yRAdVkstlB6
 +NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EMk4Y2s5N1nhLJBTb44zhoYF8ebvGOWpERzdxIsNFw=;
 b=we7FMX9DRfQgeTs5khLeTV729eBDUUiigQ9zbIPgA4Um0PmLAYHt7LBIbSPTAnR+1Q
 nmY4mC+D/EMQFRABWMRg11YNC3Qci2h5O5Ap3RrL77K+sNQb9aPYpl1Kh1fkFZKB9gbQ
 5yNL62ycQyILKJKVVRnkLTewyi6aV6aAHCv9odwUbYHKXES+L+xHtIjCAfloMwsX+AYn
 E2Fha0VHvguToQDsjtOJZ7v5+ITRJ3N3rZh/rYLpwKUcS1R3PQdq9OwXg2OTMoeC9TJA
 J6O/5qKZZc0LISInl3Kz6MM2GtfOaEKqUXGDmj1sm9nLd7mGtkcw1BT6JZGavM5wdptd
 Sq/g==
X-Gm-Message-State: AOAM532hshKs1kuGvJZsK79C9rZIl9yhordATzWFBuE9lpQjAuwwJDgL
 wYPxHP2/xnqMJ903sFds5cY=
X-Google-Smtp-Source: ABdhPJxPviCiF41UncIk3uIkeURtmwm0NYF7TmnVPId36BtpmTD5pYWdBsvxFLzxEGXYUhXtfFjtgw==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr42390188wry.382.1634642827639; 
 Tue, 19 Oct 2021 04:27:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 a16sm14781891wrs.30.2021.10.19.04.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:27:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: frattaroli.nicolas@gmail.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
Date: Tue, 19 Oct 2021 13:27:06 +0200
Message-Id: <20211019112706.27769-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trivial fix since we now need to grab a reference to the fence we have
added. Previously the dma_resv function where doing that for us.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_add_implicit_dependencies v2")
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5bc5f775abe1..94fe51b3caa2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
 			return ret;
+
+		/* Make sure to grab an additional ref on the added fence */
+		dma_fence_get(fence);
 	}
 	return 0;
 }
-- 
2.25.1

