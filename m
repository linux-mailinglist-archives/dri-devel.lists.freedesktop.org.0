Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6E474FC4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE4910E125;
	Wed, 15 Dec 2021 01:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F39210E147
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQTCDPDBHdP0UJYByXzA6Uzoj2dEWXGaiTwokgt/R5E=;
 b=PK5uPA8aoucpi/5693M3Q1NnAgU53jMiQTy/Y+D6OsUORWTEwyQ3XUCwHs3rn82TLwh7B6
 xBaLGGF8lzIloWEk4ex1Cm/34KxnUtjh7cO9yOErl4BRaedNm2NzP4fLNcq5vlo0Dni1zz
 6jTSYWqrw0/wKFLRMaXxoXY4BUp/qhg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-K2NCVrTsPf2OkTuumiHfLQ-1; Tue, 14 Dec 2021 20:01:02 -0500
X-MC-Unique: K2NCVrTsPf2OkTuumiHfLQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so5378589wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQTCDPDBHdP0UJYByXzA6Uzoj2dEWXGaiTwokgt/R5E=;
 b=oiuH9creereoOsk98MLi4MuyGzNMqGceW5zzNDiFQXBk4g2pyf3QXWWRGy1LDeJx8A
 3hEmvKM13XjtmG6K5o/NKK/auKb40Zru0qHKe5g9VTOHon5NUe0i3RqdZxOHZUSMsQdr
 +Y+WB2tMxLuCkKykOV7ELr3q/5+NqQqPPk7XpWQ0xpNz6Xz4onODIfLOqN2mAHZ5zMej
 5JvLlrWU9IyV/+TuKgKoLyNti+bbVtu3k1BqfBLUIahaFVvGzGzw8lfMWxWHVjBY24oD
 UABH0bBC+VwlpRASxzY+47bFzH4knwe54OhYXXiG7I8/p9N8EnyGLdlgaGK9/NrVcb8s
 ZH/w==
X-Gm-Message-State: AOAM531qUWAOzeDVX8WuPewJ7qW9eLXjv+nnF5RUSDD/qU5ZmW6f3QJb
 w1ql5WiGZ0zYnwZJn5KRCG2VoXZXWNvEk7UHSzjGiM45ieexYmk5O/7/z9ExcgRlMp9rBo/Z7WF
 iFUpsTluzJ3abEAPxNnz9c0MIJ6xu
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr2273642wri.6.1639530061223;
 Tue, 14 Dec 2021 17:01:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhy2UBePDn0sBvMQOB1g4jRXeSL9+JYzQTE4Jd1KtFit6X1vewED3OTBsnEbs0L1aGf4sjlg==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr2273630wri.6.1639530061010;
 Tue, 14 Dec 2021 17:01:01 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/60] drm/hisilicon/kirin: Add support for the nomodeset
 kernel parameter
Date: Wed, 15 Dec 2021 01:59:21 +0100
Message-Id: <20211215010008.2545520-14-javierm@redhat.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
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

 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 98ae9a48f3fe..2f4c81dc8681 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -274,6 +274,9 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	struct component_match *match = NULL;
 	struct device_node *remote;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	remote = of_graph_get_remote_node(np, 0, 0);
 	if (!remote)
 		return -ENODEV;
-- 
2.33.1

