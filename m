Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40F556F63
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 02:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163191135EA;
	Thu, 23 Jun 2022 00:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532B1135ED
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 00:25:43 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id d129so17569923pgc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzh8+fZjM5hPtSMBwoYZp8q7cJJBA1KjGLsk1UEGJzY=;
 b=JeZKCxa6bNzpsmRCpGpgy7EB/22moTTKpfrVHcl/9qlhp/I1SufTP5QykncHgNW9hR
 avenedCjqEyWeq8lKo6Zowji08L4Ek+9niZjCH0F9P3OflsKYnqFT/WrWjb5FjZOb25C
 pH9FQlDVUs5EHyxnSEgE/sKUz80Sk+7gtVR90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzh8+fZjM5hPtSMBwoYZp8q7cJJBA1KjGLsk1UEGJzY=;
 b=qdcQqpk9wvrOsktqQZ4FKadg4NyzV9BFxenNv2NlN3JIyErk1csZE+fo2jVDfFFdky
 8tMp7U/OzvEUSDH+dXNlV9ImybbFK7xlsnBsrTcsg+DrZ7Ep8yBJr7qAGMQ2Nx6o8QzS
 7x2NRCGSQ0xRptiJ1wC1MWqOfA7FNJW3I2UkWtBQKOy29ekBkWr3y0OlJ9shiLNQz63G
 FVld3FgU1hgY9dML00gP62+J7/P0BaoXB51jvWwAtXPsmaHACM+cqWsBW1o/0+M2K1LM
 sQNhJK68guAsbUh+nMOD3oU5McgtVskaidEskKg4mIpAsK9BjvsgpEYPnrN27RsqRAjH
 2JhA==
X-Gm-Message-State: AJIora+CecRvhlTkFZZEH6y3Tpj51xCrXGDydWxTGRi5qE/i8SKwn4ta
 TelVG/ZCO+1W3wvQVFumrGfRRA==
X-Google-Smtp-Source: AGRyM1suCxCy+8DW200CWSyuFAXsy4QJ9tVOXFHRTeywutvEswLKZ/hAgeOYR/sNhbqvBoj6zAIU0A==
X-Received: by 2002:a63:9dc1:0:b0:40b:7771:c2ac with SMTP id
 i184-20020a639dc1000000b0040b7771c2acmr5135253pgd.39.1655943942707; 
 Wed, 22 Jun 2022 17:25:42 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f28c:6f86:743c:1c04])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170903024100b00163fbb1eec5sm13332705plh.229.2022.06.22.17.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 17:25:41 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/dp: More cleanups for force link train
Date: Wed, 22 Jun 2022 17:25:37 -0700
Message-Id: <20220623002540.871994-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches do a little cleanup on the v9 patch[1] from Kuogee.

Changes from v1:
 * Reduce code even more in second patch
 * Pick up tags on first patch

Stephen Boyd (3):
  drm/msm/dp: Reorganize code to avoid forward declaration
  drm/msm/dp: Remove pixel_rate from struct dp_ctrl
  drm/msm/dp: Get rid of dp_ctrl_on_stream_phy_test_report()

 drivers/gpu/drm/msm/dp/dp_ctrl.c | 148 ++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h |   1 -
 2 files changed, 59 insertions(+), 90 deletions(-)

[1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
prerequisite-patch-id: 2fc33a2830ec84d922023fddb585728c48a59525
-- 
https://chromeos.dev

