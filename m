Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD307809895
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDBC10E249;
	Fri,  8 Dec 2023 01:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AA610E248
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:25:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9eca5bbaeso18667551fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701998720; x=1702603520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CUBLaybwTm71uGPidtWtYcj7suB58tDThikG9Ry5Y4U=;
 b=m+0x9NTLvdz4cWvRxM8sOXOcehCyi8RnWqiRXljIV1yxD8Ee9PPkSVTu1zBaf7uFVX
 sNGvfuAuKwypI98D5fEEElhParr3Q8yc8kT9tL2JuXTo5y6oilN+uHN/wHvsT0O4rxVi
 OVUD+MFxhqGIpgqwhjPX+vlO6uEC8fe8mgC117PomzFMjDotR8zsGptlOkD8sFilZYDL
 nhK2+oIJxwVXxQ1d3qBkUO/7RlbBLfFJkneDSTOvywDhOe9DZKcQfgvt8bvJ5u7nfDL8
 kjcYf1PloZ35A6xyZqqAqXiPwfngunD4vZpWBVD4ZiPHZMGSuY51oXahQwsMfm167r/6
 uQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701998720; x=1702603520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CUBLaybwTm71uGPidtWtYcj7suB58tDThikG9Ry5Y4U=;
 b=tGaksrUOPcfvuiozN5MaO9mlT9PrGE6t8tzcCCp76Z1JzM95MaX/5GdfdatVmZdMNq
 mvP0jbmRkwmLCS2pYix8jekM3B80LG+WCF+KRuSNfxXq9dTFvngTMBxNu4uMyjzJWJO7
 bGI+9u+O6e7eiKsZVyWVb1oWT1JDGMIg1MN9HaGHobu4kwZL3HftzZBqt8TSYr8rxOKR
 H2Cx75pWG1OITdJNOMb8FLvLi/0hFPEb9Uu/6obc5puQriv+5EBB5H77NSpOqV2XG81N
 ZfrtNUutLCQwDPU9AzG/5e10v5d/e5ZfTGhGam1dsYr04gEs6157bSNjs+KvBpPWepN2
 yZvA==
X-Gm-Message-State: AOJu0Yz3eqbGydGvjUUWxzPzaAatOyosHI5dRSsJ8IK+L5WpQ5nmyOGW
 uqMrh8fbEJhMtZnYJMm1NEFjoQ==
X-Google-Smtp-Source: AGHT+IF9bDKrRKCba9gxrOM/tv9o1YC1+NYXv7vs1r/qhP8tdOvA0jMXldtsflhEAx2LflOS1OjuMA==
X-Received: by 2002:a05:651c:111:b0:2c9:f427:9e52 with SMTP id
 a17-20020a05651c011100b002c9f4279e52mr1019018ljb.134.1701998720030; 
 Thu, 07 Dec 2023 17:25:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a2ea4ba000000b002c9f58169a8sm88639ljm.120.2023.12.07.17.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:25:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Date: Fri,  8 Dec 2023 04:25:17 +0300
Message-Id: <170199868355.3399536.717291970669174612.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
References: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 06 Dec 2023 15:02:05 +0300, Dan Carpenter wrote:
> The platform_get_irq() function returns negative error codes.  It never
> returns zero.  Fix the check accordingly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: Fix platform_get_irq() check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c4ac0c6c96f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
