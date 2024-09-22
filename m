Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AB97E239
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 17:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB9310E214;
	Sun, 22 Sep 2024 15:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SjfRwwv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0510E214
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 15:12:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-536562739baso3332572e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727017953; x=1727622753; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lcPPFY9vbT2Fbs9mgXzsEFeJacgERLOnAlj1vSVNa4Y=;
 b=SjfRwwv+EP3ApE/wwG/Jv3YKYjZ9wk/ZFBQW/omW4ENBvHDutzlQnmwJq2DM2cP47x
 77jshO/yhjkL8F/xyVXqXkI8pZMfp1E+fo8EyZGO2uO+aa6Gyua1IDzsAs5OS298Yv3h
 81GqUBgjT/B9YKkqQOdxK99y0Dn9uBm34Ooav7IPHSUKMMmwoMOKuuzXNDX0pO7WtYAc
 v0Y89vVa94G18kP47Y8k6a6glAgCGKg6E25p6ZAlxFU6tp25k6RNtjbVaiJjfVUi0QP+
 cbGu2fFs7iOi0edFMIvnfSeZZcXM1jKixZxNGKXOYguCOpXeQNGrDMrgkqp5mgTcVrYA
 oEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727017953; x=1727622753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcPPFY9vbT2Fbs9mgXzsEFeJacgERLOnAlj1vSVNa4Y=;
 b=Kg39Tt5ktC6hYm5APuPaxvLvy9NOIoOnHuaDBY60jVlowe3W9YLn+TdH52oMCMzNO2
 2yAlO45F9TypFcZxmw8bZuEBEGw4+Bbeeuf8qAGGF4b2QMlWi6v9dnhG2PM/ZCUZi7MY
 IN31uPV80NHlqxt6SyY9KGyELTrifaodcaUoKfPLpsRi0xLRLhfqbSLdEUsWdaYLe8S8
 /xmfKCpiCha3RG3RiEaRTOzEtAYLYgI+ba16J1cNAUy30Xa1zCm8dxim3/sxZk57VYV4
 +AqcknNEQMT9PXU/RedAT8Z9LNrA9FwUFnlZPCUOgIxClQYaNe/n3hAmbFenkgv88cia
 H5GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjjdm6Q7XIGDu49nzsMEz1N9dNHDW4mFFJLRqX0AV2ns9KTmo7I4vAlGCh3ixJiia8R5TaxelODOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJPh2/urv7hDr6vhz1Uva1ddZ/n9ztqa/6nxdymm9yLXEcLswi
 Qfbqgcm3hoRxqN+smVCH5Dsv0gy/Xa4etQMidEbamJAtFUYVSUdZOEiKnBEh1/A=
X-Google-Smtp-Source: AGHT+IHOfTztltB157PsB3Y01a+WA/S+Pri3qofNCEEh4iDryf+OozPgJjAfobhRXAzuczizsfsFlg==
X-Received: by 2002:a05:6512:3d0c:b0:536:5522:3ca9 with SMTP id
 2adb3069b0e04-536ac2d6524mr4461999e87.10.1727017952865; 
 Sun, 22 Sep 2024 08:12:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870966d4sm2985975e87.145.2024.09.22.08.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 08:12:31 -0700 (PDT)
Date: Sun, 22 Sep 2024 18:12:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm: Add __init annotations
Message-ID: <xqzmwvuzhojoobd3xtzacyyp6cxcggig5anjlcwhgcoagpcck5@dc57xkm4t6zt>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <8f5fe817-dfcf-4cda-9ca2-99648a48534e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f5fe817-dfcf-4cda-9ca2-99648a48534e@gmail.com>
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

On Sun, Sep 08, 2024 at 02:12:32PM GMT, Heiner Kallweit wrote:
> Annotate few more functions being called from drm_core_init() only
> as __init.

Why? Please describe the reason for the changes, not the changes
themselves.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/drm_cache.c     | 2 +-
>  drivers/gpu/drm/drm_connector.c | 2 +-
>  drivers/gpu/drm/drm_sysfs.c     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
