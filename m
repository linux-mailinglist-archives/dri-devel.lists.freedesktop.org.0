Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840946B6B40
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611CD10E287;
	Sun, 12 Mar 2023 20:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8810E2BF
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 20:42:42 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id l1so10055573pjt.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETBxoAbrNslCbg8f3yN7x2XxTKk/U7inb50D/YGBCKI=;
 b=UL0wiKz4KiPifc9v8jO42gd8BNURYM9h75Sx3INvyxosx9LLnhXPjEeuTBxFMBUJXY
 /mlcX0mfa9BHN9Awv2tKzMxLHZxdv/XEl6HlzOaI/j6pYf70+TlqXXIqtuc1d1AVL3U+
 A01lKDJ+vHG1B/IM0KlAjDVAu+uAx6VvAlph41qDmDWuhU5CkZ38fbkoIwCSGweyvB87
 4EgbnHSjNzCKQC9FZcyv/ECJM1qziprUth8q0QNI5XrYVUqmJ14uAGTpnEa5ATzR9mKR
 Z6UB5r+xA5SEO3RcXAYHTEm9Y+/5O8GAF2Jg1u/kkaH/vPLZ8dZP6lvgYxMWGLisN9Yl
 iIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETBxoAbrNslCbg8f3yN7x2XxTKk/U7inb50D/YGBCKI=;
 b=MP5Q7ogwR8CcVuB5TaXkLOZZkmZW7oFb/8fsdXrfVXuPajgjilNEb/TTqUSWdjsHi1
 j6Gh8kqaQzl5MiITmHupSLCQdhGSBUVdMyNp/8yn0Y3pdR7g11kg2Et6Epa6sPcY1Z9L
 G81r5ltFuunTN+8o3DJ2dvLuUkaX1s98kGZOdOIKb0mdP957Zjzr7z8wLUHEMFD4MvrR
 Pjz7fqCaMIK3cajPpw81+KS6AaDYckPNvOVn1Dr2DiS3SoMKmww122C/fL3NOh+CgFg6
 sLdmzgBvq7vG1NyvKPaPYzOlrZdW17dsrYrsxoportFwvbCyT+YDQ7jO/ucSSxknlxEr
 Nwww==
X-Gm-Message-State: AO0yUKWdsKvHyCrJUKEO8t5Fva8xlbRuvbkP5AXjQUQSgLp6dJOmMU/H
 QlXeJQ8FuW9YhZe06rvp8jUzZxLP7+g=
X-Google-Smtp-Source: AK7set+rXLhKPDCm8P7o+cVlVPeEg/Xp4bPKsrPllcqxjFJybvnW61FVqm65akYCijFEv5MoEag7uA==
X-Received: by 2002:a17:902:dac8:b0:19a:a650:ac55 with SMTP id
 q8-20020a170902dac800b0019aa650ac55mr7163529plx.23.1678653761364; 
 Sun, 12 Mar 2023 13:42:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 kl4-20020a170903074400b00189f2fdbdd0sm3205355plb.234.2023.03.12.13.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/13] PM / devfreq: Teach lockdep about locking order
Date: Sun, 12 Mar 2023 13:41:35 -0700
Message-Id: <20230312204150.1353517-8-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will make it easier to catch places doing allocations that can
trigger reclaim under devfreq->lock.

Because devfreq->lock is held over various devfreq_dev_profile
callbacks, there might be some fallout if those callbacks do allocations
that can trigger reclaim, but I've looked through the various callback
implementations and don't see anything obvious.  If it does trigger any
lockdep splats, those should be fixed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/devfreq/devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 11b774048bd2..5ce3bf9b59e7 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -817,6 +817,12 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	}
 
 	mutex_init(&devfreq->lock);
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&devfreq->lock);
+	fs_reclaim_release(GFP_KERNEL);
+
 	devfreq->dev.parent = dev;
 	devfreq->dev.class = devfreq_class;
 	devfreq->dev.release = devfreq_dev_release;
-- 
2.39.2

