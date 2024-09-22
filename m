Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7797E0DD
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 12:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6DE10E208;
	Sun, 22 Sep 2024 10:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LOqSVS3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7A910E208
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 10:20:58 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2057835395aso38684885ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727000458; x=1727605258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdphpHCR8aVbgwIQ4xKroiJuMuvQa/f/rPNkLNXJpng=;
 b=LOqSVS3Fs7TqZmIushMTaf2UEDJzvaYTEgH+NdAQqQF5hgdAWYsXascFI1b16vOu8I
 OQlJ1IwF5nHAtSPABjgKX3V2/YfLP0pcxDyJIgorU567IU33ri6QmILKSfaEzYBFAhbu
 EjH+S6h4WrNLri/7KoXDtywVLpoyxiitJriUHSDMrPg25TxyJ9faeYE3vQ1ZRFVic4Sy
 h1W6KPQcJ/YoB2KNcgyfxuQlmiYIDReqhIj7kI5+EogxkBxKHY0Y0QUwqW2ZZ02LTHpu
 q4WSon2cxHC5PcerxbL6Xl/0OjlXiPocQPHWp6qh6IEZHTrsL7fdRT/AniJ4yVdmXUqi
 70eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727000458; x=1727605258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdphpHCR8aVbgwIQ4xKroiJuMuvQa/f/rPNkLNXJpng=;
 b=K3//qdbmnZx2LLCNbPEpKDCLUAB4wuqlcTOZbYwzcAzKGp61IM8IK2KdkOj7UxYdR7
 A8yobFT1tpjBsRHpmjlXyZrf4ynlSXg/YxgcCl9twc7Kcq0A8tQXZkyDhGvuNikwPXuh
 20wgVQIfQZQiqbMYFVFinw8fViKsg4OVP2mQnT33NgzHDUxUup5MdG5QprTA2PCfWIow
 uKeDiRY14TFftSjN45rusHDTKjGPIpk+Fue59GTpfsev2bbv6tCdZ6wd4Fth+oxwaH8K
 XPzHOeRKClHEv4FmzRv1VGfr7jOIKuoRsP6EJUvfRDr5e9HHYRqoblFijvo+T+smAH9A
 EZhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqXx/mQ2/thzQZa5SLhm0qF/Zb3G7JhC+C6/yECd+kqVMi1mJ2vsqVWIGLZmAQDmg1W9flWHryUSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGlJNWP/PU0cVXyZJQUfw8ts2WH6ef2JI8SdI+SaND79gjtAYL
 5XG4fKEzgM+2/mO8Ld3U87slTTEYNgQ3UveyllHj51WQ/mfBHvsC6iPZOw==
X-Google-Smtp-Source: AGHT+IHJFkRgYfEyGcG2xVh86zCa2dDUxlM9NiNctUcc86+jKhYpj9NQ0sCDUu7kuXl6CrzEV+ZQ+g==
X-Received: by 2002:a17:902:cf05:b0:208:d857:1014 with SMTP id
 d9443c01a7336-208d8573fb1mr110231715ad.28.1727000458325; 
 Sun, 22 Sep 2024 03:20:58 -0700 (PDT)
Received: from localhost.localdomain (111-240-85-119.dynamic-ip.hinet.net.
 [111.240.85.119]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946f3558sm118619615ad.183.2024.09.22.03.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 03:20:58 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: andyshrk@163.com
Cc: andy.yan@rock-chips.com, conor+dt@kernel.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 minhuadotchen@gmail.com, robh@kernel.org, s.hauer@pengutronix.de
Subject: [PATCH v3 06/15] drm/rockchip: vop2: include rockchip_drm_drv.h
Date: Sun, 22 Sep 2024 18:20:32 +0800
Message-ID: <20240922102032.564-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920082122.6742-1-andyshrk@163.com>
References: <20240920082122.6742-1-andyshrk@163.com>
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

>Move rockchip_drm_drv.h in rockchip_drm_vop2.h to fix the follow
>sparse warning:
>
>ARCH=arm64 LLVM=1 make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>mrproper defconfig all  -j12
>
>drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
>warning: symbol 'vop2_platform_driver' was not declared. Should it
>be static?
>
>It is also beneficial for the upcoming support for rk3576.
>
>Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
>Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>

Reviewed-by: Min-Hua Chen <minhuadotchen@gmail.com>

