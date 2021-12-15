Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB0474FE1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCA410E173;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB1F10E173
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MqjWG1xfqU7ex1w07duXfO7CAxtpTTEsAHmOGPxr88=;
 b=O/KqVRDROzWoXPGfwmevL8rFPn4O+TazlarQj0uKp0tMApOkjk7ufxZqfzLBHvlamWtxbO
 ytIbxOUQkWBvEZg/HjaYLjlGddPiddXc4dMiwcKQpuVfeUL1QaP4n8bKhblKCNisWYyurP
 t3XD1ON4crv33gyqtMDaTzxKElEje80=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-tF6ub5cvNYmTa9lfeIdzyA-1; Tue, 14 Dec 2021 20:01:38 -0500
X-MC-Unique: tF6ub5cvNYmTa9lfeIdzyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso13892326wmj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MqjWG1xfqU7ex1w07duXfO7CAxtpTTEsAHmOGPxr88=;
 b=xo8/oOZXh3cmDeW9XgtlhllBnhFpZm1SKY5TO3EYc/Y2okxRAGus/STu+9jrH+YCOw
 fwGAAlh2/yCGKcl6tNDSYxtSm8eDlLOVmwLMAvqbyqkpSudnxtEB+vCCSQSr6yZVlbIZ
 RD1Xj+g5G1AtWPedLCdcLOkVvSGmsPRxrPcPA1ot9o6YQmZMapaRv3bhhmUkhV+7zKC/
 OQX8Im+8z3e0XBvs37hR/vSBa2m2qUpsgjd/tLkzw3LbdWsgIQNfxwMGACj7QkmOqLlk
 pqerqs2KvKLxfLl6hIwLheKDxkP/MgmeKJV8SgIbneBKqNhpQOBuAyKbpniSd0PqhoIS
 y69g==
X-Gm-Message-State: AOAM532ACxtJ3bqxpz4mj02TKGUhe2xGZamf91qEGnBJBlx7iZbIUKZL
 hykzCcgiHjdLuXsg5KhJvWOaUwdtX622OgVXZWLZGOKvcUY3fUEGO0bL5CfCxoy5tfe9AtSZ6wA
 Tnh2sF+Qf7h5NZ6h3dsiw0hcI/ljM
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr2269516wmq.120.1639530097585; 
 Tue, 14 Dec 2021 17:01:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCl+Ug9yU5uFjldGykl05Hl7w6RRr/ctye85ysOcS+o7yaZs9fd51nyFO6kfPtOoS57jVVNQ==
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr2269509wmq.120.1639530097440; 
 Tue, 14 Dec 2021 17:01:37 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 55/60] drm/st7735r: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 02:00:03 +0100
Message-Id: <20211215010008.2545520-56-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 David Lechner <david@lechnology.com>
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

 drivers/gpu/drm/tiny/st7735r.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index fc40dd10efa8..841ec1c7bb93 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -190,6 +190,9 @@ static int st7735r_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	cfg = device_get_match_data(&spi->dev);
 	if (!cfg)
 		cfg = (void *)spi_get_device_id(spi)->driver_data;
-- 
2.33.1

