Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B2849659
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 10:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394B3112475;
	Mon,  5 Feb 2024 09:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JHBlZLAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B7112475
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 09:23:26 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a372a3773a5so222648666b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707125004; x=1707729804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=plBen78tfSSHk5XJw12rcPtrRcV/xDD72cRCl9pRHrY=;
 b=JHBlZLApX2tB9hSVKc/TrNZHfnQQSsfQ7NnCJfMfUmnzC1ofP/82E5hAPOPpP+jZK+
 PN89mKwjAE5N4NS1w7AItR5kBR7eCovGORqR3DZa5927Mm8hSk50vlRi/Bx5XHn71lQq
 e5MDlY8GdWk84hn5+nm7zaMUJ9HyORrH9V+R/5HSsYpHnQL95ghLXhSqmdhbsijqjSsU
 0t8MAEjnqemx0Efh46ourswfx3DeFNhURWdwL4khuweo3pJEjkjf30vcGBSdbuh28AfG
 CIGOcXrhqviIqvi4D8d6zg100pD/U99vNZ9pp6WoYv0tZl2m3jM3LiqTBhuaQgt/jNii
 TgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707125004; x=1707729804;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plBen78tfSSHk5XJw12rcPtrRcV/xDD72cRCl9pRHrY=;
 b=DUbSzbDJyEuFVna9/63N3QLfBnDWIi0KYAdyBn0QtDiazh/nQynQAGThsp9cLDyZf8
 XFt2iFqnKDjuaS9Y73u9dkXhNBPB/ZtD5/H+ns2mUkf3gsZIcXP9F8pOgSKIBY+9rBhY
 VPMwByqYWss8L9sZsrNrh5EIZx/3CdCYq1ZhZL3guQADS6sm528jTKM+Y4oKk0MySteb
 jzLERi5fVyJlOppZwRpdbZsDorTczcfJlafH7/qJr+AwuHGUbL5ZD23PR4X7+qCiCYCB
 hh/MwF5sPDPXBRusaWZIMvV6gp83BuwJHIswDC3sKlDZkm1uxPjn7cBGYVc2hXe1iSld
 GucQ==
X-Gm-Message-State: AOJu0YzRbbCEHhQ6vRH4+Hsh1Krn4QpXU87NXzVgILtmEsknxeyoxv7l
 8b2zKcT7DtaFPTlATd0DS/KHb3V5+IXzOMGOTwGcegcvGbB/ZqTVLQ4Sbjnb4SY=
X-Google-Smtp-Source: AGHT+IETGO7hpzeBCm89doRh3FvvyFPtjKEFgsgRwP4vmWmpqTfipD/6sS60qeShbDbOc9jI/l974g==
X-Received: by 2002:a17:906:c450:b0:a27:5446:27d9 with SMTP id
 ck16-20020a170906c45000b00a27544627d9mr6300956ejb.5.1707125004444; 
 Mon, 05 Feb 2024 01:23:24 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX2TMuzB4wTLScJqOeUfwQFnxYFrdc+XjbV2Yrj1Ubfagb52+syOwUeFdtuwecePz7lS5sqZTlW9OF1E1VEFwOBS5Gk7uvzEazG6TW//9E5sT4AgEv8iEA5P3N8VcucC6takvFNG0paAvDvMjH6u4Xcr4ft4txjDLf5L4zTCxllFJITVHW4k3+uLSBoAAVUX5xqJSYS6l6Ygs3NEe0tVLpUk+hlvheX6ljItf8rBkm5u5tfC+gjqS6iSuSXJn89YHw5JOHXzS680WBzSxZFaUY/xWELhTiwlmzVKfbJ0NcQpjYhbW9VDDB3f2tn2gs1YGmpHPhOIkqK4DE7lcIjVyvsExxF1vLRlWWUGiOHwW/J5bHpRTg4MAmFmeN4NceKfWkDWUlitZVx3zHeiCFtCho3sIkCcuy2H+y2PpdI2x/RBQrMqVavywq8T70Zn/+HrUwD143oHciSsJrYRymJINZ1y5aEalg1IiQDepAnUNoYvy16EOujrblaP73zcwk7XZbzcxyPopRhAnWhYmnbkZIMEcqhOymqJZND27pvUIBlMjOWIz8pJi+pG/owskb/AL74QzSbslv1tB+ze8AXMXnH+vHADPyGQmLMSgHhg+UDhUqW+B5yB/DjLj/DJpZS/IUc3TycZNjZ+zVy
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 gw14-20020a170906f14e00b00a35200615d7sm4101066ejb.1.2024.02.05.01.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:23:24 -0800 (PST)
Message-ID: <3d0ce98b-bb4a-44b5-a46a-aa0af9a4fcc8@linaro.org>
Date: Mon, 5 Feb 2024 10:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing
 explicit "additionalProperties"
To: Rob Herring <robh@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240202222338.1652333-1-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240202222338.1652333-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 02/02/2024 23:23, Rob Herring wrote:
> In order to check schemas for missing additionalProperties or
> unevaluatedProperties, cases allowing extra properties must be explicit.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

