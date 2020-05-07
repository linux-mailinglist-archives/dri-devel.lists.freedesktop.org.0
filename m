Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B051C941B
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7256EA1F;
	Thu,  7 May 2020 15:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0535B6EA1B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z6so7251850wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7g+gwrrm/GY+OI8wF0Z/1UngDqMIpVGFP/Zdnh5OQ5A=;
 b=QQ1ZdUk1pc76PVaR14fDTOOfy9sLnxTwgaDVoJC2pQtfZ/7bg1OJO3FpwqLXVEd3IT
 mTjlV6rsIVtEqCoaXHJmzHpV41qoFAQF3oP0yBW+RYQW28HraMqKR8ZsePRfvfam+k2k
 vozGzOTg3Ogy33pe43Rh/0atSPrr2NXqlmXJpRu6wuLXK2RjGjOliK2itaEwc5+su1Nk
 6gB5gwuutvIVJV1pjfHpOO/+dbLxzZEYyY6YmTHfPbtz56MUURwHbpvunmNbhFlLARub
 VjGTpshhOa18EYRVpwDruxz38Ae0d42tC+7fBpuQ9KoiwIyWCgJzvW3htyW0bV2KmO77
 ticg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7g+gwrrm/GY+OI8wF0Z/1UngDqMIpVGFP/Zdnh5OQ5A=;
 b=pIJaq5+fF+UJPQyPCivLYnDGLfcAr7w1bfQrf0fbXPNBvrxm1L48smuOc59BLyzJ+m
 YA1CXKFrcMINr1YKdQsHr5ErTWvsaTWEB6bBH0Guqz7yPApETjeNx6ApO7CSj7kWVoR2
 bzrYdn1ogaUwUr7p/fFVqUOeikb13mMrGGXG/I+9k4yssLgWxUR0MGok5Io3vs77EEYK
 cI1EI9rNHSfT7MH5i0rq2G09SDHD7L5Tmpj31KP05ykZsOfLggA8qOfbUAhRN94xXo0b
 gS+Eq3bS2sJTwqXkdJ27sO66DPKuf5Do1i7pGtk6F6MmZ8ZyhBX85EMKaFqRJKNwLyun
 rJCw==
X-Gm-Message-State: AGi0PuZA4fE0Bp/JRDkylY3Oe/+K6cHnS/AsGQeL6IsK0BmFYQ3NK9c4
 oCmXwRxkEdH3QY/DLZ+gumdKZrBh
X-Google-Smtp-Source: APiQypJVvXhvgGp6sbQK/EtsWIboDwMfbT4/vglErBGLqSXH9dbZoIv5/a2Go0RjHz/+A+2ulthmLQ==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr627339wmf.180.1588864298259; 
 Thu, 07 May 2020 08:11:38 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:37 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 34/36] drm/vkms: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:20 +0100
Message-Id: <20200507150822.114464-35-emil.l.velikov@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, emil.l.velikov@gmail.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index 2e01186fb943..dd348162fe5a 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -113,7 +113,7 @@ struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
 		return ERR_CAST(obj);
 
 	ret = drm_gem_handle_create(file, &obj->gem, handle);
-	drm_gem_object_put_unlocked(&obj->gem);
+	drm_gem_object_put(&obj->gem);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
