Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2769456397A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6282618AD7C;
	Fri,  1 Jul 2022 19:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFAE18AD84
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656702162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YteOKhi7iNsOx5ZA+OArdj5sj8Ut6l24ccYKF/bIe0s=;
 b=VXx/USzMKZIntZtXG2GN98e5Hh8AQLbJLe+dqqYpzwVgIyKcxXerd1oDxMQ06AX1ocGt0F
 gXV6C5CeKM48+dWtRgcUsj0l5miINUMLSbdaNfrgKE+MnW9Y6/BloKktuCKHJhUgG9alaZ
 +rGJfLfzWwBC4JVmwAsWfSv6Zo2YKFg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-31HXSk0RPd6Igs1VnEWrQQ-1; Fri, 01 Jul 2022 15:02:42 -0400
X-MC-Unique: 31HXSk0RPd6Igs1VnEWrQQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso545243wrz.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 12:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YteOKhi7iNsOx5ZA+OArdj5sj8Ut6l24ccYKF/bIe0s=;
 b=x1/pewyDzux4jhmO7MTX8ue8XFevhTKrnEORhirZWmxwFY1kJKKvfC3IMm0oikxFtE
 mLhD4shKBZimm7T0asQxr4Z2ZJGjg5CupgMry0mP5PrgykqQJkhBg5xZSacex2cjN22w
 RbUYr0xUl3BMHTpufiEDJf0uM9lXkLMFgTqzdc9R9DjPvkxQd+39TflOzp3FHZ2QdmoH
 vPGhxvtQ7LaafxyxEUpEzstigle4YCwJWCmaV1x5j/rIBX8gBpGgwgA+j081I++2lhYz
 KM6z8URaOYRWMp+7ObeP0TTllBJ03xB7Y3CVW6ZLtAyxaU9BTNwEvDx6XWi27hxckzTz
 vaLg==
X-Gm-Message-State: AJIora8SSlSo3npauvY2krQCa/FCSglUt1lHlTiV1Ui5Q4ErKv9eD+jK
 SttyvSUORH+GEJaXLbu0mn0le3FuK2l26h8UWrUm/PYHv1r/frJFgXOp01cU1dI/LyyYCrXC8Hy
 3B4keTBOpU5yOsgiM9WsyMnqRjnfX
X-Received: by 2002:a05:600c:b51:b0:3a1:71b0:a115 with SMTP id
 k17-20020a05600c0b5100b003a171b0a115mr16121969wmr.41.1656702160942; 
 Fri, 01 Jul 2022 12:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uM3icFRTP2WMGCU6/6wGy4YIyCDDU2SZS7oL9gjBlUFUHGDew/1gHUbRgopnBmk7qSWOngag==
X-Received: by 2002:a05:600c:b51:b0:3a1:71b0:a115 with SMTP id
 k17-20020a05600c0b5100b003a171b0a115mr16121946wmr.41.1656702160728; 
 Fri, 01 Jul 2022 12:02:40 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0039c5642e430sm12535470wmq.20.2022.07.01.12.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:02:40 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 10/10] drm/todo: remove task for idr_init_base()
Date: Fri,  1 Jul 2022 21:02:27 +0200
Message-Id: <20220701190227.284783-3-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701190227.284783-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
 <20220701190227.284783-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

All IDRs in the DRM core and drivers which are applicable for using
idr_init_base() over idr_init() should be set up to use a proper base in
order to avoid unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..de226ccc2c54 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -322,18 +322,6 @@ Contact: Daniel Vetter, Noralf Tronnes
 
 Level: Advanced
 
-idr_init_base()
----------------
-
-DRM core&drivers uses a lot of idr (integer lookup directories) for mapping
-userspace IDs to internal objects, and in most places ID=0 means NULL and hence
-is never used. Switching to idr_init_base() for these would make the idr more
-efficient.
-
-Contact: Daniel Vetter
-
-Level: Starter
-
 struct drm_gem_object_funcs
 ---------------------------
 
-- 
2.36.1

