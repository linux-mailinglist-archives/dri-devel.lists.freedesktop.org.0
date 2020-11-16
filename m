Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7F2B4DDB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB016E03F;
	Mon, 16 Nov 2020 17:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470476E04A;
 Mon, 16 Nov 2020 17:47:00 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id a18so14851307pfl.3;
 Mon, 16 Nov 2020 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
 b=vWXDOTfl59qP9fxCS19SyQrfmBfDGuSxJsaVaz5eSMb86AZtFklN7A6Zn5DpU2O62M
 z/o81vZvXnRjoqLaklfBDjXWvMIsqijdjhliiP2DH/mnlR1dIhxQBNMgQFl307oQroa7
 qrlWZqgHXNh56cfEOdscvePSzck8kpS4ztlZ/YQ3D9p08q5dIKSqy9Zw4SkM5jZtk2NX
 gfJHMH1DSX/xkJgW0u64M+jdPEvSTEbt6+9VfLD3iOjhFPI7qilId9+q03ZqIQxuVnD7
 lphI90AKiQvVDsX+mRf+DTegxdafRYX6l6nHIQ2p7rxYfLyiMa8bP+5CXzbkxidlTk+g
 k7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
 b=VrD7NL2MftYEZFL6nVcS53T2SIaQrgAGw5AA8r/ue882A02vxLWw6m0x8grvI8Tw7z
 gIVjv7IR8EByOnhtQhj5nThSvQi2Uhh1GfpmbqF+vJLzwidCHzbD59VvJhJjldXOI0W1
 ABTSZHGA406nUOCCElRehxtVl1QzPQlGbfrnvhC4hDTAHcR/ycuekl48RgWgIecR7DcD
 R5L8jZro1qQFGyK/ddRSf02evly+mRyVqQuHDc9n1Od4azQNhgxcDBTXJEvwCLCSddNN
 BioJkedXulPli5MLLEhj8wJgGErbA0gTrlUmBP1ppgcfhs1MsIN5Hz8jndLkJ/Iy9rGV
 jvxw==
X-Gm-Message-State: AOAM533IFzPt0l61mEgmh2d3Rrsodt2ptafzJD3D0Xvnz7qi0mNZppQX
 vibclUjjMVSWhJFBJQ6iEHMNKOn2GHk=
X-Google-Smtp-Source: ABdhPJyeKY5m4SY+1T9gII+E3Bldj7+ODf6BYWuyVbLF75IPQWTx0NuLpLWGPvG4nF8DXKpCoWoR0A==
X-Received: by 2002:a63:5421:: with SMTP id i33mr317880pgb.316.1605548819123; 
 Mon, 16 Nov 2020 09:46:59 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q16sm18422605pff.114.2020.11.16.09.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:46:57 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm: Shrinker fixes and opts
Date: Mon, 16 Nov 2020 09:48:48 -0800
Message-Id: <20201116174851.878426-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The last patch is the main thing, motivated by some cases where we would
spend a lot of time in msm_gem_shrinker_count().  First two are fixes I
noticed along the way.

Rob Clark (3):
  drm/msm: Protect obj->active_count under obj lock
  drm/msm/shrinker: We can vmap shrink active_list too
  drm/msm/shrinker: Only iterate dontneed objs

 drivers/gpu/drm/msm/msm_debugfs.c      |  3 +-
 drivers/gpu/drm/msm/msm_drv.c          |  3 +-
 drivers/gpu/drm/msm/msm_drv.h          |  8 ++--
 drivers/gpu/drm/msm/msm_gem.c          | 45 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem.h          |  5 ++-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 52 +++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gpu.c          | 10 +++--
 7 files changed, 89 insertions(+), 37 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
