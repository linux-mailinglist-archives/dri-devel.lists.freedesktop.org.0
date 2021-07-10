Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F23C36EA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 23:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9686EB63;
	Sat, 10 Jul 2021 21:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343816EB60
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 21:26:38 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 w8-20020a0568304108b02904b3da3d49e5so9684435ott.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=45bOLRN9YVIYbe76ALv944ijiFpGvJt/dysEPQc6ByA=;
 b=g3DS5pa1hQYtZkOWfeq639THCis7EEdUnBQVeeXDfZcVzwQj+xcbS5Brc2lv51oVKe
 jDhTug5Crq7+AKyYQGhznRCmYsXjC1DuDcB2GuZaOC90YmY9dSWAVkcyvePnKfKV8+j6
 tky41jZ05u/JeBWQ1CgMYESijB5PNTJanNK/bZgy6kf47mWKLKURYXEB7AjIRFaPfrDk
 d/Sdx834pN0dIzuFQEYHOhgyJGvMYlz4u/N4y6F6/UJkFPJtg6YswhysvUYeLbVBQcPp
 IIjIokA/C8dLMKWzmRreb78z0tCGGR8ddJ0Ax1XkgbSmSD0z9mYg6AC9Kd8rTeA9gumx
 Indw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=45bOLRN9YVIYbe76ALv944ijiFpGvJt/dysEPQc6ByA=;
 b=Oz4+tK5W1FbsNna8C3Yq7ka//bL3lS8XYeDXbCgiJm+3qCPhIvLBC5hnUP9iXYJUMJ
 ldYYtu42qsUNOI+y6FKQsgFdUCRpSNJEBtoA9d5lLyEHJfGedetj0z70GKOk7IHiDuLp
 X8gJPpOZYGqPeNcfJ1NGaBbljfNtpzXJgzwE1COHVLZsqISLcytB2K4TKQFgkcSAMHdQ
 s1eHy8Bbpqlngs6iRsep0WDNG1JaZuMsQdfbcsjdq4dBnhtWhiVSnRx9CkWxx0CDx5ja
 MYj7ffWFt6ro6YdZ1S4SeqVoaPsBsfK5nE/qdK0NSyb2I/ZQ7aL/oaXh0PRJq3mWGopE
 JzKw==
X-Gm-Message-State: AOAM532q8S4aeU6FI99G9fQQKbaRj9f6/0Mtu6pA1ueJ4mcoKrnNRkJD
 ig5djWyvH1vkpnniMQ+yMBPy9Q==
X-Google-Smtp-Source: ABdhPJztfVpTBy/bcYNpoOkjUnp5O7VxAGEtG3kJSvBXlZixomUuuvujcd0UmolvtbKpRuUULqzGAQ==
X-Received: by 2002:a05:6830:1598:: with SMTP id
 i24mr15675001otr.155.1625952397474; 
 Sat, 10 Jul 2021 14:26:37 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id u18sm972797ooq.36.2021.07.10.14.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 14:26:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Don't allow setting I915_CONTEXT_PARAM_VM twice
Date: Sat, 10 Jul 2021 16:24:46 -0500
Message-Id: <20210710212447.785288-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710212447.785288-1-jason@jlekstrand.net>
References: <20210710212447.785288-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allowing setting it multiple times brings no real utility to the API, no
userspace relies on it, and it does make i915 a tiny bit more
complicated.  Let's disallow it for now unless someone comes up with a
compelling reason to support it.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7d6f52d8a8012..5853737cc79f3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -319,7 +319,6 @@ static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
 			    const struct drm_i915_gem_context_param *args)
 {
 	struct drm_i915_private *i915 = fpriv->dev_priv;
-	struct i915_address_space *vm;
 
 	if (args->size)
 		return -EINVAL;
@@ -327,17 +326,16 @@ static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
 	if (!HAS_FULL_PPGTT(i915))
 		return -ENODEV;
 
+	if (pc->vm)
+		return -EINVAL;
+
 	if (upper_32_bits(args->value))
 		return -ENOENT;
 
-	vm = i915_gem_vm_lookup(fpriv, args->value);
-	if (!vm)
+	pc->vm = i915_gem_vm_lookup(fpriv, args->value);
+	if (!pc->vm)
 		return -ENOENT;
 
-	if (pc->vm)
-		i915_vm_put(pc->vm);
-	pc->vm = vm;
-
 	return 0;
 }
 
-- 
2.31.1

