Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4A496761
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAFF10E452;
	Fri, 21 Jan 2022 21:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7848A10E460
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:08 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id 2so19268296uax.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=deg9y5rzsQq1zGdONQcrCVWlXk/79YlHYoxZ94gLNquv9QkSbVxPvYhtnnly2KYqLb
 4lX8gVmI4EhDItyn7dxRiwzxoYtSHBMKWQUSrrKPDN5WuP0R7ZakBRGw3pWAoBiPvmM2
 XBgihfmVo1fgOAtNuNF4D3IeEY+CJUubQ057cbEA/mAMJcilDrGKkkchgqe0EdGzUvUb
 kBOVp5ELRdNni6ky7EiryHPFpOm9s21r6y8Gya0ANLnZOILTEl1Oso5vjU4C9pJG5hr4
 PWXSprfvFdckdCH478X0/aWYVHr8B273MlVss+hwFJMQ+a/zsdj8bqnYV1nnTgCAO0PJ
 Bcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=pQrtoajmHl67kHyZ22LEwTMfKt7Wok+stlM8N2MVKIoo3AwkQIm9KDetsIjtpP0o18
 kb3beJ5/VaGKPh1hWD4tMz/LbdbSobUG7KxGSXkHAfNsuZNLGAy/cs4vkOleDYPCUtWS
 +L6LgRm6yxe4NForUF5I8DLaev23bjfJsjDhvtKVu2tq1xJ9lQ/PrTJNLax75guw5YtY
 QlxWEAahP2iMMIIEFubmtiH/r236LNnbDUo9C+N+fZQSNX/qEjMlLnPMgu4fbGtAL2hn
 dwUqZ2h4Kxd6Q7I15bjR3w7ofIz3hmp0Z42U2qQa3gFeKZjrhQcZ/cxs3D0zSc3njN/l
 Cccw==
X-Gm-Message-State: AOAM532lgqWd4P35oM+xhploHHHskAOdyaOr2nLXMKZVZhYJiogcnZDO
 vIsu6V7o1wdTQcDHXB7jyEM=
X-Google-Smtp-Source: ABdhPJxHqsXNkD3+xQXa96KXQwx8jqsG6/zY9cSkNluo9jIEynctBI7C+V+KwCMxoFQ/pEUQUTGkoA==
X-Received: by 2002:a05:6102:3566:: with SMTP id
 bh6mr2381538vsb.11.1642801147629; 
 Fri, 21 Jan 2022 13:39:07 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:07 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 2/9] drm: vkms: Alloc the compose frame using vzalloc
Date: Fri, 21 Jan 2022 18:38:24 -0300
Message-Id: <20220121213831.47229-3-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the memory to the composition frame is being allocated using
the kzmalloc. This comes with the limitation of maximum size of one
page size(which in the x86_64 is 4Kb and 4MB for default and hugepage
respectively).

Somes test of igt (e.g. kms_plane@pixel-format) uses more than 4MB when
testing some pixel formats like ARGB16161616.

This problem is addessed by allocating the memory using kvzalloc that
circunvents this limitation.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..82f79e508f81 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -180,7 +180,7 @@ static int compose_active_planes(void **vaddr_out,
 	int i;
 
 	if (!*vaddr_out) {
-		*vaddr_out = kzalloc(gem_obj->size, GFP_KERNEL);
+		*vaddr_out = kvzalloc(gem_obj->size, GFP_KERNEL);
 		if (!*vaddr_out) {
 			DRM_ERROR("Cannot allocate memory for output frame.");
 			return -ENOMEM;
@@ -263,7 +263,7 @@ void vkms_composer_worker(struct work_struct *work)
 				    crtc_state);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
+			kvfree(vaddr_out);
 		return;
 	}
 
@@ -275,7 +275,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
 	} else {
-		kfree(vaddr_out);
+		kvfree(vaddr_out);
 	}
 
 	/*
-- 
2.30.2

