Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D60382BA6
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 13:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F91F6E93D;
	Mon, 17 May 2021 11:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08076E93D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 11:59:48 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso4406150pjx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QlWtfnuOca00MfVWO0P9k8vYMaH+QS6fPyffjiCe0/Y=;
 b=mTUq43MPPJ/c+xNZNdt3a1iSdzJtnYbp1Wby/LtlzyS4dd3DO5tnqAx8fZIy/vsYSQ
 sEDQrwD5926YNrrVaGifBXENezGFSxyoRHB58A90SacWuMzc6scb9vnKMqL7gF4nIEyR
 rF+UmopHwbq8H4WmCvZtO/fxI11ZGTeroxZFlzMfujntSkLXNd0fMl87pKeYeWrAAW5N
 Lt+x9/bYa+xwCcAuj5/88aPRg4qzxdmvrWwwQWuvO8NqLdG1+7BLcq6ximh6eoTJBFAP
 GQr8ZpJvcvOVpDk2jNroKH6s4y0nMN1Xyn2AD6g7q42KYBpfSdpBSy8plTk2ZsRJHPFE
 JHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QlWtfnuOca00MfVWO0P9k8vYMaH+QS6fPyffjiCe0/Y=;
 b=qwCHXt0Rmmx/kmbDwqddQzUuwbo9uwrJcP2S1LHsWrX6RTWUTQQKT5brvf8pcNF7aw
 fkSwuVlYkyzVH5DP2HXjLBEVlcNtU0EdueMh301MbDqwsPg9BIH95C72eoWQZLf4FUg/
 qbYvcBVd+GMpZuWiQicO37kuM5H1W1cQcffxaR24BWsoCppXjSbXKcgGhCIsFX7eNn+5
 AcKI5cacYmSa+FGQEEzDkh2ID41FbZWrfJ4pEnIgDEojm1oJDfPXgkRdj5WIKVYZdAY2
 nsf2Yv/I67kqEoa+wKerKJoGY93XZlY7nxs6Majly/Zrx6Zb14Q28m3ei28ECejDWopi
 NF9g==
X-Gm-Message-State: AOAM533QoU2buzB8SrzhcwxR0UNh0OCNKHl7W3D7FZ+ngx67QYRd50yY
 9EUqdtxWNI45BVWlaOKszmAzq3GfmQ7W9w==
X-Google-Smtp-Source: ABdhPJwCP7o0wwgn45c/6fp08TB49Tc4xmA6HankyathivWYWxsNdCbZ8YjsVBxt70sSkLsKO5vX+g==
X-Received: by 2002:a17:90a:ec03:: with SMTP id
 l3mr4087941pjy.194.1621252788469; 
 Mon, 17 May 2021 04:59:48 -0700 (PDT)
Received: from arch2.localdomain ([106.212.13.216])
 by smtp.gmail.com with ESMTPSA id q24sm10211393pgb.19.2021.05.17.04.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:59:48 -0700 (PDT)
From: Deepak Rawat <drawat.floss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH v4 2/3] drm/hyperv: Handle feature change message from device
Date: Mon, 17 May 2021 04:59:21 -0700
Message-Id: <20210517115922.8033-2-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517115922.8033-1-drawat.floss@gmail.com>
References: <20210517115922.8033-1-drawat.floss@gmail.com>
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
Cc: Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Virtual device inform if screen update is needed or not with
SYNTHVID_FEATURE_CHANGE message. Handle this message to set dirt_needed
flag.

Suggested-by: Dexuan Cui <decui@microsoft.com>
Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm.h       | 1 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c   | 2 ++
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
index e1d1fdea96f2..886add4f9cd0 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm.h
+++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
@@ -29,6 +29,7 @@ struct hyperv_drm_device {
 	struct completion wait;
 	u32 synthvid_version;
 	u32 mmio_megabytes;
+	bool dirt_needed;
 
 	u8 init_buf[VMBUS_MAX_PACKET_SIZE];
 	u8 recv_buf[VMBUS_MAX_PACKET_SIZE];
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 68a6ba91a486..8e6ff86c471a 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -201,6 +201,8 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 	if (ret)
 		drm_warn(dev, "Failed to update vram location.\n");
 
+	hv->dirt_needed = true;
+
 	ret = hyperv_mode_config_init(hv);
 	if (ret)
 		goto err_vmbus_close;
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
index 700870b243fe..6fff24b40974 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
@@ -301,8 +301,12 @@ int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
 
 int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect)
 {
+	struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
 	struct synthvid_msg msg;
 
+	if (!hv->dirt_needed)
+		return 0;
+
 	memset(&msg, 0, sizeof(struct synthvid_msg));
 
 	msg.vid_hdr.type = SYNTHVID_DIRT;
@@ -387,6 +391,9 @@ static void hyperv_receive_sub(struct hv_device *hdev)
 		complete(&hv->wait);
 		return;
 	}
+
+	if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE)
+		hv->dirt_needed = msg->feature_chg.is_dirt_needed;
 }
 
 static void hyperv_receive(void *ctx)
-- 
2.31.1

