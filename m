Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C0913E82
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53B10E322;
	Sun, 23 Jun 2024 21:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a3hSZpbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7473A10E322
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:24:53 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso3763470e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719177891; x=1719782691; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mNAVEXZ6+S4MEQi8nN59EgiF6h3aVPXVSlq4NFoo3+o=;
 b=a3hSZpbXv+ryTJhjzEhS+QelShV1knP1WYtPJDoj8R0iyJjIWxiP/R8ZHb3Iem66iN
 Y1zciQ+UyjoN3oKcvu6+HQ9TViknhPzxSoxGBV8Nvy0HZhjj938dC/dq4c3339TRSgaA
 fPmAoheUkkJduBfTFVcZA50NihhnZu1ae5q+VDqScLLwlUYYhGQRd48sB/WiFs5OETPC
 jxygxcOTj27zi2l0ZDEc+rXZlYtCrCJqH9PXndko2wETTA0Y3dtpiiQdgaDV0G7Mwv4y
 Qw4bl+uyMeJk84cik77OnFFwrcUMFFy2p8++YWdL0VCgKJ9jnu4U+OnLN/1dWURBwA+Q
 XPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719177891; x=1719782691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNAVEXZ6+S4MEQi8nN59EgiF6h3aVPXVSlq4NFoo3+o=;
 b=XvrEVjVC36tSD8bpTYs07ist2TXQ9ZDzD19cHfaUgv1la8vbgaTVLL4YtHT/gwMh6E
 N+KUVLRN/dAl60cCdCEbCcnY5A5vGIXooPEqZSEYvJyVW+3kSulrM17ya/gHBxlUn2JR
 B4M0QtVzmEqKe7Z4r0scFZmVwk2TFwJeGfBDhxisfdDw8KFj6jsNGxcIlKHukWTAtV/B
 F67izMkMDAsK3iZiJEsi/QxfgPhWh5bktSoM2IZRkhLtwJf9qWv4bj6V5qOS94SaHh7Y
 LPC7US6xufUZiqq9jkPYu7PgCyK+6Xjrnv1WVYvHk7q4075skJOMcFQAaD2/2jZnizrp
 RT2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW39eGrPVApg49nBPGMV6TtwZDj9XaXo0qYeg/aZo/8QTuq0vR6LuDmGzXGaw77ckjQuG54qMyPCsm678PbY5o58lAt5M0GF4Ln55CCTvS+
X-Gm-Message-State: AOJu0YxXxwmNprYsPKDwHMbLDEmDD0uaTAbU0MHo4tPFm7VKRPOY8+f6
 oT8l4t4Fa8O4mv0t4CJKqMQslYYVnmyO/e1AQK+1dFJhnQ8T/tMReFzuAJzRdqQ=
X-Google-Smtp-Source: AGHT+IFel0DuKv+EHiHhhrq9a39fa8wCRHymYA2GhsqybiN7bXR56zuDqicVyW8ZZ/5C0YigGPyLQg==
X-Received: by 2002:a05:6512:539:b0:52c:ab21:7c05 with SMTP id
 2adb3069b0e04-52ce185d03emr1894980e87.67.1719177891517; 
 Sun, 23 Jun 2024 14:24:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b4762sm847367e87.14.2024.06.23.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:24:51 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:24:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 freedreno <freedreno@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Sean Paul <sean@poorly.run>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Support for Adreno X1-85 GPU
Message-ID: <veyzue2rfwd3brs5ama3z5wp3zhoytnggohcidvak4xaxv54tb@hkh4dpk7fcj4>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <26abe6cd-e9da-4db9-9035-76edd5dda614@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26abe6cd-e9da-4db9-9035-76edd5dda614@kernel.org>
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

On Sun, Jun 23, 2024 at 01:11:48PM GMT, Krzysztof Kozlowski wrote:
> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > This series adds support for the Adreno X1-85 GPU found in Qualcomm's
> > compute series chipset, Snapdragon X1 Elite (x1e80100). In this new
> > naming scheme for Adreno GPU, 'X' stands for compute series, '1' denotes
> > 1st generation and '8' & '5' denotes the tier and the SKU which it
> > belongs.
> > 
> > X1-85 has major focus on doubling core clock frequency and bandwidth
> > throughput. It has a dedicated collapsible Graphics MX rail (gmxc) to
> > power the memories and double the number of data channels to improve
> > bandwidth to DDR.
> > 
> > Mesa has the necessary bits present already to support this GPU. We are
> > able to bring up Gnome desktop by hardcoding "0xffff43050a01" as
> > chipid. Also, verified glxgears and glmark2. We have plans to add the
> > new chipid support to Mesa in next few weeks, but these patches can go in
> > right away to get included in v6.11.
> > 
> > This series is rebased on top of v6.10-rc4. P3 cherry-picks cleanly on
> > qcom/for-next.
> > 
> > P1 & P2 for Rob, P3 for Bjorn to pick up.
> 
> Which Rob?
> 
> Why bindings cannot go as usual way - via the subsystem?

They can and should, via msm-next -> drm -> linus's

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
