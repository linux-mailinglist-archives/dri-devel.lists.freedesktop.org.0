Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C63A1EBF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31916E3F0;
	Wed,  9 Jun 2021 21:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD646E405
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:27 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s22so1692676ljg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1zCciPfjCDK0bUeWvLT8irPH+1vMI76gijTtJqkeCmI=;
 b=GVfDi+nc4MLlj3Sz60tReOfY53esc9R2V2jRhO/qAz9R4k+KYqBdF0XMcGDrPTKtsb
 ivin8lKzTX+uNMXGDffbz47CgFqYNlbIpn2gUhx8R/FsqpLn3R2M9g3MFLpOc8+VO2dP
 bCgoUV/yMGUnQYzMkto71dJUM+Oi6VbUAJyxRMuJWNjSz76TgP7YBj//zLlfrKgKp5B/
 RjO00JfdMP5pKe7x8USSN9JG/LwYLgsp1Ro8Bt/3BWoSAiO25NKb0z9ozmqiCakU44H6
 f6gIBrNq7zh5BA4pdso9AyhuTJw7opCMNA7hAb12D9Bq4H4Mo4T4ocfZ8hBaYa4DTpq+
 20sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1zCciPfjCDK0bUeWvLT8irPH+1vMI76gijTtJqkeCmI=;
 b=igfSqsCN+F5U9jN8XJK7s/Ml6pEhv+NsTQVaWgPo7MeBA75r2nRPIfskmeo1gjPcXd
 pxHQ94GhsOXd6sp3cThj5u6wRiTwDySaiUFSb6tdoQg877gvc4PNXWFEn1B/0bIac20J
 0Q+uehNdzQrcRNTwi2BLCXRW8P82fOLwoIB0O9cUkLPUbkIBsLwac1zSHYl24BuwhI3s
 iMovAN66NNvT4hx5nVLkThDfIHqPlVxXOoHn6eUP+JKdaR/P4O3fPR0CMOOoX9P3xVzv
 TH19BOZh9TFXrCS9O43jZrIUoEobPx1tlz5psZuqv2PZWW2jdQAtqUfA/jwotzBdg5VJ
 b4IQ==
X-Gm-Message-State: AOAM532cR98BOX99bPXpJDgnFCcsCG4K0NiKky3Q0awGoOkBwZM4QVTG
 9anOEG1oralhzuQ3EfYp6tzltA==
X-Google-Smtp-Source: ABdhPJzaowpFeTB6zyqZ3x0ByY6vJrI3ahi3dPSYOy105iiVYEhyZ52xnFEfzhLY3p70uniq7bbfbw==
X-Received: by 2002:a05:651c:17a1:: with SMTP id
 bn33mr1268514ljb.275.1623273446021; 
 Wed, 09 Jun 2021 14:17:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [RFC 0/6] drm/msm/dpu: add support for idependent DSI config
Date: Thu, 10 Jun 2021 00:17:17 +0300
Message-Id: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchseries adds support for independent DSI config to DPU1 display
subdriver. This results in ability to drop one of msm_kms_funcs
callbacks.

This code was tested on RB5 (dpu, dsi). Neither DP nor MDP5 changes were
tested (thus the RFC tag).


