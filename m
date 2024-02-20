Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BE85C033
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F710E4C5;
	Tue, 20 Feb 2024 15:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SV43Q1WG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F07110E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:41:50 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41272d31489so749045e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443708; x=1709048508; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+cFEpv5w2TPD8QTkYd4ABg1XTB4+ZdG1BlQCAicZJSg=;
 b=SV43Q1WG3JqQghrbkA2kVzaDeJyH/Gwdgywor0CrCGNalgOo85wrj594+JGOaIYCW9
 //ymxEPOQwgn7fwpZBM+WFUFioh1gbyZ8lEvOo5IsL+AL6QndHNPIBjgpkwjptJvDAot
 Q6qZJjBPumrJCu8FWrM2o+tAZAUpSILp4fJSOJhjM3lCxLd/3Heref8nanrINJkxioEE
 GMM0xN39IqT4tSMVuqyzpKQyZ+fesYD0vXeluidmApUUaOxB8FpQHARBnphA2W6fXnUH
 hosAXU9hFHlD4uojDJvuEgB1xESWtPF39Euf19uZXrOBXtxM8Xq/fZnF55HKYZM32XkW
 0a6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443708; x=1709048508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cFEpv5w2TPD8QTkYd4ABg1XTB4+ZdG1BlQCAicZJSg=;
 b=XLLa9OfsODxulXvpmDilv4VlUfbEt4DecZop5ho1ogPUOtSU239KrFr9OrqxZAn4wf
 YQP1aRXjMUCey7aRDKymYXY6pk/0B4epI5Xxw2dZS3oT4oAgfKjbIbb4IhSzlPPwWgrv
 wv72BpIimcJCmP/R87RznGwXZaSy4seDHFLh2vmRAESatsZp5QbIhSq5MpHkIjU2OHby
 B3JChEiFZP2eUR0/A3ot+RPQTRupR2um8a/wOR/FZdHRaks483kNuutH7vLWlDEh91Ru
 Tj2tYaRCCwQCN0O3/9Ue9tkOf38b4mKGjIicw7bdkXXxyUnwB53Hg4pwneo1AgdVnn1d
 OzOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbm1Zhf3IRoiJXU/heoZbc5kaVoF6HNClkDvI+todXmpwaFGR7xkLAATs74kCtQC+NZuV55iGU2XNqNyLrL8icPVdGS66yttMVTkfZffXZ
X-Gm-Message-State: AOJu0YyEsfrs7vA+9oyJkbY+JRwpOLSk0JgIQtzVB9oUReN4MXC/9w9/
 +K+tVJ3B8asIt5uvslOhCayOQ4HjIDteA5JDXBo8JsMXWyFc5dAu4AC5uVj8+so=
X-Google-Smtp-Source: AGHT+IFI6EilanMRwVS5/UaPI4MAn95lhdZbLUWfuY0Pbto/1QNDPs2PRzsV8tlz9b+wn0au2Xix+A==
X-Received: by 2002:adf:f2c3:0:b0:33c:deed:6745 with SMTP id
 d3-20020adff2c3000000b0033cdeed6745mr11302397wrp.13.1708443708405; 
 Tue, 20 Feb 2024 07:41:48 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jl22-20020a05600c6a9600b0041069adbd87sm14775650wmb.21.2024.02.20.07.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:41:48 -0800 (PST)
Date: Tue, 20 Feb 2024 15:41:46 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] backlight: lm3630a: Initialize backlight_properties
 on init
Message-ID: <20240220154146.GH6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
 <738dcf0e-57fe-4123-af83-be91d8166420@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <738dcf0e-57fe-4123-af83-be91d8166420@linaro.org>
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

On Tue, Feb 20, 2024 at 03:07:54PM +0100, Konrad Dybcio wrote:
> On 20.02.2024 00:11, Luca Weiss wrote:
> > The backlight_properties struct should be initialized to zero before
> > using, otherwise there will be some random values in the struct.
> >
> > Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> >  drivers/video/backlight/lm3630a_bl.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> > index a3412c936ca2..8e275275b808 100644
> > --- a/drivers/video/backlight/lm3630a_bl.c
> > +++ b/drivers/video/backlight/lm3630a_bl.c
> > @@ -343,6 +343,7 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
> >  	struct backlight_properties props;
> >  	const char *label;
> >
> > +	memset(&props, 0, sizeof(struct backlight_properties));
>
> You can zero-initialize it instead

I don't object to either approach but memset() dominates backlight
implementations currently.


Daniel.
