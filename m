Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4F6EF341
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 13:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E238B10E04A;
	Wed, 26 Apr 2023 11:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38BF10E0E5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682507927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D7k9+FthuusJl7if54fxaYap+uFJWroS2RQ6a9bGb4Y=;
 b=UsK6itzuHAEJjAUvSgc3CD49PlveMMUaU+Q4FMPZwv5TKK28OUCdSv4x3DtHAs1/ndowfO
 bKDTs7W/DowhlqHu4t58DUcBUQk2/rzIGJ0x8hbsKTnejkz1/Odp7ASpfWHV2Hisl6IrX1
 F/pKhkOkGqL6AMjNVWifMsVc0T9jlOg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-VczmVpsZPeuhFSWaFdhrGw-1; Wed, 26 Apr 2023 07:18:46 -0400
X-MC-Unique: VczmVpsZPeuhFSWaFdhrGw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-5e7223aab07so42920216d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 04:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682507925; x=1685099925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7k9+FthuusJl7if54fxaYap+uFJWroS2RQ6a9bGb4Y=;
 b=ORYM+42bB/uRN5jMFy1Gqdd9vNxOtAMk/t1OI/F74QMCHZP1gETGIGBgzUXw3K2FOI
 ECqUQyAlMWba3HljtHPZ39pm/nmKgbJT38xoy4tGQ78nnP15iZ7njl8AQzrGC2C/dPSo
 aB2P2TvQ36nuVyZxFWGFu1Oyy+PiH9qEuwuWLmjR6yv6teALZe2U8pgwqTC2lGaleCx/
 chwbCFUnlgaxdmUHy6xrI8Dr6XLHfoLOplBgeAMqVPmqihi191A9ncOKE4XzpFUTIVBB
 JdSugsAtFoqTlhnG4MY3FGvSG8fLLSdM+wJF/+4JGuPBniqjzJvnJfFYRnV7Dc9mPu/E
 AeMA==
X-Gm-Message-State: AAQBX9fOl2kt4LHPCrW6/NY1qtXeFhzDUkUmO5TDWlAEYd1EE8EvQuEs
 O1l3CDZ5IuQBGnBEbL20Nbp1greoJHS8R96vMDSRI4bC8aDdSo8o5J3Wwm/9zwzugbnvisZDj9S
 td/FdnXv9uP9jRIUcfZ0/I9hPmEka
X-Received: by 2002:a05:6214:262a:b0:5ef:52f0:7b1e with SMTP id
 gv10-20020a056214262a00b005ef52f07b1emr36095405qvb.31.1682507925269; 
 Wed, 26 Apr 2023 04:18:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yei+ST19kHCsL3KHPalEzKbRARMslLTCav5d681fG95b97NunP1uQSjWSZdSykEIvd9sYpKg==
X-Received: by 2002:a05:6214:262a:b0:5ef:52f0:7b1e with SMTP id
 gv10-20020a056214262a00b005ef52f07b1emr36095368qvb.31.1682507925004; 
 Wed, 26 Apr 2023 04:18:45 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a0cf551000000b005ef59a383e6sm4789002qvm.119.2023.04.26.04.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 04:18:44 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, qingqing.zhuo@amd.com,
 hamza.mahfooz@amd.com, Josip.Pavic@amd.com, robin.chen@amd.com,
 alex.hung@amd.com, dingchen.zhang@amd.com, jiapeng.chong@linux.alibaba.com
Subject: [PATCH] drm/amd/display: set variable custom_backlight_curve0
 storage-class-specifier to static
Date: Wed, 26 Apr 2023 07:18:38 -0400
Message-Id: <20230426111838.728441-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:119:31:
  warning: symbol 'custom_backlight_curve0' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/modules/power/power_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 68d95b92df76..30349881a283 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -116,7 +116,7 @@ static const struct abm_parameters * const abm_settings[] = {
 	abm_settings_config2,
 };
 
-const struct dm_bl_data_point custom_backlight_curve0[] = {
+static const struct dm_bl_data_point custom_backlight_curve0[] = {
 		{2, 14}, {4, 16}, {6, 18}, {8, 21}, {10, 23}, {12, 26}, {14, 29}, {16, 32}, {18, 35},
 		{20, 38}, {22, 41}, {24, 44}, {26, 48}, {28, 52}, {30, 55}, {32, 59}, {34, 62},
 		{36, 67}, {38, 71}, {40, 75}, {42, 80}, {44, 84}, {46, 88}, {48, 93}, {50, 98},
-- 
2.27.0

