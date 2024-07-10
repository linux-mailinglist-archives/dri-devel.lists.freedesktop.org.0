Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B38492D8B3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD66910E7E4;
	Wed, 10 Jul 2024 19:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d7KoYBz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A8410E7E4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:03:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-426685732dcso644335e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720638193; x=1721242993; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0zjwLVxsSVCJgFEWP9NFLGfREZ7pPp0SWHJc73R22HA=;
 b=d7KoYBz1xQ9LFryul3pB4fFAqlY02bEFS2mTvN4xISjWuklnocRp7euxj9GxzASP51
 aBJtI7vMKwMPD8/1uJxMqVXTEr0FM777NY0vLDQOF00FvrMu1/llZFMcOr161mAawOB3
 greZzDwo16X37LSF0UQMZ7n3FB7avxOajQX/6+kk/jLczZrYik2IlNNGD0vTg6sOVx4M
 q0w5rvQq0QiEXxN0cDsLEWcPHb1PtchBZVQf3NQNEeG7R9tP5B2HF2rtqtzsEBOIaNwK
 p76mw56kkPH0HkSZDFTf5YZ+bKv7RMsyVPcSrZOTIhxajB1ASr7HEeFtL/KtdNSAoe/a
 oCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638193; x=1721242993;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zjwLVxsSVCJgFEWP9NFLGfREZ7pPp0SWHJc73R22HA=;
 b=Fp3aohJdzmSYqnKfN59ssNka7Y90h64PA9d7qD/XQitIB5A9OHusJhxbLYJRUfrIxn
 ngNmh2xUkIkMlVG9hTeTa7GTN6kynhl1wbw4kP6veui0M6norZAruMd2O676dwOpWtlu
 Lq3mUIN6SjQQIHW9urUC0lzanLZP+CjIuCXIUJwQSD7hWiyRKco2GOYWzvQSbVW03Nea
 Gi9MjRUnvbw4wGdbUDF1jV7h+F5xog30RwNd33v0UqiyAubKVJqvm6ANPL4FHI3ByUvc
 gLKAbHahbqPo4zWfu6TESMQLuWyQmrw9PuV3rBm3Ss05cAQljiYfbqgCc39UzkdVKY5s
 BUFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsO+pmEupt7dflL1jc63MZ+2SfB+R+m1PZhFkf/ed1RUY0PrR0bzE83FS8bHMdL4dWcxmsbPBtWx2dWp2/NZ8eDiL45JQnmnxUbGS3a1tI
X-Gm-Message-State: AOJu0YwdEGA6GEJ3X9vPgCYR+gaeuWG8GAEddCKv7oEWSpgTYO+qbzkt
 dwdi48AcBzWUdk51lEUq8uJtlEGS2+MX0VAr3COB5QcHPcZB0Q9+rkviCUGzyyM=
X-Google-Smtp-Source: AGHT+IExUAfzX0VoKakNYezADDA6Ffrq1A7HPVyOijOdE6adHeuyL79HjX9TXAmqMlMfUj5GJI4TPw==
X-Received: by 2002:a05:600c:68c:b0:426:6960:34b2 with SMTP id
 5b1f17b1804b1-426708f9b36mr39492695e9.33.1720638193372; 
 Wed, 10 Jul 2024 12:03:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:236a:cbae:b7ec:1f7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab182sm5890728f8f.94.2024.07.10.12.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 12:03:12 -0700 (PDT)
Date: Wed, 10 Jul 2024 21:03:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <Zo7a6qso7RZ2pkmb@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
 <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
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

On Wed, Jul 10, 2024 at 10:35:28AM -0700, Doug Anderson wrote:
> On Wed, Jul 10, 2024 at 10:05 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> > control over the DP AUX channel. While it works almost correctly with the
> > generic "edp-panel" compatible, the backlight needs special handling to
> > work correctly. It is similar to the existing ATNA33XC20 panel, just with
> > a larger resolution and size.
> >
> > Add a new "samsung,atna45af01" compatible to describe this panel in the DT.
> >
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml       | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > index 765ca155c83a..d668e8d0d296 100644
> > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > @@ -14,7 +14,11 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: samsung,atna33xc20
> > +    enum:
> > +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> > +      - samsung,atna33xc20
> > +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> > +      - samsung,atna45af01
> 
> Seems OK, but a few thoughts:
> 
> 1. Is it worth renaming this file? Something like
> "samsung,atna-oled-panel.yaml"? I'd be interested in DT maintainer
> folks' opinions here.
> 

I think examples for both approaches exist in the kernel tree, so I am
also interested in the opinion of the DT maintainers here. :-)

> 2. In theory you could make your compatible look like this:
> 
> compatible = "samsung,atna45af01", "samsung,atna33xc20"
> 
> ...which would say "I have a 45af01 but if the OS doesn't have
> anything special to do that it would be fine to use the 33xc20
> driver". That would allow device trees to work without the kernel
> changes and would allow you to land the DT changes in parallel with
> the driver changes and things would keep working.
> 
> ...and, in fact, that would mean you _didn't_ need to add the new
> compatible string to the driver, which is nice.
> 

Yeah, I considered this. I mentioned the reason why I decided against
this in patch 2:

> While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
> compatible, the original submission of the compatible in commit
> 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
> and resolution hardcoded. These would not work for ATNA45AF01.

Basically, it works with the current driver. But if you would run the
kernel at the state of the original submission then it would behave
incorrectly. This is why I considered the resolution and timings to be
part of the "samsung,atna33xc20" "ABI". The new panel would not be
compatible with that.

I don't mind changing it, if there is consensus that we should ignore
this and use the fallback compatible instead.

Thanks,
Stephan
