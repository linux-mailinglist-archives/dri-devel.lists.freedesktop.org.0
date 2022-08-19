Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4559A79E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3AE10E485;
	Fri, 19 Aug 2022 21:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9378410E6D3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qabemuj06WeoMtZf9HrAveZ66zZ44DWBaH/ByyW71MM=;
 b=Xj+KSjmSjtJDFRCgN4FuEo4C3D9J2+Umu9CZtKAgMscHo2lZ8WAz4XDoHQeQYaTId4uNl4
 J/2EhWEbugllOlOIJFFC5iMVfzrKMZTiktSmimmMfoDvOV7SOf5ToW2jR8z8qJaGpPiWbe
 TzsqkdVUxsGqRlJareFYmiKI9OE3cRA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-LOJkvoyIMuetbzj2jF6jlQ-1; Fri, 19 Aug 2022 17:24:49 -0400
X-MC-Unique: LOJkvoyIMuetbzj2jF6jlQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 j19-20020a05640211d300b0043ddce5c23aso3344686edw.14
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qabemuj06WeoMtZf9HrAveZ66zZ44DWBaH/ByyW71MM=;
 b=tzMms/a1l4MUkfK00HlpCuLb4GL3f3xx5YlbU25NQlAcInSfcsAT3EBB85ZB7gZPvw
 f6i0A2QVhDN+a4v6+GR3oqCdc3WZf63gqrNpf6YsFlEw9Ko6JFFzoL2eHatZROIAXRkE
 YTKphaVgHWFjl/QqCJif7BCxDuSeC9xDklYUu4la3auJ4lgxRr80ZN6hZVqanTs1tPSj
 R7E8IZtmTmOnEUjWwbxGQK+QT6W5F9gStl3MoSigEGR7rZ5Lt8ZfRxxh61v/rzn1mvyV
 rcjDq44BozqDwzB+fSGbNsMXxAwPDEo0VVKOc4aSsVn8puh3ADGd6OQpCxKXRsXd/qrH
 /4/Q==
X-Gm-Message-State: ACgBeo1/2+ivMPBgLy5G0ejKyZPdTcirK3uSJcTXYpz6eF2jE9led1p9
 S/+5SazoXZiHJyB6Sck0h73aYjqK9CfcHrQ0smdmDfYja+0KtTBxDPLYay000tONMwvYkQ2vzrV
 N+W0G5zVVxJeKInF3AtB5AF+riOK2
X-Received: by 2002:a17:907:72d1:b0:730:a0c4:2aaa with SMTP id
 du17-20020a17090772d100b00730a0c42aaamr5757442ejc.560.1660944288439; 
 Fri, 19 Aug 2022 14:24:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+OgT12yPU20ztpomqJKCst6cahhGUss/gNkPlFCza36i5yJPP9m5o6KfAuZAYV46c1N0Q1A==
X-Received: by 2002:a17:907:72d1:b0:730:a0c4:2aaa with SMTP id
 du17-20020a17090772d100b00730a0c42aaamr5757428ejc.560.1660944288245; 
 Fri, 19 Aug 2022 14:24:48 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170906579500b0072fa24c2ecbsm2842999ejq.94.2022.08.19.14.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:24:47 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 3/8] drm/arm/malidp: crtc: use
 drmm_crtc_init_with_planes()
Date: Fri, 19 Aug 2022 23:24:40 +0200
Message-Id: <20220819212445.559790-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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

Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 34ad7e1cd2b8..dc01c43f6193 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -514,7 +514,6 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_funcs malidp_crtc_funcs = {
-	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = malidp_crtc_reset,
@@ -548,8 +547,8 @@ int malidp_crtc_init(struct drm_device *drm)
 		return -EINVAL;
 	}
 
-	ret = drm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
-					&malidp_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
+					 &malidp_crtc_funcs, NULL);
 	if (ret)
 		return ret;
 
-- 
2.37.2

