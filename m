Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59FA560ACE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 22:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C1B10F0BC;
	Wed, 29 Jun 2022 20:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0020B10F0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656532867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AmJoOaiBEwTvOlBR6tPF1TnQpeu1brYhbJVBBtBBv/U=;
 b=h+WcKp8bZjqQpDYs263ir53WMunXxap1xEWWfoNl8KG5LVdAnPxeBC2pFejP6FJv4HylPp
 EX/swBYLw6XBCXOcwi6llPlEZPNiiuI+lVs9z85VQaOQFQu1pcysJJtZGIwne7/MjY6eI7
 Pl6z/2q2ieB6KcEVpkTfTrj47GPUBSs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-yEYkqxPIOheG1AmEDvFwiA-1; Wed, 29 Jun 2022 16:01:05 -0400
X-MC-Unique: yEYkqxPIOheG1AmEDvFwiA-1
Received: by mail-qk1-f200.google.com with SMTP id
 k190-20020a37bac7000000b006af6d953751so4377446qkf.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AmJoOaiBEwTvOlBR6tPF1TnQpeu1brYhbJVBBtBBv/U=;
 b=v7AZEPhC+kWrft2xwLEeppMOuLNwv4QhK8Y2z2fEBYc1E11otvRiwPLoDlOPXJPEwI
 m3zCRRXfBjy2XqtNzax7ZoE60eunkt+RXhsuZYR3HqHQ7l09WGofmy4XWWYhKoPb2cWF
 LXU9tQsMjDmqiM4whq0H2TLsKFUuHV07RTmJV/4rGSiyQa0biZVz5v/nAjZjCGShqiKP
 YJlrJpa3uAz2oZm0cuOzqIM+DlWdRxlHRY9dK9GesVatuld7K+5GDHDyl7R90vlwtNKC
 7VjA/wg2MdTE+Jkp6TRbF99D+wnvOnd53I4Cg0SWWjD59cGcWfgOmSKAJQDj8x9CNoEf
 Uv6Q==
X-Gm-Message-State: AJIora/iigWMnUoY/HFmBifWwSYSoilVC1+GkDOSP3frBtojtsyzLRkA
 GlzZmJA/O6sc4qHVfi0A/Icoa52OWXuvqydMkCNrogCF/+5ln0TXu3k+cVfHBDDmtkTdzwWNb5Q
 3Utxt0W8cP2LUhFggNM/pcsuaPgxf
X-Received: by 2002:a05:620a:4502:b0:6a6:deef:75ac with SMTP id
 t2-20020a05620a450200b006a6deef75acmr3558703qkp.69.1656532864847; 
 Wed, 29 Jun 2022 13:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vC964FyYrkteZarVUW140Wh6U7bPa3vZk++aoOryCFqOhwM79b4t1kGovUXgTXVmT/qMkHJw==
X-Received: by 2002:a05:620a:4502:b0:6a6:deef:75ac with SMTP id
 t2-20020a05620a450200b006a6deef75acmr3558668qkp.69.1656532864430; 
 Wed, 29 Jun 2022 13:01:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006afd667535asm3280362qkp.83.2022.06.29.13.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 13:01:03 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: emma@anholt.net, mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dave.stevenson@raspberrypi.com
Subject: [PATCH] drm/vc4: change vc4_dma_range_matches from a global to static
Date: Wed, 29 Jun 2022 16:01:01 -0400
Message-Id: <20220629200101.498138-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse reports
drivers/gpu/drm/vc4/vc4_drv.c:270:27: warning: symbol 'vc4_dma_range_matches' was not declared. Should it be static?

vc4_dma_range_matches is only used in vc4_drv.c, so it's storage class specifier
should be static.

Fixes: da8e393e23ef ("drm/vc4: drv: Adopt the dma configuration from the HVS or V3D component")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 2b014b6332a6..292d1b6a01b6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -267,7 +267,7 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
-const struct of_device_id vc4_dma_range_matches[] = {
+static const struct of_device_id vc4_dma_range_matches[] = {
 	{ .compatible = "brcm,bcm2711-hvs" },
 	{ .compatible = "brcm,bcm2835-hvs" },
 	{ .compatible = "brcm,bcm2835-v3d" },
-- 
2.27.0

