Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A79AF99D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 08:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF1D10E9F4;
	Fri, 25 Oct 2024 06:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KSS3ntYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD6810E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 06:10:34 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so16992341fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 23:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729836633; x=1730441433; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6kkKPNMfQxKeojJArVyXseEAJLG1rkqHbjN5GAes3jo=;
 b=KSS3ntYHqvQdmfuHmNbNAVB/X+4d4ctc1xZyAPcd7F7g4fLr2YWNOKnR/2pIxqg0R5
 Jy6vHJ0n2q633BYmjBi9BcbOVKstDR0X1iiYBvDsbM56lGrXqqJ9Se60jxzR1G8kZkI3
 xLpmZDJd/SFtJBqccIOE6DDBCSL6Bl5MX6H0VPWhuv9W6jQrFj1hlBGY7gfLDuCHu32A
 yOMkkQl2Q/h8MiYYHNkEvI9a67nK++C3w44khOULZjEPo2jCGDUNOMywmEhiHktOI/SU
 Ved95yl6ySkUwk2PvgwJL0JTantKgZpmmaHknTH1ei0eN+iozn9FGHpQKJ8ljImpjLSQ
 fwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729836633; x=1730441433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kkKPNMfQxKeojJArVyXseEAJLG1rkqHbjN5GAes3jo=;
 b=FzyfojfgFkCE40bNq3Iav48AJ88kQmiTjwRzexMals047jJHPcDTlSym7sI+CEySPh
 aGCKfQSRgzr07WkDvjN7qcY5RJYAa+okfuONPfbRilR6It+pEMVeqpDpjo13SiuH3DnE
 adnzA91pHTHca1jVA7n5Ge5a8AkzHinBwj5B3Dk5EABV0R3SFquhOCiHl8wD/7D+RIiw
 Y7bK/31jSFezapwLIUc1WJb9TRycf55ymKLfA2EC1sB7cFEfbWvU26od2iIOOhrusi8N
 rrBTmJ3mzzfmSHCY3aS6SBhliJ4gR8zn6cs5/alpoxxoEKl1B3wzlQUzdF/A/rOrTv7W
 AneA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD9qR5L55kGP9KmZfrHlhRHME+sDYKEu+ZWoRIA2S5IYoyDEUKumWLrRhb+NbU6J7sia98S0wYiEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyCQxHSraydAGg44F+2w033msUYM6UC/ES9NfuI8qNJvyQ62t/
 dkbsd5taQZX0uW3zPk14fiZdhVB//+rPXSyoYXTACFiDklBVX4lxQmyAJodi4+w=
X-Google-Smtp-Source: AGHT+IFXtDyLhu4urkvu/zEBWCkjD6zDt8bX3VJFbWKeSAuwp/zDLD94N+n1R/o9WeiwSGWu061YMw==
X-Received: by 2002:a05:651c:b20:b0:2fa:cd7e:3b40 with SMTP id
 38308e7fff4ca-2fc9d3458camr51692481fa.11.1729836632473; 
 Thu, 24 Oct 2024 23:10:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb45d19d7sm692021fa.96.2024.10.24.23.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 23:10:31 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:10:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <dfaszv64mpxtqnqfulibglshdrtb67fsmj7tqilrrisqq4274j@z7u4qcom77zi>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
 <20241022-a663-gpu-support-v2-4-38da38234697@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-a663-gpu-support-v2-4-38da38234697@quicinc.com>
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

On Tue, Oct 22, 2024 at 03:16:06AM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Enable GPU for sa8775p-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
