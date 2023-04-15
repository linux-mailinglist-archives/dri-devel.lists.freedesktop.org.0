Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6F6E3212
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 17:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797B010E085;
	Sat, 15 Apr 2023 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF41B10E085
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681571855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q5M14rzEqBNgFK8HU9Akt9HYXKL8QNDYAZuFGTil5ww=;
 b=IeWwTi3qnBgJXkFpFIr192b2+IEzBIkDoPQ3VFKfcy4meR7rJF4kICz8ffiQwex8EORk7r
 XPgf/ZSozctHpZ0uiA+giYxDNfOEzAeglrx6ynWQfR6SD7LPDvqrfbitbNDrnYp6vGCpL2
 hk/XMrDJOGkM6qGA5sN8GEa1+iWhr9I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-7xJhIY7AO0eteAOHjs6fWg-1; Sat, 15 Apr 2023 11:17:32 -0400
X-MC-Unique: 7xJhIY7AO0eteAOHjs6fWg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f8c2258b48so77047f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 08:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681571851; x=1684163851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q5M14rzEqBNgFK8HU9Akt9HYXKL8QNDYAZuFGTil5ww=;
 b=OnhMslLbfJtzexOONP/gmGujj+OD7SPl+Ixl8mAjLWMqkYHA6rTdWX3ASCcL9AwOF7
 MKUSRij8K8+IDokMhb5fOlfMrMDDg79HqkeSpK1sBLE+OVJI5LJ7uhVGiUmWhH/q6MAn
 exhRshvdbwQEjEOtix89OkxF+eqmey8lMRxzdQA9KbJo4H5DT/5WY6vL/h6DJwMvbuqY
 R0700CL5hgcrA1uJ9jTLt/+ZOFlNfCa9mBbi8AFGM16AG3brFjRRCRG1re+BycTWz/+o
 0t0/MTL9a8+xYc7DkfA018+OwewVf4TAm+hT2smzowiX39E1Hh1WUfbSzOkWpsr/PqKs
 Te1g==
X-Gm-Message-State: AAQBX9eS3MDKvOQf6NFb/yOyzMgAiBJSv//Vnu+UXADTxMJE998VtKNM
 vXynSfPTxbhsN82dUXtRj7m/T4Md9s5zYeJ7DUbL0IOauHrsetGywTUwZxVrlbzijK+9Vlq0iUR
 YM8yAjnSY2nBS2oQAGNLfHcaYtHLT
X-Received: by 2002:a5d:5248:0:b0:2f9:a75:b854 with SMTP id
 k8-20020a5d5248000000b002f90a75b854mr479303wrc.59.1681571851273; 
 Sat, 15 Apr 2023 08:17:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZiVk0AFMX3CN+Ea1tpGa+ZETudf89c2CORBo70Q1fyjzBSsB+LBm6h3/+QEZQTcBxaKCvJSg==
X-Received: by 2002:a5d:5248:0:b0:2f9:a75:b854 with SMTP id
 k8-20020a5d5248000000b002f90a75b854mr479290wrc.59.1681571850835; 
 Sat, 15 Apr 2023 08:17:30 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adffe4d000000b002efb139ce72sm5953488wrs.36.2023.04.15.08.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 08:17:30 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, nicholas.kazlauskas@amd.com,
 Syed.Hassan@amd.com, jdhillon@amd.com, alex.hung@amd.com,
 michael.strauss@amd.com, aurabindo.pillai@amd.com
Subject: [PATCH] drm/amd/display: set variable dccg314_init
 storage-class-specifier to static
Date: Sat, 15 Apr 2023 11:17:22 -0400
Message-Id: <20230415151722.3188010-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6: warning: symbol
  'dccg314_init' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
index 6f879265ad9c..de7bfba2c179 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -274,7 +274,7 @@ static void dccg314_set_dpstreamclk(
 	}
 }
 
-void dccg314_init(struct dccg *dccg)
+static void dccg314_init(struct dccg *dccg)
 {
 	int otg_inst;
 
-- 
2.27.0

