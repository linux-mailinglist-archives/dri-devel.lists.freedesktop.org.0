Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C945E499
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 03:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0B36E4F1;
	Fri, 26 Nov 2021 02:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39556E4CF;
 Fri, 26 Nov 2021 02:32:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F21AD611CE;
 Fri, 26 Nov 2021 02:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893975;
 bh=cCkMMf905Hpb8flwkJwQ9Jezp64VLSVJQydBbhtNflQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dGZEjTlt4/dv2ENk2RSBtyfrQOJF8CrBkzaQd1OWe0idmFXsSwA8ImEIv9LQQqFJ7
 fpro69K1c2pTkfspY5RWdFwxhFy8elbgeDd8+YQLiQ5o7uHm2584coDFrVbpnnN9fK
 KzuyQel1XaNJugrPqkcyDOlHLO/pWKc/NfNjZrkyd2F2rMILWxUXhFwhep2K1VUiDl
 kuQlgSFQ+vrYl5yYJ7iBcYFnF55o13P/aS6z9IbkabRkeNp4TSoq324RiFQN+1Bjfs
 bfM8uF728fCBbhZrpx0JJQYsja7FlxTgd1bzDST9swrtR0n++N0liKX+aiHTPhqDAi
 OloivjsFetPOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/39] drm/amd/amdgpu: fix potential memleak
Date: Thu, 25 Nov 2021 21:31:43 -0500
Message-Id: <20211126023156.441292-26-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023156.441292-1-sashal@kernel.org>
References: <20211126023156.441292-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, jonathan.kim@amd.com, kevin1.wang@amd.com,
 airlied@linux.ie, Bernard Zhao <bernard@vivo.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com, tao.zhou1@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, tiantao6@hisilicon.com,
 shaoyun.liu@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bernard Zhao <bernard@vivo.com>

[ Upstream commit 27dfaedc0d321b4ea4e10c53e4679d6911ab17aa ]

In function amdgpu_get_xgmi_hive, when kobject_init_and_add failed
There is a potential memleak if not call kobject_put.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Bernard Zhao <bernard@vivo.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 978ac927ac11d..a799e0b1ff736 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -386,6 +386,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 			"%s", "xgmi_hive_info");
 	if (ret) {
 		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
+		kobject_put(&hive->kobj);
 		kfree(hive);
 		hive = NULL;
 		goto pro_end;
-- 
2.33.0

