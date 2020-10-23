Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687182974EE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8E6F8E9;
	Fri, 23 Oct 2020 16:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE666F8E8;
 Fri, 23 Oct 2020 16:50:14 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id h7so1804172pfn.2;
 Fri, 23 Oct 2020 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5Lma5ixgLKqUWZE9zm+UsGyT5P2TCnzVnH8OP0YJLg=;
 b=nGWhOnAWdyKZ1mPvxWN1s86eaNOoGrxqk62ak4St0TLgzGl8Wa+qHX9Y9HQlFOsQR5
 vPLd660eG0FqLwXMxIbgjdNFHrW7mtekhjIZ/+46ZImvuZanHeaCV/V5nDV5j5Jwt9to
 F/Eq32YB0H0L7fjqVlO74u9b4DVONTnxPyfx1+KQtNn4BkpAn35IuhouKrk7ef0iHtXn
 IQIjYFGHJ9cAHjIJhUiG22orXiT3tBdVRPaAfTZ2ZZhvZAc3XqNDQl9abiIaAEwCZBJ8
 H+wmok9WObAfQf05zqHVKJE7XZh5sipFsdaxtwOT6+iDJmQ0IssuH1mlqeJO2Qotp6hK
 HekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5Lma5ixgLKqUWZE9zm+UsGyT5P2TCnzVnH8OP0YJLg=;
 b=LhxPzpXnxZjyWa3t8mw5dnpqWyJX635aybYUfRFbt0gzcPnY/KEjz3OekBCsw+FMGA
 /5B3y5DWhZgxrljXURC2cVyrcBm47mcPlZfFWU7jbBjySMx6n9xI6eJMjHasP0y0QWA5
 8c8IgbQc/J0h4n5Bencd4fOKAc2TDu0gZkYXW8lbABkzyFv4u+rDP9H+eDOkUqa07rUP
 64bMXqUYGeBUBG24IUPKOQvQArT/klWLnCIy+j7UrNat6ddFCmdrdndck48jkpiKuLDQ
 Wl5Seiy5lshSr4F77TfX9JBuJqEHTZY0VQckjzrZgOBJNnm20Y0Xnxwb7MtRGrBRsFih
 vFhw==
X-Gm-Message-State: AOAM532Fk0wg0tRQa6Tm/ZdplAYPUZSt8vbTpqpYEA1GBpl81mG6cY2Y
 xmJXehqtl1/E+pvYz5LrAhoPEqOlKKwCrw==
X-Google-Smtp-Source: ABdhPJybEnZDk7Gh/5Cx54oRWuF8wWJTQoFNA6UmDDJPZI5aZB58FyTs7JHRWSS69yYEyloelPzksg==
X-Received: by 2002:a17:90a:aa90:: with SMTP id
 l16mr3507633pjq.0.1603471813469; 
 Fri, 23 Oct 2020 09:50:13 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y65sm2610923pfy.57.2020.10.23.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 03/23] drm/msm/gem: Rename internal get_iova_locked helper
Date: Fri, 23 Oct 2020 09:51:04 -0700
Message-Id: <20201023165136.561680-4-robdclark@gmail.com>
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

We'll need to introduce a _locked() version of msm_gem_get_iova(), so we
need to make that name available.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index afef9c6b1a1c..dec89fe79025 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,7 +376,7 @@ put_iova(struct drm_gem_object *obj)
 	}
 }
 
-static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
+static int get_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
@@ -448,7 +448,7 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 
 	msm_gem_lock(obj);
 
-	ret = msm_gem_get_iova_locked(obj, aspace, &local,
+	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
 
 	if (!ret)
@@ -478,7 +478,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	int ret;
 
 	msm_gem_lock(obj);
-	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
+	ret = get_iova_locked(obj, aspace, iova, 0, U64_MAX);
 	msm_gem_unlock(obj);
 
 	return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
