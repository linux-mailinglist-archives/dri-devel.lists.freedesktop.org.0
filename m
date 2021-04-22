Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F93368132
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FF789B9E;
	Thu, 22 Apr 2021 13:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A3589B9E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 13:08:08 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 4so12173924lfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wEnNcZ4YZn2akcChwcsrQFitFibcc6kwO8ISCLJGqG0=;
 b=GKtLLcujei8TL1I3EJdhDRWnqyC1FBYBWcEeYtuWY/CqdDctF6P5guWCKpGI7NLQQk
 Oi6pMXUTrllt/6XzrP6Ae0D5Azi3Aa06ZWjwIVx4qcpuCp7Q1cHVtLntk+vkafrFKKPe
 GFvBrtt7Ph1NrBaqU2LNMhFdrCf6cGcbdhonSoc62Q+6uhl3V4ymjQ8YslEGnd1LKpqk
 b2mV8JwSCkfqL7z/SRi/nRfkKZ5VuN4AQtg99qd/vFQqXRwLxv9ks0qVAgeTKBQtvYW+
 ES0Qj5pFOJCNYna8VT0Bw32TF+aRBX0a/LPVH4eOBmof4ir0RqluZrvDjbn8b/w81DSx
 pEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wEnNcZ4YZn2akcChwcsrQFitFibcc6kwO8ISCLJGqG0=;
 b=bG6UmuFs3LHgnvF376s008YwMTG2r8O4suFjhETkcMGKT6BCc/+L5fZQSDMs2zAsGD
 kbCu7hQJkDfkNPCu+1X46D3vzVITDs4oIlsLoz+vE5vQ2NHa3TYip0zZCD9GjbukZ+qW
 dvOXiStNDEq70ujv2Hd8rA5nI2KkoHsvBEeIaLWMKtzaSLzq58bcCcubzsG9sefsJR1+
 a7V9YeFKaE74Oaa8sqxZFso5qe/GMmUkF0YRPIcLTDH/jih5OZB+dHZsSgPweE/FEREy
 /E/71Zbc7xjkmfEaJWvf2ruY/rckFkR272+XWRYE1tm8eauBtldxMBhqVIhztnd77I0Y
 psOA==
X-Gm-Message-State: AOAM531O6hz7jzfQ4HQeuzfsmZ0K3clgL9y1dWwaTw9FtQGgNnN1W2ZK
 jlLuEg+8jwET0+W1gW7mYNeZhw==
X-Google-Smtp-Source: ABdhPJzGgQFoznmNTBQ9/rQlpMhfABUJv6A8npxZRm6v0OqaCxsaGafnvy+KlHXAz7IUWqpQf1fRzA==
X-Received: by 2002:a05:6512:3a8c:: with SMTP id
 q12mr2534714lfu.129.1619096887234; 
 Thu, 22 Apr 2021 06:08:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v17sm259833lfr.35.2021.04.22.06.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 06:08:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 0/3] drm/msm/dpu: simplify dpu_hw_blk handling
Date: Thu, 22 Apr 2021 16:08:01 +0300
Message-Id: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop most of "extra" features of dpu_hw_blk.

Changes since v1:
 - Make dpu_hw_blk an empty structure
 - Split this into separate patchset

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure

 drivers/gpu/drm/msm/Makefile                    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c      | 139 ------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h      |  22 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     |   7 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c          |   2 +-
 12 files changed, 2 insertions(+), 211 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
