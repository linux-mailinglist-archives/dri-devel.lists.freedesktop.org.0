Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C3A74D3B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11E10EA44;
	Fri, 28 Mar 2025 14:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f8X3+SDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0212A10EA43;
 Fri, 28 Mar 2025 14:56:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABDFF5C64E9;
 Fri, 28 Mar 2025 14:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889E4C4CEE4;
 Fri, 28 Mar 2025 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743173788;
 bh=lSjBRuGPYK0JKv06whQALWhLO84ENRlVPpECtO0w/dY=;
 h=Date:From:To:Cc:Subject:From;
 b=f8X3+SDfkTTXgQd9yE0i05TbLTXzxg9CqLNviHW1Bw1UGyPNXnFr8h/2ZqYfQdKuI
 Idh5YqJGJywZpHkYPV9vogfy9Z/+tpg7y1wE0hQjkaAJ36N8xoYRRxBrfHW8Zth2da
 mZb/LN3AJDDNeWUCaRZt/TMRxoNKaZXrwAquxfoCXDvwAI9p9haMKdWVPmMsn02tlI
 qHWZasLJJqU58WgDBilMOumWKfavakAloP7ifkFPc7wjC85BUCQvFbMKVjLfFKcoIb
 6IVlbTW5EjaNkNpDdAjKMAcq7alX/vpwCBnsXg+OWrqTflTpmiO9+Mw1122zj30ABk
 bhQYcTYw9KqNQ==
Date: Fri, 28 Mar 2025 08:56:25 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/conn: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <Z-a4meHAy-t58bcE@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/gpu/drm/nouveau/nvif/conn.c:34:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nvif/conn.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index 9ee18cb99264..5a1a83c62a2a 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -30,17 +30,17 @@ int
 nvif_conn_event_ctor(struct nvif_conn *conn, const char *name, nvif_event_func func, u8 types,
 		     struct nvif_event *event)
 {
-	struct {
-		struct nvif_event_v0 base;
-		struct nvif_conn_event_v0 conn;
-	} args;
+	DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
+			sizeof(struct nvif_conn_event_v0));
+	struct nvif_conn_event_v0 *args_conn =
+				(struct nvif_conn_event_v0 *)args->data;
 	int ret;
 
-	args.conn.version = 0;
-	args.conn.types = types;
+	args_conn->version = 0;
+	args_conn->types = types;
 
 	ret = nvif_event_ctor_(&conn->object, name ?: "nvifConnHpd", nvif_conn_id(conn),
-			       func, true, &args.base, sizeof(args), false, event);
+			       func, true, args, __struct_size(args), false, event);
 	NVIF_DEBUG(&conn->object, "[NEW EVENT:HPD types:%02x]", types);
 	return ret;
 }
-- 
2.43.0

