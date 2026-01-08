Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A9D02469
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBAE10E6E9;
	Thu,  8 Jan 2026 11:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="meGKrc4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2007 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jan 2026 11:03:14 UTC
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3410E6E9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=bJkQJTjmDJpLhL6iv5iWgMzMQ08eFAUg5MyhHR5HM/g=; b=meGKrc4TWXaIuc
 t49FbxWAwyU/7xz5JWqiDO9REJwvlohJ5mkPwWW+WPeDzOg08jYykHBsW/bA/+c6PgOqxICwhpdkz
 Lx15Ley3P7SIcE09YJTo6Ei2BN7SG4hAeqokynv0Kv1ThV+bYnqx03/NwXNJykmONYkefIIzozhf0
 eJFcX9J8Bksjw4o8BwWlwJqfkgFLmOFx1UUkcWI23d5YW/zqhX5gAgqpklZLaFqzJ7FQ6gD3qM3dU
 LMJaG5N6HD5KN9QPIyLMAVX3MUpsnFbQ3dCDKoiN9k2ex61DnviJA8MfnJH6BKqx0eUh1e++/pXmq
 yK7qDT9RDSEry5eaoV8A==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vdnGw-00AVUs-9F; Thu, 08 Jan 2026 10:29:42 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1vdnGw-00000000yaq-0Adg;
 Thu, 08 Jan 2026 10:29:42 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ttm/bo: make ttm_swap_ops static
Date: Thu,  8 Jan 2026 10:29:40 +0000
Message-Id: <20260108102940.232911-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm_swap_ops is not exported from this file, so make it static
to avoid the following sparse warning:

drivers/gpu/drm/ttm/ttm_bo.c:1202:31: warning: symbol 'ttm_swap_ops' was not declared. Should it be static?

Fixes: 10efe34dae798c652053d43 ("drm/ttm: Use the LRU walker helper for swapping")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd27607f8076..6b1c80be1beb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1199,7 +1199,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	return ret;
 }
 
-const struct ttm_lru_walk_ops ttm_swap_ops = {
+static const struct ttm_lru_walk_ops ttm_swap_ops = {
 	.process_bo = ttm_bo_swapout_cb,
 };
 
-- 
2.37.2.352.g3c44437643

