Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458813D5E3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A30B6EC36;
	Thu, 16 Jan 2020 08:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe63.google.com (mail-vs1-xe63.google.com
 [IPv6:2607:f8b0:4864:20::e63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFA56EA9B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 20:57:19 +0000 (UTC)
Received: by mail-vs1-xe63.google.com with SMTP id b79so11307645vsd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHyeBb8P8MuXBOujO8Ub/x9es/mztS5rWLEPJQm2/Ko=;
 b=gemQ994QSr6JkWm5dYBVsYR1LIUE6WIVOW8OxEKlh9bU4AqNaICD0FbZpeOl6z/LAl
 vuC+aCpJJETBjSq2TECPu90Go2szUdkpo1gjupaHPIGJ9ZZooVYxI71Rirzmg6A4bu1L
 C/inqb7wdAsLxPei6JNCqpy1b5SAaEnWS23sMH6VFSBAKedca6LycF29bEiadY3uRsC2
 5pyd9Vh82G2+fmvOBf/aPdjBWU9KkWz+IfbKfdlYWoElECqklH7jr3veHq3W7vdY5cHF
 /ZlDSYv6Igq7WkuojeDl6YSvE69k3n6aCqYrLg13TbuutyCBl5JkOU/tEG1KzumGXC9M
 Tfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHyeBb8P8MuXBOujO8Ub/x9es/mztS5rWLEPJQm2/Ko=;
 b=BFIjAGo0zPpEpSN+bXc4GkBbtL+sgaCs5sb1OQc3dxVjnPAsjGdk8hqlYQiPI3tsVa
 jNMbA2dxV9SFUnWBa6jxa78T+1Sy7TPUycL3aJpbKM946F2CQwvV5y0BtQ/FqlHvFbDb
 6B01jsySvYhf51XntfoWrcdNBgnXaEYBD3rflIp73aXxL7Xh+4lJ3J7ht3lYCAKRWRQx
 VW4/cHE+q+AknSqqq8v1B42AVSz/X4fbjnsL6sUdaqT6T9rxVWXCV8yjxq3EPtZ1M67r
 qR9q4uavEHvV5MOicGJoTVpzqAn+0L4obvwBjWfJI/dsOkzqrc1wdSDCaHBZowM2gsZx
 /J0g==
X-Gm-Message-State: APjAAAVjzWDm/3ShT19ztuwupsgKJlWeP4n2Dl5BnfPilouu1xXwO9H5
 n/z//epoEC0sWOzrQbnumBllA/1CVDawFP+G6qvg4FsL+O7+8w==
X-Google-Smtp-Source: APXvYqwa4eobrkUlejkxbm2vmrBfah47TV7vVGHvbgpZIUMZp/IuDRvCLBzND9WHntaSOfLkMYAbMYa3NIun
X-Received: by 2002:a05:6102:3126:: with SMTP id
 f6mr5458988vsh.204.1579121838618; 
 Wed, 15 Jan 2020 12:57:18 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 12:57:18 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
Date: Wed, 15 Jan 2020 15:56:47 -0500
Message-Id: <20200115205649.12971-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set implements the MSM_WAIT_IOVA ioctl which lets
userspace sleep until the value at a given iova reaches a certain
condition. This is needed in turnip to implement the
VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.

First, we add a GPU-wide wait queue that is signaled on all IRQs.
We can then wait on this wait queue inside MSM_WAIT_IOVA until the
condition is met.

The corresponding merge request in mesa can be found at:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279

Changes in v2:
    * Updated cleanup logic on error
    * Added a mask
    * 32 bit values by default

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
