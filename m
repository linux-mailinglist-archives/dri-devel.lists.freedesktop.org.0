Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1B8B058E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 11:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6A510ED7D;
	Wed, 24 Apr 2024 09:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U+8gRgfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F18410ED7D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 09:12:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51bab51e963so1937104e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713949954; x=1714554754; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RrfmU0/3on4qHkOzvcKXO2sa516NNjuhFePsPArraFw=;
 b=U+8gRgfHtPwRUJoZr05I3okUB6rghT++hMLiecDqnfMPCyw5I2dHspNUoIwdAHJSP6
 TzPkUzQZlUPSQaI0S23PEt5NA04uPRB3QEMokukZM+H6Qs3pKgG6PYGewz6aI7BS+830
 EAhv+F3GqX/H30VoxF9/xtXSROe6cH95BJw3JfZ7sAoWjqPh+iJ/DJhyE85sLLL5hPg6
 mreUOF3IpN3/SXAe1uf7xS+oizj0znTZMJnkdIwBlLYShzu/j2wOwQo+asOUc85TTkx3
 mpZk7cgWHU/PbScwscqOfZHZEmHzuHK8GPwa+C3MuOL/k4IJY7CkSpHb+EzjDWRWwthf
 wyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713949954; x=1714554754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrfmU0/3on4qHkOzvcKXO2sa516NNjuhFePsPArraFw=;
 b=r1hy12rF+YIknBabbRN/ABCtbfgDzzuqDKRtgpVuF+AXXsFbn/m5xY7gIZGUYzQBmv
 j2axjrYpmddrnMSPQK/D6jKQGZiJnuo/36yXGCoPeb6wBjRqi9vG9y37gNZoSatgwsVo
 2TfrDzrGIH2PRB2TdzoPxY4CYASxZBhHN76xtAs9/nENuYwGOa+VOysbXs7VDqn7wrMY
 ryBVOykU+sev6ZJPOneGN7fXM4i0FELIczC9QyYXwUDN5r9HAPZXyS/NhN6emD+jRtTk
 CE65K/waVij7coXU641wDA7hjFWtncjjWKM2sHMzgQS0NJKaQV6L+AKx4UXXAGXhA3ns
 9q0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5USzl6sS1YukUcDzqoJrlU7QprxA4UIxgdDNmQUZdVNCLOD4vIHoud9Fp25UNcJsa2/qOt2YzB0DrtVCj1JRVyMtU5rbNGdlPwXGObbhU
X-Gm-Message-State: AOJu0YxbtQ/1Y5fZ3SEGzx3i0VXh/zoH5G1qnyupHjoQPjNe27+WJkxA
 6iTW0z+SinlZuw1YwVMrKjrYnpmyPWL8uz+vgoQMyRwWfW84oAZg4W0J/VvN27Y=
X-Google-Smtp-Source: AGHT+IFq9MwQWs6wIXZlmD/rppELkT80yR7wTKRpkz/G+3+KsK01cWL4l5tBm2fA+XqurmzkT8QgXA==
X-Received: by 2002:a05:6512:3ca2:b0:515:bba3:745b with SMTP id
 h34-20020a0565123ca200b00515bba3745bmr2008856lfv.33.1713949953939; 
 Wed, 24 Apr 2024 02:12:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05651206c800b0051b458ac8ffsm848541lff.93.2024.04.24.02.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 02:12:33 -0700 (PDT)
Date: Wed, 24 Apr 2024 12:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: chipone-icn6211: drop driver owner
 assignment
Message-ID: <ul5vzz54kppxo6zkr7k6seejmmlgp3d4dqfzjlj5la3e5ltolo@ug5dtoknkibu>
References: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
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

On Sat, Mar 30, 2024 at 09:27:40PM +0100, Krzysztof Kozlowski wrote:
> Core in mipi_dsi_driver_register() already sets the .owner, so driver
> does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
