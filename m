Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6F41BA22
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 00:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3736E9AF;
	Tue, 28 Sep 2021 22:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981C6E9AF;
 Tue, 28 Sep 2021 22:21:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9FD46139D;
 Tue, 28 Sep 2021 22:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632867671;
 bh=PMoS6uFrh77X91FMSxF8qcDUVrIypALrTGC5IZzRovk=;
 h=Date:From:To:Cc:Subject:From;
 b=fWn7FeHin7DJ3TsLg4EmXIPIm/3qruzU4G7RJikkHwaMAn51G7Q4h05HDQLLIHBvH
 rvWht5ru1CGOGOtKwEP+J8LSRHSyLZjEzNc28CBQq8gATbauxcuAc44BWdw3Z1b7bQ
 5suk+4kX/Ff0JDw9Bna2ci9GWR6Gu+S8txcw1hSleW7AGMQkx3f0A+9WKK0Y7jUlcm
 PnbAo852OhONDfJ3K2b48LCke88zhmmZxP5saIvU7yizeC81p8KRlzQIw1jxo74rzT
 F0w6h3DM5vkQDnt1W7Ov1IkP+zU6K4VAqbKdA2vQwEaP0irw3uyc5m0LFIXN5gJXqM
 9lhJRsiuUO3ZQ==
Date: Tue, 28 Sep 2021 17:25:13 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] nouveau/svm: Use kvcalloc() instead of kvzalloc()
Message-ID: <20210928222513.GA294575@embeddedor>
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

Use 2-factor argument form kvcalloc() instead of kvzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index b0c3422cb01f..1a896a24288a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -992,7 +992,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 	if (ret)
 		return ret;
 
-	buffer->fault = kvzalloc(sizeof(*buffer->fault) * buffer->entries, GFP_KERNEL);
+	buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
 	if (!buffer->fault)
 		return -ENOMEM;
 
-- 
2.27.0

