Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOBbJC8bnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:17:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B35173B38
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B36010E002;
	Mon, 23 Feb 2026 09:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+NJ0f9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387F210E002;
 Mon, 23 Feb 2026 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838251; x=1803374251;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=0VK4EVZXFLjefrMu9t3uUsITlIa2enHw8hOgoelLOrQ=;
 b=h+NJ0f9X8AZYVsiiYBgnEJPIt0am2mUeDE8WFeYAyOI5f3TwbhJ54DXc
 m8NIHbakd6h0kNByU4mWuvYcJwuvZ1ixqZf5Cp6NpsrwtGiNDySJ6Pwfd
 ycnq2UzyDd/9v0r8c1t0b2ydNRh/N7scMhkDjsMf2rp5Cgyl28G3Q8UpW
 akr64ry0bZ0z5v5JoWd3/LGEH+UX9SOKEb7hRCK1awU1EzrfP0tn/b8Pt
 lIH7Xb6HDAtkfN6aBt26ieY03TyQYE0oIXlPUtsVgNJlGQgTsyg+rHo8a
 w9PlbFVW7gCCPLh4+t746hLyqDzuBRK8Asy88+wqkyYVV8PwrWxh4vhIw A==;
X-CSE-ConnectionGUID: nU1c6nMCQmmpL7KbcMLuNw==
X-CSE-MsgGUID: ZPIukUWQRnahU5WdSFevMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76690738"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76690738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:17:31 -0800
X-CSE-ConnectionGUID: O5sPO9vKRaGhyJ7Dp3CTyA==
X-CSE-MsgGUID: mJLFvm63SCCE4IyLeZeJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220048770"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 01:17:25 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
Date: Mon, 23 Feb 2026 14:45:58 +0530
Message-Id: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8anGkC/03OTQqDMBAF4KuUrDslicZoV71HcRGTSR2opiQiL
 eLdG4X+LN9j3scsLGEkTOx8WFjEmRKFMQfBjwdmezPeEMjlgkkuFdeyBjOFgSzYRovCu0JpLFk
 +fkT09Nyla5uzj2GAqY9ofvNK6s98FiCgMo01QrjCqfJC44T3kw3DpvWUphBf+1tzvZmbUHEhm
 69QA4fSdrrj3hiuxJ/Qruv6Btq5CALbAAAA
X-Change-ID: 20250728-atomic-c9713fd357e4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: "Imported from f20260210-atomic-v9-5-525c88fd2402"@intel.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15-dev
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B6B35173B38
X-Rspamd-Action: no action

EDITME: Imported from f20260210-atomic-v9-5-525c88fd2402@intel.com
        Please review before sending.

The series focuses on providing a user readable error value on a failure
in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
cases and it is difficult for the user to decode the error and get to
know the real cause for the error. If user gets to know the reason for
the error then corrective measurements can be taken up.

User will have to check for the capability
DRM_CAP_ATOMIC_ERROR_REPORTING before using this feature so as to ensure
that the driver supports failure reporting.

TODO: driver specific error codes are to be added and will be done in
the follow-up patches.

TODO: Once the series is merged the element 'reserved' used for sending
the failure code in struct drm_mode_atomic is to changed to err_code.

The IGT related changes are pushed for review @
https://patchwork.freedesktop.org/series/153330/

[RFC] changes for libdrm pushed for review @
https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/450

    To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    To: suraj.kandpal@intel.com>
    To: Maxime Ripard <mripard@kernel.org>
    To: Thomas Zimmermann <tzimmermann@suse.de>
    To: David Airlie <airlied@gmail.com>
    To: Simona Vetter <simona@ffwll.ch>
    To: Jani Nikula <jani.nikula@linux.intel.com>
    To: Rodrigo Vivi <rodrigo.vivi@intel.com>
    To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    To: Tvrtko Ursulin <tursulin@ursulin.net>
    To: xaver.hugl@kde.org
    To: harry.wentland@amd.com
    To: uma.shankar@intel.com
    To: louis.chauvet@bootlin.com
    To: naveen1.kumar@intel.com
    To: ramya.krishna.yella@intel.com
    Cc: dri-devel@lists.freedesktop.org
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Changes in v9:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v8: https://lore.kernel.org/r/20260129-atomic-v8-0-4cb7b0faa051@intel.com

---
Arun R Murthy (7):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Call complete_signaling only if prepare_signaling is done
      drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures
      drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING

 drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c            | 89 ++++++++++++++++++++--------
 drivers/gpu/drm/drm_ioctl.c                  |  3 +
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
 include/drm/drm_atomic.h                     | 10 ++++
 include/uapi/drm/drm.h                       |  7 +++
 include/uapi/drm/drm_mode.h                  | 37 ++++++++++++
 7 files changed, 165 insertions(+), 37 deletions(-)
---
base-commit: cec43d5c2696af219fc2ef71dd7e93db48c80f66
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

