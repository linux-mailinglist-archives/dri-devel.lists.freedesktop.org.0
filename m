Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0E4FBDA2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00F10F36F;
	Mon, 11 Apr 2022 13:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9000810F36E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:45:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id g18so6031623ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OpmDp1zZHNMDSCeGEdGspTNGhjbI7Gf3dFJAK2udrDM=;
 b=BJErQyLlCM6+FSbMgdJx2R/DoF+nMoMwFRqFfieLl0g9qoKJ/Y8oInn93MbMI2Kn5E
 NKz8vCOQBvuyI1IkA8RtPYVn3Msn8qmAoX5pAz6cAnKlq3Fxw2OPiPMUAD+desh9HYDJ
 8XCSTI2hW9qaHVenUdPziZMNLkkY9Iy7OcZsYnO77v8WrITdm8mhv1MObICZ48Dc3h8H
 ES46FU9ru4CD1hyDVvJ1tZDQDkCuCBf4OLIamIoZO0UEulwTWZd1P7vbworgwEZ2N7lJ
 xxOFmD0zP4WCHmkojhrqROHAxWvBc80FFa3YlHxgO4HOlJL0cqvLLacRrjI91dVP9aSo
 j61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OpmDp1zZHNMDSCeGEdGspTNGhjbI7Gf3dFJAK2udrDM=;
 b=4VCx4Tfk/ArMH83VNVxYdQhzqXW6EEpeoxm3nWGeW8HK4zcGldT9i1poJxCVpJuLsq
 iv/zPg32v7w5k6jfR9Zr7G5lcAik7/99kXhpwxXGKVpaUfX7v7JtvnbBfqJgqnVEnOIA
 1CnKa/yY1jPsQPJ5/VkJ73dIu4n5VO9jSB3ZwLh5pJvejkwuKW49i3+QrZtw3lIj0VSW
 PjZSC76Tmt7hT+lC9VzWDS4hWscq+V0b/ytnNc3HuC6Vgy76UZzaDWCqQPZUrFj5IabS
 7bSLDQa/yJ7tMKy26p2YcvAKRPOZWMDpB4J9UBLUay0Z/CCZ1v1+XtcYrghdsxYK9dkm
 Q1Eg==
X-Gm-Message-State: AOAM5306DpH0ReYNtUoMCjOcXGmcr55h1FgkS54lyB6pseL3hUGMpNgw
 3s4H9z1sVPrINrRm8cKVE/4=
X-Google-Smtp-Source: ABdhPJxW5Yv7l/WlzAiLCOXBItlNIrXgEWdEyavNN0VSWuZRisjnnKX9gM1X9TFrwmhkupMlOmxabg==
X-Received: by 2002:a17:906:1ecf:b0:6e7:fdc1:255b with SMTP id
 m15-20020a1709061ecf00b006e7fdc1255bmr12749583ejj.340.1649684738921; 
 Mon, 11 Apr 2022 06:45:38 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 cb7-20020a170906a44700b006e879b4ba2dsm2505092ejb.56.2022.04.11.06.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 06:45:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix logic inversion in ttm_eu_reserve_buffers
Date: Mon, 11 Apr 2022 15:45:37 +0200
Message-Id: <20220411134537.2854-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

That should have been max, not min.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
---
 drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 0eb995d25df1..dbee34a058df 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 			continue;
 		}
 
-		num_fences = min(entry->num_shared, 1u);
+		num_fences = max(entry->num_shared, 1u);
 		if (!ret) {
 			ret = dma_resv_reserve_fences(bo->base.resv,
 						      num_fences);
-- 
2.25.1

