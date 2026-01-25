Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHJfFl9jdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E681B7A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB3310E36C;
	Sun, 25 Jan 2026 18:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="chiJJnCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD99310E1DC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:22 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b8862767cf2so34948066b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366361; x=1769971161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okuaC9cSCyDBA7bzGCWZ+ETvX0Mn/dMS3C4bf64Lnn4=;
 b=chiJJnCSEd640CeDstxWKfX5B3rEn7GfaM5VmzOYGXrqrPbbQFk2532KrR0AbBMDbs
 Eqg7tzHD+dvWW+TcJBk0jVY+eGmmRwZdCSuVfODnGOvpqnkJjxIr/0wRxXuIN9MtMRmv
 U4XhQirfHz+g8+1SSoe/NupC5X2jVEMrxR7kflLrbUCRj47yK4HyxIoERDbL7znOepmB
 IOyhkx9js0iq9quHP33xs07mi2ISSlaG11LQx6D4v1dYQY1ZZjk5AlGjpho643PymMaC
 PQrrIgUz9VQqXdJfLuLeBeuIC2EusOLyBOOrFvpDFUB/xKiH5iC/CmXEa3g0dWkvipev
 0dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366361; x=1769971161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=okuaC9cSCyDBA7bzGCWZ+ETvX0Mn/dMS3C4bf64Lnn4=;
 b=AHPSqybylJ57pOXpoc0RDQVhmxeU0pobvb4uD8VH/pQ58VCFTsZTcHFtKcx203Bhfe
 Chs/tdE7KCgwmuLnW88kNiXWz5ThAM3HWNzOnvx8v1pow6UM9eVM5IiSJQ3iTMlKsv+k
 Z5+vBV6kgz4XxOL3QB1rC62pbJRgU5+o84BS9R1xM+VDmRXvRA9RW3ODClnaxvtL4Wss
 k2AF7LntNqhgUhwOHbYw/e4Yz/AS6sz+vyaPOqxEmGtsU/wQXvJ40r83GYtC/gamUTD6
 SJiW+TxRDXjcF32T6EPFPjqYWWq7mACOiEVjLjjlaOwJ/X/1tVsnCGpgNwBo7BWNkfpQ
 xQVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfLzExqkRSxmzooyFK5UVFKoc6EyZLEc6XvYeLtrMRVuUwc8O7FBN7DDhjYedX8i6ZXpSg6xbwAJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoTlmDYIV0hsvpEYL0NaxegNri96e9fTKMxKmwm+h4iR2X2cYc
 +J+WIAYmBD26xPbZRAjLwNh0H5Zr2kD0BKfqQsA7eGJW8yqyjZkEVons
X-Gm-Gg: AZuq6aJabGDtFRPZpH/o2WKZIhfGv2KfYZmUXCfn4ynWgdwIrfNYtZx4IETgWSYxvv1
 8tMUMTwzsGcbBchqWbWhC1t697uamS83PH2U6rw71PDHVYzc8zv/IJtcJV/FA+YZOp9sxxoLlGh
 25me1YHFtN7kfdKHozzBDi7F5cG6X4uObBNW8blvIrubhUDQRtwdZOduF/Bjw9NAvJzv8g6v4hT
 e0QRRqS2io6yY1GO4i0rTE3NadeslmsZvjZ1CxB+J+fY0/bkUNzsEWUHpTYha47BzA+atd40jFb
 a1ieeoc7CncKTV6tJNRnB7TTAgpebWm/xNBHtOZ1UIBuRZCaZvNYTmWu+7M+mqhw5uVoEQ8fxCC
 /NZm5qW6w22cSxXJgCYVpS4FzxYkyuFbBQAKKsp/oo5lOLEuCO6QCUWh5/AdOAbTA3YR1J+Qjpx
 H80bKBal/AA35wz8V2HfPDExPoWW/UvpkKTmvybHsN/KMFRF72KvwKlns4UXSd44Q++xg32vg/Y
 6I=
X-Received: by 2002:a17:907:96a5:b0:b86:feb2:543 with SMTP id
 a640c23a62f3a-b8d4f709bd2mr71640866b.8.1769366361087; 
 Sun, 25 Jan 2026 10:39:21 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:20 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 03/19] drm/amd/display: Check for VRR range in CEA AMD vsdb
Date: Sun, 25 Jan 2026 19:38:58 +0100
Message-ID: <20260125183914.459228-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C85E681B7A
X-Rspamd-Action: no action

[Why]
Some monitors only expose GTF ranges (or others, without Range Limits
Only flag). This breaks VRR even though they have explicit FreeSync
support.

Currently, if monitor ranges were missing, amdgpu only searched for AMD
vsdb in DisplayID but many monitors have it in CEA, just like HDMI.

[How]
For DP and eDP connections, check for VRR ranges provided in AMD vendor-
specific data block if VRR range wasn't detected.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3894
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4457
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4747
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4856
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 77a903880543..e4f4d6ba09c3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13287,6 +13287,12 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    sink->sink_signal == SIGNAL_TYPE_EDP) {
+		/*
+		 * Many monitors expose AMD vsdb in CAE even for DP and their
+		 * monitor ranges do not contain Range Limits Only flag
+		 */
+		if (valid_vsdb_cea && is_monitor_range_invalid(connector))
+			monitor_range_from_vsdb(connector, &vsdb_info);
 
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
-- 
2.52.0

