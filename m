Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355EB889B89
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D300710E75B;
	Mon, 25 Mar 2024 10:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AN5r9fqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770EE10E75B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:55:17 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso49796891fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364115; x=1711968915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFcyCCwkrWUNl/vLlM9putmgMzWSgSa5UA8ajqCwlrY=;
 b=AN5r9fqaCntxq3i0Ewf2bVfpOrkKZOnrQ4e8LDwOGxG4TyRrgyxjP+2sc2G2VzOc8e
 6LEOm4O+g2RrEvu83tiPvqA6vpxEFrXiqT7iETvHQZQOfK33YdF2oKgQd31gmP0GiXtl
 XcuJDTa8kuW8g1IxGHQ3CPQ4nB69fjEupJLtDqsapoLqVD2tndQ9FzwZlsLWVLMZvfEF
 MQJ87y5MkMvckIA3GoNrPQu64lGpuCZi4QwYALr8lw1KViaRgc9yAedgnnPANzHW7vKh
 m/Xy68cCVM8/wZSddUw2hcLj0tPjXQEVaCo+BDZACeELLvoFPDacG+5Mv6NECnVTfGV6
 756g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364115; x=1711968915;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFcyCCwkrWUNl/vLlM9putmgMzWSgSa5UA8ajqCwlrY=;
 b=qMuj/MhvLK/5m8d1Br2jGvvJlPKdEfKrrnjZuh/VfII2vQxwZkc4yEd3LF+S/d20V5
 yH7KvRlx2DV/C7vOR8GCk4mRlGbYJoyNMn6WLBkGk3VZhr+b69KSWcs2zBlsA4slim7f
 Xn3IIn29CWMQ4gUT+bLnIUX5j5oqfYmg7dTBLWWpHJ1/O3nwUuX2Vlug6VqLkJYaOzRU
 q9qJWSjkvWudNc69+q8yL1dcC2E7SqmG0kPoXIpxGt/1AVVXI7guyGyUuTHDDi7eNkvD
 17A05y71Pgon6tiU24ZZJx4w2cnRDxAFAr/m7JgLL83sdG1T82IQniz5nXvoeRY+Yu0o
 WAog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqV4cdd4DPKsbdNybwnnbpnzzDMbhvspktd8dvMAbjcCdN1+UlnPQ2hr3Pa6ySt51l8sadqC+x0JEKTOTJCN/HwwdO4rYw9Ue3BlxLATG0
X-Gm-Message-State: AOJu0YwkI67notkL0ZZL3h0pds5Q5woUIlO2Ed4lx9ciBh2ca0qLmW58
 U6OsA/a0T1t+6E5rkuO43hg7X7v3K4j/cQ4f2rUYVeOSV/OcoU/EVoGo1yKrjpE=
X-Google-Smtp-Source: AGHT+IFmXAWMmAnpJ15iSitf914lYKTJoX1F/f5dD88N/zLkvlKc9jb1ispcL7LFp4W0fApbWNRYMg==
X-Received: by 2002:a2e:7d18:0:b0:2d4:5c0c:77db with SMTP id
 y24-20020a2e7d18000000b002d45c0c77dbmr3743878ljc.3.1711364115205; 
 Mon, 25 Mar 2024 03:55:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b004146750314csm8161410wms.3.2024.03.25.03.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:55:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
References: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH] dt-bindings: display: sony, td4353-jdi: allow
 width-mm and height-mm
Message-Id: <171136411426.2357652.2521397331384143643.b4-ty@linaro.org>
Date: Mon, 25 Mar 2024 11:55:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Mon, 25 Mar 2024 11:32:27 +0100, Krzysztof Kozlowski wrote:
> Allow width and height properties from panel-common.yaml, already used
> on some boards:
> 
>   sdm845-sony-xperia-tama-apollo.dtb: panel@0: 'height-mm', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: sony, td4353-jdi: allow width-mm and height-mm
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c8a0970321aeae4a5e807a5b323be9d48c6b5749

-- 
Neil

