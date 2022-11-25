Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6463861E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 10:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3D910E5B8;
	Fri, 25 Nov 2022 09:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7101610E23B;
 Fri, 25 Nov 2022 09:25:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E442E62324;
 Fri, 25 Nov 2022 09:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF938C43141;
 Fri, 25 Nov 2022 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669368344;
 bh=gevkG6TfDd9z8LOLiUxeJy2lRLn2rHcp1JIJZyU3WcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jeb5Hfp8Dpk1F4ll8eAZeaT5bv5v2S3O9NzGmGFiWU+6Dpiamim6d1kqWNztvm8Lr
 tgHdtWZ5r/zwCPBGrc38R/9FAr8if2RNQOtl4yX4RTeDcftYH0lAkRqKEeEOpksINV
 9UgGbrYJCUQ7J4pyG3FZU7Z41jZmdb4Y5bqqX4ppPiu05MqF454oowxMdwGnx688ka
 q8xAaA/YPcFDD7sC39ETmBr2BP8S2ZBzT1bi7wVleeB77zHFDpZ5JMWKr/qzRVSqAm
 mjH9CnZPSzLYNtzv+8PMNw7OLuhMLHduBwIE1CoYzEDcJ/FZJrVv3OD8WxXBa3k0Y0
 Sl4p9Ap5aepqw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, arnd@arndb.de, akpm@linux-foundation.org,
 nathan@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ndesaulniers@google.com, trix@redhat.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 3/3] Kconfig.debug: Provide a little extra FRAME_WARN leeway
 when KASAN is enabled
Date: Fri, 25 Nov 2022 09:25:17 +0000
Message-Id: <20221125092517.3074989-4-lee@kernel.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221125092517.3074989-1-lee@kernel.org>
References: <20221125092517.3074989-1-lee@kernel.org>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When enabled, KASAN enlarges function's stack-frames.  Pushing quite a
few over the current threshold.  This can mainly be seen on 32-bit
architectures where the present limit (when !GCC) is a lowly
1024-Bytes.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 lib/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c3c0b077ade33..82d475168db95 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -399,6 +399,7 @@ config FRAME_WARN
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
 	default 2048 if PARISC
 	default 1536 if (!64BIT && XTENSA)
+	default 1280 if KASAN && !64BIT
 	default 1024 if !64BIT
 	default 2048 if 64BIT
 	help
-- 
2.38.1.584.g0f3c55d4c2-goog

