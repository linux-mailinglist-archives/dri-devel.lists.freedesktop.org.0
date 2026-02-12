Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOtFLZUbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1FE1288A6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458C10E6A1;
	Thu, 12 Feb 2026 00:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5rUjG4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44F10E685
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:58 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id
 5614622812f47-45c87d82bd2so4653339b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855297; x=1771460097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yakd/+A7iWMnrWrjp8/sGAGEKW9yzKSedIRwZF18FUA=;
 b=E5rUjG4h6s5clOUKAjIKolF4s2r4anduIb9H+hzf130aAcROYJaTFDQDfctr04ZDhH
 d03sss3CRTIkglAqem87udjYNPd9yXBaRjl1z9f0CAHB7fhJyZAknUNTkFvhT5uQDsHm
 JtupmkOwejxcha0PB39e2KkA9VMs/t7FsV8fVVk7Fz1XG1So8lGEiJN9y6S6j21uy8Ux
 XBchVc/X8ypDxVc9DeIYnf0qlu7iy2t1ky2w4G/njjXK3EIlqtPWHAxr5G9dQ4nuaw8u
 7d6aMqtciiTOHcyGMD6krd9uwYx6eE1faOmndBzASKMZPtCtmiuunCqhQX3wx9Wcu6FY
 4POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855297; x=1771460097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yakd/+A7iWMnrWrjp8/sGAGEKW9yzKSedIRwZF18FUA=;
 b=J84l2t+4GgBfj1lksrPNQ6C5cBTFBA4J0BEPEi507dNxRN1IZjNlCya5Yhe9bs01ot
 rsT0rxgAdw66syUSn+zvbArqfLht1bh+CpaIBUrwvoTwJTownFma46PjgrHYebTTIfGk
 vRLp8KEWD5J00CxMKwXbm1ikiDPxHYQVwCIrbFqlkZ2MCCA2Hp1GL7+SYDeYkHWpb7RR
 OYANnFN/9TAvXdRHD/CVAKKM0IqKCJtdGtaSaYinXeTPFe/gcWdGBHJZFqqkgIEsc3qz
 +AcDe8gV/zgZFO4NrkRUWA+IuQ0iVv9+0rvcroJLgm9SwLy9mFsUD925BsfgCMK/AKrN
 036g==
X-Gm-Message-State: AOJu0YzSVPL5CFBWWvEXlc04VP6M0L4b5ftXLQjp2pYzYifEyf0pyY4b
 MI7Y2BOP8Fi9Uvnw8HstEU7O5hPgjzlgoRIXpP41xqiitV2tIpmUI0X3aeJjU06d
X-Gm-Gg: AZuq6aJOvdwxLPH1hqW7ebPKthRUpEMFCic4hjcpp67dT752bokWafaoqxuL4SLcFLi
 LmElUliFhaTY0UY/ku0Yrrvj90dBKANK7w8dh22At2Nj8ZfqLt/c+IdHK5VnTDaeh0FyR58JPya
 H+fATr8m7PdYDyx91iv+uzCHkfGPI0Tp2ot21l4fEbVyEpkfZCCGxMLlyIJDcwlQCzUhrvIiaVr
 5bebr0osuFNSbZ2uzDMUpI+BLiiXqcd9DjW6w0iKSowVMSOaf+2JjTFn8IKckkRlFyXRkPWSKT2
 ZIGgbu7IrYnV3VN9wukADKYFVo2Vh9RcuOGndzBdIHsKkkQ6FcsqA8aivJRZNUF2UlsH7Pz4xQ3
 nv5VvotXsIJZ44bXciM/gjnOwnCZakvYppgwG24+3h3aUqQ6n/8SJ+3WN6bXdjxYJSgtzuxLC+k
 /brQEkJdLc/ymoqQEee+1/NRv4GUvu30V/iN/HVA2BbS35Z3+iiks+
X-Received: by 2002:a05:6808:d46:b0:45e:8557:e7e4 with SMTP id
 5614622812f47-4637b92fd91mr509168b6e.66.1770855297067; 
 Wed, 11 Feb 2026 16:14:57 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:56 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 41/61] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Wed, 11 Feb 2026 17:13:36 -0700
Message-ID: <20260212001359.97296-42-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-41-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
 <20260212001359.97296-41-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 5F1FE1288A6
X-Rspamd-Action: no action

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f9fdf19de74a..057d37f7908a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -45,17 +45,7 @@
 
 #include "drm_dp_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.53.0

