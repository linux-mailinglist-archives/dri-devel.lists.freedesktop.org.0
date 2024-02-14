Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7685408F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 01:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58AF10E971;
	Wed, 14 Feb 2024 00:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SiwuB6QY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4D10E978
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 00:00:26 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d7431e702dso42698275ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 16:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707868824; x=1708473624;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YMBETSS65YtqnXuGPPIuISSAqLQJ5kfAKukBNt/idE8=;
 b=SiwuB6QYvne3X826qdP+/MSbRU0Qm/A+aTVg2IY61kiYEh+0r2mq9y94uhpCDR2Wdl
 Ec/oV2Vbf5WMGNLZTMXHHyMq5o9hImmB2W9mZ4QyqM9AEfahZ99Or6AoBS8Ui7KqcPAg
 PvBnNIhn/Ws5M9pZf1sU0KK0L2+hyHscJpVJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707868824; x=1708473624;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YMBETSS65YtqnXuGPPIuISSAqLQJ5kfAKukBNt/idE8=;
 b=NVCpB9zzdfj4F1W+C2mvD6fO03x2Nyi8F2AvMBVTTdLsZtd4PODMIeoRXGTndYthna
 G2lzrVQ+8NMlEVOWz03E9yx5xqO1dfzVZatZ6uyPbB+iisNTOhlOWNDQINc5V/WaSNV5
 WB6iTc+MYnA5h5JKAoSFzPGvhgwYlkbl7Bc6TWnd3c0B0mA1+U56ppxT22s5TOkpSnzl
 fozmc1j6gP/6QTJj9EGO9KIR2o0auIiDrR031UKnuqCGEYDmirzpc+X1eN+fQdmJrgUC
 YdViC6GEf7s+dIjwlHB+meO/UfMs1Yuz/bK7N3chxEVdcgOS/eaIrz9NzDBSECESQ9fP
 OxPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+usSt47VcxkZp54YTYcyNqfRu5lDLbkscp7eTEbhLwoc7WTxRZ49+9qxLNfguisKG3VhL2sywP1zAqPFkDbcPPf6BveUTLVUcssz6dPph
X-Gm-Message-State: AOJu0Yzugx47rxVyJnIy8XgUu+09cZs7LMPpohW/9p6RQJM5XIl1S3B6
 IQnmrEigQJRDfSXNozEtkQUEkk31V5X0lAsUmR51pR6uFXemAgaLku/0cIqnBA==
