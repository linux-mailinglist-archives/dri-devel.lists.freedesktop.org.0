Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6BD803FA0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 21:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7711C10E3F1;
	Mon,  4 Dec 2023 20:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4810E339;
 Mon,  4 Dec 2023 20:34:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E59E961344;
 Mon,  4 Dec 2023 20:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0CEC433CA;
 Mon,  4 Dec 2023 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701722091;
 bh=d0x7v3HGnyDSRgQ6KgQ0tQ0Qs6El+7eD0tb299DREL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p6Y8HITaExi+Mh96QCZHtesPIaQe4VywVqYD1cYrPxhSDiXwv79U5EY3vCsmDTnj0
 /PIy9KyJvGLTwQoiicY3t5g61bJiRvhtMqYPs0GvIDLCAvxS3WFNdmS+q2KdLSfsnM
 v8MmKnRZih4tksjC52XogmmdEWDlEzXnCfAd7ZSKJsCxYZgM2ZTDAHkfmtnYi3+ESc
 5/8XWNHykN3iLDDVjCJbEKCRo+OAvqalto0/96M+cohH4D0z6uvaqegCsNibBwT/qr
 91TIvOb8j/OxTreY1HgSts2Ae591UsdeFoefm2VGSBkKkRRs8o5Fgb7z3Yh+0ywFb9
 oAaWUm7XGA8JQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 28/32] drm/amdgpu: Use another offset for GC 9.4.3
 remap
Date: Mon,  4 Dec 2023 15:32:48 -0500
Message-ID: <20231204203317.2092321-28-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204203317.2092321-1-sashal@kernel.org>
References: <20231204203317.2092321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.4
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Lijo Lazar <lijo.lazar@amd.com>, shane.xiao@amd.com,
 amd-gfx@lists.freedesktop.org, sonny.jiang@amd.com, le.ma@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, James.Zhu@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit ed6e4f0a27ebafffbd12bf3878ab004787685d8a ]

The legacy region at 0x7F000 maps to valid registers in GC 9.4.3 SOCs.
Use 0x1A000 offset instead as MMIO register remap region.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index f5be40d7ba367..b85011106347c 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1159,6 +1159,11 @@ static int soc15_common_early_init(void *handle)
 			AMD_PG_SUPPORT_VCN_DPG |
 			AMD_PG_SUPPORT_JPEG;
 		adev->external_rev_id = adev->rev_id + 0x46;
+		/* GC 9.4.3 uses MMIO register region hole at a different offset */
+		if (!amdgpu_sriov_vf(adev)) {
+			adev->rmmio_remap.reg_offset = 0x1A000;
+			adev->rmmio_remap.bus_addr = adev->rmmio_base + 0x1A000;
+		}
 		break;
 	default:
 		/* FIXME: not supported yet */
-- 
2.42.0

