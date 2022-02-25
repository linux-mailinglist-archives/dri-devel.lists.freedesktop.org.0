Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD664C4AF6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169E310E5FD;
	Fri, 25 Feb 2022 16:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78E510E5C3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 16:37:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79D86B83284;
 Fri, 25 Feb 2022 16:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2B9C340E7;
 Fri, 25 Feb 2022 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645807072;
 bh=dRaPP8U/qTouq/QANC7IxWpVYFkRYB9CeMb80MzSHhk=;
 h=From:To:Cc:Subject:Date:From;
 b=Vf69LTEOSafT8UIUHydSmL5goIF3wOUmpFO31AQYB5oJbw7Rj9odEjyRadWBN6ery
 J2HiB7MOxCc7Bmago6rwxetuKUcBDSX9MqhBdCOCnVpkFTX2vyJsxZ3wnhJTJNhqy5
 mGh+HPKOsbLDLF/8B1AICFiV2CBCjT6VerROgKyK6zYnDtp0yLBuYg7jtkAGvDsFb7
 e4j17/59RU/+XMHpa2tiNV4BhUizfk5OeggdVf+y3dJlYDpKqBvIuEUjB0Rd7U9/hA
 eFO39VhRcyGtqOfRrzIuX85Yj6qU7bAsFyK6u3ouiuDz/50aYfbrSd02VFHTofN4qA
 c6njHZguMFh7A==
From: broonie@kernel.org
To: Dave Airlie <airlied@linux.ie>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Fri, 25 Feb 2022 16:37:47 +0000
Message-Id: <20220225163747.888284-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Guchun Chen <guchun.chen@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leslie Shi <Yuliang.Shi@amd.com>,
 Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

between commit:

  e2b993302f40c ("drm/amdgpu: bypass tiling flag check in virtual display case (v2)")

from the drm-fixes tree and commit:

  2af104290da5e ("drm: introduce fb_modifiers_not_supported flag in mode_config")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index c4387b38229c2,9e5fc4cdb8ec9..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@@ -1141,7 -1148,7 +1148,7 @@@ int amdgpu_display_framebuffer_init(str
  	if (ret)
  		return ret;
  
- 	if (!dev->mode_config.allow_fb_modifiers && !adev->enable_virtual_display) {
 -	if (dev->mode_config.fb_modifiers_not_supported) {
++	if (dev->mode_config.fb_modifiers_not_supported && !adev->enable_virtual_display) {
  		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
  			      "GFX9+ requires FB check based on format modifier\n");
  		ret = check_tiling_flags_gfx6(rfb);
