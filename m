Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C222BA34B1A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6CB10EB43;
	Thu, 13 Feb 2025 17:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Im3QxvqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E953610EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:00:41 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-307c13298eeso11132641fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739466040; x=1740070840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8UZNM2cfJDvWcZt1Er+PnBNRIi/F3g3nkljefPZmTuQ=;
 b=Im3QxvqPGG1YHvvK076x2e8t9JjOVilLkdUQY0olqJkOr2YY6MFPa0M8meqhrj3JrH
 Iysd6TQKDsXK3lBDPoercQsUnY8vLQXbpAYTQNB7jvYonwUPLncawzHWfRsIrvtLb2Ho
 TV+NQ5wWmyPujnDZXPFyPmt+SjKNFA2pjHi82Y9z/zg1ugFPZHNvXBLdSAcKFxYP1tWB
 /Akxb9TJrIgU9b594gf6JXnjICI30IXDCpCwJm8lLXkxyT/OkfrsDL1cqg1bPwC4O5oL
 ABxC4+YqwV/QlEzM+Lwfa8iDx8/D6+mjdInj/GKzWL48PGphbYcQql8VVTkwlOxs32vq
 ZPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739466040; x=1740070840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UZNM2cfJDvWcZt1Er+PnBNRIi/F3g3nkljefPZmTuQ=;
 b=YWJnOjS022cYN3kn1u9jj7NH4Cv4+U6FpiZw+ea5vRw/j+XkzsmOMrveymVCELQWFL
 orhkJ5z0xxhLYS2jDn/VWEabXcerfkKjao/yqwtoauUTgWssPeeKhlDbowpByYHo5nc/
 ZAo+HnKimxsua6GDX/Api+QAal9EXCtz+c/oIvouWHYDjL/UfwE47tCBGR0kfcw1ue9x
 XnhHciO4fA4KOLWBe6acAz57WCH8h7718qEdBIMWkPtlbzRYaMYToI6gCz0e1xQEKRS+
 V5rFs1OmRLI0mCA7dlUqqO4IUHWRmWw5gM3AlfwRO/2pjC7F1/1IW4BMCnpUQY+X4Qpu
 iXbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFxBAG2v0UOPf5kgnP+eEmG+jk3J8PYL2A36kRSEy0aCDAu9TOiviTosXtv/b5QJB0En1ANnl09ho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpZdLCaA0lbFlwZndJl8A3uKktJXh6Kcsf8odCRvF3ZT862fnQ
 OD6hn+HBBP+kYBC0hHGZ7sULL0q4thdygIaMPPr9fXBcBK+f89h2iAtjyVW7uxc=
X-Gm-Gg: ASbGncsZRfso573Y91Zjc8w+PQwl4Vw7Hnos3ab5zZ+rUVoKLJZVZICA7XjNp2DXr+4
 +bZoicKPLTNwLEdrbGIBgiYPSPnNarMzaeQbUCO9srrHmuYJVr9/JvwQh/8MHd72y6fIf8wtFA2
 hzXw2aDb87ExtGdJc5I+RQQ57QAp8pnz2U4nP3Q16eHZOKD4rygUYxvdnOsXtbXBjDo4wK+ZikO
 mXvu0/XlhFAqzI+/CHOfojeD6L1sz2+kO52RQYkGDvhPBfqOLC7tpxIy/qF/z3Vm2WrHcaMdeCF
 2cv8ocVt/oCZjOUz8NpagHuSOGdDvkfytnN+NeolPB2wWSQhCiST5sy8H1Ba/QVyFRyOPRI=
X-Google-Smtp-Source: AGHT+IFxfLzjVADe+NQ9hyecFQjlri4ibXGiH0NU1miK6ClkLcEickWMwRLitIzMvkrGViP4aYFupQ==
X-Received: by 2002:a2e:8887:0:b0:300:17a3:7af9 with SMTP id
 38308e7fff4ca-3090f3bee24mr11613931fa.19.1739466039832; 
 Thu, 13 Feb 2025 09:00:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b835sm2457111fa.100.2025.02.13.09.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 09:00:38 -0800 (PST)
Date: Thu, 13 Feb 2025 19:00:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <7mojw3jf5skm4esa3xquthkpwez52u5fnbvyqj7g7hdjgsz5dz@ewfsb36sa7tx>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
 <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
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

On Thu, Feb 13, 2025 at 05:27:59PM +0100, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.

Same comment. Nevertheless

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
