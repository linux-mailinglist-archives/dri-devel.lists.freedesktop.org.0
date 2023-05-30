Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D0715D08
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 13:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083E010E13C;
	Tue, 30 May 2023 11:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595BF10E144
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 11:22:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6094cb2ebso29850895e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685445774; x=1688037774;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=97Z4eV9V3DldLgqN5w3lvvZak1iMnPtv9R7TQuTgF3g=;
 b=qTy8dyzuRWF/mj9Ze94/9J/+0Z2sGQBaJAgnWhmqj/4ynHpL3gZ6e+pQep6J5Yu+JJ
 +joQ6U+9S5qyMAU4uLLFXLFhzkWhj2F2L4VqyZZgoOp2Gp559XK6bwPBJcVUDozDooHD
 vVePYHYY47MYkTBOwwPFSix8x5zJuUfS6aMjHv6XGS7tmC2jrA7WJCl9XxDBYXZu9fxZ
 X8kfOb4AbDoaz7wXBq4mXSFurH/+VkJD8a14exMGg3FyJYEAQsT8VfP2JqAWg8VeaF8L
 5w7xfqw9PMZdM2yqHWvZ/LCCYuNp98b9xyPxHPhnGlh+Nzxiss5PQyWTaNn3isCjSCW7
 v73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685445774; x=1688037774;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97Z4eV9V3DldLgqN5w3lvvZak1iMnPtv9R7TQuTgF3g=;
 b=PFM0T7+PoxKsCSj5rw9rD1AMSyLAKVtdDyoyzTPDsYwjwrNGjDLJj/q7I2N+o1rcIg
 UR06YCmDgUXzLCKiA4vCgcuUdWfCGaFt/OH5FgofjQt3Yj18Kr1/l0JA2dHL6wGDuA/H
 /K+cB7r4ciE3ceRLeKsovOdPOy/mGRTbk+2qIX5x54+1YhvABy/FuixJiWjbVZE1HZLJ
 YmklBhhdIfgztvY7zyhZvrh8IT5HE+Lb/X7Z1B8XbmwpMr8Un9yE9phOHvnjLZGNAEb2
 dr2NcbrgXBKgF8SPByZ2KYKGgK1QT6IuqujdfdSNA1ez/ztcJP/Mt5HD0vfGLpjEz2Tm
 Xa6g==
X-Gm-Message-State: AC+VfDzZPn6es1/rv8HwPnXfyEBLiIIDJKvkZ+CcWB01td7L485ENJjB
 BHRzdRj1+l6sgZu4i1zY9mXDCw==
X-Google-Smtp-Source: ACHHUZ4kU14nz6zYAt//WST+vJZjHT1A0ZslMCXW2yWFwv1A1FzuUkpwCt4nzo8X4FLfv/F4WQ33Hw==
X-Received: by 2002:a05:600c:250:b0:3f6:3bb:5135 with SMTP id
 16-20020a05600c025000b003f603bb5135mr1416524wmj.14.1685445774105; 
 Tue, 30 May 2023 04:22:54 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003f60d0eef36sm20788514wmj.48.2023.05.30.04.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 04:22:52 -0700 (PDT)
Date: Tue, 30 May 2023 14:22:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: chris@chris-wilson.co.uk
Subject: [bug report] drm: Track drm_mm allocators and show leaks on shutdown
Message-ID: <d870b9c1-fb95-41fd-820f-68f78ca39148@kili.mountain>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chris Wilson,

The patch 5705670d0463: "drm: Track drm_mm allocators and show leaks
on shutdown" from Oct 31, 2016, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/drm_mm.c:1001 drm_mm_takedown()
	warn: sleeping in atomic context

drivers/gpu/drm/drm_mm.c
    991  * drm_mm_takedown - clean up a drm_mm allocator
    992  * @mm: drm_mm allocator to clean up
    993  *
    994  * Note that it is a bug to call this function on an allocator which is not
    995  * clean.
    996  */
    997 void drm_mm_takedown(struct drm_mm *mm)
    998 {
    999         if (WARN(!drm_mm_clean(mm),
    1000                  "Memory manager not clean during takedown.\n"))
--> 1001                 show_leaks(mm);
                         ^^^^^^^^^^^^^^^
The show_leaks() function does a GFP_KERNEL allocation but a couple
of the callers for drm_mm_takedown() are holding spinlocks so it's a
sleeping in atomic bug.

The problematic callers are ttm_range_man_fini_nocheck() and
amdgpu_gtt_mgr_fini().

    1002 }

regards,
dan carpenter
