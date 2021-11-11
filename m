Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1644DC13
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 20:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DC46E8EF;
	Thu, 11 Nov 2021 19:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F506E1E0;
 Thu, 11 Nov 2021 19:19:51 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so5189465pju.3; 
 Thu, 11 Nov 2021 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnClQSjEhm/eSZEhg1ceDCJC2RbfYwpO3EmjSoG3eiY=;
 b=iZ28J2QtEw2msl6DLSAVdUtNxIys3SxqnhCyXq6fahn7le6CDS9sArDiDVKVfy9P3A
 oPkDdQWWW8l7yfjQfB8WjT31NomdncUfih8eIhdJDaNKE+YCdYuq/GbPPM7ihk8g1Z/h
 Nf0mBpyNz3XfF8z8JD7u4ReFIJjQEYOVbJBlMYqnbg47AH42cxdfB7GPeveZzPYaBYYg
 E9heRYsoX25eHWEZx3X8KABGrZ1qLjeDRaXmbfs/uRWGLKiXTPk4cZCc+PJ4lxvoCC1t
 rIaL5zM4bjARwcKcXHFz2YOJwMceJfQJuyadlGQSNh/hFle70LQC0bhBfgVMVnbOzhWn
 qNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnClQSjEhm/eSZEhg1ceDCJC2RbfYwpO3EmjSoG3eiY=;
 b=fjJmIqa73TvjprmFv4aJHYQWp4wN9fMPqUqG1G3yTEdBa//SwN7uxrdf2KZKxomN8A
 OUIlKy3gpCfqz04PTfWyE8GBotOVhEbEH0SsTXQSx/JgqSF1ViJj2//dEZpXoS5yVN7K
 /tJe54xRli2AgrWxNcXtPWEfkJKFnek66dlMQZLFPDMmr93zoXimprUEJS4yAgYcM26j
 T17AfaL8qolBSgo3a811z/701mqBLlgUmkih6dXN20ZCPQFZp0WYuPEnI5TdG/JIrF9l
 UVGsCUOcpUWt5QbCdYCGVTkJe15fUJxSRWr9V44ctRSpKIKRbXVsfKrKM5q1jAyRqLsv
 ySCw==
X-Gm-Message-State: AOAM533KeUz41op7p1J0a1Kgcyzr5P29W20YS1Lfhkd7YhglBTjBXlgP
 zx4GdZAK2EVpK1s0IQDdYPz18L3S99U=
X-Google-Smtp-Source: ABdhPJzxwyWl9UV6QH6/mW38wRX+pZlUKYcDNARu6F5mlIBszSzIsI5pOWC6EJQCrYXo0YQR95WKNw==
X-Received: by 2002:a17:90a:ba03:: with SMTP id
 s3mr10906891pjr.116.1636658390904; 
 Thu, 11 Nov 2021 11:19:50 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 fs21sm8193034pjb.1.2021.11.11.11.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 11:19:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: wait_fence fixes
Date: Thu, 11 Nov 2021 11:24:54 -0800
Message-Id: <20211111192457.747899-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A couple of wait_fence related fixes.

Rob Clark (2):
  drm/msm: Fix wait_fence submitqueue leak
  drm/msm: Restore error return on invalid fence

 drivers/gpu/drm/msm/msm_drv.c        | 49 ++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem_submit.c |  1 +
 drivers/gpu/drm/msm/msm_gpu.h        |  3 ++
 3 files changed, 36 insertions(+), 17 deletions(-)

-- 
2.31.1

