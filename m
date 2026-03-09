Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNTQHGIWr2nHNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:50:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F169E23ED69
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DBA10E125;
	Mon,  9 Mar 2026 18:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D/x6fmxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ACA10E125
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 18:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iOMWtsESmoEbZ5KQOERQCsxw0l6buAHhPbGmR+Cj2Y4=; b=D/x6fmxf3/5zH9BF1oEhXb/s7W
 UiU3S+qVMP+0urSOAy2YZRsD/0hb/AKI8KAzCBphcgSmfSi9DA2GTJc8JcY8gDj9eNOBd5wEcPzTx
 jVYAKk3Ju+uB1ijuZAqYH98LWTai08vGpPgAqDvtXTrUMcIjBZ9R7l1A3OKZ4aK/kr2FcoHieJxe+
 hzB7TRyW5Z5qSuny1iKM1z8P9SsSLfwosdxFRA2jx+JIoMepYfyjGyu72Kkcw+uAdsPkI7xl7z0vb
 rw7Z9MGoYalV/nEQPoGiUk/RPsGbvMcWu3SMI6up0h/QgcDADiE4AaDRJHSmERQzjcqGRD8tXj9yN
 pcjpwiqQ==;
Received: from 179-125-91-67-dinamico.pombonet.net.br ([179.125.91.67]
 helo=[127.0.0.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vzffy-00CBr7-Rg; Mon, 09 Mar 2026 19:49:59 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Mon, 09 Mar 2026 15:49:52 -0300
Subject: [PATCH] drm/ttm: document that ttm_bo_swapout deals with pages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-ttm_bo_swapout_doc-v1-1-eeb08176a00b@igalia.com>
X-B4-Tracking: v=1; b=H4sIAE8Wr2kC/x3MSwqAIBRA0a3EGyeYkVBbiRA/z3qDMtQ+EO09a
 XgG9z6QMBImGKoHIp6UKGwFTV2BXfQ2IyNXDIILyVves5xXZYJKl97DkZULlhlh0VvXoRQGSrh
 H9HT/03F63w/8hvykZAAAAA==
X-Change-ID: 20260309-ttm_bo_swapout_doc-b2cefcd5e62b
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2
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
X-Rspamd-Queue-Id: F169E23ED69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.435];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Both the target parameter and return value of ttm_bo_swapout deal with
pages, not bytes.

Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0765d69423d2f4028bf2effd21af53e117ee7a29..839ceb31135bc8e552f9add1357a64c6774aeee6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1210,9 +1210,9 @@ const struct ttm_lru_walk_ops ttm_swap_ops = {
  * @man: The resource manager whose resources / buffer objects are
  * goint to be swapped out.
  * @gfp_flags: The gfp flags used for shmem page allocations.
- * @target: The desired number of bytes to swap out.
+ * @target: The desired number of pages to swap out.
  *
- * Return: The number of bytes actually swapped out, or negative error code
+ * Return: The number of pages actually swapped out, or negative error code
  * on error.
  */
 s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260309-ttm_bo_swapout_doc-b2cefcd5e62b

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

