Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118740D8D6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6DB6ECFB;
	Thu, 16 Sep 2021 11:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57DA6ECF9;
 Thu, 16 Sep 2021 11:31:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 70so1631174wme.5;
 Thu, 16 Sep 2021 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=YGi6nayBrATbkCwhODb20MMXGtroMBuKFMKiHSpJJV84T7YPBMkg7CwT9yPOmEzaMY
 trLLjeu0tg/oH00K/7iQvk8em2sGrsXzPB4IBR3t8l+Dd69D8w21E33PhiV4gQhBmjzy
 Jph7qutv+y2T98vsrK7Uo7w/nfNrugX8T5RmkYuye9s8Ak6lH5VFKB6o8jqn8puOwlEz
 8Q15+fJQdkq6urpvV6xJJ9VeyzP3TnE50YOUCXdy9EHKIZp92aNx2WY5sNW6hK54QFC9
 DnTzwBkF1fSezE/3okJ1u8g/dwnIbJAWe/5l6yaoEEz+69FFK6GtWy5iAWe9USzWdV18
 mAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=aMPuCnti7FozBzGC9rAKT7R+CK9PY1Ie8xAp0+yPczVt1ArdyXMIuK91d/Kxq5ZLjd
 Veoo7zrk1rNLS8ZBhqwV9DWfVKxOF31FLv80efDjTEXmXTp6FgvBfSR5as4xytFYISQK
 8Yiym3XSbzWHLkxZcSUHbc05WLVYXbTW78NpmMuIjEmf1xceedSTYPb7VH7q2cS4/nrC
 kvDVwYV0A08TzOWo6KaN4PaAbgh8PU4Fd49lr1LtSPPYYr6KC8f1FWL9itAVnGcVRxAj
 pOrq+vkyMyD6Z5dQGdSiWekpVmXk4p9UA5b3EDiIHPKnvLJfm7KxO95EQz//clfzGixH
 rUmA==
X-Gm-Message-State: AOAM532J3zk9O1cJ9cmgzaZ4QpYblw/fc0G/0SnvdPVMimGeaoMs1Ff/
 2jQhn4ELvB5z59vGxvf9HpG2oC1lfjARdf3G
X-Google-Smtp-Source: ABdhPJwJty66BSyg38f1izgxVMtOw1rMBUp0M6VJ3qfJd8Pw1yVyfa9N0AZ9pcJVuwFRWddvkeyNxw==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr4499247wmq.131.1631791868032; 
 Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Thu, 16 Sep 2021 13:30:41 +0200
Message-Id: <20210916113042.3631-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

