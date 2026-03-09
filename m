Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNZfAUbsrmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C743C23C142
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C450510E562;
	Mon,  9 Mar 2026 15:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="JJEv5nsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 627 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2026 02:35:30 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEC610E22A;
 Mon,  9 Mar 2026 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ti
 SMxkVGdwISC2XAVkS89dpe+kuedJ/12+uHTMAKZHI=; b=JJEv5nsBjIeg9aIDXP
 SqLOeMQoiFVvGsO+2GliiLj8t13zWQdIkaeuagI0zvaE6HfrrRhiy6CYZVeSRcha
 6x6VkCxHnNTTsNXPiuXLtqdw5mXSDeNag+lbH2hY+Zx37wzmK+z3DsRPu4nPw5BX
 ncHK/z1VCBlMPJCi0AQV5zqFQ=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wDXV5TmLq5pRMZoPg--.11725S4; 
 Mon, 09 Mar 2026 10:22:37 +0800 (CST)
From: Chenyuan Mi <chenyuan_mi@163.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu: protect queue access in signal IOCTL
Date: Mon,  9 Mar 2026 10:22:29 +0800
Message-ID: <20260309022229.63071-3-chenyuan_mi@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309022229.63071-1-chenyuan_mi@163.com>
References: <20260309022229.63071-1-chenyuan_mi@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXV5TmLq5pRMZoPg--.11725S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWrWFW5Jw1UWF1kXr1kZrb_yoW5JFW3pr
 4rGry3Kr18ur4I9a47J3W7WFs7Ka1xXFWrKr4xA34aqw45A3s0vry7KrWDXF4xCrsFkFZF
 qry8ZrWFyFn0qw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jg-B_UUUUU=
X-Originating-IP: [124.70.231.40]
X-CM-SenderInfo: xfkh055xdqszrl6rljoofrz/xtbC9Q3M32muLu0hAQAA3P
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
X-Rspamd-Queue-Id: C743C23C142
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

amdgpu_userq_signal_ioctl() retrieves the user queue via xa_load()
and then dereferences it in amdgpu_userq_fence_read_wptr(),
amdgpu_userq_fence_create(), and direct queue->last_fence accesses,
all before userq_mutex is acquired by amdgpu_userq_ensure_ev_fence().

A concurrent AMDGPU_USERQ_OP_FREE can destroy and free the queue
in this window, leading to a use-after-free.

This bug predates the queue-id wait ioctl changes and has been
present since the original signal/wait ioctl implementation.

Fix this by moving amdgpu_userq_ensure_ev_fence() before xa_load()
so that the queue lookup and all subsequent accesses are performed
under the userq_mutex that ensure_ev_fence acquires. Add the
necessary mutex_unlock() calls to the error paths between the moved
ensure_ev_fence and the existing unlock.

Fixes: a292fdecd728 ("drm/amdgpu: Implement userqueue signal/wait IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Chenyuan Mi <chenyuan_mi@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 1785ea7c18fe..7866f583eea4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -545,23 +545,28 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	/* Retrieve the user queue */
+	/* We are here means UQ is active, make sure the eviction fence is valid */
+	amdgpu_userq_ensure_ev_fence(&fpriv->userq_mgr, &fpriv->evf_mgr);
+
+	/* Retrieve the user queue under userq_mutex (held by ensure_ev_fence) */
 	queue = xa_load(&userq_mgr->userq_xa, args->queue_id);
 	if (!queue) {
+		mutex_unlock(&userq_mgr->userq_mutex);
 		r = -ENOENT;
 		goto put_gobj_write;
 	}
 
 	r = amdgpu_userq_fence_read_wptr(adev, queue, &wptr);
-	if (r)
+	if (r) {
+		mutex_unlock(&userq_mgr->userq_mutex);
 		goto put_gobj_write;
+	}
 
 	r = amdgpu_userq_fence_alloc(&userq_fence);
-	if (r)
+	if (r) {
+		mutex_unlock(&userq_mgr->userq_mutex);
 		goto put_gobj_write;
-
-	/* We are here means UQ is active, make sure the eviction fence is valid */
-	amdgpu_userq_ensure_ev_fence(&fpriv->userq_mgr, &fpriv->evf_mgr);
+	}
 
 	/* Create a new fence */
 	r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
-- 
2.53.0

