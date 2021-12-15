Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B95474FC5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A753810E139;
	Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052AC10E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBTKxPeGB31tYrcCVudga0Xd94MnfSm4hqMjeexwQ7g=;
 b=WCAsqFkofRbS4ySvWennZlTgGyrBpwkILWS/VR0lf1OO/uQLhV+VNAbrj+I+ETULX/uFWv
 RM+DnPw8aoRBhECnrqoPo7EV0L3Y0U/gGvNZYr32ZoLqwhDzik0iBmo8m8hMtkAczGEtwd
 Hp2kpOmsLZMckVFwPLZpm3B991+PcGY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-m-wEluzbMnGZZUOjeGPuWw-1; Tue, 14 Dec 2021 20:00:58 -0500
X-MC-Unique: m-wEluzbMnGZZUOjeGPuWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so5368885wrh.14
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jBTKxPeGB31tYrcCVudga0Xd94MnfSm4hqMjeexwQ7g=;
 b=Z2QgvamrN8MZygmeDGKZAH1LbYAvTtr1x/JwT9ko9v0n2051JYc3OZD4fz4PyukyQJ
 ysZhdkcBvrvjRoCglFmyXcZrc/z6FCoX0UsV4p+V7yvSBgaBCKmjLV+FDkx5MsahiVTe
 lGrP+fJ+Sv7/I6avk9mpUIQsctMp4jgibKJ8cRAS67T/jdfc0rPaNSyYxw3Opb7Y6Gcg
 q+Hmmf+Ostq9JvETpc9ab88yZGlUUUUv7lRs7pkIATA0/bB8W+d2RfZkM3Jdv+MLwKSf
 R9wFqQGOCdCFVq4stqgGJJYsNx0e6UoHnmV49XIHd4DC8/c1xUwYT7OxRxetRI33Aqi5
 wOaw==
X-Gm-Message-State: AOAM532iiPh03LLtmSJd4sGIw7nt+NHpI4Tw7pp5m458Qq74OI7tR9r1
 +pc+HVcusF26++Ww+8aQvQK1HWE2Itr/PA+afuUd67YmuPPQxf+tY/EGla8RAiWPqrxgDxqP0/7
 xKcZD7Cjt7iTUOmIhq7bZUsAbBUHE
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr1419947wrq.295.1639530056894; 
 Tue, 14 Dec 2021 17:00:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyItXA3rJrb3rM7E1UOBx0yrgeihNb1i2VAfL998yRE15d9H9HahBJ3qU8bKTePTqUW7O/9TA==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr1419939wrq.295.1639530056729; 
 Tue, 14 Dec 2021 17:00:56 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/60] drm/exynos: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:16 +0100
Message-Id: <20211215010008.2545520-9-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
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

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d8f1cf4d6b69..f9f10413a4f2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -464,6 +464,9 @@ static int exynos_drm_init(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = exynos_drm_register_devices();
 	if (ret)
 		return ret;
-- 
2.33.1

