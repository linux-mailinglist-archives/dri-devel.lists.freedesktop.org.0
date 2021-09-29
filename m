Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F741CF95
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 01:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B676EAE2;
	Wed, 29 Sep 2021 23:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891796EAE2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 23:00:21 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 p20-20020a25d814000000b005b6a75a370cso5501186ybg.14
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 16:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=2C1roWzg0g1t9SJdsvhWjF7EJsfvlHyd4vOPAZE7CoI=;
 b=O+MmupE8fI7/r7LR80gJgtKAawE3aHAvqlPZjba4TXr+3/ROlzQqWpdYQjufuNIvwa
 CLrNA9c1X5+VvlGFyQWbz4gv7VMOLu7sUUu9/TWhTaQVor/CADKhgOAPA5WzOmAStNxR
 sAtcVixKl9hMqHGfHOIb53dh1FHQDqfc0wEi8eKKMkhtAGQmefOH/406zex1NU7eqoH7
 A4IU33wFhKluEKvhrztURWDQrddSjKDAgMr+x6HANgOc+C9Y+Bzp8rueUIRKfDi6Sd6C
 QlIKfLcD36ZADHFLjtqc2E9gdKi/U72kIsvdLbAxkftbPkIBwfMYBUP7wPjFXDU62l+g
 X2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=2C1roWzg0g1t9SJdsvhWjF7EJsfvlHyd4vOPAZE7CoI=;
 b=hIu3hYlsTNdYKDat6n9TiTmUxV4oVxJlCIdrhABxreKiNhOWYdLec+u50foQNsa14W
 ZJn0DlwtEahK01UzAaK4qBnxuUhFo4c04xVXirVyQMrgVMPgQiALm6P8tCGq0l0I8/4N
 nwZvmykuMjSyQUqvWHT8ETyewSi4UQRxVjVyfv5hkKzfrwXBQaqy13n0ir8+zVpsXz14
 NLfRodsWlKQ0cKagE876HCpvPdVAavW9LrmVwckJkH8HGIvnWlVd+FcJfuTq8lqqwY8h
 f1CW3NyDXxFVpNy4/YMd/4IGZAQrRVEEDafa8kzKJEbMcfDz1Sy0kpJaet3mfGX3oHO4
 AfAA==
X-Gm-Message-State: AOAM532KE3cvdAJ53MG53M/CMRv4UCwGjQeWVROkEZuYE2Xek//y9iBp
 Dz603zxv34L7TT+9Jmad6SQnVfeY9EBzzspXRwqYuZgb9su114wI1T6cQ9K2ZRCr9fZ22+ghuND
 N5q2RTWbvKqiwKFyCr4DPcyXrmC9eX+QAodxLFCc5tYGit48FO5DolP0mm1Hh4lNgCDjqFlcV3J
 eB
X-Google-Smtp-Source: ABdhPJzTf7z7tCB+PBeS7fuuzlbUSbpG8y8sOo1ZnIfLkNOe6rmfKSrRzOSOhMmGbx7AL/RMDXwLF+1q/idI
X-Received: from nandos.syd.corp.google.com
 ([2401:fa00:9:14:8a84:22eb:d7a2:bdba])
 (user=amistry job=sendgmr) by 2002:a25:7452:: with SMTP id
 p79mr2737243ybc.513.1632956420637; Wed, 29 Sep 2021 16:00:20 -0700 (PDT)
Date: Thu, 30 Sep 2021 09:00:07 +1000
Message-Id: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH] drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap
From: Anand K Mistry <amistry@google.com>
To: dri-devel@lists.freedesktop.org
Cc: nartemiev@google.com, Anand K Mistry <amistry@google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

drm_gem_ttm_mmap() drops a reference to the gem object on success. If
the gem object's refcount == 1 on entry to drm_gem_prime_mmap(), that
drop will free the gem object, and the subsequent drm_gem_object_get()
will be a UAF. Fix by grabbing a reference before calling the mmap
helper.

This issue was forseen when the reference dropping was adding in
commit 9786b65bc61ac ("drm/ttm: fix mmap refcounting"):
  "For that to work properly the drm_gem_object_get() call in
  drm_gem_ttm_mmap() must be moved so it happens before calling
  obj->funcs->mmap(), otherwise the gem refcount would go down
  to zero."

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 drivers/gpu/drm/drm_prime.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..e1854fd24bb0 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -719,11 +719,13 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	if (obj->funcs && obj->funcs->mmap) {
 		vma->vm_ops = obj->funcs->vm_ops;
 
+		drm_gem_object_get(obj);
 		ret = obj->funcs->mmap(obj, vma);
-		if (ret)
+		if (ret) {
+			drm_gem_object_put(obj);
 			return ret;
+		}
 		vma->vm_private_data = obj;
-		drm_gem_object_get(obj);
 		return 0;
 	}
 
-- 
2.33.0.800.g4c38ced690-goog

