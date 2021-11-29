Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE80461487
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7A16FA5D;
	Mon, 29 Nov 2021 12:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C3F6FA56
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:06 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p18so14369567wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOCzCCGRhx0Yd+XBoLOb3ENe6v2ley+rjFyWG7N2LJU=;
 b=Q6X8MelaozaQwJKcGk9PhwHDUcDD0804yBPKlQUpU1WahVImfNpIKG/OejgeytkrVR
 A3wNCR3VBtNfSkPSL8va2GAnQvspMA6Veaw52bQrGuFdVnEJxM3Mg//xlVyVog2LNH6N
 u3PuAcHbhNX4JVUslAoJDcdMWtA7GeefmOIWvi0al+OncC5jRO0s2lR331gCBS2BpUaO
 7QA/1eafmE1MIbH5CacqhElctbQZD4c+EoiPi/xvpWyC8rGSlA5xIaFqjlNz5k7BoY7L
 SNDc+sadmIsANRckOh362ojch30ULQgLgSzba+Pmp3jkOdz90y6AOUNnKBRFSa51v0ZC
 ksVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOCzCCGRhx0Yd+XBoLOb3ENe6v2ley+rjFyWG7N2LJU=;
 b=z/9l21RRgkU0QFsGyOyIP9HEACW5H1FSKIx1ICSTy2CtexXYLrVw5gG4gZ5xIx1iSH
 eV+Xwygl14dr3WJ68WrsCHOvbtakrQbMPPjIbD+tBOL0+Fk37CZJCL+A6V9dGq+TufAE
 7DOJkwGQo6J5yzspLn5yO1+AgDPMtRgtaKyqnXcX1deWN+VpaeUVxH3+sqaLA08NrDam
 JamzXDj5iI7Nqc17uxrmyhFjOnsY7ZOHHrzjOQX8EQQIDfzQA509v0qfbLVzcAB13KN+
 8pd0GHGKOzMMO/P8bPibBpWxSSnDovnlAFNaaGr5Qz9s11NG8XQNkTaczVgusalazFXF
 3TdQ==
X-Gm-Message-State: AOAM531yUBmtIuD00GIQ8N6Ooo8nh5O9QA8dR3032d09jtX7Ph8Z69Rc
 jxCKmHjN+rYDVxvUnpud1Zr+4cdn5Sc=
X-Google-Smtp-Source: ABdhPJwP9DcyaVQ4UYDvEecjYzTaOmhgzoezNR1SawExuKjdgJBNc8PjMSFTpKkeIGvBtMZEVrk4eQ==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr36318388wmq.195.1638187624754; 
 Mon, 29 Nov 2021 04:07:04 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:04 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 02/28] drm/ttm: stop pruning fences after wait
Date: Mon, 29 Nov 2021 13:06:33 +0100
Message-Id: <20211129120659.1815-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

This is just abusing internals of the dma_resv object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e4a20a3a5d16..fc124457ba2f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1086,7 +1086,6 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	if (timeout == 0)
 		return -EBUSY;
 
-	dma_resv_add_excl_fence(bo->base.resv, NULL);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_wait);
-- 
2.25.1

