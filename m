Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E085C209
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8D010E541;
	Tue, 20 Feb 2024 17:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mFHuyO+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE4010E541
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 17:07:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so2567059e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708448861; x=1709053661; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mShveTDs8o2HzJ7EXJAElPOAOERFmO61toHHqLsbnwI=;
 b=mFHuyO+s9dzDtUZS7rvU0EgHTV2YXmLHEw+dSqcWY5uEsDv9QeCtRbnLuutQ/bcg/e
 suijJoP/f2G9qOyolGyFpa6O+JaMO7ROXzarLOt+g5iYrYHZY7dLr+Q0iwtO0ajgSy4z
 H5D9HCsDbaYh5YtfKhNc4rWs6/By7W/hWe395g0ushBRdKs9HVy1jl02uImdvAtlYglk
 xKsLihi/Mo7m88HCsIOFKFCMmTQfOK1pg/ffIMLkCOidAk8oAsmtYM5MA9vdU2weShyU
 rWEYrOTr/NeJ0tyE8WcX2pRNJGnxCWY5azOls4tKflh7SvTF4pKAg2g1HV2sxJc+i0P8
 6BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708448861; x=1709053661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mShveTDs8o2HzJ7EXJAElPOAOERFmO61toHHqLsbnwI=;
 b=opmkFvbHG90aZymTOHmRD9JV/m9jfQKd/KX/iAd2nL0+pHs1Sxl8JH2TiKrNyYCVgV
 hCZgjJO66izhXjshkCLKFLSwRCZXiMuPSOdav0+TART1W1TNFqdPsdzTOb3lZWSCFpxR
 jTPKDomuyczJaLfd4BPOVm19C5miCdmpNXWoXinqeTn7QgVlFKMBJEXwRDsMX1UlMUef
 3jiOC39Eu/c8HNRKA9V2wKmBXYzkr2I8tlFBNosZVAJ+qggydTT8miVq7nVYc24grf2l
 /zZ9Pr9Kegr5a/+0XiH/oKQVQ/VCWtBkjgXj08dQ1VVLQOcYx54axprHnhT9FG6CNgGb
 w6/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtWCZ8jsz0BIrTdIviFM0wBi/+QP+pesU4HJO+DXGpaQ/q+eiS+nQ6w3DQ4goOL1xou4wg5O0bNQprg/6DZ1AW93JjKWGNIS/S6FK3V+jb
X-Gm-Message-State: AOJu0YyVHYRt/7p44BZjF6m5V0IFxHWcptlAREojFd9M6D+YdN5u7VQJ
 mUPh/Jgrp9UZxwEQO4MW09L2P2norTk4nmJiDWIdLmglST8BlYxGBcOQF5gSSz0=
X-Google-Smtp-Source: AGHT+IGSj4UFEzJ2QdkqJnyaxs4ii6FgzfPObw02jZbt679agm5/qstPtdmgxKLIT0ezZ9Hr8LkbUQ==
X-Received: by 2002:a05:6512:102f:b0:512:96f3:413b with SMTP id
 r15-20020a056512102f00b0051296f3413bmr7991228lfr.26.1708448860804; 
 Tue, 20 Feb 2024 09:07:40 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05600c221400b0040fddaf9ff4sm15131450wml.40.2024.02.20.09.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 09:07:40 -0800 (PST)
Date: Tue, 20 Feb 2024 17:07:38 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
Message-ID: <20240220170738.GI6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-4-9ca62f7e4a33@z3ntu.xyz>
 <20240220141210.GG6716@aspen.lan> <2444202.ElGaqSPkdT@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2444202.ElGaqSPkdT@g550jk>
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

On Tue, Feb 20, 2024 at 05:45:32PM +0100, Luca Weiss wrote:
> On Dienstag, 20. Februar 2024 15:12:10 CET Daniel Thompson wrote:
> > On Tue, Feb 20, 2024 at 12:11:22AM +0100, Luca Weiss wrote:
> > > Connect the panel with the backlight nodes so that the backlight can be
> > > turned off when the display is blanked.
> > >
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> >
> > > ---
> > >  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > > index 4aaae8537a3f..8eaa5b162815 100644
> > > --- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > > +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > > @@ -182,7 +182,7 @@ &blsp2_i2c5 {
> > >  	status = "okay";
> > >  	clock-frequency = <355000>;
> > >
> > > -	led-controller@38 {
> > > +	backlight: led-controller@38 {
> >
> > Again... a minor nit regarding existing problems but this node doesn't
> > follow the generic naming recommendations:
> > https://devicetree-specification.readthedocs.io/en/stable/devicetree-basics.html#generic-names-recommendation
>
> "led-controller" is listed on that page, or do you mean something else?

That's the point ;-). It is supposed to be called backlight@38!


Daniel.
