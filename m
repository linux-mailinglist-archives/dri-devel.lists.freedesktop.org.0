Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B1474FE8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E23A10E1B2;
	Wed, 15 Dec 2021 01:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9336E10E196
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1f6yN37uKB7QatPNWpagTQrFh5Rh8VmN4GeGpHQpF0s=;
 b=JB1xGL9o5od9CWnhcHGwvl2fAVkslOpU5Tsjpo0zdnb2DpEsEPET6iRIH/WIHVyoR9uUQK
 CfUnSRtcczh7Yd1PO+sBV8oFNZJmxqiKkhgWp3Pr8F0z5BJ/1EX9ULulOJnoetWpX3q757
 XErsFsiCC96MrU8Aa82SfTgnzV8B9T8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-7wiwnpeJPx-P1f5IHuLL4g-1; Tue, 14 Dec 2021 20:01:42 -0500
X-MC-Unique: 7wiwnpeJPx-P1f5IHuLL4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so1155275wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1f6yN37uKB7QatPNWpagTQrFh5Rh8VmN4GeGpHQpF0s=;
 b=D2naTfSvg8NlTNlI4lcWEY6l5CUyv1RMg0xtidHcc7sB7W+7ewG09/q12wdG+cXDnC
 bPAOM4wb6dOpnAWbghhFU3M0LXcZIrq0X+kK6VUBEyPUjZGsne2IMWY/sTv2q5tSALsx
 jaWn0r6fGAN/RsZ4YRQYo3WoqdFrWJfvTCyP44zTR90Xnuh5B1gPJAq4SKhmVteJmkQu
 6uNf6/2JOKJjIMeFpMAGXm3gPktb0CVVUCikx3V3vD4CVZCC78wakNGo2qXklAcN/2/5
 mrtHBDZ2gt0K43GSn/tBGt54Cxwxb8BqINC51CFhlZFiZU7CCRpp3nxAftbkTRvU43Wx
 pLMA==
X-Gm-Message-State: AOAM532raHbJg27c80SRcfCjVFmtGmQindqN6ZgD/qtOL/QqD1MQKlZy
 WANgE6N4urHbCYYYAtrBJhjhr5kCIbVbOJrxmWTetji/hgQMqv+a1ocERvetETc+q5YR7ukH7Me
 AJXHPCmR3YufdenwgusZe8zTGAoyu
X-Received: by 2002:a5d:5850:: with SMTP id i16mr2170314wrf.410.1639530101258; 
 Tue, 14 Dec 2021 17:01:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7Pvcx740finhdlcrOo87Ams6/Q7ECZPB0YrWL/BMTa1OCBtHloVTPPpTU0kUuAQ6A/3Fibg==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr2170301wrf.410.1639530101097; 
 Tue, 14 Dec 2021 17:01:41 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 60/60] drm/xlnx: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 02:00:08 +0100
Message-Id: <20211215010008.2545520-61-javierm@redhat.com>
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
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index ac37053412a1..cca55b8a8cf1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -191,6 +191,9 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	struct zynqmp_dpsub *dpsub;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	/* Allocate private data. */
 	dpsub = devm_drm_dev_alloc(&pdev->dev, &zynqmp_dpsub_drm_driver,
 				   struct zynqmp_dpsub, drm);
-- 
2.33.1

