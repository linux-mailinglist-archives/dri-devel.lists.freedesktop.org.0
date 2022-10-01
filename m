Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81835F1DBD
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C0810E664;
	Sat,  1 Oct 2022 16:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D576410E664
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpNq1qUZhKiifLu+KM9SiJRwdNZ6qs1ZpRyRyQhvDJU=;
 b=MsEHKoFDjbaAjsA+VAOwkRx698L6+hBmaCWeTFmIOqg74RynIghy1UBy+tw29MBNiq7O+4
 7KBnydH651Tb3kclI+GRB+Zy3t0JQiHS4Y2UNO126IA8DmL0lU+X8EzD78Ls1VBZbYBl1H
 MoQf92Evc72a1W+pPrNQi/2MxxTxsgI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-efyGjX-pNHKyc7TV6WuHyQ-1; Sat, 01 Oct 2022 12:40:05 -0400
X-MC-Unique: efyGjX-pNHKyc7TV6WuHyQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so5730668edd.10
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gpNq1qUZhKiifLu+KM9SiJRwdNZ6qs1ZpRyRyQhvDJU=;
 b=GE8VSVvRX5V09PJQvspGHCaN/1pdt38Wyx7wIZKft11lseEo2d3CDrFIqQksvTXDX5
 puoB4+7hSYT+WOJIkzXClqKEQ/9A96SSyWbzWrAXqzOqClQnGfak4vj6gx5Yo90XiyQq
 5MoqLIflCV1qstmFWfOwdMt5aixBTe1pbV7D3XG8OOEr7g72TkEUSO6YD4KycXNj7rY4
 IswOAIyn9lNMuf4S+2cAX++VDOkY7jLtvB/NKvDdk0lj7hHIhOY2LU227CZcLOmOJufa
 0694JUi9xK+PH8eC7KPW3P2QmtcDDgUID6ITJkHgxlpmK4QXsB0dwj3lvwAlS2qcffHi
 SZzw==
X-Gm-Message-State: ACrzQf3AW1EKdKqmZATWEEPiObvpW0cAM/EpMd9KlDhexHCrRDjjOcDC
 rtuZRjoq7vibHQuCRFwawos4UjatC43Yo0S01dnc4bkF3gTGaXSJ59AUXvt7JcsZL+DjLXySKux
 yVqBRBDwQBFhYbADheaN1SRx8Z02b
X-Received: by 2002:a17:906:58c6:b0:782:bfb1:eae8 with SMTP id
 e6-20020a17090658c600b00782bfb1eae8mr10275550ejs.546.1664642404641; 
 Sat, 01 Oct 2022 09:40:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6dlsCgBFNn35lBrJDeKfcylAkcj1My9M18VcnXKYSMaZYumIZ4S/welPhel8+NRewGbsWS3w==
X-Received: by 2002:a17:906:58c6:b0:782:bfb1:eae8 with SMTP id
 e6-20020a17090658c600b00782bfb1eae8mr10275528ejs.546.1664642404187; 
 Sat, 01 Oct 2022 09:40:04 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090653ce00b00781d411a63csm2878086ejo.151.2022.10.01.09.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 4/9] drm/arm/malidp: plane: use drm managed
 resources
Date: Sat,  1 Oct 2022 18:39:41 +0200
Message-Id: <20221001163946.534067-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001163946.534067-1-dakr@redhat.com>
References: <20221001163946.534067-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm managed resource allocation (drmm_universal_plane_alloc()) in
order to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 815d9199752f..34547edf1ee3 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -68,14 +68,6 @@
 /* readahead for partial-frame prefetch */
 #define MALIDP_MMU_PREFETCH_READAHEAD		8
 
-static void malidp_de_plane_destroy(struct drm_plane *plane)
-{
-	struct malidp_plane *mp = to_malidp_plane(plane);
-
-	drm_plane_cleanup(plane);
-	kfree(mp);
-}
-
 /*
  * Replicate what the default ->reset hook does: free the state pointer and
  * allocate a new empty object. We just need enough space to store
@@ -260,7 +252,6 @@ static bool malidp_format_mod_supported_per_plane(struct drm_plane *plane,
 static const struct drm_plane_funcs malidp_de_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = malidp_de_plane_destroy,
 	.reset = malidp_plane_reset,
 	.atomic_duplicate_state = malidp_duplicate_plane_state,
 	.atomic_destroy_state = malidp_destroy_plane_state,
@@ -972,12 +963,6 @@ int malidp_de_planes_init(struct drm_device *drm)
 	for (i = 0; i < map->n_layers; i++) {
 		u8 id = map->layers[i].id;
 
-		plane = kzalloc(sizeof(*plane), GFP_KERNEL);
-		if (!plane) {
-			ret = -ENOMEM;
-			goto cleanup;
-		}
-
 		/* build the list of DRM supported formats based on the map */
 		for (n = 0, j = 0;  j < map->n_pixel_formats; j++) {
 			if ((map->pixel_formats[j].layer & id) == id)
@@ -990,13 +975,14 @@ int malidp_de_planes_init(struct drm_device *drm)
 		/*
 		 * All the layers except smart layer supports AFBC modifiers.
 		 */
-		ret = drm_universal_plane_init(drm, &plane->base, crtcs,
-				&malidp_de_plane_funcs, formats, n,
-				(id == DE_SMART) ? linear_only_modifiers : modifiers,
-				plane_type, NULL);
-
-		if (ret < 0)
+		plane = drmm_universal_plane_alloc(drm, struct malidp_plane, base,
+						   crtcs, &malidp_de_plane_funcs, formats, n,
+						   (id == DE_SMART) ? linear_only_modifiers :
+						   modifiers, plane_type, NULL);
+		if (IS_ERR(plane)) {
+			ret = PTR_ERR(plane);
 			goto cleanup;
+		}
 
 		drm_plane_helper_add(&plane->base,
 				     &malidp_de_plane_helper_funcs);
-- 
2.37.3

