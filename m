Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B236B37A3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 08:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B330110E966;
	Fri, 10 Mar 2023 07:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1605710E964;
 Fri, 10 Mar 2023 07:45:19 +0000 (UTC)
X-UUID: bfaf3b3b4df0410c8d7f35f284529c16-20230310
X-CPASD-INFO: 9d00fa27f33d41c298fadc8022794e1a@grRqUJOTYGeSU3Wwg3SubFlpmo2Esnp
 qUmJlaWCFhrOMbFJkYl1SgIFqVmprYmBZUHt1bFZgYGJdUXh3lHKPVGBeYIJUdJOAe55QYZSR
X-CLOUD-ID: 9d00fa27f33d41c298fadc8022794e1a
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:196.
 0, ESV:0.0, ECOM:-5.0, ML:14.0, FD:0.0, CUTS:112.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-
 5.0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:1.0,
 SPC:0, SIG:
 -5, AUF:7, DUF:17729, ACD:257, DCD:257, SL:0, EISP:0, AG:0, CFC:0.319,
 CFSR:0.082, UAT:
 0, RAF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0,
 ESB:0, ATTNUM :0,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: bfaf3b3b4df0410c8d7f35f284529c16-20230310
X-CPASD-BLOCK: 14
X-CPASD-STAGE: 1
X-UUID: bfaf3b3b4df0410c8d7f35f284529c16-20230310
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 1495147978; Fri, 10 Mar 2023 15:40:09 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: resove reboot exception for si oland
Date: Fri, 10 Mar 2023 15:39:59 +0800
Message-Id: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
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
Cc: David Airlie <airlied@linux.ie>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhenneng Li <lizhenneng@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During reboot test on arm64 platform, it may failure
on boot.

The error message are as follows:
[    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR*
			    late_init of IP block <si_dpm> failed -22
[    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_init failed
[    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU init
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index d6d9e3b1b2c0..dee51c757ac0 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7632,9 +7632,6 @@ static int si_dpm_late_init(void *handle)
 	if (!adev->pm.dpm_enabled)
 		return 0;
 
-	ret = si_set_temperature_range(adev);
-	if (ret)
-		return ret;
 #if 0 //TODO ?
 	si_dpm_powergate_uvd(adev, true);
 #endif
-- 
2.25.1

