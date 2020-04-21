Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8C1B281B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0801A6E967;
	Tue, 21 Apr 2020 13:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520BE6E966;
 Tue, 21 Apr 2020 13:37:27 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id a7so1364435pju.2;
 Tue, 21 Apr 2020 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qP9PaAXMpHklt4PkWxGJD535lg4vWx2Z2/78C5r9WSs=;
 b=iiPq7JBR5nlghNthIX2JMqRgHsey6EMc5QpzNUUodo6E/HIqA0EyGCv2zdlP6Wt91A
 H0UxPmFIz4gRYHSsqxgI2kojdzEIZUqxOBrsOv1bJZ9GjGV3OpHi7Q+DiH3T0vu7cqgg
 a+RmzfesTrIF6D5+yZg1s1iWO3nQM4VSd3FpJ2V2p7g4wFzEOHP/ZrNwzjNE3ACnUSVo
 czJ9T28/gg9Bg0LbbG/qIHelXy4rZjmFEK9/Es8m6ylFYFkx6Yc7sAN7mkQ0zSSmvqgC
 kOsyGtmmKEPaUWVGE7nd0vzCWmsRbsM+FCeGV98IJBi1fUOleJ+j0Q9H2OyB1yHK+bAn
 NTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qP9PaAXMpHklt4PkWxGJD535lg4vWx2Z2/78C5r9WSs=;
 b=lhj9z8sTD7IOop9yOgFVht5Nz4xDF6l1oavL37haoOTrJv5XHiYmVTreGKkpJaDEqc
 EY9siAjUOjHc0aZtc82kFDax7uhAHSv8mQew921QyUftbA5VtqhuFriIJo91LcCZ4yCs
 BE2dBGqpkMJ41OHrB0bGREUIFPPRNB5GTps0H19OAVKCIzVHhwx96OLKozZ5EQk9jJ8n
 oLpzlQVbB14XVF6wXM+9bej2i7cTEiGX3XU+fPbwto9qPyCT++B5V76H1Gp0Zs/Wom6N
 PUIUQZAidLa2n/P/gW80xDVUFNmqcAkdp3gZhmicxw2SSeoZF2pn8yeKYXRWsE4D5dOy
 Fwsw==
X-Gm-Message-State: AGi0PuZebfirDwQwuqv3xatzJ6fOlESpUBH2/EuJ3IJsAw0XQITzwKCc
 nISpvjcsXWULU27cfzDQyzcfQyYhw1R55Q==
X-Google-Smtp-Source: APiQypKJzjLUQjUWOYbZ1OTpv3REQo5mHSAaDj80qiYMf5vEkHCQJumN1gL764n7vfAICcbmjAa5ig==
X-Received: by 2002:a17:90a:280c:: with SMTP id
 e12mr5595582pjd.52.1587476246693; 
 Tue, 21 Apr 2020 06:37:26 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:26 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/10] drm/lima: print process name and pid when task error
Date: Tue, 21 Apr 2020 21:35:43 +0800
Message-Id: <20200421133551.31481-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When error task list is full, print the process info where
the error task come from for debug usage.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index a2db1c937424..387f9439450a 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -285,7 +285,8 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 	mutex_lock(&dev->error_task_list_lock);
 
 	if (dev->dump.num_tasks >= lima_max_error_tasks) {
-		dev_info(dev->dev, "fail to save task state: error task list is full\n");
+		dev_info(dev->dev, "fail to save task state from %s pid %d: "
+			 "error task list is full\n", ctx->pname, ctx->pid);
 		goto out;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
