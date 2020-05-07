Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137C1C93F9
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ECE6E9FF;
	Thu,  7 May 2020 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE3C6EA00
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v8so7726881wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fO39BiaY+jH42mVtxeWcXUjQbL5ZzwZ7fbLvQsQ6DKE=;
 b=aDQHrjv4DxFGXxpuqM2JJSkFBW33C64wWPSQDfzM12Pt3A1sEp810lBTFZj7mIAUGy
 GIwwu5jZPh76kIaS+ROF/SmebGWsPPJ2Pk03cZJxNFm17SFhphCYlAyOizTz9bZdtbHv
 DSVTzcrAcEeSUDIGRhNkKJ23GmHXm1tv7pDPl+kzrz3QDRptjhwlbiO1uxiijcy5ncE3
 4TM/h0f9KMmJc9KMAe69V3kXy0he+wBNtfQMv3wiz+jU6Y57XoYJja4vv2W33U4BE9or
 vOXxS0a72n8Nsm5HD/5cfcTaJs7UvWNIJg/Lql6RvI/hc0GCkm8tgEJoqVcocVs632cd
 xO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fO39BiaY+jH42mVtxeWcXUjQbL5ZzwZ7fbLvQsQ6DKE=;
 b=EvCWqB/FQpcqa4LJ5Ys9VvzTIqDTMLQ68gACGxUT+yWYbl6peihBnFSQ8RBrlBhXb8
 M4RvwYgHT4AxsI2tGTj2cRR26TEb6I7Nyt4lk2Axv96BJ1207Kt8iCBTWpVIgbvQ5/f6
 IaMMlbS2jVGQQFei25T/tlES+Wkq92RsmpPXatTPDRhxjybyAkS5+9SQSGEPqui9RAcm
 Ke/twMf0uummc7yR0kIC+tRVwcZc25qChR4YdFZBqm1sG8BBL211qst3Cr8BrhRM6HkM
 yyEjBtJZzPLQJLK7qJmFx5/eeQrSjjLLDmK7mJ8WpZfNJlkoQ15OX+xaSzRTPGWDKTSU
 kWQg==
X-Gm-Message-State: AGi0Pua3cuVISREDxGZgc58bYKoleP+SI0xLZCBzHvlnY+qLOqL0hjZb
 CoMzgIjgJiw/AySAErrxSK3ycRpr
X-Google-Smtp-Source: APiQypI+KYA90Kd4il88BtuTHX0R394DqoyUHIkNCCUmhjNQTrEELMTtZC1AOPqC3sTSP1AnLk9gSg==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr10575334wmd.67.1588864266727; 
 Thu, 07 May 2020 08:11:06 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:05 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/36] drm/gem: add drm_object_put helper
Date: Thu,  7 May 2020 16:07:57 +0100
Message-Id: <20200507150822.114464-12-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Add helper, which will allow us to transition the drivers one by one,
dropping the suffix.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 include/drm/drm_gem.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0f22f3320dcb..70c0059ee72b 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -364,18 +364,20 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_put_unlocked - drop a GEM buffer object reference
+ * drm_gem_object_put- drop a GEM buffer object reference
  * @obj: GEM buffer object
  *
  * This releases a reference to @obj. Callers must not hold the
  * &drm_device.struct_mutex lock when calling this function.
  */
 static inline void
-drm_gem_object_put_unlocked(struct drm_gem_object *obj)
+drm_gem_object_put(struct drm_gem_object *obj)
 {
 	kref_put(&obj->refcount, drm_gem_object_free);
 }
 
+#define drm_gem_object_put_unlocked drm_gem_object_put
+
 void drm_gem_object_put_locked(struct drm_gem_object *obj);
 
 int drm_gem_handle_create(struct drm_file *file_priv,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
