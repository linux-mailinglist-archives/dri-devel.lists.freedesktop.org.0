Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C24EABD7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6310EFFC;
	Tue, 29 Mar 2022 11:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B1710EFF2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:03:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x34so20222261ede.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I63KWJjnEnfW4wLG1kKjMoZsjw2mVT8jrrT6vbeBCxY=;
 b=k+SdvbubqzUneJzpXHK/38pzqjYpl6XhnyXbqdKL1oPxXjeOXvxt73ckxeRJS8eBrw
 YMYMsddD3YVsJS7seVtfPZJ/9gS1aWQ76m5y76aodtsy9HVnWQWmUzYPOhg4JFyLRRcE
 jxNGzLA6jE/zJ3SB4S6RIv8z+eUgYDHqPkQBxW8I9n4MtkWCpm+XTDJxCySciHd+WU2l
 fa7M6SxGIvDKztAJXs55nQCwm25XfQoW9iXh2hqvE/XRc4y66f/d06L9p+A3ZWBAjC92
 NNWsjND0D8EF3dQmd2QNCZdldyPTztR+n00gVHtcIlJShFek+M0GczWTrjX0j5AKGsCM
 /NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I63KWJjnEnfW4wLG1kKjMoZsjw2mVT8jrrT6vbeBCxY=;
 b=bzJgegkeh/nNIih0TFDzsIzFPhaHOAtxKb97MguI+N1vEXqAyNX5hsat1PfvDa4VaF
 AvG/WiH26ZMtJI/Hw+gOnR4obHMpFsnPxOs8qNAJf0Dcf4JF6Nlrwe74K4Wo/YjTwjeS
 8XUYHBl1H2lIo4OLHMNU7X3vHW8QIWzdcrQ+c5aSHtPxGFFGa9HS5CnwBfwksOc0K0Y/
 +aWGEcdae8VthI9g9n9IA05y0NTHGaKNSa7y3sO8C7pDrTwFfQLswgbpX+Ur7fXrFyUZ
 Rb/HyoW7cq8Xd+pWaCcO4alrHsr/km3nLOaXY3QTOTv+galEONDGUc4W9OkpJpcB5f0d
 bkMw==
X-Gm-Message-State: AOAM530NMzn517o3rxZcQvIy13YReXY/iVlHuOkweePuCDyzC2yoLYio
 MAAGuVqShW86ozqd/nVXKNw=
X-Google-Smtp-Source: ABdhPJxMNcKsTAK4lIDoYAKZnmgW4HHirtrGSRwoqXE4ujjEru6h3S/j2oyxyDFR9gPq9lFq3ObwXg==
X-Received: by 2002:a50:a449:0:b0:418:d875:1730 with SMTP id
 v9-20020a50a449000000b00418d8751730mr3728046edb.371.1648551778995; 
 Tue, 29 Mar 2022 04:02:58 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/nouveau: audit bo->resource usage
Date: Tue, 29 Mar 2022 13:02:40 +0200
Message-Id: <20220329110243.6335-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 43c862bbbbfb..5b937d68a291 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1003,7 +1003,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Fake bo copy. */
-	if (old_reg->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
+	if (!old_reg || (old_reg->mem_type == TTM_PL_SYSTEM &&
+			 !bo->ttm)) {
 		ttm_bo_move_null(bo, new_reg);
 		goto out;
 	}
-- 
2.25.1

