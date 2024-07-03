Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93776926005
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 14:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0D610E0B4;
	Wed,  3 Jul 2024 12:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hQ6w/6W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC9110E04C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 12:18:22 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so60367641fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720009100; x=1720613900; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LgHJFby2LzdImu320rlJPfWBMWru8nRY6MLO4xb1hd4=;
 b=hQ6w/6W1zFJOwn6SzXAMgebvdtEuEycaYZIgmZNAL62XQCFaigyZ5a5p5IjsySzIgP
 G4PCJjJaPCKnGNF6VZEO7s8DHjc1rfIa6QPDVpX4iNnkEB2l+g/ngZ4byitbdORS+Pf1
 OVuBqlm++csk9UakTWqqm/jhPllV3lZyxvEQiP//5nA55RJvcVJVsgYxE6NdY0Q4Yvke
 bzC62L+ZkswqitriKVKrYojmpWRsKTI/3DZo6Ambf8I1kLAUSiANcriGKfe2kd6ONRpQ
 7O1v7q8ZWGEdDQ9xTDLoS8FZCsBkyuY2F22BqId+6ihvczjKJrhrm7YlbdwyNw+mTMOq
 bfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720009100; x=1720613900;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgHJFby2LzdImu320rlJPfWBMWru8nRY6MLO4xb1hd4=;
 b=jOh3viz6Jr891crgj0rNQMnxKMW5t0aeepRL73CS6VQM/J3u+P+sJxjfRZJy7azmR5
 eddBCbrTOGp5PVI9hS0mt1COQUlOjNiNG/DRgFmNHsXp8rm8ovx9RvXI7PQcg0JDIIrS
 /BjAKlggQ/f3Q9a32wY7bUMNFP6bELc/DPtaunh7iS2432zQmS+RbAYRzg8sDO0rynTq
 tzUpfPUbll3yTc3RZmcovdZSyp56+oANldcnq6eGiOmxESBpAa3u8OIvwboF+N37G2UQ
 q058+izqIQg6EUhQ7SL7AQbeclFvB2IIJwgQMlov26bF9CKTogcmWgEbir6pB3JrydWg
 0BlA==
X-Gm-Message-State: AOJu0Yz3sUDUZLicpSA0bgHFXXHhx6k0c83i/YsRPqyrDOirH0RLZtiN
 iLF9PTq0EuobQBwYYAZWcHE8tSXJdsXU4Guz/3m+cKdB5DeVb0F/WOluAXHnUvE=
X-Google-Smtp-Source: AGHT+IEjGsBMxoRHAZ7YHSdxE7y8cRZSXf71F35XhVDwQL07Fl5bM8ZK6wuOJtrpoZrLIbXNIZBuEw==
X-Received: by 2002:a2e:bc0e:0:b0:2ec:5061:d7d2 with SMTP id
 38308e7fff4ca-2ee5e358f94mr80680961fa.18.1720009100335; 
 Wed, 03 Jul 2024 05:18:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee8842b920sm764861fa.39.2024.07.03.05.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 05:18:20 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 2/3] drm: panel: nv3052c: Correct WL-355608-A8 panel
 compatible
Message-ID: <d6bruxuhguyzvzqx62sr5pkbt43xui3sywp6q5sqhehdlpkqtz@gt2yov6oxyu5>
References: <20240703103710.31169-1-ryan@testtoast.com>
 <20240703103710.31169-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703103710.31169-3-ryan@testtoast.com>
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

On Wed, Jul 03, 2024 at 10:31:45PM GMT, Ryan Walklin wrote:
> As per the previous dt-binding commit, update the WL-355608-A8 panel
> compatible to reflect the the integrating device vendor.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
