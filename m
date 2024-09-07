Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D982696FF7E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 05:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F36C10E157;
	Sat,  7 Sep 2024 03:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UdUX0OmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D32710E157
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 03:03:27 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5de8b17db8dso1603365eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 20:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725678206; x=1726283006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRAdeMKzd8GauuC39KSsRCc9kFo3QimzcrHIoNem7IU=;
 b=UdUX0OmBn6/wHXec925M5IhyoZ7UL4p2tZuvw8XueIHYaf2a6BiQOOyDewXJA/Ljkk
 v37kX9YwP3S/nV9kD2HVCn7HtbmQEdljl7GejFyTkHRDjYlLuQQhOkBSMMuh+p+jHIVU
 skRRlCUzAGITLDB466EyvabTr0zVJHoY1HTqypx5tdNXJwzaeckVYlOk8fQJjBdVqWR6
 pVLmnHrMuWbLajzZh0LvTOezLEF11zrmaXrXDxShetrW5vCAmx0e8leyror30NoX9+u9
 zWoiE08gkQsoGd8P1+DTbvRoZTHfNP3zM1VECdecMVaLBrOpZ7zPnR1M3VO01BExEyn/
 +1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725678206; x=1726283006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BRAdeMKzd8GauuC39KSsRCc9kFo3QimzcrHIoNem7IU=;
 b=k+MuOYd1h4dX/7AS6tdpM4OXaytmSqq2rYUYlv6B2I+J2iq9wN1PyG3DXuI81oA5Ms
 8S58xaMpwX3OcLs6bEiLDKD6+gegVE4JDuhG5/HPTpFsHVEH9CO3Tn5WK7ZMS1rhaiYk
 PmqnTA6Yu6Az2uWlHjRaMBLTdAjpKYzUN+wuA0tDBoEPap9EhkRTgcerfnfO9APUaJjO
 WGeJ2ltwMN9ax3A028/U7QNC4rJJoBkXnIWez6FXLyMz5J8P0BCHImbWLoWhFCVyD+i8
 1yUQzIzxgyK5RFbCbW/9m73iSVEXWMvblog0oT1P2VB6/Aa1SZo+PhrhOJ5b2f5PBr26
 vsng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkbf587KN3+2H/acz6ohtxQfhWB9z3znvaeXPWx1R8h/4Zm0WxjJSwwn0G0Fut2c7c1BVAAbgqUHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjagMGv+SMYSQYv5zWQG+FGFhIOM4Zx9Bncmez5JrWmfnvjZE6
 Sog7Gncw1FHaE/zqFwKHG2wReSc1fbaB93ldVVfCym5NdU1Pd8Kd
X-Google-Smtp-Source: AGHT+IGf+cTOg4F0hrHoR0BIG5sBf2EpDaf9/wE0zTHe1c2j8df+WSLWwxBuB56wKCCNV1Nhwmt+IQ==
X-Received: by 2002:a05:6870:6391:b0:27b:5890:bd38 with SMTP id
 586e51a60fabf-27b9d7cca72mr1541424fac.7.1725678206135; 
 Fri, 06 Sep 2024 20:03:26 -0700 (PDT)
Received: from localhost.localdomain (111-240-109-89.dynamic-ip.hinet.net.
 [111.240.109.89]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d825ab136asm156961a12.86.2024.09.06.20.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 20:03:25 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: didi.debian@cknow.org
Cc: airlied@gmail.com, andy.yan@rock-chips.com, andyshrk@163.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, heiko@sntech.de,
 hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, minhuadotchen@gmail.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
Date: Sat,  7 Sep 2024 11:02:59 +0800
Message-ID: <20240907030259.1243487-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D3Z5JMTKPQIS.2M5O5DY0S4U9G@cknow.org>
References: <D3Z5JMTKPQIS.2M5O5DY0S4U9G@cknow.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>FWIW: I didn't see it either, but I assumed I was missing the right
>context (i.e. patches) needed to trigger that warning.
>
FYI

I triggered the warning by the following step:

install 'sparse' first

git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
ARCH=arm64 LLVM=1 make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' mrproper defconfig all -j8


cheers,
Min-Hua

>
>> While implementing my feature, I happened to find that I need to
>> include rockchip_drm_drv.h in rockchip_drm_vop2.h
>
>Makes perfect sense :)
>But if the warning is indeed valid, it should be fixed on its own (IMO).
>
>Cheers,
>  Diederik

