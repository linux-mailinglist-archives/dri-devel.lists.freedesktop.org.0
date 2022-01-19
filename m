Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E38C4949DE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8436410E8F2;
	Thu, 20 Jan 2022 08:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F28110EED9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:23:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j2so8898441edj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=3V1hkQQ8p02w19W2KJ4UIkOLnzPRTwmn+qldd2MXUPQ=;
 b=UTo4S6CngQrJK8inLCfGWdWffEF0VzWr1c/MOQ1tFDrsrVrZ2mAB2ipU4q8se7EDgP
 DxrG+gFyvjHymumc0w0C//05G17T8pZn00KF0kHUFN3nScd5YTzTsp0NRNrs3heL5Bvi
 y9yUHhEmCCkO4RvvhAe2HcFBhB746ja7VQVbcwmtCU/SOFj97PFDVCmtw36MYYcibD2l
 veksT8cLoWJVeyInIBAHfIt+ZBYyAP36ijhiDIIFVLjpaiw8DvoQSB9SNqZoAcnTYyok
 0SVy87GQx60xuhIfksZdK6fDIhjU1RPGsKzP6rU4hFH3Msz9Vu8056eqeSAmLWw2S+qj
 92gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3V1hkQQ8p02w19W2KJ4UIkOLnzPRTwmn+qldd2MXUPQ=;
 b=36ad5po+9/G4syJANRoNjodAfXvJRIK1ABue3xdirA0af12nhdUXJnSVSvuiQUcJ5N
 hkYGA0ziIxX8C4Dg1MGMgfLf5iqKXf3ij5O2rDAHuGeNtWGnthEplZt1qP9hxQdEBoLT
 2NhrgEB9e1QtQHGhdnk2GIDjeYCbkCMMDB1sju6w0T5aBpzUFN8xWXrblbQdQhsq/21Y
 /aib+90MlKjyYF8+NPe78Ds3QMOO9SAN2iRPxlkje0tTtjpIGvCOOlEdmKCqVjh1/215
 F5xYubi/KNGzxL4+7qx3hBvOnBH/YRA4TIVAuOHgC061bf87t4tLEG8CG78lb9MfHY9T
 UoLA==
X-Gm-Message-State: AOAM531kFn/zECj1wc5PALcBOETVi7sYAluEwxXiFdZbg5FnmVc8GthF
 753JnTWi/SxgoaxiQk6obmM=
X-Google-Smtp-Source: ABdhPJy2oLLsHT/am6MhkOkALSn5DKiBobM4zLi8a2dn9ReGunq9jvnFMb84OTVkOzMwU3NwADfz7g==
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr23777188ejw.484.1642587819967; 
 Wed, 19 Jan 2022 02:23:39 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
 by smtp.gmail.com with ESMTPSA id b4sm3456546ejb.131.2022.01.19.02.23.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:23:39 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
Date: Wed, 19 Jan 2022 12:23:08 +0200
Message-Id: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tony@atomide.com,
 merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes excessive DMM or CMA usage of GEM buffers leading to
various runtime allocation failures. The series enables daily usage of devices
without exausting limited resources like CMA or DMM space if GPU rendering is
needed.

The first patch doesn't bring any functional changes, it just moves some
TILER/DMM related code to a separate function, to simplify the review of the
next two patches.

The second patch allows off-CPU rendering to non-scanout buffers. Without that
patch, it is basically impossible to use the driver allocated GEM buffers on
OMAP3 for anything else but a basic CPU rendered examples as if we want GPU
rendering, we must allocate buffers as scanout buffers, which are CMA allocated.
CMA soon gets fragmented and we start seeing allocation failures. Such failres
in Xorg cannot be handeled gracefully, so the system is basically unusable.

Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
fragmented with time, leading to allocation failures.

Series were tested on Motolola Droid4 and Nokia N900, with OMAP DDX and
PVR EXA from https://github.com/maemo-leste/xf86-video-omap

Ivaylo Dimitrov (3):
  drm: omapdrm: simplify omap_gem_pin
  drm: omapdrm: Support exporting of non-contiguous GEM BOs
  drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER

 drivers/gpu/drm/omapdrm/omap_gem.c        | 198 +++++++++++++++++-------------
 drivers/gpu/drm/omapdrm/omap_gem.h        |   3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |   5 +-
 3 files changed, 116 insertions(+), 90 deletions(-)

-- 
1.9.1

