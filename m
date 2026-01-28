Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMk4Okwkemmv2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022BA3645
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C632C10E6F7;
	Wed, 28 Jan 2026 14:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V0bpNCWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61E10E6F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:59:21 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a07f8dd9cdso50605755ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769612361; x=1770217161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGJMSx3RqPnXMSF3iMxugpnUOfI/BDwqereywSHSzkk=;
 b=V0bpNCWmd9FiAigqm+GuYwtU+mHfiutsz9vVoozfpdf+invJK3YjfcBqRwK5COemIZ
 mDNfN52Vd8Cc5jM7R7aYViNbi32DmEpLVGgMSgs+SUkzLhn2tMBwpjhw4ObpBx8ineXt
 RQFZnrn6pL+Y0bOWo4tQ2csQ/fbDnfjD7Xk7dkF1BOGtIBRyyDTKqIIoPXHaN+eEEJsc
 7vNvA4Yi068bJS4X0HH/NiVIo6uUztJRibK3J4JFO0iF2dOlEDY14WMf8cD6WquiZpMe
 XlJhIo03KzzMIQMDN7+Eq2YVjhlIlAkq1u617qO75OYtZY2Dgx/ONpFNFrrxcXLk+dcI
 080A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612361; x=1770217161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vGJMSx3RqPnXMSF3iMxugpnUOfI/BDwqereywSHSzkk=;
 b=fGJ8Wpq0+QcLaJdqAh1eVgpmTjJmZHhkSk8eDL1fFEkUnHMvXyQ1lVqkF4Y44MBZUi
 6i3wg9h+LZaTksrZaL0za114r8YCJOod1sqTeo1NG+ARs5w+ylVx+2/dCLV+6bOhhp2Z
 5Qs222LLOhCaF8ZRPmJ/vRMgRQdcz54hsDLVHa4ZnUI+jOJ2ECDb+TU1xdVK/F4oaX6/
 jCIFLcCx9kmkec/BeO+w3EJsorxoA8aZAZRYE8xkFDOZVpSWfWdY1Gd+vyAaDjL7adg6
 +tq6w1wcTmrxk+/o1sV0yOM9v/euCTdK/tV3luvozBrztnMjCzlNMe5LPYUbgteM2B3P
 ZI5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX28N/EaYCSbLBVEIt/ACAdqNz0tJEwewkoJtDUs11NgrE3sum6QONjWetmbyD7dqqgbzf92nCtiSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZyo90lCYaa/D3G4GurPFxef9FYnHKx2l5DKdB8amEEKQ/qHBB
 9/3/V9rBGCvxWNDwe7n/i+GApwtE4HO5HrXbvxOq7gFa7KFEeZantXY=
X-Gm-Gg: AZuq6aIc19ztfCIW8n6FoRXSUg8BHoU+oQtF5JMTNmQFtsN3xGALynaoVllCz6rQ1Iv
 nIlC2DDxZ+cxU4jtc/1239lyerfktpIsfAn4tFYAcVi1K+T6sDSjJZkYS6gyQNaUg5D+ImOXpg8
 GE5/VOLj6vnZqEud6JArRmfUYBCwLT4zVs7qgBj3MWK2+ZEmnWfAhVCREeq8Maz5exVm+Gkv3qn
 dBYzba7vonNs9TyF64TaXKiSjbItuncH7P3CzW1LO49Ca3tLYP4lf3zPturbrsBWXCxZoF6EdS1
 sihr379HkVm5DnUm1vHvWBIbBE//FMkSbol8RG7Bo7VYlsS5VuBUQdSQVes0txRf83P0tNWzSea
 mIaelskaRhxWBOEQbJFNpoVitqkbUA8QfC/KKtnr9if1B304J58PPKFIRdNuItHpMx5sS8c4SN1
 qdxRy1t33UoNwpvBz6WCvePbg=
X-Received: by 2002:a17:903:4410:b0:296:2b7a:90cd with SMTP id
 d9443c01a7336-2a870db7c28mr53750585ad.32.1769612360659; 
 Wed, 28 Jan 2026 06:59:20 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm25820235ad.79.2026.01.28.06.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:59:20 -0800 (PST)
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
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Pompo <francescopompo2@gmail.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple devices
Date: Wed, 28 Jan 2026 14:58:37 +0000
Message-ID: <20260128145855.1071-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:tzimmermann@suse.de,m:bp@alien8.de,m:francescopompo2@gmail.com,m:lszubowi@redhat.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
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
X-Rspamd-Queue-Id: 8022BA3645
X-Rspamd-Action: no action

Make apple-set-os run on all macs, as
apple-set-os is needed to use eGPUs and iGPU.

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

