Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8502512FF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5BB6E873;
	Tue, 25 Aug 2020 07:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38E6E598;
 Mon, 24 Aug 2020 21:15:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so216863wmi.3;
 Mon, 24 Aug 2020 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LFw4WfZ8EhsNfys63tZhqlDitg+wRfgOs5oV//XPrUM=;
 b=FQfOrITBr/YQmprdbDs9K0Z2Kq+p9iialWri9yWFnpOyReVYm0eyFFSpkA9dfanxkT
 IRTWbqHsmXT0FApdWrAoXwRvynXtd8rU9PnFu+pA5DosfghqjjJh7DNvOQMdDSgds0nn
 IEaM1xEuJ984gyfGYP+5f6UgTFNYZwk1pE0PqTO4bdsdvkN86oTTeRTXPwTP/8h4PdA7
 T+pgYyrjH2SmkmEthb8p1oMkGmgL1ciUfEVPII0CaDvTpBznT+OaqZMBTxsFKxIDNgru
 yghkD6ZRfTmeQTIKGkA5pDwbHaqO+afu1s/cvLzrnct4VkTCwR6lC1Kaj88tktIUkaBr
 ccDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LFw4WfZ8EhsNfys63tZhqlDitg+wRfgOs5oV//XPrUM=;
 b=HQF6+Y7U6JNfUpAqa+6iTOJMXLh0NNcAgjw5N4INvZ+WX6XiZv82baSA0EMtIqkTAq
 f+xKDCVYjkzb1HwgJ9E2CLlHsaNQFC0kpjsa3pvU9t7iOSNdk17e3t0JUMfBLwDIxFKZ
 czUBKuUrO2jeterdk21R4E4Y4MLQl41cGjYdI+VrNrwP0fg+Ajy+WqqtuNnfEGb8mwJD
 KEwcB5HFyfOSJww4M1A/4VYXBrT0BEnpa+1r9SQ9L6rfQOd/IepfXndd/Vcb93sNP4dP
 XXpOMAFzlKPAQdBKprwCd3jOVHeaWE71zaEsrn2gKTju1kpMH5qxKJ1iexdjkOrukZBP
 lmJA==
X-Gm-Message-State: AOAM5315KVNblmSOsH3kjoKbnmzswfOcbDzIhhjRxFncPq8146nferfa
 wzZh0ynL/pv2qlyi4OdcNA4=
X-Google-Smtp-Source: ABdhPJz0baJ8O+INbMWboBj35pDbefXGIzNS8GiFPjrN5PieYka8Z4czgAFx6rk+IT2Y7nTgcfBJNg==
X-Received: by 2002:a1c:7915:: with SMTP id l21mr1146892wme.50.1598303750143; 
 Mon, 24 Aug 2020 14:15:50 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id c9sm1638261wmf.3.2020.08.24.14.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:15:49 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Dewar <alex.dewar90@gmail.com>, Li Heng <liheng40@huawei.com>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/pm: use kmemdup() rather than kmalloc+memcpy
Date: Mon, 24 Aug 2020 22:15:25 +0100
Message-Id: <20200824211530.592909-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Issue identified with Coccinelle.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
index f56a3cbdfa3b..1f9082539457 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
@@ -890,14 +890,12 @@ static int init_powerplay_table_information(
 				power_saving_clock_count);
 	}
 
-	pptable_information->smc_pptable = kmalloc(sizeof(PPTable_t), GFP_KERNEL);
+	pptable_information->smc_pptable = kmemdup(&(powerplay_table->smcPPTable),
+						   sizeof(PPTable_t),
+						   GFP_KERNEL);
 	if (pptable_information->smc_pptable == NULL)
 		return -ENOMEM;
 
-	memcpy(pptable_information->smc_pptable,
-			&(powerplay_table->smcPPTable),
-			sizeof(PPTable_t));
-
 
 	result = append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
 	if (result)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
