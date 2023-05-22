Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0A70BE5F
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A59910E111;
	Mon, 22 May 2023 12:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A2810E303
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684758623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g9y4gjNLxaDEH24wDgPXKc3Vz5FcUbglHfFP6OwJ8o8=;
 b=e+8ABH2Hr6XRv01TWzWENYGo02ty0LL03ZBWAPlqIfpoodEtgqxFaTFBurJOOVLEvd258w
 fNmUdx9E1ypaSooqBh5G0v9mZLauFyMBE7QKTUe2P65oeGySmLCMksUyvsN7KArL02EPTx
 kvB870eB/eJDXlsLgW97ZadZ6AQqLL8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-3x_1xXvaNV6v_mVsh1VFmQ-1; Mon, 22 May 2023 08:30:18 -0400
X-MC-Unique: 3x_1xXvaNV6v_mVsh1VFmQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-75b04cf87c0so127089485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 05:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684758618; x=1687350618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g9y4gjNLxaDEH24wDgPXKc3Vz5FcUbglHfFP6OwJ8o8=;
 b=ExWHeIcdCjKTHkQAAcr84ogZXyGrN9CTQ+Xyv96WePjH3a5QtUFHChX9OkOViGNsyL
 MvLV5MGSKjBlWpEr12dol9hHMPSstrfIxiw/JjH1CqYdxQ93fxFhWBzRZUtZ3+NQm+Uj
 4LDVEGldh4goRCJLLV+QVo+nOW3MacmbLpbEf/MyPBuy69AGUyF+5DQd6YaXiybHe8M0
 U28dNvo1y1+JNO3BkGuYUDOjxArqdG9NUOXSA/nrKndYMjfntj2MPMBcN0d36vVVGNdU
 f3m2NFDhr/Haj2rVdLLv0zpj+GjRQHclQJjvBNPLz7pwjNXRRdYc4vg6CA7ScTzotKg3
 l4ow==
X-Gm-Message-State: AC+VfDxPDbg83jOutQ3SeAclf33wi2rwlbutQlBQKuR5k1hpDHkZRv8R
 Y6GPjtf602NZ/vfD//wFinTBhj4ucONQw5fko7D+Uit/dDQxqdEzYiaLrmTcG7WRNn+ZwJEPZfp
 pqFo/uJiBLfJdOmOFpZDQXx4jDARH
X-Received: by 2002:a05:620a:a05:b0:75b:23a0:e7cc with SMTP id
 i5-20020a05620a0a0500b0075b23a0e7ccmr452016qka.45.1684758618193; 
 Mon, 22 May 2023 05:30:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5UrjSsJpTeaszPdkFwHOjVAMcErGGwfWpKAhK1T9BLt1EUApD/wnEnOkzOo2gzy/Phl2q3lw==
X-Received: by 2002:a05:620a:a05:b0:75b:23a0:e7cc with SMTP id
 i5-20020a05620a0a0500b0075b23a0e7ccmr451993qka.45.1684758617966; 
 Mon, 22 May 2023 05:30:17 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a05620a153a00b0075785052e97sm1670399qkk.95.2023.05.22.05.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 05:30:17 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Hawking.Zhang@amd.com, le.ma@amd.com,
 lijo.lazar@amd.com, tao.zhou1@amd.com, shiwu.zhang@amd.com
Subject: [PATCH] drm/amdgpu: remove unused variable num_xcc
Date: Mon, 22 May 2023 08:30:13 -0400
Message-Id: <20230522123013.1065975-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:2138:13: error: variable
  ‘num_xcc’ set but not used [-Werror=unused-but-set-variable]
 2138 |         int num_xcc;
      |             ^~~~~~~

This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index e5cfb3adb3b3..63718cf02aa1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2135,9 +2135,6 @@ static void gfx_v9_4_3_ring_emit_gds_switch(struct amdgpu_ring *ring,
 static int gfx_v9_4_3_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int num_xcc;
-
-	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
 
 	adev->gfx.num_compute_rings = min(amdgpu_gfx_get_num_kcq(adev),
 					  AMDGPU_MAX_COMPUTE_RINGS);
-- 
2.27.0

