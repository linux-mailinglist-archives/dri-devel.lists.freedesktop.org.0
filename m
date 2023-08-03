Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF676EFF7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 18:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD4D10E631;
	Thu,  3 Aug 2023 16:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997710E648
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WgiHBqQzhU+chwvVYY3OBnXGB70Uj4QupullLdrp3I8=;
 b=Yetg5L/DggdciwboMUxeHxgtpBv1xPJD90Xl9OZZBHS1eI6N7yuoR6bvLPoVlGSrKMmtov
 V5e8b12UZoN8UxjS8xa2TpGkgzphfNYnr7q1RKngIcWFcqtaFgQRricgx4d0ev7BwISiWX
 AxGwq7LWwV4BOX+NQpO3ajF1cE0gQvE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-yFW3yHZAOx6Kz39Z_ETE7Q-1; Thu, 03 Aug 2023 12:52:54 -0400
X-MC-Unique: yFW3yHZAOx6Kz39Z_ETE7Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51d8823eb01so720540a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 09:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081573; x=1691686373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgiHBqQzhU+chwvVYY3OBnXGB70Uj4QupullLdrp3I8=;
 b=J4SO+5KBotwS3EspIG7rxNfcI6c3HpzKILWT73Kkt86hKayvWvz5Ri2p+NBa8mBUr2
 RE3UVmOdRpNTNQ7rgB0+jkrwaC0lZqbsNoyWCvxWU5SO/4TNESm5+WuBdg6bj1siWF1z
 OXydbw3TVcYw3v54yN1Hnb+ZI8qQrfwzdhG2jgsA/0LL92ngYlR/S31ecQHglO3ljZIY
 Anl1GAbEMCmLyoBbd/zJmArd12V8gQu3JXQyEUK/VNp3OVcrmIoyD+vSIiZ04NYpYshU
 G37+NSMk1ehv6yDV9qzvUElIvwsrwlLHM5n/Wmg+9v3hOPwuZjAP+ws/ITVKZ+5FnmXb
 Uj5Q==
X-Gm-Message-State: ABy/qLbbgYUchZuaJPrTyn55mTperoM7NNjqG4ur8a6KSI42iBkWhYJw
 f0GEWUNhTDxm1CKaZbGexNIERHAouplLbRnBallSqmdQbHUR0HXuqXlAw7JA/grjhJI9yOLppfw
 8uhVaO2Ci4JXRP20iTMlmz5uGwB0z
X-Received: by 2002:a05:6402:31fa:b0:51e:2305:931 with SMTP id
 dy26-20020a05640231fa00b0051e23050931mr7760027edb.22.1691081573580; 
 Thu, 03 Aug 2023 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHWOYsnn1oCn5gkeMLn4uDdQ4XDa+mZDkwB5BDZpkQE0Vx3/c9Z+CvMCA47o36BoMnEPa5E0g==
X-Received: by 2002:a05:6402:31fa:b0:51e:2305:931 with SMTP id
 dy26-20020a05640231fa00b0051e23050931mr7760014edb.22.1691081573325; 
 Thu, 03 Aug 2023 09:52:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v24-20020aa7d818000000b005227f4530fdsm35668edq.37.2023.08.03.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:52:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v9 01/11] drm/gem: fix lockdep check for
 dma-resv lock
Date: Thu,  3 Aug 2023 18:52:20 +0200
Message-ID: <20230803165238.8798-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
should fall back to the GEM objects dma-resv lock. With the current
implementation we're setting the lock_dep_map of the GEM objects 'resv'
pointer (in case no custom lock_dep_map is set yet) on
drm_gem_private_object_init().

However, the GEM objects 'resv' pointer might still change after
drm_gem_private_object_init() is called, e.g. through
ttm_bo_init_reserved(). This can result in the wrong lock being tracked.

To fix this, call dma_resv_held() directly from
drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
pointer only if an actual custom lock is set.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/drm/drm_gem.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index c0b13c43b459..bc9f6aa2f3fe 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
  * @lock: the lock used to protect the gpuva list. The locking primitive
  * must contain a dep_map field.
  *
- * Call this if you're not proctecting access to the gpuva list
- * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
- * of initializing lock_dep_map for you.
+ * Call this if you're not proctecting access to the gpuva list with the
+ * dma-resv lock, but with a custom lock.
  */
 #define drm_gem_gpuva_set_lock(obj, lock) \
-	if (!(obj)->gpuva.lock_dep_map) \
+	if (!WARN((obj)->gpuva.lock_dep_map, \
+		  "GEM GPUVA lock should be set only once.")) \
 		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
 #define drm_gem_gpuva_assert_lock_held(obj) \
-	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
+	lockdep_assert((obj)->gpuva.lock_dep_map ? \
+		       lock_is_held((obj)->gpuva.lock_dep_map) : \
+		       dma_resv_held((obj)->resv))
 #else
 #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
 #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
@@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
  *
  * Calling this function is only necessary for drivers intending to support the
  * &drm_driver_feature DRIVER_GEM_GPUVA.
+ *
+ * See also drm_gem_gpuva_set_lock().
  */
 static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 {
 	INIT_LIST_HEAD(&obj->gpuva.list);
-	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
 }
 
 /**
-- 
2.41.0

