Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461E74BA5A3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EC110EC5D;
	Thu, 17 Feb 2022 16:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FB10EC4D;
 Thu, 17 Feb 2022 16:22:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E18AA6134E;
 Thu, 17 Feb 2022 16:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94018C340E8;
 Thu, 17 Feb 2022 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645114921;
 bh=6AiVtQPZxKjZrUPjZF3U+Z3rpqKeUUYJFL49OuEmknk=;
 h=From:To:Cc:Subject:Date:From;
 b=IuG0zs9Z1yrsjh+2PL4JMjl6i6yz4LJMl9gf22KdCuuZqJVsczteN+kG56UjaEp2t
 lMClIFgnmIhm0nn02Dv7DKHhJp9Dy2rBWo9MbU78+37qlGmitF/JG6tUp1JGKzra1u
 ij0a7peN5leGXJmEnk5tpVjSGJFsj3Q0bsFTXTznvpa7UcIBQFzgqRgMg+lXw8g54R
 8EEnWCntkKZwmcxTP3g7I0OhYZHvwoXoj7eib30CyOUwhzBF+woc/2CR+HXBDJUVma
 rwRt8NX8bIpUp3zs2KQMUjkY7FJISSmLdbbcAO91WSioUchXt50dY8XwYG6SaDj7jY
 GtN5ZlIFQ97jw==
From: Nathan Chancellor <nathan@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amdkfd: Use proper enum in pm_unmap_queues_v9()
Date: Thu, 17 Feb 2022 09:21:42 -0700
Message-Id: <20220217162142.1828990-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.c:267:3:
  error: implicit conversion from enumeration type 'enum
  mes_map_queues_extended_engine_sel_enum' to different enumeration type
  'enum mes_unmap_queues_extended_engine_sel_enum'
  [-Werror,-Wenum-conversion]
                  extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

Use 'extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel' to eliminate
the warning, which is the same numeric value of the proper type.

Fixes: 009e9a158505 ("drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues")
Link: https://github.com/ClangBuiltLinux/linux/issues/1596
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 806a03566a24..18250845a989 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -264,7 +264,7 @@ static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
 					sizeof(struct pm4_mes_unmap_queues));
 
 	packet->bitfields2.extended_engine_sel = pm_use_ext_eng(pm->dqm->dev) ?
-		extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
+		extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel :
 		extended_engine_sel__mes_unmap_queues__legacy_engine_sel;
 
 	packet->bitfields2.engine_sel =

base-commit: 3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
-- 
2.35.1

