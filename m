Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNwnMbdJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0A146564
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745410E3CA;
	Mon, 16 Feb 2026 16:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LsxCfHX2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CF810E094
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:35 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b8fc068d201so43208866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260334; x=1771865134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGNe0DbosFuyf1BzABz49JKUy3I3J7cCYNl1QlycPRA=;
 b=LsxCfHX2bRZbJDfz9uiBlCrWv+M/8dNFzw4ZQzMQOMeWyTJy7fTP1XoljdP0dG/Fzj
 eHP+s97xSWWGs1zVK5RNeMpMBVLje5UFjdRnoGjvZ36EvatkmnxfXMaLCzvlqcWSSoil
 H0UaE5/Z2NYdFAIYfNnVwAccsQmcPkk3HhRKab0Nln6KY1D2V9Bu0sLzI+1h7MZY2d4E
 PAtIkIFMTa+BD6FAl6wfGxAEjaZg/u64CRJeQF1S3gUZMJ6qLOBzPKc9EK2es0qNQEJM
 0bgy/6kDzNyfDLln57GJq1C9JfDrt+fXJDF2bfbWorqMGaPdYfcTtaVo5hgXC3xwHG+f
 4NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260334; x=1771865134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AGNe0DbosFuyf1BzABz49JKUy3I3J7cCYNl1QlycPRA=;
 b=CRSiqj5KnGKSYZGbwnL6LWlAtFAQ5bBRRMzEk0h2yYg8LUaxBWg8pt557ZM3uYoGeZ
 WgpU78cri1e3JLoAcSlu5sd1N/YhSHKLI26nuouoqwwapbgn/sZjpMNHhgXjpisx0Eba
 jHl8D86eBF9CuffrbVPMPiuX8fMDNdikacRB9jzi3b/WeWBH9mLHTYhQez8K9n16QNDJ
 fG8ZUQ7AzyQ8hpqmb3Kh78OoM8xZMPI8k1o7s7sBDA5xID1jUZiFXQR1dVuZ2PpOuqZ5
 w56DGPTwP/YfUd1jnicLxKICr6QLuCFsEXToZAh2soG5Mfqlu973C0zQmv7M545splQF
 NyyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNRlL3HqndMPndeSlf/87o2lY1X83WTY0kJ9qsl493FUJNp6JAP7JNbi+v/LIkFbHwmJ7OZAOyl7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2YZd1sXditqn/kOL8A1SgN2AqcXETMLhn6kde+kzxZ2kqooHu
 uDdlB8Aoqc7RLIyXwKIoBDXLjDVK6RCRKFsBt1BaZ7yQyi6gVaHsDhRY
X-Gm-Gg: AZuq6aI7F32PKNAZVriQ+95azxdDq41kdV2JifjaPH/Q4uGEmDfKsS9rqAGxoAE8+vs
 fmWfuTyrfR34uZjF/dRj+D80aissgcMc0vyHl2cFG0/M5TWDloeKSLWbXVRZWy3a2DnF74dWUXM
 XoxqPuWp5FcMBWR0SJWFcW+FYqm2/ZIPVPYmMdT48LQmt8zlUP4ThhBbU3HIHDdD19Z9YEH8NqL
 3T8qOhMnmISphw0IgnUYYXM3jDl+pX/iAN0b2MhHXsho7Uzxf+BJunICOdhu3R1ClVJt091cDbT
 UZpfTprCTn/zff5z4UCDpndpdyRrP5+es5lmLAiAcCRZM7d+4InGS7hrAZl2inOeHcqUB2R9ssR
 WksM4RICvESzmpKl4lAH0WbMaCCaaR35BhYTfDF+k2/HEkUVYvayPW43ZdBcK0FzwYJ9QvJOuA9
 D1oRoLsSHqFPD1U8acpW8PZfZcE3V+oFdopoOCBzAmbzIKgl1dQ9syuDSCvqHJF5MevcBXciTEV
 ra+N+1lGz0DBP4=
X-Received: by 2002:a17:907:3e88:b0:b87:2099:9f6b with SMTP id
 a640c23a62f3a-b8face2491bmr364254366b.3.1771260334002; 
 Mon, 16 Feb 2026 08:45:34 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 11/27] drm/amd/display: Add CH7218 PCON ID
Date: Mon, 16 Feb 2026 17:45:00 +0100
Message-ID: <20260216164516.36803-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6EA0A146564
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
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
2.53.0

