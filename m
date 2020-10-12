Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D864528ABB1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A1D6E21A;
	Mon, 12 Oct 2020 02:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0BF6E21A;
 Mon, 12 Oct 2020 02:09:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w21so12125346pfc.7;
 Sun, 11 Oct 2020 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lsQ9N+apQGOcHYXFGYjFIayjQSXunpwI7ZmJDjhbJNE=;
 b=JUgmYERxIKERmHzyVxJYNyCIKZCW4l6H9/iNSMbxyEj6wSVpDicXKDpGflFnL2TBaf
 cqLULbhM01JjAPrqcvuuxRpCs1qwPO/0FL+1lgWwcUAn39pXTOolxgBnccrv7mB+ttaq
 84tG+Hkx+WnjvDC+UHIvltYeG2zWffdK7lJ3CvDMGyFY9SKFXkcJ7vCoKxazGWoR5D8L
 KnzM7uSX8nnH22mrySu0Zf2aKaujqsnmCw9yimWnGESy3wwvQuYi8xJA40PqI1G4SNoB
 gVPbpHg+LyGsPA+rIQ5IrXrkvYcq1elmkbRst1dV6bWWeaiACWBfes2YF3AJp1daR8Fr
 3CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lsQ9N+apQGOcHYXFGYjFIayjQSXunpwI7ZmJDjhbJNE=;
 b=O3lPF7fTfEzRqKQ4xfqp7q5/5r2wUKDpKOaqR6yWw/mlTMkHCe4JAnsEO0Ztdw/Tda
 EMaJD6/yjpGE4Af+u6cZHvw1jJZuj60DctsshIpaWNaQl8P5LJhlZXzKF0BhxcJ+tp5N
 6ERWN27tRK1RqGov96u9nZ9FGri40EoxyqMvtE2/q8TL8j2QPZ8tLjjjnmMkN1iDgwhx
 ZxkmFNbYJ1cNAqVm0N164x3EEYDBDmUGyj7q2azAnK1z2g96GDgXV7qMnrvV+QDbenYA
 kUevuMqpckGeiMD/zHM5zbUcWX9sEd1Yx+Bk76cq8tS8REBhPp2LB96iTIxc+mXr2ZsE
 eYlg==
X-Gm-Message-State: AOAM530CpiNynpwHH5A/bvBFXrX62pDzBf87Dy5J7qwm7QoFVDHe2Isr
 w63gg55VsHeflHdFdFeAHq+ZST7nnACJtLOD
X-Google-Smtp-Source: ABdhPJzWL0w2g4Ew/5WKB5u0zWmvJb22AOeLQlFsz2hwOWA3PxPUbRr1+f7sEMnI2Tb4VxTDFsJJkA==
X-Received: by 2002:a17:90a:46c2:: with SMTP id
 x2mr17574218pjg.60.1602468546995; 
 Sun, 11 Oct 2020 19:09:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j25sm17648278pfn.212.2020.10.11.19.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/22] drm/msm: Use correct drm_gem_object_put() in fail
 case
Date: Sun, 11 Oct 2020 19:09:36 -0700
Message-Id: <20201012020958.229288-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We only want to use the _unlocked() variant in the unlocked case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 210bf5c9c2dd..833e3d3c6e8c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1120,7 +1120,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put(obj);
+	if (struct_mutex_locked) {
+		drm_gem_object_put_locked(obj);
+	} else {
+		drm_gem_object_put(obj);
+	}
 	return ERR_PTR(ret);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
