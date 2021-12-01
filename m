Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945B465986
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B736E8B0;
	Wed,  1 Dec 2021 22:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316B66E804
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:51:47 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 207so51120475ljf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LinOAr9WnhpJ24BLrn3sZdZ+0aYn5ScowkAkafZkgzk=;
 b=ThKFwuZSVd3ToYrNMW2WOP+ciG9WzEESvCpyc24L6sS+rc1TU/cLSNuZa+svvHiMlc
 XC7clP0nC7+wcXrGsIOhbEUpWkUI3vSZMWiZZE6h4aBuIdIaDyh9kUMUNUVMJtmp/UIj
 l1LCaOXWiJMFsIcjtetgkk+Dihce/226IbNe+hu1XMYjrF86A1CFEQwhfODXItB2kXBl
 RnaYB8v82bEZbm2pO5YQlFViAx4gwnkId1+6l8wPzqL12ybrMheL7vIHVuEplo09vh6D
 bH390dbHkwmxKskn5rb6vzD1UMEH4UP/GYZScbdDBzWga+t7nPSuhhGwBZgMRxom4fzo
 P3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LinOAr9WnhpJ24BLrn3sZdZ+0aYn5ScowkAkafZkgzk=;
 b=fQewhuMhsuqRDIjrz2W6eT8IwBFzTdocO21ljyFTonBlQLWMuPu6NPrAkL4mhsc/ci
 HapD57kYnZlAorr35zA9EkjisN4cI9/x9hG2bPw4tt07LjxGD2ozCu+o1vdjUEREOsb9
 EjEcVsh8R1XtHZL+eNjWy2wa91vWw18iV8OURYeGc6EmMxBiYfDEUStJ5yU0moK5/SZw
 SQm/+SMgSbU5CAPwfZi3+ftAPICRMsxQ77GVCbW9N4ReQInU+s/BcFF+4XzX5w2G5uWS
 BhD2fvFugl3xWzgBKyzhgSpHts0FcsdndbJSXWk9lJav0wjYnN1V8YFzVFEg1ST5BbQk
 zoLw==
X-Gm-Message-State: AOAM533OOPkBStHJyKbjh8TxW9W5f0jR7ShUYYX5wlbIt4D1FIyNrQiG
 Mv1dif/FtdK3pRjrryr772R1Bw==
X-Google-Smtp-Source: ABdhPJxpgF0FpbJkpPb4j/ZVzSbW14jI2tl4snOtyns43vmJ7g2gYFCde3sVss1YXsc716dBLc/x7w==
X-Received: by 2002:a2e:bf18:: with SMTP id c24mr8456764ljr.408.1638399105575; 
 Wed, 01 Dec 2021 14:51:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:51:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 0/4] drm/msm/dpu: cleanup plane state
Date: Thu,  2 Dec 2021 01:51:36 +0300
Message-Id: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a cleanup part of the DPU multirect patchset [1], split away to
ease review and merging per Abhinav's request.

Changes in v2:
- Drop patches that were accepted
- Removed pe argument from _dpu_hw_sspp_setup_scaler3
- Add CDP setup and DPU_SSPP features checks patches that were left from the previous series

[1] https://lore.kernel.org/linux-arm-msm/20210705012115.4179824-1-dmitry.baryshkov@linaro.org/

The following changes since commit fee32807633395e666f0951d6b7b6546e9b76c3d:

  mailmap: add and update email addresses (2021-11-29 16:19:58 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-cleanup-more

for you to fetch changes up to 5f4622c2324756e942e6e40227997713cdd0a03a:

  drm/msm/dpu: fix CDP setup to account for multirect index (2021-12-02 01:29:18 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dpu: drop scaler config from plane state
      drm/msm/dpu: drop pe argument from _dpu_hw_sspp_setup_scaler3
      drm/msm/dpu: simplify DPU_SSPP features checks
      drm/msm/dpu: fix CDP setup to account for multirect index

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 14 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 22 ++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 64 +++++++++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  6 ---
 4 files changed, 52 insertions(+), 54 deletions(-)


