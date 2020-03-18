Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859F1896DC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 09:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3176E879;
	Wed, 18 Mar 2020 08:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176256E282
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 07:53:56 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t3so13216116pgn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ix5gR+5tSADkG65bVowPOhtK65TNERJ9gTTgrdl498s=;
 b=cUv+Wg8jSCf8pGEQXq7PrK6Kkk1wWraRdky+Q9IGdq4hXTb5mT13mvFhkL56wlHJL8
 VQUfXTy0hElD/ymLJ6e8XXLlkbXYXMrnGjTESn7ZJncsdII5q9P9HkC4XZymZhoAiKdO
 zyUrkInXCg9FwLWjuy0VYtljdpNrY6irRxfktuCTcKq8lXn/E/be8hcPQd716X1j4OAH
 IG2hpXtIsuCVgRhrRED+Jl/b8627CkaXWOai4EvoKnTsJse5odgBUoKLY/3jQKjO2dvu
 TFvvUQjxcJVG6YFVZd0aMHxhuAw2Qo4R4HzIcOqkghq+prqZsRt+1L+Ks9hrWz0bCsrS
 jT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ix5gR+5tSADkG65bVowPOhtK65TNERJ9gTTgrdl498s=;
 b=lxgRG/66CjzabrvsBSgo11uUGlReqyfluLZsMCibtK0bjWGOf3zKuDwH7wulOxy9DV
 TZEKLgbuWUTvZV2VzVCKmU3L3nvKG0DWgHPuONGDznVdl0j449gpea9LlexOJqzrfDEE
 5m503A/n/kWHsh3Ao9MmMAXYOP7/jqu77dvoIdQ/LSV0LetwHK/KLDl8nlxjgiorJLc5
 TFa9M4EzEvsjrRcWcjAJtQdqRSf8HVvxssjT65y6HQKF0oQ1q6QGnSjsOeFLkksfK7vs
 jUoo2OOghuzM+xzKe6D7NI1j3hyzhtL6edtpImbHhVvxLDeOJ3cHHXCkSWEN8QXWxQwc
 QPHQ==
X-Gm-Message-State: ANhLgQ2MpkIBjPtSpC/RFdGLQTvAPDt4gKk+Df+1QRzQn+Al0gWX2OGk
 uCmeXk8LkcsVAXaCDI2b3Q0=
X-Google-Smtp-Source: ADFU+vshiSpx2NHtpGATn2PO9MyVUCdUwHWsEwJ3tKMFf6OagvK22K2ivh9NXPoh8qFgR34zHfIlwA==
X-Received: by 2002:a63:b52:: with SMTP id a18mr3361810pgl.130.1584518035689; 
 Wed, 18 Mar 2020 00:53:55 -0700 (PDT)
Received: from VM_0_35_centos.localdomain ([150.109.62.251])
 by smtp.gmail.com with ESMTPSA id j17sm5507117pfd.175.2020.03.18.00.53.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Mar 2020 00:53:55 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: daniel@ffwll.ch
Subject: [PATCH v2] drm/lease: fix WARNING in idr_destroy
Date: Wed, 18 Mar 2020 15:53:50 +0800
Message-Id: <1584518030-4173-1-git-send-email-hqjagain@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:24:31 +0000
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
Cc: anenbupt@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiujun Huang <hqjagain@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_lease_create takes ownership of leases. And leases will be released
by drm_master_put.

drm_master_put
    ->drm_master_destroy
            ->idr_destroy

So we needn't call idr_destroy again.

Reported-and-tested-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/gpu/drm/drm_lease.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index b481caf..825abe3 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -542,10 +542,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	}
 
 	DRM_DEBUG_LEASE("Creating lease\n");
+	/* lessee will take the ownership of leases */
 	lessee = drm_lease_create(lessor, &leases);
 
 	if (IS_ERR(lessee)) {
 		ret = PTR_ERR(lessee);
+		idr_destroy(&leases);
 		goto out_leases;
 	}
 
@@ -580,7 +582,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 
 out_leases:
 	put_unused_fd(fd);
-	idr_destroy(&leases);
 
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
