Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEisAT+6nGlHKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:36:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD317CFB5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CB110E444;
	Mon, 23 Feb 2026 20:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AhZNfyDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04410E30F;
 Mon, 23 Feb 2026 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8N68AvewiJEiVoFb9Et69iCQWQxrvhKR8SCPUSqu5Pc=; b=AhZNfyDdmJM0bYKBtoiUjSriME
 hM1wwEyYOhLYsXxlfw4If9c5Lq1Qbs/EDqjPmybc3t7L9cjOPpD+SHyQtY5tiJfLfBfbfQ7NsHKYp
 xPCXtf8sgvaiyOPf04Y5sQdQ5GHwpwOjGOGvqgEeMZ45gFTo34DizTFQwpIn7qICkEWQveEAyJIMr
 TCTs1huDAC4GdMJnGWj884jhAPy953wFtmU4WLMTC9CrYRh17X+B9M3CyKLhkVeTK6iDrKViLL3SW
 gVVgmTNJJDqTkDmYplKIgs9Te7lIomB7h+utIHBoA3pgr7z3jJ0+YxI32Sp6GMr5Ic+3WAaY6IST4
 Zx4znVjA==;
Received: from [186.208.68.119] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vuceV-004QdK-MG; Mon, 23 Feb 2026 21:35:36 +0100
From: Melissa Wen <mwen@igalia.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 mario.limonciello@amd.com, mwen@igalia.com, alexander.deucher@amd.com,
 alex.hung@amd.com
Cc: Ivan Sergeev <ivan8215145640@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <superm1@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/drm_edid: ignore continuous frequency support for VRR
Date: Mon, 23 Feb 2026 17:29:46 -0300
Message-ID: <20260223203528.213275-1-mwen@igalia.com>
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
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,lists.freedesktop.org,igalia.com,linux.intel.com,intel.com,amd.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,cgit.freedesktop.org:url,intel.com:email]
X-Rspamd-Queue-Id: ACAD317CFB5
X-Rspamd-Action: no action

Display can be VRR capable even if its EDID doesn't contain the
Continuous Frequency flag. On the other hand, continuous frequency
support is expected for smooth VRR and ensures better compatibility with
VRR tehcnologies. As the lack of this flag can result in unexpected
issues like tearing, get monitor range even without the guarantee of
continuous frequency but add a debug message for unexpected results.

CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: Harry Wentland <harry.wentland@amd.com>
CC: Mario Limonciello <superm1@kernel.org>
CC: Alex Hung <alex.hung@amd.com>
Reported-by: Ivan Sergeev <ivan8215145640@gmail.com>
Fixes: 0159f88a ("drm/amd/display: remove redundant freesync parser for DP")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hello,

After replacing the AMD driver-specific parser for VRR with the drm_edid
implementation, monitors without the continuous frequency flag in their
EDID stopped obtaining the monitor range because the DRM common code
considers them incompatible with VRR if they don't advertise support to
continuous frequencies. This differs from the original driver-specific
parser of AMD, that only checked EDID version, EDID_DETAIL_MONITOR_RANGE
and DRM_EDID_RANGE_LIMITS_ONLY_FLAG to determine the VRR range, so
switching to DRM common code caused a regression (reported by Ivan).

The commit ca2582c66b930 `drm/edid: Parse only the VRR range for
continuous frequency displays` [1] introduced the Continuous Frequency
flag condition. While it was created to avoid issues related to
non-continuous refresh rates, it looks very restrictive to drivers that
want to deal with VRR capable monitor even without the guarantee of
continuous frequencies. I propose relaxing this restriction and adding a
debug message if anyone experiences problems related to the lack of
continuous frequency support.

Maybe I'm missing something, so I would like to hear your opinions.

Obs.: In addition to the display kernel developers who have already
worked with this code, I am sending copies to some compositor developers
who may have an opinion on it.

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca2582c66b930

Thanks in advance,

Melissa


 drivers/gpu/drm/drm_edid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ff432ac6b569..8ebd1c17d78a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6517,7 +6517,9 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 		return;
 
 	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
-		return;
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Display doesn't support continuous frequencies\n",
+			    connector->base.id, connector->name);
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
 
-- 
2.51.0

