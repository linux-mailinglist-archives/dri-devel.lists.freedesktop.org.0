Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328968993E6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 05:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF61113816;
	Fri,  5 Apr 2024 03:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G6581Obb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BB2113816
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 03:33:41 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516c403cc46so3197883e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712288019; x=1712892819; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=r/7HrXZ8wf4pD+zgrF+LoHfKv7hb9YwVKhd0Ya6KYbM=;
 b=G6581ObbMPI8VZdZbKL17WFxwwFmwu0vVWOIPeMVF5FAr/C1CkLOa3neh7zLFduod7
 8u/E8woOUrD5HxqVL1XG8i2DVNSEq1fQJMzaVYWhkb733R0sff8aXgg5NQp+EjFyUP5R
 ZWwa/MDdM/Ou0yFo9rBhln9fimohx1EFQhiq/+TkY9od6IwI3BTcCwGCKRxalM0OKUVL
 DBXTcGIDaYRhzEZ94/SM6jXDAZmEuGj60RzRyJ+EOMKwALTPPnfeMXOSfKYfBdZWn5Fs
 WvhzyG43fsqG/veDUpsrs2T0T+JDsA+zc0zqZdgWW7FzHOa5TjScaSpJJwY24iNGYy3X
 QCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712288019; x=1712892819;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/7HrXZ8wf4pD+zgrF+LoHfKv7hb9YwVKhd0Ya6KYbM=;
 b=CzLuBIa4Z11OtVdv7Rz+5RLJoPbxqKTg6sPGLmv++b1jV7/LD33gdpoLQX0Z6wT2w3
 sbTz+qys8L+pZllWV2X1A+lqRhY7cHEweqrJNKdHoinSDpzeKRJy/ZPbOFuiXPzEwQJv
 Eqflbbc9mt1uB6HG6QRqbBTRrFKJGN3/VgDU4Vrl7OHWmgcIxbeq3D08PgfabiSy6jWn
 ZBS0q+bT6//IoojBbS5l5lMC0Ruzj0OOCY4WeoeJY8fBBTkAihRnUgm6J7fUf0DxSf6t
 TO0ooxmQrU3qAbCHDzwBDHVz9DVq7B+q82dZuXhLqk4Rwe9fuJRFX4NEt/Rz1+bGIlmY
 j3VA==
X-Gm-Message-State: AOJu0YwnYQDIIAHER2+sIJJ4fX3/AvmTjFCWdBP3IyNzNequGZD7bCX5
 jkIK2z+kWNvtB1XHWJQdxWV462I6o8P72PPjPUP6TomMxy/hu6KeCl840O2RfJwP/QEc/8glR3v
 b
X-Google-Smtp-Source: AGHT+IFd1cA6qKsTiOF3i9CLdEsk1HbP0vRonbj8/oSdGCce3CGjGEOcXnP6HC2A+hCRCMCb9jsqGw==
X-Received: by 2002:a19:381d:0:b0:516:d1cf:d9cf with SMTP id
 f29-20020a19381d000000b00516d1cfd9cfmr154322lfa.58.1712288019347; 
 Thu, 04 Apr 2024 20:33:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a056512371a00b00516d2fe0d55sm74210lfr.241.2024.04.04.20.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 20:33:39 -0700 (PDT)
Date: Fri, 5 Apr 2024 06:33:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 05/12] drm/client: Nuke outdated fastboot comment
Message-ID: <eifcainppysdjb272lx7iap6rjq5su2txal4hmkyljwgzblyb3@czda4qubkgdj>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404203336.10454-6-ville.syrjala@linux.intel.com>
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

On Thu, Apr 04, 2024 at 11:33:29PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Remove the tall tale about fastboot vs. user mode vs.
> adjusted mode. crtc->mode == crtc->state->mode, so none
> of this makes any sense. I suppose it may have been true
> long ago in the past.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
