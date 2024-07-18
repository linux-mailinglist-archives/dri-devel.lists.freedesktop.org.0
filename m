Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E4937025
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 23:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5D010E03C;
	Thu, 18 Jul 2024 21:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XRsoZQVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E982110E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 21:35:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52ea79e689eso1468097e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721338558; x=1721943358; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0/fJsgp/AZdEv3h8J8/jVqL+YwWPDVkh0WLdgpf556c=;
 b=XRsoZQVJo500lWwzjot+RPI7AallzGKTYGtwZkfwRBEKxmc3x9WbMnG0PCM0VLL9Fi
 DQ4XhspmnLVkxy3klQiMyltksLZetQke6TOXR4y4i8lInkKbhambKWl1PJeuQxQ2mSC2
 ktcto7Ocfqx/pR/1RAyn0hS9hpaeuPDZA7auu1NAZXVQ7dL7qcBAQSb3p5hnwDPNnP9s
 XBcRPo6bO8IEYjwhpxD5a3U9mHUORykLV6ZpxokZzadum9N6VD1Zy49Pgix9kf+jK8E2
 9YkYBP/HW7lA0/j7IxoQwLjcFClL0O+FgZP6M989+Ncbs1MMlGbtmbma4f+DIAnMd0b+
 I5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721338558; x=1721943358;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/fJsgp/AZdEv3h8J8/jVqL+YwWPDVkh0WLdgpf556c=;
 b=M2C6J5OBMt/giZaJlklZ2TGFJi3lCfRnmkuPBpHl7sEpkFk1kUJgc3i/XL+6hu/kZU
 a5+RX3roGk4FhggdstakU7p7n3dsiO8ezvh81kLVU1Sc7TrV16/WvTH2jopawqiUSrBD
 gl0/8/7MEKa2CVRLYUvvy6m5JiMJNR032A1AyvblAw43ShExn2ZKCXmpXdx9xxDP4tYm
 O6ORihzgOZSSrNFnd+PRanO8feVDsDh0L9SiFuEC8iSOgdtATT8l0+ilBW6YI7nYQd2W
 cwCoogP2uy52L0wRn/A2Hkj8vcpeu63kXXqWKltwzyZtTW1f63fwigeP5yIbL7RexRse
 szBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfBKbLb8ZmW3rPKHr8i/j11uOIoX8Pe92ukJewsMEm8BPR4aa1B4flEmWiuy0Q92WqSBfQcLPHevPAamooGxl39VCOXKByrHgFyNUaJNHv
X-Gm-Message-State: AOJu0YzxTlFttWfNRsGw7S7DqTr1JU5WmEKR8IdRwi5f4ZCRIWC7vE5s
 HHSFykcKHVrvoW1oRA4KdocYb67NBTCsjbBPrmEuazMcmMIda6BnJpfKtjAM/C0=
X-Google-Smtp-Source: AGHT+IHuG7Yb6XcvPP/LuraXGboWeWjVx2oXL8KmKYQwMBVDG/13BqKI2G45L7A6gN329d5eBqY3OA==
X-Received: by 2002:a05:6512:1081:b0:52e:9904:71e with SMTP id
 2adb3069b0e04-52ee53d7623mr5237291e87.28.1721338557906; 
 Thu, 18 Jul 2024 14:35:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef07445b5sm204487e87.126.2024.07.18.14.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:35:57 -0700 (PDT)
Date: Fri, 19 Jul 2024 00:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
Message-ID: <fnoc5jhpu5gwkfufm4cyyn4cjhh6dtw2if3jukk7t3tyvdwesv@pmr4j3vfgpjt>
References: <20240718184434.6307-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718184434.6307-1-robdclark@gmail.com>
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

On Thu, Jul 18, 2024 at 11:44:32AM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> index d668e8d0d296..284a4ee79bbf 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> @@ -19,6 +19,8 @@ properties:
>        - samsung,atna33xc20
>        # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
>        - samsung,atna45af01
> +      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
> +      - samsung,atna45dc02

This makes me wonder if we should define a cover compatible like
samsung,amoled-edp-panel.

>  
>    enable-gpios: true
>    port: true
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
