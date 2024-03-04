Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D440E86FF63
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684C610FF9C;
	Mon,  4 Mar 2024 10:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c4nZ6e4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641BB10FF99
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:47:00 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33e17fc5aceso1891707f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709549218; x=1710154018; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ztqxNc62ilEiiomZuQZyglakJvz8sfZEaKzsNmup5ao=;
 b=c4nZ6e4/KyWr0AHeVpHrgfQSJ5t5+VafYHktQYMISOoinc02gBDP7edKgnbu/SXG/H
 or7llICy2VYjf5uKJs9exrg526Lia3V5jfuaHdFxCmwyEfLWnz//oU3I2fUouT2EfZ8s
 etEG9CgmBqFcyVhs9TJEjQIDAqp7IhlBQXPXWU68994mh4S6rexh/tI2WxldYKQLyYij
 qJRduozNalG/c13BkDB+JbsVizcR3AKNBpX/bNM75O7EO1JsESJyHe2iqDFtjljPYhqv
 THuFeJH+/EAPKiQXzWMKkWE1F4E5OCEG5/wskV6Y1osbt+wxgmb1fqic7NYLfPGTjHxJ
 uYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709549218; x=1710154018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztqxNc62ilEiiomZuQZyglakJvz8sfZEaKzsNmup5ao=;
 b=YrkTlMTGMgJmuskE/VH/+qXR1DefHlyXFfuOrSVVwyYug+5gaRUYDfdzGbY2ZKg9di
 0LlA0SxwO7oeehbyXnJH/cMXb99AzyrtnZniqm+EBLH7PVPhoHf7NtEye88pBOcdu+qh
 YIscoYHyxLG0i6lCX+eZzCVbIgT7ZAwg7kxexDa802T3NGI/3F6tMqA7Hz79l4q3+3A8
 +Nzz5hWMxTx14+r0NyqI4VT9Weh0FChH8Jv6Qt/BjezZJciIOkjeyYqGz3DiKlBpvPX5
 S7d7FVdSYwR76dUD6lpCQiguo6vUXLKYK+kucBwPKkpG5xygm9+8zSBYZJZi7qiLFoFx
 Mcaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVppyYRCDL1EMqcPmhoxio0xT4JHJ7oIfqNRrixUp5jVA560CQE3ss0ikPYs0L8i5e8oaX4MH7zh/hus6+NEdMQWaJ5DG3E+Y1W8yxx+sme
X-Gm-Message-State: AOJu0YzHKppSXSQA30rqgZHh/QWCIBc0sc5/1CF2x0Wr0ndZ8S9sJhqC
 w1fE/H02wO++Bin0OYAluaAnSSCDnk5gMOGZiVASlfU/cOk30j+u0Wk2BFEO4IQ=
X-Google-Smtp-Source: AGHT+IFeyTWKk1LmAT0UNG56sujX19bae73Htg+PyrowHL0edmjBLVd20DjVb8TWcjVE0m0Xy+Q76w==
X-Received: by 2002:a05:6000:1cce:b0:33d:d7c7:4c33 with SMTP id
 bf14-20020a0560001cce00b0033dd7c74c33mr7776162wrb.29.1709549218568; 
 Mon, 04 Mar 2024 02:46:58 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ch14-20020a5d5d0e000000b0033e18421618sm10161297wrb.17.2024.03.04.02.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:46:58 -0800 (PST)
Date: Mon, 4 Mar 2024 10:46:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] backlight: lm3630a_bl: Simplify probe return on gpio
 request error
Message-ID: <20240304104656.GF102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-6-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-6-e5f57d0df6e6@linaro.org>
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

On Mon, Mar 04, 2024 at 11:11:43AM +0100, Krzysztof Kozlowski wrote:
> Code can be simpler: return directly when devm_gpiod_get_optional()
> failed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
