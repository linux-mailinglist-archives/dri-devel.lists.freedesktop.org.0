Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A523A4781A2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C34010E299;
	Fri, 17 Dec 2021 00:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F3910E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xJGxstYh658sLcbhjOZMkUVQl2qU4zGeFPPJuAgTKA=;
 b=LJ4ZOj26mkYCFqCbjbzZDx/9a2VLnFGwzD8Acws7kodyiHKdyORN1q1uhKOJezJJy3tvEW
 KAofRU4tgjSj+ycWBE2wdZWXDZ97EtYzLwMAQ+8KxP9Y7O9OgUH22/wXkFYojhn2EzLcoT
 9Lclow662mIOrkdxQN+sPMs1v73DKSI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-N1lPxXcQNdmXMa6K3Glliw-1; Thu, 16 Dec 2021 19:38:27 -0500
X-MC-Unique: N1lPxXcQNdmXMa6K3Glliw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so144008wrc.17
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1xJGxstYh658sLcbhjOZMkUVQl2qU4zGeFPPJuAgTKA=;
 b=hvRoAjTc9z/QroF+D5qs4JyEPLntLJ0t7G+1UKyyyV8EGkndml0CoaY1yNOaJc7pxn
 vEjaUMUJXXQspe1WzwXONAAoj2QMxIiLvYHllSUIZ9Jk5J7Gxv3QtLq1sC3dF64XsQj2
 KMVbLi1gr3VjsTCRAP30/3oAT6aDoAZVO7wwnk3tBS0ntRW4ab8RIvXuc8+kUJWmebC3
 03s/9tfhaV7JKzLrnOmDTOtOsiQXY5jo8C4VmPRcQr8PYpA4sN75f4H2b+KZSFM1cpL0
 RjzsneO74lVYF8sXqnBX/MZazTOYDJ4UzfjNvIvehIWBn6yvTmbnK5fpLS/sNWwoZ0it
 XFPw==
X-Gm-Message-State: AOAM5324kKBWkEIGsKLo0fweBJNrqUhs0KZfb1GbAcmLR9nUJubSuCZK
 gIL7HkJs7xq4SPbIi9f5jA6mDJwRDHadNJTjfQQ8ZBwtp2JPeWLFmExGCI7+1UFspQQ9OBiAVi6
 VP+v2FLXsz5eNoXILX1uB4y+AvgJ7
X-Received: by 2002:a5d:4312:: with SMTP id h18mr381759wrq.626.1639701505826; 
 Thu, 16 Dec 2021 16:38:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEIOm8kdWiRiTiM2JW5349vi2plrCWlI3WzuseYR6JiCR9/kDlRsHPmiv0nYevzGRXYeknBA==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr381745wrq.626.1639701505593; 
 Thu, 16 Dec 2021 16:38:25 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 28/37] drm/mediatek: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:43 +0100
Message-Id: <20211217003752.3946210-29-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index aec39724ebeb..e336358fee20 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -210,6 +210,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	struct device *dma_dev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (!iommu_present(&platform_bus_type))
 		return -EPROBE_DEFER;
 
-- 
2.33.1

