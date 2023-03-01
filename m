Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CE6A708B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 17:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB0710E337;
	Wed,  1 Mar 2023 16:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D39510E2F1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 16:07:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5015321AA5;
 Wed,  1 Mar 2023 16:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677686870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Kdi6zctTG29VP7go0XhIdHEXV0Bg4j60NjAzu8YoBuQ=;
 b=D5thmDMsEGBHdEhY0SrJUMQZ4mg1qGEsuoEgiQh9nyRhEAtT8seMYtRK2JvzgL5a+yhOPI
 AZjnwjmdHIP4HLp1jz35QbvekeXJg5kJT1xgpnJD3Xs/vhamDZqTJwxbkF7ewjGH8KO03V
 +zMweIg02JPJe+g6+oha3Qhrc4QDLpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677686870;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Kdi6zctTG29VP7go0XhIdHEXV0Bg4j60NjAzu8YoBuQ=;
 b=wZS86/BPsynFyeihQe1l47MLZrQH1Gmqnhn4aBquQ3roNBaN4E3s/oAcDzKNCs0MTMR5WW
 s+aQ+GhPoJYGxgAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 110F013A3E;
 Wed,  1 Mar 2023 16:07:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K/0vA1Z4/2OqcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Mar 2023 16:07:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Avoid NULL-ptr dereference in
 vmw_cmd_dx_define_query()
Date: Wed,  1 Mar 2023 17:07:48 +0100
Message-Id: <20230301160748.20775-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
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
Cc: stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There have been reports [1][2] that vmw_cmd_dx_define_query() can
be called with ctx_node->ctx set to NULL, which results in undefined
behavior in vmw_context_cotable(). Avoid this be returning an errno
code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://www.cve.org/CVERecord?id=CVE-2022-38096 # 1
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2073 # 2
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 6b9aa2b4ef54..1e90362add96 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1256,7 +1256,7 @@ static int vmw_cmd_dx_define_query(struct vmw_private *dev_priv,
 	struct vmw_resource *cotable_res;
 	int ret;
 
-	if (!ctx_node)
+	if (!ctx_node || !ctx_node->ctx)
 		return -EINVAL;
 
 	cmd = container_of(header, typeof(*cmd), header);
-- 
2.39.2

