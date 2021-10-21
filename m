Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F54358DB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EA16EA6A;
	Thu, 21 Oct 2021 03:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1AB6E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:34 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s136so21069519pgs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XE9+2bVA7CccLIzhLAPheXBj2paWYoYmQA2qJZ5y+AY=;
 b=VZDYpu1r1e00Rtnm23pbOa6bSUWAA3ViJi/ot+9rcwGOAYPK8xNjUtHr0BPVusQhs8
 T1pmhjglFKM+sVbYlULCyo59GxCWKq78+EeOCGviGn5yXemHsSLJKPfNwINwQn4ubTx9
 Fjq9Oy7MkJ+cHu7V6rGL6ilGVlX2yryQKpQ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XE9+2bVA7CccLIzhLAPheXBj2paWYoYmQA2qJZ5y+AY=;
 b=V7c+J0o+i4ceeFOMUntYhMhnuzLhxQXk/QP27Fmz/0rRuSaPe5U+zJndWij9dZaifn
 2NWKIAFdxWdI+D9ROAAXuuvsFKxU9rZh6R+N05ZJIUUIo9nUWp8SXZxdIbXkp7nlTRcs
 MVR4AzSHNuEupLAQTDrNobT6iNaghvQ+k8LEWsxqY7SZ5vqJ+kY40fpTORs8jKXrNn2J
 XrFfDJa1OCLIz2RinwvXTOG4XKI30TethF7xA7eMIvqGkn+W8PESB2BzSYaNy4k6fUR5
 N0w+1tlN8gG2D4sErQj++Rvu+SMhyCBVcdh4H/Y9ATrJhSdxs0Jyjpek1uZIuT+XwSp5
 kXxA==
X-Gm-Message-State: AOAM531gQZPgwZ/5Jo/MSlPRj59V6WbIiU6QDkGgTBgVAVq6UypSgQlA
 0SHkPmHURSBn+46poqnO9DPfZ/K+PlsRGQ==
X-Google-Smtp-Source: ABdhPJzSuCRexaxR7mnbeSlSRjyqovNXqg2zqWcrvuXv61n3fpNqGPgPRQ37jAh9fFGXm2kvLdRGmQ==
X-Received: by 2002:aa7:9258:0:b0:44d:4f03:6a7a with SMTP id
 24-20020aa79258000000b0044d4f036a7amr2620572pfp.33.1634785833504; 
 Wed, 20 Oct 2021 20:10:33 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:33 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 4/8] drm: start using drm_gem_trace_gpu_mem_total
Date: Wed, 20 Oct 2021 20:10:23 -0700
Message-Id: <20211021031027.537-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- drm_gem_private_object_init(..) increases the total memory
  counter.

  * All GEM objects (whether allocated or imported) seem to begin
    there.
  * If there's a better place/method, please do let
    me know.

- drm_gem_object_free(..) decreases the total memory counter.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/drm_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 24a719b79400..528d7b29dccf 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -213,6 +213,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 		obj->resv = &obj->_resv;
 
 	drm_vma_node_reset(&obj->vma_node);
+	drm_gem_trace_gpu_mem_total(dev, obj->size, false);
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
@@ -1015,6 +1016,10 @@ drm_gem_object_free(struct kref *kref)
 	struct drm_gem_object *obj =
 		container_of(kref, struct drm_gem_object, refcount);
 
+	struct drm_device *dev = obj->dev;
+
+	drm_gem_trace_gpu_mem_total(dev, -obj->size, false);
+
 	if (WARN_ON(!obj->funcs->free))
 		return;
 
-- 
2.25.1

