Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLCQNmFjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D73481B8F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BAB10E36F;
	Sun, 25 Jan 2026 18:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YI7uEQCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5181610E1A3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6580ec94bcdso508111a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366359; x=1769971159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixilW5V8SChUNZnxz9Z374ZlFvo9s1J4AZCTC1xKE1c=;
 b=YI7uEQCfc/X2NSqCkr7tI9HlHpFGG6GXBIbfqW/NBXQndhibiSprp+YuGELygzvLsb
 JM/Q08bKcs9Cje83Kbw8c85oaJRo0fEMpCiGJqJ187SYanRfdAE0Zgw0Yul6FxPZXRZH
 hCdSxV4yNEI0VJWWiT6Viflh9RwoPvxx1M24G06S+JxSXLr7MbmnhHGL3I/r83gb/fsq
 eg38gA1+rCtHvLN/ahYFG01Z40REj8lSWhMzyiH2uCg0hSJJADhwLzOqwULTtSbMVwaf
 D4oZ4bxNBYZypK9GyFOOQjsfiYvGlgafTZvaMDpoatW1zG91jXgX4DdYJ80tOg6su45R
 xHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366359; x=1769971159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ixilW5V8SChUNZnxz9Z374ZlFvo9s1J4AZCTC1xKE1c=;
 b=ghyP4X/KQKdoBbTnft1Sk+dQbkSAJM2wodi74HaUq4VUAUzmAMwfzhD2b5UhDIHWoL
 sbjuB/HhScs/iYDIo3rpCSiXqx0UxwglQsyFGjbGUp3eB8v8wL6E7vQxM4U1aLlN6RXi
 HMa8Ki2IZiAibeXQvyLZHWUR+Qsj4SE7fxSEhzYa2idhn2VRJJFfd5bZXfzyR3ttj+MI
 P4HL2lCTg4xpo4rXCPh6YGajRXKU+eHShvJM+QUZtQcurhkVFRTUtOIf++fQwfPlWZoB
 ZNYIsf6Zya0ZNqVZ20PAiDp53COTMOdi92A0/YSMLoRshmAeI+r5Eqrbo2NXHyJfN4pn
 Yadg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Z7YmhtD+VU6C1UIFvo3B2deVtEOH9ot/ovYTxduBPnF4MJc9PhgjwVw18AFP710xu4skotmm2fQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybxwemddwBq9PU2Bui6n84uC0Pdo/NzhDKrhequNfmI0k1DRQO
 giRmsvT2JfU6RgJKjRmXoYL4Sn42NixQhDFM894DD+a3HhvPCUXi55ruMHSaZw==
X-Gm-Gg: AZuq6aJIUTQhBnUC036jBkZcpkYYR74nMzeu5vrupwSLMidLClW89zF4Xn2U4B1BTL6
 EGzzasHJv6wnXqy8oSYoBI6oGMYGZmR7O4ZyKaYAHZgLSDEQix69DqPWgQJDr0JjaAOrPQM6qeu
 J3KrFr84USPs6XBh2MfNxIOpF8OWp+mF+9V565RRkx/WeejMKpmPf9SntplkKB6fA5IFxToKhZh
 ubuROMDWZFPcrlykqNcUdQY4iC5nKbJ3CmAnllfKRkyHNA+vTaiDdqKLd0GQa/4ee9/vWi8Igjb
 VoCmiFbg9XqFOYjjgq1k5JJ6aC+iVfYTfrpRqHmGt265tP9jYIZlDDdZWhlbGJJdC/CanMhHctm
 3IepdgNVc2/8g26ttVpj+fgRa8leNYjbJ3meTTVCvR18JJodERCpKOqD28r/P/Zh99NvojDOIOf
 M6842GCjF88vh4dYOAVczezWmwN7PasOyNsTRPWvMr4JNQH26omedNBjs/ugXigTjC
X-Received: by 2002:a17:907:2d8f:b0:b83:95ca:22e1 with SMTP id
 a640c23a62f3a-b8d2e89ad06mr95678466b.1.1769366358426; 
 Sun, 25 Jan 2026 10:39:18 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:18 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 01/19] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
Date: Sun, 25 Jan 2026 19:38:56 +0100
Message-ID: <20260125183914.459228-2-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 8D73481B8F
X-Rspamd-Action: no action

[Why]
The function would continue to try to parse EDID even if DisplayID
extension block wasn't found. Sometimes it got lucky and found AMD vsdb
in CEA extension block which made debugging harder.

[How]
Add a return if DisplayID extension block wasn't found

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8b4c45ac3c05..f01ddde1a50c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13115,6 +13115,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 			break;
 	}
 
+	if (i == edid->extensions)
+		return false;
+
 	while (j < EDID_LENGTH - sizeof(struct amd_vsdb_block)) {
 		struct amd_vsdb_block *amd_vsdb = (struct amd_vsdb_block *)&edid_ext[j];
 		unsigned int ieeeId = (amd_vsdb->ieee_id[2] << 16) | (amd_vsdb->ieee_id[1] << 8) | (amd_vsdb->ieee_id[0]);
-- 
2.52.0

