Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D8645C8D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 15:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752D10E3BF;
	Wed,  7 Dec 2022 14:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C25610E3BD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 14:28:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p36so24604047lfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+tqHHAIxeFhW3yvZHWiSjK7XfZq54YvDHTiWWGT5vL4=;
 b=oFuG7G2iBGIad6pNguR48DGgTRcMvks3pnZgiixbMzmSQcPtvUFoQRB4TqnDw59cR4
 5nzOIe8tQCuUs99til87rJgQa9roaVLSEOMzemTb0AgKdK6eOR3ddjVuhgZ51kRT0NJO
 GCnskhRkCJqn9qfFn7JpZktD2+L3MhS2ayGow5ttnhHUZzaXjAzEVNsFK+IbTZNghZWx
 NenSn5MJf1L5YNtjwuKz+6OSvjyxu5KUvhebgc/k3syLMfRBDudmkkXd3MyHfAeoBUt6
 WJHH5RsvrxIbJWgGJ69A6bBDEn8AvRVSNrj5Y3SKmElDKKamUXznlhrAYFZw5O/Q1Am7
 adoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+tqHHAIxeFhW3yvZHWiSjK7XfZq54YvDHTiWWGT5vL4=;
 b=Oqca4xxV4XdmVptkuxAvlYepys2foeXiED29Ez8weyeG+XLneTrZMgouoEQxgc1Hsv
 1utQ51ZjqFkB7+knfJk6eI3KcF+EijszjMmionDof6MRlLt9c47Yt2AKhmYZaST8o1Om
 q6FXT3x5QUNjbC/JtfRcfqO+qXhijfQiHP0V9nCI3Ds3axMI7raU7pBPpikf4+R/P/5D
 lDbR/bq2dPVnF4Z1H86hGlgJ8R6GhSE1Zchn00CzxLKqu2uMxa5BTD3o6zsK/MQwINzN
 gGzHN5Ex29i3+DpaR30yKkHNg3pRkzIKuhDrazFRlbIwSgtr1YKRn35Irs15oGrQcSzW
 SgGQ==
X-Gm-Message-State: ANoB5pnYTyHzgGBwMLNGYajPN1RA/i3Nka9xmHbBOyiuL4x0217TY43t
 d2/sgg4msaRkt1n27JG51D2gJQ==
X-Google-Smtp-Source: AA0mqf7GGNT/dLtn+g6Iq6FngOfJZpkZdIi613eu3Q2lGbfEoVEW8h+M04Zc+gpyZjBd2Fvgo4F0nQ==
X-Received: by 2002:a05:6512:c06:b0:4b4:a843:38b3 with SMTP id
 z6-20020a0565120c0600b004b4a84338b3mr26443939lfu.417.1670423315233; 
 Wed, 07 Dec 2022 06:28:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
Date: Wed,  7 Dec 2022 16:28:30 +0200
Message-Id: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several small corrections for the UBWC setup and related data.

Dmitry Baryshkov (3):
  drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
  drm/msm/dpu: correct the UBWC version on sm6115
  drm/msm/dpu: add missing ubwc_swizzle setting to catalog

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.35.1

