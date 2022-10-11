Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB7E5FB894
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 18:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC2910E83D;
	Tue, 11 Oct 2022 16:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E2010E836
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665507115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sz4P4Z4QEIQJ7tRSOPnfB5n0/AjqOBcHz0ZToIWPFi4=;
 b=UE8Mezy/knJGPM+LXumAh//IVstDzDLcVkgoQs2CFGMjKEfxs+mCbKEhJtd7cnt1lAatSk
 Q2zR1m0REevntsWD29WoNIcYuiKNjDh1cZt/Vfi4IdBQpJdT/6vlzNcZyuAe3SnF8v7jXD
 yyDvtT9IxGv0yxwqlDvDOHdT97Qdwsc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-P__Z4JZMMVefpK_ys6iWMA-1; Tue, 11 Oct 2022 12:51:53 -0400
X-MC-Unique: P__Z4JZMMVefpK_ys6iWMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so8731260wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 09:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sz4P4Z4QEIQJ7tRSOPnfB5n0/AjqOBcHz0ZToIWPFi4=;
 b=crtvIJ6XHLrXUVKnbBZUThiAckFRodEAIIvCLGbsIDCKTcpDM2znMn22hWwpoTV1XL
 8GufCTN1nsXUHtWKJ8/ea/HP4fL/O8Uvu+1WBh7LVouCKzzgs8Zr7SRIYislE+GZt+IG
 VHEQjqkoG0EKm6p5fNJiZ95XftcIIA0ZIaiWBYP2PgpRYChdmRDY/F0+6R7QUk0MmVuC
 OKMjVPLsAhiEYuh5pvw6Gfjw3Zq8lBiulwI/cEUREMTuO59+uhZGDWBdL+5WWI/E9kej
 4flkqPN5BULaUTshnAXEmy0AsF1EGwgVnjeO2u0OAWexhlUO6wd1QA7zHEgdkgAGT7QO
 13TQ==
X-Gm-Message-State: ACrzQf2/YDLHAVk0UIfcqYRCuF9HCkmdq+6vpTaqh16bamheJaLpJ/qp
 WZNZK6NujMZz31RI1GU45ynoOqOBFYYX24RlBpdnPlBU1IUYaI8burYXiuKim6+mnDedaF8s6jH
 jLZU76wkUxaGZby2z/5Xou6ILymI8
X-Received: by 2002:a05:600c:5119:b0:3c6:cae1:1512 with SMTP id
 o25-20020a05600c511900b003c6cae11512mr30891wms.80.1665507112207; 
 Tue, 11 Oct 2022 09:51:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5U+XbYS3G1P9BD3p7rBLERKgQ1Sen4O+UBvYTZW1wRJWgLPMDaK7PiKSRaj+mRj9bHXSiUJw==
X-Received: by 2002:a05:600c:5119:b0:3c6:cae1:1512 with SMTP id
 o25-20020a05600c511900b003c6cae11512mr30866wms.80.1665507111840; 
 Tue, 11 Oct 2022 09:51:51 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003c6c76b43a1sm2025629wmq.13.2022.10.11.09.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 09:51:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/simpledrm: Do not call
 drm_atomic_add_affected_planes()
Date: Tue, 11 Oct 2022 18:51:34 +0200
Message-Id: <20221011165136.469750-3-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011165136.469750-1-javierm@redhat.com>
References: <20221011165136.469750-1-javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to add planes to the atomic state. Remove the call
to drm_atomic_add_affected_planes() from simpledrm.

On full modesets, the DRM helpers already add a CRTC's planes to the
atomic state; see drm_atomic_helper_check_modeset(). There's no reason
to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
atomic_check() in simpledrm. It's also too late, as the atomic_check()
of the added planes will not be called before the commit.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/tiny/simpledrm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ecd49a8f3334..f03f17f62a56 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -549,17 +549,11 @@ static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					      struct drm_atomic_state *new_state)
 {
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-	int ret;
 
 	if (!new_crtc_state->enable)
-		goto out;
-
-	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-	if (ret)
-		return ret;
+		return 0;
 
-out:
-	return drm_atomic_add_affected_planes(new_state, crtc);
+	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
 }
 
 /*
-- 
2.37.3

