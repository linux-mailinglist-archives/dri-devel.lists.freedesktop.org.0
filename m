Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10266296EE7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533EF6ED9F;
	Fri, 23 Oct 2020 12:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E636E5BE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e17so1556322wru.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSvfMpk8nz0H1sAMA0mSdFT4I7vUYMTnmWeMxNRCKfw=;
 b=XbjtQ5y3gq9rwsHjLUq2s1FMHnBTj/eQZ4X6SIoKxicRAqdFcVXpCdmmXDGIAfDmlJ
 vTlctBxDQAcLEIJfwwSjLigVYK2yqREmh744IwZTjQtL72NnrMD4qk5DByQ0U6KtvCp+
 yde3podSjT17Wgfh2OXWOxQIXBMyXmMGSYisY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSvfMpk8nz0H1sAMA0mSdFT4I7vUYMTnmWeMxNRCKfw=;
 b=k7NS61Io3wuEHVIGTykh8QetEHIkqH0PB9KMPBXOl5inpGoChd40svD6TUQIsAC4kr
 5eXg4hVn3EJZ/pz6WgueMaO7zk4Mjk1RTtcoSkLfYEaLa+Z6OwvNzG9Nw0y5NrFfaCbX
 36zrJTnPiMIhQCIJWx/zAs/c7KdApxOBG+NHqfZ8GWYuf0ngiaVutDEhB6TuUQfQmlmf
 nsDjhFHypyWh3ZWrASoOroJkyNLJGPPylSKaOybDt2CTXA1wg5Sx5krIz9wHr8AHf7lt
 IBlM6Vi1InH4dTtsuWonwyZCAHwAULBqzvUf7NYu9TAIIzYrFB3PQ+XL/7XrsezIGwOP
 td1w==
X-Gm-Message-State: AOAM532tgo63edahILmnB+lpFOekDUQPOUKP+iwNCa2ZtrIjmcZjhiVr
 JqhBD6wP+Py7LB75CjiRSkvD9UeZ8g6pnb3C
X-Google-Smtp-Source: ABdhPJy+cnPO1oUEM7m+LXpVtRGGJwasanr9H4yEtRLkGwa4pxKYkedvAOZm9or3j5vLj4V0tMorUA==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr2205870wrp.44.1603455773692;
 Fri, 23 Oct 2020 05:22:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/65] drm/ttm: WARN_ON non-empty lru when disabling a
 resource manager
Date: Fri, 23 Oct 2020 14:21:39 +0200
Message-Id: <20201023122216.2373294-28-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_resource_manager->use_type is only used for runtime changes by
vmwgfx. I think ideally we'd push this functionality into drivers -
ttm itself does not provide any locking to guarantee this is safe, so
the only way this can work at runtime is if the driver does provide
additional guarantees. vwmgfx does that through the
vmw_private->reservation_sem. Therefore supporting this feature in
shared code feels a bit misplaced.

As a first step add a WARN_ON to make sure the resource manager is
empty. This is just to make sure I actually understand correctly what
vmwgfx is doing, and to make sure an eventual subsequent refactor
doesn't break anything.

This check should also be useful for other drivers, to make sure they
haven't leaked anything.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
---
 include/drm/ttm/ttm_resource.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index f48a70d39ac5..789ec477b607 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -191,6 +191,10 @@ struct ttm_resource {
 static inline void
 ttm_resource_manager_set_used(struct ttm_resource_manager *man, bool used)
 {
+	int i;
+
+	for (i = 0; i < TTM_MAX_BO_PRIORITY; i++)
+		WARN_ON(!list_empty(&man->lru[i]));
 	man->use_type = used;
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
