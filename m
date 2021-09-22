Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3714144B6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC356EB30;
	Wed, 22 Sep 2021 09:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795AE6EB27;
 Wed, 22 Sep 2021 09:11:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d21so4551739wra.12;
 Wed, 22 Sep 2021 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=Gmi552MnL/rW+Mx1kL2nA/z5dmqeHqcUeGLsCY1r9ovqo+Cj70S1bDU5jIaLP4Hi72
 2RWq9Ldpxz1PQ8QVk0yAxYT5pRSPx//c788ezkmYsT920N0eJBRkUAV4Pn6JNZso8tlS
 sC7jdUlPiZmxL6hEwRe59Hfq+WxGHtSqN/pYF1njdio2/Ce+WIqjFhEf3IenPu4J6dbu
 6y7/SNwvbwMYoofdfflA6up+1DlnLxAEyaV0XKc7GvWPRP9PVpMF+eZSwsGRHng9zqTe
 wVfXF+FWccEkG+BzBHRIzBjSLz8CsiUHVMP0U/BhC8Dl3WW+Q2aZRYESHUSUOF9TMqgO
 cd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=aJp4p9bkhChvYVhsePnEBkdKyTqfDfuCEgdbaC4KgnBasqet5Bpu+0eirLO5hefTtq
 5SF7rHqucdNl6P47oys7tk5vLRJStPvJjse4EWT8ISv6bdx+oK+2/2rK+VKaMlbQzuEK
 PUs5++jvxeY7obgHAhXe4KzbTC+Wdv+P0wqJ27Va2w61reDgCMUAdKFGwNyXJWtTyezX
 wghtnjqCgpl+uLtmTUa9ZztPN712AHlr+4Cd/32KiWIeNHzBqwpkTiHUZqs3C7rgj1nL
 u9ggcUSs4woR8GRH+IMe5u6oCxj4ludONnVN6tt8O/2vimtLLC1yo1H6BO5OlFIL9fIY
 KQHQ==
X-Gm-Message-State: AOAM533tYp+bucep0dyxrCtf8g0jiZfRpIVrYVzsJZqkxEgEWEsslfER
 7JMM98eciyjDf6WB79eGp9s=
X-Google-Smtp-Source: ABdhPJz2W3gVg8Vc8l1hiYyOeCkZWJPcDFjNex2fXTdD3lXlKStjs/7cgs4pYVTghyezxOJ4PIGTtw==
X-Received: by 2002:a05:6000:105:: with SMTP id
 o5mr40077220wrx.413.1632301871073; 
 Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Wed, 22 Sep 2021 11:10:43 +0200
Message-Id: <20210922091044.2612-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We certainly hold the reservation lock here, no need for the RCU dance.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4dd7d9d541c0..7e17bc2b5df1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			if (ret)
 				return ret;
 		} else {
-			bo->excl = dma_resv_get_excl_unlocked(robj);
+			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
 		}
 
 	}
-- 
2.25.1

