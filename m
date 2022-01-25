Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C149AEA9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559CD10EE0E;
	Tue, 25 Jan 2022 08:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1056 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jan 2022 08:57:10 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB83810EE10;
 Tue, 25 Jan 2022 08:57:10 +0000 (UTC)
Received: from kwepemi100018.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JjgGr2YR5z9sJ5;
 Tue, 25 Jan 2022 16:38:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100018.china.huawei.com (7.221.188.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 16:39:31 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 16:39:30 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/i915/gvt: Convert list_for_each to entry variant
Date: Tue, 25 Jan 2022 16:39:24 +0800
Message-ID: <1643099964-13905-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zou Wei <zou_wei@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

convert list_for_each() to list_for_each_entry() where
applicable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/gpu/drm/i915/gvt/dmabuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 8882843..1f0721d 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -350,13 +350,11 @@ static struct intel_vgpu_dmabuf_obj *
 pick_dmabuf_by_info(struct intel_vgpu *vgpu,
 		    struct intel_vgpu_fb_info *latest_info)
 {
-	struct list_head *pos;
 	struct intel_vgpu_fb_info *fb_info;
 	struct intel_vgpu_dmabuf_obj *dmabuf_obj = NULL;
 	struct intel_vgpu_dmabuf_obj *ret = NULL;
 
-	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
+	list_for_each_entry(dmabuf_obj, &vgpu->dmabuf_obj_list_head, list) {
 		if (!dmabuf_obj->info)
 			continue;
 
@@ -379,12 +377,10 @@ pick_dmabuf_by_info(struct intel_vgpu *vgpu,
 static struct intel_vgpu_dmabuf_obj *
 pick_dmabuf_by_num(struct intel_vgpu *vgpu, u32 id)
 {
-	struct list_head *pos;
 	struct intel_vgpu_dmabuf_obj *dmabuf_obj = NULL;
 	struct intel_vgpu_dmabuf_obj *ret = NULL;
 
-	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
+	list_for_each_entry(dmabuf_obj, &vgpu->dmabuf_obj_list_head, list) {
 		if (dmabuf_obj->dmabuf_id == id) {
 			ret = dmabuf_obj;
 			break;
-- 
2.6.2

