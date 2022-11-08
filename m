Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6500C621B3A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6E110E4F3;
	Tue,  8 Nov 2022 17:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0BA10E4E9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ukvrU4BRwqv/hi5Lb7tXJdxSLVociGC6eZ07IJrOiWk=; b=qwnYcD7/yDMEdogFwt4kmfJ7RC
 isnolX2gNmqTtIvI30j0dAzZ0o+jKxkr2PwN3KWbziKiPJmiuXLSHaEcbtPlUX7a1hvQlCZCFZ/VQ
 S9JBnxjOVY5QCpObtqQ0Nx0twHYNZJomXyotVgYqdB3MTHV4/dVlm/DomTXkv4okcQP5X39SstZIl
 cV+V+GIvtH+rUgAVwxu/aLNlcSR1HIMV6nIOwDAAPWjB3Mn/fUER2n2R5/tYmF5hPf//HDvuLrc/7
 DDXmJnepWBKtzAJ6g+PNLpHJiWQy7Fi32ghmYjvpgYkeFq1xY3+45LwlmBAg0z3bkbmNsCP2NPEYj
 bVq4ydIw==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osSo5-00EVxA-ED; Tue, 08 Nov 2022 18:54:42 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/v3d: add missing mutex_destroy
Date: Tue,  8 Nov 2022 14:54:25 -0300
Message-Id: <20221108175425.39819-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108175425.39819-1-mcanal@igalia.com>
References: <20221108175425.39819-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Juan A . Suarez" <jasuarez@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3d_perfmon_open_file() instantiates a mutex for a particular file
instance, but it never destroys it by calling mutex_destroy() in
v3d_perfmon_close_file().

Similarly, v3d_perfmon_create_ioctl() instantiates a mutex for a
particular perfmon, but it never destroys it by calling mutex_destroy()
in v3d_perfmon_destroy_ioctl().

So, add the missing mutex_destroy on both cases.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/v3d/v3d_perfmon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 48aaaa972c49..e1be7368b87d 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -17,8 +17,10 @@ void v3d_perfmon_get(struct v3d_perfmon *perfmon)
 
 void v3d_perfmon_put(struct v3d_perfmon *perfmon)
 {
-	if (perfmon && refcount_dec_and_test(&perfmon->refcnt))
+	if (perfmon && refcount_dec_and_test(&perfmon->refcnt)) {
+		mutex_destroy(&perfmon->lock);
 		kfree(perfmon);
+	}
 }
 
 void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon *perfmon)
@@ -113,6 +115,7 @@ void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
 	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del, NULL);
 	idr_destroy(&v3d_priv->perfmon.idr);
 	mutex_unlock(&v3d_priv->perfmon.lock);
+	mutex_destroy(&v3d_priv->perfmon.lock);
 }
 
 int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
@@ -154,6 +157,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 	mutex_unlock(&v3d_priv->perfmon.lock);
 
 	if (ret < 0) {
+		mutex_destroy(&perfmon->lock);
 		kfree(perfmon);
 		return ret;
 	}
-- 
2.38.1

