Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48A8106B0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9456F10E14A;
	Wed, 13 Dec 2023 00:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C5310E224
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50be58a751cso7260602e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427856; x=1703032656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcCa5+8uedoJBpp0MnZ9GK2xI8dvU5dB8nGMr3vqEDs=;
 b=DSExdIttHYKJECrhjysGOjeHQSxwxPI1GKNiBc0WU7NnUWEwLZVwVZwvMLK2OhDka5
 xYC2J7GTfYRLvpaOXtlltzylmlmBP9DMH8L+ql72q6oxA8J/Rn/ix0JFvb6yxLeqRnLs
 iPo2XlsTe1GKzmxtRzbHQVXeVyD1zxyKj2YdF7vw+aMcFKhYquhYsBThcAvyHPW7E1do
 AVnGweY0FAE8aq5uxjDNbO7tfk7xazDdP3rL9B7ZgyCtSqXhwzVtXpwocOYaNIaN3gWN
 PT3iqBRZuB3RJZJmDp9OZIflsF+sMsCEHpTJ/517ltAt08CHK8LgU+W1yuXgyh2o9kuN
 KEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427856; x=1703032656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcCa5+8uedoJBpp0MnZ9GK2xI8dvU5dB8nGMr3vqEDs=;
 b=Mu0umtAAYbkJXQd4Se5wunHYMPAbN80cvvx2HEw4iVH4Uzb+tqE1Ye/pAYhv4St1Mz
 zwORqSuffwT0RCy5ZMX6IMLtg6gT5dg+EU0Eq6ufJ3DbsKpgpuyYPe/1XbMSowQa62qK
 ZriUFq+Pmh6CRZcI6y861GwKblgMOuIKlheTjk7zWe56sfq8j/MORwaTpJilRKrz/0Ct
 lp2pjgWrY2s1uQhljocR8cQrk65WzGR4FQLKiENUjeb1QfsSnDu2DsPOgmVb4O6xgwcN
 083bU3FFS4IkoSmZj9LsFxE86qH2XOVYqIK0ASy/MQCOgGltUbwPFGM850ysxuEOQn6D
 8CHA==
X-Gm-Message-State: AOJu0YxjAvVGneCG6O4lVAHQzq7ZJVno1sFwzMotR61Zth4rxYbsIHwE
 RbeXg57JurTQbdLE74mePZejlQ==
X-Google-Smtp-Source: AGHT+IE+GQRoA1ZiyYAq2jc8Dda0H7QIS0w/1Sgg45+lga/dxNeYCdMHKNs0gNMWttXKUS5dDgrAcQ==
X-Received: by 2002:ac2:5585:0:b0:50b:e635:be52 with SMTP id
 v5-20020ac25585000000b0050be635be52mr2676783lfg.78.1702427856319; 
 Tue, 12 Dec 2023 16:37:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the
 error path
Date: Wed, 13 Dec 2023 02:37:29 +0200
Message-Id: <170242755503.12964.6049183129158135242.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
References: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 11 Dec 2023 17:54:40 +0300, Dmitry Baryshkov wrote:
> The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
> we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
> will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
> extra drm_encoder_cleanup() calls.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: remove extra drm_encoder_cleanup from the error path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/014a07f72a33

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
