Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11E15DCFC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756556F9E3;
	Fri, 14 Feb 2020 15:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6EF6F9E3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:56:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FFAC2067D;
 Fri, 14 Feb 2020 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695802;
 bh=QeBSYpadQfSDA4Xgw0Sen4+eBJpHM7k+4D5WCwfz2ps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2K1PJ/RP9BLulO8iCSuMdKGPMV/wtuxd0PJ517dQNfJK2kpaiA0i2AH7l+n8lObz3
 6TCyHf2uIGqUkDpUr9h2LtLB9yeHouJJWNZF83znRY8jyYBpldphoVvWz9R71u2M3y
 b0l7g44jgqUh8Jk3hVTqoE1N/B95bXvdrzbTqrpw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 362/542] drm/vmwgfx: prevent memory leak in
 vmw_cmdbuf_res_add
Date: Fri, 14 Feb 2020 10:45:54 -0500
Message-Id: <20200214154854.6746-362-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 dri-devel@lists.freedesktop.org, Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Navid Emamdoost <navid.emamdoost@gmail.com>

[ Upstream commit 40efb09a7f53125719e49864da008495e39aaa1e ]

In vmw_cmdbuf_res_add if drm_ht_insert_item fails the allocated memory
for cres should be released.

Fixes: 18e4a4669c50 ("drm/vmwgfx: Fix compat shader namespace")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
index 4ac55fc2bf970..44d858ce4ce7f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
@@ -209,8 +209,10 @@ int vmw_cmdbuf_res_add(struct vmw_cmdbuf_res_manager *man,
 
 	cres->hash.key = user_key | (res_type << 24);
 	ret = drm_ht_insert_item(&man->resources, &cres->hash);
-	if (unlikely(ret != 0))
+	if (unlikely(ret != 0)) {
+		kfree(cres);
 		goto out_invalid_key;
+	}
 
 	cres->state = VMW_CMDBUF_RES_ADD;
 	cres->res = vmw_resource_reference(res);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
