Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421638AD6E
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C169E6F422;
	Thu, 20 May 2021 12:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FB589807
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a4so17424212wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Az4ajU1UenYP4llap6LwYGAmlVb81FxvttX6ntbrKHw=;
 b=V0/Xcd4FORtoMvNKBEs95Uqtk9Dfnrrj1mowrOIgtUtj97/HkDTL7uz6D69vwAGAS3
 Tdl2wWWjwYVP6GP3fWhFHoNUw4SNR/zAKwaRH3y17fCdc3FVVXkmWPvH5s1HKhZo8AYz
 4Mk9Qc9YtTJ7V88BeOccyuqk2Y4USOt8e2/PyXVwFgBMsb8T0qZ+naXe5Nd7NLVINWsw
 /kmNqlR7g9ceexOxZxdMuoQ5CnkImv246XNufxmMTy+8b/4YhcUSXFy2+gAAuFtRSykz
 YYCfLFqI/SeFI26zM5Nz8d+d1R3bfy0llGMVZDcrq4MOJfmZXYJAQ6qcf/aTPzYBpVMh
 jeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Az4ajU1UenYP4llap6LwYGAmlVb81FxvttX6ntbrKHw=;
 b=W4eZRShLgqXYM88ja7VxYok1Q/X1t9HYXFQSwGHPZGTmhbh+ni5OAq2Jnk5Au0F9LV
 cwDkcYLo2QUDFeApBUPVIP2D06h1oMrTkTJC87w9VT1m6L4T5Ib/Pah2aVUgveijTSyU
 l6lqIdLUCtUObPwSrTdO9UUd+hqSE+L2XqE1ysmRcjs5wVSMcbmybFrNtY413x1lBPtc
 icr7Fky+6tF/uB3kNtjlLFRRSPgJ+/oBZnL42fuXV/avTBzF19qEJDqpRc3dZVRePcjL
 CeoOXqfIuPxrwxPFLtLAfCUEeY4tlJICbHTUyedvEidcG5rwLL2woHhD6QtCWCPh5pzQ
 vA8Q==
X-Gm-Message-State: AOAM532ZXzwHjrxWZwOt51/oVJBM+qbI40kDMeZUM7+FVXWURmXskiHI
 BTsqWDKzb1aHOPhqy5ie+x8orU1eAHp1PQ==
X-Google-Smtp-Source: ABdhPJzvSnQab2ZlmzV8rwXYlbo6fahXqWIXfZ2GJOFB82qmSumOr0nFpfJ+gyT9ugbfaWxmxPTiug==
X-Received: by 2002:adf:fa52:: with SMTP id y18mr3880003wrr.355.1621512198612; 
 Thu, 20 May 2021 05:03:18 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/38] drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste issue
Date: Thu, 20 May 2021 13:02:36 +0100
Message-Id: <20210520120248.3464013-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:955: warning: expecting prototype for gmc_v8_0_gart_fini(). Prototype was for gmc_v10_0_gart_fini() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index f02dc904e4cfe..105ed1bf4a88c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -947,7 +947,7 @@ static int gmc_v10_0_sw_init(void *handle)
 }
 
 /**
- * gmc_v8_0_gart_fini - vm fini callback
+ * gmc_v10_0_gart_fini - vm fini callback
  *
  * @adev: amdgpu_device pointer
  *
-- 
2.31.1

