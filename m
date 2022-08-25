Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D475A0619
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F7FD0BC0;
	Thu, 25 Aug 2022 01:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFF8D0AC1;
 Thu, 25 Aug 2022 01:36:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AE04ECE1927;
 Thu, 25 Aug 2022 01:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95787C433C1;
 Thu, 25 Aug 2022 01:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391404;
 bh=0483u44QYXkp+KDrcmRw1N3EorprKlZ+mnKHLzhDhtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZM69TyyVwxoaIPrkWIXQIEuEMTMIgIEIcTt2si2eFWoEu+s48yORuAwrgF3Hpwfcd
 7cn7uCU8Tcj8w1cg38Y7DdYuUbxOKO9MLQm+l3knMw8v9VLziMXmJ3BqInT8NZtUsc
 OmkzP15ek5k3phy1GD1oyTHNlGuMwo22R5F6i9Ot/b1vUfyUmUVjg4nnQvP0frUvRP
 Gy3I9FI9ooX/oDpoV2VjxB/DssIBYejLN3d1HcR+30lVXDzijl1EZmvegjsBozh8bs
 Tlyo1umEUnsaCI80kPTfsswmM8wX3ldxudL2DjaZ+0TCS1ey55xnnbrAO6GPn0naJI
 pvMvZR0rAXN0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 28/38] drm/amdgpu: Add decode_iv_ts helper for
 ih_v6 block
Date: Wed, 24 Aug 2022 21:33:51 -0400
Message-Id: <20220825013401.22096-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com, airlied@linux.ie,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 amd-gfx@lists.freedesktop.org, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

[ Upstream commit 1af9add1f1512b10d9ce44ec7137612bc81ff069 ]

Was missing.  Add it.

Signed-off-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 92dc60a9d209..085e613f3646 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -727,6 +727,7 @@ static const struct amd_ip_funcs ih_v6_0_ip_funcs = {
 static const struct amdgpu_ih_funcs ih_v6_0_funcs = {
 	.get_wptr = ih_v6_0_get_wptr,
 	.decode_iv = amdgpu_ih_decode_iv_helper,
+	.decode_iv_ts = amdgpu_ih_decode_iv_ts_helper,
 	.set_rptr = ih_v6_0_set_rptr
 };
 
-- 
2.35.1

