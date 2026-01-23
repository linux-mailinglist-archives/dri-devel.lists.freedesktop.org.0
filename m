Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPxEDpeCc2kDxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:15:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6076D61
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D220C10EAFA;
	Fri, 23 Jan 2026 14:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lR4UJeYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054C210EAFA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fb49Dt8p/6xXhPsZoM6WvTUAvHPfrma6obVZtWY6YE0=; b=lR4UJeYQxhEkw6KqO2l3U1KcAu
 t6EFjhpEjtwpVmXtl51LzDIRlVGzP6V2WScmabgu6OGTK8FIMP4479eqVW+iyKRoH4BX0hP0wgRQT
 ZpLchY7jfCy0PSDI84FlSTqYVsQkNfOQ/tSt+2kwAwsseh96EakUk1TLbe5bScj9HCLlzzKxJ27vV
 3aM8HSKYz7mqBY+VE4hMSb2ZPqE+3ZsdBKgXneHxET6OK1STT21gXrJtxtXxRSDUqXz7J0MmQxhR4
 bByQgK6TfmvhkxkladRAZMoPOv5nxvjX2JSKq7gCOi/87eofolw+AqtoYhWztL4g3Mi0T4VHLNH6Q
 tQiLHi7g==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vjHws-008vKz-Ge; Fri, 23 Jan 2026 15:15:42 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Zhi Wang <wangzhi@stu.xidian.edu.cn>,
 David Francis <David.Francis@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm: Do not allow userspace to trigger kernel warnings in
 drm_gem_change_handle_ioctl()
Date: Fri, 23 Jan 2026 14:15:40 +0000
Message-ID: <20260123141540.76540-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
References: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xidian.edu.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 83D6076D61
X-Rspamd-Action: no action

Since GEM bo handles are u32 in the uapi and the internal implementation
uses idr_alloc() which uses int ranges, passing a new handle larger than
INT_MAX trivially triggers a kernel warning:

idr_alloc():
...
	if (WARN_ON_ONCE(start < 0))
		return -EINVAL;
...

Fix it by rejecting new handles above INT_MAX and at the same time make
the end limit calculation more obvious by moving into int domain.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>
Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
Cc: David Francis <David.Francis@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org> # v6.18+
---
v2:
 * Rename local variable, re-position comment, drop the else block. (Christian)
 * Use local at more places.
---
 drivers/gpu/drm/drm_gem.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7ff6b7bbeb73..ffa7852c8f6c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1001,16 +1001,21 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_gem_change_handle *args = data;
 	struct drm_gem_object *obj;
-	int ret;
+	int handle, ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_GEM))
 		return -EOPNOTSUPP;
 
+	/* idr_alloc() limitation. */
+	if (args->new_handle > INT_MAX)
+		return -EINVAL;
+	handle = args->new_handle;
+
 	obj = drm_gem_object_lookup(file_priv, args->handle);
 	if (!obj)
 		return -ENOENT;
 
-	if (args->handle == args->new_handle) {
+	if (args->handle == handle) {
 		ret = 0;
 		goto out;
 	}
@@ -1018,18 +1023,19 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 	mutex_lock(&file_priv->prime.lock);
 
 	spin_lock(&file_priv->table_lock);
-	ret = idr_alloc(&file_priv->object_idr, obj,
-		args->new_handle, args->new_handle + 1, GFP_NOWAIT);
+	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
+			GFP_NOWAIT);
 	spin_unlock(&file_priv->table_lock);
 
 	if (ret < 0)
 		goto out_unlock;
 
 	if (obj->dma_buf) {
-		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
+		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
+					       handle);
 		if (ret < 0) {
 			spin_lock(&file_priv->table_lock);
-			idr_remove(&file_priv->object_idr, args->new_handle);
+			idr_remove(&file_priv->object_idr, handle);
 			spin_unlock(&file_priv->table_lock);
 			goto out_unlock;
 		}
-- 
2.52.0

