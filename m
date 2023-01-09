Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6B662398
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1168F10E069;
	Mon,  9 Jan 2023 11:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC2010E069;
 Mon,  9 Jan 2023 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4XpK5g9Y+kZXQ0GvSITDbVziaqIjnjb+5VEzKLqddBI=; b=X0dVreguSudpyy8HK0/ET0cFb2
 pvxN6Thg/GE7/t7kiK0cIsCAJXzANga+WicZR1EOcXVqSuZJRb1ovLUot/rOm0l2m/tw/WvjDET8n
 zEtFIgJsFF0EF+kOWCbfjIVQYQK0P1z8cNLuq/+4Bpa1D0wzGfmn2xcWOarmx/Zsycwan/8d/b1dl
 94KAPKAmjFTdZQQXjxa3GSgla9JfcVcfRdd1xilv3vxa6Gn+3MFKkm0rlSFYD8XKN17ohFBE1B9vh
 laqFahqDlbss9MNKd4Nk23s0TSLCULI5jxUVgewyNaBzo9+IfjXxqEgxE3KmwIJ6lcPoPbRD/J3kJ
 xdsGfbqA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEpt5-003J8T-6s; Mon, 09 Jan 2023 12:00:19 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH 0/5] Check for valid framebuffer's format
Date: Mon,  9 Jan 2023 07:58:03 -0300
Message-Id: <20230109105807.18172-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a follow-up of [1] in which I introduced a check for valid
formats on drm_gem_fb_create(). During the discussion, I realized that would be
a better idea to put the check inside framebuffer_check() so that it wouldn't
be needed to hit any driver-specific code path when the check fails. Thanks
to Daniel, Simon, Rob and Thomas for the insightful discussion!

Therefore, add the valid format check inside framebuffer_check() and remove
the same check from the drivers. Adding the check to framebuffer_check() will
guarantee that the igt@kms_addfb_basic@addfb25-bad-modifier IGT test passes,
showing the correct behavior of the check.

This patchset was tested on i915, amdgpu, and vc4 with the IGT tests.

[1] https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/

Best Regards,
- Maíra Canal

Maíra Canal (5):
  drm/framebuffer: Check for valid formats
  drm/amdgpu: Remove redundant framebuffer format check
  drm/i915: Remove redundant framebuffer format check
  drm/vmwgfx: Remove redundant framebuffer format check
  drm/plane: Unexport drm_any_plane_has_format()

 Documentation/gpu/todo.rst                  |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 10 ----------
 drivers/gpu/drm/drm_framebuffer.c           |  8 ++++++++
 drivers/gpu/drm/drm_plane.c                 |  1 -
 drivers/gpu/drm/i915/display/intel_fb.c     |  9 ---------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         | 18 ------------------
 6 files changed, 12 insertions(+), 43 deletions(-)

-- 
2.39.0

