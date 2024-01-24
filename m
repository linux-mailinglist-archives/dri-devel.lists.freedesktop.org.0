Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142DD83A797
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 12:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B2110E9CA;
	Wed, 24 Jan 2024 11:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993DF10E9CA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706095181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaA2C5PYtumt01jPaH2L+2eGuFjEsntK8inT+e3/Q88=;
 b=Fh87As1gQF1ZOKudNaoY/BmYe41Lx86zJK52eI04nblPoTnHVH1XXMwpNp/jSTs7/Y/mSg
 2/qBqxFryrRkzfcQbg2PR8EA1sOHa4/6m+A9EkPl414FQnJ5kAkrjwz53tsaQWgT14SEbB
 gVGuBfZuzPmmyB9d8TInGZ6mKx9OaZQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-mnVG2aUXO4ixacdNd7nZhg-1; Wed, 24 Jan 2024 06:19:39 -0500
X-MC-Unique: mnVG2aUXO4ixacdNd7nZhg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68517c60b0eso2771256d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 03:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706095179; x=1706699979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaA2C5PYtumt01jPaH2L+2eGuFjEsntK8inT+e3/Q88=;
 b=O0z/Zk7G+ysup6lfmimym0aIg7BN9GqyBpAwI+zUfE8vpvaOAqgBf7vAfm2LGC0cpL
 fwMp5BXqRmpVxExUPjFqIJdnT4JiESgIbAFlGDchd7/dBxsQW2Vswn3EVXggVb9RnZKc
 kyFpuXqCsjVsnZLnuXGv4kx8zV1AqY/W5Apo4U4XoRLn015BQkzPdTWoQjxtudhDoHrk
 iFVUHPM5X/e6M3Sjk5KeDWTqF2NRkiIQPNC6QHqqlYQGUWyCvccOPtK0LpCDthcpTu4h
 cOim58Ib9V4MsZqU8BVGmKaZVuHd0AMExND/3MwqiJxzbRJ/JtjmG8+Y74EMPyGkDDQM
 920Q==
X-Gm-Message-State: AOJu0Yxksfagt5Sx27p7i98jxR1meM/BS9O33E7yWt2G8ybFgpZv7FWj
 BHJf/ls0UvZTVOEBR/7dDVu7rQd693g7LRP9QjCLj2CBgmOrvANVrVp9ZVxm1ToRQsVg3h8+tuo
 gyv3s1w57mEM3aQEJAop+A7y8WbNtRZdhhRv55+U/1n02sf9tNCTBSqmmL7JNjgu3Tg==
X-Received: by 2002:a05:6214:1d26:b0:685:2465:5b49 with SMTP id
 f6-20020a0562141d2600b0068524655b49mr1899684qvd.5.1706095179190; 
 Wed, 24 Jan 2024 03:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYS88+M28R+fEZ5DmWrk/clm4AHy6UZ3aTWylHEKV7eS6226fnp4mYXCUPSsT8AHARYsBrlw==
X-Received: by 2002:a05:6214:1d26:b0:685:2465:5b49 with SMTP id
 f6-20020a0562141d2600b0068524655b49mr1899657qvd.5.1706095178867; 
 Wed, 24 Jan 2024 03:19:38 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ql3-20020a056214540300b00686aa6dbcbfsm1027016qvb.81.2024.01.24.03.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 03:19:38 -0800 (PST)
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
Subject: [PATCH v4 1/2] drm/imx/dcss: request memory region
Date: Wed, 24 Jan 2024 12:19:04 +0100
Message-ID: <20240124111904.18261-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124111904.18261-2-pstanner@redhat.com>
References: <20240124111904.18261-2-pstanner@redhat.com>
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
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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

