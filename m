Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181E70BEF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15A10E14F;
	Mon, 22 May 2023 13:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE6310E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684760463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5GS5iE0UNqVQ8KlXVjYhcfn3nzlvTGZU1mxp4La9+mc=;
 b=M21I7rp5InP2WlTtikqk9ghByu5/sIftBvgJUc0rvxeZcIhDSxPhEKGZZlCiV82d/SiT/d
 K21Mi+wFC9kDL73ZKKbZyBeYbhNq0TwyU3BZlLG3zgPWrqoe9o3peJFuLs7iwkAz6d/jRF
 muhhwc+a9KV6wTFnZ9LbHtafmydZTjI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-5WdMgF8DNC6ONpGBPCPAGw-1; Mon, 22 May 2023 09:01:02 -0400
X-MC-Unique: 5WdMgF8DNC6ONpGBPCPAGw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-621257e86daso85309366d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 06:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760461; x=1687352461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5GS5iE0UNqVQ8KlXVjYhcfn3nzlvTGZU1mxp4La9+mc=;
 b=AveqPctMwNbmmslDWzDZ7lGth3goBuPWJQu6q5OVrp1U0+NSzTNUk774Nz27Qr6Fod
 WbDs20jpjLFHl7k6eOFa9RQzKj0IlpX+dX32ue3OOx+MOxyzQZPVYvaE4NOPMNhp5JDD
 m/22dYt51whhpIRe8YIfwEByz5Tp7JfkIPjMEbd2kjroLG8O6r3E7UkoIhKYXYH3003M
 DWjMC5mkYszRYvHzr7jnL+B93pa5w6P1Wt2551ZW6GSDugjvsnqkkKaJoOMai85qJ11X
 Git++EHZEvt0kbUHKDeNZDckhHFQhv2aSxuSz17aFJw+I6QUpnNWMg+IoVDSA24A0R/i
 y0wg==
X-Gm-Message-State: AC+VfDxDa8y+zJ80bi/Jz2pbzyTscgTYdZdsNZWIt6zUk14/CZkyvh7t
 eexMQXAoLlU91wHI5DqHXxyfQdbGT50K/XkkjyCCke6RThGTd5AW0b+xBO5mRyVyqqXyOHNInqt
 qeVp4mV7CgZLqb1ExnkNt4cjlVaZd
X-Received: by 2002:a05:6214:d4b:b0:616:5c8b:582 with SMTP id
 11-20020a0562140d4b00b006165c8b0582mr21098473qvr.37.1684760460916; 
 Mon, 22 May 2023 06:01:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63Whwh0WVrdsRNMd+E6lr3sa4LBlkXrJV87h21RAe+9pE/lhzvsvDrelDpNH940vcQ+EvwJw==
X-Received: by 2002:a05:6214:d4b:b0:616:5c8b:582 with SMTP id
 11-20020a0562140d4b00b006165c8b0582mr21098447qvr.37.1684760460644; 
 Mon, 22 May 2023 06:01:00 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 u13-20020ae9c00d000000b0075783f6c2b4sm1678924qkk.128.2023.05.22.06.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 06:01:00 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 tao.zhou1@amd.com, le.ma@amd.com, Felix.Kuehling@amd.com,
 lijo.lazar@amd.com, Amber.Lin@amd.com
Subject: [PATCH] drm/amdgpu: remove unused variable
 mmhub_v1_8_mmea_cgtt_clk_cntl_reg
Date: Mon, 22 May 2023 09:00:57 -0400
Message-Id: <20230522130057.1066607-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:760:23: error:
  ‘mmhub_v1_8_mmea_cgtt_clk_cntl_reg’ defined but not used [-Werror=unused-const-variable=]
  760 | static const uint32_t mmhub_v1_8_mmea_cgtt_clk_cntl_reg[] = {
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
index 3648994724c2..00e7e5db7c28 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
@@ -757,14 +757,6 @@ static void mmhub_v1_8_query_ras_error_status(struct amdgpu_device *adev)
 		mmhub_v1_8_inst_query_ras_err_status(adev, i);
 }
 
-static const uint32_t mmhub_v1_8_mmea_cgtt_clk_cntl_reg[] = {
-	regMMEA0_CGTT_CLK_CTRL,
-	regMMEA1_CGTT_CLK_CTRL,
-	regMMEA2_CGTT_CLK_CTRL,
-	regMMEA3_CGTT_CLK_CTRL,
-	regMMEA4_CGTT_CLK_CTRL,
-};
-
 static void mmhub_v1_8_inst_reset_ras_err_status(struct amdgpu_device *adev,
 						 uint32_t mmhub_inst)
 {
-- 
2.27.0

