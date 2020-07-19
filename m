Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9DC225072
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 09:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D324A6E4C9;
	Sun, 19 Jul 2020 07:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31A86E4C9;
 Sun, 19 Jul 2020 07:31:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d1so7253124plr.8;
 Sun, 19 Jul 2020 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vPr8MNrHCYsTqyeKQ7sEP+a0CaHWVcwL6peMb/lruJU=;
 b=RrJhHXSCbXTYcwYXRBXoXmsCw+vVWXatf9/Z15DO6TlS1ABPftLW9FSbtbk0HWXYsg
 bgcLh9RwGn5NxUPytE6DXH1UJDKNp59IEMPvK8sFknN/nAWfGWv2mMUp6YByMorFN+lQ
 Y63mBozCLzcILsmhVxHmZr1+tkuwyxm1Te75fAjGq1HlLx9ntAevX5xBaf8LACuGcowa
 V5iM3es0KTlEBRvCYrRnzB8Aw+fe6GRTZ5e2DmJLeCqKnHbb+s1HOgh304I5LJMbs7wm
 m4UluKKMTap5dUTu9AaNeSbQBXxQ/NXdmU3dfSrkhOyZkzaeXmzgC85p11OHegXLChfj
 9mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vPr8MNrHCYsTqyeKQ7sEP+a0CaHWVcwL6peMb/lruJU=;
 b=N+xg1uj3mwtg+DbK8ssg080twMGiPUFYWy0A8su47fUBD991OjD1sK5zFeGjH2EYjY
 uTJHtRWYdGfzfJ6NrLb+WpPrfHiXg6G8BG5t+xxnlGwjshUVIzX13zwdfHFt0cLP5eJF
 pdoN5djFGk6kn74HQS2HQPdeueLPYh2ch/h8XXDOeYbYjdTvBc3daddUlU9RQIHEizD3
 Wn9ze5wu6pwl7JserR9rOPWwU0xQKGGbWwpLGqa1/VPzKMpZX1kgEp+uFuwy5Mo150zZ
 5IVCdXRjLbndqnhASk8NoSShPgSHsd/txk1QMq8ayxXvbYRV21anDv9LODMCUWrE9zix
 io0Q==
X-Gm-Message-State: AOAM530NgVXo+/Kw9wPcLZX+EwY4kciAnvelbxIWQV7bMAWtUGBgB22N
 fxjdlFnh419YEfus9yylLhO2PrM2rRf7RQ==
X-Google-Smtp-Source: ABdhPJyAmtl2idOUK1wJaAK1+FgpTeIi4n7bptmKbrUk1bg1/nkEUa7Rd/nen/0vnKG5Xw6VoYpiKQ==
X-Received: by 2002:a17:902:8498:: with SMTP id
 c24mr13823604plo.332.1595143918113; 
 Sun, 19 Jul 2020 00:31:58 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-52-221-254-146.ap-southeast-1.compute.amazonaws.com. [52.221.254.146])
 by smtp.gmail.com with ESMTPSA id a2sm12692988pfg.120.2020.07.19.00.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 00:31:57 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/lima: fix wait pp reset timeout
Date: Sun, 19 Jul 2020 15:30:50 +0800
Message-Id: <20200719073050.776962-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PP bcast is marked as doing async reset after job is done.
When resume after suspend, each PP is reset individually,
so no need to reset in PP bcast resume. But I forgot to
clear the PP bcast async reset mark so call into async wait
before job run and gets timeout.

Fixes: 3446d7e9883d ("drm/lima: add resume/suspend callback for each ip")
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index 33f01383409c..a5c95bed08c0 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -271,6 +271,8 @@ void lima_pp_fini(struct lima_ip *ip)
 
 int lima_pp_bcast_resume(struct lima_ip *ip)
 {
+	/* PP has been reset by individual PP resume */
+	ip->data.async_reset = false;
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
