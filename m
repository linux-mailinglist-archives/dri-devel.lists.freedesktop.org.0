Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A524B9789
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 05:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEAD10E747;
	Thu, 17 Feb 2022 04:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC8E10E796
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 04:16:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu29so7739136lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 20:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=loQg9Lv88UsmY/ReqbxoXCP0a5sJwzcAHa4A0tvMWIs=;
 b=AzFuca5fyFdYdw6eKegri3YbNYkKo9TFBMH08tlGI52ZWeHBe3m0WtmMjkOzo7fH2M
 GtneKaRdUQVuePkl4ZqLFqTN+5BtdGE9lyc9tq+NcwbciJjhcW9FciRpVSdSXAqwpjL5
 T/FX+3TorFhs+7M34ym/rHtn1PWNPGDfp9OfG3TUk6GyUhV9owo9yehPlR3r5F9PYM1F
 oZ8r85FnlxXWRxgghC2IYcKfn3c71EO4qgrkhtqZW8P/cOgpBrI+bPb1A28NYJg5iuzH
 siXGcvYeI+LhQK9kgFRcolK+E5alJ8pfSlx1cjn2lIB7FS4d1ndG0onXCMqrhrYlrx7d
 EREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=loQg9Lv88UsmY/ReqbxoXCP0a5sJwzcAHa4A0tvMWIs=;
 b=ntxRg5a2/2Dts0B39QhltMtCXWEmZC/ri79G0Q+GuEFyMmbv7skmPrsfC688RnhxOe
 4toW2ZgRI29XUPNg+Edv1/88uWsg+PwtLyRsRqLWW741jPsCS1s2Am+d8f/pWg5RhUCw
 hAqvJSVKr5AbZkH5fTji08B5+74lRekJAEnpqMbynUJMjaElhmLScoaqZKeYzIhg1tEU
 JikS12wdIhHAAoIt4dLQSjUsqBZ9HJ4KpLSIm6s7rbjZV4uykVXObT5Afxmpro8JMv4T
 s5h8i81NSwODHfWxMAJNn+MDOQ5yWDpyd8NF1kcrGc0Y/GVjCM7j0mUy5FxcinrW0hEr
 Kzmw==
X-Gm-Message-State: AOAM533HS1bGlcpfs99e7+Uq/QGkkFXhn4HfYLavrdMkxcIz0t/I6Can
 WveHec35o2r4lyOSCkLdDeNqKPGsy8/Tsg==
X-Google-Smtp-Source: ABdhPJzv6IBL1HyDtH61+hP/wrickUo3bZOpYpC+2wKeBUBv/f7w4xTwO5LGAfQpp0lz9BxE1BABVQ==
X-Received: by 2002:a05:6512:3ba2:b0:443:6701:bb04 with SMTP id
 g34-20020a0565123ba200b004436701bb04mr787098lfv.644.1645071379010; 
 Wed, 16 Feb 2022 20:16:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 20:16:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/6] drm/msm/dpu: simplify IRQ helpers
Date: Thu, 17 Feb 2022 07:16:11 +0300
Message-Id: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the second part of
https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.

Changes since v1:
 - Use ARRAY_SIZE() rather INTR_IDX_MAX when clearing irq arrays.

Changes since the original pull request:
 - Split applied patches
 - Add unlikely and WARN_ON in dpu_core_irq_register_callback()
 - Remove extra checks in dpu_core_irq_unregister_callback()
 - Remove unused arguments of dpu_core_irq_unregister_callback()
 - Clean the cb and arg in dpu_core_irq_unregister_callback()
 - Split the last patch. Leave enum dpu_intr_idx intact. Pass irq index,
   callback and data directly to dpu_encoder helpers.

Dmitry Baryshkov (6):
  drm/msm/dpu: remove extra wrappers around dpu_core_irq
  drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
  drm/msm/dpu: allow just single IRQ callback
  drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
  drm/msm/dpu: remove struct dpu_encoder_irq
  drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 112 +++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  43 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  92 +++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  51 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 157 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  53 +++---
 10 files changed, 193 insertions(+), 398 deletions(-)

-- 
2.34.1

