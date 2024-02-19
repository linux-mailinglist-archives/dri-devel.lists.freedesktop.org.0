Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0285A359
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966910E3C7;
	Mon, 19 Feb 2024 12:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JB6R4EJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0384610E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5112bd13a4fso5678861e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345850; x=1708950650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLdl6L9B9xNN7MHktxsnfp97MoBYqe0FWbydEm457Kk=;
 b=JB6R4EJzwBuo1DtXsaevwGvMBkxQssehpwARUdc83cAB5uWVNR+yECV0Ybr8s9+7Xj
 PVdgs3RsVkn5M9z3RGdfcaX6RmFEJvS15iqi6LdLLpNn1KHFJGdZMZME8d+riyLVDOSf
 oHrqySR8cPlKDZYIFmF/tAx2Ya5JTsWys3/8jIXlj/IBnSiR8MdNYhccckoLHpNqwL5W
 /HuE1zHEABBLXIO4x3Q7iP1W+MKoqhf2SdYRutovGp0kncqP9V5Hnsqkm3TRaO5Ik5OA
 23uKp1YXuJ8o53xLPej3eUAKrYolizZ5v4W3So3Fgyq7Q8NJ0o+B/D19bfpKvBcrr24s
 c4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345850; x=1708950650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLdl6L9B9xNN7MHktxsnfp97MoBYqe0FWbydEm457Kk=;
 b=QJpcTSfPIupFUzyD5zlowQWkqewEkqBcFjnhNkqXCsc3zTDuoI644GxoGTSyX4W9qk
 T8S1nCTwBFSWS480DvotvpI4VHtjOpHMN0WeqIXhnDls5J7wicIN+oKS7qzNLIpRd8Xb
 M5TsyB7N7BPa5x1pDN7fLRCRti7H94i0PGDryfP5MBiV+Zxk62wG5jF+KgKR1kPggF2U
 1Lryw+7ztSF+6MQITKRqqdbVLudDma+Kqze+4beQ6ywiH0SbV3oZwTpcjIWIDNlE4a49
 94cweezWoT4urtQxlpYlGfIKlMgJno8Cf1S5lDNH5QxMZli138KClOU2ArTUJtc75cZk
 5M3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmzFIPG5N1XEE5qJ5ZzMnXzf7Bb0gqY+6j1b6xDIMZzqsga++w4/AEC73vZTtZ1BuUApoTe2vcqWw7xYvzR/dAUTwsfVSmd8jJ77CxjlR1
X-Gm-Message-State: AOJu0YyLHxlUMBylEHn/eoSng9UQbU4UmC8DxqoKKp0xuB8E2lOjmr6V
 a/5eojP+42v2e3UfltmYDPE3jGbALbXZJ829sDyI1LpLrQ2pfLI52U9VPSlO3Ag=
X-Google-Smtp-Source: AGHT+IG4n9z+P4jhtHzfI5X+mxNuENsOtOdDiJUHwHqh4kGT2UQhJzmzdXFxjOh2c+QYHhltd7P3mA==
X-Received: by 2002:a05:6512:ba5:b0:512:9b12:bc47 with SMTP id
 b37-20020a0565120ba500b005129b12bc47mr3143954lfv.10.1708345850152; 
 Mon, 19 Feb 2024 04:30:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Date: Mon, 19 Feb 2024 14:30:37 +0200
Message-Id: <170834569502.2610898.13932222713163869175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
References: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
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


On Thu, 08 Feb 2024 17:23:08 +0200, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b56d27ba157

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
