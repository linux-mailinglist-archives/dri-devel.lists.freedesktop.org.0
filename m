Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1E57319D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8B198859;
	Wed, 13 Jul 2022 08:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0200F98854
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657702510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3fERHzEDfrpIpAaHxv/FCy1Dds4VbBEuXgTRXd5v5g=;
 b=G1JkPohvy5emCHZrHAUHoznzO7PM8VOssQbMHiDGjW4d0Ii4ElhvB8af19gQPdeupc5IUA
 Iouob4HbM5myRQwpcIa9dqvGxt9BzluNSwzZuQMQheIMaCZJ5+jBNIYBgDPm9D3yHmOVMP
 thfzJ17Ml1FHuVn+I6gUf5hp8KfDAJ0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-CtOZd0NRM4GDkRNkk5z8Mw-1; Wed, 13 Jul 2022 04:55:07 -0400
X-MC-Unique: CtOZd0NRM4GDkRNkk5z8Mw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f9-20020a056402354900b0043a902b7452so7885310edd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 01:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3fERHzEDfrpIpAaHxv/FCy1Dds4VbBEuXgTRXd5v5g=;
 b=FVx+wqHgzVylitKZFMbni7KtTdRXotOhYHgwazQ816DWNi7HThT8Fc3cm7bYXc9TPP
 7Z0Y4I/12qXxJrusVGR+uNhnE/wz15XOUOf7/5AXlQesUSVCGmXjO+mc+aOWNyxs3Uw2
 KS91i5TrQ3wSi0OdugQA0dsGRQi/AQlxu3Ecb+0s6LpHHWP7db/ta037ImcxTZOUiMnZ
 Wxv0DwY+wMuOMHFsh7hss6TPRUuLgFDOV7c2RLkuHCg4m8YMpUC95dCaGHyffUwnNIix
 dUjymgUMibnX+5gwL4PLCkm04iWOwClkVHagE6tZjd4azlp5sL0ieHzFFtz+cg058ISL
 TbYA==
X-Gm-Message-State: AJIora+NlF+B1AD5ndbC8S5q+Lyy8Qz+b3FiAhW0Mf6IZFm8OsGLgnor
 V4Fruvhidewonxyc86DoljIljfoE4ydIhxGHuBSVwn3FmzgikNt+eNy5ABz7rNCCh8VoqzI8/p9
 TfFKrscn1cvJYQo4gXoTHRiwRvdrq
X-Received: by 2002:a17:907:7ba2:b0:72b:57da:a76e with SMTP id
 ne34-20020a1709077ba200b0072b57daa76emr2335171ejc.210.1657702505820; 
 Wed, 13 Jul 2022 01:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uksIFx91JCqDk9omGQxTIKHtiTQi4JvUWD17uzFSAXXgmV3IwYsfa6uUC48C2qiTpru10riw==
X-Received: by 2002:a17:907:7ba2:b0:72b:57da:a76e with SMTP id
 ne34-20020a1709077ba200b0072b57daa76emr2335162ejc.210.1657702505630; 
 Wed, 13 Jul 2022 01:55:05 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056402088200b0042dcbc3f302sm7547655edy.36.2022.07.13.01.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:55:05 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: emma@anholt.net,
	mripard@kernel.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 2/3] drm/vc4: crtc: use drm managed resources
Date: Wed, 13 Jul 2022 10:54:59 +0200
Message-Id: <20220713085500.1970589-3-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713085500.1970589-1-dakr@redhat.com>
References: <20220713085500.1970589-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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

Allocate the crtc objects with drmm_kzalloc() in order to tie the release
action to the underlying struct drm_device, where all the userspace
visible stuff is attached to, rather than to struct device.

This can prevent potential use-after free issues on driver unload or
EPROBE_DEFERRED backoff.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 9355213dc883..4b0c61cc3265 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1273,7 +1273,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_plane *destroy_plane, *temp;
 	int ret;
 
-	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
+	vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 3579d487402e..ae2193fe3b29 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -479,7 +479,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (irq < 0)
 		return irq;
 
-	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
+	txp = drmm_kzalloc(drm, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
 	vc4_crtc = &txp->base;
-- 
2.36.1

