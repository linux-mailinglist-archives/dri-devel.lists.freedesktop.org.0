Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CD6B3FD3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3810E1D7;
	Fri, 10 Mar 2023 12:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC310E1D7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678453192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2dYSWwUySYcCPwCj0zZ4jmWfYgjqhwsnkIueYQNMFPE=;
 b=MNoi+Eb94UVzO/uy6aqvlyc/zbGr2iDBmS5+j/qCYQ0cKN8NVxGaNOqAxxDrF6KaZ25qAE
 IUfpqsLTSaDJeOEc7Ja6B8t10ECkSJ2onG3BUrEj1h2o3aBa+2c9FtdSuo44wYHWumk9h9
 dIihT1Jyyg7UMpOnD/m4HyhpVQk1Vhg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-ROedaoMLPR-s5fa3zTv2gA-1; Fri, 10 Mar 2023 07:59:49 -0500
X-MC-Unique: ROedaoMLPR-s5fa3zTv2gA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcd1a000000b003e71cde0e70so2158159wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 04:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678453188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2dYSWwUySYcCPwCj0zZ4jmWfYgjqhwsnkIueYQNMFPE=;
 b=VrKTwZgiJnokzSFzNacOU9Zi24Fp3LwHDhaqdjkfb8M4PnzrHUXjy/9ao2i7qeFqNn
 JCd1Nx8ibbhxIwy2rSyQut8P3GcQiXnxtsWij2Q/dylpxuufvbDTt08WKEplu2tZdrNo
 jZXprimfBcM6V4ovAiO2XmWPyPMCMDl5WAw5VuCQfid60Qfqw++59oJ/WMB5ax1EsGn2
 IXeq1/yxL8eAA0jxT/ykxt3REvMrs42Bj1Pw94cDwYRVl+BBVS7U7/Y2LtJKu+vzE5X8
 NEIiSceqrWmM79dReRHMfKRXe91dSCuusgmOzXon+7C5vHHNjxlv1Y48m4qqvtoKJ/fP
 cp9w==
X-Gm-Message-State: AO0yUKXN23qxKNwfJJGqvP97OVK9yYu9uD7mhYc6Tb4vphqoJrBhcXLN
 UZbk1X5SWMV1PL80sIMzlyAcNrVWPxMAMKoEE1Dvlrz7OvXIAgI7ZOZS4TW8zG/Jfuio5Y8iglu
 WVFEa9PWZd2USAI2/30JrF8TBybWJ
X-Received: by 2002:adf:f78e:0:b0:2c8:bf89:39be with SMTP id
 q14-20020adff78e000000b002c8bf8939bemr19183564wrp.7.1678453188172; 
 Fri, 10 Mar 2023 04:59:48 -0800 (PST)
X-Google-Smtp-Source: AK7set80rTJ2zYZH0pCoVKSCAU3hAHXk32L0Gs52YHTKrZjmlC0veiVbVbzF6MfqPtBHSQ3xSq1nyA==
X-Received: by 2002:adf:f78e:0:b0:2c8:bf89:39be with SMTP id
 q14-20020adff78e000000b002c8bf8939bemr19183540wrp.7.1678453187892; 
 Fri, 10 Mar 2023 04:59:47 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z26-20020a05600c221a00b003e6efc0f91csm2072799wml.42.2023.03.10.04.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 04:59:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: Enable fb damage clips property for the primary
 plane
Date: Fri, 10 Mar 2023 13:59:42 +0100
Message-Id: <20230310125943.912514-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Albert Esteve <aesteve@redhat.com>,
 Enric Balletbo i Serra <eballetb@redhat.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Christian Hergert <chergert@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian Hergert reports that the driver doesn't enable the property and
that leads to always doing a full plane update, even when the driver does
support damage clipping for the primary plane.

Don't enable it for the cursor plane, because its .atomic_update callback
doesn't handle damage clips.

Reported-by: Christian Hergert <chergert@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 4c09e313bebc..a2e045f3a000 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -390,5 +390,9 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 		return plane;
 
 	drm_plane_helper_add(plane, funcs);
+
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_enable_fb_damage_clips(plane);
+
 	return plane;
 }

base-commit: 3e853b9f89e4bcc8aa342fa350d83ff0df67d7e9
-- 
2.39.2

