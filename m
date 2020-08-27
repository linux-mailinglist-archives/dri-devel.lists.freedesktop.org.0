Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4E2545BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 15:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27356E0EF;
	Thu, 27 Aug 2020 13:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401CB6E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:13:37 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id k15so3457640pfc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=DZ5Yea35YebxbAkqpJve11AosKlbsG3icCT1rLzHqy0=;
 b=JJVWjrzaIrEzTXD6ruqqt6JH4/peF3bLfH8O4oOvfB/38w3SPChV54+WIdEx/OXa/Z
 fMgMc0+nrIaVQWLE3F5eyWU3R+1haVAWaiyDwdh2Do/ccwC/oePM3wPNermoIIuQCqDP
 lJAouFynrwo48oKU3lZpq5sZUeTTrdH1+CnftRVCZ6aDP0bBjv8yYsIJmHoraLwb7a6D
 +KnIhZ9qyeI2HxkKHQYe1pDxJixITNfISxyONdIw681ZiRvzdaXR3spNcvolxz1BlZ6s
 nWIlnJVrbpMeq6Rz2irbcMj2+iogqX6YANOIdFZZKpz6vf9l+2SohYh66ykYjqoqUfav
 rP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=DZ5Yea35YebxbAkqpJve11AosKlbsG3icCT1rLzHqy0=;
 b=Q+Thtx0KE9Izdd2FuTW8J78YpKpHenAFlExqDW3Ka1mF9sB40fF+34g+87/aw2Pdkb
 l0gg1laDLbwOMygARxTg3Fc3j2nh9t6dItZPhLc4o2OxkiPNtcfJpFYcnIcoWvBMeZo+
 FX+VIQBbB6l5Dcay2gfKcfEH2A+Y6ZM5AW7viboGiESBsBuZc0vjf/Dko2/CVh1/pyGa
 StLQoP/sP10zfXfE8eWPaap5ul7EuXRajTWCokpldry96dhBGkmfqJbtdLIpJFyGlSOy
 rZxZLTqRpDukihttosqD1CwFDTM9FRDAkY6qASrse1HlOuyf/Fz4KREev7faOsuXMfMd
 YWBQ==
X-Gm-Message-State: AOAM530ZjYXG2PApOM31iLDidecaA2Nt2WoHOBZ2lojtYcLgkr1baUEa
 h1+RjJGRutjNQeaGMjFvh7Q=
X-Google-Smtp-Source: ABdhPJxjEQL/j0z5nG9zBmN0KWiVmmmI5i7CCsvMymRImIB8DCVNc11Q+bMOUbusQEPg76jQcU9MAg==
X-Received: by 2002:a62:ddd1:: with SMTP id w200mr15148978pff.13.1598534016708; 
 Thu, 27 Aug 2020 06:13:36 -0700 (PDT)
Received: from [192.168.86.30] ([49.206.125.84])
 by smtp.gmail.com with ESMTPSA id s8sm2890647pfm.180.2020.08.27.06.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 06:13:36 -0700 (PDT)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH 1/1] AMDGPU : Fix bug in reporting voltage for CIK
Message-ID: <ca1c416e-50b9-e436-c1c9-90a85cf481ec@gmail.com>
Date: Thu, 27 Aug 2020 18:43:37 +0530
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

On my R9 390, the voltage was reported as a constant 1000 mV. This was due to a bug in smu7_hwmgr.c, in the smu7_read_sensor() function, where some magic constants were used in a condition, to determine whether the voltage should be read from PLANE2_VID or PLANE1_VID. The VDDC mask was incorrectly used, instead of the VDDGFX mask. 

This patch changes the code to use the correct defined constants (and apply the correct bitshift), thus resulting in correct voltage reporting.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index 753cb2cf6b77..2be006dd2eb3 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -3587,7 +3587,7 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr, int idx,
        case AMDGPU_PP_SENSOR_GPU_POWER:
                return smu7_get_gpu_power(hwmgr, (uint32_t *)value);
        case AMDGPU_PP_SENSOR_VDDGFX:
-               if ((data->vr_config & 0xff) == 0x2)
+               if ((data->vr_config & VRCONF_VDDGFX_MASK) == VR_SVI2_PLANE_2<<VRCONF_VDDGFX_SHIFT)
                        val_vid = PHM_READ_INDIRECT_FIELD(hwmgr->device,
                                        CGS_IND_REG__SMC, PWR_SVI2_STATUS, PLANE2_VID);
                else
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
