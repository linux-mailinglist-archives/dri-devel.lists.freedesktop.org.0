Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E126F2E8C7D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Jan 2021 15:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B41899E7;
	Sun,  3 Jan 2021 14:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E0A899E7;
 Sun,  3 Jan 2021 14:04:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 482862080D;
 Sun,  3 Jan 2021 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609682652;
 bh=Ey75tATsrR5FQShYsC5Hg0ZFtsB2bV+9NEouqmN89Mk=;
 h=From:To:Cc:Subject:Date:From;
 b=RZUXyJwUA7NZie53rvyZdBbLFeSOxzKQZcfBmOgFC1JdnjSEuG7vVqfXdibnm8r22
 /i4uB58bksBlp/Akb0hPM9PREYz7jCCpie9NAm7Knm7LpxUfIEGOnWCtoX3wJjqMSL
 k98kEZKTBsncR8Mpt0Me0o9xfr5GvtV2QtBB6P1NMuIsS7ik144KP4OhQzQnqk9AkR
 KsGCNEiv0YFb37qFQi1EDWX6kzGT3PP+ACn6oHR5g7ZgujyS5cHIkZb7jibkR5FLKk
 M/bQ9lB4ysFAm8rxLl/uQ0DQvr/O47V194vJp3jiIFwcLwiy9zfzT1wTZBxUB4B84h
 ihgqW17Saqxrw==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
Date: Sun,  3 Jan 2021 15:03:45 +0100
Message-Id: <20210103140407.3917405-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 freedreno@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When LLCC support is in a loadable module, the adreno support
cannot be built-in:

aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a6xx_gpu_init':
a6xx_gpu.c:(.text+0xe0): undefined reference to `llcc_slice_getd'
a6xx_gpu.c:(.text+0xe0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_getd'
aarch64-linux-ld: a6xx_gpu.c:(.text+0xec): undefined reference to `llcc_slice_getd'
a6xx_gpu.c:(.text+0xec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_getd'
aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a6xx_destroy':
a6xx_gpu.c:(.text+0x274): undefined reference to `llcc_slice_putd'
a6xx_gpu.c:(.text+0x274): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_putd'
aarch64-linux-ld: a6xx_gpu.c:(.text+0x27c): undefined reference to `llcc_slice_putd'

Add a Kconfig dependency that disallows the broken configuration
but allows all working ones.

Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index dabb4a1ccdcf..b8e02859fd92 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -7,6 +7,8 @@ config DRM_MSM
 	depends on IOMMU_SUPPORT
 	depends on OF && COMMON_CLK
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
+	depends on QCOM_LLCC || QCOM_LLCC=n
+	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
@@ -15,7 +17,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM if ARCH_QCOM
-	select QCOM_COMMAND_DB if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
