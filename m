Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6791388F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9E010E10E;
	Sun, 23 Jun 2024 07:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n4awDuwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070F110E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so34880861fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126858; x=1719731658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ao5ztXjHb4LHR9szDgOZeLEhmApDaFHqwxcIBuJSShc=;
 b=n4awDuwVwg3U8+S4OuspcRa0q+BZQBwbLDEYaqKJxlnB2I/Fk+uN4/tO3oOLAxYpoj
 xvdhDdc246LYfHWXagyy6U87ivqQuXVUYmabIPN6rMHP/xHNDPOJ+DJ54WHwP7rv2OOi
 lRAkHSFhlhNNO8omdvTArFWc8nCiMAue4axn9wMtQJihAFARk8cdCiIR63aLtklQtP2t
 dkJI0XMcIh0us5G2OigZXP2YejJoo2J7VYaL5vWiA0vQp3ucQTd4TX9tWmmmi/8ui1Sv
 nIF8OAb9iq7CxTyvHtd3pWuo3zrZOmU1mQUHqFj956IQTEqP6AgdNh3fad+TaVQK7bcr
 y4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126858; x=1719731658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ao5ztXjHb4LHR9szDgOZeLEhmApDaFHqwxcIBuJSShc=;
 b=pqlwmkDHYeuNnR4hSvp9BBGHMJCP9Rm9A4Z/KYeQyV//J8RX9dz3d1ANCyUsSlYKVm
 9b4n30HCvzQ5RCcJU9XRK2gRiagyjq3pOdDdkveu8W96NPf1vP0OHcI2gSH5Rd84c7Wd
 N8zr0RCa1FjpqzleguOinBwgZLtoDI5Vd/BcV8I2F7pVMtE3NcqQoH58OQc7WH85Xq7y
 ljqDgvttZpW3k7SZF+DxyrxQy+u8da+1bIzwEFqrNEdx3qveYbaojGfsed/poR8r/xEd
 JJmdiR4CsdEig9LCo7YWVsKS8HUApx8ReWOUcN/bE3qC69O1HxOh8xJVA2YKoonOowvH
 OPMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzWy9YZJ+XWuTtTVpmUXLDYAtSTsrqJwqhFObk+QWi9u3g0/Nfk9N6Z1/qI34YHC10zaL58sVZe+k5dmD0icw77VBe6zgGjUqltRntifOd
X-Gm-Message-State: AOJu0Yw5gKSKn8vfFzHKQYba+dtSEhny6hOeQlveKTUYSS6kZstrsMT6
 VlOlF0yeNcu9btEXPk2zYglJ5ocZYH0ye94LVEcPG0tn3Fo/1uQCRjVbHs4lleY=
X-Google-Smtp-Source: AGHT+IGMrZ7Ab2hTrpfNCjoKkdN8iqLOosYDf5URywhJ9jd+sUequOrm6k6sz1yM2oRGbSPu4UNvIQ==
X-Received: by 2002:a2e:9dd8:0:b0:2ec:4aac:8fd4 with SMTP id
 38308e7fff4ca-2ec5930fde5mr14912791fa.1.1719126858199; 
 Sun, 23 Jun 2024 00:14:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
Date: Sun, 23 Jun 2024 10:14:11 +0300
Message-Id: <171912674292.840248.16492908228445159189.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
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


On Thu, 09 May 2024 19:52:04 +0200, Barnabás Czémán wrote:
> CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
> so better to skip CTL irq callback register/unregister
> make dpu_ctl_cfg be able to define without intr_start.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: guard ctl irq callback register/unregister
      https://gitlab.freedesktop.org/lumag/msm/-/commit/29cd76c6f897

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
