Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C9757346
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 07:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142E10E08D;
	Tue, 18 Jul 2023 05:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9EF10E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 05:40:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso48468425e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 22:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689658802; x=1692250802;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ya/1SVocqBXDn23113d+R4cUZi+/kBBEHle0gpe+T/o=;
 b=yAiQg4/G4RZgC98nQfxJHmKg1a07ypHkoXSBOBhHi1hQ4suNxn7ew76iCJ45pHI1A7
 w/+G2qEoTK7/GFWcwVSCi00Ns6k4G91AkX8NyBz0sElNy5kvRJ3Zy8PGGTBqAFrTNctm
 V0w74PGnD5+NCu5Lx9mviu8j0u18uwOm0EJ6nBenp1W6UODxunP89A9MPnulhHAU34Jq
 aay2smoz0ZSOgSCGP9/56o/qDvj3f/8U3cxzsG1NwQ/loDMc9pQXbT3qIlPPpSk7bJP8
 kYY9L28x3s3tgAWhEaqmedGoiuZKrYgnCJYswjcXnCu6/Iz4n3OWFVUb3E0DVBZWcz6g
 c7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689658802; x=1692250802;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ya/1SVocqBXDn23113d+R4cUZi+/kBBEHle0gpe+T/o=;
 b=h0ZTT2SA33awYWeBXq8UaCygue85L0QDE6dGqkJA3cV+K3dcTr8uT98HumB9QyNu1M
 d35I3Eyrcg1XCxX2RV9F5HvuhumqvMgvw2RUyEJDa3JvjotIDrnchjgP7B7+OX6cSaKh
 SLXNek9xmdmcV0JpLkjlmct9/CUA9c7JUDDo+tlaOi5oUU0kCHT5Ly19RJinM2Z0RLa2
 fZSAp8OLQ6W9ObQmRxZaYqfIC50XkYWgpP5yhx+MjqB622jj+dTChngjeyXNx+IPWHPF
 3x0ot7zxufdFahm5XIWGW4ou2EE8dpwIfM7cQMEywd3e9GlqS91Xjpxa7XafHBb5VeIN
 OeUg==
X-Gm-Message-State: ABy/qLaV6rQNWgvx97LyALaUoTp1YjMmx6NubJ/i0aOJ9DgvL4aIFsTn
 8hgkEijfF8rfKuI/Dxb++4dA4g==
X-Google-Smtp-Source: APBJJlFBbKZc1gO7M8n+dJxiTS+4YHzjapaWo98VW7MNkFMR1mz0AnzM9LtEYi+Sck8117UetH7LZw==
X-Received: by 2002:a05:600c:a388:b0:3f8:f382:8e1f with SMTP id
 hn8-20020a05600ca38800b003f8f3828e1fmr1001451wmb.24.1689658802067; 
 Mon, 17 Jul 2023 22:40:02 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c234300b003fc0062f0f8sm1253235wmq.9.2023.07.17.22.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 22:39:59 -0700 (PDT)
Date: Tue, 18 Jul 2023 08:39:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] drm/i915/tv: avoid possible division by zero
Message-ID: <d763816b-07c9-4346-8f7c-f95e86cba488@kadam.mountain>
References: <20230717062209.124106-1-suhui@nfschina.com>
 <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 kernel-janitors@vger.kernel.org, llvm@lists.linux.dev,
 Su Hui <suhui@nfschina.com>, trix@redhat.com, intel-gfx@lists.freedesktop.org,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, nathan@kernel.org,
 mripard@kernel.org, rodrigo.vivi@intel.com, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 04:52:51PM +0200, Andrzej Hajda wrote:
> 
> 
> On 17.07.2023 08:22, Su Hui wrote:
> > Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
> > line 991, column 22 Division by zero.
> > Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
> > then division by zero will happen.
> > 
> > Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >   drivers/gpu/drm/i915/display/intel_tv.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> > index 36b479b46b60..82b54af51f23 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tv.c
> > +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> > @@ -988,7 +988,8 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
> >   		      const struct tv_mode *tv_mode,
> >   		      int clock)
> >   {
> > -	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
> > +	mode->clock = clock / (tv_mode->oversample != 1 ?
> > +			tv_mode->oversample >> !tv_mode->progressive : 1);
> 
> Seems too smart to me, why not just:
> mode->clock = clock / tv_mode->oversample;
> if (!tv_mode->progressive)
>     mode->clock <<= 1;

This is nice.

regards,
dan carpenter
