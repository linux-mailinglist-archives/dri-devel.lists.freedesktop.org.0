Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E653916B3A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCA210E69D;
	Tue, 25 Jun 2024 14:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5+zcaIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84DA10E6A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:56:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52bbf73f334so4354554e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327403; x=1719932203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
 b=f5+zcaIgQDhc4aLqEhaLi3nw/10vKa4W3BjhP0CzeBBpwvl/m/+UtY9UfJqQFvaQVb
 bNCPHrJfrufOvZnvZI9fHs5xyCxyCEZy388kMTGCC++Qwm7S6IQSCA0Mo2+3EvMkQmfZ
 3D3l0G4SszCN1YLQNpKWmXTkfwHAnvX7ZJVusrm7K6YepKg9/dxXAqZmExGNue7VLfZA
 qunpazmWyNYLYtZLWuF/2HiIsfu2UAslUVV/XJir0bGswCnocHCg3v8t8rOyFJ9AV4SW
 uL7SlXQlMctMKR5cicqLynEYLdBgZH1P4bLByhM//bnpEgfb2SW7S7lv62Obt7lA9G9m
 MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327403; x=1719932203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
 b=QbeULGSkd1QDwG6j7TvW/EyuhryGkSCGLdTC8oqfE6QlvueoY5qAKxdkW95gFi8oqq
 tpPLJEx3NLOtMj4S7S+4NkHbwvEeIqfmiYWW9jv0xeNw2gnWVlXb2ZDoe9MgLBkfV5NZ
 HnfJX1ngvtleXtRgkLhpTCsqDiAz4FOfl0lolLcksmUbuzjtIOXHYN5vBxbhmk+7H/MD
 p/gXEDWByvO4+mkiR90RDgDemIqEVdB4Fof2XXkBh4GUO8sQ80DjpHmLMJfUqPNUpFM7
 2YmG/XVs+PuHD5JWRvTCZCDJEpNeDgm0/z0+9nG6Roz5c+arruUpzZ8t5QM1tjzQGBz9
 at0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDrTxpYpoOK0vY/6srONWsIZ5gBM7UaQnpCJOkQdE/7AYd9kl2JQHEz5PlpvFzp435XbHc9ImCzoGJ9EOxm+iYbd8qGiCYRO3cFsxnmD63
X-Gm-Message-State: AOJu0YyEIsoCwNLejv8C0uxANoIhZx/zc+p5TKrDWNoPObvmpZwWrpIC
 sESjbevlzf8T5/CMrG61l+sK77YNcPIW5ophtBn0tqpiE6UMjTIlb9gKDGqeNF8=
X-Google-Smtp-Source: AGHT+IFXgEFFBEekYez/olxWlhZlgktM2joEiS7S4E8YauuUuTtTSsmoGuQvl2CGNP1XEWUsmnVA2Q==
X-Received: by 2002:a05:6512:3c82:b0:52c:dbe6:f5f9 with SMTP id
 2adb3069b0e04-52cdf7e6735mr7608853e87.12.1719327401997; 
 Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 0/4] MSM8937 MDP/DSI PHY enablement
Date: Tue, 25 Jun 2024 17:56:39 +0300
Message-Id: <171932736812.1437673.1282826360877883479.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
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


On Sun, 23 Jun 2024 22:30:35 +0200, Barnabás Czémán wrote:
> This patch series adds support for the MDP and DSI PHY as found on the
> MSM8937 platform.
> 
> 

Applied, thanks!

[1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c94dc5feb494
[2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13099cb03f98
[3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/60bdbaaf1220
[4/4] drm/msm/dsi: Add phy configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2df0161959d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
