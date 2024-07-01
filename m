Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04691E920
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 22:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2743110E038;
	Mon,  1 Jul 2024 20:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RE8KNk+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8240210E038
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 20:02:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52db11b1d31so4854676e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 13:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719864176; x=1720468976; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PfEsJfsC2ks7CWPYI27j4I38dK3PJe0vgriu9DWaCNI=;
 b=RE8KNk+EelUswI+ByM9S6LjRQQqIgee2kolfvqEcxKFiXwQgcG4tmZH6FqnI3v+7/G
 hcR3t1/pO4e7PHTxMn5NbKMsx+y6lCmlhvrlaAfg96Uqd9Hccl6q78IOkdVlvGmQ53dF
 F6cUUWhRCQPB8dcdsIse+aVqezQk1VlwVOR7P5bj9GRnrH1rcA0GcWbwPU1jWaAqBnYK
 +0hRP80D9skRVl1TrR6t8Xj5y+C0FzDAwdFh0Ldtv0ZWxRLwZdm9NW/cnz8wSi1DG3RE
 JoSIWXjA4j07a71I9n1pkGAW2shh2o83Vakoci2BURiT9sr5nFvHd7J8k8LZVgFfDUMv
 B4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719864176; x=1720468976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfEsJfsC2ks7CWPYI27j4I38dK3PJe0vgriu9DWaCNI=;
 b=kedcuwz1iFKqui9SEW2lwXNkhayDHypO8PGHvu7m+gYLvQFN833V/WwGku3cpcIbFf
 9mX6s7JFKNkKUxPWHqxVNqOc8gQiF04hEKpN5b+7YthCU/g/3MxSHGnkQbT6LEdWQ5qk
 HAdPu9NU1tiz6NkOCU8aqylI+Gw2UWm1tpzPlLrmZ7U8tq20JobkN4nRQyh1A5ZR5snZ
 d+m+Ota7j7gKR1RkRehDVSOlUsMz2hlxqZMjDjBRPmvtUjuQZkT2wdUZt6Ud7a3vjV4D
 2J1oZ4SWXNkSWKAZ0qKACSjvPx7hX8/yU/XMwP5QMWdXqLrbyrK7sGy5ztGrrePWohwN
 WC/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeWmpCT4XUyLqA3jGdKMLgN42I94HPs/Zfw3B3oph3LOjMhKAotozwtCfOPZp5sLkq+KuOP+dc02a1M7ebXqLdD8YY2z2r2iWqH9c4wiil
X-Gm-Message-State: AOJu0YySmduyji9unqn2Eloii7SXShrsZ0AT2pyD/vFFZGndeeHqzgfN
 ESqCd1USF49KE0NFQdZFYrsHlAgVT+6k8toUTdiEmHZV8/+tBeRTD2mG64Qasp8=
X-Google-Smtp-Source: AGHT+IGsjvOAZG6k6Yrc1aU147z/nHf11R4olGWCpEWKjChOK/ghF1HIDqiNrJy1XLnts3ZhEuDM0A==
X-Received: by 2002:a05:6512:128a:b0:52c:9ab1:a312 with SMTP id
 2adb3069b0e04-52e8264c2ccmr5115108e87.4.1719864176585; 
 Mon, 01 Jul 2024 13:02:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab10269sm1504535e87.96.2024.07.01.13.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:02:56 -0700 (PDT)
Date: Mon, 1 Jul 2024 23:02:54 +0300
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
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 5/8] drm/mipi-dsi: add set column/page multi helpers
Message-ID: <r2dalmjcz2egae6uw6zlgr7yu74z5uivigcr2r6zzvyg72z336@agftaxio44dr>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-5-c4a1f8da74f1@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-5-c4a1f8da74f1@postmarketos.org>
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

On Sun, Jun 30, 2024 at 08:36:28PM GMT, Caleb Connolly wrote:
> Introduce mipi_dsi_dcs_set_column_address_multi() and
> mipi_dsi_dcs_set_page_address_multi() helpers.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  include/drm/drm_mipi_dsi.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
