Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367BB625054
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 03:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93AB10E19C;
	Fri, 11 Nov 2022 02:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8866A10E74A;
 Fri, 11 Nov 2022 02:34:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00CED61E8E;
 Fri, 11 Nov 2022 02:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69118C433C1;
 Fri, 11 Nov 2022 02:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668134076;
 bh=rnuZN+iCie0gINOXbx+tLIEv5lK1RT+pR6UPa/vAJH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uQ7GdlOinSk3Vhh6sPMJyw1GrXJ5/IWqT5MUHfxHR57cyD6ssQReZOa154ZLYQlEb
 iYgbyUVrHzd1+FLMlKNK/bkSiUQYYhS3u1DG+OxUhw5pKJkop7BKzTrPYg/P8O1K2L
 e3Xy7pae2pBOCCoLS9PFRwobMAUtFFCt/1SGDIBsKKXlWyxiTu8WAFeFiCF64IrEjk
 YQMuDJmBrDvitFn77+7HlLhkswg23yXeEmOIpuG8mKXX4MVP7asEnUQj1VGQOoAxmP
 vK/YslxotrQUMQAzN3cP9+vB6vCXO1NwYtS1qpFZCOvyETKIY65qo7nNamUd7SsiQF
 vJ0sJNBA3LW3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 22/30] drm/amd/display: Fix DCN32 DSC delay
 calculation
Date: Thu, 10 Nov 2022 21:33:30 -0500
Message-Id: <20221111023340.227279-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111023340.227279-1-sashal@kernel.org>
References: <20221111023340.227279-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Mark Broadworth <mark.broadworth@amd.com>,
 chris.park@amd.com, wayne.lin@amd.com, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, nathan@kernel.org, sunpeng.li@amd.com,
 aurabindo.pillai@amd.com, Alvin Lee <Alvin.Lee2@amd.com>,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 mairacanal@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: George Shen <george.shen@amd.com>

[ Upstream commit bad610c97c08eef3ed1fa769a8b08b94f95b451e ]

[Why]
DCN32 DSC delay calculation had an unintentional integer division,
resulting in a mismatch against the DML spreadsheet.

[How]
Cast numerator to double before performing the division.

Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 365d290bba99..67af8f4df8b8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -1746,7 +1746,7 @@ unsigned int dml32_DSCDelayRequirement(bool DSCEnabled,
 		}
 
 		DSCDelayRequirement_val = DSCDelayRequirement_val + (HTotal - HActive) *
-				dml_ceil(DSCDelayRequirement_val / HActive, 1);
+				dml_ceil((double)DSCDelayRequirement_val / HActive, 1);
 
 		DSCDelayRequirement_val = DSCDelayRequirement_val * PixelClock / PixelClockBackEnd;
 
-- 
2.35.1