X-Google-Smtp-Source: AGHT+IH9rsUe89jGMxEbzEa0N6vUYHDPRuvR/b9/k1IT9a00gMG0R2c9wJlulVF3FzsCot+gzaw1PA==
X-Received: by 2002:a17:90a:f40c:b0:296:15ed:b220 with SMTP id
 ch12-20020a17090af40c00b0029615edb220mr832051pjb.45.1707868824140; 
 Tue, 13 Feb 2024 16:00:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXvqigQwCxsR1eRkChMkloewkaYy2M5PIy5Ni/XnHBQDAoKHR/aIWNhHUmSslt8uKRHk2RvI4FXgV3UeO0qZK5hqOibVcIauBOnaVV6bWqTt+6c8dkIprXNrI5L5VfYBFUHS69JyCg+nHpwWH2NA7USk6ZGA7BJYmKeBVNaUv6t7nbX6rD1Z408EwIrtCw4leiFoAOQQxPSKq96raZChBqacZ3+4FYorcIV+LyapGi48IgtKsvYmWtHxOooH1tU+9GuPo7DWxRObhQs2h/a8NPsVDG+8Ii56LWj61JxEfWg8Jpnp22Q5QXdxTZePUUSTJkUCjhZzswaHYKdG9wthJUgMDbiBypE28viY4HtoFLOasVUO9pQGnzZlTiocOiJc/j2G5FPsjyRYU/m/U+tLeylJhN8RRMOG1mblR4pXyrkPq8U4+QBJzK2xCgs4paq+UjHOlY6f8nCDaPTIYca6QGUU4oDY6Wxvl/ffuvXbNTLjgytPTUvb0LZI8DpX3qZ9VXoyFO2DA98Nd/FyAdnCsh9Wx4mk4ILJR0vc+h2OOqUOjdFTYgx1CTlgPMBCwL2wn02OHDgfzIBa4fgsHNuZ2cYDjFG1baEF2loFgOxwfI7AqA2M0tBhkyn56ZLLulIRLW9y2Yhe/oRExou8cAUYnr3X3fcva1E523zl+gb8uJN9PUnSoaBABRO4nU5Zub2E2rHh6pibQJRTd5zMWMDH/6Ng64ln4aFlKDp3UrwcNFtF+9YSPO3aiogzLGUboEk6CYsA2Qc6BtsMMWfB3lxYqpKqJTGb1frpJIrwJTMGNoHZ330172lV9akQVjbSxkHoEY9vEhupNRlyX1PhADYagw9Eug9eM1rAObW7gqFTdA9KWXKUA0JFFdMhd46aF3gGGOFbVnANrA1fRYLe3cigO4CcuNuISMz8MiDonjdbYtNfdfO9UmzV/30vOkiws/N/gTW7P
 9ZxedQ9fPgpdcMoM9aUXZcpQijJVqwyZiu0ME7ezdhRn4k0vJV3sxJfd8YsRR/fEySJmzTASB18YtNpPAPC//yt7IQiwiKqBOckpWmQ0j4IQj5XbaBcWuhawwVFuZ4eLJmroLfpIackC8FxNUKY62wd6T0mgw4m9+N2ZG22Gfz
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 mv21-20020a17090b199500b00298c373a820sm100292pjb.23.2024.02.13.16.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 16:00:23 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Tue, 13 Feb 2024 16:00:23 -0800
To: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
Cc: Sun peng Li <sunpeng.li@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Roman Li <Roman.Li@amd.com>,
 Veerabadhran Gopalakrishnan <Veerabadhran.Gopalakrishnan@amd.com>,
 Horatio Zhang <Hongkun.Zhang@amd.com>, James Zhu <James.Zhu@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, David Airlie <airlied@gmail.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Leo Liu <leo.liu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Li Ma <li.ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Morris Zhang <Shiwu.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, dri-devel@lists.freedesktop.org,
 Shane Xiao <shane.xiao@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ran Sun <sunran001@208suo.com>, Jane Jian <Jane.Jian@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Ivan Lipski <ivlipski@amd.com>, linux-kernel@vger.kernel.org,
 Tom Chung <chiahsuan.chung@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: jpeg_v4_0_5_start(): Code maintainability issues
Message-ID: <202402131600.FF35A56D27@keescook>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240213 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Feb 12 16:09:32 2024 -0500
    0a119d53f74a ("drm/amdgpu/jpeg: add support for jpeg DPG mode")

Coverity reported the following:

*** CID 1583635:  Code maintainability issues  (UNUSED_VALUE)
drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:461 in jpeg_v4_0_5_start()
455
456     		WREG32_SOC15(VCN, i, regVCN_JPEG_DB_CTRL,
457     			ring->doorbell_index << VCN_JPEG_DB_CTRL__OFFSET__SHIFT |
458     			VCN_JPEG_DB_CTRL__EN_MASK);
459
460     		if (adev->pg_flags & AMD_PG_SUPPORT_JPEG_DPG) {
vvv     CID 1583635:  Code maintainability issues  (UNUSED_VALUE)
vvv     Assigning value from "jpeg_v4_0_5_start_dpg_mode(adev, i, adev->jpeg.indirect_sram)" to "r" here, but that stored value is overwritten before it can be used.
461     			r = jpeg_v4_0_5_start_dpg_mode(adev, i, adev->jpeg.indirect_sram);
462     			continue;
463     		}
464
465     		/* disable power gating */
466     		r = jpeg_v4_0_5_disable_static_power_gating(adev, i);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1583635 ("Code maintainability issues")
Fixes: 0a119d53f74a ("drm/amdgpu/jpeg: add support for jpeg DPG mode")

Thanks for your attention!

-- 
Coverity-bot
