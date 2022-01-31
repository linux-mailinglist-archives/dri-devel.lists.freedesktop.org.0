Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521894A4FEE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B610E2CD;
	Mon, 31 Jan 2022 20:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02210E135
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643659964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMwMeY9OoKGLOudbA8SLCKYnBWFNuNdP5Adg3VOxotk=;
 b=ONW7Q3aAHy7HwtAxmHGlfZKHTPtDwT6ckGH1kVZrXrLNkYJNsXdlu7qR24KkdsqXGfL885
 msovsWGTNHEXNlRDIJQTGpior7Q5jZFeYob32k8FJNhtVQv1Pnv86zRJeGGYpMS23S8Wt9
 KGdzniv0EF1BTjg+LRhfASwbYC8Sejo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-hbSFwn6YOmq8elYRWde6sQ-1; Mon, 31 Jan 2022 15:12:40 -0500
X-MC-Unique: hbSFwn6YOmq8elYRWde6sQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j21-20020adfa555000000b001db55dd5a1dso5263075wrb.15
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMwMeY9OoKGLOudbA8SLCKYnBWFNuNdP5Adg3VOxotk=;
 b=XLcXOAdYrT2XMhRqzGXeEbL8EwXeHaNFOZ3qubJkF0LlpvnL9kBRYKkdk4LHTmfN/K
 0CkxhTnZ8VyZc5exYjr9nqv2FFbNjELlPKJTqQGPvV8gs2dzWRVwmpyKVVxNVoxkfzEW
 Q/xcwDrXN9HPZkFiBOjFRh3V6I033c8Xwr0lWCTH/uC9gFXI+EZ52FSZK5Qk2RyjQm3u
 rZS2ayVIt99b6ekVlOTTFx2lUgsJB1J7k6X5Dikq9sTJRqaMU0OgNzcovKqBEgXy5hMr
 O6EQoZKm6hD7n+VuxFDBNJR6zgCkFzy1Enurl0VID8dwVEEEOynrw7qL9dOrS8zTDw4K
 ZoSw==
X-Gm-Message-State: AOAM533xL6DidWQY3L6mhFxuZiraTsnHBsRjN0f66auaQq1y3JZIzuVc
 NsbEm/dkLQGiR0hTbxugbrrLmKoTcmt4tHckeIjDBCQ9BBPUOS3KfMldq2hN31JcMlOeP3PHda+
 8TO2aC0dEHnfLgzf/IfbvPDsCS6gc
X-Received: by 2002:adf:fdc9:: with SMTP id i9mr9272905wrs.142.1643659959706; 
 Mon, 31 Jan 2022 12:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLFCAwqF+47z3/CXQ1yVaeyTKTvJhusKYHuUgXJhivec2+bdBcovNbm/WasPrsQVybnZaQ+A==
X-Received: by 2002:adf:fdc9:: with SMTP id i9mr9272887wrs.142.1643659959514; 
 Mon, 31 Jan 2022 12:12:39 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i9sm15124660wry.32.2022.01.31.12.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:12:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm: Add I2C connector type
Date: Mon, 31 Jan 2022 21:12:21 +0100
Message-Id: <20220131201225.2324984-2-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131201225.2324984-1-javierm@redhat.com>
References: <20220131201225.2324984-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There isn't a connector type for display controllers accesed through I2C,
most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.

Add an I2C connector type to match the actual connector.

As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
type"), user-space should be able to cope with a connector type that does
not yet understand.

Tested with `modetest -M ssd1307 -c` and shows the connector as unknown-1.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_connector.c | 1 +
 include/uapi/drm/drm_mode.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2f..975a7525a508 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -105,6 +105,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_list[] = {
 	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
 	{ DRM_MODE_CONNECTOR_SPI, "SPI" },
 	{ DRM_MODE_CONNECTOR_USB, "USB" },
+	{ DRM_MODE_CONNECTOR_I2C, "I2C" },
 };
 
 void drm_connector_ida_init(void)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index e1e351682872..d6d6288242db 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -421,6 +421,7 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
 #define DRM_MODE_CONNECTOR_USB		20
+#define DRM_MODE_CONNECTOR_I2C		21
 
 /**
  * struct drm_mode_get_connector - Get connector metadata.
-- 
2.34.1

