Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5487477E78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 22:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383FD10E330;
	Thu, 16 Dec 2021 21:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C622310E330
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 21:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639688987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZozipTaNlxYu/i5GsMvqhEAEmKMoVSloRU/bzLKrGMg=;
 b=KqlkX5kbpsAuxhjk8RD99GtmY6FeNWxLVG9Lm+bxwSC2EHOrYN6ZNNU7Zq1sxcttgixd/i
 jWv357e1qyctRH1FDq0h0SRIFQ/uWzKPntifjm5E+dVN8FcFJzl/g82/TyiWNNI/FRqnlH
 v8wGvvHXTdJnxHGZP2BVVZAmXG2a0ic=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-AZNRaAxON0G0Jd73EaS-bg-1; Thu, 16 Dec 2021 16:09:46 -0500
X-MC-Unique: AZNRaAxON0G0Jd73EaS-bg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so211693wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZozipTaNlxYu/i5GsMvqhEAEmKMoVSloRU/bzLKrGMg=;
 b=dcgl2tROlTAewuLfvLwkImTdImkiXhKZr44ELzZ/sbb0zzH83q3RH2ahD4prMxsta+
 gvYOmnrA3i7I8Owrpchl9M6IuMk98hDV06u9iraHdGk8VyMP1JspOmeHGOLY5DJIAMdd
 CWFPZsyXkduaa8xMWRYUSMpuBxnPpmOIlD82YAvEIdO382B30tOasd4d59c6zX6AtzDN
 n5G0o/ebqVEnGYBCdwfbXFhCki1UQU/4kItiFpThTwIxSH6NxkTqUv+yEZavggFFbNiG
 HOzYy/SvAMxnrI0zs4K93fFpiFN7YRcYUMAzS73H5J4htljOI01oiFldVnNx5OnvR4qR
 +VtA==
X-Gm-Message-State: AOAM533YMF1exsP2msZjz6uTCNuNjxXME2TD7PBMdvTtdNSLGOz69G7u
 UBi8gZD4Z9/CA/VYBI4lUMI3ywWFIkro7phLulUwMuXbU2p1hSb+/dVHwFAeGMhegDm6/ObB8LK
 JV+GFpeUeYo2ev4W6vn/C0eRExBWm
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr6648446wmf.149.1639688984023; 
 Thu, 16 Dec 2021 13:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt3kWvvUkcQQUk45AwYXe5exDYrHelov6qN8vYzcBMNkC/jaUI9d+DI2qZzyzHI/0HC7piug==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr6648433wmf.149.1639688983802; 
 Thu, 16 Dec 2021 13:09:43 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a10sm9977692wmq.27.2021.12.16.13.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:09:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is
 enabled
Date: Thu, 16 Dec 2021 22:09:36 +0100
Message-Id: <20211216210936.3329977-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Matthew Ruffell <matthew.ruffell@canonical.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, dri-devel@lists.freedesktop.org,
 Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit feeb07d0ca5a ("drm/hisilicon/hibmc: Make CONFIG_DRM_HISI_HIBMC
depend on ARM64") made the driver Kconfig symbol to depend on ARM64 since
it only supports that architecture and loading the module on others would
lead to incorrect video modes being used.

But it also prevented the driver to be built on other architectures which
is useful to have compile test coverage when doing subsystem wide changes.

Make the dependency instead to be (ARM64 || COMPILE_TEST), so the driver
is buildable when the CONFIG_COMPILE_TEST option is enabled.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 43943e980203..073adfe438dd 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_HISI_HIBMC
 	tristate "DRM Support for Hisilicon Hibmc"
-	depends on DRM && PCI && ARM64
+	depends on DRM && PCI && (ARM64 || COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
-- 
2.33.1

