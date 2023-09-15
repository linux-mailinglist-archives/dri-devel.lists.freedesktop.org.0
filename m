Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6997A263C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5210E675;
	Fri, 15 Sep 2023 18:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9A10E677
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 18:42:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 850E1B82F65;
 Fri, 15 Sep 2023 18:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BA0C433C7;
 Fri, 15 Sep 2023 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694803346;
 bh=gNFALD/z17jDo7dWYiHKFKrb9ITT5wkuRQ8TLtfc84k=;
 h=Date:From:To:Cc:Subject:From;
 b=XFdl61V6dPWFIZAe1SZcvAqCiTByQo6msIs/RunUOGVbM+9UmWtKYpGeybnSZ8SOf
 XuiSlgD5sCBzwnqHs7ik7/vc5/PTkdlj0EPs8VmgAdpMuq87WmrxvUSxaQxMJH+iaT
 qiJRPa3lgh0bTwDxTfqf3UmfuUA2yjEcq6afHwUcZY2nlqnkgGZ6Vq3J9s4iw0kVpa
 inOeiOkkHnuWQnLsGOlzfTemYM6cdxxwkgNAT12dU+bAf7hl+xs3f21SDfO4ENO9Fu
 eYlxuGC0AAFoNB38MzF0yTAwrmcxgyZuFuSOX5PmOr04cb3YiUORxnc5AqRRUaKlHk
 x17yPmOSkJiuA==
Date: Fri, 15 Sep 2023 12:43:20 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Stuge <peter@stuge.se>
Subject: [PATCH][next] drm/gud: Use size_add() in call to struct_size()
Message-ID: <ZQSlyHKPdw/zsy4c@work>
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
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If, for any reason, the open-coded arithmetic causes a wraparound, the
protection that `struct_size()` adds against potential integer overflows
is defeated. Fix this by hardening call to `struct_size()` with `size_add()`.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index d2f199ea3c11..a02f75be81f0 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -503,7 +503,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 		return -ENOENT;
 
 	len = struct_size(req, properties,
-			  GUD_PROPERTIES_MAX_NUM + GUD_CONNECTOR_PROPERTIES_MAX_NUM);
+			  size_add(GUD_PROPERTIES_MAX_NUM, GUD_CONNECTOR_PROPERTIES_MAX_NUM));
 	req = kzalloc(len, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
-- 
2.34.1

