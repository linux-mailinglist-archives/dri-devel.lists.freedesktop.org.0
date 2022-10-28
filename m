Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C36109C9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 07:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9F10E75C;
	Fri, 28 Oct 2022 05:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2AC10E75C;
 Fri, 28 Oct 2022 05:41:34 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so3583023pjd.4; 
 Thu, 27 Oct 2022 22:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5h1uqHInDk0I1emW0j0vM0oqjvApQuj+THRSewTlOpA=;
 b=SbzX8SLGaIh2otqVVFv5ZIRm42Vm/IZn26w2jy0c3lFOlh7No0+2E9QVPHm4o5gNnh
 JGgzYKd3OKxHwNTzDHDWdlCjTdlGft8P+VLjbdUanaDb0G/dIFoRvWDHjusRyb/AuW5f
 GDc/ktimhgqu9frifKdT7qsUiTP2KAJBxRfTtsHuUlXA9hpR5l6bKAvUqeO3xw2+xril
 vEfPjByXk4QPkWvOyd0ROFz9LMfsf5O+SXwcd6T5wmpQ6wFHh0tfYYdLZCAVuJuUXxmx
 Ks8jr3+Niz1BhqZgOrvZTgy8kApxnAkM1H1TM0XahdN5Y5wCGZdKczg5Sr+UAQiwIO+L
 ktKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5h1uqHInDk0I1emW0j0vM0oqjvApQuj+THRSewTlOpA=;
 b=wAXmpe0szFkNSXJKwgDRYEAtoljOVQzty6EYrk4wJ7suG3jMvTE+z1kYh7sBSy4J5Y
 CVY/+1YVyQNc+XXWEORpuZHs8nipwNEAXDGsAHudfoVe0fUsMB+JAqqHKBelL9zCKprh
 sigmfufzGHtmZXoHtyIRF5FV49uhGwdXjT/lHfgizG+pJbS3aGBd3tylxkpzgZJJ2qZf
 C+VQhMAwgezjnv/hkkcMRWdZPjNkW75ct7qr5wFMgKVnROtrZs5upWTd6zPCz2bQfYsB
 5rVfbxsUoZwm6uukThdGeGmCHvBt7EPgutBN12ucnURHWDgJZbpuLxtQSKXeJQ9QJw7D
 oBSQ==
X-Gm-Message-State: ACrzQf1Zo5kGHhQAhNCK6UL+TEq6WTVMjDeHzqnl14sG1Pd3Q81sxERG
 37NPlvzFOKxAN2/DDMVSFTs=
X-Google-Smtp-Source: AMsMyM74U+GHRlbS+IT1ksUQflSJtoFhADFBb2GzOHO8M2cLyNXJeFO72V3r7BEjfD3dqjhnYCt+CA==
X-Received: by 2002:a17:903:2305:b0:186:ed93:fc3f with SMTP id
 d5-20020a170903230500b00186ed93fc3fmr6506725plh.15.1666935693570; 
 Thu, 27 Oct 2022 22:41:33 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 i2-20020a170902e48200b00177faf558b5sm2083579ple.250.2022.10.27.22.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 22:41:32 -0700 (PDT)
Date: Fri, 28 Oct 2022 18:41:25 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] [next] drm/radeon: Replace one-element array with
 flexible-array member
Message-ID: <Y1trhRE3nK5iAY6q@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One-element arrays are deprecated, and we are replacing them with
flexible array members instead. So, replace one-element array with
flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
refactor the rest of the code accordingly.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/239
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/gpu/drm/radeon/atombios.h        |  2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index da35a970fcc0..235e59b547a1 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -3615,7 +3615,7 @@ typedef struct _ATOM_FAKE_EDID_PATCH_RECORD
 {
   UCHAR ucRecordType;
   UCHAR ucFakeEDIDLength;
-  UCHAR ucFakeEDIDString[1];    // This actually has ucFakeEdidLength elements.
+  UCHAR ucFakeEDIDString[];    // This actually has ucFakeEdidLength elements.
 } ATOM_FAKE_EDID_PATCH_RECORD;
 
 typedef struct  _ATOM_PANEL_RESOLUTION_PATCH_RECORD
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 204127bad89c..48de2521f253 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -1716,7 +1716,7 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
 							max((int)EDID_LENGTH, (int)fake_edid_record->ucFakeEDIDLength);
 						edid = kmalloc(edid_size, GFP_KERNEL);
 						if (edid) {
-							memcpy((u8 *)edid, (u8 *)&fake_edid_record->ucFakeEDIDString[0],
+							memcpy((u8 *)edid, (u8 *)fake_edid_record->ucFakeEDIDString,
 							       fake_edid_record->ucFakeEDIDLength);
 
 							if (drm_edid_is_valid(edid)) {
@@ -1725,10 +1725,14 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
 							} else
 								kfree(edid);
 						}
+
+						record += struct_size(fake_edid_record,
+								      ucFakeEDIDString,
+								      fake_edid_record->ucFakeEDIDLength);
+					} else {
+						/* empty fake edid record must be 3 bytes long */
+						record += sizeof(*fake_edid_record) + 1;
 					}
-					record += fake_edid_record->ucFakeEDIDLength ?
-						fake_edid_record->ucFakeEDIDLength + 2 :
-						sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
 					break;
 				case LCD_PANEL_RESOLUTION_RECORD_TYPE:
 					panel_res_record = (ATOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
-- 
2.37.3

