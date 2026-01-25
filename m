Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGbYIGljdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE281BB3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976BB10E207;
	Sun, 25 Jan 2026 18:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I8pgK79v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063910E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:28 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b876b5c69baso66974866b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366366; x=1769971166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUEpNBWo+nSLTU4UotiQVijk+9VhpRak/nFSgqx/fMg=;
 b=I8pgK79vsKu/Pl1qoKDi8mSwoLvW+tIxVpQkgVQiVL/0Ln4JIRn5UkJUXS/SIXY1CY
 KFacVu1XFqKbCGJLe9JMerEB4YuxyIwiPirkC6jGWEBm8+JGrKTLy7d4gh0ZfmQMbn4G
 SMEozrqj0Tllets86HTvyHxV2/5Y9pYNY1HNmJBzHQNKkHO3LMBVUZYr5XbjxmIYoqsU
 0S0c9mahELFVxNW6FN3sDnygLHxYxPQHSobi15Zc50mDHarz2YdzwHc4T4Kapue9xzYh
 36OBDO4l3OWO0/bnOfSE9HfR8bRr3DvGTPt9ioEydXpGGQw4PNR2mib1/Mt7FXXeN/zV
 I3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366367; x=1769971167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUEpNBWo+nSLTU4UotiQVijk+9VhpRak/nFSgqx/fMg=;
 b=Y2Hgh3JvxZTWu9VbWP7YDCYb8PSqti6YQnbbtxW/xah0Z3lC3/C2xsaX+wYhdYYZVT
 dD1UhSrIv3YbiL3WR/qjoTDgPCO9NEqiL0I+wXg4So2H4Bb82ogMZoDnPRkHPKLpNS0O
 gOEACigMgQ4FfP9RWM5caOjHnjPA2ja0ubIYqqrou2QX+IaV4e+c5HHGmoklAN9j8Yqx
 V06D8/WV+wSASIDs3O+cRKffDt9vy8NfGIq/o6NbGUsWGW0o1DXyQXgvz7fYmGbZFfCJ
 zHSVfoze4JIDuUorZI9Qer4n7YD9YoCi9BGkLgVE3iRrzYsVNIUgSwY9yOTBISOBqNsX
 Y77A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6vhBWOViBQdmJmfW6B8gw38ZFUtmWg5CONvgR7IHSKNMwQkpXADq0ixB38KYh61/pPRydJoi/wdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7LlrOEWdPrDWpWnHriybTUnhX8f5wlBkXdnH/1sUQ1lFWtEAS
 ctA1zfe+UbEjUJU06JXz18iUY9QIWdU3BuzMdKMfubvCjt/9Vox0gyRf
X-Gm-Gg: AZuq6aJTMUP4Qfo0qF+MOydbDP69ktluzz7J+mHNPttTWp5BY1BSFTuWwcn3WpIiaDH
 7T7lGUf/CGL1gVlfAcnn5/UAAhjWgMzDsPF/wurjkjwNRVXAfR2ZsyEnR5cGqq2I9+gsZz2zGUc
 SjxSEKbuhDV2Qu20zQT8FLl1ZiXRf7Y0e9uCpTh2V/JnY6INuRvoPtxoRZ5ZCs8zsv7fphq1Shk
 lx++ULzBKGW8ZD78ATI1vyYZoOiksR+HkqrxRhyA5sRaWeWLFskXRvtCONz/PsqaxaW7H2wzYEi
 e7BwG00xeSHXb9yVzh2CXUL/Wf+baG9SvDp8sCfaoELCC4EoKPkLQYn5CgX1Vk27Jt6wQ6iE1Hk
 UXhoMualGK9izxPFHv2PCPGNigNLvlLm96BQpcsdI9o82Gr13J42xW8FnM/g7Jh46UDn7we2UJB
 McOGbF5HzGM3s1zAje43ZHabr6M5pMvUqdWOTOLLBS4nmxAr3wbsIgdd3bYWMa4bxI
X-Received: by 2002:a17:907:749:b0:b88:4ff8:12fb with SMTP id
 a640c23a62f3a-b8d20dbff7amr102048866b.0.1769366366462; 
 Sun, 25 Jan 2026 10:39:26 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:26 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 07/19] drm/amd/display: Add CH7218 PCON ID
Date: Sun, 25 Jan 2026 19:39:02 +0100
Message-ID: <20260125183914.459228-8-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 2DCE281BB3
X-Rspamd-Action: no action

[Why]
Chrontel CH7218 found in Ugreen DP -> HDMI 2.1 adapter (model 85564)
works perfectly with VRR after testing. VRR and FreeSync compatibility
is explicitly advertised as a feature so it's addition is a formality.

Support FreeSync info packet passthrough and "generic" HDMI VRR.

[How]
Add CH7218's ID to dm_helpers_is_vrr_pcon_allowed()

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4773

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 1 +
 drivers/gpu/drm/amd/display/include/ddc_service_types.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index cb8a2855ac10..690558584a0f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1396,6 +1396,7 @@ bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link, const struct drm
 	case DP_BRANCH_DEVICE_ID_0060AD:
 	case DP_BRANCH_DEVICE_ID_00E04C:
 	case DP_BRANCH_DEVICE_ID_90CC24:
+	case DP_BRANCH_DEVICE_ID_2B02F0:
 		return true;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
index 1c603b12957f..e838f7c1269c 100644
--- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
@@ -36,6 +36,7 @@
 #define DP_BRANCH_DEVICE_ID_006037 0x006037
 #define DP_BRANCH_DEVICE_ID_001CF8 0x001CF8
 #define DP_BRANCH_DEVICE_ID_0060AD 0x0060AD
+#define DP_BRANCH_DEVICE_ID_2B02F0 0x2B02F0 /* Chrontel CH7218 */
 #define DP_BRANCH_HW_REV_10 0x10
 #define DP_BRANCH_HW_REV_20 0x20
 
-- 
2.52.0

