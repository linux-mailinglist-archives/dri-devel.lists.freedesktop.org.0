Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D79806AD4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E341210E6A5;
	Wed,  6 Dec 2023 09:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716910E6B0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:37:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ca1e6a94a4so10031191fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701855450; x=1702460250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ItQcBmsL2r9XZ0WMeX3boO1FbhGGcPGgQWg1e57u90=;
 b=fNnuCt/XXxFcbbgliSVutq4NCq5jPGUm4lJ9dbN2lnjen1cpWp1Ktenqkso2iL01Sa
 wkLI/RfKnqMmTJJ49ljWOlUd2EwtqH+C7WpBM97J1qFHyuh9i/fQxbwW3Q85Jm4zwhgv
 LNh52MVz6ujYLa92UMAP/rqAkaamffSA+q4bDVbNw5VhykURsXj7ZFYM3iDWxK2JcIbY
 vO2hByCSAzVw50f5CX/XAU/YJuKjgakzMv8jvVP8iTH4EJe8Jp9zZISkD1b5UEk2oEEq
 tkidiAYsJGmmVhYY7PBC+cKD0dBciieh8Vz51opTctNisVE9kWP3NPo9ISrI3WOaZK5a
 mWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855450; x=1702460250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ItQcBmsL2r9XZ0WMeX3boO1FbhGGcPGgQWg1e57u90=;
 b=wcDgb1AWbMaFGq+DuEetflrgTWWNNrvx1vJB8Ac3qrrV8UJrQFWAeoatJjRSqWI5Sb
 hbDRxQ356klOvl0yVTat6Be1cmdHb3R6iWheBhjfLawHTSeIJn/VkSMuCKJb1CNuC+jM
 wAHYCPqt7C0bc8FPRB0gChxf8RrHwD1pQltlEJxUMwIMmLCuj8P7VGiXH1pn4MC8J4yv
 nJ6Cz22kzzB4WgJLAcFCGjwJwPZC4OTL7a5uszb2xXGQ7l7Yt/YSUS6NDsCMG6SFfC2u
 WuhzQbETvDCGKnqMq67Wl1Atxy6AlhsUHOjFDtkTO50BNeU9MUR38Ld5ps1eTkJQtb2s
 Bn8A==
X-Gm-Message-State: AOJu0YxZ3CtgTwc/1RJyojAg28H8ESGrj8gj1SF72DElCv0PNvW1B/ZW
 QnfTFVGCKr075wbM0VeRZOO4vA==
X-Google-Smtp-Source: AGHT+IErHnk3T1QVP9AqjVyKJIvrgjfXUiwTq5TMNV8j5mo651YqfQoHFtH/DjPR2zF1KdPul9U2wA==
X-Received: by 2002:a2e:9d8d:0:b0:2c9:f8c2:574f with SMTP id
 c13-20020a2e9d8d000000b002c9f8c2574fmr332537ljj.103.1701855450682; 
 Wed, 06 Dec 2023 01:37:30 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a2e894a000000b002c9fbb50770sm1120102ljk.90.2023.12.06.01.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:37:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: correct clk bit for WB2 block
Date: Wed,  6 Dec 2023 12:37:28 +0300
Message-Id: <170185542751.1626201.5071198750166633593.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
References: <20231203002437.1291595-1-dmitry.baryshkov@linaro.org>
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


On Sun, 03 Dec 2023 03:24:37 +0300, Dmitry Baryshkov wrote:
> On sc7280 there are two clk bits for WB2: vbif_cli and clk_ctrl. While
> programming the VBIF params of WB, the driver should be toggling the
> former bit, while the sc7180_mdp, sc7280_mdp and sm8250_mdp structs
> list the latter one.
> 
> Correct that to ensure proper programming sequence for WB2 on these
> platforms.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: correct clk bit for WB2 block
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e843ca2f30e6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
