Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5FF7863F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 01:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6B10E086;
	Wed, 23 Aug 2023 23:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4DB10E086
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692833489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xfIBvMHNvpsOSgSnZMhoSJSbG62O2gZi4ABK8EMkbSQ=;
 b=WWqs3zHay9dvQwTyzHMCQmYoBa2lzp0RskcywJyi7OUDNRU97cU/mKjaR4QuJRKVt+ZgOt
 +Isj4JGNgXQutUSUWrHe+6R5yYsDwFjbkFFvHu3sAekWd9IBRgvrzGL6Z8sBLmihjK2GEL
 DrUx3c93heOFyS7qCs4nmPC2ontjnAM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-ykNO8ibvOEaHY59gjUxo7g-1; Wed, 23 Aug 2023 19:31:28 -0400
X-MC-Unique: ykNO8ibvOEaHY59gjUxo7g-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-52a40e282d9so220741a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 16:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692833487; x=1693438287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xfIBvMHNvpsOSgSnZMhoSJSbG62O2gZi4ABK8EMkbSQ=;
 b=G3tYwQmXlq5fQhv8z+EnamsSdrrTvI+FtrZPIM5wt5ACnglrxi+uqqHGiOGelRh24g
 VGZJxSNQHo21TzfW7dhHrifqK3GRgYAUcRcpdcM0M2CSwNkYVX8mxwB2pSwm8JEOCp/1
 /I1IejhZ1aKnck71+719Y4/ztqHLOIU0nxE32tlNnP4osLHaqE6d657oY0gJbCnl09Ie
 vTcdLHk91an7+hgfnkV28Fl1e9HR4AUsonyBiQghiW1lJKBplwjViG7d+e9gx7NhyoxC
 uaX5lE6d9q8hon8hihtd4maDpKmSt8/DT6E4uboEymVsqIdw/hUnkRvP4LEybbfRVJAZ
 AtuQ==
X-Gm-Message-State: AOJu0Yxj72wbqKnBv/5PI+7H9ubND9HKVYHDyP2PX8C3opoia+4zcbym
 9v49wXFvnNo7Hflomwt7rkSCFK3Z4fMWdp1mgd01wFOnfz5yKHNUzOaTSAZuGe7GjKqXx+t+OtF
 R6V5Ffbgxmf+ClTyVHBGOYMtFhHNg
X-Received: by 2002:a05:6402:2051:b0:522:b1cb:e6c with SMTP id
 bc17-20020a056402205100b00522b1cb0e6cmr10588567edb.38.1692833487065; 
 Wed, 23 Aug 2023 16:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX6ZLtlac/xGYXKpeeZ4nqkoxp3F+cUKCmdJe3qaYOQF32XgUQpel6SE0V9QNARP6jWmjA9A==
X-Received: by 2002:a05:6402:2051:b0:522:b1cb:e6c with SMTP id
 bc17-20020a056402205100b00522b1cb0e6cmr10588560edb.38.1692833486826; 
 Wed, 23 Aug 2023 16:31:26 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b005233609e39dsm2891936edq.30.2023.08.23.16.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 16:31:26 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, boris.brezillon@collabora.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Subject: [PATCH drm-misc-next] drm/gpuva_mgr: remove unused prev pointer in
 __drm_gpuva_sm_map()
Date: Thu, 24 Aug 2023 01:31:12 +0200
Message-ID: <20230823233119.2891-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The prev pointer in __drm_gpuva_sm_map() was used to implement automatic
merging of mappings. Since automatic merging did not make its way
upstream, remove this leftover.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index 1bc91fc60ef3..3e1ca878cb7e 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -1743,7 +1743,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 		   u64 req_addr, u64 req_range,
 		   struct drm_gem_object *req_obj, u64 req_offset)
 {
-	struct drm_gpuva *va, *next, *prev = NULL;
+	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
 	int ret;
 
@@ -1773,7 +1773,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
-				goto next;
+				continue;
 			}
 
 			if (end > req_end) {
@@ -1818,7 +1818,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
-				goto next;
+				continue;
 			}
 
 			if (end > req_end) {
@@ -1851,7 +1851,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
-				goto next;
+				continue;
 			}
 
 			if (end > req_end) {
@@ -1872,8 +1872,6 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 				break;
 			}
 		}
-next:
-		prev = va;
 	}
 
 	return op_map_cb(ops, priv,
-- 
2.41.0

