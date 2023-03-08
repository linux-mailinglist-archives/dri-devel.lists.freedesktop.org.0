Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29396B0A9F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 15:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEA910E5E3;
	Wed,  8 Mar 2023 14:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9EE10E5E3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678284685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m81gFkR2y1XD7ZSB1IHW7cdgZ+75l9heGqDR7NPaKd4=;
 b=g47UmhiNNqg7hQ/O4LFgMJr59+UShRVDtnkje3YD9vi2uim3nL0nBaL28uoorjTakF4bSt
 e/FNme0f24fs1zXMXobldAOjZTi7nuxJ+lJjKJJJCXYWVsGMdfLZrp0Jfa+26RSBPo7F8a
 3ngXU9fvBCvqxMF6vO8LRPVAwSZRbtg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-ZiTqOgkpPSqDi9pQtuaIIw-1; Wed, 08 Mar 2023 09:11:24 -0500
X-MC-Unique: ZiTqOgkpPSqDi9pQtuaIIw-1
Received: by mail-qt1-f200.google.com with SMTP id
 br8-20020a05622a1e0800b003c0189c37e1so7937143qtb.18
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 06:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678284684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m81gFkR2y1XD7ZSB1IHW7cdgZ+75l9heGqDR7NPaKd4=;
 b=TBGxxjoPoL1M22rbH0Gtg3kIJZzoPHBJjXz8SPLRCx9THFiXEn6Rj335uQ8YJg6P4X
 tElRzpkJuaZALAGxjLziruNHqntDvheKCDU+fw+JhPMMfvJKolnPybytT6EW+YrtSG6P
 yVzp96UXxeIXryx5TcJ3mU/xYA6h/uc0dI+sd+UM2oZD9r/vMElzFHLjxBOxmz9T816h
 F0o2ujmdsZgCZwu2uHx9HOAd+1kzvLxSuDIbishr3TzS77TIF4kymatVnWv9FvByn4Ly
 hCAsohvxx+Kle0Ry97cVyjYnHC43dljDRLK7dUS6I6qngcL4hVq7lwvt5xGYHlocKryC
 ZwUQ==
X-Gm-Message-State: AO0yUKXqxW1OzqDDFnCqc+PE9n35Hg76bHAwabFZeFVO4MaM5mi1rbTF
 kFKgNvlqrYnhFOAbhqKCojwPZq8+mEu/xV2nDuCrEinABrZBB+eaBrhs+d/5THDmTShzZsSw45Q
 Qk/PQssmQlFkeqM3yQ8cSqQOr7a0V
X-Received: by 2002:a05:6214:202d:b0:572:6ed8:e494 with SMTP id
 13-20020a056214202d00b005726ed8e494mr36527189qvf.18.1678284684095; 
 Wed, 08 Mar 2023 06:11:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/PozfFJrQLJrJyxgwp36xRY3RsiKsiNwx4ETYM7tgGHq8Lwp8dvr5WLBt6+Jo4Oiup/CBkQg==
X-Received: by 2002:a05:6214:202d:b0:572:6ed8:e494 with SMTP id
 13-20020a056214202d00b005726ed8e494mr36527115qvf.18.1678284683835; 
 Wed, 08 Mar 2023 06:11:23 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 q79-20020a374352000000b0073b27323c6dsm11187764qka.136.2023.03.08.06.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 06:11:23 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, wenjing.liu@amd.com,
 qingqing.zhuo@amd.com, Jun.Lei@amd.com, mghaddar@amd.com,
 candice.li@amd.com, aric.cyr@amd.com
Subject: [PATCH] drm/amd/display: remove unused variable available
Date: Wed,  8 Mar 2023 09:10:57 -0500
Message-Id: <20230308141057.2010361-1-trix@redhat.com>
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

With gcc and W=1, there is this error
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:297:13: error:
  variable ‘available’ set but not used [-Werror=unused-but-set-variable]
  297 |         int available = 0;
      |             ^~~~~~~~~

Since available is unused, remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c   | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
index f14217cc16fd..2f0311c42f90 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
@@ -294,7 +294,6 @@ bool link_dp_dpia_set_dptx_usb4_bw_alloc_support(struct dc_link *link)
 void dpia_handle_bw_alloc_response(struct dc_link *link, uint8_t bw, uint8_t result)
 {
 	int bw_needed = 0;
-	int available = 0;
 	int estimated = 0;
 	int host_router_total_estimated_bw = 0;
 
@@ -373,20 +372,13 @@ void dpia_handle_bw_alloc_response(struct dc_link *link, uint8_t bw, uint8_t res
 
 		// 1. If due to unplug of other sink
 		if (estimated == host_router_total_estimated_bw) {
-
 			// First update the estimated & max_bw fields
 			if (link->dpia_bw_alloc_config.estimated_bw < estimated) {
-				available = estimated - link->dpia_bw_alloc_config.estimated_bw;
 				link->dpia_bw_alloc_config.estimated_bw = estimated;
 			}
 		}
 		// 2. If due to realloc bw btw 2 dpia due to plug OR realloc unused Bw
 		else {
-
-			// We took from another unplugged/problematic sink to give to us
-			if (link->dpia_bw_alloc_config.estimated_bw < estimated)
-				available = estimated - link->dpia_bw_alloc_config.estimated_bw;
-
 			// We lost estimated bw usually due to plug event of other dpia
 			link->dpia_bw_alloc_config.estimated_bw = estimated;
 		}
-- 
2.27.0

