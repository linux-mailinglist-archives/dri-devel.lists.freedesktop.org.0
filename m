Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E0507D46
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 01:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C7D10E387;
	Tue, 19 Apr 2022 23:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A973E10E3A2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 23:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650411882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYGafAneoUZHzEpI/8/bT8Grd+Q/phBRFprX8SG/5bY=;
 b=AgX/fA3hQx2r/OAzszun1nmWMHUFqOz8LEm8ZLk55wwWolvuFDyorJ7h0LU90e0vHYUraN
 Af99t5RsmcC+B8LVYX1tycpVAkIUSFr6xcOLV5YuD0lK7alIaIIHt74Lcqt+DeSEujJeJP
 a0TA7RQhzjgks678Fe0CcNhr2JFQPa0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-YU28tluxOp6Nob857vAh1Q-1; Tue, 19 Apr 2022 19:44:39 -0400
X-MC-Unique: YU28tluxOp6Nob857vAh1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso2055915wma.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oYGafAneoUZHzEpI/8/bT8Grd+Q/phBRFprX8SG/5bY=;
 b=WMtRtrLFv6AC863upqJrL9ouBere3rGcNt2pEXd4SuQSCPZV2UWopCRnnS/bUVlr8z
 sZupSlyNNi6Ll9P1DYnb+4QyRfjI6JIVU50lYJ7/ru05OiYFjwZxL6GlCtVLyFbYOIcY
 jjfOdccWyL9LR4I27V8yzMnPtfAfbS8drzt0rgbHEkTReJiHa5H7ucu5NY9FiEViha/Z
 egy1U4gY5bn+V0cXIvkS1/ydFs2jfv52jhZasGRdW25cwYftA8vT+Ye20DY1oSXsVRjz
 ekIpxq46Sqai0QFEGPOXHHPUBJiv4nj9nYXp6BEvNMyddrO5sXP5n3BgVOKzweeYKArF
 c+zw==
X-Gm-Message-State: AOAM530iXQuwt1Hbu3JXNY4LRGAiOXhNQ+nbH6l4ur5C99J1ojj6FlQg
 ADIQw1ru433+czoRKLdAOZFZkrBZ8VsjIeP5tM959H3sacjVm34jS83aSGF4fwP6dDZOTTN2Tyd
 tIHj/tJe6/SFz7ic07QdUSclakGbX
X-Received: by 2002:adf:e301:0:b0:205:db69:6dba with SMTP id
 b1-20020adfe301000000b00205db696dbamr13903209wrj.605.1650411878584; 
 Tue, 19 Apr 2022 16:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd21waJxZOqKa793oN0FwdeBAnzWxA1Koh+HqrwD58qJEbPViWBCVhaKh7RSE4dFJnB0AKtQ==
X-Received: by 2002:adf:e301:0:b0:205:db69:6dba with SMTP id
 b1-20020adfe301000000b00205db696dbamr13903193wrj.605.1650411878317; 
 Tue, 19 Apr 2022 16:44:38 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm16560045wma.21.2022.04.19.16.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 16:44:37 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Fix race in __i915_vma_remove_closed
Date: Wed, 20 Apr 2022 01:44:36 +0200
Message-Id: <20220419234436.2638649-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_vma_reopen checked if the vma is closed before without taking the
lock. So multiple threads could attempt removing the vma.

Instead the lock needs to be taken before actually checking.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5732
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 162e8d83691b..bb3b6e4bee8b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1615,17 +1615,17 @@ void i915_vma_close(struct i915_vma *vma)
 
 static void __i915_vma_remove_closed(struct i915_vma *vma)
 {
-	struct intel_gt *gt = vma->vm->gt;
-
-	spin_lock_irq(&gt->closed_lock);
 	list_del_init(&vma->closed_link);
-	spin_unlock_irq(&gt->closed_lock);
 }
 
 void i915_vma_reopen(struct i915_vma *vma)
 {
+	struct intel_gt *gt = vma->vm->gt;
+
+	spin_lock_irq(&gt->closed_lock);
 	if (i915_vma_is_closed(vma))
 		__i915_vma_remove_closed(vma);
+	spin_unlock_irq(&gt->closed_lock);
 }
 
 static void force_unbind(struct i915_vma *vma)
@@ -1651,7 +1651,11 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
 
 	spin_unlock(&obj->vma.lock);
 
+	struct intel_gt *gt = vma->vm->gt;
+
+	spin_lock_irq(&gt->closed_lock);
 	__i915_vma_remove_closed(vma);
+	spin_unlock_irq(&gt->closed_lock);
 
 	if (vm_ddestroy)
 		i915_vm_resv_put(vma->vm);
-- 
2.35.1

