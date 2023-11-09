Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C17E7028
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63110E8E9;
	Thu,  9 Nov 2023 17:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AE410E8E9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699550717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sDHSqMuo7yUORgn5WByoTm7yhsDzWS7QFyd4p9GXpM=;
 b=Azbi/CywvQpVvHBsBe2SZ4W97QOqHRiL2MMgAzKXDqgxHedN0GpPgPmFVs0fri4wMEjP8N
 DnrMvUHVS4Vk4eK9BwoAsLGO7selwgRUK1/hiERX0TuA/vsy3wHnuxOGr6Qo35t5FVUDjm
 08StyYWn8cv+nXRxirXgz1isBIAMWFc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-8bAlGuU-NDqei1OZqp8qfA-1; Thu, 09 Nov 2023 12:25:15 -0500
X-MC-Unique: 8bAlGuU-NDqei1OZqp8qfA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-507b9078aaaso1101067e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 09:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550714; x=1700155514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sDHSqMuo7yUORgn5WByoTm7yhsDzWS7QFyd4p9GXpM=;
 b=LJuzEK/Lxf3Ce7bNB0P9V+OeXkfls82277LnKHXkTzfz8f9j7+oCZEmNP7IDar0mbm
 fXtzN1Kp7qkpcaYerXq3t6brnmh5rxnHvW5jzIgVzyHbAjPuXk+kfAk05ujUvkDJiBiM
 lq+e4LoBrU+o/XjZmKFYbLUGAWDkbJOD39TGKTXZQ1ph+v8U9rNJMkBUTtV3bgCqXEj0
 6zpASad7rhecB8skHbUdTx+uI3ORPg2doLlAQ9tTEqM4g/IHMb7rukVoOOqKF1cZcl38
 adTjZozEjpLWc5tpQHyGF+ftdrff2vzSQHnHBS97e0vXQGTxMzAIdfjEnDssytdTm1Ry
 lEZg==
X-Gm-Message-State: AOJu0YzK9FRlZRrS8lmuWs+3vWqFQM1lHWjQ6J3gyU+3MOAzxlePwvI9
 YREqxb6VooW5sA/hNXLMg3iX/h0iwcszhmIeAKBe+kFvZ2A53R2MzZIB6kEY5A8a8s1DDY+94pn
 1I0PKwfqeHSMDZM73vwjoNCfxnIZ9
X-Received: by 2002:ac2:5e9e:0:b0:507:a6a5:a87b with SMTP id
 b30-20020ac25e9e000000b00507a6a5a87bmr1916878lfq.51.1699550714257; 
 Thu, 09 Nov 2023 09:25:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJVNz0Dz1HSXbQ0UB49yuozjenPpk3U6wkuD6qjSBnU9rrxSOmkfygjO1wSFqzgZsRaJXpyw==
X-Received: by 2002:ac2:5e9e:0:b0:507:a6a5:a87b with SMTP id
 b30-20020ac25e9e000000b00507a6a5a87bmr1916854lfq.51.1699550714038; 
 Thu, 09 Nov 2023 09:25:14 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfed81000000b0032fab28e9c9sm119847wro.73.2023.11.09.09.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:25:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/vmwgfx: Use
 drm_atomic_helper_buffer_damage_iter_init() for buffer damage
Date: Thu,  9 Nov 2023 18:24:38 +0100
Message-ID: <20231109172449.1599262-5-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does per-buffer uploads. It needs to use the damage helper that
handles buffer damages, rather than the helper that handles frame damages.

Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 1489ad73c103..91cda125784e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2912,7 +2912,7 @@ int vmw_du_helper_plane_update(struct vmw_du_update_plane *update)
 	 * Iterate in advance to check if really need plane update and find the
 	 * number of clips that actually are in plane src for fifo allocation.
 	 */
-	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_helper_buffer_damage_iter_init(&iter, old_state, state);
 	drm_atomic_for_each_plane_damage(&iter, &clip)
 		num_hits++;
 
-- 
2.41.0

