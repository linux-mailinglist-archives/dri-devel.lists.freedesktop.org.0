Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMwGHuVEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8BDDED1
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1111E10E73F;
	Tue,  3 Feb 2026 18:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFBDU7au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCF610E741
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:32 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b87266fdf56so78414666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144991; x=1770749791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFFQv92IMIK5Ovyc69Ri5XGSLTL2jrRhS/990idFLW0=;
 b=BFBDU7auDGw2qSCmDVbQjGjodq2Qal3xaSPQOOiC+9AIE+BYlMElQ+PF1Zi/l6QSPI
 vc722EjMahI8sKS03J2PaiJpf/s/EfeLxyxxDJJKdiKSu3BykwkfyS+IcVMkL9hdH5e9
 HWRkPYoOwRGe8uVkkkHDbyzrFw5qm7dDuPHcclNWAbqONayMce33f0590IgKDZEqGnJB
 9n9dmJHHiN9q10ddzAzu5bOTFc4cODHHXbb2caqRlM2l6aFGORPMPvhCDGfUkSdpwF9i
 w2KVc4c749npjOxC0RfltwbPi6PII4CepKsZguzclvLikQmYO9PZZ5HliLS+eezO0V75
 r0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144991; x=1770749791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hFFQv92IMIK5Ovyc69Ri5XGSLTL2jrRhS/990idFLW0=;
 b=tYLGwlBaLFHakaWGuubfZUHBxVa3OqYpCylgxn20DO4LgpvZ3f6FTE2KjB5sr+bf8a
 BGCCicepa8tuVGQAuiXX8dODttCEYuLGlOeH99rjnvUyOf1h12RfN0xCu2W/5EIlwbdl
 2FOPCW5Ug1RlZI64JEFQTa/dTcThkPdgUNlIfU62d7VpZVbTViMWB+BICJS5mnGxk4CC
 sfbqcVWcKepZ1n8964HtU4BMMzv1266N/kBGIyL7QET+u8ccK9/ESXT7O7KFfMu5URaV
 apCNaZ18f4sSK3F6RC1CHjv86/+wXl8j9px4iDlk8hfvUoHfaeiFI3aLlt2ZN+TpLTs4
 zVpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtknTqAxvVzrBdiL72soWNeQuMlAiUJCpfDNur9snRSE+piIH+6e8bNG7Mx9WCGmPdH7F64azh9hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxecUhtwuFOWngkg+Zk4X8CKWcv8krcT4RRFnA9QMROfHegcQtO
 DKOW+dhQbya/4r8wmNVbmO5apByaRJl0J/VlBk38cOALKJAb4u2iIQYI
X-Gm-Gg: AZuq6aLNK7cXLC403HU3daloxDMkSU+SfYkmnJE0Gl1MlhN3WHTQa3DJZlai35uHWj8
 KWC53bIz3j2wFzkGfgrEF1rPN594MilvtsYkT4Mi2OJksWVKdDachzsY0B0HOYCKGrwOTPJD2Ds
 04eOdbK2veqvFG6GBtnj99MhTuSkpINeJ58D6jIrjoHaaxob5c2+fz+HgbJOo9UwFStl6JTxFzs
 1dPxbxi+d06+jKxnFHEVBm/9M12HC9usIcR6+qngfpjj1B58pyFp21l5GwYbONPP0NAwk7+Hbzl
 SAsB+NTL6uQ4HT7y+0m/JzrhytmmnHLMJ5fOJgBM4RhkMUP2UA05USjPaKIIqkp5HfnRgUDCkZt
 WTtxrBlZg3Hgp+VMCSCBVwpxZ4fgjG88A8k+cSXaovLtdT0Rsqhasp3yEb2r1qJGTWXmHpx9FsK
 HUyzJJZNdNSYIQSgNlPQYccsQPZzrJnbUOnobKJ10I9l8OR04FjSTXp9HdFXpt8Is2
X-Received: by 2002:a17:907:1c90:b0:b87:106c:88eb with SMTP id
 a640c23a62f3a-b8e9ec16b5cmr23148266b.0.1770144990354; 
 Tue, 03 Feb 2026 10:56:30 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:30 -0800 (PST)
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
Subject: [PATCH v3 01/19] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
Date: Tue,  3 Feb 2026 19:56:08 +0100
Message-ID: <20260203185626.55428-2-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: F0B8BDDED1
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
index d8fac7e69181..29e4a047b455 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13136,6 +13136,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
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

