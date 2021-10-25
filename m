Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A44390D2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAE489E26;
	Mon, 25 Oct 2021 08:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF05689CF9;
 Mon, 25 Oct 2021 08:05:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m22so7909979wrb.0;
 Mon, 25 Oct 2021 01:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=p2VW8muZ1mfXuDuh+FPxyttuj+p7jpuN8H0a12gplAAVGRQHpV0TPpQyOpYWmhI8R9
 08S3UtpnxoV+5x0O4ulFSViM0ldDWE33Lv4fjokSDXlZkbC3/R4RueUcnyxOv6zpUWP/
 lbTp+dxMw124BQMMLBxu/f3iv5ANqsTtTd0AwZEaSoH3ONktv4NB7UCh4HrLAsGC/xwn
 qyH5S0zAoJpIQUhPhUqVBDMcuWwd1uRaTzMyG6iHWwVE/s7/vuwo0Y2epYma2uOq49oL
 jbrKEwyX0UjeBgJP1e4lwnj9d5n5//Tr1bcj4e/h2CTwokOrB2aFqXHvuye99n9Wpmpr
 OYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=prfeVJi0Xrd2Y+zeY9Dg8Ti9clUGfDnOblqCadXfcu1lrAmfScx8v2YU3ukiyBNmHX
 gp6ayOyvh5THCv8UpcQSaHnYKJE/Tzb3xMY4d6YNx+3GjBpL6OKlB1yGIdgtLHDruHYV
 l4R2jSN/j6gV4AUBTZURODq+NJoUMFJOdQLQWFmChE8r+xfuErCwflxYqj1h6GyjfZrW
 9VaAANqU0dPxP3XA2HFL65UuxRRtHf5g+W21jcb9cx95FSDJuD7lKrJ33bdopFoiZl/w
 WeI0lrD1uYsIrYhAU4P+AW1OpHOk60n7Y0YvpJBzIww5OvB5uRrY+iQlk7hdiobZ6tgp
 SeGg==
X-Gm-Message-State: AOAM530iPc6M3sp0T76AxacDFnH2qNeeZfqJ3WgYtpp/iKGB/OLKOVYZ
 wfXH01IlTxpgB4h17V03t4QBnspC37A=
X-Google-Smtp-Source: ABdhPJz4vHf5Z8DnSFpI5irZ52Aqld+TwIFza2Oya5uiwSgjSCcthmPTaend0Q/RNf/x3XbaC/HVyA==
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr15977007wrx.354.1635149136519; 
 Mon, 25 Oct 2021 01:05:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l1sm6319691wrb.73.2021.10.25.01.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:05:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux+etnaviv@armlinux.org.uk,
	l.stach@pengutronix.de
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Mon, 25 Oct 2021 10:05:32 +0200
Message-Id: <20211025080532.177424-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025080532.177424-1-christian.koenig@amd.com>
References: <20211025080532.177424-1-christian.koenig@amd.com>
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

