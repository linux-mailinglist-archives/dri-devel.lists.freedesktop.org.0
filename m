Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C02976B51
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943F610EB9A;
	Thu, 12 Sep 2024 13:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GIfFZZMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521FA10EB9A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:57:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53660856a21so921877e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726149442; x=1726754242; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxodDRt3a+SyobH5GyQ0Lcp+FOevXLEoWI9ixPWDPRY=;
 b=GIfFZZMNb/Se94EZU8Lk8UuoJB66gwHafV6AX3onj+tV7bSMNeMWWnDKa4HfEYZa9e
 bHafy41/s6CI9HbsoodIGkQp9ukkhrD2f4naXmO6C8DiINi1KEoVCztBnRXNaNMH8WIZ
 WpRhdFCYBF594DxGrJXFmD1iSru3w12hyOoTfwlVTiFSpnPLQI5A97JnBBzl2DHZQll9
 KpKTAIkilpOLintUre7DWybmh6MIZ8zC4xFoU6BGCIxqylhvz9S1IKVX9H+BkIKjgpMK
 1xbH63qkvIQwdATFRGN4+QRKHQ7jAPLpHfJFe/W0+nnCis5OzSbhPW/nisVa7m2FJQYK
 zKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726149442; x=1726754242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxodDRt3a+SyobH5GyQ0Lcp+FOevXLEoWI9ixPWDPRY=;
 b=Oc/ryGVmnSHhwtvOYuhKJtKhBzRqhS+gDaanUv51CXAaMbeJpIYsOaIGZjSbaud9Dp
 G9fH4Ug4gASNFbnBASirsfxWA4AuzXq5ngPeRcyeaqhidkXTTdr2G4j93anbHpVNk/Ir
 dK2FIWoOKI1NVM9UhE8d36uFqYVmsHfBcetXbikEApAU5QhNpB1Puj1Cih92nNkSB10a
 cDMYLr4pdV/xEz3hOukG5IoXIJ92h2ZkpFFcEfHDJh9hP57xD+is5T3i9tKB5rRKTyeF
 xaI3mqezhbNr54zuGjTDpEqISerslIzkVfdfhm2RAyQuSuWyaPdMMiBEOFheGHfl1vpo
 8X/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5N6FIQwp615CTYjZgrF6//6yRoN+POO9Fxr2ixrqlI5SNP3CbKtY+vScv3IzyDTRob4We1MBf5Ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxujRAnQ6yo0yOWDlVIQKg+hfLfvNV/MmTPbWY8kIUpbCTCarc8
 A2qTGFdDtJCjykqSTbbJoDWBeKnpNuAYgBWNebfJbCO5fWDrjFOTVNVRm3p4RhQ=
X-Google-Smtp-Source: AGHT+IG4YoAbMmcA+J1Hax+CKsVf5G0FGoirjqzHgyGFRWLbGqZEPnd5b0NwRpdmxwNgp7uwofuZ8Q==
X-Received: by 2002:a05:6512:e92:b0:535:682a:b6c0 with SMTP id
 2adb3069b0e04-53678ff5307mr1368799e87.61.1726149441977; 
 Thu, 12 Sep 2024 06:57:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f86fb8fsm1938352e87.66.2024.09.12.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:57:21 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:57:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/doc: Update drm_bridge_connector path
Message-ID: <6okkm2beziulck4unx7ibvkeuk6r4g2s35x6yrmcozjais6rzw@ltm3rawzqqyz>
References: <20240912084540.1213343-1-mripard@kernel.org>
 <rq77jt6wfq2s6i5mk4x4v7hfvpz7cgl5uqnwrq7odyz5k6rbxo@riierkdmvhp5>
 <20240912-smoky-fast-mole-c6eebf@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-smoky-fast-mole-c6eebf@houat>
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

On Thu, Sep 12, 2024 at 11:59:57AM GMT, Maxime Ripard wrote:
> On Thu, Sep 12, 2024 at 12:46:50PM GMT, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 10:45:40AM GMT, Maxime Ripard wrote:
> > > Commit 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER
> > > module") recently moved the drm_bridge_connector file, but didn't update
> > > the doc resulting in a doc build warning. Update it for the new location.
> > > 
> > > Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> > > Closes: https://lore.kernel.org/dri-devel/20240904163018.214efaa7@canb.auug.org.au/
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  Documentation/gpu/drm-kms-helpers.rst | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > https://lore.kernel.org/dri-devel/20240911-drm-fix-dbc-docs-v1-1-ae5cb82fce1e@linaro.org/
> 
> Sigh... sorry, I missed that one. Can you apply your patch?

No worries, it means that my subj wasn't obvious. Pushed out.

-- 
With best wishes
Dmitry
