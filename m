Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362A4177CC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6746EE60;
	Fri, 24 Sep 2021 15:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8FE6E1D7;
 Fri, 24 Sep 2021 15:31:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u18so28727239wrg.5;
 Fri, 24 Sep 2021 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=qcTCwplmusmyAvJ40fwoarKDm4FklaUId8KuFdmldXBzzf7vYkFVTyGyrhxR1exe+a
 Ti7FFhKsfqQldIbzHeSQHl/TSs9QBtevczGTSyno+qKVRsDPyPX660zU8DjZofoZojaW
 FNBfpXcAWhbxnD1RL0eiFC5NIsuYG9iBDJwWGfziefGeY7RRSGCSKm29W/jS4EI+WeOC
 x2TjnDEX7xTqdcQVq/6V1GNr8UvayIb2+zzF730lCN0tXYiLqK7eUMVsXcW0Dw6sWMCg
 O6fFa1PsdYFIB+Ok6yr8Da4ddQbOIw3OET21Mtlp0kAmgPA7Jzw4pdmsBA8BV/ZPCGtt
 Cf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=ifMwxmMIcEYm091C6Vg8i9pvyWpHcgINJ1xWvR0Frm1yV7NNTYa8jpGguAm2LAm7Gk
 9lOXbYggEyTSzKfcy9CSoIfySRsj69PPgrx3Xs557RxrT4QNloo3jOW9edD8YNZTLrsK
 jArW/d53eVCDTS1if2RysM9JfFffGA5h6C0JDLm3dDulYTP2Q6Ur5qO+SoZJym2sb2II
 LX9XtArntSZqf9SuCQbtM7qkiMjw/L8hOQHs3BReMMoA8gy6Tew0PdQwTfVyMhvZXvio
 QULNMWonfzcnJF34Gp9J8mde7xZ6BT6QQJOHoCxWv7IE+Csyj18T17T1Lu6lmLKbJnBQ
 20Rw==
X-Gm-Message-State: AOAM533i7ptt4CR3uOYlnuuE4hm9PO3AWS2BWWxW37eB0u90alDl12Q/
 gM0HG/TJeYCRnudsX3ThBtRqj5QrCZE=
X-Google-Smtp-Source: ABdhPJxH7t42u6+VO/+NY11r/YcaQHT6Oijj6TbR+5kXQxpt0qv0iqBvhkcje1t5rM51uMyYkthXsg==
X-Received: by 2002:a5d:618c:: with SMTP id j12mr11983777wru.189.1632497503516; 
 Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 27/27] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Fri, 24 Sep 2021 17:31:13 +0200
Message-Id: <20210924153113.2159-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

