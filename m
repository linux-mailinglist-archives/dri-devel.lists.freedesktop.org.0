Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678DEBC2144
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC7C10E1C3;
	Tue,  7 Oct 2025 16:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="38CGOve4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2DC10E1C3;
 Tue,  7 Oct 2025 16:17:33 +0000 (UTC)
Received: from homelab ([58.82.196.128]) (authenticated bits=0)
 by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 597GHFhK1883936
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 8 Oct 2025 00:17:24 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1759853845; cv=none;
 b=g2O6RbwQmczahLkXKrHwGibNRFNhUAf9LaW8iLX+jepb/f/Z4lrGcP5uXHBqnmqo9efL+ZdsGMkqAZQDzdg2TSxpf9g3jVUE9qHHYhue3Jmx9NLJ6aEHJVTlM/7RJQZMjbjfOFMMXJEu3QkVJHKKBYsy2asALT8BiDpetNTPijw=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
 t=1759853845; c=relaxed/relaxed;
 bh=24DsaxGYM2c65pUUHqLrjY0RrgMH0pttOAS/k9JF3RU=;
 h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
 b=jmgP7+3Qp3OQ+DiOfFK8nbhMxMfT7kVfeHrR2f39rqcNbGfYsgzUCqANmUbr/6OYnRUzbFqgOGpYInwbYljKP0jMbJ9DxmgngBY6Few6oyh6T1HNkYBNViX1Ys7E31Jfwtmc3HxUK5nqpbV8JhI7ZyWC702KVNqGPTnTVkzxQC4=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
 s=cseusthk; t=1759853845;
 bh=24DsaxGYM2c65pUUHqLrjY0RrgMH0pttOAS/k9JF3RU=;
 h=Date:From:To:Cc:Subject:From;
 b=38CGOve42jDY+Z9Qk/jeA3D4UncmB8zjjVtZeIOcGI2bjkuoLEhq56o6D9LV7tvZq
 OEtW++LVhGF8E+4L8ra9vuX50JV/g5ZGjCVH1vVy6uFUBDZqhTZRH//r6muHOXDoya
 PFnHumP/aKdMZ6FCLres6BSyvCTtGUYOotPNYI/I=
Date: Wed, 8 Oct 2025 00:17:09 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: fix bad ret code in nouveau_bo_move_prep
Message-ID: <aOU9BXjYDNoPRQmf@homelab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Env-From: sfual
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

In `nouveau_bo_move_prep`, if `nouveau_mem_map` fails, an error code
should be returned. Currently, it returns zero even if vmm addr is not
correctly mapped.

Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
Fixes: 9ce523cc3bf2 ("drm/nouveau: separate buffer object backing memory from nvkm structures")
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index b96f0555ca14..f26562eafffc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -929,7 +929,7 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
 		nvif_vmm_put(vmm, &old_mem->vma[1]);
 		nvif_vmm_put(vmm, &old_mem->vma[0]);
 	}
-	return 0;
+	return ret;
 }
 
 static int
-- 
2.39.5

