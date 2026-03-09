Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBBhFj3srmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A223C0E9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9946E10E54B;
	Mon,  9 Mar 2026 15:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="WIPK784+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9710E22A;
 Mon,  9 Mar 2026 02:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5v
 sqXiU7O2Yi0ZaDaTEqsKFf1lQiln2PtajqeQs2Nyc=; b=WIPK784+ChbfpAdr+A
 eQqyQsF+qh4fQjU3PzQZcy5YxlLugkrMrmVXiR3i45iDYOGCsqY8Dg94fvilvW0e
 hGuTNjPB0hHGq9dWcHQs7xeDJEgAo3m2tVkMJkcSi1+GZi8xBymPq0Ltw8sa475q
 pVR+VvRydzR2W0fHb/58FHGRE=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wDXV5TmLq5pRMZoPg--.11725S3; 
 Mon, 09 Mar 2026 10:22:33 +0800 (CST)
From: Chenyuan Mi <chenyuan_mi@163.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/amdgpu: protect waitq access with userq_mutex in wait
 IOCTL
Date: Mon,  9 Mar 2026 10:22:28 +0800
Message-ID: <20260309022229.63071-2-chenyuan_mi@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309022229.63071-1-chenyuan_mi@163.com>
References: <20260309022229.63071-1-chenyuan_mi@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXV5TmLq5pRMZoPg--.11725S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF17Ww13Xw45AF45XF18Krg_yoW5XryDpr
 WrKr12kr4DXr429w1UJwnFgFWvgw4xWFWfKFn7Cry3uws8Aas09ryYkFWDXr18CrsrAFW2
 qrn7A3y8tF1qkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqD73UUUUU=
X-Originating-IP: [124.70.231.40]
X-CM-SenderInfo: xfkh055xdqszrl6rljoofrz/xtbC1ArL3mmuLuqxEwAA3q
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: C77A223C0E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyuan_mi@163.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

amdgpu_userq_wait_ioctl() accesses the wait queue object obtained
from xa_load() without holding userq_mutex or taking a reference on
the queue. A concurrent AMDGPU_USERQ_OP_FREE call can destroy and
free the queue between the xa_load() and the subsequent
xa_alloc(&waitq->fence_drv_xa, ...), resulting in a use-after-free.

This is a regression introduced by commit 4b27406380b0
("drm/amdgpu: Add queue id support to the user queue wait IOCTL"),
which removed the indirect fence_drv_xa_ptr model and its NULL
check safety net from commit ed5fdc1fc282 ("drm/amdgpu: Fix the
use-after-free issue in wait IOCTL") and replaced it with a direct
waitq->fence_drv_xa access, but did not add any lifetime protection
around the new waitq pointer.

Fix this by holding userq_mutex across the xa_load() and the
subsequent fence_drv_xa operations, matching the locking used by
the destroy path.

Fixes: 4b27406380b0 ("drm/amdgpu: Add queue id support to the user queue wait IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Chenyuan Mi <chenyuan_mi@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 8013260e29dc..1785ea7c18fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -912,8 +912,10 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 		 */
 		num_fences = dma_fence_dedup_array(fences, num_fences);
 
+		mutex_lock(&userq_mgr->userq_mutex);
 		waitq = xa_load(&userq_mgr->userq_xa, wait_info->waitq_id);
 		if (!waitq) {
+			mutex_unlock(&userq_mgr->userq_mutex);
 			r = -EINVAL;
 			goto free_fences;
 		}
@@ -932,6 +934,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 				r = dma_fence_wait(fences[i], true);
 				if (r) {
 					dma_fence_put(fences[i]);
+					mutex_unlock(&userq_mgr->userq_mutex);
 					goto free_fences;
 				}
 
@@ -948,8 +951,10 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 			 */
 			r = xa_alloc(&waitq->fence_drv_xa, &index, fence_drv,
 				     xa_limit_32b, GFP_KERNEL);
-			if (r)
+			if (r) {
+				mutex_unlock(&userq_mgr->userq_mutex);
 				goto free_fences;
+			}
 
 			amdgpu_userq_fence_driver_get(fence_drv);
 
@@ -961,6 +966,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 			/* Increment the actual userq fence count */
 			cnt++;
 		}
+		mutex_unlock(&userq_mgr->userq_mutex);
 
 		wait_info->num_fences = cnt;
 		/* Copy userq fence info to user space */
-- 
2.53.0

