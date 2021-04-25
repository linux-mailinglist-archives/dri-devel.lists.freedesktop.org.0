Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C536A840
	for <lists+dri-devel@lfdr.de>; Sun, 25 Apr 2021 18:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED57C6E115;
	Sun, 25 Apr 2021 16:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE5F6E115
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 16:08:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z13so3598806lft.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BaHT8V/mcxLWOXEuXr0m/0nbRyxmU4/sY+FrvJfYAIc=;
 b=FQ8XwRGmGyroxh5yhIJSc/8pdrugxlFlizTLOSB/tV0/lKxsSpBqvapIvMV6ZvFgWo
 Pq5P4KxsNrfPOSTm7I5M44YCPkl9fcYOhN6zyEsLZ4gK1WQLpsBcnmPkzxiRuUs6QRm4
 KOJgvVmwabWR45Ys47h7Z7hLKLJrqCBPoq/NwCUFc5m+e7eTAQn6ftpi2MzsPP8kjQYe
 zfGBC/jjDq5zIzeNpAG26+Y+EL3CDf+DvLPuXLYk5AgRUdNCMzQeZ3NQzPea+9rv/bbU
 7L5bEbVO7mHjnlm8eaL43V3VWWaHc7SxWy3ZLsahnoc05HhChVceGHAZvQFBOOLOXYsQ
 DyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BaHT8V/mcxLWOXEuXr0m/0nbRyxmU4/sY+FrvJfYAIc=;
 b=jwkbDP9vE0L9Ckvm/v/Nl6G9NLPhCRYdfP3mhRp3zQPVzZFl83w+H77Y/tUMnJuCEf
 6BR1vG39tK87lnsUat5GVmmrBGWEhayifzSJYahsy5fC2AGrWRn7Y4aylxU3BB2E7Qvw
 Is5elJGmWaI/v1hQIwxBcS+rb2mP5dBvIqqldbQJB1s6vz+ae8SpNRKkjnXn8qHlJtzv
 pT0j2K7jxlA4T7SR47ZtHZQwsBUjuAe0OaGh8yu49Y03HhYJISVtiZNvanA+YhaI252s
 ddLkX9BycLkYaVRyYaPHZoZB1WYOFFxtASHVa6pmON8lnvEh7n4w+AkTuEgty4/jcnbD
 gc8A==
X-Gm-Message-State: AOAM533iAzp8b2r4vLBV3v3a9J1Orcm9CDX/Malsbz9IcK3FsvViYgmF
 XwTtJ03e1ULuXoTMTFFDgLAuhw==
X-Google-Smtp-Source: ABdhPJwR0OC3eZ1nEExUdGwKf2C7YlNgI311NFccZuynaT4rpm1HxqkOaitb81JnhFrCBOfwdZTc2Q==
X-Received: by 2002:a19:ec08:: with SMTP id b8mr9714113lfa.149.1619366884485; 
 Sun, 25 Apr 2021 09:08:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l24sm1141575lfc.23.2021.04.25.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 09:08:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 0/2] drm/msm: rework display snapshotting
Date: Sun, 25 Apr 2021 19:07:58 +0300
Message-Id: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
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

Rework display subsystem snapshotting by making msm_disp_state transient
data struct. This simplifies handling of data.

Dependencies:
https://lore.kernel.org/linux-arm-msm/1618606645-19695-1-git-send-email-abhinavk@codeaurora.org/

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm: pass dump state as a function argument
      drm/msm: make msm_disp_state transient data struct

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 87 +++++------------------
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 21 +-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 22 ++----
 drivers/gpu/drm/msm/dp/dp_display.c               |  4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |  4 +-
 drivers/gpu/drm/msm/dsi/dsi.h                     |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                |  6 +-
 drivers/gpu/drm/msm/msm_drv.h                     |  3 +-
 drivers/gpu/drm/msm/msm_kms.h                     |  7 +-
 10 files changed, 41 insertions(+), 122 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
