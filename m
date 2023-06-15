Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8567316AF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6E410E4CB;
	Thu, 15 Jun 2023 11:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434A10E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:40 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b44200367bso11853041fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828698; x=1689420698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5T8GgYIqVudWlnsC3oPDKoAyLE+QLU/Vc0UJQqOQEms=;
 b=asxgBI7ZjmLrmbZmvFQpyF/5eFUTJQWWW7xKqJqFCtjlsV0LV7ZxW7CJ9oqI4vd0oj
 4LPzImZ6wWupg9kgiUwvnSiwoBPIXTKiBAlXZx9T+p+A6Gt2dI9hArmwyNxiZeqpRw22
 QHWN7auMbRPeq3+WXysgOGpLScuvTkMZeJ05E1bEix8FIVKMgOTvVGSEfk0g4JiqnBIN
 RpL64eej6Q3bHM9J85d774/erJNuo6JMCRRf4v6ei65hYaWmxP5QRZfCZVDQ0m8LFEIT
 gVA5mQIlskllXR1VRwp2V/3xjTd6wlPCgqTxGKf/7pgiFUwE+bn39vHttwfqr7toC9wb
 Adsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828698; x=1689420698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5T8GgYIqVudWlnsC3oPDKoAyLE+QLU/Vc0UJQqOQEms=;
 b=hQ//cXESSgxCbEqfJLlQmmhl3vH4LxAKxs4pQJB5jx0Nrw2qHIKRaz0Pj/90+EM30T
 kaFZUMkzW8YXDJtzxrSaW5d64s/M79lIY5CEZaT77ZzZrB7XQ+biz63P8xcTLmdWj1GY
 fPaDvga44B6K5h6xRDlciZU0w4fnMMNmNCqQg7syqvYdYiv22vB+7Z0kT8k+nr6Ck5W1
 4xlymZC5wXd7mEE1h2/PMLpqkz8EXo6onFJ9ztEr752y2NrnePLMU3ExgVx1A6E76ZK9
 bZMwOWFdpf8OuFnjRcNEYAhPjk2tOdE0YlpHNmV9uddBo6+coWIMuakkK9r/tvdg/Hc3
 mvfg==
X-Gm-Message-State: AC+VfDww8DppdKP+JXQxGauTzi1PlW406K7fam9dkNOMGFjwB14bZwu/
 FUSzhvvJOM6mCOgfurhah9mSBfnmTDTPbFHroT4=
X-Google-Smtp-Source: ACHHUZ7anJq5+jo+HNiZTaLF+2RxcGBAkP3TUmnIjwSU0KcnYb1vyWAXaCDG02wduM41vfWbpKYzEQ==
X-Received: by 2002:a2e:3c0a:0:b0:2b1:fcb2:3029 with SMTP id
 j10-20020a2e3c0a000000b002b1fcb23029mr8451714lja.28.1686828698241; 
 Thu, 15 Jun 2023 04:31:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v14 00/10] add DSC 1.2 dpu supports
Date: Thu, 15 Jun 2023 14:31:27 +0300
Message-Id: <168682860387.384026.8615794645993103495.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
References: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 25 May 2023 10:40:48 -0700, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/
> 
> [...]

Applied, thanks!

[06/10] drm/msm/dpu: add support for DSC encoder v1.2 engine
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8c4094b275f6
[09/10] drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0d1b10c63346

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
