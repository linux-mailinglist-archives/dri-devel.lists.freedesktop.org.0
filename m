Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5CB58FFCF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6297BB444E;
	Thu, 11 Aug 2022 15:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC72B4430;
 Thu, 11 Aug 2022 15:34:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83612B82157;
 Thu, 11 Aug 2022 15:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62493C433D7;
 Thu, 11 Aug 2022 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232071;
 bh=C9M4r8tfAO7KFB5rS+Rx6lS06rRTzLkaPWrFYj/U2yA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FLbFyt3ndpRr9NdKtdy4VXq5pUrspvi9Yd8zQJHDokjG00rCVzkpiwE5375EjCMu3
 oif9ojcIYkm6zzU5ZmiHdU8CoNW4alGBH18octwaA2yR2zeVeqJdeCDC1aW6pWiCvj
 UZSyyvQdrvLhbo1k4W/HPa5IO5FA20iZZjj7U9gqaWWNmaJK7McGNrYhM0h84Z9O5a
 06zx2iylp+isfIP381sKc5ptzbnfkM9QJul6L12D+4as4oWQw4o8f3LieCIWoXPN/u
 qVPvC/7tmwy0WCVOozP3JN5AkcRFRDSj8ns3v/p/EnsBSQAYd3U/SFYoDmRCGIfmiV
 TQF6jHcvYgPeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 057/105] drm/amdgpu: skip whole ras bad page
 framework on sriov
Date: Thu, 11 Aug 2022 11:27:41 -0400
Message-Id: <20220811152851.1520029-57-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, mukul.joshi@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
 YiPeng.Chai@amd.com, "Stanley.Yang" <Stanley.Yang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 candice.li@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Stanley.Yang" <Stanley.Yang@amd.com>

[ Upstream commit e0e146d5567317d6ba7d0169bed55d1d9ea05a61 ]

It should not init whole ras bad page framework on sriov guest side
due to it is handled on host side.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index dac202ae864d..465e7921bba1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2148,7 +2148,7 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
 	bool exc_err_limit = false;
 	int ret;
 
-	if (!con)
+	if (!con || amdgpu_sriov_vf(adev))
 		return 0;
 
 	/* Allow access to RAS EEPROM via debugfs, when the ASIC
-- 
2.35.1

