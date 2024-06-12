Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12243905B81
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C0110E8DB;
	Wed, 12 Jun 2024 18:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RPk1GOLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E9810E8DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 18:51:48 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52bd48cf36bso280220e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718218307; x=1718823107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YFYPQEigFT5TfOCN8eDaCIrl7HC+yeqeYN0ZmGZ+Sr8=;
 b=RPk1GOLp10xshVVQ6qH28fYLpDC97mZDBFtPbVIL3aoRMl14S8+qymDvVvM0Vw4WRp
 WL/6TfcruqbPwDsMApQYQ4wMMq04AEmibVHTyTSBl+tCVjGp0C3+K6rMX8ihT1AxwAMq
 xVutD2O8OZa0TVTicwVY9a8fhrhTjYpmLrczV3YrDkGxtPlCfUKUrNMxtTZt4INmv7+F
 PwVJTnStF3GT8Ry6J53LkLQDWsq8pVQGPTapyx9jpL5oDfCMCYI6dzcbr1BYqheGf9wc
 Qp7cIRmp/VEd24igzLspS9dzuDuTnpHhnh76si99uslRB353lb5366XUxQbRftqu6iWc
 TPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718218307; x=1718823107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFYPQEigFT5TfOCN8eDaCIrl7HC+yeqeYN0ZmGZ+Sr8=;
 b=rUJlTSsTN73H2Yp6f7x0INEOyofApsPk1HO+b2WPU4JCxY+caPMmdIkhi6/lwRnO3Y
 Fqrtut0s3bF0fUlp7Z85Zq8cT9EW4lJnzkznS1jdBHzQHx7dMuqcdCAtB+sojoLK5iNf
 aUQZfB+Xo1VcBcg5f3rtuMh9gW8vAYn0SNU+MiUAGvSXOaL+1CMV9JVS3jHxIMNT7e2s
 i3rkQuY3Xw32kyXXtY5fQqfqJRcfbElmgcwidJJjb0fnjQp5sPHKnonIib8d8c+n/2Tj
 +g4kbHY/MhCdPLc/RKfqf8aIw+t/XqGhnzQ/RHj3cAIMiVychKXIh0lksxnvDWNi+H0z
 ssBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU62iiA2O6ZgYLvcBYvaIJq+KpaanJj4exZRuJVwmBiFTIW1lD9ANhHJA3cB4fHRvOCSVieiXAImnVlQm9i8cBYhHCuIad3H+zdPaj2Ycuw
X-Gm-Message-State: AOJu0YxLv2mgk23MIVcxG7vPYlDM3UNc/guR7s3k6M26ftEwIMZs3H0O
 cYcYpIfDY93WNMEVvJynZ8OkdVPL2vufez2f4RktPKvB7rIcg8/ryiHXuzui1R0=
X-Google-Smtp-Source: AGHT+IHjX90AGX8knBQHaw6dOK8zsSJKlpbuIZ1J3ZLU/93MWJ/OAchtptQelggFqTZRz8uB2Ye9ZQ==
X-Received: by 2002:ac2:4850:0:b0:52c:8023:aa9 with SMTP id
 2adb3069b0e04-52c9a3dfb4emr1809326e87.36.1718218306834; 
 Wed, 12 Jun 2024 11:51:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c9d2f57a0sm327045e87.284.2024.06.12.11.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 11:51:46 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_rmccann@quicinc.com, 
 konrad.dybcio@linaro.org, neil.armstrong@linaro.org, jonathan@marek.ca, 
 swboyd@chromium.org, quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm: mdss: Add SM7150 support
Message-ID: <grpc4inh7d2wpwrkvssehapa7z7mw4loecjt3p4qcjjefobvco@6g5sll2bkcbv>
References: <20240612184336.11794-1-danila@jiaxyga.com>
 <20240612184336.11794-3-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612184336.11794-3-danila@jiaxyga.com>
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

On Wed, Jun 12, 2024 at 09:43:34PM +0300, Danila Tikhonov wrote:
> Add support for MDSS on SM7150.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
