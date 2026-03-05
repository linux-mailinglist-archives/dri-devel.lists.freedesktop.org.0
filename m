Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFCMMNaAqWkd9gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:10:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E442126E4
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57A810E1F6;
	Thu,  5 Mar 2026 13:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTdbPUP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EFA10E1F6;
 Thu,  5 Mar 2026 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772716242; x=1804252242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=19ZBJciV/3f34+szOdw3sGUpss6QEDroUKaum5Xvfu4=;
 b=FTdbPUP+qsRR6MmoIdWMhPDv9KmwG/4qJNKvhA+2EgPmg/mxOAvoC3ju
 8hlj/mFQ4euZk8321RmYNAcMTHXUt3laGTM2Nw1MAnPWfKRO5GEZXkQpF
 CkztzAMeRPXZIqQPnVEE+XGSiXuVf8rCuYOK1o6oFTvgR6w61FLfME10+
 qv1FKS4VpvrMVuv7rBVTgf63jE9fGTwRm1YJXRowVFX9Xfw7/wq9cJks2
 vPMkF4XvPKFO174ejxyKqh1pxs+OLgHvQaoJIQyAVJdeLfy9+hwE7BRJg
 lZ0avh7XPQZuWB3coA6q+5RuMhxWQzLf2/MJP7TsXb1/ExlbLZ50lUbG0 w==;
X-CSE-ConnectionGUID: oSMt4KAERkiYzI3I1nPA7g==
X-CSE-MsgGUID: 2HvtY3YqRYSVptTSfX1qHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96418630"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96418630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:10:41 -0800
X-CSE-ConnectionGUID: wZAZ0OQbT4W4Y5r6FuO58g==
X-CSE-MsgGUID: joOIULePT1Cua0T0MZhKzA==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 05:10:38 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/3] Update 'none' recovery method for DRM wedged event
Date: Thu,  5 Mar 2026 18:36:46 +0530
Message-ID: <20260305130720.3685754-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 53E442126E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action

Currently 'none' recovery method for wedged event expects no explicit
recovery from userspace consumer but it expects driver to have reset
the device, which may not always be the case. Update documentation and
log to reflect this expectation.

v2: Rephrase documentation (Rodrigo)

Raag Jadav (3):
  drm/doc: Update documentation for 'none' recovery method
  drm: Update log for 'none' recovery method
  drm/xe: Send 'none' recovery method for
    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET

 Documentation/gpu/drm-uapi.rst | 14 +++++++-------
 drivers/gpu/drm/drm_drv.c      |  2 +-
 drivers/gpu/drm/xe/xe_device.c |  9 ++++++++-
 3 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.43.0

