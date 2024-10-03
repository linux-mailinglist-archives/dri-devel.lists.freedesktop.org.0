Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D798F194
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638110E866;
	Thu,  3 Oct 2024 14:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FzzZB/jE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7FC10E866
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727966220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VeyIJxw7aNdnhQcgAthWMhSN6IB9NSiqC9XEuzUPS94=;
 b=FzzZB/jEQMFzIQotw7vpSOB2bEaVdJgcl2zbt1sXoxHgVfBTQKH0ZNFdlnaK2kKa2Sd2rW
 NRIw4b2juJArNB8VeSwlsisn91uCI370BGqP+PMEoJ8EsPhqnFMPuoY3YEBlISOgynyrAE
 SSY8sn770fF0Yx6n9Co1ZMkww1r0qbE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-IXatcD54P2GLS6cLQmoyGw-1; Thu,
 03 Oct 2024 10:36:57 -0400
X-MC-Unique: IXatcD54P2GLS6cLQmoyGw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E64719772F9; Thu,  3 Oct 2024 14:36:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.112])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2AC161955F41; Thu,  3 Oct 2024 14:36:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.12 regression fix 2/2] drm/radeon: Revert: "use GEM
 references instead of TTMs"
Date: Thu,  3 Oct 2024 16:36:40 +0200
Message-ID: <20241003143640.14932-3-hdegoede@redhat.com>
In-Reply-To: <20241003143640.14932-1-hdegoede@redhat.com>
References: <20241003143640.14932-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Commit fd69ef05029f ("drm/radeon: use GEM references instead of TTMs")
causes a black screen at boot instead of showing the GDM login screen
(the system is still alive).

dmesg shows the following oops (abbreviated) when this happens:

[   29.315203] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   29.315209] #PF: supervisor read access in kernel mode
[   29.315213] #PF: error_code(0x0000) - not-present page
[   29.315215] PGD 0 P4D 0
[   29.315220] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   29.315225] CPU: 0 UID: 42 PID: 2253 Comm: Xwayland Tainted: G                   6.12.0-rc1+ #159
[   29.315232] Hardware name: Micro-Star International Co., Ltd. MS-7C95/B550M PRO-VDH WIFI (MS-7C95), BIOS 2.L0 07/18/2024
[   29.315234] RIP: 0010:drm_gem_object_free+0xc/0x20
[   29.315272] Call Trace:
[   29.315274]  <TASK>
[   29.315305]  ? asm_exc_page_fault+0x22/0x30
[   29.315315]  ? drm_gem_object_free+0xc/0x20
[   29.315320]  radeon_bo_unref+0x50/0x60 [radeon]
[   29.315337]  radeon_vm_fini+0x1ca/0x350 [radeon]
[   29.315356]  radeon_driver_postclose_kms+0x16d/0x180 [radeon]
[   29.315370]  drm_file_free+0x229/0x280
[   29.315377]  drm_release+0x5f/0xe0
[   29.315381]  __fput+0xfc/0x2c0

Revert the change to restore things back to working order.

Fixes: fd69ef05029f ("drm/radeon: use GEM references instead of TTMs")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 9735f4968b86..210e8d43bb23 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
 
 	if (robj) {
 		radeon_mn_unregister(robj);
-		ttm_bo_put(&robj->tbo);
+		radeon_bo_unref(&robj);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index d0e4b43d155c..450ff7daa46c 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -256,15 +256,18 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo *bo)
 	if (bo == NULL)
 		return NULL;
 
-	drm_gem_object_get(&bo->tbo.base);
+	ttm_bo_get(&bo->tbo);
 	return bo;
 }
 
 void radeon_bo_unref(struct radeon_bo **bo)
 {
+	struct ttm_buffer_object *tbo;
+
 	if ((*bo) == NULL)
 		return;
-	drm_gem_object_put(&(*bo)->tbo.base);
+	tbo = &((*bo)->tbo);
+	ttm_bo_put(tbo);
 	*bo = NULL;
 }
 
-- 
2.46.2

