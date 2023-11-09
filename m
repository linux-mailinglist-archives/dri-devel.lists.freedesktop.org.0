Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E67E7025
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ADF10E890;
	Thu,  9 Nov 2023 17:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996F510E8E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699550715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0steN0/ACKFTtJOvpHMkiOMUe7bddz5OgwOILeHxPA=;
 b=A3lKFepho4J9ud6CksUrN6W8KfjvDWtpH1672v52zjROYN3hirks6cJeXFy4UpDLMxWMTC
 m59ylLX8seMAaUkjETiRouUcsHYpDs+3XlPo8p7ugxUn8odV7fRMUKPU2mYJZJhzATm5s5
 LXp+JSBZ/O+UKr0gCwk7+u+pzrXGPys=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-004SySzeOuKP1xsdyY333A-1; Thu, 09 Nov 2023 12:25:13 -0500
X-MC-Unique: 004SySzeOuKP1xsdyY333A-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5079630993dso1069144e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 09:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550712; x=1700155512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0steN0/ACKFTtJOvpHMkiOMUe7bddz5OgwOILeHxPA=;
 b=KYrMb0lPbA58imN91VCySp0fAbH7SwCfLwKsUcAQoEsqQeAMQv6ecF/NqTQODrgczM
 ot68eQCnZ0xX7NFd1vp59/N+G7j3XaXmR0OlCTm2S++d/0v1Ie29BVYiEy/egAcyo1ct
 KEJrSWCTdGwyVeS5KW7emoAdUn4jn5QnhoLOVghAsbDGqypgpXLTnOUEk8Y0/GSCgiew
 bsXQjO93lAWOJv5bSqBtLDotOX28fpwrBLgK5le01nsS1mYATTkHfBWhglsAfcT75CBk
 Sw1gY9H/o9z3sy1Y7XfN5JCNyFcI9iuEB19mAEDGmY/xSvH5H9d2fZtF+sgyRwzp42St
 vmGA==
X-Gm-Message-State: AOJu0Yx30PZTPma8XXRdDvUmIfyRQ7wj8YTM2nn/b0Zx/JXswEtlVjkf
 U8Ex8A4Sja15bhdbTW+jrRBE9JLPU7GyfA75Kjh0DUKpdtX9Zl3rIp5agsRibPqL0n1dXN6Usyu
 V6P2/dMfyzzWBpTI5RgfXvpFmMLqH
X-Received: by 2002:a19:e007:0:b0:507:b935:9f5f with SMTP id
 x7-20020a19e007000000b00507b9359f5fmr1877865lfg.24.1699550712275; 
 Thu, 09 Nov 2023 09:25:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENtuNNft+jXRPbq2qJhlZT81jWdLguxD1V9O4aFnQJMyc+8VWIMEbR49N4zRWK0Yg8oNcUMw==
X-Received: by 2002:a19:e007:0:b0:507:b935:9f5f with SMTP id
 x7-20020a19e007000000b00507b9359f5fmr1877857lfg.24.1699550712088; 
 Thu, 09 Nov 2023 09:25:12 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f15-20020a056000128f00b00323293bd023sm135806wrx.6.2023.11.09.09.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:25:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/virtio: Use drm_atomic_helper_buffer_damage_merged()
 for buffer damage
Date: Thu,  9 Nov 2023 18:24:37 +0100
Message-ID: <20231109172449.1599262-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109172449.1599262-1-javierm@redhat.com>
References: <20231109172449.1599262-1-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, stable@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does per-buffer uploads. It needs to use the damage helper that
handles buffer damages, rather than the helper that handles frame damages.

Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
Cc: <stable@vger.kernel.org> # v6.4+
Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/virtio/virtgpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a2e045f3a000..1adfd9813cde 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -183,7 +183,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		return;
 	}
 
-	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
+	if (!drm_atomic_helper_buffer_damage_merged(old_state, plane->state, &rect))
 		return;
 
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
-- 
2.41.0

