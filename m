Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6A31AFD8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 10:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1086E8B5;
	Sun, 14 Feb 2021 09:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F26E43C
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 05:04:09 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id e11so2742298qtg.6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 21:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LV3NAM+JFALnOTUNar5n1Yl4C1DQTr41LXCyFf7ukxE=;
 b=EA8H6qz7V6zi/F9x6BuiQ1e3FILgnhE97QsuIp+9jgwCcK3QSHuw3LlCAERUov5yVX
 tUe9C8+eZksP8K5HSsHRVgWgnlIMtAUp6JJJfkAueTRQSqiLY49prEItBqLzVWmOjhgj
 dH8K7gi/FLsmd1BRxz3bBmepKHFCXwxFuXyF5ivYhIOwiBr0DfOAZ3JrWrtYdaAyIGwx
 kb92NitosS3DSCAkWBAH7dByYrK3q8BFTdPdL0mzJIdq7gCl6p0R7iV1VhUns/JnreJ7
 PWx2VQL+76RSdb+hrj8XkCG3CCK6w6tZtdwjXMYYsemrOUJrPZNoRNcsvB546/hC1ddc
 BvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LV3NAM+JFALnOTUNar5n1Yl4C1DQTr41LXCyFf7ukxE=;
 b=MRDIo9atX6IG1J/AkZm67abuB9xe/FrT1VNxGSAXkgdX8jLabG+ryKe5E0fm3h3/Gh
 /wk6XGRiQdF01Rwk1TBuIx7kaTgkRTkgpYaQyHh/orfuus2/S5g8C59Nqj+jgOfCfa86
 zz9oBpkRHvd7GeyJKj18F1VPyNCodb0O7xbVjYi0fV6BFypnh+D0ZyF96eu1Zr0tlKtL
 j2bPtTSGcCDtaNl4OO9EaJ03Lg3BpArynIBYwD4bbA43yOgAjC29aQjBVIojyGh065AU
 hpXHN5irSycCECLlIQDUWxcZLYgoWK2M7ZaEBYzBz+TpmYADB/7fZaaP87dpRRKSHw3S
 yuMg==
X-Gm-Message-State: AOAM530bu23mIM9mOOhxjXLaIeeFbNVCnSdYCuwqCAVYZGYCj5S4Cyw+
 /fRuaYbxYf00F8O5zCTfnzc=
X-Google-Smtp-Source: ABdhPJzvCvv1GoL3vGozTHFgwak9TLbk5kgs7/l57vf3VROkHTgr2DUaz0Kc8Ibn/6ej3WKxgXcu7w==
X-Received: by 2002:ac8:6e9a:: with SMTP id c26mr9215430qtv.220.1613279048737; 
 Sat, 13 Feb 2021 21:04:08 -0800 (PST)
Received: from localhost.localdomain ([187.39.20.240])
 by smtp.gmail.com with ESMTPSA id s129sm9737158qkh.37.2021.02.13.21.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 21:04:08 -0800 (PST)
From: Diego Viola <diego.viola@gmail.com>
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau/pmu: fix timeout on GP108
Date: Sun, 14 Feb 2021 02:03:09 -0300
Message-Id: <20210214050309.2395-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 14 Feb 2021 09:28:21 +0000
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
Cc: gnurou@gmail.com, nouveau@spliet.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code times out on GP108, probably because the BIOS puts it into a
bad state.

Since we reset the PMU on driver load anyway, we are at no risk from
missing a response from it since we are not waiting for one to begin
with.

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
index a0fe607c9c07..4f02c4f14f04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
@@ -104,10 +104,6 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
 
 	/* Inhibit interrupts, and wait for idle. */
 	nvkm_wr32(device, 0x10a014, 0x0000ffff);
-	nvkm_msec(device, 2000,
-		if (!nvkm_rd32(device, 0x10a04c))
-			break;
-	);
 
 	/* Reset. */
 	if (pmu->func->reset)
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
