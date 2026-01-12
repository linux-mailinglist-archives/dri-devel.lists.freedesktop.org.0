Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C193AD1266D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC80610E057;
	Mon, 12 Jan 2026 11:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XZYDmcxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B5710E057
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=27sHMDmpfGqQsPc6WxBMRdbyC7+6TYK9uVyeY/Um67w=; b=XZYDmcxjc/7kX8x8RNaydUAkxP
 Ghg6znIlvG4kbGtBnPKGyX9l/JL7UmjeZDgEq069WheeaFOg3h622JEStBkPkUV63FbNq/1k22wB2
 9ja770XIR+QQqav2MOgB3cgAkY+k/O3N0/Ke9Y3BYzi68UO/xzMFtTseNjHVSPxSJvbN3CGH7IdOr
 ut6JQh0pKWdFdWZ7qjKLjQ9xC7yl7zLQo7RDwCmHknqsHpnPR0r78+W9TAAuOPpJ2S06q3Fb2ZH3F
 XUutTGzay6NIyqHZjgAFans9StpH8nQa779d7vWYZaacDAqBPZjTYRbzxUx9Bol7nywbX+scUe633
 edAejJtQ==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfGTh-004Nyi-I6; Mon, 12 Jan 2026 12:52:57 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
Date: Mon, 12 Jan 2026 08:51:35 -0300
Message-Id: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEfgZGkC/3XMyw7CIBCF4VdpZu2YgRJvK9/DdIEw0klsMaBE0
 /DuYvcu/5Ocb4HMSTjDqVsgcZEscW6hNx240c6BUXxr0KR3pOiIpffo04Ser6+ARmnHjsga66B
 9Holv8l69y9B6lPyM6bPyRf3Wf1JRSEiajHKHfc/GnyXYu9itixMMtdYvJoh+HasAAAA=
X-Change-ID: 20260109-v3d-drm-debug-412cec00a4ac
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pi+tr4udZgGU/e0mXAx67KYp/zubjZMAcKlaX/z/MRM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpZOCVV09+Eqim9T0LlWGHo/8u0O0U5y5I68BBk
 MBP5uMEWBKJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWTglQAKCRA/8w6Kdoj6
 qpowB/47uYMkvhM+cIQqtFgfLZhi//9anmOjXMXwwsHbK+kXNNls8j4bikwI1UOk0PSk4dK9XV4
 ZlUSSaZPsfKzvTmMTQKxO/o9xkq5t+fzp9Rfo/ANOqhDErWo6MxufOQQ257+jPVpQFQkzxMq0b3
 MVD8To1boF2wSjrMCYgVxyNlAGiEuupSp/2WIXz68J1hMyudVsJpHJlKgtRe1Qk/KJOEJRrgrgo
 tnUVlF+AiObpoxOyGeM2qZfrZ31pufgVvj9a5Ey6dkkqwy3JTjT22bll5fD6dPcOEQGPlTSpcUY
 kUjbNSJkyQCRwSaBt93doNJXdtQgz1+1YzTUs7Psjq33s0Hw
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This small series intends to replace the legacy DRM_DEBUG/INFO/WARN/ERROR
logging with the corresponding device-based drm_dbg(), drm_info(), drm_warn()
and drm_err() helpers. I split the series in two patches to ease the
reviewing process as the first one has a minor code-refactor.

Thanks for the review!

Best regards,
- Maíra

---
v1 -> v2:

- [1/2, 2/2] Use the ``struct drm_file *file_priv`` pointer instead of
  passing ``struct v3d_dev`` to functions (Iago Toral)
- [2/2] s/drm_warn/drm_err in ``v3d_reset()`` (Iago Toral)
- Link to v1: https://lore.kernel.org/r/20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com

---
Maíra Canal (2):
      drm/v3d: Consolidate CPU job validation in a function
      drm/v3d: Convert v3d logging to device-based DRM helpers

 drivers/gpu/drm/v3d/v3d_bo.c     |   8 +--
 drivers/gpu/drm/v3d/v3d_drv.c    |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c    |  16 ++---
 drivers/gpu/drm/v3d/v3d_irq.c    |   8 +--
 drivers/gpu/drm/v3d/v3d_mmu.c    |   6 +-
 drivers/gpu/drm/v3d/v3d_sched.c  |   6 +-
 drivers/gpu/drm/v3d/v3d_submit.c | 140 +++++++++++++++++----------------------
 7 files changed, 88 insertions(+), 102 deletions(-)
---
base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
change-id: 20260109-v3d-drm-debug-412cec00a4ac

