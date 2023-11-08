Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027107E4EDB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 03:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79110E6F5;
	Wed,  8 Nov 2023 02:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD30C10E365
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 02:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699410442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B3DL0Vft98Gq2vq6RutJxBknUxdBNOODfG1hAxtLDfY=;
 b=hX6oOIyIsFmH6kbrVmw0W/8BnywMc8EYmX5bqxwhYCWuYUBRx16KPPoZyx026vbq1ztJAa
 i2uhClM6UOYAkDOJju/eTEVPLQ5NHnxG6Wd0PIGeAzixW0Mh+Yp+YGgIyAw7PQ4DzoF/Ia
 rti+LlIHCDi1Q+GvjqkyQK4RnbSXn00=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-gcpFvI5dNLKtHtaXeOeJLA-1; Tue, 07 Nov 2023 21:27:21 -0500
X-MC-Unique: gcpFvI5dNLKtHtaXeOeJLA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-53df4385dccso5053578a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 18:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699410440; x=1700015240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B3DL0Vft98Gq2vq6RutJxBknUxdBNOODfG1hAxtLDfY=;
 b=nwxewtKx3cYuc+M2fKHUFJ5LiRpoSQcTKjJZ1kCaz4QPlQUpuyMZRbOZF1N+3MumdG
 wMOQQ55jbuRf0sL2kTBH2ECw6eQ5xuAFEBhRWbv7ftruIPvX5F184WILizafQyyEhWmL
 JE1vU2Wm7z/nxbSZoU1j00tS+OpaY93RYNheIo+HWwdBWg5IgeqoBVK/wYSZFDRT8XWY
 uAZVf7qZbIQs6jlxN3wMjIedDrzPSryleD6Tf63RGHKjMeBFMAwU7yoH4t4dnCsnTLSG
 ruIT1GKgJAEJNJOmoJXPRTDOBHDJCgXWIQozB3SGGG6E+JYso6IPJ9ZpEKS3eeOq8YnK
 jyLA==
X-Gm-Message-State: AOJu0YwsTV4deKHLS4UgHYS19/bEBAqZ4grZ5gUUbIFDmdTbs7knTxN/
 qb9lrCoO0QSBMCd/wahG7GhcZ9HC9d2QD4JcoQckI0oZ8dyfTWKDX4e5sbQMyoqMeLhxbErggO4
 Am5WJH/704hjtYq16qbGH5+uBnl1D
X-Received: by 2002:a50:d555:0:b0:540:b0ec:bcd5 with SMTP id
 f21-20020a50d555000000b00540b0ecbcd5mr357604edj.15.1699410440222; 
 Tue, 07 Nov 2023 18:27:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Cp1VyYPjw3gjL38WhjvNs3AyxxiTpwYPuWjALttn8dwms8ZMyFDJwb9VJPRjdtsqUpNKCw==
X-Received: by 2002:a50:d555:0:b0:540:b0ec:bcd5 with SMTP id
 f21-20020a50d555000000b00540b0ecbcd5mr357590edj.15.1699410439971; 
 Tue, 07 Nov 2023 18:27:19 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a50ef06000000b00543525d9fddsm5922217eds.21.2023.11.07.18.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 18:27:19 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 luben.tuikov@amd.com
Subject: [PATCH] drm/sched: fix potential page fault in drm_sched_job_init()
Date: Wed,  8 Nov 2023 03:26:07 +0100
Message-ID: <20231108022716.15250-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable
number of run-queues") introduces drm_err() in drm_sched_job_init(), in
order to indicate that the given entity has no runq, however at this
time job->sched is not yet set, likely to be NULL initialized, and hence
shouldn't be used.

Replace the corresponding drm_err() call with pr_err() to avoid a
potential page fault.

While at it, extend the documentation of drm_sched_job_init() to
indicate that job->sched is not a valid pointer until
drm_sched_job_arm() has been called.

Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 27843e37d9b7..dd28389f0ddd 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * This function returns -ENOENT in this case (which probably should be -EIO as
  * a more meanigful return value).
  *
+ * Note that job->sched is not a valid pointer until drm_sched_job_arm() has
+ * been called.
+ *
  * Returns 0 for success, negative error code otherwise.
  */
 int drm_sched_job_init(struct drm_sched_job *job,
@@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		 * or worse--a blank screen--leave a trail in the
 		 * logs, so this can be debugged easier.
 		 */
-		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
+		pr_err("%s: entity has no rq!\n", __func__);
 		return -ENOENT;
 	}
 

base-commit: c015fb6d01adb616fb54824feb55ce5ab18e8ca1
-- 
2.41.0

