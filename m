Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130A6C863D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129210EC78;
	Fri, 24 Mar 2023 19:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEF610EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679687653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l3XY7P7qXKaSPDLbgUFV6/pwM2nIqWoTRMEvcOe7JBo=;
 b=K8KIFm7mzlc+MiZ5HzDRjeJVvvncEjhcbqKYaTrRXSPzuCUSoV5BRHRMyPNJtea1/DfQA3
 RpSJT7R1vq2mpoRRvDatXvJ24mrgDkptDS6yWGg+O0cUfjtHcpBBtNHDP6DSvNvvOVOgf7
 12y5+HVZP1H5nTvRIkboZjYDqznEo8U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-g-uIc6WHMFebq-7WA5Qrqg-1; Fri, 24 Mar 2023 15:54:09 -0400
X-MC-Unique: g-uIc6WHMFebq-7WA5Qrqg-1
Received: by mail-qv1-f71.google.com with SMTP id
 h7-20020a0cd807000000b005dd254e7babso1514764qvj.14
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679687649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3XY7P7qXKaSPDLbgUFV6/pwM2nIqWoTRMEvcOe7JBo=;
 b=JmkGO1g8HT/pcTCMGPGQDfdx1yVRJhtan650PSrldtk1p3AbBlxgeJG4Zthxg2FSDa
 1yDajpzHLM1PSBUPkljCwsoOnrdbMqRZT29WLFAS/5gWFwbQupk7d2JSBBF4GHq2tpUE
 okE/a860d/9YNwXX8+qTGxTQRjfxgVxgUYoRIjosz9X8If0uYW3gqh+Oh4wc85ys9PmF
 AYy9C9vXHi9EuuD1mX+7WN7HLeiJwOqE0bx403QiWCqaHunFDnkHmTghB3D5vVQeSnPm
 tiFILN7MgQNCZ3kTkSejRvJT09ZeXAGTF2D//JTJspxYt8iJMeGVCJlUYhcfEUdykWKR
 MExw==
X-Gm-Message-State: AAQBX9cYuf4llEdsq5QixfapSIbNf6sZoCAFt/4umnnC9j7N42GOQga8
 gknAFLFX0bkjXk6QQDR1b/Wz3reBNQ0I/m61xzaQoc56ASW/cqrWX4zhfAvoQLT3wWBP84Z9Bdc
 HgR9h7WVsZx57quuxHiE7ohPf6bWE
X-Received: by 2002:a05:6214:2aad:b0:56e:9317:eb9a with SMTP id
 js13-20020a0562142aad00b0056e9317eb9amr6592664qvb.29.1679687649100; 
 Fri, 24 Mar 2023 12:54:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3suJMoeD22pwLpecdSYpxhvSJ69sCrGTjVBJLxJGFJIxRx3Oe7uCHkoJj7IPUAMd1rm5fxw==
X-Received: by 2002:a05:6214:2aad:b0:56e:9317:eb9a with SMTP id
 js13-20020a0562142aad00b0056e9317eb9amr6592635qvb.29.1679687648834; 
 Fri, 24 Mar 2023 12:54:08 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 j185-20020a37b9c2000000b007465ad44891sm13466083qkf.102.2023.03.24.12.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 12:54:08 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/vmwgfx: remove unused mksstat_init_record function
Date: Fri, 24 Mar 2023 15:54:03 -0400
Message-Id: <20230324195403.2655148-1-trix@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:716:21: error: unused function
  'mksstat_init_record' [-Werror,-Wunused-function]
static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
                    ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index e76976a95a1e..ca1a3fe44fa5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -702,32 +702,6 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
 /* Header to the text description of mksGuestStat instance descriptor */
 #define MKSSTAT_KERNEL_DESCRIPTION "vmwgfx"
 
-/**
- * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
- * for the respective mksGuestStat index.
- *
- * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record.
- * @pstat: Pointer to array of MKSGuestStatCounterTime.
- * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
- * @pstrs: Pointer to current end of the name/description sequence.
- * Return: Pointer to the new end of the names/description sequence.
- */
-
-static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
-	MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, char *pstrs)
-{
-	char *const pstrd = pstrs + strlen(mksstat_kern_name_desc[stat_idx][0]) + 1;
-	strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
-	strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
-
-	pinfo[stat_idx].name.s = pstrs;
-	pinfo[stat_idx].description.s = pstrd;
-	pinfo[stat_idx].flags = MKS_GUEST_STAT_FLAG_NONE;
-	pinfo[stat_idx].stat.counter = (MKSGuestStatCounter *)&pstat[stat_idx];
-
-	return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
-}
-
 /**
  * mksstat_init_record_time: Initializes an MKSGuestStatCounterTime-based record
  * for the respective mksGuestStat index.
-- 
2.27.0

