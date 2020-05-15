Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E0A1D4A06
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DCF6EC45;
	Fri, 15 May 2020 09:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8EF6EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so2838681wrt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfFvPJ7pXwtA5cPhABg9tYPk+MM7W9vY3Izm7D3H0WI=;
 b=qMwWTnNzfjHCRddFCdsruIr22+A1m/WvQf2ogdZPkyf28tUVwxZ1jn4NtOe3KKNg0Q
 c+ESnrUmWIM5wmizdyW54uMQNjMIvZReHFVNPDhFDfmeXwVooJcDvsX5qHYAgjbLiCBK
 CLSImvi5P+HpOrCFxdVSK/pkThFqgtHDg8A4Z2xAym07b7OPuqNbjULze77VooLyxaqP
 860KtnN3/9s57irCs5+FV5yPDVRVicKjps1FWznYLs/FtWIHs+Im4Ce2gvAtu68x4/nQ
 kEHEubYkVjolcAtXlo6b4uCPjSg0geLL2k139/Pd2iMFhDmM9j730qoQfjmc48GeCNAS
 E7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfFvPJ7pXwtA5cPhABg9tYPk+MM7W9vY3Izm7D3H0WI=;
 b=J2mKgBPbdCAt4D5cHrIgC3hPreQ+2IW+Zl186KuzlRdN59o249Np6ERLUcpwFm+OiZ
 9kDeHYTNWtWx07LWbVTP9Uzcc3PhJo4npacY6wg1psz7EXKJ4lGGRKBC9flwUT6oPrO1
 g5yf44zdE14UfRvkZiV8YvuY3HzyQ5BoSp74OAs0pkxDKnrRbZgG2KwYdSZGSdZLIqtB
 F0HGSqLaY0huPEtcWUQol1oPSyJq15kKZc4FNJ+rxaHQICevl6nkk0Dh1EdWHUfAmhoU
 58AWqvWzv77B+Wq9IYpANdB2JARwvCU3N7FgwI4+DOM377C7KxxJgpq9MCJvLXy2+F9G
 IrTA==
X-Gm-Message-State: AOAM533TKQhf/dWbxUNgF0v6ja+kftifLeSyDNSwn0Mhl52cD3+qa3ah
 ig364ReKaw40jgv7BXzO6bc4/9qJ
X-Google-Smtp-Source: ABdhPJwvtkL4Ia3DWhFVW+83cWSr2A58IH+9Mo/cZvuYyWvB5hJwdYTj+s7l6+Rd6If2s6PpCYchsg==
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr3333808wrw.314.1589536454699; 
 Fri, 15 May 2020 02:54:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:14 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/38] drm/gem: add drm_object_put helper
Date: Fri, 15 May 2020 10:50:52 +0100
Message-Id: <20200515095118.2743122-13-emil.l.velikov@gmail.com>
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

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Add helper, which will allow us to transition the drivers one by one,
dropping the suffix.

v2: add missing space after function name (Jani)

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
---
 include/drm/drm_gem.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index a231a2b3f5ac..2f7b86c0649c 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -364,17 +364,19 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_put_unlocked - drop a GEM buffer object reference
+ * drm_gem_object_put - drop a GEM buffer object reference
  * @obj: GEM buffer object
  *
  * This releases a reference to @obj.
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
