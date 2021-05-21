Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AF38C9A7
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86B76EC52;
	Fri, 21 May 2021 15:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DD56EC52;
 Fri, 21 May 2021 15:02:16 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso18315451ote.1; 
 Fri, 21 May 2021 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xm6m2knyDpL/AilBChBzFOY2/qamtbXCofZcDB02RLQ=;
 b=Q22x2wvK1MAFQV8Zzl+hmt/CTI4iB5OIFaZsce8GvK9OmOk71oW3p/M7t5Gsns1reo
 rU1RrseTh2g4HJDdqKKLYSfggRaJflV80K2fwhCwLQULeujBvsLK2FSoURhqxfhtDIE6
 B4nCAI5170tL6L0QCC0AfoVQJDtNzUU2oZ6f7oGOYsctL7dC8WuKjhExUjGNFGLxhurb
 EPGMzKvyOhK3NqteGRQw6J2v5HkdBl7kudaqoD2lBzpEY6YXpx2vCycZSdHDhbRL3iXD
 Xl5JfQ89f2974pNcqAds5jZ7bvhxfcGjikJH4G+MBy6b9SqmWT+4Ok5XVN6H8HLH/YDW
 0g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Xm6m2knyDpL/AilBChBzFOY2/qamtbXCofZcDB02RLQ=;
 b=nG0Ur4sd1pqaDH/X7s2r1NlSvqkR/hPA92mW4O1xz5Bp1vC7dBg3Hvnli5ZXIJdMEp
 tJmavqhip+8YtFkFYIYa3M3aTnA427MdA29KNWz+miA1vEiCynIB+6Jx3k9w3hnDpQJw
 ErG68f9KdBmWVnqDrKLUSi7apWrLmygt7jtk9k+t6/JO+cnCscarIW0Uz2MlBPvZzDVX
 XyOnv+nY091LJHt/ZSspu5CPCS2C2+2M3HcLYuCtKZOiPIZbXyBuyQPyOPtRkRV+szih
 e2SFuIi5sjVWystd7BCqLy1CWn8YLIaZNCP7ri0f9N7ri7911tCq9BxozYXk2z30NCk1
 awJg==
X-Gm-Message-State: AOAM5338lhYmC/uOUn6mcx9LC9igzsE+wzS/a83NsBcn2INkqkgm8FvT
 KKKPTMHbAXRuhs3m2w8eSYE=
X-Google-Smtp-Source: ABdhPJzBX1h4p+8/h8rsfNFD7cFOY65U2w6cXqocFALaQLA8lV0n7ScJpvmaq04SDHCvCuYexmlhAA==
X-Received: by 2002:a9d:4d84:: with SMTP id u4mr8749017otk.136.1621609335861; 
 Fri, 21 May 2021 08:02:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 88sm1331650otb.7.2021.05.21.08.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:02:14 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [PATCH] drm/amd/amdkfd: Drop unnecessary NULL check after container_of
Date: Fri, 21 May 2021 08:02:12 -0700
Message-Id: <20210521150212.2076151-1-linux@roeck-us.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first parameter passed to container_of() is the pointer to the work
structure passed to the worker and never NULL. The NULL check on the
result of container_of() is therefore unnecessary and misleading.
Remove it.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 5b6c5669c03d..2f8d352e0069 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -110,8 +110,6 @@ static void kfd_sdma_activity_worker(struct work_struct *work)
 
 	workarea = container_of(work, struct kfd_sdma_activity_handler_workarea,
 				sdma_activity_work);
-	if (!workarea)
-		return;
 
 	pdd = workarea->pdd;
 	if (!pdd)
-- 
2.25.1

