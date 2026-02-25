Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ExsNd/onmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:19:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5441197294
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7069C10E759;
	Wed, 25 Feb 2026 12:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qyJLVtge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1E510E757;
 Wed, 25 Feb 2026 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aunw5icFOxTB61VohHUgKRv6P4Oh1HRLFFxtnYUuUcw=; b=qyJLVtgedt3vFktfRKVUvL1Ppd
 MVP3Sltv+fwwfOXu2DdNcxLJotXnjlNLAid9mfNjMb2rgvsYBS3ZY1IMB3AVAcv805p5jfyhsbFnH
 m9O/jUL1LvhRZFm1Xn53G6j1ndpInYGY8O9hhwrHj/MP8AIiPHS7adPsYeMxBYBu56oy3Yyy/pApt
 kUbVyviyaFhov63fC3epFkWSMhDG80S7Z+Fe9qpXnqRhtzAGbjXGKywXyPte2Ct/aW11HNQp1a0n2
 M1Iw/dIFi9oWNvR4IdQ7FG+rrcOFuUFulFV0i1/Tv3fxxlnPWwiCmh94I/cRdFEcAkG0nyzpssmlA
 8VC6MdDQ==;
Received: from [186.208.68.119] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vvDrE-005DpP-BC; Wed, 25 Feb 2026 13:19:12 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, alex.hung@amd.com,
 andrzej.hajda@intel.com, christian.koenig@amd.com, harry.wentland@amd.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mario.limonciello@amd.com, mripard@kernel.org, mwen@igalia.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH v8 0/8] drm/amd/display: more drm_edid to AMD display driver
 (partial)
Date: Wed, 25 Feb 2026 09:04:29 -0300
Message-ID: <20260225121903.236115-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,intel.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,igalia.com,linaro.org,ffwll.ch,suse.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,mailbox.org,gmail.com,lists.freedesktop.org,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-0.612];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A5441197294
X-Rspamd-Action: no action

Hi,

This is a reduced version of `drm/amd/display: more drm_edid to AMD
display driver` [1] sent a few months ago only with the less invasive
changes, i.e., those changes that don't affect DC. This partial focus on
using more drm_edid helpers instead of raw EDID helpers. Most patches
here are already reviewed by someone and I think they can be merged
without major concerns. They can also prevent new initiatives of keeping
parsing raw EDID as driver specific code, which can make harder for us
to remove `drm_edid_raw()`. They should focus on moving raw EDID
handling to the DRM common code instead.

Regarding code changes from previous version, here I added some r-b tags
(from Mario and Timur), fixed commit message syntax (Mario) and
centralized error handling (Timur). I'll follow up the changes in DC to
accept the Linux/DRM opaque object in a separate series since those look
more sensitive.

[1] https://lore.kernel.org/amd-gfx/20251106165536.161662-1-mwen@igalia.com/

BR,

Melissa

Melissa Wen (8):
  drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
  drm/amd/display: start using drm_edid helpers to parse EDID caps
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: use drm_edid helper to set analog EDID caps
  drm/edid: introduce a helper that gets monitor name from drm_edid
  drm/amd/display: get panel id with drm_edid helper
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 84 +++++++++----------
 drivers/gpu/drm/bridge/sil-sii8620.c          |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +-
 drivers/gpu/drm/drm_edid.c                    | 30 +++++--
 include/drm/drm_edid.h                        |  7 +-
 6 files changed, 69 insertions(+), 58 deletions(-)

-- 
2.51.0

