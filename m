Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17CF37A87C
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4E76EA3C;
	Tue, 11 May 2021 14:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886C66EA3C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:07:17 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id y9so25282276ljn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZ0fq1XLkr+7t54txjyF+prLq/e+EJtKN2/VBK9RqRA=;
 b=dJURLIRtSfLefeJ0dcskE0iV5FpV6mgBo25GlNtfOZjMliO6zTmKvVZVxFzlsB2bmo
 sUHy6L4LkcEF/kIY/vqeCXUVrkAwKP7ygfYDH/+Mdu5lIKnNlcWGmi7ixgVHk0DKlWLe
 2dYj6GkVqmw1bAI1c7v5rgWLPeEByxLJeZAneZKVPamkqLi/0AfYGIOTGVUWFbyowbzE
 9aLEiH9K0N2+AeJJNWtqu7yJFg2yzHPqsiXSYf+sxkO0NgNgPjB6y5850MMvqYhm9rL2
 qmTLS6hr5ucJzkW8B/pokv0fM9RmOzyIVRnXI0lrwS2bNAgTGUihkOhubKKlfasoBU2L
 bF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZ0fq1XLkr+7t54txjyF+prLq/e+EJtKN2/VBK9RqRA=;
 b=SZk852n1vvGmUxNdklxcO07nENw8WiLmFIe8qnu7IH/ReRzYHtKj+yQt8CiRrB3JtW
 huMmPCabbYya8dXEFMdpXjx9buQoaqnsxID1cgwHyYmCXm676fMgwD2VE9BlfL1Z/UA8
 LsXRNZrT4H+epRDTXaZTN+lMNSMBpsVoJAdQsoW9hdKpUN7RA2C6xB7jotQvHLDKzceG
 1AlDyJ6UM8zZU7+MToI4jDZB8J6nqJx0WA68n7wMPdod04ySOI1QoSjTcj/6dS3zPd2l
 STq78OvkxS3HAUmPMMoJWMr0TTsT/kEK3o6apYXJvIkjan3gqNb9MNHFK4dwRORXBFtP
 3Ldg==
X-Gm-Message-State: AOAM530VclVNpIFsKjGyRweqU+Odu/aDINmCImQXhsO8OcJIk0vUPl+b
 naOQeUC3P+XrKGO5qo7WTuo0sw==
X-Google-Smtp-Source: ABdhPJz9YOOdjQ4oxmJ6lSPtpWVUQ0/h45QufJe3bMsUIvFF+oyfpJ6RYNrR7A6BWcRzy3v8BqdsAg==
X-Received: by 2002:a2e:5045:: with SMTP id v5mr24736463ljd.270.1620742035852; 
 Tue, 11 May 2021 07:07:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w23sm3731989ljw.59.2021.05.11.07.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:07:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 0/2] drm/msm: rework clock handling
Date: Tue, 11 May 2021 17:07:11 +0300
Message-Id: <20210511140713.627291-1-dmitry.baryshkov@linaro.org>
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

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 --------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 ++-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 ++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 ++-
 drivers/gpu/drm/msm/dp/dp_power.c             |  81 ++++++-----
 drivers/gpu/drm/msm/msm_drv.c                 |  49 +++++++
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 14 files changed, 164 insertions(+), 358 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h


