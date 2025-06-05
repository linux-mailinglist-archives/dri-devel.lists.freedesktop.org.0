Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E8ACF781
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5260910E33C;
	Thu,  5 Jun 2025 18:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jmH0cKtc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 920 seconds by postgrey-1.36 at gabe;
 Thu, 05 Jun 2025 12:17:54 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07C1210E0B5;
 Thu,  5 Jun 2025 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=97
 SPQovFI1r29DqJeMBUwPuY8N3trv6H1t1q8FpPIlQ=; b=jmH0cKtcK5mHrtFwwY
 7xHEowa7A98W84PAQ0HY0aRRTZULhYwia+5cQGNp3s2hUsn8FUUEB5KSptVR5wya
 F6HWuPePuQoo+N5MU4fLEOWkl9Jh484Ip46qNRwVePzl600Dwh2h2PISrD1cBwq9
 4tDFP7xJm72NfFSeKFQGYxSfk=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3n7pOh0FoP_+gGA--.5060S2; 
 Thu, 05 Jun 2025 20:02:23 +0800 (CST)
From: luoqing <l1138897701@163.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, luoqing@kylinos.cn
Subject: [PATCH 2/2] drm/amd/display: ZERO_OR_NULL_PTR Macro overdetection
Date: Thu,  5 Jun 2025 20:02:22 +0800
Message-Id: <20250605120222.803462-1-l1138897701@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n7pOh0FoP_+gGA--.5060S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1ktr4kCFWDCr45tr47Jwb_yoW8AFWDpr
 4rJry5Xw1UZF12q347JF1kuF98K3ZaqFWSkr4jyw1Yq345AFn8J345JFnFqrZrWFWxCaya
 vFZrW3y7Z3Wqvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHT5LUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: jorrjmiyzxliqr6rljoofrz/1tbiEABjRGhBfqzVgQAAsY
X-Mailman-Approved-At: Thu, 05 Jun 2025 18:53:56 +0000
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

From: luoqing <luoqing@kylinos.cn>

sizeof(xx) these variable values' return values cannot be 0.
For memory allocation requests of non-zero length,
there is no need to check other return values;
it is sufficient to only verify that it is not null.

Signed-off-by: luoqing <luoqing@kylinos.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e8bdd7f0c460..518383425c80 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -230,7 +230,7 @@ struct idle_workqueue *idle_create_workqueue(struct amdgpu_device *adev)
 	struct idle_workqueue *idle_work;
 
 	idle_work = kzalloc(sizeof(*idle_work), GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(idle_work))
+	if (!idle_work)
 		return NULL;
 
 	idle_work->dm = &adev->dm;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index c16962256514..1cf2cf7a9a47 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -735,7 +735,7 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev,
 	int i = 0;
 
 	hdcp_work = kcalloc(max_caps, sizeof(*hdcp_work), GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(hdcp_work))
+	if (!hdcp_work)
 		return NULL;
 
 	hdcp_work->srm = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE,
-- 
2.25.1

