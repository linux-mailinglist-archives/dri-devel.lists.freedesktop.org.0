Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F5478193
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC12310E2D8;
	Fri, 17 Dec 2021 00:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CF710E245
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjBFg3uca0hr/RF0/NYN8McW8siJPGtew7BDMoZLdbk=;
 b=OIj7bUsWiuLMAq6ZIc0iXrba+dailrSrMhNQ9pd+SMRHNlTmQG/wsXvAUEOURf++8GnP8H
 yuriSZG2JlSmsV1qLU/389jCGV/OrNvlC5SYwj9smOHbqSwFTT9YDW1ocsQmOz1F/qi2a9
 ZeAmu2DMu31VOw3/X215dyl86kPoqFM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-sZWIR_VXO_-HofMZ6lGmhA-1; Thu, 16 Dec 2021 19:38:27 -0500
X-MC-Unique: sZWIR_VXO_-HofMZ6lGmhA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t30-20020adfa2de000000b001a24004e1fbso145255wra.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjBFg3uca0hr/RF0/NYN8McW8siJPGtew7BDMoZLdbk=;
 b=c+KV12aEw2HNDf54lxSfkTsG7zn+nmn4NkOn9kgYXLO/A5mAhjEtYrF2w/HAL7JFbz
 T42BewUWF9eQJCfAXhCpGGtv+UzVkE8TOHfc2LkA+ZXnzCD3JTIMT+bi3RLKkKc5ndVl
 wvrnYrRE+FmefFSz4ZSyjlFJXFQjZ6BheUSjWOMrqcljt/Npar33aCIISRfrT3GnhSHx
 PY/32ukEaMxyXgwpDf8M43i1aM1GjHKUSY5laluolwH/2z+RoMVielx5Pq/pBOup5hd/
 FoE+Zw/wJ2UXjOWdPi3+EQmj1eDud3ZoCgFyzSOHOJxHE5zjQb9ifDVwVW9N8Lp66m17
 HdMg==
X-Gm-Message-State: AOAM532pSZ9ToQRpDP4vP2hu4gUWHF8lre7+dDr2303pV4Ms0GvSIOBB
 irJjd1LJPGudNFClyNqcY1ij78ad6XabMeWj58aSvJBtaoR/cFaJgIJbY1z+E9A4bLvftcAsba3
 jXEqTCGLuv6Sg26r+1TKLmYDT8IrW
X-Received: by 2002:a5d:648d:: with SMTP id o13mr349928wri.637.1639701506675; 
 Thu, 16 Dec 2021 16:38:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeyzKTq5rHZsrWQHaePARPuD9O79wGdBTrc7g9E10h/hppontDey+ouzFKQJLSf7A4vCd2XQ==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr349917wri.637.1639701506497; 
 Thu, 16 Dec 2021 16:38:26 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 29/37] drm/msm: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:44 +0100
Message-Id: <20211217003752.3946210-30-javierm@redhat.com>
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
Cc: Sean Paul <sean@poorly.run>, Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/msm/msm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 892c04365239..8f30e68ae3b5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -518,6 +518,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_mdss *mdss;
 	int ret, i;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ddev = drm_dev_alloc(drv, dev);
 	if (IS_ERR(ddev)) {
 		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
-- 
2.33.1

