Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41C737870
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 02:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FBC10E38A;
	Wed, 21 Jun 2023 00:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D710E389;
 Wed, 21 Jun 2023 00:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dD+0WX2WV6Iq8HXq3xOanwTmTky971Axctsxt30metE=; b=AFwHoupWdW4Ozmxjp9xj9e/m3t
 XZc6hhXZuz5Fqn+LWY/W1l4/QQ1VyrBkr7VIpCSaHzXE/fdAdnp/75Dn1rn5uAi2Bgg217t9kJ2DL
 DOrVgClp6/5GFX7rbSDkZM5ISxzBF0vSDfhAYDUAX0Pt3oRkdJ24nXyARDkobAwV6t39Qck2p+Vlv
 dVgec97mwUL9tjx6bfBs2i4X+Wimp+yavP138mdogQBNrjjVDKlLy1xgaoFbmzZCBfuZD3MmA75qY
 qBhPdsjj40Yf424y7WVChuNJGMavYTZxlcMpdSp5ieY3WCGOzLFVpsv6BzWR+5Jqqq/F9CARcy+kS
 Pdb6XNGw==;
Received: from [179.113.218.86] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qBmAz-0011pg-Iu; Wed, 21 Jun 2023 02:58:26 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/4] drm: Standardize device reset notification
Date: Tue, 20 Jun 2023 21:57:15 -0300
Message-ID: <20230621005719.836857-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a new version of the documentation for DRM device resets. As I dived
more in the subject, I started to believe that part of the problem was the lack
of a DRM API to get reset information from the driver. With an API, we can
better standardize reset queries, increase common code from both DRM and Mesa,
and make easier to write end-to-end tests.

So this patchset, along with the documentation, comes with a new IOCTL and two
implementations of it for amdgpu and i915 (although just the former was really
tested). This IOCTL uses the "context id" to query reset information, but this
might be not generic enough to be included in a DRM API.  At least for amdgpu,
this information is encapsulated by libdrm so one can't just call the ioctl
directly from the UMD as I was planning to, but a small refactor can be done to
expose the id. Anyway, I'm sharing it as it is to gather feedback if this seems
to work.

The amdgpu and i915 implementations are provided as a mean of testing and as
exemplification, and not as reference code yet, as the goal is more about the
interface itself then the driver parts.

For the documentation itself, after spending some time reading the reset path in
the kernel in Mesa, I decide to rewrite it to better reflect how it works, from
bottom to top.

You can check the userspace side of the IOCLT here:
 Mesa: https://gitlab.freedesktop.org/andrealmeid/mesa/-/commit/cd687b22fb32c21b23596c607003e2a495f465
 libdrm: https://gitlab.freedesktop.org/andrealmeid/libdrm/-/commit/b31e5404893ee9a85d1aa67e81c2f58c1dac3c46

For testing, I use this vulkan app that has an infinity loop in the shader:
https://github.com/andrealmeid/vulkan-triangle-v1

Feedbacks are welcomed!

Thanks,
		André

v2: https://lore.kernel.org/all/20230227204000.56787-1-andrealmeid@igalia.com/
v1: https://lore.kernel.org/all/20230123202646.356592-1-andrealmeid@igalia.com/

André Almeida (4):
  drm/doc: Document DRM device reset expectations
  drm: Create DRM_IOCTL_GET_RESET
  drm/amdgpu: Implement DRM_IOCTL_GET_RESET
  drm/i915: Implement DRM_IOCTL_GET_RESET

 Documentation/gpu/drm-uapi.rst                | 51 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 35 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 12 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  2 +
 drivers/gpu/drm/drm_debugfs.c                 |  2 +
 drivers/gpu/drm/drm_ioctl.c                   | 58 +++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 18 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
 drivers/gpu/drm/i915/i915_driver.c            |  2 +
 include/drm/drm_device.h                      |  3 +
 include/drm/drm_drv.h                         |  3 +
 include/uapi/drm/drm.h                        | 21 +++++++
 include/uapi/drm/drm_mode.h                   | 15 +++++
 17 files changed, 233 insertions(+), 3 deletions(-)

-- 
2.41.0

