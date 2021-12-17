Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C449C478181
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8418510E216;
	Fri, 17 Dec 2021 00:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA2F10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rA/uqKsHzPJPd8l1W3h6dIgfMpUINwyO957MUf0hISg=;
 b=Fpv3h2Vnbo77281ljCNIucb8zChVvvQR8NUFCV7rF897Cd58j0iT4F0LVpugcF32+PdpVn
 bFc0EsayVwZCrL9aVIejjxNduYWNwsscivgQNcLys4JMENd4NOnuA6R7MPtEELk522Wvke
 SUycbWr4U8ZmxuhyZ+CcS73afdc4XIg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-I4PiOpl6MpGVhR2nAwWImw-1; Thu, 16 Dec 2021 19:38:12 -0500
X-MC-Unique: I4PiOpl6MpGVhR2nAwWImw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k11-20020adfc70b000000b001a2333d9406so148450wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rA/uqKsHzPJPd8l1W3h6dIgfMpUINwyO957MUf0hISg=;
 b=jo0FQNLq79Ljut+B1lxYkb6mQimsAnJ1b8DB37UFYm9UD+weYCN9zVDRVrS3vIpI4z
 liXgwLwtpStlSPyvpUH5jyWPgn6n256Z80mafwba8Gg2E+3RdY6gJIlSgVpeyi4qkViY
 +28tlBq8zCyon/LRpt1PwCZKtYyXts9NKj7tzCLG8HaSuOr1Gvd+tIQPfg4Z/He7Nj6i
 1FnNHUDULFeDu5bPTMxFc7VK8yBLzjIl61iDFUaQBLcF4NXHJVj8eVTji9xeE0ZQuWsR
 35YM1qLuFXv8TwnfWfe2/BRby+KNBSf9+tKa2CJCHxlAAzr7uz+VBHFbvtjzCs1+8Ncm
 6d+Q==
X-Gm-Message-State: AOAM530GoHsDQBH7ob41Z9UCQYc/ppHpd6MKHa6lYF6RaP+O3aGsvVEV
 Pxv7TI5IsrNAEh7Msr6KoBwQ3ko/vNs67gINM8d3d/L7dIyjJ8eMK0bw7fFF7x5+VhGcJu9M1Lr
 2MQD3pCT7fOLrV53ZRDJQwJJRYvJA
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr359684wmq.65.1639701491245; 
 Thu, 16 Dec 2021 16:38:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkPbBfL1LKyLF0LYv7GreHJ/NzzHpIBVh77Z2RQuAqRa640p3xksCecEIWH4K3qpBobFpqNA==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr359678wmq.65.1639701491083; 
 Thu, 16 Dec 2021 16:38:11 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/37] drm: mxsfb: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:28 +0100
Message-Id: <20211217003752.3946210-14-javierm@redhat.com>
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
Cc: Marek Vasut <marex@denx.de>, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 86d78634a979..c843314d5b49 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -410,7 +410,7 @@ static struct platform_driver mxsfb_platform_driver = {
 	},
 };
 
-module_platform_driver(mxsfb_platform_driver);
+drm_module_platform_driver(mxsfb_platform_driver);
 
 MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
 MODULE_DESCRIPTION("Freescale MXS DRM/KMS driver");
-- 
2.33.1

