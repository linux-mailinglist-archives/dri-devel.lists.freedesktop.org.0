Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A36DA20D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 21:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AE810E264;
	Thu,  6 Apr 2023 19:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1667F10E264
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680811105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LRqwdTQMWkbHJObb62Qyqd5cmfrq+lMBU33zKFDK0cA=;
 b=VO96n2bGTU/YzYB71Qq2wcqF9UiUzCyzJzq3yw665XitJdXIJRtgBN+Ho9g362N27HnLEt
 w6779i7hzBpaU68AwjeQ2D5oh/Z8n3K3WqFxB/gorBRgol/xahG2vnanSAvcDMlhYG0P9v
 UVJ8mGD74PKQ1qxTbQkLkyNxvqaGo6c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-x6FLPFMoPemkOS4vEB0jJA-1; Thu, 06 Apr 2023 15:58:21 -0400
X-MC-Unique: x6FLPFMoPemkOS4vEB0jJA-1
Received: by mail-qk1-f200.google.com with SMTP id
 c80-20020ae9ed53000000b007468c560e1bso18394445qkg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 12:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680811101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRqwdTQMWkbHJObb62Qyqd5cmfrq+lMBU33zKFDK0cA=;
 b=Cm4rSlrFSsXqwuzuRIobnAvlmQewhx2HFiAl2dBSeUlQrxu2SokvWtH0OgJSxjou4F
 Dib6CeNtXsT2w/9JpGwghmOiR+23vCci7EgQnDoSoxzDyku4/eSzJHkavJ+2VcZO2Sld
 GbUHhtPwMsYEYJOKofa+3+kR8nXDPELzl9qjxYu58hnyAWL/IPstnOnn5Eo3ER0euH7m
 XaKQmvOrTFpiRI0RoQlcV8qCzowAg+98J8ftVvlZheWmAHDXcVml09F+MUVsHIn4YlKX
 2eUDSYhlVk9XyNr3INQrIgM3rNOltJrhWfYMb+sqNMF1XLCIJZvMnGEt+YytKH+TYr7Z
 AUsA==
X-Gm-Message-State: AAQBX9cvfCHYNa4EbXTKYSM4bWv1LvZXokFiOqRnZm3XF6Uzv0KmKXDY
 j1OPsFSQgDjGtxxKGmQue4RjnZ0+la5g1gOJR0S22JRsVsLYSJju1bd7b5djYUfs4xvyPZ4wkvH
 VITE4We52Ou3vJ6hC/0nbyBekn4Fy
X-Received: by 2002:a05:6214:d88:b0:56f:52ba:ccf7 with SMTP id
 e8-20020a0562140d8800b0056f52baccf7mr730996qve.14.1680811101487; 
 Thu, 06 Apr 2023 12:58:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zp+eBXfawoiv3Bq3fAJCCQ9Lkm2x6dWbrn6iRjoMte3WoDewQoxo6DwdNhkhrR4LeP5Aop1w==
X-Received: by 2002:a05:6214:d88:b0:56f:52ba:ccf7 with SMTP id
 e8-20020a0562140d8800b0056f52baccf7mr730984qve.14.1680811101252; 
 Thu, 06 Apr 2023 12:58:21 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 mk21-20020a056214581500b005dd8b9345f0sm733097qvb.136.2023.04.06.12.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 12:58:20 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Brian.Chang@amd.com,
 Martin.Leung@amd.com, David.Galiffi@amd.com, Ethan.Wellenreiter@amd.com,
 martin.tsai@amd.com, tales.aparecida@gmail.com
Subject: [PATCH] drm/amd/display: set variables aperture_default_system and
 context0_default_system storage-class-specifier to static
Date: Thu,  6 Apr 2023 15:58:18 -0400
Message-Id: <20230406195818.1958162-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubp.c:758:10: warning: symbol
  'aperture_default_system' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubp.c:759:10: warning: symbol
  'context0_default_system' was not declared. Should it be static?

These variables are only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
index a142a00bc432..bf399819ca80 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
@@ -755,8 +755,8 @@ bool hubp1_is_flip_pending(struct hubp *hubp)
 	return false;
 }
 
-uint32_t aperture_default_system = 1;
-uint32_t context0_default_system; /* = 0;*/
+static uint32_t aperture_default_system = 1;
+static uint32_t context0_default_system; /* = 0;*/
 
 static void hubp1_set_vm_system_aperture_settings(struct hubp *hubp,
 		struct vm_system_aperture_param *apt)
-- 
2.27.0

