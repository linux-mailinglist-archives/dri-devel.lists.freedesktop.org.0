Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59661476C4D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F0910E911;
	Thu, 16 Dec 2021 08:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E436210E913
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 08:57:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so42809646wrd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+H8K64HIIAzzi6Wq71ui1bloRAuSnkt5CtXVfSPR6o=;
 b=oixvcvbBrELBSxNdg4nlSO8BbPddPkJoZAGiKORc+PVZncD67/djXkY5OVdjlE6DJH
 1yzSWp8Lhv4O8x8kRWCnFF+/VDh/vvPalcgq6Scqg6dWQkfnOu0mnLQwMbQc7eRdyWq4
 faftXj6LgKt+XlsP1gufEOrWiJ8ls6/H61EymK2s1DM+WKyy+X4NwPcsaGjzwXCMipNW
 VdOfE/Qx68EptDZup7sfFskLKKbfMIZ7enLnwV/HVyREGPZYLt9c5FdV9h1TOJWBDKLK
 aRn4I27fu78ZQEfEYzl5La34b86PKhhxnCf1AFjT3ce3myJfeKW8z5sNeUeUcYfiAUOz
 MUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+H8K64HIIAzzi6Wq71ui1bloRAuSnkt5CtXVfSPR6o=;
 b=4QW5QzFyzQKOdywwZeqMInJsrPip0VHcaJvbqGlDL0SzXcfeVkeEtCVNWKPNREDoJv
 6Ht+HlOGyLI23ditnQYnaEqhagKVf5pfsd1ruDSv+RZEY3A1O0gE0ouWTUD+QcEq4mqg
 hQWLcLhDusQbTZlVFEuyDr8JrAx0lbuIwF1ie4EiYdiE1uOlbzhoc9DCrBwtkOsxXrTq
 UHpiZq+rvhNRZM7kDhegYH8QfXVodt9TLbw7FNLOW95IQDRVHRfesTAT49bzacP0zDry
 Nv4KyhrAoEGv8U5Site9fMIR1rXE5yRRI27uw8DizKox0SFAdHFB1qhTd0mx8t9qaZlQ
 fDRQ==
X-Gm-Message-State: AOAM531rwZeyyebMvMIFLUqVxd5JBA1OxoEK0BG75yLCCmV2e6gFoSsB
 85ItZoH59zo+zmwYrikhACg=
X-Google-Smtp-Source: ABdhPJypuZKrSvTfZncadzB2OvkfkY79+xUiWWwCPSRhU6hRPnhmYPMYJpL+Gse2zhnN7dza7FUyzw==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
 t8mr8322112wrx.542.1639645066216; 
 Thu, 16 Dec 2021 00:57:46 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p12sm5063559wrr.10.2021.12.16.00.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:57:44 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: vic: Handle tegra_drm_alloc() failure
Date: Thu, 16 Dec 2021 09:57:43 +0100
Message-Id: <20211216085743.1300416-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This function can return one of several errors in an ERR_PTR()-encoded
pointer, so make sure to propogate those on failure.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c5f4d2b13c43..7d2b719ed8d1 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -237,6 +237,8 @@ static int vic_load_firmware(struct vic *vic)
 			return -ENOMEM;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
+		if (IS_ERR(virt))
+			return PTR_ERR(virt);
 	}
 
 	vic->falcon.firmware.virt = virt;
-- 
2.34.1

