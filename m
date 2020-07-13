Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E747021E8F5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4058B6E90A;
	Tue, 14 Jul 2020 07:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F3F6E82A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 22:55:13 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id a14so6620816qvq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 15:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UB04SDsGtdgD9O0BAxZlC5pe+7E+tV+tVdZ5syl+8GE=;
 b=phQ3z4XM879Mg4TOckIPk5Dk89byIXjH5l1Ueod4hxvsspSvQrbYmrKa7jp6giCzjC
 aG0WR8fPrx31wi2pKkzaMt+biVC5PTTZ/BNVEZS86DXTtH1kfAIhUOr/DWnYf1BCxIm+
 XpOeTsFUeut8tBwi4ZyJLjOZi67wtb5RC8Kx41AENk5ZtijKl1JZQOCiOV7bdURhCSTw
 V8NVyPwGqRSChiWgc7qbgDEgMWZTq0oRPnViI9jeuNaLhxTOR0kpbFalWfjZfsLgvDb8
 mC2I2McVH3RcGEM6p+MvTn8iy4xl61VJhjF+5+h7wKlRystzel3ka5+gm+2exuDs93z1
 EJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UB04SDsGtdgD9O0BAxZlC5pe+7E+tV+tVdZ5syl+8GE=;
 b=hdd6J1L4NoPp1QTZoom8SjsvSmTSCLfd6qX/wxTdfoIXZPbfq3WyiSso1nwqXeaDjE
 buU9OUqKGRwCTBjxs0rotrK7jrRUKcF7GtafB6XpPBuCV7RLa2Utm+ROif52zaKC9ccQ
 yjOOoGrA4vIlKdB90tNZHl8pkXXyihMwdQFKTmYSdI+xwPPSSEK9xdaxZIsFLkiCVSdy
 MPWaowuTAObsnP3GBnvhCHzGD/vDgSfKTq6Yxc328Eu2vyjBNIwF3YkVr3XTlcVnph58
 LPjBHMz6X5IQOlL+4/BcdpfeOaQ09j154HvIhgSvINCbJh4VVVhYPwl2pcAHfjGJVlQe
 HRdA==
X-Gm-Message-State: AOAM532tDpqO/6fks78JpTzoD1hunXoz29QbNjr6fbp8al9wgXcNGAKa
 n1HSHPSAJMxJ1C9kd6+hTZr4Nw==
X-Google-Smtp-Source: ABdhPJzT4kWTe7OAToMzZZAU4W5K1Fgae2SY+FVbLq8HcjZ7nDEsaM7430chMTRWXiz9iMYU6zS6fg==
X-Received: by 2002:ad4:48cf:: with SMTP id v15mr1725778qvx.101.1594680912255; 
 Mon, 13 Jul 2020 15:55:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:55:11 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/msm: handle for EPROBE_DEFER for of_icc_get
Date: Mon, 13 Jul 2020 18:53:39 -0400
Message-Id: <20200713225345.20556-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check for errors instead of silently not using icc if the msm driver
probes before the interconnect driver.

Allow ENODATA for ocmem path, as it is optional and this error
is returned when "gfx-mem" path is provided but not "ocmem".

Because msm_gpu_cleanup assumes msm_gpu_init has been called, the icc path
init needs to be after msm_gpu_init for the error path to work.

v2: changed to not only check for EPROBE_DEFER
v3: move icc path init after msm_gpu_init to avoid deleting a WARN_ON
v4: added two patches to fix issues with probe deferring later in v3

Jonathan Marek (3):
  drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init,cleanup}
  drm/msm: reset devfreq freq_table/max_state before devfreq_add_device
  drm/msm: handle for EPROBE_DEFER for of_icc_get

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 68 +++++++++++++++----------
 drivers/gpu/drm/msm/msm_gpu.c           |  4 ++
 2 files changed, 45 insertions(+), 27 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
