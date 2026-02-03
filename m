Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL7NC+hEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A155DDEE6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338E610E72D;
	Tue,  3 Feb 2026 18:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D1YdAJ5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E587D10E72D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:34 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id
 4fb4d7f45d1cf-6505d1420daso706072a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144993; x=1770749793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnHVkr75tm1Yp6ZOCu5HkXcq6YZSjcDNrXJkhT+PUDY=;
 b=D1YdAJ5EkCJYeGAQilERqpkF9666Ssr4UVLh9wquy7NJ49sYLLQIdOihnOGFEz07nB
 QxkDSRBfMjCyiISVt12tI9FQ3yLvD1weVJ+pdyteLqx/+gs68NXMYAx0OxZTf7tOcSgr
 NLI/U5fkGXgOtNALcP37BcWpF2oK8uonguVrtSdO2OL1tJd8Mo6syQeAoARYChaZ6DgR
 7BWRXb7aDXqTsdVivrKWhQ5t6jLHuUtxAnHxWi6Yl/7xFNHCmsfIadXSYGNWwZ1R7wze
 8pbTTvIWAwhXelrumqeh09bqgHgiuS5Pv8bw6/tTvo+W7oXMh0WREEpu7gniKZrHnN36
 TJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144993; x=1770749793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vnHVkr75tm1Yp6ZOCu5HkXcq6YZSjcDNrXJkhT+PUDY=;
 b=OAvPv18GD7bAW8WDkjgE/o0L76QLurwprvQO0ISbZSG+qss354aMRnAA7QLxAXPYE9
 TxAJsFMxxhfLaWqZSTQkqx3HZUkHNMqDvG50G3YbXvsAdv2bTFXV11lrPfjhm7R7bkbu
 NeU9Ekza5gx/8eveJCFZrBX3gVWY8gLGViMHNJrlQ0uoEbovCp42KQ344qOiIIDkZWRC
 2Mo9+3v9pUXm0CWojc3VMwjnMUiwwK4x47Ary30lIrOJ71UjNl2uCPF1xeO037MFQ9gi
 u6l3bZmP3SCwflPNx7RXkfbPsVs6qkQNQQqZPa6au/4VWGp4RVe2yh7Zqr2P7tB8EZCG
 Ni7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeNZsFl8PxBonbwNuo3OVhBAl1V5A2OTvcOAtOAcmfZjXXtDX2zNMN7Nb2GUI5NK/Ds04qltkJY2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyi/Z4S1wfUM+Fz3a3LpkxEM021tVlI4BxtVXdA7aqzrJxqYXn
 ipDsnFgser/QFxbRF1A+C8jWXgr5cKq8ajhXZ8Zf60ln7Vs1c8WOttQrvm5HHfKS
X-Gm-Gg: AZuq6aJE9zNeW9UmL1qla33Nz4lO/kG66mMpSBN+O8IMIgRDWG0v10QXxkpSdwOWZrs
 dctpE6hCM2wmlHZsmrebwbM9pPkQkglw1nBUkJMVu7k24yiROYGn9idV5XLvH2NDDjqOZP9Vn9Q
 c/bToxOQ0bpXjOT+jYom9T1V/p9SWA67lPYhoIC8PGW+dnItbaJyp+/jZ5hybyAFlwM8Jw8/Vt2
 V2MFO69O74Qkl/1IwSk+uezhunbyzQO5KagZJc4V8gZgcanNKOrGoXRYq4E0W2eg6REWrUcovKr
 GuVVva/v5pm38x5mDY8IO32Fk+MyTIRVpvkCF04lPhS9AD4SfhgscjystPp3bHw4d9BzeqITg3w
 tRBrsOuxG0h0lKPpi2/A6BEUvgLyjNnYWBs//oSa0FmgT4XRGb3biFzdH/G8UlsJKvHyIHEIAtI
 0NmSDtGTqnCeh6IOYltwTVdy2ngHuamfIvieu/MrXo1YIHuGOaoj5rT66hDtxu7luZ
X-Received: by 2002:a17:907:728f:b0:b87:73c9:36b5 with SMTP id
 a640c23a62f3a-b8e9f6bf9e1mr17489166b.7.1770144993098; 
 Tue, 03 Feb 2026 10:56:33 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:32 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 03/19] drm/amd/display: Check for VRR range in CEA AMD vsdb
Date: Tue,  3 Feb 2026 19:56:10 +0100
Message-ID: <20260203185626.55428-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8A155DDEE6
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
index 2c5877ed5f32..856007bba4d9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13306,6 +13306,12 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    sink->sink_signal == SIGNAL_TYPE_EDP) {
+		/*
+		 * Many monitors expose AMD vsdb in CAE even for DP and their
+		 * monitor ranges do not contain Range Limits Only flag
+		 */
+		if (is_monitor_range_invalid(connector))
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
 
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
-- 
2.52.0

