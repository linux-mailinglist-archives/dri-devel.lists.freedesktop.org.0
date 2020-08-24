Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D794425030A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 18:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A754E6E3AC;
	Mon, 24 Aug 2020 16:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456276E3BB;
 Mon, 24 Aug 2020 16:38:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2694622D02;
 Mon, 24 Aug 2020 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287120;
 bh=GOfb5yWcc32qC6+K8JzNjIZ0IRW6e52mmGom4d+a53A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AHerpMl35tKxM+Fhf0CdTIl50yMfaWboW++nyALX/pY2gzJcfUlG85LhSGAorH6vL
 lDWfQzK/sDfWTzY5btsfz0cq7vpIbrOCGYZH7QHQ7xtU8uuExsd0v5XnYn0UGRj80I
 RRZNBY1nTvpM+qKwNSStI2w50Io7Kh7J2yjxvCnk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 35/38] Revert "drm/amdgpu: disable gfxoff for
 navy_flounder"
Date: Mon, 24 Aug 2020 12:37:47 -0400
Message-Id: <20200824163751.606577-35-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163751.606577-1-sashal@kernel.org>
References: <20200824163751.606577-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Tao Zhou <tao.zhou1@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

[ Upstream commit da2446b66b5e2c7f3ab63912c8d999810e35e8b3 ]

This reverts commit 9c9b17a7d19a8e21db2e378784fff1128b46c9d3.
Newly released sdma fw (51.52) provides a fix for the issue.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 3a5b4efa7a5e6..64d96eb0a2337 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -617,9 +617,6 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 	case CHIP_NAVI10:
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 		break;
-	case CHIP_NAVY_FLOUNDER:
-		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
-		break;
 	default:
 		break;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
