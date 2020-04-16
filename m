Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F81AD0D7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957746EA31;
	Thu, 16 Apr 2020 20:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349F86EA31
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:07:46 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so26983pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hng3iV/5QTN2UhLp38nLV0u7v5dJVfXygHRjqwEIERU=;
 b=HiY4aD8RTE9cdJaElyKybsYLX22C7m/r1YxSHo7gDvg6itKJzNRQ3QjwVU5rDphEsh
 9zn58scSG1cBjef06fOWOtSyaNoY0fBrBUBEmc1tNV4e/jNUHwbRY+yF/57sMLczEGYC
 fu+FhPjdc4sF2g25AKkFtOZWXDVURRDTWIB0nHaxoZkP981wBziREFXNcrib4QfVZOiC
 b9eN+6WcNmMAC6Lx4jmsNJJQmdzfIz0gV9IAvMErZTSs1QXztOpAM0wdFasH8WMCWYMo
 4PSxDLv17YbqAGmFo8OEvgxsZN3xCtp5Y+Uo902eE1E4iv4QA9/UE69dsVy9IP+nFx4L
 lVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hng3iV/5QTN2UhLp38nLV0u7v5dJVfXygHRjqwEIERU=;
 b=c/dl5Crkwqsk46YLXe1kxSplBAVNxz1w3Kqxw1zsE9c0zd2gP3i2VtYXi1sODQygLH
 ATEcRyjkW9m6wJkQ5uuBtZm+fxal5gee4R7wj31b134ylAqddHC2kJxLPUpEsyeXpWn6
 Ot6UcvJ6up+RxwHrekrl2J5489gJAajsoz3f2YFAWqpL4gp5BZsyo+SXadTeSF2Byrm4
 UmjX/lkf2mShjpeEvzqHUVqTPOWHqObNruNFuQI8O98jJ/AcgkhPN+lZaPM/N5Dx1o4l
 HzcwSW0QYLVdaFESPxs6oUlksPZaHF9TxRDKHfbzRVM1ajHprZAbt0WgdmuQLAFlTWEM
 fjFg==
X-Gm-Message-State: AGi0PubIVmD7QFnidKyCRkM+MEmWLiddxRz5BgmI4Pwd1k2D/ccTfCG5
 JgwnNDbc81hi31bPGx2LZHY=
X-Google-Smtp-Source: APiQypJIF2TEg3CbWgHa+MSN78btMoZjQZ/6o1FEr9OUQef4gHxBdn9I4UO5fxCbhs/GjF0y0q+6sw==
X-Received: by 2002:a17:90b:430f:: with SMTP id
 ih15mr62912pjb.56.1587067665591; 
 Thu, 16 Apr 2020 13:07:45 -0700 (PDT)
Received: from ?IPv6:2406:7400:bf:c8e:cdcf:5655:ddb4:3b2a?
 ([2406:7400:bf:c8e:cdcf:5655:ddb4:3b2a])
 by smtp.gmail.com with ESMTPSA id w28sm15895093pgc.26.2020.04.16.13.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 13:07:44 -0700 (PDT)
Subject: Re: [PATCH 1/1] AMDGPU: Correctly initialize thermal controller for
 GPUs with Powerplay table v0 (e.g Hawaii)
To: Alex Deucher <alexdeucher@gmail.com>
References: <CAGPDPzCSaiXdL6ocFtL1VoFtiQLHDE5YQhw-ikWkFVjpaW9GAg@mail.gmail.com>
 <CADnq5_MTLNJ8mh6nZyH14b+RQx1mXwG3hX_x5wco6oQo2d2pUw@mail.gmail.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Message-ID: <ec13c954-2adf-5a6a-2cbf-40c70c6ce1ba@gmail.com>
Date: Fri, 17 Apr 2020 01:37:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MTLNJ8mh6nZyH14b+RQx1mXwG3hX_x5wco6oQo2d2pUw@mail.gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize thermal controller fields in the PowerPlay table for Hawaii
GPUs, so that fan speeds are reported.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

---
 .../drm/amd/powerplay/hwmgr/processpptables.c | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
index 77c14671866c..bb58cfab1033 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
@@ -984,6 +984,34 @@ static int init_thermal_controller(
 			struct pp_hwmgr *hwmgr,
 			const ATOM_PPLIB_POWERPLAYTABLE *powerplay_table)
 {
+	hwmgr->thermal_controller.ucType = 
+			powerplay_table->sThermalController.ucType;
+	hwmgr->thermal_controller.ucI2cLine = 
+			powerplay_table->sThermalController.ucI2cLine;
+	hwmgr->thermal_controller.ucI2cAddress = 
+			powerplay_table->sThermalController.ucI2cAddress;
+
+	hwmgr->thermal_controller.fanInfo.bNoFan =
+		(0 != (powerplay_table->sThermalController.ucFanParameters & 
+			ATOM_PP_FANPARAMETERS_NOFAN));
+
+	hwmgr->thermal_controller.fanInfo.ucTachometerPulsesPerRevolution =
+		powerplay_table->sThermalController.ucFanParameters &
+		ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
+
+	hwmgr->thermal_controller.fanInfo.ulMinRPM
+		= powerplay_table->sThermalController.ucFanMinRPM * 100UL;
+	hwmgr->thermal_controller.fanInfo.ulMaxRPM
+		= powerplay_table->sThermalController.ucFanMaxRPM * 100UL;
+
+	set_hw_cap(
+			hwmgr,
+			ATOM_PP_THERMALCONTROLLER_NONE != hwmgr->thermal_controller.ucType,
+			PHM_PlatformCaps_ThermalController
+		  );
+
+	hwmgr->thermal_controller.use_hw_fan_control = 1;
+
 	return 0;
 }
 
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
