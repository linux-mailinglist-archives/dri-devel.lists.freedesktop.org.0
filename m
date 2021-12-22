Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17C47CCA7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 06:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6855E10E42D;
	Wed, 22 Dec 2021 05:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A6110E344
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 05:27:38 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id t19so1314686pfg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 21:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9q1trsl42X2XG3aKGHikEKkUb0EC574TM7EXShQRQcE=;
 b=4kR2BHFtUXwCL5DcgXSXuRhVxvqeUnA6q6mLf3s1u/IfZSeJ57CtUT8ElTNyrWDC5A
 O8xxlScCb7DYJ+cv79NjTfAj/5LTlzHFTTuqluyQo1oToCEg1JiBKOzEWO23jP1yyHVW
 O+ez1E8IjVlIFxARG5meWo3ehA9CUwpjAOp+J5MVEHUxvcOIjH6IvN50ePJ+xGIYeio6
 b4lIfKwYrkPzgOigc5K8VcxRpWZz+oMCzPDlG7B+apdS9VG/jEhfiskVn5xxsd1uyrzv
 aIiOdHJZE+CJ8sE41m+6G7dx9MTevFBb+9uyVe8dAJn1yuVR3TetvxyQObQhlxvdrb+A
 Szxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9q1trsl42X2XG3aKGHikEKkUb0EC574TM7EXShQRQcE=;
 b=ePysvzPhfOMyGwj7IRewn8f/B3uEr94SMIepESBMc7sDtDj8o7DoQZ9lwtin1tH7ZY
 MD6dUjoireAW+VX1Mkn8bNdTDhROtYaRnRxznkzvIkCSXegIi8O0vwUDoDeNcPTMR9g7
 IElTh5krzMDeHmtj2R7RydlKS8l1i5vphESHsKVNfFWsNhfL7Ns/ELzinb2aHuVby5mq
 Vga3B6781hNa96v6yVPh9f0UfExpknIvb3+ghAuvpuZHq0p9zVRU53Nhn5ZpHGlDvw5L
 uH/yXxsoKHOwmI8Ab/lkRsm7O6bKS66gPQLHLw3+xkNyCqIrBhjSaSiZeEqAli+Pzmq9
 w7aQ==
X-Gm-Message-State: AOAM532GEdw1iN8iMfpXonUmCThPrLlEUk/9DluIGxqcxgWpQkP0HZL0
 qpypY2s6GErEFeLEQiPhNMzsHYe1bsFrmuip
X-Google-Smtp-Source: ABdhPJzR9+Nt6GYIKekgjSsIg+Hr4zJi/uXp6MFOIzEbn+Y6xAXUkBAqSDmlpkyMz5zshJTmt75I1w==
X-Received: by 2002:a62:25c3:0:b0:4ba:7afa:3788 with SMTP id
 l186-20020a6225c3000000b004ba7afa3788mr1692806pfl.23.1640150857792; 
 Tue, 21 Dec 2021 21:27:37 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id v63sm737465pgv.71.2021.12.21.21.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 21:27:37 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/3] Add support modifiers for drivers whose planes only
 support linear layout
Date: Wed, 22 Dec 2021 14:27:24 +0900
Message-Id: <20211222052727.19725-1-etom@igel.co.jp>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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


Tomohito Esaki (3):
  drm: add support modifiers for drivers whose planes only support
    linear layout
  drm: set fb_modifiers_not_supported flag in legacy drivers
  drm: replace allow_fb_modifiers with fb_modifiers_not_supported

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 +
 drivers/gpu/drm/drm_framebuffer.c             |  6 +--
 drivers/gpu/drm/drm_ioctl.c                   |  2 +-
 drivers/gpu/drm/drm_plane.c                   | 41 +++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
 drivers/gpu/drm/radeon/radeon_display.c       |  2 +
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
 include/drm/drm_mode_config.h                 | 18 +++-----
 include/drm/drm_plane.h                       |  3 ++
 13 files changed, 54 insertions(+), 38 deletions(-)

-- 
2.17.1
