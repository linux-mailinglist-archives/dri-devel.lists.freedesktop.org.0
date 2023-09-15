Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293DA7A1F60
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 14:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5107910E25C;
	Fri, 15 Sep 2023 12:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D027510E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 12:59:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31dca134c83so2080590f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694782765; x=1695387565; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thYoe0BNHvEOMDMTZOyxjv7HxezTMf3wBNBDqm2Ezmw=;
 b=Lqvt59pK4DG+KfVGRh7Lg+tphk3Ao9wRQPCSmicp4+1HFkjnfA65PnG7fDyXQGb7QC
 scrDsn4XtuCEYGMtzCAS06QYu7OLm4kCn553wbF9jedyZCqp4+3WgJIjodnUyKY31Aou
 psaCDS1X6+nwr7qUK+EfzMy7hGYlSG5udO9EI/kuL1LolbZ3jOqqBWIHXiIVft5/d7gY
 /e02Y14drOyKp3n+EAIVW3sevWk1hoBTYomOSvXnzVgdBmBtSzKGmlU2CyKch8+tg7/O
 9isjj8qKPluOyVO/91qWCAgzI1i4M2IIlWse3H2JuJwNHnkGP8k36OjlNuRGYm2bRH2O
 VV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694782765; x=1695387565;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thYoe0BNHvEOMDMTZOyxjv7HxezTMf3wBNBDqm2Ezmw=;
 b=SrUcJz+FXw7s+EEpGGMu1tx0x+MnXnBf4Sey7Y/BoaBvuB2r7PWup/HvcCfTMBP3Ua
 2R6nvhVU1HvvUM8WZu3W/S+dpIQFiYx2wxck0ivTnoTsPVhPDo47+i5T1u30Vw3z9LMp
 4xqB1B66OS56djGXsshhkKOWWn534DxvFSKy7OQmHwT6xp9jRm36e5kXMw98LIXXJA6k
 6OvhOY45vdntUXcUmysBJHL+JC7FUuiUSbRriOQPDudpyppGfVvo2hKSaDxVOtgJ2Uz0
 efkWvTMEU+4NiUoxkeG4KH0LoFETRF2wVlvHkm6d70XYvhuuFOLhUqiEVUJ3Pt238tzV
 3+Xw==
X-Gm-Message-State: AOJu0YytLnQHxuBx+RL4tlNOM3yT+xCraYgPNNvmVc8denmSgie+QnDd
 T+r9cm1TrMFoN0jponpdpL7kAg==
X-Google-Smtp-Source: AGHT+IHDdih5KavdMKTqMTv6Tmh6hfVUdgWGAPg7mzToh5I5IaoOvsPv/APF1zZtGBwwQ9m0ia1rNg==
X-Received: by 2002:adf:f5ca:0:b0:31a:d4d0:6e98 with SMTP id
 k10-20020adff5ca000000b0031ad4d06e98mr1282751wrp.8.1694782765099; 
 Fri, 15 Sep 2023 05:59:25 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n4-20020a1c7204000000b00402f713c56esm4566639wmc.2.2023.09.15.05.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 05:59:24 -0700 (PDT)
Date: Fri, 15 Sep 2023 15:59:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
Message-ID: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The u_memcpya() function is supposed to return error pointers on
error.  Returning NULL will lead to an Oops.

Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3666a7403e47..52a708a98915 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 	size_t bytes;
 
 	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	return vmemdup_user(userptr, bytes);
 }
 
-- 
2.39.2

