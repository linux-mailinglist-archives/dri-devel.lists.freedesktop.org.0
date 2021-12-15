Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA367474FCD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FC410E157;
	Wed, 15 Dec 2021 01:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D79F10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5taMeHi+WZ03jn0R5MLOtTfk5pnEnWUxaNLqRe+t+dY=;
 b=E4PzLlRXV01Xh3S/RRdCo3edZGMm5TxyJSxp7laCkX3OrCL0zx3tyMzBPtxgF97M7kLjNS
 nw311suEKQ/MTDVn6Y7gLjHRQhXqvr2S3su/uVIV7if37kAdCXAVD7AZH4qfwarphyrMvx
 zXz1aw2XipHgDyeZHN7ozCX+cJJ+fwM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-imRuIGJ6P_mvx4_qd6yT-A-1; Tue, 14 Dec 2021 20:01:05 -0500
X-MC-Unique: imRuIGJ6P_mvx4_qd6yT-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so5378641wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5taMeHi+WZ03jn0R5MLOtTfk5pnEnWUxaNLqRe+t+dY=;
 b=v4gqnCBFWwxoK+KotUQkE7QMx29EpclvPXfuSgrlkEG5E51mg9d/GMvn0SrOEOrQAn
 nAczIJRk55lnLjWdgqy4HMZiLL7Qh9UJEBHKKdpJJd6E2TrqrkQH9Y1NiwSxZK3EIkt8
 g2fd2+a/+Rw7+raCe+/xptZhEB+M+GhAzKLjohyh0bkrRr2cVdNOxOH0FlAygmo3tpk7
 hFhKzVC/kHt8KvRzAMHtt67l72GEMcu8yG2PiSvDdOsfn2vbWzvC2p0c6wQf/l2K2B85
 KC5JzULPz1jFs7PxGchZjesHWksr7CXadzgRnIft3NWTVT0m5f3rPHMNk1ghuBjsTIIa
 AiHA==
X-Gm-Message-State: AOAM533ssmB16d3eE4aL9RodJXhVkVW3bmrlt4jCCMi0uUFJGA0Ne6dZ
 UKtS9WxiNnqM+30MDgdMaEAFh0Oy6mZTxb3O+C1R/XxAF63dL+odP4repHvyhtEvyx8EGsDxSV9
 fZE+xmqaDn35DAVrRpFDVcluxaPE9
X-Received: by 2002:adf:9e49:: with SMTP id v9mr2082496wre.469.1639530063735; 
 Tue, 14 Dec 2021 17:01:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygOR/3zg1Gr6Uj0q1vAoqhAOvJOXCRLk4ZM8F11F7wFVnfUa2K8r9XAYPyOMZCxd3XENI2ow==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr2082488wre.469.1639530063576; 
 Tue, 14 Dec 2021 17:01:03 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/60] drm/imx/dcss: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:24 +0100
Message-Id: <20211215010008.2545520-17-javierm@redhat.com>
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
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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

 drivers/gpu/drm/imx/dcss/dcss-drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 8dc2f85c514b..5be591da7389 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -38,6 +38,9 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	int err = 0;
 	bool hdmi_output = true;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (!dev->of_node)
 		return -ENODEV;
 
-- 
2.33.1

