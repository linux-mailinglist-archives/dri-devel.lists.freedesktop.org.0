Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964FC96CD54
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC110E691;
	Thu,  5 Sep 2024 03:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EsSQIivD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1110E649
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:45 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53345dcd377so240280e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507224; x=1726112024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YlSI06JgiII+LEbljNcOEN5o3TgCGGBBtY0a6eABOo=;
 b=EsSQIivDSA9R6NvHP2Gr3rREGpf4shPJPHapdFOKRV46QHRsZjDp2okcBxLQRdOUPz
 QYrvMfE7gG8FLdCyr1j63HT2sWKBE0yX5vAy3qjD9x4vCHz+BTwoyRSxMCFm2pxpDKqo
 dEBkA3ggyumibElcvjiHzyVOHNv8RuuxA8TNUaq2Pr2XwKdMs2te5eJeMlKWPJxLdgiX
 an7vgtNSjc3+KFTVPNx0bGIdHCjGIYY2ZHRNELhQaUmZjZoKjb6vip2XwKukMQaE+ZQW
 d6I1jWNNhERHXexp/GniRvNuSGJVC9K9vo1KI3DLciubmiPydqtkjxTG6jeAjmyoWCFV
 TAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507224; x=1726112024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YlSI06JgiII+LEbljNcOEN5o3TgCGGBBtY0a6eABOo=;
 b=QgKrSDxlNDoNy402Fui2YV9FNUtdW14Rw/HWYYXwgIPYzit9twNYRs964HfA6oAJv1
 sGRiVNoko8TiB2uIP5mzoceNeOpYSIqMnAqXZ6avlNfzmfYCT6rgc+LKNb04w/pXsTPc
 FUm6YY9kYgnpirZPZM6Mfatw6RVxbMNqNPSDvbM0DepReGvv6onuzFrJnlScCmNslz64
 YGZaI0msRjaoA1/p6hL39hg31f35GDWGZ3qY06iaMMp1HbJBEZTGh6MByWi5CRAQ9q6k
 uJhLbPBMvRrpD6HyqbuomBE67HyMVpWl1s4N0MrVZVzCEEx6X0IxYSKuJOX9GEt7GJih
 6OYA==
X-Gm-Message-State: AOJu0Yxp+B/Ahn6x7a7QI5WEIMkVHCbKO8QBUqFAvotgLDJsu/KzaiUu
 IJlkdo+PJQ3YsV3e4C7Xb6wdwQ/TufBd4sotkkn+BVCvX9fbqTI5ncMstg48LOw=
X-Google-Smtp-Source: AGHT+IFdiNBj+ksLwxPJ0vhztLmpIcSqtIaTKRJijHo1cle9Ai37NIz5WdpQOI5G1ytBs0bwWxqFtQ==
X-Received: by 2002:a05:6512:e88:b0:536:53e3:fe9d with SMTP id
 2adb3069b0e04-53653e4015emr59047e87.18.1725507223428; 
 Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, dianders@chromium.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
Date: Thu,  5 Sep 2024 06:33:37 +0300
Message-Id: <172550712141.3299484.16591667475186144206.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
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


On Tue, 30 Jul 2024 12:50:11 -0700, Abhinav Kumar wrote:
> Hardware document indicates that widebus is recommended on DP on all
> MDSS chipsets starting version 5.x.x and above.
> 
> Follow the guideline and mark widebus support on all relevant
> chipsets for DP.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: enable widebus on all relevant chipsets
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c7c412202623

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
