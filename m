Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD6A56055
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A2210EAD7;
	Fri,  7 Mar 2025 05:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QxxxrwbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856C810EADB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:49:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-549946c5346so86501e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 21:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326589; x=1741931389; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jN6ZIl4heduOl3aV1Xlhy1GPaNYpaPeTUI2tGOU7POw=;
 b=QxxxrwbLVqCaItnjB/RhxnSTM4X3jCGU4H+Bv5hy9HjJdhba+9jcp3kDHMJXBTb7Mx
 yK+7qFEOlAMIkj6Xr7C2ym4wZqhlqQ5XHcDYWD29I0T/Iarvnp3IokhYPr0U2sqjTaY3
 uaPvRkeGh7272HVln+OyLbyk2OTK55Y0bkx4qQFYhe6e0dxu1qFwJqyPfUZPeybowjgc
 V4x2H1KlGqA7KEIdETsshMfcyDLUXuHSOnibZhcLnjJ7UhUFCObHQfS2wAc3ww1sZmFl
 xtTH1Z/4DI5KzNJNoFxpX5W6lXuWPwdQ0vHXguNAodvB3DmL6AY2YCDjxKpEVW0SlZtD
 QwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326589; x=1741931389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jN6ZIl4heduOl3aV1Xlhy1GPaNYpaPeTUI2tGOU7POw=;
 b=X5m5fADxYvp4ePlTV7E84Xt2jaspBbVp53xuW/tuAK3IlAdBYOaQJhSVIYkC4SD7qo
 3I4/1+FxqAbbnmmqpFp00zFEeW0uZrL/KApFho6qV2P8AA7tgzE7eGGNz1TeAp6QdIJA
 sJ/6qum9KGT7MNSJ+Og18jkKRBjZ5gO8hZlqe8qEUmPPYA37NwRlhmlTl3YfEw7nvoxN
 wXzBqJnG1Mn8gfpfQhym70BOiKcW9VMZy2fymDs8wqXo0z4RlnRHy90PgsDm7YCp2oe3
 nr7t25d1W86RyuL3ACcuCSqIK3Inq2EdB0G5/7S1n6z2Xybtdd2ARomspClVhAARicCR
 B2rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU56HLe6GDCVDAVGEoQq8l8aUNRZ/47ixv3wifW9rR8dQ0ShiTD4wTBcaxOmMEqZWFUUCIYxjtz9kI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUn44qVr0eIRFawBpqVlKBsg3PfbsGdX9ZU3b4HPWIs/DYz/GX
 +DFC/A2vekFCaw7t6JJJoDcLE/WyLTlxah7lpJxZoLt8837S66ksVSBD/DCxWuw=
X-Gm-Gg: ASbGnctdHfz6irLQOy/BhV4V51mJniQTzlQCAgtQvhSWvDrurgFFrZe+LKOC//9IoJ8
 qKDLGoRve4E6yx0O6dT669PjjvcTL9qcwqmZff753v6t7xSYcwoSIFpiES1RMyHJmr9a8jRJUNE
 Fs884FDAFP44TNitcOfHCq+YOyWNzgKzbpTGSIU3E+LSzAUCNAPXi7nIoWTFYOXPhUfIHQ8IdT7
 3oGqI7V6ytPnM1Jp20kdHXdUjvWPZ3027af1ZBp/EyU2fJB7LPPiv9sLjLRo+PhQY96DXmLB52k
 UGW15K5Hgf2jDHQZH/xFbjB4vFms6dA1J80eCL9PXnZjTA4ZO44zTAU9C+JRjedcDderAbBkNLX
 MagIauRL8miCQDMWcSSjA66Z8
X-Google-Smtp-Source: AGHT+IGP9JChyCLN8oP+7KejrIg47v5OBKkR88FiJPVHk9F4HcqJxHQhiZKSP3fE87nRAiAkngPRQA==
X-Received: by 2002:a05:6512:2804:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-54990e3ed57mr611055e87.15.1741326588773; 
 Thu, 06 Mar 2025 21:49:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1b2d66sm382417e87.153.2025.03.06.21.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:49:47 -0800 (PST)
Date: Fri, 7 Mar 2025 07:49:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] arm64: dts: qcom: x1e80100-romulus: Drop
 clock-names from PS8830
Message-ID: <737cuybby2fsp5hl2c75q4dajax2keymfe7ka4w2b7omw5b4yx@elprmcldts5r>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:22PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: b16ee3d0cda4 ("arm64: dts: qcom: x1e80100-romulus: Set up PS8830s")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
