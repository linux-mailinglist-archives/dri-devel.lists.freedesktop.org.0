Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E429314FB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982E910E39F;
	Mon, 15 Jul 2024 12:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DM1KG2DP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E13810E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:55:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4267300145eso32921875e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721048105; x=1721652905; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xD+Qv3tXsMOBLCom0uRSOSXVlQMZrezJqRHpcu3ciB4=;
 b=DM1KG2DP5cKCuoZcDtNvtCWX/g1ZwheO7OhgCWa+CRjs3XMpRSfdT/yHLH5cNkvm8c
 KajYxwcnHIcQMqUkwkXtoSL5QBAw9UDzH+MwIhR10klbjP+ZFEXryaHpGrw64jW7OoFr
 SQMM6sCQfefXGm+LiYeOb5ijwsP6mLLWXUaWhkjG2cs8APnZZfpz5/NO0txMfqTj5YwM
 oEx36Cb5uJD/kxZIeRUgbtO10UnFS02DMJgkw9K8BYt5bAiNg6DWJRTJ/3qmm7JzGmJT
 IX26VrNho9teH2wCNxMM10rMPIZg6NKzvGs76hKHyt+KEqfcCg2CC7ISOcIvQXoRCNvo
 og+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721048105; x=1721652905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xD+Qv3tXsMOBLCom0uRSOSXVlQMZrezJqRHpcu3ciB4=;
 b=Krt99g1YiSw0XzHGupybvJT8BCgBaHtkXTPlCVV9ESEkJrvCgreYwire+x2dssZFOb
 9QU7OGwvebaAaesM5Pl2154k49EMlzEXVjQ9viCL3T/7E1DREGEmPn3VDz3b3cHDuYxc
 R5Tul0v2C84MfOEJCzVypKeOdPErVEAkDOip/OYy1RIw3nUMj5nsyiNUspHlDPAh9IDn
 +BYTg1CTl2mKqrDQd0CMm/kDf+JHnbMSLo5gTus6t9XshpyZKwbn2jPLbwsUuDcGkpcj
 waqZ0jAj19NWFwTrTHO+5tA1XFietKQ+EHWudjQsdzP2hTiS0boJ9b34h4NL7SaB/ugE
 zm1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEogxIevK1BaBEODjk1LHEY/jTpnvmDmAop4N1RaF9K8lJoHSN75FwafOBlptBbUKxtfgi17Ghj2Qw9Nu5J+ezccXxYRm5bcfAzAbG0cVP
X-Gm-Message-State: AOJu0YxX/GqD50SFBroRdqVnHdivw/KgS/yjF70eSQcD72ocfbDzL1f9
 X7hieUL+lNUZksoJnyjqntM4M04k33pA5xbbTEguLPuTEqrjrCFZ8+cytmkTgbg=
X-Google-Smtp-Source: AGHT+IFVvTPewQl9xsuC6PQHCLCw7VPZ3EYcEq7OprdCTajdkMctnkeRvosj+jwyjRqqLqq4veQmFg==
X-Received: by 2002:a5d:6981:0:b0:367:9903:a91 with SMTP id
 ffacd0b85a97d-367cea45c68mr15872686f8f.11.1721048105426; 
 Mon, 15 Jul 2024 05:55:05 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:82fb:4328:f644:289a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm121761985e9.14.2024.07.15.05.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 05:55:05 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:54:59 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
Message-ID: <ZpUcI3KkIa58zC55@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
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

On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> On 15/07/2024 14:15, Stephan Gerhold wrote:
> > This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> > 
> > The panel should be handled through the samsung-atna33xc20 driver for
> > correct power up timings. Otherwise the backlight does not work correctly.
> > 
> > We have existing users of this panel through the generic "edp-panel"
> > compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> > partially in that configuration: It works after boot but once the screen
> > gets disabled it does not turn on again until after reboot. It behaves the
> > same way with the default "conservative" timings, so we might as well drop
> > the configuration from the panel-edp driver. That way, users with old DTBs
> > will get a warning and can move to the new driver.
> > 
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >   drivers/gpu/drm/panel/panel-edp.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 3a574a9b46e7..d2d682385e89 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
> >   	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
> >   	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
> > -	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
> > -
> >   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
> >   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
> >   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
> > 
> 
> How will we handle current/old crd DT with new kernels ?
> 

I think this is answered in the commit message:

> > We have existing users of this panel through the generic "edp-panel"
> > compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> > partially in that configuration: It works after boot but once the screen
> > gets disabled it does not turn on again until after reboot. It behaves the
> > same way with the default "conservative" timings, so we might as well drop
> > the configuration from the panel-edp driver. That way, users with old DTBs
> > will get a warning and can move to the new driver.

Basically with the entry removed, the panel-edp driver will fallback to
default "conservative" timings when using old DTBs. There will be a
warning in dmesg, but otherwise the panel will somewhat work just as
before. I think this is a good way to remind users to upgrade.

> Same question for patch 3, thie serie introduces a bindings that won't be valid
> if we backport patch 3. I don't think patch should be backported, and this patch
> should be dropped.

There would be a dtbs_check warning, yeah. Functionally, it would work
just fine. Is that reason enough to keep display partially broken for
6.11? We could also apply the minor binding change for 6.11 if needed.

I'm also fine if this just goes into 6.12 though.

Thanks,
Stephan
