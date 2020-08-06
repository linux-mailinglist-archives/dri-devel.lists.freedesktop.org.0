Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A855B23DE14
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 19:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B427F6E8F4;
	Thu,  6 Aug 2020 17:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77886E8F4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 17:22:16 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l60so7165771pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1il+jlhAe27TNbWYMVwCYEIkVz59+uj4fFT9aeLJuPY=;
 b=unUaTNqclUloC3w5mLEY4TLz+rIWGRrtkelZTGVKbYAArpgjAG8UbAoKo5Dc4H7Gd9
 ywLMj4ihPvXDXCnSI1lN5sp0hV4zV/aJqu4eeW0Hv7OUDqva1o30peVaz7S7Eo/GZL5L
 DhXo8H7Ot5ZK8H4PinIihDy3YY3rttVGi1Hd+ZsDP9RmuZLhFBn8IABr+mXsECCtUSbM
 uTsWfWdmtew9dxBLBz29gDC6i4O7Js16Wk2AaxnCCQzSnkNV75t0yWTockZdlCn+VfBf
 1OeUxZxoKcQV5KLzqQjtQyAC6YgpFqxq6Cb/52ArZYFCPo3c/sh8YY2q20ahxb1DidS3
 dcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=1il+jlhAe27TNbWYMVwCYEIkVz59+uj4fFT9aeLJuPY=;
 b=QFWhZX4fBO0aceQW1eUsMKpg6F5854ZrDBKKf3SsgzouAILP2AIJbgIBVOXhiKcHS0
 VtfCDEow6MOCyld/0ltivBU4s+SjoRwk//2vkFn4cQ9lPy6KPWtthAqQLQQTbEsLgu90
 tZLq6203cAoG4ZpovPDDLwhL7P9p8tVNU0R6f5Hfi6csJUXxa+bJpO3rKjicjCfKhuXL
 29JG6sqZcr+TH/F0nMxaNizYF+E/F3AhOgStEFLBhHy1a8qeh2aem26uFcwX3uhprTq8
 XzAYRDQg2CoslaNhKokOU94BftZzqNn263TdK9un3/GT55tF9cT+onYqH5kB81GrH+LG
 NHRg==
X-Gm-Message-State: AOAM532cJLgeG6pcAuerOCbpsVbCA+JTL7wy236Y2jf8JhrbbhcTgopO
 EYkkyprE0vWeU11eVAasjLxZr17m7mk=
X-Google-Smtp-Source: ABdhPJwaN2GsWhDTW5PaauIp2sT89bf+6+KzkaXy10kUkD62jqR+LiIF54AkmoIVWBL9OGNsSDMK7w==
X-Received: by 2002:a17:902:56a:: with SMTP id
 97mr9073269plf.130.1596734536404; 
 Thu, 06 Aug 2020 10:22:16 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.135.172])
 by smtp.gmail.com with ESMTPSA id j13sm4541523pfn.166.2020.08.06.10.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 10:22:15 -0700 (PDT)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH 1/1] AMDGPU: Fix bug where DPM is not enabled after hibernate
 and resume
Message-ID: <0d9e084d-0bb1-6dbe-f8c5-22d4fdb9c989@gmail.com>
Date: Thu, 6 Aug 2020 22:52:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the bug I reported here: https://bugzilla.kernel.org/show_bug.cgi?id=208839

Reproducing bug report here:
After hibernating and resuming, DPM is not enabled. This remains the case even if you test hibernate using the steps here: https://www.kernel.org/doc/html/latest/power/basic-pm-debugging.html

I debugged the problem, and figured out that in the file hardwaremanager.c, in the function, phm_enable_dynamic_state_management(), the check 'if (!hwmgr->pp_one_vf && smum_is_dpm_running(hwmgr) && !amdgpu_passthrough(adev) && adev->in_suspend)' returns true for the hibernate case, and false for the suspend case.

This means that for the hibernate case, the AMDGPU driver doesn't enable DPM (even though it should) and simply returns from that function. In the suspend case, it goes ahead and enables DPM, even though it doesn't need to.

I debugged further, and found out that in the case of suspend, for the CIK/Hawaii GPUs, smum_is_dpm_running(hwmgr) returns false, while in the case of hibernate, smum_is_dpm_running(hwmgr) returns true.

For CIK, the ci_is_dpm_running() function calls the ci_is_smc_ram_running() function, which is ultimately used to determine if DPM is currently enabled or not, and this seems to provide the wrong answer.

I've changed the ci_is_dpm_running() function to instead use the same method that some other AMD GPU chips do (e.g Fiji), which seems to read the voltage controller. I've tested on my R9 390 and it seems to work correctly for both suspend and hibernate use cases, and has been stable so far.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

---
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
index 56923a96b450..056b3ad1565f 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
@@ -2725,7 +2725,10 @@ static int ci_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
 
 static bool ci_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
-       return ci_is_smc_ram_running(hwmgr);
+       return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
+                                            CGS_IND_REG__SMC, FEATURE_STATUS, 
+                                     VOLTAGE_CONTROLLER_ON))
+                       ? true : false;
 }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
