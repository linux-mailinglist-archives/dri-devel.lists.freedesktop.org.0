Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2BC5A92E2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C74D10E663;
	Thu,  1 Sep 2022 09:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DF610E663
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 09:15:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z29so14911145lfb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 02:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zQcaTdcAmFm7hKWlLt7/xAx+RulymiwoxzvlaJ6Dn4Y=;
 b=JqDX3BcBRbEuzqHtzIvmuHl9zsEJNPKE7l/J9hCp3dTmiGTmUGANlkcI61pxniOBiP
 JxczKhAJraORVgVbg3yw8lYcJeaF+LtkllQqtBOPlBYn7TgWtk9L3gidTKpAFvNomSBM
 JaRq7x1SXvS03vxVyCOUvP0ntcSuwyHGmoHeBPnn9h6QpfenpwarKlfdmKqoHb5FTPmh
 HTBBsziaEU8lFuSsw/qnJH7DLsdhFgMSsV8+a9x/uxUOjSo2CPpzL1YcqAZSWr9srsWZ
 i8a332tycHTFY/IoelO9ictoS7XQhRWzEB0x2H8wef6vYxMMHqZQZZLbMIr88GnmRX2Z
 3bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zQcaTdcAmFm7hKWlLt7/xAx+RulymiwoxzvlaJ6Dn4Y=;
 b=aRiiau9SiMkydoyABgXralMLu647JplBxRvVKGussEQDXalF3poa8cYY5tCypSaSxn
 9v3lbH2dhaCMTpAw/g7FlZF5Fl9StE1o2rixyFG5XVqKrHdRYdACTtwbDhhjpIZrBLk+
 ZAePKpvszADlRcrqKC49Pe4yWtXIGGZsF9RCpXWF2Y8Xd/4wVMPDFBv5meI8fZnlmhfB
 MWFUN1aAikFOmqI/RriEg5hLwW5yQGKpk9+N6ZFxvji8kcsnN/AsmmrRJ3kjJWmYbjQV
 gNVp+WRlvf28ts/ML7fsQMioNpYdQ54Dummh9N/mDPlUC4WzlpNIRM8khuuOKN68RPO6
 Lm/w==
X-Gm-Message-State: ACgBeo3wAQ8p+NAJF1UCuqHoHIBpe7II/Rb/sjd27kAidQWwP0c9L0Oj
 OVO+OeJl60gys22eDZj6eBgByg==
X-Google-Smtp-Source: AA6agR5GXLMIEsCjNQLVkedtAe8QPcwwd2ykMWWhZGoYNdvLxKo95u/JLQVVYd6Zn/3caSaICMdj+Q==
X-Received: by 2002:a05:6512:3406:b0:494:9e2a:cbd with SMTP id
 i6-20020a056512340600b004949e2a0cbdmr486161lfr.635.1662023728748; 
 Thu, 01 Sep 2022 02:15:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:15:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Date: Thu,  1 Sep 2022 12:15:24 +0300
Message-Id: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Johan Hovold has reported that returning a probe deferral from the
msm_dp_modeset_init() can cause issues because the IRQ is not freed
properly. This (compile-tested only) series tries to fix the issue by
moving devm_request_irq() to the probe callback.

Dmitry Baryshkov (3):
  drm/msm/dp: fold disable_irq into devm_request_irq
  drm/msm/dp: switch to using platform_get_irq()
  drm/msm/dp: move dp_request_irq() call to dp_display_probe()

 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.35.1

