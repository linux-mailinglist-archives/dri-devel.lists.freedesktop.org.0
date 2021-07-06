Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8883BC93C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB55889E2B;
	Tue,  6 Jul 2021 10:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99DB89E0D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:12:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t15so22047040wry.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alESfScLytQX9JM52hp8x+R06biiZDCDK6DB8lrJ+yA=;
 b=FaVz+VWvsN1jTj+2WLJMiKYCPRODcwhbPTNDcaUrTvSqo4GP/2B0dAnaiA1M+cl3Ux
 lICvh6lk/M5pEXYJfzxrPKftQ6uCA5jd0TFq0AEaqoRDQgk8qFYZlVUrOKPtJQZBYGsq
 5fWGYf/xAgIYrGTMGn/qW2HSG9yDXqdUafuHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alESfScLytQX9JM52hp8x+R06biiZDCDK6DB8lrJ+yA=;
 b=pKo2X6mazFGX4omu4b0CtI3A3gutoN656y6kVGknhzu6NxFAK6E8hpEFMKaomvz2S6
 VwYm1ILEhlCwH6QBRiL+cSds89DAiBZSxVflDF1WMiNyOORXr/d3dLrxowVl0vpGdz8O
 4lH50QOe7SFDFUcqD5Z1xjztsPkkKLy2lPlShx2s56is2/yj6Z5RQ48wxGQjGOs8LwJt
 SXtC18OUvL6UIr4fRFvT4KkPbpqeeqfL3d/TwCWriAPlV/YYIb5ifQfZz5UvPp9TU+sj
 lOLwRiZPnX8FpWR/OXgDZ1jobATekgW1XpDqDizQhS8FFTn4OIBJEeMo+E1QutoHzTgf
 bqug==
X-Gm-Message-State: AOAM531AHfdYc0LdDPBHCrz/hXKTmFJqlXYGLcHe/k4EnfWshmtX3uhf
 XD41STPUcv4ThhGQzd2mNx9RaO70i0iI9g==
X-Google-Smtp-Source: ABdhPJz9tPE3hHWb/E/uWqNBA+l27PfFlt7ZddBhzNIiYo3XXz2teh/NElarlXr3cm9MsFvHKD/wEA==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr20664995wrt.138.1625566339633; 
 Tue, 06 Jul 2021 03:12:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:12:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/i915: Always wait for the exclusive fence
Date: Tue,  6 Jul 2021 12:12:07 +0200
Message-Id: <20210706101209.3034092-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're lifting, or well, clarifying that the restriction that shared
fences have to be strictly after the exclusive one doesn't apply
anymore.

So adjust the code to always also wait for the exclusive fence.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 91711a46b1c7..271d321cea83 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -601,10 +601,10 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 		for (i = 0; i < count; i++)
 			dma_fence_put(shared[i]);
 		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
 	}
 
+	excl = dma_resv_get_excl_unlocked(resv);
+
 	if (ret >= 0 && excl) {
 		pending = i915_sw_fence_await_dma_fence(fence,
 							excl,
-- 
2.32.0

