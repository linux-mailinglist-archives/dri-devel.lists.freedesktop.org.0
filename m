Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2F9141DA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 07:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0ED10E343;
	Mon, 24 Jun 2024 05:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nI1mLmtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ECB10E343
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 05:18:44 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so13546341fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 22:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719206322; x=1719811122; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IuyadEulFu3FDpPhLLNT9X9XFnfp6SMEqQX7h8wDmlY=;
 b=nI1mLmtU5O2gTZrWvPooBQASmtXHbVoB6XqoBezukaISegY5SfvC9AwWBV7A0I/HVK
 kfY6MSkLosw6s0a8H2IjVuUzG4sJ2XfNUG0FrHbKXhjWuPPEwEcP7n4ppGlm3zsUqCER
 dexB1Ww0W8dhM51Bfqj+9mS1jbhm6insGx0e8xu5FBkpg/A11r00XXcubfsXF714Xiet
 fq1VBCgyDYYxHNGxzuVhw4HTOCwU3O+RPjAQugR9q2k4BAYEnc3nerlTvdrl41K3bSUD
 W8efve9G1fszrhuFZCTqDC65aoa//SZsR8kTTQGeDXmX3lLq0KY9S5XcGgAHAxgszdKP
 mGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719206322; x=1719811122;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuyadEulFu3FDpPhLLNT9X9XFnfp6SMEqQX7h8wDmlY=;
 b=bHFlA/L375nKZuZdnV01LOl6ivV4tPWLpX4V4s++JjcgRuhVh3i/xrgvIRBTLj7mzK
 AbNC1GHUvBYrkF/f8lTcukBDn6MocRLagNSGgqYS22AacXZ+5mbosjMUELiUPVecIyk2
 8Co3N0j5Pr7xpynrpF+jabMMwRj4HxGIJsxr5r48ihXVkF6FvDHSPd6xcfVanwhYSh5t
 2afUreYk/ukqxvq1k4TBUXWYh/0mJTvTAznkxnMBVtMfDiR1XTHNcpu9dbJfmtERnXxf
 GRus/QPj97cfKpGPp3xKy7drZv8hEb75ixemt6SKgjuUhQA5Q6dxkI3m5NJVLJzr6VrI
 tkTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1r6bew6gaECXY/LpLSSWAQUJuZfUz1OYFXO6mfp+d995MryQ5q10KNRcR60n7Fnf2AhqeUv+7ieYcgOyYOl3TRhPL2/DEuMCZrVA6vExu
X-Gm-Message-State: AOJu0YwH65vjhMw2QwUpBX+ZNN2aeGdSGTWOfuV9UxANRs8QsYzzGO9b
 Y+YaGU0RQ9z8FLdAOo1rmoyjSDkrqCHAU43DigER2sPq7xBbt88E2CWIzfj/zag=
X-Google-Smtp-Source: AGHT+IFayfixZjNle/0sDVRFWDTPCafxBUrwkkSut5g+TSdNaooCLZ1a3RRLfxCfWY7qdQrrOhDqyw==
X-Received: by 2002:a2e:9dd8:0:b0:2ec:4fc3:a8c8 with SMTP id
 38308e7fff4ca-2ec59312e0fmr26152271fa.0.1719206322244; 
 Sun, 23 Jun 2024 22:18:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5ed4f89bsm3258471fa.32.2024.06.23.22.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 22:18:41 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:18:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht,
 Frieder Hannenheim <frieder.hannenheim@proton.me>
Subject: Re: [PATCH 0/7] qcom: initial support for the OnePlus 8T
Message-ID: <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
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

On Mon, Jun 24, 2024 at 03:30:24AM GMT, Caleb Connolly wrote:
> Add bindings for the SM8250 OnePlus devices, a common devicetree,
> touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).
> 
> The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
> featuring the Qualcomm X55 5G PCIe modem.
> 
> This series introduces initial support for the 8T, adding drivers for
> the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.
> 
> The panel driver suffers from similar limitations to the LG SW43408
> panel found on the Pixel 3, namely that after toggling the reset GPIO it
> is not possible to get the panel into a working state.

Just to point it out: this is no longer true for SW43408. The panel
wakes up and works after toggling the reset. It seems, there is an issue
with one of the regulators, but not with the reset and/or panel startup.

> Given the apparent prevelance of this issue, particularly with DSC
> panels, I believe this is a bug in the core DSI code, and not a device
> or panel specific issue. I think it is still useful to accept these
> panel drivers into upstream since, from a users perspective, the panel
> is fully functional just by leaving the reset GPIO alone and keeping the
> regulator on. The only (theoretical) downside is worse battery life,
> which is a small price to pay for a working display.
> 

-- 
With best wishes
Dmitry
