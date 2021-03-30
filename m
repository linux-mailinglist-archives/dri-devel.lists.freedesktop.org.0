Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A334ED0D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 18:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF006E92F;
	Tue, 30 Mar 2021 16:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 30 Mar 2021 15:24:49 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B909389EB4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617117889; x=1648653889;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=i7hqXDBFMEOH344k9HghH3EKm0gmYqjjMoYYpOlfG7k=;
 b=eZVVWQw0IyeY3TYyVchp3rvpNWReofzYm3BzqwvV/ccSdtxQkT4WXirp
 d5ulV4MkEBIHzd0e0q2Bydj8ezrgoMq0+ww+mrRqMJF61NwcfHv+AKwIs
 EFvYMz6PbuTG0kSjbKnHCDvn2Nn+yniMzZTZjDR3BS+OUIv2sAGttZUKw
 x8Cil27W03voc8fP9CjHBK5kdLJVjzJYnWpby9hlPtf9MXF/R+6jERSJh
 IZSJhZqMsKsX8vEC8a+zuRFhOjVLrWFSNfoc7Z9zNu77RsMws67XYVw1D
 H5CeYB9dfjxwnMCjOJOivd4opkSWTswHOlxeiiF6Vl2cIYvY2XLZAZtz/ g==;
IronPort-SDR: U9O3kSBVfij23VJN3kWbJ3je+zz+RMiXR7LRbIi6o5gkhZu85AMJIZzFIvJ86U3HVPsOoxH7OM
 7znL/NhjmgEVChD9v1YsRi9ufEVAI9x5T5iWBkBUXAE2JMpjFTx7OflUa9Yw7YiNLCRMy2EMQK
 1q423DvIHQ7VPLqPsE+XtUXIgg0rdeTXGaRQ/Qmnk4Sjy6YnblAwCparZ9FzLIlxqWHEGozIFj
 2oJzICgm253FzpLTF4DsHvqQNxSk4aOmtfpWFZEMb4vBLIfw7+kfDtuIQebLN0Bb2OCXxWqLfJ
 AsA=
X-IronPort-AV: E=Sophos;i="5.81,291,1610434800"; d="scan'208";a="121077763"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Mar 2021 08:17:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 30 Mar 2021 08:17:31 -0700
Received: from dan-linux.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 30 Mar 2021 08:17:31 -0700
From: Dan Sneddon <dan.sneddon@microchip.com>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/atmel-hlcdc: Allow async page flips
Date: Tue, 30 Mar 2021 08:17:20 -0700
Message-ID: <20210330151721.6616-1-dan.sneddon@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Mar 2021 16:02:22 +0000
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
Cc: Dan Sneddon <dan.sneddon@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is capable of doing async page flips so we need to tell the
core to allow them.

Signed-off-by: Dan Sneddon <dan.sneddon@microchip.com>
---

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 871293d1aeeb..f6c3d8809fd8 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -686,6 +686,7 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 	dev->mode_config.max_width = dc->desc->max_width;
 	dev->mode_config.max_height = dc->desc->max_height;
 	dev->mode_config.funcs = &mode_config_funcs;
+	dev->mode_config.async_page_flip = true;
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
