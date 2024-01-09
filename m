Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446168283D7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0C810E6EA;
	Tue,  9 Jan 2024 10:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524910E6EA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704795647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wy/M3ANrToiVi10PzVfO4hUq8Am1qDGx7AcrnHuqv94=;
 b=PDjWg9hYalRXTET7KsF/2BpWk8C0LMtqwPyYOXJ66t2VN/l+9w4M4r9FYZDRjoEcbcX8Nw
 31Zw2fT28IlE9luxYu+SakO6ct5ZWPQVwm+znAas6zTeaKveKiE0Bsb2whxNBrn1Wlap4e
 a/BqVYGFVg+Ozbh6kRQ7uC4TfbgiM2g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-E2yU0p9wN16SS8YRmclaJA-1; Tue, 09 Jan 2024 05:20:45 -0500
X-MC-Unique: E2yU0p9wN16SS8YRmclaJA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-427b6c5d8faso7180881cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 02:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704795645; x=1705400445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wy/M3ANrToiVi10PzVfO4hUq8Am1qDGx7AcrnHuqv94=;
 b=e8BEGxZwxqrSqezV3dqLrF2/Ck/2FOi8FF3KAPgAaQlWEdnpO1LytSxpkvh/EsAKwE
 bOzM0ZDrkLKATUDCnrm4rln/IYsUGvYICzLffJ5BiYPC0Nn+yGIGNSzaVbPWkbDxXH1O
 WoCM063UqbfimeybeCSG5PftoSKVc/i0ikiMz1OUclig5rKhTc+CR9K2sIivYT+2maof
 ldFtNDR0+baxRLvQ5XA+F/sfl/55+T4LTYeL6bDpiftrU7QKQGylHD/mpvMWqropBiER
 cnilhMHwYyguWfnIYLxMwsTSSAb26f4oRHwY+/4kPKVZuZSKhTZi2DickQHgW7XFQOla
 0zlw==
X-Gm-Message-State: AOJu0YwTdV9VBFE4DCryiJ2UZK9ibfFkMaSMLO6UILO6jJWmiZEXKiFw
 EPT5JZpirq0h/YsY03kOiR8WaJ0+75xmU7fqcs5G7gAdQklMAECJPglXcF3rxJ2JDFgf+cpI51f
 4qf/UFumhZWRJEtDiGFriFx/1M+dZu55v9m+m
X-Received: by 2002:a05:620a:410a:b0:783:52a:25a0 with SMTP id
 j10-20020a05620a410a00b00783052a25a0mr10760005qko.3.1704795645177; 
 Tue, 09 Jan 2024 02:20:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRJB76EgsOKxHrFXwYwzcFBNOSiztF/miafI4SjzA6CTawNFc6YBCvLUeclZxtDzc8bkApsQ==
X-Received: by 2002:a05:620a:410a:b0:783:52a:25a0 with SMTP id
 j10-20020a05620a410a00b00783052a25a0mr10759982qko.3.1704795644878; 
 Tue, 09 Jan 2024 02:20:44 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 m24-20020ae9e018000000b00783217607d6sm679695qkk.115.2024.01.09.02.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:20:44 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] drm/dcss: request memory region
Date: Tue,  9 Jan 2024 11:20:31 +0100
Message-ID: <20240109102032.16165-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109102032.16165-1-pstanner@redhat.com>
References: <20240109102032.16165-1-pstanner@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Philipp Stanner <pstanner@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 4f3af0dfb344..1f93313c89b7 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -170,6 +170,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 	struct resource *res;
 	struct dcss_dev *dcss;
 	const struct dcss_type_data *devtype;
+	resource_size_t res_len;
 
 	devtype = of_device_get_match_data(dev);
 	if (!devtype) {
@@ -183,6 +184,12 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-EINVAL);
 	}
 
+	res_len = res->end - res->start;
+	if (!devm_request_mem_region(pdev->dev, res->start, res_len, "dcss")) {
+		dev_err(dev, "cannot request memory region\n");
+		return ERR_PTR(-EBUSY);
+	}
+
 	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
 	if (!dcss)
 		return ERR_PTR(-ENOMEM);
-- 
2.43.0

