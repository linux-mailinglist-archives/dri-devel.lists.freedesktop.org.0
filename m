Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB38A9D44
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64364113D06;
	Thu, 18 Apr 2024 14:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cwOwRh9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6CA113D07
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:39:28 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so1196221e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713451167; x=1714055967; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nuCjQiCriLW2FeQ8Vl9Z1Bwf8E1dBE3lBb7kgfpErko=;
 b=cwOwRh9ylUveLRiuJF0qOnLf6Bejum2IXxhdtPFJ3gSumIu0HYyvcZXFBsl1y3sfqn
 grc0zqyRHoHvX+H6XjvRPDQ8ey2sIdpK4tmpPBqG1gZhUB1efa/cmFgMGqpHNY66nXxq
 4evPy2OA6sPEX/YvY2un2D2lgS78Rva4Yjihu7U+KFjJhikjf3NVmHcYYN4MbAMLVT+B
 u8h4bPTCxzL1S+wpHuUdbEFQlhjTCp+EmeUrun2uqg9wCDyVErC/DuVE08TXCYRXPt3u
 irU/KgRAG0si4brviIq2nhqDgEQwSwLIU7Z8LYmoUvliB0vprN3J3RNgeMwQXzUHiuNE
 bdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713451167; x=1714055967;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nuCjQiCriLW2FeQ8Vl9Z1Bwf8E1dBE3lBb7kgfpErko=;
 b=oLrDdEMTKLTaJMjl9l6Vyc4M/UPBxjvXsabK6ZY3HJ4J8vuNsiSz8ldhpOsWYnjFcm
 b7jVsDiwmyX2VXTHD+7NgxQaUH/T2mTagwYpnTO50zef+s2hr5d+hj7o11YkPGLCRLcq
 O1mh6bHJQfUS2DhMfpZnwfd4fNFczjPPwh2UjQuh8F4rJ4foM+S36oB9mjEWV0AhIikF
 C8cNwoTsGfREEMWwPU1TOcE0z8fI5BzVlgdYMCy4fYg00YP8WctsJMohT5E4czbuHHxj
 BogepFCvfazme4+NgvvgwSc/v2NRGJqcFQ1GG+SQceALeAsWZzufWqPUg0azd9m4Y0v5
 eSDA==
X-Gm-Message-State: AOJu0YzJs916QZB5qmgNp5TBxXu076tm6OI0m765+nKpDh4l+ImphqV/
 /LvFXb8n5U5GHGNb8NejRaBo+mu40gPQI1H0rX699hxovCsAVWC5Og/CzGz0/AFtoxg3T71FQP5
 n
X-Google-Smtp-Source: AGHT+IH6ZSAITdTGttxI8HjAidoq2cPW28dkgxxA5rLpHAEeM4CFY3Lj2uq1wH4jAn/2mamOzDIiuw==
X-Received: by 2002:ac2:41d9:0:b0:519:231:e4c0 with SMTP id
 d25-20020ac241d9000000b005190231e4c0mr1680815lfi.43.1713451166872; 
 Thu, 18 Apr 2024 07:39:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 j11-20020ac2550b000000b005195b745303sm265586lfk.116.2024.04.18.07.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:39:26 -0700 (PDT)
Date: Thu, 18 Apr 2024 17:39:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: Fix plane SIZE_HINTS property docs
Message-ID: <t62wd52nu3xogigldvzpg6cidq3b43xcchkxnhigclaborzotj@qp5cllnmqlpv>
References: <20240418114218.9162-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418114218.9162-1-ville.syrjala@linux.intel.com>
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

On Thu, Apr 18, 2024 at 02:42:18PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Fix the typos in the plane SIZE_HINTS kernel docs.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 9677547d8362 ("drm: Introduce plane SIZE_HINTS property")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_plane.c   | 2 +-
>  include/drm/drm_mode_config.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
