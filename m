Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7D826A91
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40E310E1A4;
	Mon,  8 Jan 2024 09:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DCD89BAC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704705662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OT2gYV6QW0aw9hDO4YgXL/qxcf2YqqLjTuz//C31W+E=;
 b=Re22zcsbpiQz7MvXbmqFR9/CroxGenc7BtP8+zaGo9h0f1cDk9BzCLiG1qLkCLuqMaxLp8
 xFaK3F+iJ9lk1WlSgmI6Y3D3uKitlcfogN0O4YsxMzrab7mjoQCv52HgWPEfZ7CfZmUaLD
 Epeot8GTVejHh8orJ05J/M3Cko7c4fU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-wpJ_0hrMPhq_jcO1sMFgyw-1; Mon, 08 Jan 2024 04:20:59 -0500
X-MC-Unique: wpJ_0hrMPhq_jcO1sMFgyw-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3bbbfe871afso426518b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:20:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704705658; x=1705310458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OT2gYV6QW0aw9hDO4YgXL/qxcf2YqqLjTuz//C31W+E=;
 b=JQ3cjqxOx6YBmD1NMNiSlRhSP8czuquV+SDTz5SOomWC7ajG4Q0nK8azwCeqsNGjXK
 XTAXaWemiUgdPWo1G9zsChcbmzrCe1OdaNqUUgsITRI6VMfpjltx3/+Bjq03EWUvGupn
 VAi+2ioWzjI3Zf7TKUkMSdyUQW68u5m19EBe3jd7qYcSTOsE6OLnKi30aPdMD7sfoBIm
 zb4haxijeZeY63abv39/+/DT9pG3ZVCj+4kalir538LQb+2VcktVQX4eVjJwwcRFLGC1
 6TKChPqE8Obj3HNgVMgjFaGdCH1txw48kZoheeUv6/8oUEPjdILbXT/bDWUHTdJXHJ2K
 /ggg==
X-Gm-Message-State: AOJu0YzWRZS0DB5vIkgDB9swk02RjvGnHytlp4dGNcN+RmHufzkTc9fs
 iKnY4B3E0YNqvPDgOVoTVsk7WWs1JHMZvM216ot4syrsLOcIk+Bb7W65UjFqosivFymSY4Ikmnt
 doe50GHJr8hDTQSt+h48HnDzozhu5N0CkCmys
X-Received: by 2002:a05:6808:b29:b0:3bd:1fe4:731d with SMTP id
 t9-20020a0568080b2900b003bd1fe4731dmr5145674oij.2.1704705658322; 
 Mon, 08 Jan 2024 01:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB1C15Fw6VGoZGz9oWNUFxUzMEbudyu27+vWQsCI2s0Rd1Z7xeT1ZpKC2PTY/Nx1IYLi86pQ==
X-Received: by 2002:a05:6808:b29:b0:3bd:1fe4:731d with SMTP id
 t9-20020a0568080b2900b003bd1fe4731dmr5145658oij.2.1704705658009; 
 Mon, 08 Jan 2024 01:20:58 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 dm4-20020ad44e24000000b00680613267d5sm2732554qvb.115.2024.01.08.01.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:20:57 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 2/2] drm/dcss: request memory region
Date: Mon,  8 Jan 2024 10:20:43 +0100
Message-ID: <20240108092042.16949-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108092042.16949-2-pstanner@redhat.com>
References: <20240108092042.16949-2-pstanner@redhat.com>
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 4f3af0dfb344..63dbb8d9c1b0 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -177,10 +177,11 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-ENODEV);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "cannot get memory resource\n");
-		return ERR_PTR(-EINVAL);
+	res = devm_platform_get_and_request_resource(pdev, IORESOURCE_MEM, 
+						     0, "dcss");
+	if (IS_ERR(res)) {
+		dev_err(dev, "cannot get / request memory resource\n");
+		return res;
 	}
 
 	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
-- 
2.43.0

