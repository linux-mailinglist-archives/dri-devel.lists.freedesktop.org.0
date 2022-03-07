Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F04454D0A68
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 23:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582D710E16A;
	Mon,  7 Mar 2022 22:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319B10E16A;
 Mon,  7 Mar 2022 22:00:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u1so25460246wrg.11;
 Mon, 07 Mar 2022 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VrXaIwOZOVtIvy4hHy4AW36uJVE3txcBuUPvIgUQUTk=;
 b=XHgWXNwqYyjxnOvdpUvHpl/knt8ZquuiELDtEkVC3I6XKXdmxibh9o7cveOY8e3wIU
 4fRJhN/LdOpLZhOo0s3YPKnnbKQ65vUu+GxYY39iN5iNKVLm4dh8DL812cdKdLFIs6aR
 3VWNN0sxgmGH/zRZVi0F8adSG7gYSL4KQoAKZIlxWF+yQehb6FLp9JFrDiTEZXA6UAKz
 3JmY38syMUAr5b5rkhgU6hHoS2w4LEpybbBqWh3WFoJaUmaHMdbqjSaNN+3o8k5S/LO7
 6dGGt4W2vCcrgixU4UiPuilZq+eDs6OMGritSRXSUzldpXMrDkj10Y8/hMbq0DCB9xeD
 NAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VrXaIwOZOVtIvy4hHy4AW36uJVE3txcBuUPvIgUQUTk=;
 b=jlnizS/MLH4b3QTA9GBnnmmd76LJup/AWrNiXYtPcVsTOkv70xN2eB3aKJxwDsMyaK
 MwTRveG4/JPq7tPHKfTmF3P/CkvyyjZWQhTVokomvu2YA9Oh8ZQmYUrurJnuRA2uSc/l
 8jlN5ZYeHQJI/JnwbSOfGvWJiRSFnNTCWj4se1aBEFJCCtT8dwjhAc1N5py98e8quXBO
 zYaF3F1ETeqyg0oxNQ6zhCnAAWSKs3u2DTw2DccWEuvsyvrOU/XSA2o+ORw45aZdiFo7
 3hg0WtQEz7utpsNBblvtGPSSZp5u+rqrn7uVwmEcmOk9J7aIElVUC0BKN7wQlC8aPZZB
 xuqA==
X-Gm-Message-State: AOAM53296JxnpSvqmSW8RqGo7emSf0Vu3dj0znvKVwj52sgB6Xej74Mx
 fMB5f7ZP/BZbtDpYl+lBxH4=
X-Google-Smtp-Source: ABdhPJyMRU1RrSDT5zpdVvAkOryRnx+5bU3JVk9GMtpjgNuO6wW51EbQcPQMSpkWh/twLP9jlWsFmA==
X-Received: by 2002:adf:8063:0:b0:1ef:78e3:330 with SMTP id
 90-20020adf8063000000b001ef78e30330mr9940151wrk.424.1646690408993; 
 Mon, 07 Mar 2022 14:00:08 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d62cc000000b001f048bc25dfsm12124754wrv.67.2022.03.07.14.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:00:08 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dpll: make read-only array div1_vals static const
Date: Mon,  7 Mar 2022 22:00:07 +0000
Message-Id: <20220307220007.162830-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array div1_vals on the stack but
instead make it static const. Also makes the object code a little
smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 569903d47aea..17668b58b30c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -2759,7 +2759,7 @@ static bool icl_mg_pll_find_divisors(int clock_khz, bool is_dp, bool use_ssc,
 				     bool is_dkl)
 {
 	u32 dco_min_freq, dco_max_freq;
-	int div1_vals[] = {7, 5, 3, 2};
+	static const int div1_vals[] = {7, 5, 3, 2};
 	unsigned int i;
 	int div2;
 
-- 
2.35.1

