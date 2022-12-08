Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF46465AB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 01:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8F10E43D;
	Thu,  8 Dec 2022 00:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9510E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 00:08:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h10so22687356ljk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M9RR/O4yQfGfzl6TlQ9lRZSB0qlvvscxICLTLIsSg48=;
 b=PBVhQNapqr4cmLJCdR8D5Sdl5P4/8tpAEwjNuEE2wGLMJ5peKvdtsnI2ivJpl+jHzN
 uAoxNVeQhgeQQTBA/aBhz9f4QhlfikT6pl4uSV3hAGzGhExCpvUGtL6u5REV8z3Lb2uq
 tI1KWLFLs3D+DU6rxTZ4OzZmhMYdcY4PP/lP8wu4LWRECsrgeWDpibMAqu6jyzCGXxhg
 LwhVM7kdLxQvfwv3hVhjqWFyLUO5NwEHexMlipGeU3HwEKQqys+1gd3iqrWz4sdE52lY
 gI0Bxmp/Oo0y+A0qGPanxfFyxueP2buHqVWX7eHOfmCmgMvmX6VaxTrZ2XBrl/dxnTc6
 aG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M9RR/O4yQfGfzl6TlQ9lRZSB0qlvvscxICLTLIsSg48=;
 b=TUSiDmL1C/1Z4NPkIed3+vHU7XDBao9ecG1RY/PNex1GsrYTqa2EgOsfPEAB/rLG5v
 44Ao2+wcypNwOJpTgL7zlzqJSQH/kIhYGGFKXwXwiVjRnvP//M37M6icH7RAcFSRJHpj
 wJW4IO3W4zpZ2wf/3YJiwVKiB00KAqB9qJYJ3z652aJiCvyDDTorxqEh3OpaOoLHmFYA
 H9+KUUfikkk6S8eHn9hVMYjx9/0IjWVTcTWjsqwQpem4G1UbHo+0Vb+1YligoO3gBXZ9
 cz3ABXWS549VQ6ne7tafgNdPTMcxGQy5kcreuNePIYx1D1dOJeE+3qqqL6zDt92a9z9x
 e6xw==
X-Gm-Message-State: ANoB5pmL+9AIUyPWSIPdXm5LRcoBFwWaIKNqp/9TqU/k6k67FqeUVH21
 Fw+D7AyjlCg2rjtcPFn6hoKg7w==
X-Google-Smtp-Source: AA0mqf5f4MwUymkUiV5aW2405ea51sxV7NAFzW4fUh0BO0lImetVwSWSzxgMRYBuksvOy7RXokUYWw==
X-Received: by 2002:a05:651c:50e:b0:277:1c8d:27b9 with SMTP id
 o14-20020a05651c050e00b002771c8d27b9mr25091000ljp.210.1670458131740; 
 Wed, 07 Dec 2022 16:08:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:08:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 0/4] drm/msm/mdss: rework UBWC setup
Date: Thu,  8 Dec 2022 02:08:46 +0200
Message-Id: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
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

The commit 92bab9142456 ("drm/msm: less magic numbers in
msm_mdss_enable") reworked the static UBWC setup to replace magic
numbers with calulating written values from the SoC/device parameters.
This simplified adding new platforms.
However I did not estimate that the values would still be cryptic and
would be C&P-sted instead of being determined from the vendor DT. Some
of the platform (sc8180x) completely missed this setup step.

This series attempts to rework the static UBWC setup to be both
manageable and hopefully easier to write.

The series (being an RFC) depends on three pending platforms series
(sc8280xp, sm8350 and sm8450) with minor fixes applied on top of them
(e.g. to fix the hbb on sm8350).

Dmitry Baryshkov (4):
  drm/msm/mdss: convert UBWC setup to use match data
  drm/msm/mdss: correct the ubwc version for sm6115 platform
  drm/msm/mdss: add data for sc8180xp
  drm/msm/mdss: add the sdm845 data for completeness

 drivers/gpu/drm/msm/msm_mdss.c | 173 ++++++++++++++++++++-------------
 1 file changed, 107 insertions(+), 66 deletions(-)

-- 
2.35.1

