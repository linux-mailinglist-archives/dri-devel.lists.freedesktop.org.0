Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5AB474FD6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF810E174;
	Wed, 15 Dec 2021 01:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FE2892BC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmWmEvElNVU/qerAaDBsaq/QCWQ6SmxeNP67s/Zf/B0=;
 b=fTJYvtrTWeTQxISD4iumUItKFGKMsf6wAIt1btRZZhTQHsUHNwygdyZLY0e9rS/yNgWjGz
 ywtWKXi8LwBdendhSS0EpHcMYyNCCiXbDoihCDAhpKgh1w7ajDYyZvOzuT/phHO+j3qkGD
 dN787/SQqQXDNM3yWpSA4y449yHu1ss=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-A3Z-DdclNoyL0hvAo4sIcw-1; Tue, 14 Dec 2021 20:01:28 -0500
X-MC-Unique: A3Z-DdclNoyL0hvAo4sIcw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso5382070wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmWmEvElNVU/qerAaDBsaq/QCWQ6SmxeNP67s/Zf/B0=;
 b=PqIpSltZ4zZg5vp33baXZbr7ooTgxgYZOSBFilfREoB3YBbTq4ktvud9TbAfelq/jZ
 RAa45TLUqkvj5b39FS6WmubkZX/H5t3nM1bg13moSufCTjvea2dh1yP4zfEqHv/jTsVO
 tWr6/pqGg4Z2o3opYSLJsArpX8lTMWTvCehpHYB8jnJ1LMS1oDcU7GE+nNib8hy2v2u7
 BgoTUwSamnqxBj+l33WBHf8XiEleRC6iM9mbbeVVIxI/rNi14PVP08HnlBeIjalPNCzb
 RXtdx/ibdamqmrbOqT8WQwu9dRzDtjhb0JiMW0qc/oSZws0IFXZKKGa1nsoSqFZDYfdi
 36GQ==
X-Gm-Message-State: AOAM530xjmBK4XvIW7ZvbEC1RkuoGkcYPXwb01BZo6Y2ZGylt2cscWgc
 oigT2bjIdHQQKvSYXAuPpyW96WZvOjFgOSSEVI2p/gI8eY8NeGlVPKrM1pN4Bb2GTMPguRvXIxd
 NcF5r5H60DvyLaRlDhBE5vmMa5J24
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr2246938wma.9.1639530087039;
 Tue, 14 Dec 2021 17:01:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBgBtQauXKwZ6LZc3kZFzJN4bmwEvjEhe5N89f7g7Te2cRZqCCXlTJoLce60PTPD/ZzfA6Tw==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr2246928wma.9.1639530086871;
 Tue, 14 Dec 2021 17:01:26 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 42/60] drm/tegra: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:50 +0100
Message-Id: <20211215010008.2545520-43-javierm@redhat.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
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

 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 8d37d6b00562..48e35d686473 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1382,6 +1382,9 @@ static int __init host1x_drm_init(void)
 {
 	int err;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	err = host1x_driver_register(&host1x_drm_driver);
 	if (err < 0)
 		return err;
-- 
2.33.1

