Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9FA9717B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCC310E5D0;
	Tue, 22 Apr 2025 15:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mdFvTKkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5A410E1A2;
 Tue, 22 Apr 2025 15:45:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B802D5C5C49;
 Tue, 22 Apr 2025 15:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01E4C4CEE9;
 Tue, 22 Apr 2025 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745336742;
 bh=AQ3QsuJzqsXDOuPwebgmAuhLJTmlqdcm16p+q8/eKg0=;
 h=Date:From:To:Cc:Subject:From;
 b=mdFvTKkLX518afKh11/wv6csLYyBhnDcBQb9sprOcGKVtA+O045c2Kp65JFVAJk25
 ptAv+/YLZ+CxGqqBtdmZXyiXVZdG0EjstnvM/uUyTujF7jai3IPQkAvtQm1mAfI4XJ
 NPD22rjlX7TlfRJN3F6MteVfn5WaKAEnmufyilXVUIVmwxW58z9c2MBE9kGZ4spMMr
 BDkI0soAoP4+B7r3czp+a6Rm+plGPk9asPhRYHPDBy4yJjfOaeXwQmk6I25RedZL7r
 LrgBznndeFW4qcTlvabEPPPk6dsth0Um1pWPca1JIdigb22W6VUpHTBsviLrLb6ZtT
 3ID3PNKq+825A==
Date: Tue, 22 Apr 2025 09:45:39 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau: outp: Use __member_size() helper
Message-ID: <aAe5o_-f5OYSTXjZ@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use __member_size() to get the size of the flex-array member at compile
time, instead of the convoluted expression `__struct_size(p) - sizeof(*p)`

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nvif/outp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 1ea20b2bdd29..32f6c5eb92af 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -198,7 +198,7 @@ nvif_outp_hda_eld(struct nvif_outp *outp, int head, void *data, u32 size)
 	DEFINE_RAW_FLEX(struct nvif_outp_hda_eld_v0, mthd, data, 128);
 	int ret;
 
-	if (WARN_ON(size > (__struct_size(mthd) - sizeof(*mthd))))
+	if (WARN_ON(size > __member_size(mthd->data)))
 		return -EINVAL;
 
 	mthd->version = 0;
-- 
2.43.0

