Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F096CD51
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A105E10E66B;
	Thu,  5 Sep 2024 03:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cT22g6Od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1EE10E4F8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5334c018913so180461e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507221; x=1726112021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aqec3x8yKQ8GNkqH8zbywynntlgO/egZS4W8KKVbNqw=;
 b=cT22g6Od2gDwFsie3TwrlGvP1IcHJb1ewR6X8lwftkqggMi12Hhe7vQ3Xpnhjw7Qek
 NWD4DChfuGwoQ2vnbNrbRxRg2Gzuk1VXImZmEmnBuUo7khlMKYuBhCDjdFZVarwEZp/Y
 zTaeXKkzh+snVQvmotcXGxU0H6lI2+B2JTSWDRNw6U0CWXU0eC3M8jUtQUDF3zl5f7LL
 70itRSJkR4ouewgse+RX4QPSED0GvIAjDZ3WqNe+C+f7P47kNHW3/n9joJFy6g08D4V9
 p7md5UNw/0RuysrcZtryv10U8MKu295L7sz+bD8E+aXKWFsCA0yOg3Ft6P1c5Wqot9hZ
 lQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507221; x=1726112021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aqec3x8yKQ8GNkqH8zbywynntlgO/egZS4W8KKVbNqw=;
 b=CdyiRy4fL8XGuaXpW0sfQdLUpaYn8GNrywIhzVRpIiYIupIpNwcnMbUZ6BhyTew8Zq
 uu0lqs3MyCj05rol7iNuYpdjAE9wRroEHD2/D1ajSEFN1AD+JNVpJTxayLAcvq5p1RC1
 YK6qzfd+bLpGFYMT4SiqAiq8oMqpg9s+anawxA5s7m1n6yvDdmjxv4xf7czOBg/HS6XE
 rvtyeXLKKNn+JaBv8xiEB/b1UJDJLHqtlK42ddbG0XE3tabaMT+RKXyi7r97x2AyQzxH
 a3fvgCV49DiytyOe3b5QLkMR/pu+wUZ2ybDxkpOr72faWjpJJnUp+9XQHsku3eUOJ9xc
 zJCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIun2keWcLJXqD84J+pp5AgQxQN1aTBNjjxImEPj3OiuTDDvzVoNlst3euEj1exc0DQowBItYj7sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMZIF8tau2jFUJe75VUnzL0D/FJ96OzvUgy2ijdrVIKWsK1FI+
 tC1DChoMJLDs/NoazZ8j8/I2fA4c4yfz1q1sKBpR64bw+kc+O/IDqfc5znBvzLM=
X-Google-Smtp-Source: AGHT+IHwr2P89i+YoHLpfciOuqT/Ni+vf4PPY9+DaJVEGxa0pgv2FB8yOQMf3G/eqwSKdCDS2nyzfg==
X-Received: by 2002:a05:6512:3e0d:b0:52c:f2e0:db23 with SMTP id
 2adb3069b0e04-53546ba07ffmr12737991e87.40.1725507220865; 
 Wed, 04 Sep 2024 20:33:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3] drm/msm/dpu: Configure DP INTF/PHY selector
Date: Thu,  5 Sep 2024 06:33:34 +0300
Message-Id: <172550712143.3299484.13998129049671917393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
References: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
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


On Tue, 25 Jun 2024 23:24:58 +0300, Dmitry Baryshkov wrote:
> Some platforms provides a mechanism for configuring the mapping between
> (one or two) DisplayPort intfs and their PHYs.
> 
> In particular SC8180X requires this to be configured, since on this
> platform there are fewer controllers than PHYs.
> 
> The change implements the logic for optionally configuring which PHY
> each of the DP INTFs should be connected to and marks the SC8180X DPU to
> program 2 entries.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Configure DP INTF/PHY selector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/be3415c620d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
