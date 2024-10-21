Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D779A67DA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B1C10E4B8;
	Mon, 21 Oct 2024 12:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c3hn7/VD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCED10E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:55 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539f6e1f756so5065608e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513073; x=1730117873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++p6IK2xyUkmxIiDtF8Kg/j4cQViLTJqoFU8d2o1atw=;
 b=c3hn7/VDnLmMTngmJpq2YFhj7mYpEwK5wNdgJck6kbnWnT70OqUYgIri2Qg73Q/KLe
 2ghNOJMJ3Qzptv9ZzAsKFKU1nB+oKvSVdl6pc4bZWktvZgpN3Rgm6LutW9PIs0AT8XRw
 QI6miaXanfSBeIXmJxGnAwvZtWovNc63s3je5phi2b4Nc+AwyYy7VTIsHt3feMJ+cce4
 3VvbXYKgshsYFH3NUdHmt/xeqdZBzcvL64KQHigjz04U8p7uOJYDtibT1iaackuOAs9h
 QiX5a+bAfBpZ9HjH3KtBKf+c1PKWDMYXsZ7PwC6rld0DAbt3MxjPM7u3ZrhsQ7vuopWo
 szPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513073; x=1730117873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++p6IK2xyUkmxIiDtF8Kg/j4cQViLTJqoFU8d2o1atw=;
 b=eAKMsY5ZE+DlRG+IlYd+JOc6q7DV8k7bOcFKOTrH/d1az43lxiVIBU1bYsUBojMRux
 qvfcOd25OqbvTKeDrVOT27EIzPJb9YZrstlVuBP6pFlszXXsJ4UhHAns+65rpkEPwJ3f
 RB2hSKvjNw9bdNU1cKXqbz57GfaCHPUe6t2Hk4uIqcgRQXRYEQT3f+o22EgdiqTLlP+I
 JFAeahrPiN5wevCdGuBKFlAeJyJcfCOCC35btpBSifhdO0BtmrH+fwnpvUUUnZfCLnSm
 c7ZXxEHIRekPG/PK24cFHKy3d/eOLI8/T6D52fsSrtTVMzw+/GeVy+Pi73+v+Gm/7OXm
 jV3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsuuGt9nXUDqElsOq4TyuNTCbmAD7OTMpFnrooNIHWM9jxayjEgrDQdjPrE1FpxHfDGJGiC6FjTYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqWDFzS5w45/u/InNzAcIH76VabqJhE+2VnnSwqBE0IT96X9DA
 U7TI70pZe+ILi4rLoVCcdewr5vogrrne4th1+rI6lo2iky6eCRHYlrnKv9TDx68=
X-Google-Smtp-Source: AGHT+IEaBDgO0bJNd009iFuyYoVj9ZrfomLRDAMi/yxMGgNzbZQlm++57S0iUYR+s+bCy7ZAO9vNng==
X-Received: by 2002:a05:6512:2356:b0:539:e317:b05f with SMTP id
 2adb3069b0e04-53a15229d00mr5612912e87.28.1729513073320; 
 Mon, 21 Oct 2024 05:17:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com,
 quic_bjorande@quicinc.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v5 0/5] Add support for DisplayPort on SA8775P platform
Date: Mon, 21 Oct 2024 15:17:42 +0300
Message-Id: <172950935864.2053501.518573859877352853.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
References: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 18 Oct 2024 12:37:01 +0530, Soutrik Mukhopadhyay wrote:
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> 

Applied, thanks!

[4/5] dt-bindings: display: msm: dp-controller: document SA8775P compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c51ff89a8139
[5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dcb380d19e58

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
