Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D74507752
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 20:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A72F10E069;
	Tue, 19 Apr 2022 18:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD92910E069;
 Tue, 19 Apr 2022 18:13:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F921B818EE;
 Tue, 19 Apr 2022 18:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B6AC385A5;
 Tue, 19 Apr 2022 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650391980;
 bh=T1EzDUfwjggOELHvvCTAYsHts3WIZamAMmLGdfdkNLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgC8pQu+sgDNaqY9Xc7f2jPJ5FJSiIoHj7Zrk2gu0hBJad8GgUSDM4l2YKuOfpYnx
 LV26XzkaZkaHJFI4B8YIoUkcSr2f3Trmt2ZM/drI8PzHmItpanUc7aUvpLAeqDH5ST
 pC6rTvhbMkfIV89ozhgUNLR9hwk1d8+vGRfdP0nfQlJpXIsNWp1ddr1imeTjqF7O7l
 m1hZRA7tbmtXXCFUJuo68QbDAA/YIfralG2joDoLT4LWf9G0/pUzj4zLzrKYXQAT07
 kFhAGad9UA3iQda/Jtt42USEcNC4o75kz6z/4MobNxjAtxxpNISAmgb8aJVS71HXG4
 8fZsZI91YZwFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/27] drm/msm/disp: check the return value of
 kzalloc()
Date: Tue, 19 Apr 2022 14:12:21 -0400
Message-Id: <20220419181242.485308-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181242.485308-1-sashal@kernel.org>
References: <20220419181242.485308-1-sashal@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Xiaoke Wang <xkernel.wang@foxmail.com>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org, sean@poorly.run,
 greenfoo@u92.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

[ Upstream commit f75e582b0c3ee8f0bddc2248cc8b9175f29c5937 ]

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Link: https://lore.kernel.org/r/tencent_B3E19486FF39415098B572B7397C2936C309@qq.com
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..369e57f73a47 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -169,6 +169,8 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	va_list va;
 
 	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
+	if (!new_blk)
+		return;
 
 	va_start(va, fmt);
 
-- 
2.35.1

