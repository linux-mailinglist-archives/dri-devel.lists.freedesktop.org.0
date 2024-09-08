Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491409707B4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 15:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCC310E0E6;
	Sun,  8 Sep 2024 13:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lpK1xFNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C310410E0E6
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 13:13:03 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2d86f71353dso2391876a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725801183; x=1726405983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QFv+GNCFsI4pY6KpEfbngQLTkjwWYYfX0SGlW8YyEU=;
 b=lpK1xFNUjIUhaX76/OT4JLB02JMSMD3FyTFlNYtKsIT7dDoadxJ8MnbCqFFBjYWXGl
 31x+b19IXcrqQOC/RsMUhqfAAMTcd6meSxq196nq/5SLlxq211lmiAjnyspd9Ov0/bmc
 CVk4eIheHn8GGerldmhZNpOiZkAOA5AYhn+dtHUZLLianHDSe5Gjfp2sVyEYalod17jQ
 WCUTpJTnttDcAbJ/O03zIg5biBNHMilrE/f4a7UpSJfyrObJFtaq3X+VcH0n2rQE31VW
 +zKjgxXosEMrQNOsjw99EVgZlleBUIims3SkMJkpYQrcQcLZVE9UZR3KMmvbL9YP3MeJ
 rqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725801183; x=1726405983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QFv+GNCFsI4pY6KpEfbngQLTkjwWYYfX0SGlW8YyEU=;
 b=boDO6vqoSU96mxBiZ2z18UintCoEZnCHJgmcgA0A68wEPUcEZAWXRDx+ErxXNlC8vt
 8FUwlWLAn85419t5LHs0dk+eEYvDFMRmdhDGavHJKn7MsVdMq7g1U033QCa86J7NbYMK
 VVeRHyrgba9F9DLSTNyhQ2IQpqmSrqANPHMuyfCvZPKhudn+V3ttvXM3j7WmAVf6PLxj
 dJj6HDAZHKeewU46Sb5HR/Hevc/wBqa2gtoJEYgus1RLrjxmYQ9Qi7/TxMI01BQRzjbh
 jpbszmRLckVaeJbHVhHGDJ2qEi6jpg2YNNzzv9spGxXtl6W4XmoT6wTB1/fe//N5Sf86
 FhnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7zGug4o56i4kDFMWk1lbXuPalr2A76QNoyNKoyr/iLScGh4QtJrs4JgQr3Z2I3ozh0YD1UvB0tfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXJscnNujjL2wNjiWoV+YEUcPHqPkT2sLhYFZkfKTEaFAQMlcb
 rIpX8MDBy9RBKbdLg+xo7H5GsTR4/5WC4i1T4FDV/ylk8Wk70A+x
X-Google-Smtp-Source: AGHT+IEfAWgV1CcdDM42hBbDeFjDbTFwOWDIC4d24tE1KlukJw+3/UVvLeds94DXNOk6wgRI4B09jA==
X-Received: by 2002:a17:90b:3846:b0:2da:89ac:75b9 with SMTP id
 98e67ed59e1d1-2daffa7fcaamr6298933a91.11.1725801183059; 
 Sun, 08 Sep 2024 06:13:03 -0700 (PDT)
Received: from localhost.localdomain (111-240-109-89.dynamic-ip.hinet.net.
 [111.240.109.89]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db043c3b65sm2721946a91.25.2024.09.08.06.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 06:13:02 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: andyshrk@163.com
Cc: airlied@gmail.com, andy.yan@rock-chips.com, daniel@ffwll.ch,
 didi.debian@cknow.org, dri-devel@lists.freedesktop.org, heiko@sntech.de,
 hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, minhuadotchen@gmail.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: Re:Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
Date: Sun,  8 Sep 2024 21:12:37 +0800
Message-ID: <20240908131237.741-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <175266d5.2a89.191cbb2a62e.Coremail.andyshrk@163.com>
References: <175266d5.2a89.191cbb2a62e.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>>  DTC     arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
>>  DTC     arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtbo
>>  DTC     arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
>>  DTC     arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb
>>  DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb
>>  DTC     arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
>>../init/main.c:192:12: sparse: warning: symbol 'envp_init' was not declared. Should it be static?
>>../init/main.c:290:16: sparse: warning: cast to restricted __le32
>>../init/main.c:291:16: sparse: warning: cast to restricted __le32
>>  CHECK   ../init/do_mounts.c
>
>>
>
>
>I can see same warnings， a lots of。
>And also see the warning in vop2：
>drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse: warning: symbol 'vop2_platform_driver' was not declared. Should it be static?
>
>
>Min Hua，If you are agree，I will split it from my patch， and add a Fix tag ，and also add a SoB of you， Then resend in My V3 series，this
>will make my patch series easier。

It looks good to me. Thank you and Diederik for commenting.

cheers,
Min-Hua

> >And several followed, including in c-code files. So I stopped the build
>>and assume you've identified a or several actual issues.
>>
>>I've seen several commits where changes were made because LLVM flagged
>>potentially problematic code, where GCC did not, so it's quite possible
>>you're on to something here.
>>
>>But it would be helpful if the commit message said what code was
>>potentially problematic and why. And then the proper fix for that could
>>indeed be to include `rockchip_drm_drv.h`.
>>
>>Cheers,
>>  Diederik
