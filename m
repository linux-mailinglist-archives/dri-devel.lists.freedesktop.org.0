Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B067F5857FF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 04:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D3E89F5B;
	Sat, 30 Jul 2022 02:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBAB10E2C3;
 Sat, 30 Jul 2022 02:25:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACEBB61DC5;
 Sat, 30 Jul 2022 02:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1974CC433C1;
 Sat, 30 Jul 2022 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659147933;
 bh=EsersN85TttPaQcdVgjli1UBcGalAzLNzoI5+PJX7dM=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=B4+6uWnYV7ESdirnk7ZjgWGid8KnJI6m1JBH5aa0AERpBYWc5YSvyj63GgbXIJHu6
 KFVTFuUJ2Asl0NdjuPGKjFUJQ0o4VsAqxulR3d+78OluLQYI+JnvIgSuHEMvaIvwon
 wpl2pY3m2PjaUv/nU1Zl0G8RBD8nDYznCDESmclu/N+4mC4mtfIWGaKPEQvXniwk5A
 uG98IJjh1LYDKXGV6rI2Ukcml2jJjxrajTJBucWOh6cWR7vUA5WnMfArM98ICarnmt
 x76yt4QwANCleBOa2tCk4mKQ9MJ1QvT+ddlwncWT31DitJ3XS4A82P4SvxfdjD4amA
 WkgB8qMacyB/w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id A2F845C04B1; Fri, 29 Jul 2022 19:25:32 -0700 (PDT)
Date: Fri, 29 Jul 2022 19:25:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux@roeck-us.net, alexander.deucher@amd.com, arnd@arndb.de,
 sunpeng.li@amd.com, harry.wentland@amd.com
Subject: Stack-frame warnings in display_mode_vba_32.c
Message-ID: <20220730022532.GA1234397@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Reply-To: paulmck@kernel.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

I am seeing the following in allmodconfig builds of recent -next on x86:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1659:1: error: the frame size of 2144 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 1659 | }
      | ^
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘dml32_ModeSupportAndSystemConfigurationFull’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3799:1: error: the frame size of 2480 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 3799 | } // ModeSupportAndSystemConfigurationFull
      | ^

Bisection located the commit shown below.  Doing an allmodconfig build
on this commit reproduces the error, its parent builds fine.

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

commit 3876a8b5e241081b2a519f848a65c00d8e6cd124
Author: Guenter Roeck <linux@roeck-us.net>
Date:   Tue Jul 12 15:42:47 2022 -0700

    drm/amd/display: Enable building new display engine with KCOV enabled
    
    The new display engine uses floating point math, which is not supported
    by KCOV. Commit 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov
    is enabled") tried to work around the problem by disabling
    CONFIG_DRM_AMD_DC_DCN if KCOV_INSTRUMENT_ALL and KCOV_ENABLE_COMPARISONS
    are enabled. The result is that KCOV can not be enabled on systems which
    require this display engine. A much simpler and less invasive solution is
    to disable KCOV selectively when compiling the display enagine while
    keeping it enabled for the rest of the kernel.
    
    Fixes: 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov is enabled")
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: Leo Li <sunpeng.li@amd.com>
    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index b4029c0d5d8c5..96cbc87f7b6b8 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -6,7 +6,7 @@ config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
 	select SND_HDA_COMPONENT if SND_HDA_CORE
-	select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
+	select DRM_AMD_DC_DCN if (X86 || PPC64)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 273f8f2c8e020..b9effadfc4bb7 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -25,6 +25,9 @@
 DC_LIBS = basics bios dml clk_mgr dce gpio irq link virtual
 
 ifdef CONFIG_DRM_AMD_DC_DCN
+
+KCOV_INSTRUMENT := n
+
 DC_LIBS += dcn20
 DC_LIBS += dsc
 DC_LIBS += dcn10
