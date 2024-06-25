Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1D916B38
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A344710E6A4;
	Tue, 25 Jun 2024 14:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n5MwYirC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B00210E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:56:43 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52ce09b76e0so2557385e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327401; x=1719932201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
 b=n5MwYirCG2IyHHlrwJ3tTkFN7Gl+GzNqimS6TSv5NVJrrWm0MjSF8dNJr7fct3CkWS
 7apcR1JfUNu5sBPlsWtP73/nSQNTPei/dg0bBP5osh2FLa4QbieFQfA9L+uv4b2+U9aL
 /pMzEf63mwISHIhz88tSupqBQxkskDpqV8QY6QTGtpOEYRVW52M7YKoRFRFRbvBoT8/l
 6UK38EFi5ax/oyTbtVaqRenUZL4RS+t0oI9pdTzV1VQElfj+uaLfXrXJ2WrMyQ6EALiW
 SNcMqpchnqnpn2QQDecLjBNajY9un3xaBgOt5Nf3pfpxjaC2D5IBHnl6HnNgJqvgH9dX
 y5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327401; x=1719932201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
 b=K7XWijJjssKp/fGgTDzyay6U4fXUAqkOz7zsV13+lszuC4685DeczcuM2FvyVvpTHd
 7xMnbv1k3eZQx4KYEZNPn/LPhuawY8ZksyhzqvOOSu6lQ9RhexPiVKtTT5vz4SGBPWs/
 XrzGCQnllTy4SlEWMfyPmTeVGOQQw5RUqcQ/W8afyEaD6Hrslv92ZobhRHWDKqtWuZVK
 j/UsLwMiP3A95R3TrKlTZCCWjfe43tLJBpDmKOHy8smi1cRsSHSpVmoceDaerdgoDT+K
 V3gpfnGnPkRkv5mD1P1caC68stBd0XUHXlKjRYE/wWf1mnerf5SIC70/vo7c73iYKDaD
 +6sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpd8+KuT9VVckw2m13objjEKKq1flRB/M4k0huQ9Vg6QROW5bTwRkvDyU183ZdGjxoE1GzOMKcx0rR+SkOvipjKigRGw8kyiamnZWSOEOO
X-Gm-Message-State: AOJu0YwlyYaxithIMxh9OsFDK0pMF6r4UKFm0ughqmW4SjbM7FoEcCG5
 9BXhwGc4qliRhVJUTbQx6VujC+SlzvPHfqcxc0Dj8PwU5lDsPxKYSArmffzNph8=
X-Google-Smtp-Source: AGHT+IGWSJ98xqTwdcAivnfx2Wmxx9wwkmjEWPIjZM3yst3js43OpqE9GybEuzYV29mv3KYo82eBaA==
X-Received: by 2002:a19:8c58:0:b0:52c:aec9:790a with SMTP id
 2adb3069b0e04-52cfd46b51cmr128113e87.7.1719327401071; 
 Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sireesh Kodali <sireeshkodali1@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
Date: Tue, 25 Jun 2024 17:56:38 +0300
Message-Id: <171932736813.1437673.16795984015504704928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
References: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
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


On Mon, 24 Jun 2024 00:26:01 +0200, Barnabás Czémán wrote:
> Remove MDP_CAP_SRC_SPLIT from msm8x53_config because
> it is not referenced in downstream.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a3a6b350eb6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
