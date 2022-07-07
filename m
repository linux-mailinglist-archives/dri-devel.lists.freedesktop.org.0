Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F412156A9D5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04412112082;
	Thu,  7 Jul 2022 17:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED7310EF0C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657215632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=BThpVOYeoKVGC2HTkS+0/Xsbc3ykgjAsN8KGXbWTzLnDbTEQqU/br+rXY9o2INc7LWiMff
 0EhigH0TNBxpVVVYg3mH9vLLBNtqaBnzACtgtRdyRJ1ARNa2bg50Gsoy0dz/i+EXS0By/r
 lBAL4FSDiChF/mVMapDC2y8CK2zZ+IM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-S1eX1arHPpqZdhHMBaNuQw-1; Thu, 07 Jul 2022 13:40:31 -0400
X-MC-Unique: S1eX1arHPpqZdhHMBaNuQw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb34-20020a1709076da200b00722f4a9865bso4972209ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 10:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=HTAQLKPNgbWT2sfP3ztsfsKiuZifLvPRC4vOJlGYSJ80P15oeeeGxgJ/UrNWSBvBh+
 MnkLZh1MqBcXlj2FEynO4Xls1ZZORIHAZICdhPmGA55b+xgAekZsvJwJinzamqyDg9YI
 tFK3id06f36InSnobMGi7/o+AQZn/FIWp2UtPtO6D8XI/DxcAqDWGC/DxnrikedihXVK
 2nQUvsv4rekYM8fJnYbWMDVQmcy1i+LFTRHmmUa4DDAVEALs3y/aXpuwgFn4YlAjrxWH
 SUjFNiSMhWTiS6bMLMpmh5ZDrR9zgysLiBWxjoy4H8qD55P6RK4TfUo5tvCqZRB2/5tm
 DiIg==
X-Gm-Message-State: AJIora+D2XYj9MnHBL9+R5rN9TfISpKKdj1kdd5EQeSpHFeqf07CWTsD
 pIDD1ESpKyaGxaDhWUo9DeJPFRdnep1WKniUrSkKEDUkQm+B/h+NfGU9xcoz7AjqyBIfBaSEZrb
 +pyMIcdpU/2v2uu/qoVgofExpPqny
X-Received: by 2002:aa7:c783:0:b0:435:2a52:3388 with SMTP id
 n3-20020aa7c783000000b004352a523388mr25532397eds.164.1657215630462; 
 Thu, 07 Jul 2022 10:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMHYRWt2bsRE6xTV+/1kBR3wQxwqI03PQBs+pw6SyB0ePUr1dLxWsHl5D3xjpNv8ERFU2Igw==
X-Received: by 2002:aa7:c783:0:b0:435:2a52:3388 with SMTP id
 n3-20020aa7c783000000b004352a523388mr25532380eds.164.1657215630322; 
 Thu, 07 Jul 2022 10:40:30 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jp1-20020a170906f74100b006fe0abb00f0sm19092424ejb.209.2022.07.07.10.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:40:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH v3 4/4] drm/todo: remove task to rename CMA helpers
Date: Thu,  7 Jul 2022 19:40:03 +0200
Message-Id: <20220707174003.1390017-5-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707174003.1390017-1-dakr@redhat.com>
References: <20220707174003.1390017-1-dakr@redhat.com>
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

Both, GEM and FB, CMA helpers were renamed to "GEM DMA" and "FB DMA",
hence the task can be removed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/todo.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..fd5b3f2fb19e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -343,19 +343,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
 
 Level: Intermediate
 
-Rename CMA helpers to DMA helpers
----------------------------------
-
-CMA (standing for contiguous memory allocator) is really a bit an accident of
-what these were used for first, a much better name would be DMA helpers. In the
-text these should even be called coherent DMA memory helpers (so maybe CDM, but
-no one knows what that means) since underneath they just use dma_alloc_coherent.
-
-Contact: Laurent Pinchart, Daniel Vetter
-
-Level: Intermediate (mostly because it is a huge tasks without good partial
-milestones, not technically itself that challenging)
-
 connector register/unregister fixes
 -----------------------------------
 
-- 
2.36.1

