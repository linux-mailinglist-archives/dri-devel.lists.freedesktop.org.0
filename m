Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7C476599
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 23:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BF010F9D6;
	Wed, 15 Dec 2021 22:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C87510F9D6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 22:24:30 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u11so17765990plf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ycDsmx3PyCZ6frecumpmSuFIqgxs7vNgPaQ/w3kiJEc=;
 b=DR7M8QbZ1tBnbdUmI6yi7VcT3mNXhvl8LO66qDfb0Jt1VZvST/nR9enfI7qM6YkPCX
 P3dWIwzZSQDuMU45iFz4vsXeSnxV6xjhP2MFIt9SQicS5/xLLAcA4JU2j2YqeUltjs5/
 HNEy0BuooiU7ZULR4tJ3QXZ6tRwyInfC3DA+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ycDsmx3PyCZ6frecumpmSuFIqgxs7vNgPaQ/w3kiJEc=;
 b=G0v3LNpW+8yOGMuZhJpKGFtG89XXTRO8LuIcUrEx8/NfZjarRfkUMk1DmpbSfJyUCv
 tkkhuIQS8I26K1pdl70TKvf9l774sAzcl1VBV3On+OD9w/QKhmAUw61Ka427y9DlseJ3
 roc1pz15J5U19OFzvPsSguuiWp2rlOdTsxb7C5eU8294Vv29WkO8GlMHwcfDdcU6Wl3+
 glB0jyxYOK2xeL2v+UVOvMNVj5DOPYJ3BtLEYCBeaLLkxiRPRZKx4xx+AYBhVl48e3uA
 yGTICxz+AAw0eKdIc5NcK5sn9XYiYXn66QisFAlSX+6JaUgptzNbwmmLs3gRij+eOiLS
 UR0A==
X-Gm-Message-State: AOAM530+VDiJneaeLnMMRtbAeU1BcJdCIZjJBGm9x3wlLDVXRzN6Nu9n
 isDBu8psle0ElHpnZy0Y8d5TJg==
X-Google-Smtp-Source: ABdhPJyPaKZPEyh99xkYURqN/PIzlVuqSRGBt2Np9ALE4Ou+FS1gPA5SR9cPXBOtOgKmZVaNLESR0w==
X-Received: by 2002:a17:903:41ca:b0:142:1dff:1cb7 with SMTP id
 u10-20020a17090341ca00b001421dff1cb7mr12924238ple.37.1639607069738; 
 Wed, 15 Dec 2021 14:24:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o4sm6289739pjq.23.2021.12.15.14.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:24:29 -0800 (PST)
Date: Wed, 15 Dec 2021 14:24:28 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] drm/dp: Fix off-by-one in register cache size
Message-ID: <202112151424.A44D2B7A@keescook>
References: <20211203084333.3105038-1-keescook@chromium.org>
 <20211214001849.GA62559@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214001849.GA62559@embeddedor>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 06:18:49PM -0600, Gustavo A. R. Silva wrote:
> On Fri, Dec 03, 2021 at 12:43:33AM -0800, Kees Cook wrote:
> > The pcon_dsc_dpcd array holds 13 registers (0x92 through 0x9E). Fix the
> > math to calculate the max size. Found from a -Warray-bounds build:
> > 
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
> > drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is outside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=array-bounds]
> >  3130 |         buf = pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_ENCODER];
> >       |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_dsc_dpcd'
> >  3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE])
> >       |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Fixes: e2e16da398d9 ("drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon")
> 
> This should be tagged for -stable:
> 
> Cc: stable@vger.kernel.org

Ah yes, thank you! :)

-- 
Kees Cook
