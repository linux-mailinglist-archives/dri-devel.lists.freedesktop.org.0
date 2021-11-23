Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9945A552
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8F6E5CD;
	Tue, 23 Nov 2021 14:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20C6E573
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2733915wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
 b=eLwYR4ZKYqhkoKNUcBKIl/SAfy9xF87d9II49MKgVRWKZESAQ+iJI5bsmv/O0K5s1e
 Y2efcqQ5qKcudBl35z+gXv3uY1Y45G/tmeoZ4VhYgTm9X3+G7ohLsmgSFtqM4IguOr9b
 pKcIBxkYs34qGvCySVkuPFfnf3KNeoMX7k8L80PPcgdZU5A1gj+HZtmEds4lh+2+dHGK
 dYaeTBQinuxL21oFo6vRVJSshjdqgm8z0SzkvdARpXJ7+lAj3ZD3AdeIU9TJ6IEhHQNk
 MRVy30mak+KWX/i7iWZjSMvOIRk21rfcF+2HG85EtBDMKeoZnhgYqpOjmtPF9nBMu8l+
 CHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
 b=8H7qAWreLQLQR5wR4352/ft0dsNL92y1osxGXh1mkEVCcF2WYQ8zZdD1gh9kWAhBjV
 8nd2JaVCBJ7wOHFY6MaUgYqS0dq1dwvk8XYZth10T+WHuo9LwwEVgD4i67Plg7HalI+Q
 mC50oSlgI1zyxVpZxUVXNmQhgSIjhNt7fzXSZWqvwYfGaC2TkE/bzrT0yIUEp47assCA
 OPzA0KIEFEbyXJAOmtxwPL46nAXunocLnm7YkJdPG4/4UIa6b+4dG5sxB7OYKxPk/dmW
 S6v1HbPyBIvAk7qS9Ki0dKwv3JacfhkOkFqU3qfijZ3d68g7173JrbghnC/+jXlr7Eun
 cgnw==
X-Gm-Message-State: AOAM533OQW2PJWijhlIqgU1zqww/il17ya+ndaFpAlTB+RLwTo83zps5
 6FvmyPFG6Vjv/2shajgjH0/3jntEPPI=
X-Google-Smtp-Source: ABdhPJwdudJRBQUyuM6N/s07Qo3lmLid8mFUOvJ3ndWpjmCPTwrY9JZYMgsS6jk9TZToXh3BkzwbPA==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr3642026wma.95.1637677296400; 
 Tue, 23 Nov 2021 06:21:36 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 12/26] drm/vmwgfx: stop using dma_resv_excl_fence
Date: Tue, 23 Nov 2021 15:20:57 +0100
Message-Id: <20211123142111.3885-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 8d1e869cc196..23c3fc2cbf10 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		vmw_bo_fence_single(bo, NULL);
 		if (bo->moving)
 			dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get
-			(dma_resv_excl_fence(bo->base.resv));
+
+		/* TODO: This is actually a memory management dependency */
+		return dma_resv_get_singleton(bo->base.resv, false,
+					      &bo->moving);
 	}
 
 	return 0;
-- 
2.25.1

