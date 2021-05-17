Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E83827C1
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBC96E916;
	Mon, 17 May 2021 09:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9E36E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:50:07 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gm21so3267491pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKA9Lq7F5k724FAHbuDMO4AjJLs4UEoXSobW6uS3iN8=;
 b=t2YMHiXTujCsZzZ8ubpqjFkuTQysgBWBBbLhoSrdwjnroxul6X35V35aXuIXOIcSdS
 IMqDXOrsh/eM84/TjcZ81i8IKsjAqYFa+twqx0XxPp9N8URQvYnohJfblZ+4ChWUZz7o
 WAmwRXdmqsFJosZd7rfLxa2F3dABRIIFAre8KxtjLtELvkru1C85pi5ZLMlGqzdJNE5m
 57qblPqAsS19l6V9B7+U2qpcYB50z0+MguM796YAo8RnMqf6OABWndw9XCT1c9sRyVCF
 9jVhA1tUhWPTV/kdFD1wuWn/93b3g/50fzzUEqpaGJu526tH/ftT//7wo21kw1KvV/9V
 vPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKA9Lq7F5k724FAHbuDMO4AjJLs4UEoXSobW6uS3iN8=;
 b=bgWoAbCJy6CEcAQ3w/Asykue8l3yL3MyozOTsNXYrpEaD8v6S4fLdawlJzxK4zQnSb
 X7unkBcm+e8eoX+Un2abpbeQxrGoFLof5ACWyK0e97Jx9wKnAKUbS4TQiRSTKlVPAySb
 qNY182rlF7rzEgpgTd5XduDd0FIPgdhS23MX1DAG48yQJHc33mp7L69qAkUlx9nNksQ0
 BmQnBppj44E4n315vrnQLldLvyfksObAI/KYRKc8k5tZ7JDVsyt3m2o+3tR6sCTTfLUZ
 Q5Rdc9sS79NyI1OGyA6bphPyVOL9bwNLn1eAd/NgYYZUq22/Lb/czhK+vi6ruCgpqL+s
 L7Dw==
X-Gm-Message-State: AOAM533ZrXpxFpP2Kh+xqHbIGLJZK4O6fU50Ov5ub+mkTx5A7RSV8j4u
 hvSewta1bI99WhGUU8ZMA4Ca
X-Google-Smtp-Source: ABdhPJzeZ+PN803ZZZF5ioiXzY50WxszAcrlC3DSBeSR4UbUcdaLrWdgYVpLRaul7Pq1NpT4WfcOYQ==
X-Received: by 2002:a17:902:724a:b029:ec:e4bd:fac2 with SMTP id
 c10-20020a170902724ab02900ece4bdfac2mr59369624pll.73.1621241407554; 
 Mon, 17 May 2021 01:50:07 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id 202sm10337428pgg.59.2021.05.17.01.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:50:07 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: airlied@linux.ie,
	kraxel@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 2/3] drm/virtio: Fix double free on probe failure
Date: Mon, 17 May 2021 16:49:12 +0800
Message-Id: <20210517084913.403-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517084913.403-1-xieyongji@bytedance.com>
References: <20210517084913.403-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 May 2021 09:04:21 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The virtio_gpu_init() will free vgdev and vgdev->vbufs on failure.
But such failure will be caught by virtio_gpu_probe() and then
virtio_gpu_release() will be called to do some cleanup which
will free vgdev and vgdev->vbufs again. So let's set dev->dev_private
to NULL to avoid double free.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index aa532ad31a23..f3379059f324 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -234,6 +234,7 @@ int virtio_gpu_init(struct drm_device *dev)
 err_vbufs:
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 err_vqs:
+	dev->dev_private = NULL;
 	kfree(vgdev);
 	return ret;
 }
-- 
2.11.0

