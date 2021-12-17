Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C147816F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597C910E1DD;
	Fri, 17 Dec 2021 00:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046FE10E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9k5RFn1PoMDkgn4F1QHrlqrR77m7NFK/gG62GZbS1Vg=;
 b=if78c3wTyw9URdznryUsxgyx1kQ41WEKQr+8oMiMJ46YL5mulfXhKrYv6EQBu4VLfhjt/L
 8dpLDgWaGwmGm19iYb33NFecOP8VvV30EAi8SAtMCQojfmXL3D4kcf62XIWFlCbeMS9k+S
 9KA2JHq2IT/mBergT7yYe/c9/2tKULA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-ttLK_XykOG-npNjKoKK1uQ-1; Thu, 16 Dec 2021 19:38:01 -0500
X-MC-Unique: ttLK_XykOG-npNjKoKK1uQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso146130wrd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9k5RFn1PoMDkgn4F1QHrlqrR77m7NFK/gG62GZbS1Vg=;
 b=kM/8V7lFGLKX1ryz6H/tzsM9vtvFrHgEoUit5uJg0EyXUPjzlySlRwdWrYDi3bUtlU
 s8vojEsy03za0IJ+XZ+rYNSUCa1eAS+HKBt0c1wggg2cWxTNr+Di/HJrkfzZ+qkZZVw8
 xJfCBebe3H31ZHgaOOEetm/WQm6k1FYa8no2Rz7WOGShdGxG5KQU4NAZEtgu02gwlg7Z
 7ctaRNb6ZZXGK5FYxvioKlaKKhi0RAVANxpNxLf5tLCHI4RKedB3mScwftWcNiHFP3j1
 iTPbRP2at4yvdcdC/Wf52LL/4Ckdn2gKRzd/yFHDW/A2xLE4SRwjIUO1+7VHXcRAydx6
 Lv2g==
X-Gm-Message-State: AOAM533Lc22AePci79cJv8V7hoNXjyT+sINYu5QSkiYogQ03Hp7/ls5j
 BXIV1Kft9Nhc25INZSilOL8cx+nreRGal6Ns0T6AJgsTTmLJm9crLbN9tYSEXh3nsv3okPSV4RQ
 fbk2S89D7DoCERpWLBW4iGmy3f6YS
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr7475462wmj.52.1639701480512; 
 Thu, 16 Dec 2021 16:38:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl7JSlYctIcRUyr9mug90h1tfRpQTUD44VB9IztGLdau2eaDdgRI0Bprrb6lO/xjVPBo2W7Q==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr7475454wmj.52.1639701480334; 
 Thu, 16 Dec 2021 16:38:00 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/37] drm/hisilicon/hibmc: Use drm_module_pci_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:17 +0100
Message-Id: <20211217003752.3946210-3-javierm@redhat.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific PCI driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 610fc8e135f9..398a68b1a08c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -379,7 +379,7 @@ static struct pci_driver hibmc_pci_driver = {
 	.driver.pm =    &hibmc_pm_ops,
 };
 
-module_pci_driver(hibmc_pci_driver);
+drm_module_pci_driver(hibmc_pci_driver);
 
 MODULE_DEVICE_TABLE(pci, hibmc_pci_table);
 MODULE_AUTHOR("RongrongZou <zourongrong@huawei.com>");
-- 
2.33.1

