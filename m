Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CF6EF993
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 19:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DAC10E22D;
	Wed, 26 Apr 2023 17:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0AF10E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 17:44:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso4773200f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682531085; x=1685123085;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K8jM2knRGN9BYsAyJBymJ0PdQVU0ygOmY27Y7/+qCDI=;
 b=dGNfBKb9cOspje21udAgXEAc23Tc4Z72X3t8ZVn2jE+rKhLcPb1xK5ro/DO1MAuRqm
 sbZZu2SQqlPJgJdpUHOhBxXY0L87NZsXNBhgZfRx/ZSywy1gaI/a2gkZOnjwdnQ39z9w
 4qxs8ss/9Bztm4JDUYEloRLQuBR0oVgPJ1vdc7BvBIME3an1PvbAFmSfuGmBKelDDQAT
 jn1bSrxxcJUaoy5XKd2HaBXRhHO6euuvR9COlgAtpTvN6Q3mSdSnswucBKXkXyx6L4K7
 M0TZUM5TkBIUyJA3fkYnZEfe1w/eOaXdmNp3E0N8TqYQG+q8ZFW94hZllEUSPP/6xitg
 98YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682531085; x=1685123085;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8jM2knRGN9BYsAyJBymJ0PdQVU0ygOmY27Y7/+qCDI=;
 b=Lhs9rlAwVTf4Oj5JoTRzZBFv7YE9+kKWnncjMfcAJ09Dn1MOeYwU/oKoFKrTBDlf/i
 f3+C5D3MgcrHAj9YNfVR7PChaJpL8+zmEXEbdhuOCvjsyKZSUDSatIok4FURXEXo+9/b
 eCoYnkRCY/FgPbSO97XnFVliMgE3caMdU/5tkJQIe68aaTJuqYTWRr+pArWhM9rEVrVj
 GGkFPwdln7KbhOBa8cKTXD3qRv65HkeJb9ub7lk//LpNrIVvK+fQ7XO+h1miuNeGhm19
 zc4QwysFFZuY0olbDw3XCielmF/5fdkZIhDtH27klXJdmu/tFOoofri2OoIDX3d0SxyM
 qTOg==
X-Gm-Message-State: AC+VfDwd9om9WS73qKkVZ9OEHttzrXUrwg6CQujUwZ43rMqaHFhq225p
 Bst740+TFoxMUJO4tvjh/vU=
X-Google-Smtp-Source: ACHHUZ4cBwzwg8x4y5GrjX4A4GxBkfNdMxrAR8PRw2iXL2mzOpOy62rGGFU55CDvMzPtE6tS8QYQVA==
X-Received: by 2002:a5d:6610:0:b0:304:7bbe:87f7 with SMTP id
 n16-20020a5d6610000000b003047bbe87f7mr6871658wru.58.1682531084849; 
 Wed, 26 Apr 2023 10:44:44 -0700 (PDT)
Received: from debian ([63.135.72.41]) by smtp.gmail.com with ESMTPSA id
 b2-20020adff902000000b00304aba2cfcbsm55744wrr.7.2023.04.26.10.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 10:44:44 -0700 (PDT)
Date: Wed, 26 Apr 2023 18:44:42 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: mainline build failure due to 322458c2bb1a ("drm/ttm: Reduce the
 number of used allocation orders for TTM pages")
Message-ID: <ZEljCgVFnDl/C+l3@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The latest mainline kernel branch fails to build powerpc allmodconfig
with the error:


drivers/gpu/drm/ttm/ttm_pool.c:73:29: error: variably modified 'global_write_combined' at file scope
   73 | static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/ttm/ttm_pool.c:74:29: error: variably modified 'global_uncached' at file scope
   74 | static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~
drivers/gpu/drm/ttm/ttm_pool.c:76:29: error: variably modified 'global_dma32_write_combined' at file scope
   76 | static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/ttm/ttm_pool.c:77:29: error: variably modified 'global_dma32_uncached' at file scope
   77 | static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~~~~~~~


git bisect pointed to 322458c2bb1a ("drm/ttm: Reduce the number of used allocation orders for TTM pages")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
