Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761131258F3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302566EAAF;
	Thu, 19 Dec 2019 00:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5713B6EAAF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:57:47 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id d5so1669176pjz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUO/gJqCQHDyHEB6RMGjWAS1WsBR8FjyTpPhLy3SnwY=;
 b=NbekFNd6poLw8cYghDsHiEm+yGyi2V1hanTFOFGg8rbtnMeUBI4u/B1yfGttMrAJOR
 cSrFpkmJ6iTtm2cCwHwCGmfnOJuHoQo6n7sYqyD48z17/nKXsNsFUnZoesJ1XaBDObTr
 W6j2ZFv4hR4UZjKcwo0Ughds0sM5OaJFLyhcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUO/gJqCQHDyHEB6RMGjWAS1WsBR8FjyTpPhLy3SnwY=;
 b=RXp2pwfQix80TZ35ta5IuhTx0KK/gI7TRNcXGX6hi/l5INTjqAmvby0jBmJ9ejPEXx
 HV7HC0M1hrALrHblUKBBGq3Xm3JKZhsuz0d1IMMOEzwfyRV3iWX/bVBWYt3nL4miHmcX
 w2Si7kXEIbijo90Uzw1ih1RCEylzB+zmzT0N94nmy3fGywohKoxKCRx23idJ+2Yr9Dlv
 4uVIjhbhqqTaN9ANcCokQ1WO9DBs2l1WUnMbWBGwVzXpK/VyKddZ8lIbGz2Ql2dTPVIP
 ASqw8fRlX92Pb7CH8yzT/7UnvAMOkG3VJ8aM+vF187Ntk1X+OxKGyzyQlRmuR/e5kYWh
 ywEw==
X-Gm-Message-State: APjAAAU6XwdCiLgbPYUOFhE8NwKiotTB/lLaZ64Hk8KY4+5eIfmPknIH
 JM+hJWhZdku1/moBkzfpFAJL2/CF2ok=
X-Google-Smtp-Source: APXvYqwG91xGRjRLuXVutndLLOD2krWxzoaJJ/3f2wLDUZR1m/GWyONI1fmYRrTxTZ+iE+Re7wt4zw==
X-Received: by 2002:a17:902:8d95:: with SMTP id
 v21mr6075378plo.61.1576717066522; 
 Wed, 18 Dec 2019 16:57:46 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id f23sm4651553pgj.76.2019.12.18.16.57.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 16:57:46 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/virtio: get rid of drm_encoder_to_virtio_gpu_output
Date: Wed, 18 Dec 2019 16:57:30 -0800
Message-Id: <20191219005733.18960-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219005733.18960-1-gurchetansingh@chromium.org>
References: <20191219005733.18960-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used anywhere.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index cf09e4af2fc5..3e0580a8d818 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -137,8 +137,6 @@ struct virtio_gpu_output {
 	container_of(x, struct virtio_gpu_output, crtc)
 #define drm_connector_to_virtio_gpu_output(x) \
 	container_of(x, struct virtio_gpu_output, conn)
-#define drm_encoder_to_virtio_gpu_output(x) \
-	container_of(x, struct virtio_gpu_output, enc)
 
 struct virtio_gpu_framebuffer {
 	struct drm_framebuffer base;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
