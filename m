Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BgHN930imn2OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA68118826
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864C10E506;
	Tue, 10 Feb 2026 09:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cprsbmJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE4A10E516;
 Tue, 10 Feb 2026 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714331; x=1802250331;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=HsGdVKNdc3sY0fKM++CpCtaFS5rlcyLdCfKsMiqFFvs=;
 b=cprsbmJoBRX/eir+YaCeHRMxtH+6+r55XXwnu1e7lHsdJ6MKd7iuiCz0
 Mx3I4E33RCrRvpIY0V6jQzCRNaGwZyKk19f/r0wdhRnSbqi+dEPtjREdS
 96DpR1sE/K0TbZHjWaqqMeDTnZSS2zAZ3ccO7LO07yTjdkol+ULlCFIkI
 KVKTaEPfxTom3lKzP+6HZKpqwa/TxxRkc8lRVK9ahZHKvp6YXmYp3QiHF
 TKKxAcq0vfZxSM/RPqfovGLNfQfBraNKOrbo4hCb0nli1wiGP54kF/SgE
 et93c4r2C/1TmbxXuexq9oYARUR21YKQfjK7Nh60FxI5j+G4l+qyY/osV Q==;
X-CSE-ConnectionGUID: 6aNuHqvTSm+Ccf5KoumLIw==
X-CSE-MsgGUID: TFhaL8evQJ2HzgSavswdeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94479137"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="94479137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:05:30 -0800
X-CSE-ConnectionGUID: 5E3azl7IQ+iFPxiUQVIPNA==
X-CSE-MsgGUID: nIuuk4FXQ36W6DyHkVGeyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242478900"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 01:05:25 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v9 0/7] User readable error codes on atomic_ioctl failure
Date: Tue, 10 Feb 2026 14:33:54 +0530
Message-Id: <20260210-atomic-v9-0-525c88fd2402@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHr0imkC/03OywrDIBCF4VcprjtFTYyxq75HycJ4aQaaWFRCS
 8i71wR6Wf4w52MWklxEl8j5sJDoZkwYphLqeCBm0NPNAdrShFMuqOQt6BxGNGCUZJW3lZCuJuX
 4EZ3H5w5du9I+hhHyEJ3+zRsuP/OZAYNGK6MZs5UV9QWn7O4nE8ZNGzDlEF/7V3O7mZvQUMbVV
 2iBQm162VOvNRXsT+jWdX0DF/SEVdoAAAA=
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 3FA68118826
X-Rspamd-Action: no action

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
      drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
      drm/atomic: Call complete_signaling only if prepare_signaling is done
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
base-commit: 6a3c9a03d943eb112c916c7419a837bc7de3a296
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

