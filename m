Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD884A31A47
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819A310E0B0;
	Wed, 12 Feb 2025 00:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P5Kg5vL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ABA10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:16:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54298ec925bso7833310e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739319371; x=1739924171; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xdffwztOvMIrK2jjolf4o8Wr6ci4Bs53P61Nbn3lItg=;
 b=P5Kg5vL3UL3eYK09KOUI5X3ORxmgY7WkQzHngdl4C1zTrTItI+4VyJPVcBoImROrrY
 4TUkcL93TSyxcFRwtD8ZRpU6EJ32jHC+Pj8dcJi7n2f+aYLECwid5yj74zq27idFyDuX
 cTVpiqgEgHlZkYHIugxQxgqJ3DbVS9omzdViYfAJIcSkloR2e/PQA6f5K2sRK1WfNgqY
 rUG1dE2V1P/Teb2/ajZc9VqzYkpQvEHKg1FUZbC5IVQV0Kpem7cKBORDaNx7pRVCUFvx
 v0KC6w1NynZ+pG3Jjg+d6QzUGcYZkruRN/2vA9KxwsIJJIOeh05dF5EJ7vnBWT4rT2Ad
 qkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739319371; x=1739924171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xdffwztOvMIrK2jjolf4o8Wr6ci4Bs53P61Nbn3lItg=;
 b=eiB8MC7t47yy8mgIuZIf37NfliRUs1lDaGRAnin9hAtkzU71D7wiZCt7ieaR/PI91F
 vAGvWmzUdcGnRwuYN2NAZO0Pkj1LmmUPqFAYhBMKtSlafyBkVLL+NNySBmAJP+thqIfN
 h3+HSiOuSO0+V5i91p7DT40Kmoo8LMFIgCHhmXEhPk6SQdy+Np0zYCSjuCiaaP62KTP2
 53zxnuDYl3iNO1RirkT1kTPWAG386MH/PoI70CxBR137K3ni9/UC8fvEdFZJ16CUjqgo
 rHT070bSudK+jlAU21Ce2RDLGIl5BNY/ygJjpX6zhqGv8sXIQEQA99IukzMT2IhLbmS0
 s2cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+s+PZTkdWc0W/OJc3iOc0lbD+G79LlchX0qD7u+fhw0OBT/PDq14jatr4F14cU9On84x4rTZUyhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT0R4eBdp9FHx8wiXis4feKVw/gk6+xGYfEGAdMDgNFKor4XVP
 TEJsDLOnl5eRpoSSwQ4D1A0/Y06X75fphakHxOKXNwcLrxfVUgkQi4lmCqLFGj0=
X-Gm-Gg: ASbGncuxH8Xj4SIfTQV2qdTcfayVt7yXXZWD7y5Nzy3IeLZ/aYKMyyI4a7yQ3vOwpDy
 +D9euF5Qvn4Jq1eZF5SkDYefwARjXgNWRU2egVoWKoQyjskIKZKD4phOjznH9cgBJ1v1lmr8/Lv
 299MN0Ut2RRczT2E0jzVcWt42T5OU5Ok+d1D50msV9BEY1EkN+lCAKujJqNvrxxsWghYWGmGmvt
 XPVv4n4jPQV5cwyBnWH2e/Lf/flLBWYEN5TY5440BUNw9GGWsUHo/M+slWvYqyiWkMvzY5aV79E
 x6/ltgK/5x3A45jgYufZtH+hzgK11/lmzQmgPhWvDLipMM5JqY0GTjVYy5xek8glxiF5jO0=
X-Google-Smtp-Source: AGHT+IHy0V/tdcXjGNazvy2Zt+CkmxrEZA7UjXkUXMZVFafXjdfWax/sQBr8F95GBvsvHUv1FZm7oQ==
X-Received: by 2002:a05:6512:3e1e:b0:545:c89:2bc3 with SMTP id
 2adb3069b0e04-54518178d4cmr243784e87.33.1739319370883; 
 Tue, 11 Feb 2025 16:16:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm1053658e87.1.2025.02.11.16.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:16:09 -0800 (PST)
Date: Wed, 12 Feb 2025 02:16:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
Message-ID: <ma7ur32qudbxaqt7fejgxiqf4vqvsd2o2oki6cz5enwchdli4n@xk5dptvjbkw2>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
 <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
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

On Tue, Feb 11, 2025 at 09:26:31AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Feb 09, 2025 at 07:04:46AM +0200, Dmitry Baryshkov wrote:
> > Supporting simultaneous check of native HPD and the external GPIO proved
> > to be less stable than just native HPD. Drop the hpd-gpios from the
> > bindings. This is not a breaking change, since the HDMI block has been
> > using both GPIO _and_ internal HPD anyway. In case the native HPD
> > doesn't work users are urged to switch to specifying the hpd-gpios
> > property to the hdmi-connector device.
> 
> In that case users would need to update their DTS/DTB, so that's an ABI
> break.
> 
> Please deprecate the property here (deprecated: true) and keep support
> in the driver.

I will expand the explanation for the need of the ABI break. Yes, it's a
bad idea. No, it doesn't prevent the board from working. Yes, it needs
to be done.

-- 
With best wishes
Dmitry
