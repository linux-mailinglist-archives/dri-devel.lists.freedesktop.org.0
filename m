Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB845123C22
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95D66E201;
	Wed, 18 Dec 2019 00:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E696C6E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:59:48 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 4so208901pfz.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5G3vqL50Y3G4+e2Z9a/oR925neu1RDq2V1MgCTXG78=;
 b=TY3c8EMHIzub8LsQpF8QjRkf6a9scjkmtEvpRqc3aCUQ9n2zp4fEL9UmgURk8lF8u1
 IhiDhw/9SaT06pmdto/O7a09poSCRVbPlruBcA4p884QoCKdjJlnMvKgV/LGwBVsB3jz
 L9PZeKlgbP/uFklpA4zPK3bi2vFc7WQxqqk4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5G3vqL50Y3G4+e2Z9a/oR925neu1RDq2V1MgCTXG78=;
 b=geoErim35GBa81RSbbANwLYHq6kfn49gQT1ehaA6SjJMbruWAhtwIeOWSTxMQJgNMa
 Jsmf+tsHdwROFXmqwUsFuYEjtxQOjaOGvnPbFjB+MdkiDZtuKo1RuH41SQwUjJVP3LB/
 AupF4vZIfUZvPgofxYdhAfTu9wIDDdX2X5en4TZ9N2ORTPOQfD8gJujbM2iQvImxg9BB
 Ct+tM+oO3sVpxUEzjpIIMvFApVSWYU15RB8mUdbnDemujMNkieg4oT+xZ99a8SnW+X2V
 jxPxwhmZXzgONgeEw04k7IqMflWVzyaXDkGzZqulhI5Ywi8gjmMQrtGOKBl8D3RRawmQ
 JJhw==
X-Gm-Message-State: APjAAAXbGREWZRl0Ap9DrLhBxB2SNbhjelXfGLSLAyy5neE9xK38bM7+
 hyT1I1jHroNeVJyrIeYD8x5UCtJLfGU=
X-Google-Smtp-Source: APXvYqzf0pjVrGliirEIoA08ZDX7BT6UXayldWrnT3uH5Y9S+sUuKXO8T6gE8jiHqwn3qkyNQYOYXQ==
X-Received: by 2002:a62:e915:: with SMTP id j21mr773908pfh.42.1576630788398;
 Tue, 17 Dec 2019 16:59:48 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 16:59:47 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/virtio: get rid of drm_encoder_to_virtio_gpu_output
Date: Tue, 17 Dec 2019 16:59:23 -0800
Message-Id: <20191218005929.6709-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
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
index b2270153528c..45b4c3324b2c 100644
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
