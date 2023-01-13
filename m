Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E866957B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 12:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519310E110;
	Fri, 13 Jan 2023 11:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB1A10E110;
 Fri, 13 Jan 2023 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OSPymbCZYsfZCcmIqqZlnacZpmVJWES8AOhlHyUMbOw=; b=gOYhUc6EtCg9lFwjySu/5poibW
 +US2j5DjrSbHSNuh1VV0m6EtdK8hykUPreEU1jvt1/f4FHNDOsKn7qz0HLTr3x6J/66/q0YETq74t
 aLNlI9fy7wXY82kpuxssLpcUxzjBQilKkrCZZolh/vIQv7jG0x64KCEwgnTcWShDHxR1PwuHsUcfb
 g/yFOgiKYRCrT9htdG6xdlNx815g/874JeZuiIKH66gQZ3uKHoWSbeiUQ3VRqDOqK7GXtUqpHpKtl
 pmFWH3NRIA5gWXRNa2jUpzCSlx0BCUz+WAlcT2BCiayX6JfH1joxWRbbrEjwi+iMi4bauUvjrBnhm
 ah+peO6w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pGIFR-0075dF-K7; Fri, 13 Jan 2023 12:29:26 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH v2 0/3] Check for valid framebuffer's format
Date: Fri, 13 Jan 2023 08:27:41 -0300
Message-Id: <20230113112743.188486-1-mcanal@igalia.com>
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
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a follow-up of the [1] in which I introduced a check for valid
formats on drm_gem_fb_create(). During the discussion, I realized that would be
a better idea to put the check inside framebuffer_check() so that it wouldn't be
needed to hit any driver-specific code path when the check fails.

Therefore, add the valid format check inside framebuffer_check() and remove the
same check from the drivers, except from i915, because this doesn't work for the
legacy tiling->modifier path. Adding the check to framebuffer_check() will
guarantee that the igt@kms_addfb_basic@addfb25-bad-modifier IGT test passes,
showing the correct behavior of the check.

This patchset was tested on amdgpu and vc4 with the IGT tests.

[1] https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/

---

v1 -> v2: https://lore.kernel.org/dri-devel/20230109105807.18172-1-mcanal@igalia.com/T/

- Don't remove check from i915 driver (Ville Syrjälä)
- Don't unexport drm_any_plane_has_format().

---

Best Regards,
- Maíra Canal

Maíra Canal (3):
  drm/framebuffer: Check for valid formats
  drm/amdgpu: Remove redundant framebuffer format check
  drm/vmwgfx: Remove redundant framebuffer format check

 Documentation/gpu/todo.rst                  |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 10 ----------
 drivers/gpu/drm/drm_framebuffer.c           |  8 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         | 18 ------------------
 4 files changed, 12 insertions(+), 33 deletions(-)

--
2.39.0

