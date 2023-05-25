Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788D7117D3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A5E10E74D;
	Thu, 25 May 2023 20:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C89110E74D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685045287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pscghevf+cSG52ERcGqww4er3grbyjpAV659C+ZtVu8=;
 b=cvd8icIlpYiUigu6eyICvwbj1Uzya4rC8p0f0c7WWDqdHBgmKC9v2oWuow7Ox+gxh8J+Sa
 o+QJKoRhgqVUhczcpnD9b56wF+a99VvhgkAk2zyLsjgMGJhh1+WIFdg9a4eYJ6cWsoXnNc
 fF3vCpHPf5cNc0Nfh0nl4SyJyuAysKE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-jiZztoZuOnG7oSd-3zvAWw-1; Thu, 25 May 2023 16:08:03 -0400
X-MC-Unique: jiZztoZuOnG7oSd-3zvAWw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6238295cc68so1168976d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 13:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685045282; x=1687637282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pscghevf+cSG52ERcGqww4er3grbyjpAV659C+ZtVu8=;
 b=aqKc/NULyDVmcDcqhYbVCAojXTsjSojuFB4CtRcg54dGqLQtG0VX38yPua+NxMNFDm
 Fol9BsMavrWFT28ofM6Gv5SCL3A5pgDjkaNLYqasH2C3eMz5P8Nu+xaQ4hZhGeSQSKzQ
 EB+cvYBlH4el7T+Fy2x7iNaOCjJ6YPqBaz1+3YRZJAyXuUjZ2YJX4DTso9U+VcT7MGCj
 sRQNJCVIo7zveCMu3EBdfDroA1Il6Ab/k/GVriN5gTbOqUu243ZYhgEAO1G+Y2RIuTtP
 RtDUOsYr0udq/VuW9U8fwHBkYxnpfSKyYyGxR5RNFSvdD1gPYygjTEDulm0k1XHuLVLO
 2uHw==
X-Gm-Message-State: AC+VfDwRMRJTAMU2QfsE1xpppDObsdgS9dHifu0mzfKo1OlRzVn5kD6Y
 MRYij2yKHE/Sw4Cd8dO9Enkd8FfS7rUWN2MWiWiHJKfaWkfPf5tYf1yylDZzeXaaeYoscWWGN+q
 7Fx7VPQDFXbcCtdIOpH9GPnNPN6Kd
X-Received: by 2002:ad4:5cce:0:b0:625:aa48:def6 with SMTP id
 iu14-20020ad45cce000000b00625aa48def6mr2958783qvb.54.1685045282641; 
 Thu, 25 May 2023 13:08:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7LtC1076E/oGoBe45eqDKHdSLnAL80iwqLeHY19bYNAJnnZix57WmgzgioKtImTkWVm13Drg==
X-Received: by 2002:ad4:5cce:0:b0:625:aa48:def6 with SMTP id
 iu14-20020ad45cce000000b00625aa48def6mr2958758qvb.54.1685045282407; 
 Thu, 25 May 2023 13:08:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 lw1-20020a05621457c100b005ef81cc63ccsm649736qvb.117.2023.05.25.13.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 13:08:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/amdkfd: remove unused function
 get_reserved_sdma_queues_bitmap
Date: Thu, 25 May 2023 16:07:59 -0400
Message-Id: <20230525200759.3214525-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:122:24: error:
  unused function 'get_reserved_sdma_queues_bitmap' [-Werror,-Wunused-function]
static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
                       ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 493b4b66f180..2fbd0a96424f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -119,11 +119,6 @@ unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm)
 		dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
 }
 
-static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
-{
-	return dqm->dev->kfd->device_info.reserved_sdma_queues_bitmap;
-}
-
 static void init_sdma_bitmaps(struct device_queue_manager *dqm)
 {
 	bitmap_zero(dqm->sdma_bitmap, KFD_MAX_SDMA_QUEUES);
-- 
2.27.0

