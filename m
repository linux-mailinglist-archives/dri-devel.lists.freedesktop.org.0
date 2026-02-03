Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKtIAvZEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF61DDF3F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03B610E750;
	Tue,  3 Feb 2026 18:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TO+ZzsLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884B10E750
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:50 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8dd0168b90so64199766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145008; x=1770749808; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzW7AW51HsUGJKWqzdZ3dl0YJS+mvGm7coF5xMofNf0=;
 b=TO+ZzsLa2NH2cKSqmb3Yq9WBwnZZb7y2f3kdEm+D32sje9uq/DvwicgDM6TJM5YPxR
 jcit34sciz4Mz66ZLFAxbzcmPOWo1sqxPWNsLvQsWy+fQGwBp/wHf3FDJisRzPbSBz9x
 voivlNDnxg//4y78J/LaP4mNBGEuHKGZJWrKGTZJXa0daSmmI0XSszzvZ6HiMI6Ds0H/
 +wMpqBP9WdQAWhlnN24rp/pwGHrZQW+jyb4JtpmPnfaA2ThfddgI2reHj4RCyHGJsuvy
 23yIx8hHxfOvuNUst5c6Gg0n2SwAdFPr1PuDkTeoUbgCy8gtgODNrz9DBKjVkokgh5FI
 agmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145008; x=1770749808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uzW7AW51HsUGJKWqzdZ3dl0YJS+mvGm7coF5xMofNf0=;
 b=XHIxpN6YNKMpBjxXtOCYg/Zy2B2I97oqj/h8muFjdMlzzdwO+Kr8uQ7MQIBeAESLJX
 bEDeU9Z/8genTSaJgb8quvRbOMRWNDjZsYB443LntZp3xpYoNLWMaNQTon+s2HkM34it
 OmzzmOcYgPFmbJlOzm5MX1VBYvCjQ154n1HEFaYr/GEX3MWJHGT2vwpIuU1yr41DjWmk
 rNdQrzH5BfIeSZi8n6X/6z3gaDPooiWlrIQG1SQdINQRdruaH4ynu9EotkOVoZ1bRP60
 1HvPMpXi42E/eVRmYy7C0HAeWjC6VVwFgrfU6LnNBXLPVr1iEBM3DeIFmjWDnGNMTQsj
 yNDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+qYCicypOpJIv2/xWg6EubkKOgkpiKQTmbwsVyMPZcf4TBvr6FfkiIDAOeEAJaUwqtzNL7TGXEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHvWvA70NNp7xAs2Fcq3JxE7paNRlocmF664yZBJelKGI6HSI5
 qDkIM4c4lBY9jyMy05BuZAxDjp5GLL7fjI1jlqOWQclF40sEdtUlbQoHum4RGw==
X-Gm-Gg: AZuq6aJoOKx3E9owVdFKkwYRG8y4WDZJP51okkw9xzvzrvvTZE5hhSJ8fzFxO0Ghga2
 ANshuZkKVPJgQCsNiD4uej136tC7/8Dynu7bhP3bsfvgM1NLxO/0ik9zl+S3gdSWfhXZDVsZy3X
 r6LCdaEjIoDctlj/qzYQeLdGYVaaYOqLk61x/BKwblxwVQlVEwH+PcwPIEMyu2b05BAZPSeGyQ+
 PcLO5nH3Hv4SK5bx90l39K4trSOEY0nMuyokIV/OSQ+f84SvVDa5QVUlSu7cKXPHN8eIOlF+IM5
 M6pFprRRe0cj7FXUTLoetQQo9VjGn2dnno2FdcC0UijhJnfepvrhOfedPHmp0Sq/e7CwBWlr0CR
 pa8cV88n+/Q6bVBL/nqY1meNUelX2wgf+FR4uB7fAv4Ex26M6jU42aMllNQh/1rgpI5UyMoiu7d
 peW2tuW7wxZNWfEXJKtpNct/VsmnXddbJPliL36WBLb/CBTnKsBsePxRZAFgke7aPc
X-Received: by 2002:a17:906:9f85:b0:b87:2681:f608 with SMTP id
 a640c23a62f3a-b8e9f644b9bmr16665166b.8.1770145008412; 
 Tue, 03 Feb 2026 10:56:48 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:48 -0800 (PST)
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
Subject: [PATCH v3 13/19] drm/amd/display: Save HDMI gaming info to edid caps
Date: Tue,  3 Feb 2026 19:56:20 +0100
Message-ID: <20260203185626.55428-14-tomasz.pakula.oficjalny@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9EF61DDF3F
X-Rspamd-Action: no action

[Why]
We need info about these features in parts of the driver where fishing
for drm_connector struct is infeasible.

[How]
Add three new fields to dc_edid_caps and fill them if connected device
is HDMI based on it's EDID

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 7 ++++++-
 drivers/gpu/drm/amd/display/dc/dc_types.h                 | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 690558584a0f..c24476182fdf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -137,7 +137,12 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 				  edid_caps->display_name,
 				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
 
-	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
+	if (connector->display_info.is_hdmi) {
+		edid_caps->edid_hdmi = true;
+		edid_caps->allm = connector->display_info.hdmi.allm;
+		edid_caps->fva = connector->display_info.hdmi.vrr_cap.fva;
+		edid_caps->hdmi_vrr = connector->display_info.hdmi.vrr_cap.supported;
+	}
 
 	if (edid_caps->edid_hdmi)
 		populate_hdmi_info_from_connector(&connector->display_info.hdmi, edid_caps);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 0e953059ff6d..f9f108db1734 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -210,9 +210,14 @@ struct dc_edid_caps {
 
 	uint32_t max_tmds_clk_mhz;
 
-	/*HDMI 2.0 caps*/
+	/* HDMI 2.0 caps */
 	bool lte_340mcsc_scramble;
 
+	/* HDMI 2.1 caps */
+	bool allm;
+	bool fva;
+	bool hdmi_vrr;
+
 	bool edid_hdmi;
 	bool hdr_supported;
 	bool rr_capable;
-- 
2.52.0

