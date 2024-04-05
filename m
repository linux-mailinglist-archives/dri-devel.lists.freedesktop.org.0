Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDEF8993DF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 05:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051E1124C7;
	Fri,  5 Apr 2024 03:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W6vpk3e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378CD1124C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 03:28:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d68c6a4630so20121861fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 20:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712287733; x=1712892533; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SWruzgAwzGHwZyzf69pJQ30RyBSIKVFWwUeV1X/UA+o=;
 b=W6vpk3e1R/3B4dMoVkqu1vUrB9/LS9vNY4c1hNoIG38l9pIGpR3K0oOTPh7ilQo6IL
 N6taKEQHjp3h8NlmTzoqCYpcXbOWTUr73o+R/j1dWeMPCPHxcqWih77B7XmkdI3bvKkz
 23hC8K9etBTmy1Ncix7Dd9zj16dFaQ7rf6rp0XHef/D4/uCppjBg6EzEX0PyRGFca3iU
 nwa3sZs9DVHFkNT1dvAILLEA+8QYV2yrvO/a9CheppRX2Z3RYrNTvqg2VaosrwEUIvMI
 e9JeyQFxCgsReDIPsD+Lcp1wNi1W3LFByoAvkLPqoR79UqSPT6HevzlyfF/xkS48+Hxl
 jlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712287733; x=1712892533;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SWruzgAwzGHwZyzf69pJQ30RyBSIKVFWwUeV1X/UA+o=;
 b=n/4VaOcsbhHXbHL9Zf8Sz7QnsvzPRAnaAvGEMQo88wXCFWQy5RF63pYSdPqPqjUiSA
 3oa3rhF63OFYtz45NiucMl2FFpvMMthbD0vOtbLVzmIIgTVpjIm2St1VJPJ0KQVjzPC9
 Wbr/8G7iFp88tLhYKYSGqh7j2IqwEgM9Q0s063dThTuzmKpa8tMFKbGYsLNnJ6/RFDmI
 xj3mjwB9GDJpJVfNpFOD0q6x2CvXqB8UKKRHGRnu30ua4wZ+fCod+NkduBezdD8q6wuZ
 u7zv1e1EUDLDkBWyUpI02SSembpcf6Q9pmWKuBj6uhfPCglIUfMw1w/T6sONM29tbxTt
 OD4Q==
X-Gm-Message-State: AOJu0YwBt1wCDSd+8IvD+l2sFUrj6fsNY3dqiVRNXDB9FpCmCjaCddbm
 MWii5BBxxu7jeAqoEIQQkJ/EGixVuwVCM2XYfGTywfN/6uYq4Jqbv4+YA3zYNkpxi4dMOY0hDxi
 F
X-Google-Smtp-Source: AGHT+IH4c5iALdjq//1h57nzWtlJWr2lSaPBK7tAH7LWcCILCZruNZ5HWEvE1EPbNF4YNQIfLA0OtA==
X-Received: by 2002:ac2:5f81:0:b0:516:d18b:eaed with SMTP id
 r1-20020ac25f81000000b00516d18beaedmr206875lfe.30.1712287733213; 
 Thu, 04 Apr 2024 20:28:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 d19-20020ac25453000000b00516c580b640sm75424lfn.13.2024.04.04.20.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 20:28:52 -0700 (PDT)
Date: Fri, 5 Apr 2024 06:28:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 03/12] drm/client: Use drm_mode_destroy()
Message-ID: <g5dnshb4q64ualfj4sgv5il2btrpnshanssvefnr4vdns72num@rqlg3ime3rda>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404203336.10454-4-ville.syrjala@linux.intel.com>
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

On Thu, Apr 04, 2024 at 11:33:27PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Prefer drm_mode_destroy() over bare kfree(), for consistency
> and setting a good example.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
