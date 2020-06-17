Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCD1FD669
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 22:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9FC6E181;
	Wed, 17 Jun 2020 20:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9026E116
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:53:25 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id h185so1736259pfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q2vFanbkC3uvjUoe1v3YzWZWXnFy1tDZVnwieI4nd9Y=;
 b=U1vB3FFXCBnFJurQB75heRhAW7lMV3f4bkk1rZ/IrcNCPafx08mjlJhLOcBRbKMvh6
 UW+tkU7o/v3J9aEa+zA6BqkttVnr42asCTQMjKL4vQ/LmR4xM+dGsZI+vhseLnhBoKha
 qQ55Vc6TJJE1qTzsoTkNFpgmFrBQHrY11gowCx7PmbM0rBZBfwrj3hQ5/F9IqZcvwdh+
 t2yXOcOiqIgY5Bc0qxtlfoLNBGI4y0MC1a86lltnPbJ34qY1OP8TMcMlUD2VI1ndg2RA
 AQCtYvKCqXTtckfzYIQpyl803MP+SrpWF/SjyUXqpDbVn6aBd1z0vCXxLslDMhEvBEtH
 CSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q2vFanbkC3uvjUoe1v3YzWZWXnFy1tDZVnwieI4nd9Y=;
 b=lZP69lhe39dDKC8Q9ZpHXWUraFavSyVwG2SVxYGZaZttueyhXr48RtlMDJX4frCrAR
 BbhngorxsMcFZLERxGiKV7VwibdSpuM60Kj3gO1WiqsLZeZgEW1Jj012BkG6RgoVE9Np
 tZYIKT4qpPsx8nL0XN8RG8DfZtIOCCef2js1Ak2+EkEk99UQY9jCpFKnx+5K+BzNTbWa
 nJvZ7g3wnaO5G78Yaa4jHOWCTjlw/iybyvmUYVdVjPhrlyPhrjiwTgIY7J6t7G9AajOw
 x2z3dy5yejkeR+nal+j0mf5bNOuS7fcGqKhRuhF9rXYEroR05VpacuhZIAFHQX0TpLmX
 lFkQ==
X-Gm-Message-State: AOAM533GwTCl+TKF2nnDI0qKE68x7owX5tSgymXG7U6hMiuuqh9gthOx
 GyjDbRm1j7Uj25Jx2QHGHqY37fLCbNUPaA==
X-Google-Smtp-Source: ABdhPJztQrP4O1BHPZxdSGgbABHzOJqmU7cZUuKr3wGa1+knYDpG0udKd8LAT9RleSRBWs6SNIbsmQ==
X-Received: by 2002:a63:a06b:: with SMTP id u43mr572047pgn.294.1592427204507; 
 Wed, 17 Jun 2020 13:53:24 -0700 (PDT)
Received: from miranda.anholt.net (c-73-11-63-120.hsd1.or.comcast.net.
 [73.11.63.120])
 by smtp.gmail.com with ESMTPSA id ca6sm392454pjb.46.2020.06.17.13.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 13:53:23 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH 1/2] drm/msm: Fix address space size after refactor.
Date: Wed, 17 Jun 2020 13:53:09 -0700
Message-Id: <20200617205310.2183722-1-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously the address space went from 16M to ~0u, but with the
refactor one of the 'f's was dropped, limiting us to 256MB.
Additionally, the new interface takes a start and size, not start and
end, so we can't just copy and paste.

Fixes regressions in dEQP-VK.memory.allocation.random.*

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..5db06b590943 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -194,7 +194,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		0xfffffff);
+		0xffffffff - SZ_16M);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
