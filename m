Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BEF474FC8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E3D10E147;
	Wed, 15 Dec 2021 01:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988F10E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0c98FUmzZ3jUKVD5DuVrEWMpnPkezkHOas2PJOy3Zk=;
 b=MbV4Y8EfXfT28tATdWotzkfLA9L1iqYvIdmmDA9ZV4pqRxvjYPQl95GmwMPe1rvHCY2eYS
 Dsm109KnpD4+wvae7ORFlpk3L7c9CtS8FtBr6j1TfnsK6/t4pL75yb+ELgMc4c1YrPIKUq
 VavZ3daIntOhVt0ebYDbtZ8GRvPN0VM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-c3yIJL2zPjatjj9zs0w7sA-1; Tue, 14 Dec 2021 20:01:10 -0500
X-MC-Unique: c3yIJL2zPjatjj9zs0w7sA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so5379251wro.19
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0c98FUmzZ3jUKVD5DuVrEWMpnPkezkHOas2PJOy3Zk=;
 b=QqSWrNWNYvGTAOC298oLnsSKYR/13oLSIb8TWy84B6cQiHQMPfiQ9fRhdVWG/7L0Ow
 a35M/qqPh2ar5MJ5JTZ6ohWYvy0awxXTo3GJcIQ4MqKIz4vT6RWfYesuMHFwLBSLf/kF
 R784Od3rrYgRBbn9DBr3qphyjL0JMG9VQNGQIseZzU5kZiwI1F2kmGfh89B/XJXptYte
 weyVgRV/8oeev8iUNOrXjF6xQL21JsAhAI87gjDebLD6EAUNDq9GeHM6Kc5Wr4ApRaXS
 8y9GuohzggmlcgdLkqbpvP1ehrpntK64+WsqX5DcGHxfbgI4ZUj4UPUk7iLnvl4APiNx
 9VDw==
X-Gm-Message-State: AOAM532zA6+m4MEAzy+OW9m7A44LYeQp9EPPUbk+av3NJ0AiYb8aSBZl
 RZ92wbgJuK0wsvqZlCg4fbAehsMLpMTKvwJpibzB85fUAmuaNAiWQlK+zlomrxhxBVN8gKbfV+6
 jopIida3n3OYbaH8iT5akN8qXVZMz
X-Received: by 2002:adf:a386:: with SMTP id l6mr2088183wrb.505.1639530069307; 
 Tue, 14 Dec 2021 17:01:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUdw+6hFb6bAKvCZiXPJTU8S/eHCzIks+l31gbEogB1i2JCupJbK69RZm8jq89jgVfPqsgSA==
X-Received: by 2002:adf:a386:: with SMTP id l6mr2088172wrb.505.1639530069114; 
 Tue, 14 Dec 2021 17:01:09 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/60] drm/mediatek: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:30 +0100
Message-Id: <20211215010008.2545520-23-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
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
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

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

