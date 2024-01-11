Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A082ABB2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E210E8D4;
	Thu, 11 Jan 2024 10:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BE310E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704968093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwPn8i5O4VeqDYOYi0h7MKwVZXEs2j45ok+yxqKOjYI=;
 b=d2gRAhEowtwwbAbOgPE4TdpEWoBTMPv0S9L9hdHmuESAA3YHwgniHV9XyXqU+1Uz2tX38j
 PPqtXapf1sd2tQz+Twyn0ZpAyUi+3GzIZ0ikWyhf3Zjd7vGyiAsnA6azN9DLF+tlzQL2NT
 K9e19H7HXfpU6qOZM6vp05YVv8xJzyk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-8RGnipgaO-6HjnkXxQ1CZg-1; Thu, 11 Jan 2024 05:14:50 -0500
X-MC-Unique: 8RGnipgaO-6HjnkXxQ1CZg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42998e470e9so7109131cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704968090; x=1705572890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwPn8i5O4VeqDYOYi0h7MKwVZXEs2j45ok+yxqKOjYI=;
 b=cjBeZ06LTjTLAETiqHu8LG9R8OYPHq7H/P1aC6QsSW4yBVJmfbbdPYxyw3AVMDxEY1
 BkbWbBUxKhqdT/YvgG4FrE77Hueir/TKYy/u4kC5Jczb/SXf1gm2+IDn8mp/jhpEW9hP
 k5XNdn+MzaYCRI5aSj1A5FSiL4I7ZqOCI9Zw5UaYbxySW+nbXROCtsRvwmmGeIDAQ/LR
 33BP3M6RKo4ipwYbFpN3KbIu2kI7Tyy9kDgnlrJTXaEtHxS4HXbfnnNMka9uvAt3c49O
 JfNsrT+V2ER/+AVqm6L6dI5hVQZFwaeSuDwbeq8Dl8mPj6p+7enONi4XdLKmKg+lU9A4
 YWJg==
X-Gm-Message-State: AOJu0Yx4p2l9ZidNa8Z6NlhaZEIQ/PWmj1yydVStrHmffhCOh70JloLP
 bAblyUK+03hEeBEBkl33ZpO3eMLrobJq03T4d2cv1iuPNnSM1InDxkqM7rbuuai6QE0x2aicLMW
 CCL0uU3QPkoQhM0X2Vlp7uGhGbulkZiGRjeHK
X-Received: by 2002:a05:622a:c3:b0:429:c64e:bbf2 with SMTP id
 p3-20020a05622a00c300b00429c64ebbf2mr721896qtw.1.1704968090147; 
 Thu, 11 Jan 2024 02:14:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVQIy0jo0pMVepzO0+SBQFVp2mhz3xvRaaT4o8KZrz1F6USNhJpdkki0vHfUo+Wzodq5ZSLg==
X-Received: by 2002:a05:622a:c3:b0:429:c64e:bbf2 with SMTP id
 p3-20020a05622a00c300b00429c64ebbf2mr721872qtw.1.1704968089859; 
 Thu, 11 Jan 2024 02:14:49 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 eo7-20020a05622a544700b0042993549c3asm313237qtb.32.2024.01.11.02.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:14:49 -0800 (PST)
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
Subject: [PATCH v3 1/2] drm/imx/dcss: request memory region
Date: Thu, 11 Jan 2024 11:13:46 +0100
Message-ID: <20240111101346.15193-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111101346.15193-2-pstanner@redhat.com>
References: <20240111101346.15193-2-pstanner@redhat.com>
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
index 4f3af0dfb344..d448bf1c205e 100644
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
+	if (!devm_request_mem_region(dev, res->start, res_len, "dcss")) {
+		dev_err(dev, "cannot request memory region\n");
+		return ERR_PTR(-EBUSY);
+	}
+
 	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
 	if (!dcss)
 		return ERR_PTR(-ENOMEM);
-- 
2.43.0

