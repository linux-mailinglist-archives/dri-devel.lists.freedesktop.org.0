Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE596C4FCF1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 22:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81D610E660;
	Tue, 11 Nov 2025 21:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Tue, 11 Nov 2025 21:11:32 UTC
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8EE10E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 21:11:32 +0000 (UTC)
Received: from [192.168.2.104] (213.87.136.181) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 11 Nov
 2025 23:56:21 +0300
Message-ID: <40da59f8-10e9-49b0-9f25-1474067625f6@omp.ru>
Date: Tue, 11 Nov 2025 23:56:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>
CC: Mark Yao <markyao0591@gmail.com>, <linux-arm-kernel@lists.infradead.org>, 
 Karina Yankevich <k.yankevich@omp.ru>, <lvc-project@linuxtesting.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH RFT] drm/rockchip: vop: fix simple case of window scaling
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.136.181]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/11/2025 20:42:12
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 197978 [Nov 11 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 75 0.3.75
 aab2175a55dcbd410b25b8694e49bbee3c09cdde
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.136.181
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/11/2025 20:44:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/11/2025 7:32:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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

In scl_cal_scale2(), if the dst parameter equals to 1, then division by
0 will happen. Actually, the whole {src,dst} - 1 thing is caused by what
seems to be an error in the Rockchip manuals which say that the window's
width/height fields of the VOP_WIN<n>_{ACT,DSP}_INFO registers should be
used for the division verbatim -- and those are actually 1 less than the
window's real width/height; so scl_cal_scale2() returns expected result
(0x1000) only when src equals dst...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 1194fffbb102 ("drm/rockchip: vop: spilt scale regsters")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the drm-misc-fixes branch of the DRM kernel.git repo
on gitlab.freedesktop.org.

Note that scl_cal_scale() does look buggy as well, but I can't figure out
(even having the RK3288 manual) how to properly fix that (it's only clear
that -1 should be removed; perhaps Mark Yao can help there...

 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
===================================================================
--- kernel.orig/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -360,7 +360,7 @@ static inline uint16_t scl_cal_scale(int
 
 static inline uint16_t scl_cal_scale2(int src, int dst)
 {
-	return ((src - 1) << 12) / (dst - 1);
+	return (src << 12) / dst;
 }
 
 #define GET_SCL_FT_BILI_DN(src, dst)	scl_cal_scale(src, dst, 12)
