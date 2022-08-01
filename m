Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24686586F38
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2EF2AF7A;
	Mon,  1 Aug 2022 17:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9011BA6A;
 Mon,  1 Aug 2022 17:04:28 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso5822059pjf.5; 
 Mon, 01 Aug 2022 10:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=xOX9chVYPROOGAwdmaGgZcPW07GxLyOUqTmIVsiyRrY=;
 b=APqGvEY9aCng9joJBKu4D5mC2tl8a1Y345jPp7UNZbhXrBCzYzipvvUw6DJuz/DyMh
 xUwH38OxWdYI5ubyyM9eYy7A9keEqSdj6kjsrM1r0EO0opDIPanW7or/+pN6ouFdYpeE
 cUg5u+pTWdd7+6lgxaDAeWdasptlCzw/MG+OdazqsPSBJcITD1rGEZ43khcN5DYRdNBc
 mpBZbCLB+Ci36ZBqqwamfhQpbdvIK6X4S77rJX2aagCc76p1sMjOPa+Ms5vR1p1VKdCg
 THWheImhu7rAq+i/2t1MpySjeVhjTTaw0oHSWovn0rE/Yrxe8EwMIJ8mfKpklG2R6+t3
 2BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=xOX9chVYPROOGAwdmaGgZcPW07GxLyOUqTmIVsiyRrY=;
 b=YvzRLULUI67pDm0ECpjna5tYGI6/fiw2XIo/UNLa6Faq0nKRwTsoN8SZsosejwbpv3
 PT5PbwzgRjB6p7VespEuK6qF9WlI3gWtuWmaWBkKzP5eVFUzG/DWieNXNnd44E0xpJJV
 poQZVtJopSxQZA+JdtXIng5s8f5nOr3G6kk0RAkx1R+TfRThhLuBPb+1Mrv5pHzmotrZ
 X9pj2IbJlCfnN2VQT7dECpqwWeFdp2zF0PUvCioNFnX0SH2IsPsqXe6AqDOvHHCErFuK
 uXF9U3s53OGXfH/YElBtEtHUS+rxvzRh4XxCeH+QWIB8mBoLhKWyzTtCVp2APu8bPf5n
 WZgA==
X-Gm-Message-State: ACgBeo13grJ813DgxrkDyP2CPuTbCwf4y19ySYxx51g7lxs7Vqs57q/K
 Wao9S3Wr5E6hSVJ9WfYiCIjr+UKGOnc=
X-Google-Smtp-Source: AA6agR4Wp1sdG2ePJHPzujo2lxC4pM4up8FzRO7eHzEQfmz1DeZIq9jjtKnY1WFOjVr4/m8ni0CLdw==
X-Received: by 2002:a17:902:da91:b0:16d:3bc2:ff49 with SMTP id
 j17-20020a170902da9100b0016d3bc2ff49mr17520540plx.85.1659373466548; 
 Mon, 01 Aug 2022 10:04:26 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a1f4300b001f2e50bd789sm11953200pjy.31.2022.08.01.10.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:04:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] dma-buf: map-info support
Date: Mon,  1 Aug 2022 10:04:54 -0700
Message-Id: <20220801170459.1593706-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

See 1/3 for motivation.

Rob Clark (3):
  dma-buf: Add ioctl to query mmap info
  drm/prime: Wire up mmap_info support
  drm/msm/prime: Add mmap_info support

 drivers/dma-buf/dma-buf.c           | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_prime.c         | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem_prime.c | 11 +++++++++++
 include/drm/drm_drv.h               |  7 +++++++
 include/linux/dma-buf.h             |  7 +++++++
 include/uapi/linux/dma-buf.h        | 28 ++++++++++++++++++++++++++++
 8 files changed, 93 insertions(+)

-- 
2.36.1

