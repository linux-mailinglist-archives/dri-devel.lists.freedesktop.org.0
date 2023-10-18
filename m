Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7A7CE623
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 20:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB2C10E457;
	Wed, 18 Oct 2023 18:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BA110E044
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 18:17:31 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-27cfb8bc7eeso5686045a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 11:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697653051; x=1698257851;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8D3OOIrCOIDtlEK9pF0rvrHP6eIarWu+uB2ztLd7Yh0=;
 b=KaCvrop11o+XeitPRvnWHVgJxoVXbOhtzflQANioYBA0gp3qHiqZaqIQVfCM5KQg+g
 og6H3CC97FmSb46NomzNM/jJ59t9GMtW24jlrQQ+SmYZ5V4s4Mn0XxfuafEFgKHDWn77
 tNzvDyh1Hg+14/lSUzN03c1pbeuP6Jz0C323w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697653051; x=1698257851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8D3OOIrCOIDtlEK9pF0rvrHP6eIarWu+uB2ztLd7Yh0=;
 b=Eofx1U66dTMruxw49jEvceY8VDUkJrIygpi8r/XLHRSHaJ3JKgJQQkEgVCWE1iFQM9
 +i+qGuKraib8YJgSbRqwUbk/uZzFjohH0vPV+W55d3RvIWRA/qlOXPnRMTtyfp09MrwA
 dKiGeRgDR6GJFHtjB+wVbKh9qzSocXXf5etYNlS50nNaX+vzZxJ9DHtDrUnSLrZ5xaaP
 0Axs2saHmw3gT0YG7FjLQHhcAu0OIxS4VxZlamuQ9GUSTnZ2PHMeTSPndn1mj2vlx/Fi
 a4L2vC4MH5AgzRG/tWh93BiGLf4H8aFFkDXBBfRV9yRe8yc/BVQrGWJz1W0jbBggWmC3
 yrWQ==
X-Gm-Message-State: AOJu0Yxj9oM/lZAnAOXnVIalZQBRFOFSbxQQ9Yxt30rZaW06vsTYc4HF
 2I4oIwEL2Dlq9L857yddqo4gJOZexvdTrs5Y+1Bv+g==
X-Google-Smtp-Source: AGHT+IEWnwP3aJvT2kM8uGqdAhZ2VrJpkpb5MCwyaWRpOybpKquIrcjN5uAKrBdPG41coSxagodiBg==
X-Received: by 2002:a17:90a:d246:b0:27d:48e1:d1e8 with SMTP id
 o6-20020a17090ad24600b0027d48e1d1e8mr5810889pjw.13.1697653050675; 
 Wed, 18 Oct 2023 11:17:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:26d5:64a4:ffed:7704])
 by smtp.gmail.com with ESMTPSA id
 fv23-20020a17090b0e9700b0027df6ff00eesm16273pjb.19.2023.10.18.11.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 11:17:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/virtio: use uint64_t more in
 virtio_gpu_context_init_ioctl
Date: Wed, 18 Oct 2023 11:17:26 -0700
Message-Id: <20231018181727.772-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com, dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_virtgpu_context_set_param defines both param and
value to be u64s.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Josh Simonot <josh.simonot@gmail.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b24b11f25197..8d13b17c215b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -565,8 +565,8 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 					 void *data, struct drm_file *file)
 {
 	int ret = 0;
-	uint32_t num_params, i, param, value;
-	uint64_t valid_ring_mask;
+	uint32_t num_params, i;
+	uint64_t valid_ring_mask, param, value;
 	size_t len;
 	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-- 
2.42.0.655.g421f12c284-goog

