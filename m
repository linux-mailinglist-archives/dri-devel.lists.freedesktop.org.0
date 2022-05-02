Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A38516C74
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 10:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFEC10FCDD;
	Mon,  2 May 2022 08:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5942F10F732
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUb3Cdutv1MKxDV6ingzdmF5ZaYeX01o1Hla2Evf+TU=;
 b=b5/YCOJNjoq12HJJLByERXmmODjRnPNGbpkG9smE2fqDI0ySc+sSl7o4VuwVmxiFma8DfA
 AKVP0092OTtJObYdzXe2o8ztfwVquCWjeZtzKHs2nobrFZZZgVqrJ+t9pRz1NBRNiTb51a
 gJZuEZtNApjjx5D86DEu6d8qT6cl7ZE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-gBqOpaeGNFWcT7t8W3L3kA-1; Mon, 02 May 2022 04:49:03 -0400
X-MC-Unique: gBqOpaeGNFWcT7t8W3L3kA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so5143188wra.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 01:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nUb3Cdutv1MKxDV6ingzdmF5ZaYeX01o1Hla2Evf+TU=;
 b=FaYXywfyS9Ejqk8t8swObVE9kpQZl8T5bxAuCBbCTLtvwZoBIjXTVUXOnHZ26X49I4
 gR4banZQdLEOWFR1jgo7X2Sv8GjZt6vXlo11k2/VK6mNrMj5KoAqkwyPdLtNAoZNMQMu
 sMBcc03GRhz5yOgM8B1P7MuNaLgBKNX264ZtR7GoSTjO3BW+1z9Zi+hrQMi8OZscN6OD
 gYVUauPwBKeG5zcEza5zPGISkAoPGfPC1VL1LFwJO3B6ZLkHmiCKwhGmhntH5Wd7XC9M
 Eos06/QWtKLdHZg9VDqoXeKDEP2V7i6q1G9sYw0wIvPEaGJosO7QYcilnEWttu5MXVwy
 ckHA==
X-Gm-Message-State: AOAM533fUzcEmplPC0UBDIelIgHstsex7V11ZuyfPL/z/Ssh2BXP0jU0
 h5MJ821UYqonowB86y8qIuW4pLlCvATST2rC1vUZg2wQfR6i/CaFVlm4fP24itl+QOr/bszR+YH
 vaUjsLPrSh3MjRkbtF/aoIZnKBSNL
X-Received: by 2002:adf:f481:0:b0:205:b814:887b with SMTP id
 l1-20020adff481000000b00205b814887bmr8534231wro.472.1651481341955; 
 Mon, 02 May 2022 01:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAXHYxvLbyws8GB/tbUJd38HBu5iob+xH8VrObZKgF2/b4LPU+2ChH0C1K1Jw1h4dwPv9ZCA==
X-Received: by 2002:adf:f481:0:b0:205:b814:887b with SMTP id
 l1-20020adff481000000b00205b814887bmr8534221wro.472.1651481341758; 
 Mon, 02 May 2022 01:49:01 -0700 (PDT)
Received: from minerva.. ([90.167.94.74]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm8032307wrb.18.2022.05.02.01.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:49:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
Date: Mon,  2 May 2022 10:48:28 +0200
Message-Id: <20220502084830.285639-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502084830.285639-1-javierm@redhat.com>
References: <20220502084830.285639-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Nirmoy Das <nirmoy.das@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Tian Tao <tiantao6@hisilicon.com>, Dave Airlie <airlied@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_fbdev_generic_setup() function already sets the preferred bits per
pixel for the device to dev->mode_config.preferred_depth, if preferred_bpp
value is zero.

Passing the same value to the function is unnecessary. Let's cleanup that
in the two drivers that do it.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-
 drivers/gpu/drm/tiny/cirrus.c                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index fe4269c5aa0a..ace92459e462 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -349,7 +349,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		goto err_unload;
 	}
 
-	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c8e791840862..ed5a2e14894a 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -601,7 +601,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+	drm_fbdev_generic_setup(dev, 0);
 	return 0;
 }
 
-- 
2.35.1

