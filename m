Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0608A9487C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 19:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4710E323;
	Sun, 20 Apr 2025 17:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZjC1vZYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6410E067;
 Sat, 19 Apr 2025 12:40:14 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so1533350f8f.0; 
 Sat, 19 Apr 2025 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745066413; x=1745671213; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NFkUoIalnF11ld77bLxt7fgP6SNTAES2GfYghBL6rQU=;
 b=ZjC1vZYXKvqnbb5rE1fLswO+PZjToGL73SCKrFPXWa9uivdagfa898rD7RwknQQItx
 1vtF3tc9grEoJBRLDAtSs+Lxg2BpVZvf+2scnFJSYZvj5H31IzqawukmHRB5vB70DNp2
 RGxqfQjy0clAioq9Xfl/73044oFskNj4wdG8MexZ+TzJ3a5ZeOJldMDI4Ocjaf2PVyjk
 2vq8GhLzGHpwSApfYeoLodlji0X5ol0FB4vt1xEXeCSEqLlPggWYBstmly7+z6h6tFOd
 2+4bv9yRf+hJDYC7/0Tv//o86ObE7nCa3uchN2y/KhBksqsjib4aPbJiaZcSLVgIbeOo
 xEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745066413; x=1745671213;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NFkUoIalnF11ld77bLxt7fgP6SNTAES2GfYghBL6rQU=;
 b=Hb/vVv+thuGNLdk0MbjjKDnWd5QapL6U5FRGlsm5nHGSwLHgYnhU+OgV+t4X3iRg5S
 edixexxfSvLeCwIpy0H/jnffIpAp3rB510QJ2FVkQJIN/6eTpcDgjviDEhSyBC03Glay
 58tgIHevl3XeKMrOGArJHk0ir6gCISzoF2xEG2RnVoUCQ/T7moMV8TP3z5aDn50oK5su
 +lYdIE1Q9i5dvjsZr1GaqVTKTAsQoQIXx/EZjS2IdxCpEl5EHM858iT4y3Mpy+/7Z5tF
 37EWhxv/UrlEFnEAjlQGPJp/y+juNJjRzW0+TbY/N/fETpTrvT75tjlh4zfCeww43HVc
 Bmdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4wPRIPq2vWLta9SgxL7j9yVPV7IQD2u95EHXw7nFb6VhB4kEnVNsfXs/9b0DhlTVjItDgkxWN@lists.freedesktop.org,
 AJvYcCUoGd3hkgCwIhpRZFCacLr2dDUfyj5dxKWjC9ZpDzXsJb5vH0wxViQ+EbyUc45S/KfFVXN2izEqzkzH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYdGTW5bWGtnInAymr2uhM/yRfqi7XDTzoa24pSoNkbnT65Nht
 mJ8Rt49gc46pVgbyFZn+ppW6ovwpuxN8GZmwTOxnoLxBDf0rqt1v
X-Gm-Gg: ASbGncuqA54lMI3X22WqlPC/JggbokzQvF1DNyid9WC0CDuzNwSRVh6Tq409156/8xb
 ZwuyQmqhKZz/qQMqFDz9o29ziBsiVJ2FEPph6uC1DsBXv2kYiiqv5xpbYTHoOcVs6Ot3sp9snlY
 4tMmdj7XcoR/jTdaFQrTCwnAfzLJWsnbb6BqixA1C81BsYYefpLwpB4eaasQjwFx/D/Ej3+kVFM
 QnKiTu5ttdQEMdAJe3iC5JchN0kiQ+DvMaKUpFTL0vDKL2Cud9zjb9a7IioTbIyngJW/4s7fJzq
 pngDO2m4bVTo7BkGqhuqKIMmBBOfb9+F8Y08ZEtiw/3sSKnUi4U=
X-Google-Smtp-Source: AGHT+IFboMiS1OBXG31n80CyHp6JDhmg/N+nheK2n0bl8jjO9adfQrgtg8IV8w1jkzVYvN4ECODmcQ==
X-Received: by 2002:a05:6000:4606:b0:39e:e698:b661 with SMTP id
 ffacd0b85a97d-39efba80464mr4001990f8f.32.1745066412769; 
 Sat, 19 Apr 2025 05:40:12 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4f06sm5808353f8f.92.2025.04.19.05.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Apr 2025 05:40:12 -0700 (PDT)
Date: Sat, 19 Apr 2025 15:40:09 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
 airlied@gmail.com, simona@ffwll.ch, aurabindo.pillai@amd.com,
 marek.olsak@amd.com, 
 roman.li@amd.com, make24@iscas.ac.cn, jfalempe@redhat.com, ivlipski@amd.com, 
 karthi.kandasamy@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Replace calls to kmalloc()+memcpy()+free(old) with
 krealloc()
Message-ID: <bgwysgwai2p4d564s5pod5xw2q27r6egqkkiycjt6v5xtwnpwi@jh5ogfr75rfi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 20 Apr 2025 17:31:13 +0000
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

Possibly gets rid of some redundant calls to memcpy.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 56bc2644e492..7ffd0d8f9897 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 
 	if (*cap - *size < 1) {
 		uint64_t new_cap = *cap * 2;
-		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+		uint64_t *new_mods = krealloc(*mods, new_cap * sizeof(uint64_t), GFP_KERNEL);
 
 		if (!new_mods) {
 			kfree(*mods);
@@ -154,8 +154,6 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 			return;
 		}
 
-		memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
-		kfree(*mods);
 		*mods = new_mods;
 		*cap = new_cap;
 	}
-- 
2.49.0

