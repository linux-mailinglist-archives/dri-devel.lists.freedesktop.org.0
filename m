Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0POFBnGkgWnuIAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:32:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60EBD5B7E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F259010E553;
	Tue,  3 Feb 2026 07:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gTonk76a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EC310E556
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 07:31:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a9296b3926so1719405ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 23:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770103917; x=1770708717; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuaUAhd1+lDG6wBrbXZqMO2C5ILHdpZJbCQrItpX1Ck=;
 b=gTonk76alwH4yy8cx56qmvYfNpF1qCr0VU3ZwOVfQHWqOtiQcdIADX8mXwke0XmEvl
 XwzkUqMRzPA/B01o27K+jQ/kyHqiWLf7RddTa7DpUc0AtpA4NAiZ6+aE4p3mfUYC7Q9O
 ylfYpflz7pkRzoB7A81s3wFF/OgjSWN+dvnwmqdIR8PPH2XpkJYlC3UpCXwcpaSryPwR
 u4P/Zp2DCq/OFGwWmsB4aop0TABTvvsJEXTle5bA38X6HbGGEqZSveUN62vyB2beS4Wh
 UoE84yTmaCH1ZF4gOEQ1y2Lo2RbMuJsoGfswOzWWsnOXf//uqCz0w2fk+hePAljr/byF
 PYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770103917; x=1770708717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JuaUAhd1+lDG6wBrbXZqMO2C5ILHdpZJbCQrItpX1Ck=;
 b=b/0hTFgReccTWi0qUy/0dA45wTe+1X/b9F8JYd0RUFc5AKZEIf319P+ablLHgtUjju
 1rdIddeGe3Mo0Gdxl3cmBzfKBixGJ2LRPcURE103odVfkpzFk6VoYEYN6Up3q+5UE/Ld
 HszaWGgsiKzbo4HV2PHKgdjH2OtSqEkoOAw+BtYRkUnflTpA/Qfv2JoAJUH05P3aj4tk
 cigmGW/bY1xM8YtASXaz540t0uzjfRqpPgdvcRN/8WDD16Bc+rvLPc4zXRRlWZANDqjD
 5kibY6ZojX4j31ixH359UyQlKE5J1z3NOa53Cu9rpGPKpSfTAEyHsMM+npw2ozFGvuR0
 +TEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpjOVgT2DTaYYi83frXVDqnZIVAqi/lcWIWA15oX/Fk34w43KXBVGQgg6Qu2pthpzJvlwViqGiApg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3LcDNTAD4+dpXTkBB8h1N1+Q/3LKYGXUb5WynTam16rmiuoa0
 TDVW67bHHwkIHqGEi5/nvVyOYt2kpg4uWzVHGfmtaEYRHq9qrxjNyXo=
X-Gm-Gg: AZuq6aJhzAdIHzlv4WFkbIB7tWAQDxD4wCKnZeasBrDG6F9qHu+tGr3W5LsgHuV7S1v
 cleKScmpUg01jdG4yViVEZ7oGZyT5iMDntvJ3pn6zzpqqhvwIuc9W69rG8y6Vhs41btBWjcemHA
 ltC8OGUmYnlo3lqBYmPSuXV2zatr3txNZiOr4u/LZqWa8SohG+k2MDMxlT65jWJVRQ5VsxySPbR
 a0CZ0nvEOnN+Qs+tnubV5KIDIpllmYkJXwXDssTNeerKWg8V/Xf/p3jvKkcvpL8bEzsZskBZtdw
 LMmrRzCXAlBY6JnRgNeUd0WvhKYRW+ddqzNmGdnVwdcoVdRNojCBVfyPVVbdYkRIEV+7rHgAs4T
 pGXEc3yokeLZX61IZUQUFII243J/yYz5LTklucOfZTwd6STsxFy0RWWA1ra3YpU+thi/VZ717SO
 HJN1e5b0B0GyPl46EurQ+jQKQ5Hw==
X-Received: by 2002:a17:903:1ac8:b0:2a0:d728:2e79 with SMTP id
 d9443c01a7336-2a8d7ed9bcbmr138418055ad.16.1770103917493; 
 Mon, 02 Feb 2026 23:31:57 -0800 (PST)
Received: from at.. ([171.61.163.171]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8dc225534sm108280865ad.68.2026.02.02.23.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:31:57 -0800 (PST)
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lenny Szubowicz <lszubowi@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Pompo <francescopompo2@gmail.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] efi/libstub: Enable apple-set-os for most apple devices
Date: Tue,  3 Feb 2026 07:31:17 +0000
Message-ID: <20260203073130.1111-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
References: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
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
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,ursulin.net,ffwll.ch,redhat.com,suse.de,alien8.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:tzimmermann@suse.de,m:lszubowi@redhat.com,m:bp@alien8.de,m:francescopompo2@gmail.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A60EBD5B7E
X-Rspamd-Action: no action

Enable apple-set-os on Apple Mac systems by default.

Exclude MacBook6,2 and MacBookAir7,2, as enabling apple-set-os on
these models causes regressions.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..532a713adef5 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -303,15 +303,9 @@ static const struct efi_smbios_record *get_table_record(u8 type)
 
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
+	static const char disabled_product_matches[][14] = {
+		"MacBookPro6,2",
+		"MacBookPro7,2",
 	};
 	const struct efi_smbios_type1_record *record;
 	const u8 *product;
@@ -325,12 +319,12 @@ static bool apple_match_product_name(void)
 	if (!product)
 		return false;
 
-	for (int i = 0; i < ARRAY_SIZE(type1_product_matches); i++) {
-		if (!strcmp(product, type1_product_matches[i]))
-			return true;
+	for (int i = 0; i < ARRAY_SIZE(disabled_product_matches); i++) {
+		if (!strcmp(product, disabled_product_matches[i]))
+			return false;
 	}
 
-	return false;
+	return true;
 }
 
 static void apple_set_os(void)
-- 
2.43.0

