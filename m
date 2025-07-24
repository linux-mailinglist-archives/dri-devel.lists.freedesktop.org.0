Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71AB10B4D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64FC10E296;
	Thu, 24 Jul 2025 13:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aladdin.ru header.i=@aladdin.ru header.b="IVZvlrzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Thu, 24 Jul 2025 10:40:19 UTC
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97710E061;
 Thu, 24 Jul 2025 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=aladdin.ru; s=mail; c=simple/simple;
 t=1753352697; h=from:subject:to:date:message-id;
 bh=0vefUBiAWQYh2/3REMI7EF97twDh4DDuzRSmvvySUiU=;
 b=IVZvlrzM7XgROlM2SvvSleF3Z4ZrFYTtzyDrPbeVBCmEJ/V2dNFwVdTWpX3OV6lzkW/V7w+FV28
 OAEtMGbHy0IJyJCo+EX1c4DIgrziMlH7zrHxS2g76b3OqLV3moS3hvqh3Ptqkr3Cqf1+2hspCxbB9
 Cp+Il7vDkPM/OzLKtW6DLnxfC2VIj0lEtAnfAGPR+U9yEUxY9v/6O8KSDSqQlni0pJf37WH1OMziZ
 VqXj8i2aAlkhCqr06cWaGh7FsZQPVImiLmJ9hiJSyF81ESBJX+SXzf0sS3VFlzKL77Nk6o682AIwi
 M8plSBHPJuKsL/KXSS17vqxi+20fPH307i3A==
From: Daniil Dulov <d.dulov@aladdin.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@linux.ie>, Simona Vetter <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, "Rodrigo
 Siqueira" <rodrigo.siqueira@amd.com>, Jerry Zuo <jerry.zuo@amd.com>, Alex
 Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>
Subject: [PATCH 5.10] drm/amd/display: Pass non-null to
 dcn20_validate_apply_pipe_split_flags
Date: Thu, 24 Jul 2025 13:24:48 +0300
Message-ID: <20250724102449.63028-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.122.7]
X-ClientProxiedBy: EXCH-2016-03.aladdin.ru (192.168.1.103) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)
X-Mailman-Approved-At: Thu, 24 Jul 2025 13:24:19 +0000
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

From: Alex Hung <alex.hung@amd.com>

commit 5559598742fb4538e4c51c48ef70563c49c2af23 upstream.

[WHAT & HOW]
"dcn20_validate_apply_pipe_split_flags" dereferences merge, and thus it
cannot be a null pointer. Let's pass a valid pointer to avoid null
dereference.

This fixes 2 FORWARD_NULL issues reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ Daniil: Changes to dcn21_fast_validate_bw() were dropped since the function
  is not inplemented in 5.10.y. Also dcn20 and dcn21 were moved from
  drivers/gpu/drm/amd/display/dc to drivers/gpu/drm/amd/display/dc/resource
  since commit 8b8eed05a1c6 ("drm/amd/display: Refactor resource into component
  directory"). The path is changed accordingly to apply the patch on 5.10.y ]
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
Backport fix for CVE-2024-49923

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index b4bff3b3d842..029aba780d83 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2847,6 +2847,7 @@ bool dcn20_fast_validate_bw(
 {
 	bool out = false;
 	int split[MAX_PIPES] = { 0 };
+	bool merge[MAX_PIPES] = { false };
 	int pipe_cnt, i, pipe_idx, vlevel;
 
 	ASSERT(pipes);
@@ -2869,7 +2870,7 @@ bool dcn20_fast_validate_bw(
 	if (vlevel > context->bw_ctx.dml.soc.num_states)
 		goto validate_fail;
 
-	vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, vlevel, split, NULL);
+	vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, vlevel, split, merge);
 
 	/*initialize pipe_just_split_from to invalid idx*/
 	for (i = 0; i < MAX_PIPES; i++)
-- 
2.34.1

