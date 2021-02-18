Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E963E31F27F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 23:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7686EA6A;
	Thu, 18 Feb 2021 22:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397FC6EA6A;
 Thu, 18 Feb 2021 22:49:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82CD164DFD;
 Thu, 18 Feb 2021 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613688545;
 bh=SGNPeiZEIHSwqt1VUZYZ9K9idlNdJU7dXBV+/C03bbc=;
 h=From:To:Cc:Subject:Date:From;
 b=qf72mZ0ibMde6JSaiwo3z9u0PSmey7GqBjkO/kHW63QNTDh5qTnC+v3pZM2cK8m53
 kci+DlNpoQSBrLdL9n+ve0IIHyu75/z4/3RDexTH0x6qtfCCACtJaV05iEd/Puw+LJ
 9JY6MSC2ke9p2aMSKoHNW6x3GJ7DWeakB3dZGBMk5eRbRqbqMIbYOMCuJdTLMZZHps
 +0kznePsP6inGcIO3y5s91gwIN9qnTyATqgCf/mMdWquxETo2RNlYOnY8gPgaJASSi
 boUX1t/+bTKj+pUBP3WNRdCxoGfudBGGt//XgihjphTVawJmKjRSEVhja34s0KlH8Y
 Jn+gBttahZe+A==
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/pm/swsmu: Avoid using structure_size uninitialized in
 smu_cmn_init_soft_gpu_metrics
Date: Thu, 18 Feb 2021 15:48:50 -0700
Message-Id: <20210218224849.5591-1-nathan@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: Kevin Wang <kevin1.wang@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning:
variable 'structure_size' is used uninitialized whenever switch default
is taken [-Wsometimes-uninitialized]
        default:
        ^~~~~~~
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:770:23: note:
uninitialized use occurs here
        memset(header, 0xFF, structure_size);
                             ^~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note:
initialize the variable 'structure_size' to silence this warning
        uint16_t structure_size;
                               ^
                                = 0
1 warning generated.

Return in the default case, as the size of the header will not be known.

Fixes: de4b7cd8cb87 ("drm/amd/pm/swsmu: unify the init soft gpu metrics function")
Link: https://github.com/ClangBuiltLinux/linux/issues/1304
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index bb620fdd4cd2..bcedd4d92e35 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -762,7 +762,7 @@ void smu_cmn_init_soft_gpu_metrics(void *table, uint8_t frev, uint8_t crev)
 		structure_size = sizeof(struct gpu_metrics_v2_0);
 		break;
 	default:
-		break;
+		return;
 	}
 
 #undef METRICS_VERSION
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
