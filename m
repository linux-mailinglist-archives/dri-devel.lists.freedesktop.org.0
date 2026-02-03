Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MijGOxEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A5DDF04
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49810E756;
	Tue,  3 Feb 2026 18:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cMNrqY+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30AF10E743
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:40 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-64ce9d80429so548803a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144999; x=1770749799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUEpNBWo+nSLTU4UotiQVijk+9VhpRak/nFSgqx/fMg=;
 b=cMNrqY+HAdW2QznRXBwnAoRK5Q7oxvCa/arGKX7xKzbFgi8PpHdSW1bfmSuWUViMxv
 HCiZuJs4RJv3bhdqaT+27yd9rc0aeDfT6XrWjv2lvIH7CbddeqwtOrsJnFHCIOt/Cipo
 6BjvY9n4UWdgXurBZV1SnGu2KTi+vsaP+BVMLG5R/9bltWmcJGdVZCqSteqxe/O7Yc1y
 FCY6uqY+NmXgYsPL4W5d8kHJ+sB3E/nUfoCrGKfCctcPxTxiJwq/wHxoth0JnVTP16P4
 Y55S2LPCZ5c9k9E9haTEO2Edk1I586WjTF+zeWCBoKCpN6ut0L9J0AmAN2s4iJjJLIOY
 U1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144999; x=1770749799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUEpNBWo+nSLTU4UotiQVijk+9VhpRak/nFSgqx/fMg=;
 b=xDsVn9X10tNszNpCH2FDKl7RLuCHy3h0wGurLUAMK5QdlQR6T8ymjIId10Z+A/TP97
 kChM8vDnuTIZ6YsT+7wl6ZPSpcwzGQj6viQ/3fA/gghutDzBQP5gQ2DVEDWRddss3YVY
 bek21Ch7Hh5lFTpdwhb3RJsWDOqzbWotedbNc92jPJy3FJrj4UytmEGQAHZ1fX5SuRdW
 e5zzGcQXeBuQ38ox5C3iWlOuSTvds87j8dbPoMKlbuEdITEj1I8YR4+kiePuzvtndMeG
 gnavV1UZOfGRJsTqA8pqv0xWEzuSp+KmnXS1dyV4Rr4NpEVVicltv5R2V6BKTtPv2cis
 OfJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhUa1hEtA3sldwPuWOc5bw0GuEZCEmcCqHb28q74Nt6cnEcG1153QLD+FPO2Jk1SHr1X6ah625+Hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/fFLHzMhQZLi+K82qLmPG7GG1iT2loNcwZz2XCmhR/HQu5G4f
 /dzg1TGvUNYd+Xlm4xIzwD4gWuHzZ/yk6QB0mypbY64TfHOd5xPFTapq
X-Gm-Gg: AZuq6aLDpoUdegWsSjZ165CrzZSodQDzIUTz+BIuub4c3hybZ27cUcvCyKpm1f20siK
 J+CJi39HofSfB83Vf26A83/uWDnhYrj9Z3JJ6zO0qIAKxKi8SpnC26aUwRUM42q+6TQDn7JsYs6
 BoT/+XnaUrfkfooKvw5MnQByssFocK8rzFqBCk9TcgsDGQVDPq5yZg+ICeJRhsuWjaKrcMpIQPE
 mxcZIeEQIwlTE289VHbbEVddl79nfTqMDVr3PgcDlLB4mJ2t0wbof0xzxgMBZ7igBJm/OzBF33c
 YoRk3CjUTvmGHCIu30nvUOTazPuPtNEvtAJGnKNBj/8G4awy5h1TrnBfPLVgXi/lOqQ1hh187eF
 zx8rPdt25tWimhnB1W4G77bPYFUa0WpWpn8FmC/0ZTETIx8IuCkxRbxdaZeo4N1V0piasAkyodF
 fFQ7avBoTvNSQ3+iKEOGnBog74g0RWS61lVqjq5Fvr6yK+0geyOKdkvrJeOeBYII6S
X-Received: by 2002:a17:907:960d:b0:b87:3087:54f0 with SMTP id
 a640c23a62f3a-b8e9f2f310fmr21821166b.3.1770144999082; 
 Tue, 03 Feb 2026 10:56:39 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:38 -0800 (PST)
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
Subject: [PATCH v3 07/19] drm/amd/display: Add CH7218 PCON ID
Date: Tue,  3 Feb 2026 19:56:14 +0100
Message-ID: <20260203185626.55428-8-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: C60A5DDF04
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

