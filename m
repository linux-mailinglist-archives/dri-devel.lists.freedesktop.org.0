Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4674EE2D5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E9310E241;
	Thu, 31 Mar 2022 20:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E696B10E241
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:46:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i4so1406583wrb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLF5U2cWj9FuavR+7NTGYpyfmUVdlDamEE34waHYgEM=;
 b=gel/p1tgND9McVJrcI74tTfp5mHz1UGj3XBya3URCHf51Hg6E8e4eW4Z2hzAKHtC9X
 fMM0s3W1TABXk4LR9GOMoJ3fo09fJj8jmJ7OnM0U8CrBbwz/o9RAdUTMAUIerob5kPuV
 tubOkHRDg6Pvb1L96Q5rskCKdh30IuvcyrcHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLF5U2cWj9FuavR+7NTGYpyfmUVdlDamEE34waHYgEM=;
 b=3oAuQtkswqieOoDu8AT63EL5aCI/h81g3tk0Xygpnb2zfy+ZFQ5JA7nyohWl4OwcFj
 WmtjfWUMWUTjxHN5gy4bLbqJwaBWMIsffS1pgyi9mf6BEI2vBgKdYx35xSXEl0nk55CH
 z4u+3uS2EHmAd0cSz2GdudX7Rt75bfreDWX15nhI/+Qk+QCBhjKm2eP6b1k+IrXmOCX1
 iM/32K+jb14JKIWCYzpm4dFbnscb+4e/DJjzK7h5/+2IDLSd3HjUUwcBYNLZ62DWhPH4
 CYWeVt5MNaTUEcYr1OYkBELWTVPoNyPLGIl6ANeW/yvnXsQFtdWGCwxl3zVd8WAGWh4T
 sO5g==
X-Gm-Message-State: AOAM532n4zSVsuvYrC8l0R8OyOTc9MqYukBh1odZ9mIJt1wcUgNokqZx
 ET3YOp9Ys9oGevzn1t/DKLZ6y+3hjJAOIfvO
X-Google-Smtp-Source: ABdhPJwEjPHSy1J2NkwQvcfnEV5rcaTligeojhWuQ1auYtCxWjeEQyouLUhNBalUb0BwQabY7pLiPg==
X-Received: by 2002:a5d:508d:0:b0:203:dac9:d301 with SMTP id
 a13-20020a5d508d000000b00203dac9d301mr5336577wrt.441.1648759615493; 
 Thu, 31 Mar 2022 13:46:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600018af00b002057c72d45fsm480319wri.77.2022.03.31.13.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:46:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] etnaviv drm/sched stragglers
Date: Thu, 31 Mar 2022 22:46:47 +0200
Message-Id: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The only changes compared to the previous version is that the 2nd etnaviv
patch has an improved commit message.

Previous discussion is here:

https://lore.kernel.org/dri-devel/20210706101209.3034092-1-daniel.vetter@ffwll.ch/

Would be great if I can finally stuff these into drm-misc-next together
with the code removal. It's the last driver patches for the drm/sched
dependency tracking conversion.

Thanks, Daniel

Daniel Vetter (4):
  drm/etnaviv: Use scheduler dependency handling
  drm/gem: Delete gem array fencing helpers
  drm/sched: Check locking in drm_sched_job_add_implicit_dependencies
  drm/etnaviv: Don't break exclusive fence ordering

 drivers/gpu/drm/drm_gem.c                    | 80 --------------------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 57 ++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 53 +------------
 drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
 drivers/gpu/drm/scheduler/sched_main.c       |  2 +
 include/drm/drm_gem.h                        |  5 --
 7 files changed, 41 insertions(+), 163 deletions(-)

-- 
2.34.1

