Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B712A38D840
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 04:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B746E03E;
	Sun, 23 May 2021 02:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91176E02E;
 Sun, 23 May 2021 02:21:28 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id h9so23762085oih.4;
 Sat, 22 May 2021 19:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6LZ1nOhRwzoOY76+a1FbKsP/eyCYJFZ+vHMVLGv3BQ=;
 b=MO3wfQN8QNjrYCGPOw6rn7zlKuW1zT444BXJ5yMVL9WZv/frfxMyeatWnFiLW71tr8
 /a82McSqPki/nIdeNGhMbUpCGl1WoremUWG7dTKg6rD2XM1tLW9PWDkDfabc5jwDajuZ
 tvrmsdBlD3n2oKx32ymz1kWcY4vwWcdRJhTvzvXp8BD3VdpWWqazrJFfzwa09/EKBDwZ
 GjqIF3Ix6diZ1NAjkdaR8NpB/u4BwEOtb7IS3WRyS0fx0jAT8zvG2p/Z2hbGEgkM8CiQ
 HpU8lPkJl1tjLfD/KpoJDMhmtJE9QIUqBWie3+T4YHTKgm+3H2zC61M1eYD5rhO9TJ1J
 scNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=U6LZ1nOhRwzoOY76+a1FbKsP/eyCYJFZ+vHMVLGv3BQ=;
 b=S1NmXCMPXVxjWr870589355x6KsxpehAHqRo66eruSdZVUiSvDtMm3K0AqsgRWqGZn
 DbM4886MgyChiWNH+DWz+3O+v1E8uO9NFl1y8psW8c+ccelevY+koGPlQKbS/jw0z+fF
 Y4VTy6TM9TkuIR/ubVEoLyJ7JJ3alWu4QkDW8za+pm3sFG1qH9mzScRQ0CPSiDnsSLOO
 iwT7K+Tv6Ds/z2axJKYTn1+TiGzn+qNL2TIAb/0rG1zfcQdFYtlIPnUJa1P6xeBNKvrZ
 oWX/QM9qHYHn4GQIPwh4fgVrgOWxKOnc2UlQ6kbuiKBIl6BNU949WQ//KjG6B5qgah99
 j3Rg==
X-Gm-Message-State: AOAM5308DzBfnFy9yDWgMUCXwy/Jmvchjlnil3OMh9x5c6kXy2qKJskc
 ypgxVVJ/Qla1/sABIdtPJUg=
X-Google-Smtp-Source: ABdhPJwaRu7doMHe/oCsHDDI5YU3j35+KQOMg97pQpgU82F6UZ7fuhO4/PAisIUok6qJGD8zEB+JUQ==
X-Received: by 2002:aca:ab50:: with SMTP id u77mr6796354oie.153.1621736488189; 
 Sat, 22 May 2021 19:21:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e21sm1981779oii.23.2021.05.22.19.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 19:21:27 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH] drm/i915/gem: Use list_entry to access list members
Date: Sat, 22 May 2021 19:21:25 -0700
Message-Id: <20210523022125.853214-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use list_entry() instead of container_of() to access list members.
Also drop unnecessary and misleading NULL checks on the result of
list_entry().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index d4f883f35b95..4241af5074a9 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -148,7 +148,7 @@ static void dmabuf_gem_object_free(struct kref *kref)
 
 	if (vgpu && vgpu->active && !list_empty(&vgpu->dmabuf_obj_list_head)) {
 		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-			dmabuf_obj = container_of(pos,
+			dmabuf_obj = list_entry(pos,
 					struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
 				list_del(pos);
@@ -357,10 +357,8 @@ pick_dmabuf_by_info(struct intel_vgpu *vgpu,
 	struct intel_vgpu_dmabuf_obj *ret = NULL;
 
 	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = container_of(pos, struct intel_vgpu_dmabuf_obj,
-						list);
-		if ((dmabuf_obj == NULL) ||
-		    (dmabuf_obj->info == NULL))
+		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
+		if (dmabuf_obj->info == NULL)
 			continue;
 
 		fb_info = (struct intel_vgpu_fb_info *)dmabuf_obj->info;
@@ -387,11 +385,7 @@ pick_dmabuf_by_num(struct intel_vgpu *vgpu, u32 id)
 	struct intel_vgpu_dmabuf_obj *ret = NULL;
 
 	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = container_of(pos, struct intel_vgpu_dmabuf_obj,
-						list);
-		if (!dmabuf_obj)
-			continue;
-
+		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 		if (dmabuf_obj->dmabuf_id == id) {
 			ret = dmabuf_obj;
 			break;
@@ -600,8 +594,7 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
 
 	mutex_lock(&vgpu->dmabuf_lock);
 	list_for_each_safe(pos, n, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = container_of(pos, struct intel_vgpu_dmabuf_obj,
-						list);
+		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 		dmabuf_obj->vgpu = NULL;
 
 		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
-- 
2.25.1

