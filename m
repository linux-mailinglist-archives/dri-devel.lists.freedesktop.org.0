Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF7474FBB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CD710E134;
	Wed, 15 Dec 2021 01:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0E10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+pg6gkvVTg/jCDYXqfj7uILQP1iaPO5/VLqlopAnEk=;
 b=YIRgNW9Ab7282csY2QfGP4WoZjYGHJBuIDlM4sqV5DRUYwlTrNaUmsOTmpDHu8voh36ZZN
 OIqo2Lkrlqce2aT9JFojIk8LMKgAxIJ1wO/acFwukP7FKWU8twUqY7YMwAlgiiSbeVwW61
 bpJzwM5h44MUM6QflDUgpu5/k7Cxth0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-67yvCH4EPM2revZaLRPqYA-1; Tue, 14 Dec 2021 20:00:53 -0500
X-MC-Unique: 67yvCH4EPM2revZaLRPqYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso13871909wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+pg6gkvVTg/jCDYXqfj7uILQP1iaPO5/VLqlopAnEk=;
 b=dUF55p7EjGOU78F5dNxgFii0zgBSqDTDYgHygSwccYKyNImXVQZsdmAgTyzDkyD/Nu
 1H43ZhysJaAMMxXeOgtSoXtG6+ZZKFPQVyy+C+eTBHtwIP9/JOmasYRF1vlwHj54s9w+
 +VXqQ6WJF1iX2vVbtv63aOgBvWau6iwiHpCUG/WM8vi5LvWghvb+UC2TDPrjyYp15xiY
 PqNNnQeBcbei2R589K0n6YhgH03kc7kHCW+6ktpD0AOPwMRzGsjReeJk01jEUQRx0hdZ
 BMcCkil+hRc2oG2d/jSQ5lxN8B4gmzPgGthqH17nPQaJI5gc6AMprC2w8oyf7VJrvhVe
 6Tzg==
X-Gm-Message-State: AOAM531qLLo83/m5qVrdcIjpiKJ44LFBakJQAZoOaHojdMqLzC2lz3Fj
 Sf4VtqqK+kbgVoT5VpNbWvFthNwz6O7cWlStBp3oRBENGQ3n7y+x2Ag8m55XRpsqDYPnuzc1YiP
 b+1nzd/dy4FEEFl41vH/ceiekafaj
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr2135487wrd.296.1639530051618; 
 Tue, 14 Dec 2021 17:00:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa9ZR3JBVySwgyk50lbQenu9lQKPho5TOnp36sCmx/rNFAlgMq2f5DxCJIrOkA3pY24zdg9g==
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr2135481wrd.296.1639530051453; 
 Tue, 14 Dec 2021 17:00:51 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/60] drm/arm/hdlcd: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:10 +0100
Message-Id: <20211215010008.2545520-3-javierm@redhat.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>,
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

 drivers/gpu/drm/arm/hdlcd_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..0939a64a9bd2 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -382,6 +382,9 @@ static int hdlcd_probe(struct platform_device *pdev)
 	struct device_node *port;
 	struct component_match *match = NULL;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	/* there is only one output port inside each device, find it */
 	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
 	if (!port)
-- 
2.33.1

