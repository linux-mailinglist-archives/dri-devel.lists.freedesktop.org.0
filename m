Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241EA85BDF8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C010E1AF;
	Tue, 20 Feb 2024 14:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E71w6Ofz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACD10E1AF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:00:52 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d10ad265d5so58092021fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708437651; x=1709042451; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yIavGtyBVHQhwYxocbKlHQfDHDHgZOv5J9ExqtIQ0og=;
 b=E71w6OfzFNaAlQJZAhtAO50a0akWLnt/cHVvUwISf7SjGWvkvssHL23uV2kii7mK3V
 hRwhyeasw8f54ZKbJS7wgAWnCOPCTLv1LUUS1sEMrvMGX5skXrZhvYe9fFly2a0oNl7f
 KODkj0hhB6CPiTwLrlwoI2RFj7uLSzVRQ3WyRSXMQTzABcqrMfhZGUWDWfO/QBuV9TlD
 sqC7N053r6Z06OwiShIHQ3mQmke3s0BIqQS4UnACX4gcFAADaMuQePdO8F/7MAPCti1S
 be8aRCSk4UzQgRkoYN0R2N+0VL5jB7BoosWc9fq7a9w3Iosq59DV/lnFSCh4YkdN0cep
 3YiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708437651; x=1709042451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIavGtyBVHQhwYxocbKlHQfDHDHgZOv5J9ExqtIQ0og=;
 b=Xsjk2RfNjudyzQHjc4FIUOwUcw3/beo2l1uVpL8i7B5BoEu8+GBxsqDWGGasNQgjxe
 4mHALBHxNliGrRNMVoscOAk62ncdr44Wsf+GWg/fte+lZW3kuoBJQ9PYIf7qyqcAUC5+
 KjO2hBMNcEuI4i1QRNQgdgWt88wAILjnal9LvicvcdgPfkzQ8Iux+kGuYo5gwcftPzqC
 SPzB9Cg+WbXdaPQt4ZwmnX4YtGG5ziD5xXyfG+mxnRLNTgsiK6AKLpeOHf8yNcEpXycw
 yrDqnK+5BIZqmNyrssiGJ1ELbdeuooVd9eCVyP6LddVORZsvRIxl4r2S7wvbbfC2BOCm
 vmRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0IPrIsjfXjvjwb61Q9sA8jbZrN4RRxl51kmZBRAB09Za8w2/2capG8yQjguWdOEVEj5CrWF7tA60mapiJb+QfOjg5axY4oyTWq+ieTu6z
X-Gm-Message-State: AOJu0YzJ9uY56gz2jJE+OAwXqygt2fMEW2u2hCG5DhO5WuoI/XgArwGr
 YkI0foXugPwF8S25Lv3mbzkBL+bGUj+89Zd+liUXBb6E8q7JEI1+ciEg/shjeZQ=
X-Google-Smtp-Source: AGHT+IFnMr7pgPZVpX97ZGZLJplTKGBJmAizHUWbgJVoD43o8CV/7GPFehR+pR53bgpnnhwAyZG3rQ==
X-Received: by 2002:a2e:b0fa:0:b0:2d2:3028:2bcc with SMTP id
 h26-20020a2eb0fa000000b002d230282bccmr5159754ljl.47.1708437650764; 
 Tue, 20 Feb 2024 06:00:50 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b004105528c61fsm15006473wms.35.2024.02.20.06.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:00:50 -0800 (PST)
Date: Tue, 20 Feb 2024 14:00:47 +0000
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
Subject: Re: [PATCH 1/4] backlight: lm3630a: Initialize backlight_properties
 on init
Message-ID: <20240220140047.GD6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-lm3630a-fixups-v1-1-9ca62f7e4a33@z3ntu.xyz>
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

On Tue, Feb 20, 2024 at 12:11:19AM +0100, Luca Weiss wrote:
> The backlight_properties struct should be initialized to zero before
> using, otherwise there will be some random values in the struct.
>
> Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
