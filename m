Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4457B77A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8E8B43E;
	Wed, 20 Jul 2022 13:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03178B3FF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1+/TuaGVCtg6aZ6ugNH+AX/gcs1Sy7JNQEZshG7+6s=;
 b=VLtxWQWE85Kt1PBMZdRLZH1i4XO1w8FG4zEGhJIaDbchqhUKh5cBQ706ncziJXhTp6BQ4T
 6TJYq6JxzxylG3K2OWm7DueArQnjZhZqxMd3UoX3iqtJl/+pM/cQWK40c9ELaRqTa4LAX/
 ew8Z8cPutiQBj73hBrG9k5XY26HhzIM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-IUXUoa_9MmCxnysD1Okyfg-1; Wed, 20 Jul 2022 09:28:46 -0400
X-MC-Unique: IUXUoa_9MmCxnysD1Okyfg-1
Received: by mail-ed1-f72.google.com with SMTP id
 f9-20020a056402354900b0043a902b7452so11979540edd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1+/TuaGVCtg6aZ6ugNH+AX/gcs1Sy7JNQEZshG7+6s=;
 b=ggy4K0fluR1ZC++/bQqiXcAYihdhCGJlA0MCw/mbVoJN6t75SGUMODetteJOoy5RIt
 cHdrfLy/gQhedxo7FUddGCdwMhIOyl9d6ccJ1AVN3+fjjyGFJS3iIa+hogivUBQwNBki
 5WKjotwSCAytY9NmU+gsr4S9Dio5F1TmkD8iFYTrwVAjFgXjJr0W578RMV8o1pnSSL9X
 4a0Y2rIAFQDtZ3Ix4byRBPvUorNHT6b9U2wCVw3AbLQs9GjSQ33qVCpfWgRLDj/xjZEU
 /OqVmtS1F2rQtFc1JhqPdhym77ix1rm6AznNWyNFHdU/SXilmFVO2BnrzygsO8sAF4jo
 DbGg==
X-Gm-Message-State: AJIora+FzDbVQHeVx4Ie4blkYMvjNB+blkHgYWi8F3UN6ug6Dnj2HBPP
 BWv3sFi51OddIQcKg8G39AIfmL5aMGJVxzs5kGumiLu6bRMZm9VqJK486tnBZd8R6wj14vJZf1K
 12deEvPJKh2JWjYOBR4MiDlyv5WXq
X-Received: by 2002:a05:6402:370c:b0:435:cb14:9aa8 with SMTP id
 ek12-20020a056402370c00b00435cb149aa8mr50011224edb.35.1658323725634; 
 Wed, 20 Jul 2022 06:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6VDktN4Zp0svFCntEPMgCQyXq13LyGGTZPFEFlsUVznoeu82FYaWBUuOCXg43IcOly3Xphw==
X-Received: by 2002:a05:6402:370c:b0:435:cb14:9aa8 with SMTP id
 ek12-20020a056402370c00b00435cb149aa8mr50011210edb.35.1658323725500; 
 Wed, 20 Jul 2022 06:28:45 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:44 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 10/10] drm/todo: remove task for idr_init_base()
Date: Wed, 20 Jul 2022 15:28:30 +0200
Message-Id: <20220720132830.193747-11-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720132830.193747-1-dakr@redhat.com>
References: <20220720132830.193747-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All IDRs in the DRM core and drivers which are applicable for using
idr_init_base() over idr_init() should be set up to use a proper base in
order to avoid unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Christian König <christian.koenig@amd.com>
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

