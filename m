Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E86D55FB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE1510E2DA;
	Tue,  4 Apr 2023 01:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0325110E2B6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=teftSvf3j+oDEfh9blmwCCDYEJcHPfUL8pF7dJUM03o=;
 b=NqFZbJqifYaG7/Y9HcDCPiTkFjb9OkWhM9tDVMF1GfgHCF0tnw8+Q1nu1v4nNr8xHo3/fW
 HgdyU/9s3mbKX0nOG1RLcWDrRktvwr7RJO2GM9SMtOW4qpuqke2DWjXAndEFDY3ZLGH2oL
 gDo5gXAQuQAOs25HAZ/fYxZADt7QL4U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-oNttiJ-pMxCtA2rfhiVs9A-1; Mon, 03 Apr 2023 21:28:38 -0400
X-MC-Unique: oNttiJ-pMxCtA2rfhiVs9A-1
Received: by mail-qv1-f69.google.com with SMTP id
 h7-20020a0cd807000000b005dd254e7babso13899529qvj.14
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=teftSvf3j+oDEfh9blmwCCDYEJcHPfUL8pF7dJUM03o=;
 b=OMvwqwZBC6GjSY/NffdvrAOIb8V3WWPo4wIUarmK6BwGTVluuNeQK/ifJmB5dVRJ7e
 6/xuDCim/NSNTXIppqMfvHkxIbEM8Ujkmvi3TYYNl4iEORQv0RbSKhXKB1JQJebKlS/9
 gbzhEfksNrdf0T/9i/w0bLgvP+NHXIwqz5CgglFok8WBD/CA/YpODvm/HFWG/4CSX1Ie
 lzDqaNLTYXDQWXpWsolicmWRCN9f3OGmld4XEq2/rp5fynHVk0PXFppzL41Hi1+Q7iWG
 Rw8AK2z3XemYnOat/i6b1wM7nWmV4CeTWYcPMvu3PHWoA3jOgZ2bK2ZFLWout1/4f2g0
 oiRw==
X-Gm-Message-State: AAQBX9eYVCrYBM97ho0J+F4Ukv86ru6Bf/TS6vBjosyMP+k41uBE3CyZ
 kC1k78BPimK1+5ZXBDZ3tbPuXpcgFAo9cTlu729RIlrAx7BkSIwg6M8YEpwRnjMOO1hKv1YCTWo
 mzqjOxrvl1Bmb6JRK/+cTu/WJ9lnx
X-Received: by 2002:a05:622a:198f:b0:3b9:b70c:9697 with SMTP id
 u15-20020a05622a198f00b003b9b70c9697mr1012254qtc.5.1680571718498; 
 Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bbiryGVTITqdtIsbZB0xVNKw9hfnyjZ3IusPT9JnYkHi5X/4j9GN4kCg0GViAYb2/AR5XwFA==
X-Received: by 2002:a05:622a:198f:b0:3b9:b70c:9697 with SMTP id
 u15-20020a05622a198f00b003b9b70c9697mr1012244qtc.5.1680571718299; 
 Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 de27-20020a05620a371b00b007486d9fa1d7sm3185102qkb.95.2023.04.03.18.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, airlied@redhat.com
Subject: [PATCH] drm/nouveau/disp: set varaiable gv100_disp_core_mthd_base
 storage-class-specifier to static
Date: Mon,  3 Apr 2023 21:28:34 -0400
Message-Id: <20230404012834.1914225-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c:610:1: warning: symbol
  'gv100_disp_core_mthd_base' was not declared. Should it be static?

This variable is only used in one file so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 115d0997fd62..4ebc030e40d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -606,7 +606,7 @@ gv100_disp_curs = {
 	.user = 73,
 };
 
-const struct nvkm_disp_mthd_list
+static const struct nvkm_disp_mthd_list
 gv100_disp_core_mthd_base = {
 	.mthd = 0x0000,
 	.addr = 0x000000,
-- 
2.27.0

