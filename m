Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2269B9BCD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 02:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6469010E233;
	Sat,  2 Nov 2024 01:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W4l/RreN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E3F10E213
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 01:08:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e690479cso2669583e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730509694; x=1731114494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNi7KL5oTvSaRVd2CVSk0POLJY7+DXarGDd2A7rzOBY=;
 b=W4l/RreNdwoyd8LNlUjBePoEaTs+6bALBt9tPEZgpT4tubbaWhGLBFICXc+CdBEpBQ
 v3PzMOIKZ94FXmmViHzgjm7fcsLat75RnirAM7QCHpNRa5juvRirAEEPFncogw9VEsO8
 zMm7jl5dW6nI31YW64e2Evmj0kikeTm1aDmx6YDJvoFngTDBFInaAB2V/1qJrUQZ0Nuk
 zAT1tm1l5Ljh+0nibcQbGBNUmP5GGyNY4rsMNyg+PhIygo0gYpNwUQJ9LFY3tuSJWhv3
 X27KB4Dh9XdbA98sF6ecaLZKQKAPKGZyBUDQ+PUDQiBMi61g7Uq1El/cgci//8eRZkLR
 U3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730509694; x=1731114494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNi7KL5oTvSaRVd2CVSk0POLJY7+DXarGDd2A7rzOBY=;
 b=V4sEqGh3Vs2Oe3FsSNkDwqkAQWdWZOR3IsLkUVnqzt+X0DtwGujnGsXXeNg31P2nSO
 Q7gSr0m4Bl0zMPvXmp4qtwWwYpFdgqhR1OavasC8Fi2MUHbCdEGboY7dsX5qNeSzj9gg
 H5EMrkEulYVYyNefONAM0wFn6/9wMRW/IHJztezYTiBqlfhM2hGzx37AIFdXchKhRPpu
 X4pSuJFbx3emiDZKm2JqNqAR5ff9PLco2iE6spcxI137fyy8N7y4InPBxTbUcBdbf/Ja
 t1Mm4XX0G3V/HpfNUSQq6HV/co/iU+etHBQ2YHlCT+/7d0R/0EvhSdfInvX0hstWp/Vh
 5brg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXutoEOg9aSSSZkSWlPkwHVrJ0unSg6AS4oWdrmkTc7ToBM7i4vCLC22ppPS5DQ664maOpCzx5B2L4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwYLSOPNNXS9UNfUs2MBem2X/g2VRKq0B1cTLNdyhEIGBvcCaX
 5PuaCeUmq3W6XllHnBRTPAXetSY8GPioA/JE+I7vYGkl9WZ0fgN8mm6OsCS0pH8=
X-Google-Smtp-Source: AGHT+IHM740K9855r2HwwbYCwldEiJj9hjIN3g4eSOoQ52s3xQKsJW/CUnRxXysFTMeDEvNAcLKIsg==
X-Received: by 2002:a05:6512:b98:b0:533:43e2:6ac4 with SMTP id
 2adb3069b0e04-53d65e1730cmr2518003e87.49.1730509693778; 
 Fri, 01 Nov 2024 18:08:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce6b5sm718678e87.122.2024.11.01.18.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 18:08:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/msm/mdss: rework UBWC registers programming
Date: Sat,  2 Nov 2024 03:08:09 +0200
Message-Id: <173050960724.2285086.13238539859529430953.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
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


On Sat, 21 Sep 2024 11:17:28 +0300, Dmitry Baryshkov wrote:
> Current way of programming of the UBWC-related registers has been
> inherited from vendor's drivers. The ubwc_static was supposed to contain
> raw data to be programmed to the hardware, but was later repurposed to
> define of the bits. As it can be seen by the commit 3e30296b374a
> ("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
> gets out of sync.
> 
> [...]

Applied, thanks!

[1/4] drm/msm: move MDSS registers to separate header file
      https://gitlab.freedesktop.org/lumag/msm/-/commit/92de8137d619
[2/4] drm/msm/mdss: use register definitions instead of hand-coding them
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d742f7e06840

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
