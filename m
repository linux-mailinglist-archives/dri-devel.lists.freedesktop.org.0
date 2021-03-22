Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A5344633
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AACC6E491;
	Mon, 22 Mar 2021 13:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329556E491;
 Mon, 22 Mar 2021 13:50:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57F90619A3;
 Mon, 22 Mar 2021 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616421058;
 bh=YA9YxD1Hu+DERDZ6cRSWdcGKGXcYVO3XLjCTjk6a89c=;
 h=Date:From:To:Cc:Subject:From;
 b=M4CHKLXyIARQtuW0IHzOkTDnqSQjfjn6Zt5hkAnIQ2Monol6/1f4qAbjvZQnQNSI4
 PRcVXi/vGJHG9kujjdUlGwmtX8sbmqkDQT0+4Tw1Ox2gTKiM4SiMZABZLJTxpf1Es0
 gV2V/BTEQWIB6kXzKnW3rgwwNal+yqcOCUSkEOiyfTa7xBSbRVu7c9ycTVsh/VUcS4
 5F562g4ZIA6aClkEnxF2Nv2jXlr/t5+bR5BmsKoWw+45JshZ/4f1+B6KlRT/P7OBCP
 jctyHT6dR6P5Q+jm0P4Eewm+7aN86ETIod/MOFuAABy3gocbOXdZN89D3EjzEilcCl
 1kzdMHSpYnh6g==
Date: Mon, 22 Mar 2021 07:50:50 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/amd/display: Fix sizeof arguments in bw_calcs_init()
Message-ID: <20210322125050.GA236782@embeddedor>
MIME-Version: 1.0
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The wrong sizeof values are currently being used as arguments to
kzalloc().

Fix this by using the right arguments *dceip and *vbios,
correspondingly.

Addresses-Coverity-ID: 1502901 ("Wrong sizeof argument")
Fixes: fca1e079055e ("drm/amd/display/dc/calcs/dce_calcs: Remove some large variables from the stack")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
index 556ecfabc8d2..1244fcb0f446 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
@@ -2051,11 +2051,11 @@ void bw_calcs_init(struct bw_calcs_dceip *bw_dceip,
 
 	enum bw_calcs_version version = bw_calcs_version_from_asic_id(asic_id);
 
-	dceip = kzalloc(sizeof(dceip), GFP_KERNEL);
+	dceip = kzalloc(sizeof(*dceip), GFP_KERNEL);
 	if (!dceip)
 		return;
 
-	vbios = kzalloc(sizeof(vbios), GFP_KERNEL);
+	vbios = kzalloc(sizeof(*vbios), GFP_KERNEL);
 	if (!vbios) {
 		kfree(dceip);
 		return;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
