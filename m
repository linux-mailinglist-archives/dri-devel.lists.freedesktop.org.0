Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D66475FC1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532210F583;
	Wed, 15 Dec 2021 17:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBEE10F583;
 Wed, 15 Dec 2021 17:49:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 r34-20020a17090a43a500b001b0f0837ce8so4973004pjg.2; 
 Wed, 15 Dec 2021 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vhyOznyTV9QH8gu8Nw3UR7ajxbnA0HywYBCbBtVxQk=;
 b=i59SkG8ooA17j7eRaKuGmszLdXRJ9XlkzktXQQ8rUJVbMokJCHfJGPobw/+FEyDSNE
 YLm68+6WfvHEOTZMSg7AlDe1JHUKJDf/zBqyQ9KMNWWCLe9HYYaz98INVs3p7lXWCDIx
 0QaSqVYFpIioR56ieDdVVNLw06V09GTgm/E1vZUH6TWwx1OQ+x8RKHaREef0cS6tyj87
 fKakSIyukuudhrAHmaMUZ139YaCeZu054KLm+Eu74Qw0DGgjqi/a31dHkL+Mr+RMQ7F+
 5IyR4nP2VTXE1tCVczcn1fI8sPn8gGixJVpyZc9LYt6rLnvnvZ1tVlfmPpTnQwVA2Mt7
 gvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vhyOznyTV9QH8gu8Nw3UR7ajxbnA0HywYBCbBtVxQk=;
 b=tYiAvwHaeIq8Hjq/gSBjlodpAxycxrxeqjamx2S4nSafv2jwDoEIeO+4z6fUPPH9+G
 vGRcTkN09DMoE1/DNnrW28X84Yc0K1/jA9QxTd3V9xAXXHrRNTdfi13ichmF9IoiRvKK
 kIFm/QnGDUFomiglYOVJjKL16TFeXJk/PCBQvjh4Y5CYXZA6/07/PhEWH90+N8xCI1+5
 VsEBgkmMw6L8m6bSWp/HJMZgpFvJCExWErNN2KKBOZfdwyLFF+ZMqUwJbe/dXhuywCTe
 f4pMCdeBomt3+caU5r5ohlZA1o95aL+to5uT9giY46Tm42oGobzGqb0Iv0a4IGlP7Gjj
 D5UA==
X-Gm-Message-State: AOAM5334RTo/kqEqQJK7okXX6qHl6/8Ck9DvxhHUG8wm/Po3bhqBng4x
 Q5Bd1v/Z1ndgkOsKtj/X3I5ECQRQ1K4=
X-Google-Smtp-Source: ABdhPJzuJWeHQYluEP13CJGwTN5jzr23DgVNc6T2g1I2OJRc/gv5jplIzA9zmffU4ahOsD85yjjodQ==
X-Received: by 2002:a17:902:a40e:b0:143:ca72:be9d with SMTP id
 p14-20020a170902a40e00b00143ca72be9dmr12356214plq.67.1639590553940; 
 Wed, 15 Dec 2021 09:49:13 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k19sm3318241pff.20.2021.12.15.09.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:49:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm: Add display snapshot debugfs
Date: Wed, 15 Dec 2021 09:45:05 -0800
Message-Id: <20211215174524.1742389-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 linux-arm-msm@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This series adds a "kms" debugfs file to dump display register + atomic
state, which is useful for debugging issues that don't trigger a display
error irq (such as dsi phy misconfiguration).

Rob Clark (3):
  drm/msm/disp: Tweak display snapshot to match gpu snapshot
  drm/msm/disp: Export helper for capturing snapshot
  drm/msm/debugfs: Add display/kms state snapshot

 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 28 +++++--
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 14 +++-
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  9 ++-
 drivers/gpu/drm/msm/msm_debugfs.c             | 75 +++++++++++++++++++
 4 files changed, 114 insertions(+), 12 deletions(-)

-- 
2.33.1

