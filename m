Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1D62EEB0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 08:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A09510E6E0;
	Fri, 18 Nov 2022 07:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Fri, 18 Nov 2022 07:53:51 UTC
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619B610E6E0;
 Fri, 18 Nov 2022 07:53:51 +0000 (UTC)
X-UUID: e2b1022d870444de904bc7758601fd3f-20221118
X-CPASD-INFO: 2196396c782b4b0f9f54fe0c44f3a206@e4FzVmBrZJNjWHSug6V7oFmXZWSWkVC
 ydm6GY49iXFaVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3gXNzVmNnZg==
X-CLOUD-ID: 2196396c782b4b0f9f54fe0c44f3a206
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:196.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:123.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5
 .0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-
 5, AUF:6, DUF:8732, ACD:145, DCD:145, SL:0, EISP:0, AG:0, CFC:0.421, CFSR:0.046,
 UAT:0, 
 RAF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0 ,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: e2b1022d870444de904bc7758601fd3f-20221118
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: e2b1022d870444de904bc7758601fd3f-20221118
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 1969169403; Fri, 18 Nov 2022 15:49:02 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: add mb for si
Date: Fri, 18 Nov 2022 15:48:10 +0800
Message-Id: <20221118074810.380368-1-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zhenneng Li <lizhenneng@kylinos.cn>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During reboot test on arm64 platform, it may failure on boot,
so add this mb in smc.

The error message are as follows:
[    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR*
			    late_init of IP block <si_dpm> failed -22
[    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_init failed
[    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU init

Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
index 8f994ffa9cd1..c7656f22278d 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
@@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct amdgpu_device *adev)
 	u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
 	u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
 
+	mb();
+
 	if (!(rst & RST_REG) && !(clk & CK_DISABLE))
 		return true;
 
-- 
2.25.1

