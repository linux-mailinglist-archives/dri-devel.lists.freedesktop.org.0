Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAajJU0fdmlaMAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:49:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884480D58
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176310E359;
	Sun, 25 Jan 2026 13:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFX37hRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A0810E34E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 00:12:11 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-81e8a9d521dso1977605b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769299931; x=1769904731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Al/HNzlL8sxMxMZcOP9VatI2C0Emnla0lc07B+7h3yk=;
 b=BFX37hRuU+Lcg2nNqvsyucDLHIeSfHgKnhJ5G7r0dfIL9sqJlQ5/GbcV7SpDr5yF+i
 b2r5zB5lf2qTsNJ7EYftFCYItVmLd3hKHRHDNScMxqRSv6DGPHtSNcNbVFay3EndWp5b
 bfy3cMEPH6YfJ0o04Q7KKABAMtUSYEGHIsLaj/QeTlI+nrQEZUKkcDl52fXvsDyt3Ey1
 UiQPOy0ZvPY0olO2egfiaeuPEbYI8PrtBf24fjXUdttliQj2wrRDpu3fYr5Oo2rxoIM9
 iFPDOFz2g9vrC9Ap/QOq8yDJIJLvjfY938ymuc4XGWHahJV/yt8nob/V9fo7hK3dVhqu
 6x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769299931; x=1769904731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Al/HNzlL8sxMxMZcOP9VatI2C0Emnla0lc07B+7h3yk=;
 b=uAOUcuOSrpQK9WTpj/mAOCu4PQ5El1Fys3HHUrNspMDKFlJv9or4dgJL9g5Ao0CIKc
 2CM85iJde1S2P2enpTzNKlvLlb9sNLJV60vWHxHcfFufDbiTGiGc46VAkF8fNF3BNjKA
 CDkAsUTS9o/QJrOUqgp3/UET4/pz+kTPOXtxjYDySGBXXhVDtgQ1QCCebQcric/a+UPs
 ohQhru9wy14T3EyQCTnq+PNAG6Vgl6QR6iJtxaZP38L3Y/nPdvU+h7+zLtWSphMUtL/I
 qMPr+PHPV8EYUt6dCQ266Dfs9v+S1S5KLRUFIpPngVBU9j9qNSCmewPx+5uBCCLNa0YK
 siaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVycSYc/DVtN9rpyKd7KzO3ab1+OIORv5KGBW/Vpi1q6ClRg5TkJou6K8uZ0zI1oe8dCtB3XIB6fGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHJCiIlp2LAsncTD54e6DBKWnXG3gmeZvzxGr6B+viBiH5oK1w
 vmikcLqSB8xFpHMqYN1oOjUr9SHeb64VVObx3AeZVqD0xNBum4lVxAAKlaOw
X-Gm-Gg: AZuq6aJOya/vvi9U70GB+ERNcbvwrhZ4P/5Y5LQdoyeIbcIhiuxGoXfXqkq8CbGo1P/
 s+N/lLrz8ZWgoUsyLAS6AuQYn+8xz6MWkNo0ZS8oTh4gMQaLrgp67+Ww5aGd5V0SSaQ7wEOF0D6
 eu5gzfrzfxKGc3gP+mvuQMpBZTxLRehWFNErDOet199SFV/VFS8bqxCMerJq/DjDmbzWOZjxqAQ
 0DlIEz4oxKhJVbjBAdUaRReTBdzsKG/4FVKmG+ZqLk3ADoEgmIeE1GZvecotiTVnctpSq1Ssgtf
 MdwD2Dcn+HjCsBnsp9cynY/xNZtPMl6gmiv33Ggq6wOzZpKwVSQ19eLICaJX/dJI0mn9Kt49Rkw
 j3QG+PJyqLfX28xfdd8QkI2VneugnXvw35otCpbmBtWNB6wTt/hjY6eSr08rLgSPssywWiKF+G6
 cjbjCJE2cX+R/fFzTcDeIJwab6rQ==
X-Received: by 2002:a05:6a00:418c:b0:81f:3d13:e070 with SMTP id
 d2e1a72fcca58-823411df004mr215116b3a.12.1769299931419; 
 Sat, 24 Jan 2026 16:12:11 -0800 (PST)
Received: from at.. ([171.61.161.234]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e5d0sm5608273b3a.61.2026.01.24.16.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 16:12:11 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ingo Molnar <mingo@kernel.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Pompo <francescopompo2@gmail.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] efi/libstub: Enable apple-set-os for all Apple Devices
Date: Sun, 25 Jan 2026 00:11:00 +0000
Message-ID: <20260125001111.1269-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
References: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 25 Jan 2026 13:48:52 +0000
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
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:tzimmermann@suse.de,m:mingo@kernel.org,m:bp@alien8.de,m:francescopompo2@gmail.com,m:lszubowi@redhat.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,ursulin.net,ffwll.ch,redhat.com,suse.de,alien8.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4884480D58
X-Rspamd-Action: no action

Enable apple-set-os on all macs, as
apple-set-os is needed to use eGPUs and the iGPU.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..60e1a41bfe5f 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -303,32 +303,20 @@ static const struct efi_smbios_record *get_table_record(u8 type)
 
 static bool apple_match_product_name(void)
 {
-	static const char type1_product_matches[][15] = {
-		"MacBookPro11,3",
-		"MacBookPro11,5",
-		"MacBookPro13,3",
-		"MacBookPro14,3",
-		"MacBookPro15,1",
-		"MacBookPro15,3",
-		"MacBookPro16,1",
-		"MacBookPro16,4",
-	};
 	const struct efi_smbios_type1_record *record;
-	const u8 *product;
+	const u8 *vendor;
 
 	record = (struct efi_smbios_type1_record *)
 			(efi_get_smbios_record(1) ?: get_table_record(1));
 	if (!record)
 		return false;
 
-	product = efi_get_smbios_string(record, product_name);
-	if (!product)
+	vendor = efi_get_smbios_string(record, manufacturer);
+	if (!vendor)
 		return false;
 
-	for (int i = 0; i < ARRAY_SIZE(type1_product_matches); i++) {
-		if (!strcmp(product, type1_product_matches[i]))
-			return true;
-	}
+	if (!strcmp(vendor, "Apple Inc."))
+		return true;
 
 	return false;
 }
-- 
2.43.0

