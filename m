Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99D2FE520
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDBD6E52A;
	Thu, 21 Jan 2021 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 990 seconds by postgrey-1.36 at gabe;
 Tue, 19 Jan 2021 12:30:46 UTC
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640336E270
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=NZGos6Tvdki8RvSsBC
 WBQtx4tZjAg15U+vqKeffYzIs=; b=dwqHWTSGSeBY5Z/bQgNoIa1lLHhORcmc5t
 /QqU6WhWpS4P0Ry/9ydZDDtxgRoR1FjdaslcBvVrjH/OIee54x3t+DPG+Brxt+lG
 q05QqVatIaEF1UuG8OnPuo4x1p1nEKIMPkvKdEQrei6KKviueozVgOSffCFkQGDv
 qU2ToxEBI=
Received: from localhost.localdomain (unknown [119.3.119.20])
 by smtp9 (Coremail) with SMTP id DcCowACXmpJyzAZgi+pLbg--.38347S4;
 Tue, 19 Jan 2021 20:11:34 +0800 (CST)
From: Pan Bian <bianpan2016@163.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 1/1] drm/atomic: put state on error path
Date: Tue, 19 Jan 2021 04:11:27 -0800
Message-Id: <20210119121127.84127-1-bianpan2016@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DcCowACXmpJyzAZgi+pLbg--.38347S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF15Jw4fXw45Kw4kZrW3Awb_yoW3JFg_CF
 18XFs7KrZak34vvw1Ska1SqFyIkFnrZrs5u3W7tFW3AFn7Wr13K3s0gryrWr1jqr1fJrWD
 Xan2qFyfZryxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5oT5JUUUUU==
X-Originating-IP: [119.3.119.20]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/1tbiDhYfclXly7ZZuQAAsY
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:36:20 +0000
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
Cc: Pan Bian <bianpan2016@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Put the state before returning error code.

Fixes: 44596b8c4750 ("drm/atomic: Unify conflicting encoder handling.")

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ba1507036f26..4a8cbec832bc 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3021,7 +3021,7 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
 
 	ret = handle_conflicting_encoders(state, true);
 	if (ret)
-		return ret;
+		goto fail;
 
 	ret = drm_atomic_commit(state);
 
-- 
2.17.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
