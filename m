Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920D963136
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9374510E5C5;
	Wed, 28 Aug 2024 19:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BobCHzRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC9410E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 19:49:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53436e04447so1052158e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724874561; x=1725479361; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WfREJfZgElEweHVwJvSVEk/D+r54zJQcIccfYEdIZSM=;
 b=BobCHzRKXSe1//aazTv6ULYb5ve/NJGZvexvTkpymdyBgJSl5oF6U+ieRqu+J33gdc
 f0AtcXi0pF3+syIPc2yoCm+Gl3sLX3LmesncC/Q9YNUrSOqPaMnPc8D4g3I8Q/VUU7JI
 gU88nmNRFUiZF7UXOfF0C0Jtv5RjGHbqfWgphH5UY9MXL0U6ee4Pea4xEtyINGblO5pN
 0JCmKl0hZfkiQ7vBDXnkyQrAdmbZl6Lt3EBWDRcFcDjmuSKahKq2oZ3tUHZGtZq5uhq4
 z6pDN+NhDy/uD02g1dhEGki/ulr1w7/LsdPzW62Em1qKpxnDREnd8jTLuTeWpQXBW/nn
 w3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724874561; x=1725479361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfREJfZgElEweHVwJvSVEk/D+r54zJQcIccfYEdIZSM=;
 b=j5HuxtSpL4Uo1fNLEUj9Q23ekv2qbswbtvRdPUWQdo5NtiJfi0wraLcAK0eNQpuZSR
 489FupIlnUYO3G6t/NSnGj8NlHETwzm5Nilv8FR9bwZM2fn+qTGBa9PiCS6Yeigj4DCD
 qXlQSSgFaFyKQ1A/Yc/XJ6HILwEhAUkdOacwLJXfw4vja5ch6ihTRf3zfSgNYId3Kjto
 vokMonupaNGFbkdoS+b+euWb/uztskGVoUB2IQ7XyfmYzncWS+W4bV72Bmx5dlXBPjw0
 2ctov2uCiWaKRpRwPMvFcnvYpuTkmXn7AdwtD9T+QnXb2MxXiEFPjwzZaWRN9xNrpPZ3
 HhSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlymWRSK2t5Z9miODTWaEYfZIRKS9lIqcLg4UdMUZ7lckDFetn6oaiauRCZsht/fdPDy99Wc+Ws00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIo714XsYzZE/CcCILDOU1DPys5lGLgfOQ8Ot397YwjTIH/DU9
 l0ZMHwzNPzx+KOMr3AGMb5xJW27evBOWL7Q97VMkRfZ/5Wr80J21yZvs7sziVUs=
X-Google-Smtp-Source: AGHT+IFR6avFKpr2wHph931hDBC2z+rTIPVUVlBNS/Uou013Y8gMhOrlNprLkZ/3P1WLSkHYPJBA7Q==
X-Received: by 2002:a05:6512:3b97:b0:52f:228:cf91 with SMTP id
 2adb3069b0e04-5353eba3ee1mr78077e87.1.1724874560042; 
 Wed, 28 Aug 2024 12:49:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea99933sm2248052e87.309.2024.08.28.12.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 12:49:19 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:49:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
Subject: Re: [PATCH v4 4/6] misc: fastrpc: Add support for cdsp1 remoteproc
Message-ID: <vuviyau3vbmf4l4mfb47lyh2n2t65fy3j2lxrg5jtyuz34kil2@q5ytlfdcmf7x>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
 <20240805-topic-sa8775p-iot-remoteproc-v4-4-86affdc72c04@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-4-86affdc72c04@linaro.org>
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

On Mon, Aug 05, 2024 at 07:08:05PM GMT, Bartosz Golaszewski wrote:
> From: Ling Xu <quic_lxu5@quicinc.com>
> 
> The fastrpc supports 4 remoteproc. There are some products which
> support cdsp1 remoteproc. Add changes to support cdsp1 remoteproc.

I'd very much prefer to see this abstracted somehow, but it seems
impossible with the current driver code.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> [Bartosz: ported to mainline]
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
