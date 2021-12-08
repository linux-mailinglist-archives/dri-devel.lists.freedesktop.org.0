Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC246C98F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 01:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA4D6E10A;
	Wed,  8 Dec 2021 00:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9716E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 00:47:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u1so1073207wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 16:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/6CGinnKVmUuoVA3pKZ20f8NcVvDMutyfWlopXEN/60=;
 b=Ix0NTO76N4qPYCiIqjTTs9VBzmNnSsCvFmyO5+o6P4ccazYpYPJbD4jFAQ7wI4ldhN
 3uaQ6KCDX8tzFpQoa7vM7ph3oIMJVoJ731x9FtUKHlXhNQr29rrAKqw2DH6N9VGVLMJh
 iyo01bWH6YPNIW1kL+AgE2YgUHhsorPr7lbBUkyRiPyUDnptoJmxUCeOQL1j1TNvct+I
 dRuDcwHoP/rGH+e6c7PX7/JjyskJ8/RnJK6JTzrJqcZmUBdNs0WYX14TUBfmLs+Njuh/
 5woKf/NwWNmG/FOFv05zNmSMdGWfoCBsYmOOpq2jE2PAeHvxch13cPlc4unqSPQVd9mj
 wa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/6CGinnKVmUuoVA3pKZ20f8NcVvDMutyfWlopXEN/60=;
 b=FfG5PyRHGclTUzxbofoMuwEHNcC6bvfnzU5l3CHGw63h4d2azL9KumhxEfeqOH4sFq
 sKhHP4slbVZlH6CfvomHb26Tih12DADZCOKidXvnzqCF0ioIl7gclFQYbHyBNbfRQl+e
 +Gv1ie4g9POihOUNnG2X0vXBMbHf2y8QaH3Hf+FMHo0VPL8G6Uy9oJpUdAROahhu4sco
 1CPh11a3GJfg30j9+h6bgAyrckcJbkDlE6TYOOX7m3wBN/3+om/hT5HGCM3dRGrEglI8
 dQzSN6GWCznetRRBRxrGUOelHoVzlT2dzBO3oF1Rb3Y/gaSyLWQhO+gTjj/fZRFGuNSw
 gmxg==
X-Gm-Message-State: AOAM531iLQ/bg7gJ0AiUAWAM3nqwIp5PuwL1OBD1gQ8A4UEYFcLi+3IY
 6TOdC+5kQcddW+XgxcXZnDx5IkgzCA8SWQ==
X-Google-Smtp-Source: ABdhPJzlcP4pjEsfRhI3q7z7FSS1YHt6FMAJtfBSsExeJFTKlSwyVEcKxpWdtBZM54rwWW/yq2BOdQ==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr54922763wro.609.1638924449714; 
 Tue, 07 Dec 2021 16:47:29 -0800 (PST)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id n184sm4190617wme.2.2021.12.07.16.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 16:47:29 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/syncobj: Deal with signalled fences in
 drm_syncobj_find_fence.
Date: Wed,  8 Dec 2021 01:47:26 +0100
Message-Id: <20211208004726.4136-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, christian.koenig@amd.com,
 lionel.g.landwerlin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence_chain_find_seqno only ever returns the top fence in the
chain or an unsignalled fence. Hence if we request a seqno that
is already signalled it returns a NULL fence. Some callers are
not prepared to handle this, like the syncobj transfer functions
for example.

This behavior is "new" with timeline syncobj and it looks like
not all callers were updated. To fix this behavior make sure
that a successful drm_sync_find_fence always returns a non-NULL
fence.

v2: Move the fix to drm_syncobj_find_fence from the transfer
    functions.

Fixes: ea569910cbab ("drm/syncobj: add transition iotcls between binary and timeline v2")
Cc: stable@vger.kernel.org
Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/drm_syncobj.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index fdd2ec87cdd1..e772ca3e1e13 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -404,8 +404,17 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 
 	if (*fence) {
 		ret = dma_fence_chain_find_seqno(fence, point);
-		if (!ret)
+		if (!ret) {
+			/* If the requested seqno is already signaled
+			 * drm_syncobj_find_fence may return a NULL
+			 * fence. To make sure the recipient gets
+			 * signalled, use a new fence instead.
+			 */
+			if (!*fence)
+				*fence = dma_fence_get_stub();
+
 			goto out;
+		}
 		dma_fence_put(*fence);
 	} else {
 		ret = -EINVAL;
@@ -861,6 +870,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 				     &fence);
 	if (ret)
 		goto err;
+
 	chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
 	if (!chain) {
 		ret = -ENOMEM;
@@ -890,6 +900,7 @@ drm_syncobj_transfer_to_binary(struct drm_file *file_private,
 				     args->src_point, args->flags, &fence);
 	if (ret)
 		goto err;
+
 	drm_syncobj_replace_fence(binary_syncobj, fence);
 	dma_fence_put(fence);
 err:
-- 
2.34.1

