Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD7QEKlJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E514650C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C210E3B9;
	Mon, 16 Feb 2026 16:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AYhaPGOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FFD10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:22 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b8f947ea8easo25676766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260321; x=1771865121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7wlOYuiBDSWiVWpYqNMTtfR05pQbGrwxiWFvefDzRE=;
 b=AYhaPGOisM/Eg7iu2henil1lOXQHDFYovU5GRv4sccQ93AOLa7Zx9Raj88aqMR2i2q
 LRM47EmvN2EI1YDHFVawp/eIT2i28iVMDtsDBWWM4/TLCJDR7YsWi2wTcauXtiFQCmei
 fnNDmOoim6EQLKH40E7PeaM4XYY2mRhz1PBP14GVTXkRwSjNo1zxBfeVh3C86Y3ylXqk
 ZGP2GVtBCJRY3NgXwVSMZ9n6k1IB2J+dBJOuo+T65Uq3OtQH/tF3AsaJmpBG5+D41AAW
 5wb1KdCdk/5W45ZEc1DgnJx51Dam0TlK/PghcqJn1xSZagpXfXsYlzurvNDWj8CVkDsE
 tprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260321; x=1771865121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W7wlOYuiBDSWiVWpYqNMTtfR05pQbGrwxiWFvefDzRE=;
 b=PsPWB+kFr/h+HPKbTcSnpfrQL7u7m/KItYYszobbUbUfRUeg9UNvBCOb9IpswM0Rul
 x0Zw73fbYws+ed/HtX/BvQ8M60rhfg8KVURA3cE9hkZ/rjskedCsG0Qz+azl0rshfxFt
 CMeUWOZTR9ljj9cpVx0fh+Rn0+ifpEPEKYLDDDDGYm2YP9CZFaE1OKFusav1GM0klwA8
 HYxziCz55eO8ssf1sGjEoDOZUN569TrWY+kko48RlFjvE0Sle9MTCEGSeXK6DKmPe/k8
 SqCpjR8x3m9okWyXNpiStsMpDhTY3WmiSJ1zihjFnTRlPJZllLqSEyySpT42wTl1AeA8
 xKkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2CKtGi9tYmcNDhEvmbFXYTH8DHyJGbiIY9+a60x0GkkSWYoPUckXGWAh4AKW5dJq/rd4f33BfhVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKha6NNFcMD4v97qr/UXPqLP536VopVnWrlNylmH9NKxanQ6yB
 MwwOXkx+am9Ipu9pvcht+fnG+R75yJVp8yu6DcYnOEEOKD/OxWFTbsRG
X-Gm-Gg: AZuq6aJqVZEu2Xlkj9CX6dUTZPfofDuexZQilX0t4ZSIMAu5VRhQcHVoyClkQpc1EMu
 ZT5+EWpFgdz07iNS/+H6H3CKwEQqLhVOc9MinPQXu8H1E4B46RqAL/70dy30gROHSimvZn7/g2q
 2xEmfgRP4hNU3uPFmnGfmiPctig77P5O/YTk9IlO1iZJfrWReAFls1cTDYGocwZjeIBMnRTehvb
 q/J4tUh6XDWMk6o8F4J3h3vCsay8rkxChLNk5WB/kanaZgRgz2Sa04P27XG/x67sB71lWaXeBDL
 uijpXAtQc4g0v/3rRX3Q3fPAsIJ6SCVoG7AL2pN10YX1j33sRKgzkxiOs04LYoRlCV+ThPUfwRF
 U+GW85pxWZSp9hx0caxmSgapzSva6YRwNQCBrDYw0w3kvxi5aZ7GUyOh3Zwo81IWVDA1N1YLZq4
 gqENPEGoD6fERO2wIZ0H8DSUGlLj/BiaSKrgF5eTzMHI1NTBqYcNYaJE6o0n5zWG/fH4OSGWvS9
 ibUb5DbZYLfUmY=
X-Received: by 2002:a17:906:6a24:b0:b87:3c3a:cb7e with SMTP id
 a640c23a62f3a-b8face00ea5mr368539266b.6.1771260320644; 
 Mon, 16 Feb 2026 08:45:20 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:20 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 01/27] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
Date: Mon, 16 Feb 2026 17:44:50 +0100
Message-ID: <20260216164516.36803-2-tomasz.pakula.oficjalny@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D01E514650C
X-Rspamd-Action: no action

[Why]
The function would continue to try to parse EDID even if DisplayID
extension block wasn't found. Sometimes it got lucky and found AMD vsdb
in CEA extension block which made debugging harder.

[How]
Add a return if DisplayID extension block wasn't found

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 12bebdfd7fdc..2d770ed98871 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13162,6 +13162,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 			break;
 	}
 
+	if (i == edid->extensions)
+		return false;
+
 	total_ext_block_len = EDID_LENGTH * edid->extensions;
 	while (j < total_ext_block_len - sizeof(struct amd_vsdb_block)) {
 		struct amd_vsdb_block *amd_vsdb = (struct amd_vsdb_block *)&edid_ext[j];
-- 
2.53.0

