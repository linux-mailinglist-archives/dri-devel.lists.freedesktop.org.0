Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8F336B30
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 05:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870EE6E128;
	Thu, 11 Mar 2021 04:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434D36E128
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 04:35:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-uF6jl2HoPT6LpLNBFTzU3A-1; Wed, 10 Mar 2021 23:35:31 -0500
X-MC-Unique: uF6jl2HoPT6LpLNBFTzU3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AFBA26864;
 Thu, 11 Mar 2021 04:35:30 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73A981002388;
 Thu, 11 Mar 2021 04:35:29 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix dma syncing for loops (v2)
Date: Thu, 11 Mar 2021 14:35:27 +1000
Message-Id: <20210311043527.5376-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: michael.j.ruhl@intel.com, skeggsb@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The index variable should only be increased in one place.

Noticed this while trying to track down another oops.

v2: use while loop.

Fixes: f295c8cfec83 ("drm/nouveau: fix dma syncing warning with debugging on.")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2375711877cf..fabb314a0b2f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -556,7 +556,8 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 	if (nvbo->force_coherent)
 		return;
 
-	for (i = 0; i < ttm_dma->num_pages; ++i) {
+	i = 0;
+	while (i < ttm_dma->num_pages) {
 		struct page *p = ttm_dma->pages[i];
 		size_t num_pages = 1;
 
@@ -587,7 +588,8 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 	if (nvbo->force_coherent)
 		return;
 
-	for (i = 0; i < ttm_dma->num_pages; ++i) {
+	i = 0;
+	while (i < ttm_dma->num_pages) {
 		struct page *p = ttm_dma->pages[i];
 		size_t num_pages = 1;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
