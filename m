Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3771D49F6
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343F16E132;
	Fri, 15 May 2020 09:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4076E132
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k13so687750wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGjkB69rZt1YfL3vw1rxVZRUy8g5GzWLcHW/iygcNUU=;
 b=KoRo6X1g0gYhKEjc+XGV+oDRuAv9mav7cq3ZNp28nNAG3lrqqhiI7CFBreeyVHO1RC
 CCxZLS0BtKzTgu6M9yoK8MXFZ+Ipw3SjJlIwrRz9aWys2ZOQ8BGrXXR8+afb2yFuvECB
 s0DLQKJlK6dgcq98G1PbMbbdqEfyN2UO9vU1XXyPi9lXxCCO64kmsnr5mRoflefJz/Ce
 54EgU/PQHeZr4bquFUbFBYJBShoF9Y6EEODn90cn8zQbgqONQxBauz82kK1eMtTdVn2I
 NhVdaSXYpl02ZVbC5W62dN1iPQxegzDkf3mA+hrH299i9pRKQaxroQpRArPZT1t1mopz
 u9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGjkB69rZt1YfL3vw1rxVZRUy8g5GzWLcHW/iygcNUU=;
 b=rDJoXSqSFY99CjcLc7e2i9Ew/PWon74zJwIlh0P8fQ5wgJb2lIwDRuA8IX/zOzmltu
 p0RClkzOHnrarxkSLK2PH0a6b2AmhX95NGwVH+5CSqXy/smaG1cYQX44ibTOJR6pYFd1
 FoZwzk/sftEi6AGMu2xi8TcyFbWYvSIUJSoNWcc21un+1uP8+a1Z16czfsVbZWTV3zcb
 RyqkMTbN7+5cN1SHNLPChh5oow+qRhj9C3FNuAWF4EYmytIzRsumAZ+FoGAFLRhNuKzw
 nLmKRvP1Hhz6CSbd4rhrszbCmp1ivbfuFuAOeEdkvlH7gtx/fu1buJXRarP1/diP+JX9
 rV6g==
X-Gm-Message-State: AOAM532kfFAHc3OlTgz90jmbUQnp9axWK0BTIRQPH6z6Hey+G0aVwQ3K
 s+ByVtRgrGxH4r/tYKJ0/m7buRbn
X-Google-Smtp-Source: ABdhPJxYBYbA0DrwHn1auYonTEHUpiFpuMuBeJF70AMiYaLFUNy/CTCgoIul23D9U3XvDGYc5XfDJA==
X-Received: by 2002:adf:f38b:: with SMTP id m11mr3292145wro.65.1589536443894; 
 Fri, 15 May 2020 02:54:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:03 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/38] drm/gem: use _unlocked reference in
 drm_gem_objects_lookup docs
Date: Fri, 15 May 2020 10:50:42 +0100
Message-Id: <20200515095118.2743122-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Use the drm_gem_object_put_unlocked in the documentation for
drm_gem_objects_lookup. The locked version of the helper should be used
solely by people who know exactly what they are doing.

Should prevent issues like ones adddressed with the next patch.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e13023..918d1ba25f63 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -690,7 +690,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
  * Returns:
  *
  * @objs filled in with GEM object pointers. Returned GEM objects need to be
- * released with drm_gem_object_put(). -ENOENT is returned on a lookup
+ * released with drm_gem_object_put_unlocked(). -ENOENT is returned on a lookup
  * failure. 0 is returned on success.
  *
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
