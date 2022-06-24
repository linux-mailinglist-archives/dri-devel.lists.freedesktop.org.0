Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30405594C9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C82112C7B;
	Fri, 24 Jun 2022 08:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7348B112C27;
 Fri, 24 Jun 2022 08:05:05 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id h23so3028733ejj.12;
 Fri, 24 Jun 2022 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYeizJ3QsvNICXqczpSXbVJYn4Q15WJ3kWZARt06sMw=;
 b=J/wgCdTYLso/wR3DyIMcpoWNVTSy/cjwLHx9Q39+E1ZodWxIhAlJ61DCaVuR1rD/f1
 pY38NwP9kY3Plwb6iN8EMe8/vG9qymIkGWF2JCZ+R7/X1R4EnwTmpYPULDKENIe2Fh6w
 FQCJsTwM3UQu3vJZESwvyK8+QhBWg7q572dTWiwHnN2NLv3ZwrQIiyW3sjqRVSC1nkgR
 oPerAY9zKue3qqTiHQ2r5ixckyjq8LP76+lkRLuVQapgOCZ4X7rOOw4Ml4021WrsttG3
 2MNeb6ISLKoiQ0jg06LSWwnAoniobzMHdFdZQd7CD+Jp+dZlI40apQN+4mRvkiBAtwMN
 +2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYeizJ3QsvNICXqczpSXbVJYn4Q15WJ3kWZARt06sMw=;
 b=pvR+X3MU3VlMwd3cxrWWEbzqtu74fi+sl2GuxY4mBrksN12a6JjGWQAtCNn4Is2dtP
 ctMc5rTOMFM2Y2w+tThGevxM/QJ9T4sO6DWYo2gu0a70Zno8TJqApKTHhHEozGMWwtaF
 +ZMGJuQMcUkFm+2LdQznheI8hAJU5JWK9K/NJ5TDoriuACs759/hdvODLwx0glq9UPMY
 BzXI0h5Kr/q7M2qxGidiZIATkYUPCBvSWucxDMIGNJlGiwDiLZ3KIuPyNabwBeGQxBK5
 WCe4GCBfdQxJteMNVsv1+raYUIC5dn6AsrSY5HM5nqdoc1IBOS3TUHL/3WDt7oiE9MtQ
 jBxQ==
X-Gm-Message-State: AJIora8Ge+wJGr6We/LdJMT6BsSLP7UtCSFgqas/a5BG/cZyDjbYvojd
 zXGRRPYKi1AoP7HWViaDSIE=
X-Google-Smtp-Source: AGRyM1uXEIqId7b73deRFKUwrzmvPTkFA55neIHh4LETAN1AX61HEKuXSB8HtzpeXXBy1GfUk1mJtQ==
X-Received: by 2002:a17:906:ee1:b0:70d:d293:7b30 with SMTP id
 x1-20020a1709060ee100b0070dd2937b30mr11782721eji.134.1656057903826; 
 Fri, 24 Jun 2022 01:05:03 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:05:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 13/14] drm/vmwgfx: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:43 +0200
Message-Id: <20220624080444.7619-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
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
Cc: mhocko@suse.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 01a5b47e95f9..99bf405d31b9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1577,6 +1577,7 @@ static const struct file_operations vmwgfx_driver_fops = {
 #endif
 	.llseek = noop_llseek,
 	.get_unmapped_area = vmw_get_unmapped_area,
+	.file_rss = drm_file_rss,
 };
 
 static const struct drm_driver driver = {
-- 
2.25.1

