Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626B7704DB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E98510E0C5;
	Fri,  4 Aug 2023 15:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728110E729
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so3911426e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163205; x=1691768005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZ+UX1NFwtdq8c+iNmJ6Kjt37lTomrC2VolEknshN2I=;
 b=FbnVAHsKr4U1dcpMmZk1EFlJmERuXHrZkmOGYjmh2gKCAKrRGwLm4ooHJWQlqHYQmo
 6KQqNZvfDMu1RR42234Gn3XodSlUVEvP/reVoUpLvgOKliqyYySYJ5PkgcxXqKgOshio
 UzYD6h+bNfiIAcswQwtwDd3PJhkxGzBUpPVJL6mUekTZUpySWg/AUJT5s5b2gTLsGzqg
 EObkcpIasQXl1TYTSg5zN0ORw8TgMfYNOhAJO4w2YtMl+plcdLMePrYOi2sNJzyshhwL
 1cL9yreZMnSABTA7SfrfMnwky9dv6/6mp6swbzglyC9m+dkzPKTUgLHqbY8los7kuioD
 Vffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163205; x=1691768005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZ+UX1NFwtdq8c+iNmJ6Kjt37lTomrC2VolEknshN2I=;
 b=Ee9aCn2nu/jXseyZOB3uGomCqMJXkkTdWD0F4KS0XBcu23NtFRhnleFPav3w6nCCQG
 MlZG8+sIrlOTqxT9QZ7gZMYLUTUC9tTxY64TckOEzfZhtse2UIfQwlFUp3m858vC1cE2
 x3kjSHA+PMsX9h7dIl7uEmYlZfJibuQ2+QYLxG+Rks40gonsTPx89WCokFtdQf5dvumz
 uxGrg40vA5IIzb7HZxg7HIZN3TEeqBZmVf8S302I5Z5AU6A8CcugakQiG4Y17qm4jEZH
 7mhSCypQZvWsfLF2yX8q3hVHH0aKjJbe1CUaIF0bHN89/d+7iXTn1RAun1qHKags5BUI
 m4NA==
X-Gm-Message-State: AOJu0Ywwc99Paas5OdNbI8DK8u8pVtilLxqEpMGGO9wCuWK5XP+MvFVR
 vTJqICm+6HoldWstokrZfBhzlQ==
X-Google-Smtp-Source: AGHT+IHPMJn8VQ3AtatE6gTGK3ZvQ45T13iV669EXbp2wGSgRQ16VEeobcma+WYpj77O1b8gMGqTwA==
X-Received: by 2002:ac2:48ba:0:b0:4f8:6e52:68ae with SMTP id
 u26-20020ac248ba000000b004f86e5268aemr1457306lfg.31.1691163204836; 
 Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Drop encoder vsync_event
Date: Fri,  4 Aug 2023 18:33:19 +0300
Message-Id: <169116308156.148471.598909628622762541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
References: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 02 Aug 2023 10:01:13 -0700, Jessica Zhang wrote:
> Drop vsync_event and vsync_event_work handlers as they are unnecessary.
> In addition drop the dpu_enc_ktime_template event class as it will be
> unused after the vsync_event handlers are dropped.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Drop encoder vsync_event
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fdcb8fe0c9f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
