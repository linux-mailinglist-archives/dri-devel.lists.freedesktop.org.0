Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7A2FEEAC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF4889F35;
	Thu, 21 Jan 2021 15:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68F89F35
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v15so2148837wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odxLto+pISkZ1ajPqnvVC2hAEO3rkJ9NWwTeX2lhuho=;
 b=LpWlh8xNrRFCa18kJV99zqieLc1yYO7KCH+dxhBCVEmhshNAOMl4fupg+HIGD4PQ3E
 wnIV4xxcYMMxw2j19TJw2wrBDKL7wBGInXWyluKBZdtnFc5b5ledwVyKoRtY8YPfyfxn
 mSQlZAKEsh1ThSOTH0eOmLQEi4Bg+rCbFODmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odxLto+pISkZ1ajPqnvVC2hAEO3rkJ9NWwTeX2lhuho=;
 b=el1GqhpqoHwF6jp9gPNHVroWazjhYr8lTqGi3xpdtk1VjOpQzIIyFotK0qDZTVHNzj
 UQO+HO7EICnPqK6ICWXvKToH/DK8m0596GL5AQdEIv93zZvMCk+AJoRSHdvF8WsZR82+
 wJRyzg+8b98amjtaekkJ/O4EjpvgR7sUdyO9bpQDYN+PRa6icNYfh1bDxsCbWkzcUK6v
 ZxS4ErKLVOGZ+Yc8c4MBYic2Nhm9Xo6QZvNF3eYB2hOJLs1F9NKR1BwCXwbu09Zi6Ww3
 iJDxllaCPRrlt2U6tTQ6P/SjX0IDAK+isZBZB31QyL/pExDq+Ov1aXHuDPEgwaO0hx3N
 ubBQ==
X-Gm-Message-State: AOAM530x5fjK0OktOPp2Ehw6gMvuaQc/aMHlCY7mwL8HEL4oLhQviHGu
 7J+IOxFxihzuE99FAvk2UMi/ksKOdmQ/53D9
X-Google-Smtp-Source: ABdhPJy3qunb2SlEcLcapPMsYbnw3a4zbyabiX4Mxsb5mzlSENaMtLasigG0egMabLN25OrGR9UJ4w==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr2702394wrw.145.1611243005324; 
 Thu, 21 Jan 2021 07:30:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:04 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/11] dma_fence critical sections annotations for atomic
Date: Thu, 21 Jan 2021 16:29:48 +0100
Message-Id: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Finally gotten around to refreshing all the various fence anntotions I've
hast last summer. Or well parts of it:

- entire amdgpu and drm/scheduler annotations postponed for now, because
  there's way too many splats in there that need some work

- in recent patches I've seen quite a few dma_resv_lock or kmalloc in
  atomic_commit_tail, which doesn't work in full generality with the rules
  for dma_fences we've discussed and encoded in lockdep. These annotations
  should catch stuff like this.

Review comments and testing very much welcome.

Cheers, Daniel

Daniel Vetter (11):
  drm/atomic-helper: Add dma-fence annotations
  drm/vkms: Annotate vblank timer
  drm/vblank: Annotate with dma-fence signalling section
  drm/komeda: Annotate dma-fence critical section in commit path
  drm/malidp: Annotate dma-fence critical section in commit path
  drm/atmel: Use drm_atomic_helper_commit
  drm/imx: Annotate dma-fence critical section in commit path
  drm/omapdrm: Annotate dma-fence critical section in commit path
  drm/rcar-du: Annotate dma-fence critical section in commit path
  drm/tegra: Annotate dma-fence critical section in commit path
  drm/tidss: Annotate dma-fence critical section in commit path

 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   3 +
 drivers/gpu/drm/arm/malidp_drv.c              |   3 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 107 +-----------------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |   7 --
 drivers/gpu/drm/drm_atomic_helper.c           |  16 +++
 drivers/gpu/drm/drm_vblank.c                  |   8 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |   2 +
 drivers/gpu/drm/omapdrm/omap_drv.c            |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +
 drivers/gpu/drm/tegra/drm.c                   |   3 +
 drivers/gpu/drm/tidss/tidss_kms.c             |   4 +
 drivers/gpu/drm/vkms/vkms_crtc.c              |   8 +-
 12 files changed, 54 insertions(+), 118 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
