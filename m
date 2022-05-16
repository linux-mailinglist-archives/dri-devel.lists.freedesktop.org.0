Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96023527E6F
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 09:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DC310E927;
	Mon, 16 May 2022 07:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017B10E764;
 Mon, 16 May 2022 07:19:37 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id j6so13234816pfe.13;
 Mon, 16 May 2022 00:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qyLHbvhHFnCVFcl2COEIHo1ekgk1vr9Xt9RbCWp5UFQ=;
 b=gWZ/uLYoxu/kOyjLksLZcv+dOHRs0RxWiRMgL/e3NTe/zcuWfZE4OwVyRl82B25GPk
 5yxu81Tf/5re2BOnhJ9tM9zb1UjjOUbu8dokeAvyAPhIJ21m4sfR6tPMQEirHKic66IK
 hR+2onUKYpC4USUs2SUPmp1zU+CayVUEpfoighxjx25a1B1z8uNxUu4xr1YM+z7BK2ql
 JM8yKK9hWUSfu6d/b5zUL1k8iselDYAynzv6DFpEOL2O7MvKLWPg85+cbAK7GIupAmAL
 AoEDPl3m4f376euhRP87SKBZ1SFae/y39Jv96okMDaZev7rxI4DHoZAD/W7BE99DmpyO
 AcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qyLHbvhHFnCVFcl2COEIHo1ekgk1vr9Xt9RbCWp5UFQ=;
 b=nH4AEqfbyFNfftBbD5pGfTaXzwOUfiu3DaZ6rBfWv8WAKLF/ZKqPbynja8Zihau89t
 mcjSLHa68viH71K3ryzT8DV1P6FznLN635+2hIYuJPc6SvZFYavnF83oExBd4m/SsKOd
 pKdOaEjCTVJtM2msH1SFq+S1xaMWt8oA2px3MHwt1LVUa92uYqtaUgY2AnLdMUZvsSNn
 qseWYWAl3GpGxVdc0HEjw6Y6pCDIS8Ft8s4WFs/KW/rtClNrxKXKBNmv1xfT+2gtXYMG
 7WEotNCWiLDO4n6M81a0FRqqj4JaX4H5LkQPiiYQgh0sAz2Fal1c2MVWQpSzd2CyURcM
 2HlA==
X-Gm-Message-State: AOAM530bKi8sptKNUI1qmtcqluwXOI3FtN6h9T3ufvZBPqqW1UeRM33R
 Lksrm7g6O2JfskzPDN3oT3o=
X-Google-Smtp-Source: ABdhPJweiKIlidVaFIASEcdabrwZzHCL4vm7fIHzGiDCKcF8TnRwifNYRCrEeShRqttSrbTd3azeHQ==
X-Received: by 2002:a05:6a00:1c53:b0:50d:5860:5b58 with SMTP id
 s19-20020a056a001c5300b0050d58605b58mr15944850pfw.85.1652685576873; 
 Mon, 16 May 2022 00:19:36 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902d54700b0015e8d4eb2e8sm2527500plf.306.2022.05.16.00.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 00:19:36 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, jose.souza@intel.com,
 Bhawanpreet.Lakha@amd.com, matthew.d.roper@intel.com, heying24@huawei.com,
 anshuman.gupta@intel.com, james.ausmus@intel.com
Subject: [PATCH] drm: i915: fix a possible refcount leak in
 intel_dp_add_mst_connector()
Date: Mon, 16 May 2022 15:19:22 +0800
Message-Id: <20220516071922.22955-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If drm_connector_init fails, intel_connector_free will be called to take 
care of proper free. So it is necessary to drop the refcount of port 
before intel_connector_free.

Fixes: 091a4f91942a ("drm/i915: Handle drm-layer errors in intel_dp_add_mst_connector")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index e30e698aa684..f7d46ea3afb9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -841,6 +841,7 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	ret = drm_connector_init(dev, connector, &intel_dp_mst_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
+		drm_dp_mst_put_port_malloc(port);
 		intel_connector_free(intel_connector);
 		return NULL;
 	}
-- 
2.25.1

