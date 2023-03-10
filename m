Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0E6B37A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 08:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DE410E963;
	Fri, 10 Mar 2023 07:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Fri, 10 Mar 2023 07:45:20 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEB510E963;
 Fri, 10 Mar 2023 07:45:19 +0000 (UTC)
X-UUID: a90539942b294c70a63bc3f8564a22aa-20230310
X-CPASD-INFO: 968d5e738f684759bbb999cf5b53c985@goZyhGKXZWNkhniEg3qAc4KTkmlpZYO
 1d5xVY5FpZFWVhH5xTV5nX1V9gnNXZF5dXFV3dnBQYmBhXVJ3i3-XblBgXoZgUZB3iHhyhGWTZw==
X-CLOUD-ID: 968d5e738f684759bbb999cf5b53c985
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:192.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:112.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5
 .0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-
 5, AUF:6, DUF:17728, ACD:257, DCD:257, SL:0, EISP:0, AG:0, CFC:0.319,
 CFSR:0.082, UAT:0
 , RAF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM: 0,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: a90539942b294c70a63bc3f8564a22aa-20230310
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: a90539942b294c70a63bc3f8564a22aa-20230310
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 2109599434; Fri, 10 Mar 2023 15:40:09 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: resove reboot exception for si oland
Date: Fri, 10 Mar 2023 15:40:00 +0800
Message-Id: <20230310074000.2078124-2-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
References: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
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

