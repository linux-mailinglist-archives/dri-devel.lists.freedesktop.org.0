Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1271348D466
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCA310FFF2;
	Thu, 13 Jan 2022 09:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADDC10FF98
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 09:44:36 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so18077349pjj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 01:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2XMzbBQjwW2hx/1bJAlmu8DNl3VlCTbTmtTvs1HKdQ=;
 b=sgLoGkz01hpZ513v3xEBTJO4YXazIJg9HYz0Ijw0OtM805EuQ6WfiIaPrI2V8bWfU7
 PaFYOmn54dp/Q/8f0CnUKUvjJVfOyUUBHShabNqZouJ9uXwwqulB4R0VjPW1TZVE3M+z
 xs2QLmJTlimxywzjcMvnCi2QwRVroOd9UM3TTYir5WsFzJFL4r87K/QJCqQx+YoFvYv0
 fiLkmjxy6kyB5Ggr0Q/+HU6YGvCyo+XIeY/tew6H+mWAkiRdPCkyw++dV0oBQ5brIx3g
 V8ZQLdNBc39XZnVIT9DFPKmCtnRjxH6qmAXYfcSCHf7xfiQcvUBWfFcONxdMmnkExODZ
 XGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2XMzbBQjwW2hx/1bJAlmu8DNl3VlCTbTmtTvs1HKdQ=;
 b=rFUw1+kJPFkZYZhV+xBTCx7IMx1NQyAgfK6vsc/aihNrF5bwsXSmmD29Mum0CN0Zh8
 7S6ufZ0uDPdqDmRhiP5oHnGyqke4AfF3sRPNBIttDl+axtlcTqj1B0cf2NM0hhxfqoeB
 Gbos2Jg/dyze5eu/cbHC4gcceLnI3PUQ6ugDaPDW6nIv+sJ7eYK6dWviDM00iMVQPQAz
 l5qMGAiBJlj1A24X2iwVC6ElKvAQb/DYHtt2RB8rg8F7fw480CkMBCDKi9kG1RgycM5H
 7mSTAZIsYE9wiKuiy1DjJC3Qzv7PLsWju3MtXXrTa1hj0U7/DAzDVpSYHRl4/tjOVqQr
 bgcg==
X-Gm-Message-State: AOAM532K9cjbtyF8PpgamyhbqlPtShBxxMeW5mh14QN3cY8w7wuypC6q
 7P/X5HexyFGXkk6CydEpNgqvNffbhjJ2ug4u
X-Google-Smtp-Source: ABdhPJw9HSf4DIolGlkgj/zyF2Kb7dNrSd+8P16LFtdLMslnsz37xKEfwmB+QwE5Eps5KmyIYR3/XA==
X-Received: by 2002:a17:902:9693:b0:149:1ce6:c284 with SMTP id
 n19-20020a170902969300b001491ce6c284mr3900970plp.119.1642067075969; 
 Thu, 13 Jan 2022 01:44:35 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id rm4sm2207154pjb.4.2022.01.13.01.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:44:35 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 0/3] Add support modifiers for drivers whose planes
 only support linear layout
Date: Thu, 13 Jan 2022 18:44:16 +0900
Message-Id: <20220113094419.12433-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers whose planes only support linear layout fb do not support format
modifiers.
These drivers should support modifiers, however the DRM core should handle this
rather than open-coding in every driver.

In this patch series, these drivers expose format modifiers based on the
following suggestion[1].

On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> I think the best way forward here is:
>   - add a new mode_config.cannot_support_modifiers flag, and enable
> this in radeon (plus any other drivers in the same boat)
>   - change drm_universal_plane_init() to advertise the LINEAR modifier
> when NULL is passed as the modifier list (including installing a
> default .format_mod_supported hook)
>   - remove the mode_config.allow_fb_modifiers hook and always
> advertise modifier support, unless
> mode_config.cannot_support_modifiers is set


[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20190509054518.10781-1-etom@igel.co.jp/#24602575


v2:
* rebase to the latest master branch (5.16.0+) + "drm/plane: Make format_mod_supported truly optional" patch [2]
  [2] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3

v1: https://www.spinics.net/lists/dri-devel/msg327352.html
* The initial patch set


Tomohito Esaki (3):
  drm: add support modifiers for drivers whose planes only support
    linear layout
  drm: set fb_modifiers_not_supported flag in legacy drivers
  drm: replace allow_fb_modifiers with fb_modifiers_not_supported

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 ++
 drivers/gpu/drm/drm_framebuffer.c             |  6 ++---
 drivers/gpu/drm/drm_ioctl.c                   |  2 +-
 drivers/gpu/drm/drm_plane.c                   | 22 +++++++++----------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 +++--
 drivers/gpu/drm/radeon/radeon_display.c       |  2 ++
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
 include/drm/drm_mode_config.h                 | 18 +++++----------
 include/drm/drm_plane.h                       |  3 +++
 13 files changed, 40 insertions(+), 33 deletions(-)

-- 
2.25.1

