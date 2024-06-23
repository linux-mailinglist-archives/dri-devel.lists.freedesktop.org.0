Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F2913897
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD9810E14F;
	Sun, 23 Jun 2024 07:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hHSvCTd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9882510E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so36386301fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126856; x=1719731656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFJAq35jeUfYu0Q755yYYR78x5vyrjKi2e0M/c+GQ0Q=;
 b=hHSvCTd6UHZm4Agvr2HXfNmQTdZPGrm7fJkVgoNLGp38oJH2IluXN+7rZcVYak17nS
 0M71+qQoAQO5WgOtAmftq/y18Kk1Fspti49TV1kbXO90Fi6wUQ4vC79TwmC4xgM3JtPH
 /1NaqrJRCyaFYWV4JTKI/1VdAmLaOICnFBgr5SDhlMig1WuPlvFURTvnxf2j7L0OIp/w
 fgoXQgvQ3MZ/vaMph3lAOMMNM41qI5+blfhC5xjfTyQTWWAiNEQeXCyaKDWK37sVMWYZ
 YkEJcms8DQqy7vI5nyAkhrk8B/7LGc9HlROVdoVciC/SAIhFOoUQMzXydSdkb5SZ/KYO
 /oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126856; x=1719731656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFJAq35jeUfYu0Q755yYYR78x5vyrjKi2e0M/c+GQ0Q=;
 b=Ex/pYCS3zKjL+KBeBqXGHTC4TAuyP8PS9SIA4KW6As7SUGRd5qodgw/mHYylRxAjbX
 Vv+JC5tnHyVPESZjS15RAKtW6uiUIp6G8IPuhZlDWhlAFTB0zi1SCnD1fbj/Rrbr6MjS
 Tuo+1iN/Q6MfIihiWVch2cKa0tZM0BE5OuPMGBmJpHmLqV1wEHFLN7Evf2kKdMMsPVaY
 hSh8AeTHinZF2Q+13ZAqRWLgHbb+EqtL7IdPgTyMutWD0JjQRrLFGhbnTIRUtZ0iqum6
 z9w3CAQB8zm51ZALTZ5zQZKnNSLXYY67d/4Rsk8qeUK9LCdGzDwg7fksopB3IWUp0RSY
 PgFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI8JYXgyPAH7Dh7t+GBpE9VUw/lFejtl/6xhO6kqf6zjlS/yAs2HD2dpN1/9nSLu5U5dxqMxWER6EVLafO2gqhcVO30YIlUhk499q+c6PY
X-Gm-Message-State: AOJu0YwiyNFluKSL2/cALenOOGtxfmbkgMqAfxvNM+LGQ6pRztA6eVEF
 0tkUUTACFEiry8i1/W7zA5fcB+aep01DeM6vVPOaO02u85Ivf7xMiLoMkJmQEEyond3QAvlFBBt
 9wmM=
X-Google-Smtp-Source: AGHT+IEMbjEmaH7+DYR5ilu78Zy766qs3toD5t35p6uDn52e2juXI3EJ3jd+a3h4Ght7Hbsge4I2ag==
X-Received: by 2002:a2e:9f10:0:b0:2eb:fc08:5d83 with SMTP id
 38308e7fff4ca-2ec59389fffmr13590671fa.44.1719126855720; 
 Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/6] Add DSC support to DSI video panel
Date: Sun, 23 Jun 2024 10:14:08 +0300
Message-Id: <171912674298.840248.15697903647146535027.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
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


On Thu, 30 May 2024 13:56:44 +0800, Jun Nie wrote:
> This is follow up update to Jonathan's patch set.
> 
> Changes vs V5:
> - Add hardware version check for compression bit change in cfg2 register
> 
> Changes vs V4:
> - Polish width calculation with helper function
> - Split cfg2 compression bit into another patch
> 
> [...]

Applied, thanks!

[1/6] drm/msm/dpu: fix video mode DSC for DSI
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9ce482d7dc0
[2/6] drm/msm/dpu: adjust data width for widen bus case
      https://gitlab.freedesktop.org/lumag/msm/-/commit/17236bc0ee0a
[3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/063557239c26
[4/6] drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      https://gitlab.freedesktop.org/lumag/msm/-/commit/007870b8eaf5
[5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ecd0ddd223b
[6/6] drm/msm/dsi: add a comment to explain pkt_per_line encoding
      https://gitlab.freedesktop.org/lumag/msm/-/commit/294b38100595

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
