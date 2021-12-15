Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EF4474FF3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5259310E1A4;
	Wed, 15 Dec 2021 01:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2B489E03
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wSvFByRHA7mdMXNWg0+rWl0zHdpArwZl/4sB+8Rm7M=;
 b=J8HUYIC58vdV7WOsLkQheBPHsryQCU3F0SilgQIPPZuIX+BqEqA5o1jTr2J60P0hd7+jYN
 E3TaJIZjcJjT7LtHhBmXWZEWqh/lK1BSDFe7bQLaiEyxfaMuAGC+E2W79p+P1iXPmX7CE2
 nIvsA4DSDfBcQj01v8mJhf4iPUSeYlU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-e0MPbi01PGOV6wdfKVyUfQ-1; Tue, 14 Dec 2021 20:01:30 -0500
X-MC-Unique: e0MPbi01PGOV6wdfKVyUfQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so617090wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wSvFByRHA7mdMXNWg0+rWl0zHdpArwZl/4sB+8Rm7M=;
 b=8KewJxQpqp+/bak+XWIkoXf9FKzEYGoYLvQDaIsv68sEOWJUi2koZ/WOvRvbY/edsc
 dIkbulCJoF1KmBAUVWENXEGrzrA8PJXBNqeQk01flxCaZw3PanEX+LZ59m9Nzt//wlcz
 mm1TPzizjh40qVZ7hgvfSY4TGan87PycyySL6K2K6OgA4sfKqseFB3wOIMOwrWhkMWX2
 G50oRf1seMwg77ufpDfh0esEDEhmaAvGTZtjw7lasD/e/0x9GMqITIMCW1yhcCch9UdC
 ojGF3kMIABxdVZlkLB1pXgCRK4JN2EdXg0rK1GpF8/yn6r2dbaJUW/0J7Vnz/6ik+cyC
 ZYeA==
X-Gm-Message-State: AOAM530+FX+AaWc0dunwT5Nu+0NnxX42lAmOkot/6HC2qfSbayKPQQNG
 kGpUdHnpeCCEG2llsLAMCDCyZn0gHf306natlTGPbm1kEPmHNeNFxSrTomm0dmETS47k3E+Vf17
 Jv04twsGMQe8zvNKAdQL9sYWBWcgT
X-Received: by 2002:adf:d18f:: with SMTP id v15mr2111124wrc.447.1639530089523; 
 Tue, 14 Dec 2021 17:01:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuCfXaHLyh9K/QHLylx3U3fIkF0HSV1BFRcwBmozG70OTGMjET9bu4twVT9d0H4VhRixbh+Q==
X-Received: by 2002:adf:d18f:: with SMTP id v15mr2111115wrc.447.1639530089377; 
 Tue, 14 Dec 2021 17:01:29 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 45/60] drm/arc: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:53 +0100
Message-Id: <20211215010008.2545520-46-javierm@redhat.com>
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
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
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

 drivers/gpu/drm/tiny/arcpgu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index f8531c50a072..9268f37762c8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -378,6 +378,9 @@ static int arcpgu_probe(struct platform_device *pdev)
 	struct arcpgu_drm_private *arcpgu;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	arcpgu = devm_drm_dev_alloc(&pdev->dev, &arcpgu_drm_driver,
 				    struct arcpgu_drm_private, drm);
 	if (IS_ERR(arcpgu))
-- 
2.33.1

