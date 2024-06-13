Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE269069A1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFE910E9FD;
	Thu, 13 Jun 2024 10:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DHTRb/83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030310E9F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:07:59 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52c8342af5eso969213e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718273278; x=1718878078; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RYvXhUR4MqvdO8CyI6lyGFQa8ObvUY9+LLJIm6+1jFA=;
 b=DHTRb/83XsT4t/KdpTpw+vVg6bsrYPh23ae1M4ev5PUCP8DK7RHhejAtbaf5wEMG4R
 pnWoU+SHdbchTNplWe73mqiUp7mZXplasl09b9EkMSn5x2s3DkAc98YmKXAvXFF2Bn+t
 kHgdxNUJQegAu9qsqKYpuwOEe/FJGjvXPvhWOhkCArYoU4pGeiZJC6aeE1TSQEpqQUWt
 NDfY9jCheX3KjKQx/4+kVWUMJr3oPteR/iXVVHcyPbUx5iGk35Pqgj7zsZa9DeZe1LoQ
 Ov45WK4wu2xDQYrS985rH6G7djdWA8Hg1HFSPoSQKZ31CVlStSVO/rnu0BNzLiWDvVA3
 yQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718273278; x=1718878078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYvXhUR4MqvdO8CyI6lyGFQa8ObvUY9+LLJIm6+1jFA=;
 b=IQsGQTEOtyAxSTGIXKzXuuvBK0LDVVGs2kMiEtNLpaTJQM4fm8oTSiG0zUQMidoNxq
 0ZgLvdPSoABLlNGa9FZcH+voxGxQ4RjUSJaMPa/AhUtKRZK1+VJJIuJXM+sLRtCewXTo
 IVHenbhCcQLqj/6mpWwNEtKsWQ6+VqLmmn9UuzsM9n2sQnN3ot2PkPX/1siy8nmcz9oj
 1eooJsgK5oB1VLRpz+6cab0DjrROtszfSLy5i5eoRViCb5x7GzJY2MbYjOGhhESc+Eq8
 nyADis+6HXg9ReZ3k3SJ+UbGsXj5R1Of8l+F60/Pk93s8BGlEJKEGe5bT7oQG4shWX+7
 pW4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFGRLl+BOAOygh1GrO0XtYC83cMOmdOxFTxCaxhEmSSGSoseAKkM6Y9193njBhn2tsDam+bK9ZVs8WIYkchTh5FTOkGscyqv/3/tJACe9r
X-Gm-Message-State: AOJu0YxDefB5YnMFZpZMVsDiv96VxM/c315gxUt83fHtVrD4aholJ242
 bMEcAShXmCO92qedg9AZ+KwdcnWPxWMklAxp8qyuIerKOEIWJSTu7Is4WwIyvZU=
X-Google-Smtp-Source: AGHT+IEIfjbzuR+TJYfn0WkM5bFWWQE5UXg72/ta38D4UK601aQPCRVEmPoKXYW21UYlolSVF5CCJQ==
X-Received: by 2002:a05:6512:3096:b0:52c:893c:6c2c with SMTP id
 2adb3069b0e04-52c9a3dfaeemr3306688e87.40.1718273277753; 
 Thu, 13 Jun 2024 03:07:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282f2aasm148599e87.85.2024.06.13.03.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:07:57 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <qf3erx5x7cigdsel6eh4nb4cl7733ag6qxxeblcdjzys6dnrul@nl7mzrm4ljji>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
 <Zmnejlkb869mN3eS@matsya>
 <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
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

On Thu, Jun 13, 2024 at 04:02:24AM +0200, Marc Gonzalez wrote:
> On 12/06/2024 19:44, Vinod Koul wrote:
> 
> > On 06-06-24, 18:07, Marc Gonzalez wrote:
> >
> >> HDMI TX block embedded in the APQ8098.
> > 
> > This one too
> 
> I assume this refers to:
> "Why is the patch titled display/msm, this is phy patch and it should be
> tagged as such."
> 
> I always copy what others have done before me:
> 
> $ git log --oneline Documentation/devicetree/bindings/display/msm/hdmi.yaml
> 27339d689d2f9 dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
> 6c04d89a6138a dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
> e3c5ce88e8f93 dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
> 2f14bc38d88a4 dt-bindings: display/msm: hdmi: split and convert to yaml
> 
> Are you saying we should diverge from the previous nomenclature?

This one is fine. For the phy bindings please use phy: prefix.

-- 
With best wishes
Dmitry
