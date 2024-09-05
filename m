Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF4A96CD4B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4A810E609;
	Thu,  5 Sep 2024 03:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dEoiYUkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8710E54B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53345dcd377so240252e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507222; x=1726112022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Va0ZWJ42TTaZ++AQ2NJxsBFRYO0sVsQwf03V+3l7Vo=;
 b=dEoiYUkwj/9HCgAasQn99lPJSxNrVCY7yW7DkH+EBDYiUh9abVNrxTN3DhoH+tqP37
 EIuQKxFzIEIMWzPyGeOEwNmF98cTkjnBhy6IaLTfN5h0WsRhduUxmjCyW3p7ry/KT/Zx
 TKaXcaCq+eqzc5PpYILdZHcvhLXc32g9Whq67XsUtz8XorPwBkfg/axsEX8aSw1xA90R
 +IosXgN9pW6cBzUUAgFpsshqmMe6TBqMLZ5vxNbY/UMF3p2oJpdrANAA5jDq+ZdV3nyP
 +MRTab3RO57XJe2xdGgwB5QO8XZROv2J8CutRYDm4qMSNQJfOcbeOmAyDJiiHxtocTph
 9FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507222; x=1726112022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Va0ZWJ42TTaZ++AQ2NJxsBFRYO0sVsQwf03V+3l7Vo=;
 b=XrWIr+wbwbukWAmYiN7pwVeSoej76qZOAS/JL+ZscLcplOw3I58d9exvweebmo6NlL
 rtbbFfkjAh7yzXE7F53lU8eD5XL4knY+UV5fByl+yUtOrmgW4ywLiWx7J0+7fSPpTUwj
 lyQeROyOZD3L87MjUHwgNOQ4E9AkhaJYgBNHblbD213IzV6sn/vfUojeDC7ys1faXyCv
 JHe0+tjLywNW82Njq9XYJ3o8dD+llJUj5ESWrOxHoyjn9dZUDemcMu8cOIa3ehUsR17r
 duQ8Ic5zuSo0F99hpvvsX8fbFCCXMexcbWDedYH5zCd3yGRm8UXNVnLrR9LUS5uo8z/7
 V93A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3nO9YOgRxmtP/ZZQSnCKWJKHjnZT5RTbAc2hz0keutdSiWUA5U7Wq5A8LMTxkUe63WayAlr8Aniw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Y6Rr9O1ELqLOghsAMMJ8taCkJtD60UJU8JQrm28cK1s9a09Q
 eKtkB3dDXL87HOt8l9evJMWjYApUqPwT53J5Yk13nZknkgt36ownS7N16Vd86NQ=
X-Google-Smtp-Source: AGHT+IHDjWmphg9XE/ivcHouG7/jbXrLZyq9A7QTB9S6198sQLS8AtchNk0XKD/0DHxjxPSG+2f3xA==
X-Received: by 2002:a05:6512:3b23:b0:52c:b008:3db8 with SMTP id
 2adb3069b0e04-53546b9405dmr11280075e87.38.1725507221597; 
 Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other
 platforms
Date: Thu,  5 Sep 2024 06:33:35 +0300
Message-Id: <172550712136.3299484.13892510093501197412.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
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


On Sun, 03 Dec 2023 03:31:59 +0300, Dmitry Baryshkov wrote:
> I was not able to test it on my own, this is a call for testing for the
> owners of these platforms. The git version of modetest now fully
> supports writeback.
> 
> Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
> connector, cat /sys/kernel/debug/dri/0/state to determine
> spare CRTC and plane, then run something like:
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: enable writeback on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/47cebb740a83
[2/4] drm/msm/dpu: enable writeback on SC8108X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1f5bcc4316b3
[3/4] drm/msm/dpu: enable writeback on SM6125
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab2b03d73a66
[4/4] drm/msm/dpu: enable writeback on SM6350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/15302579373e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
