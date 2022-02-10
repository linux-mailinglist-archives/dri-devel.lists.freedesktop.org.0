Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214214B13C9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 18:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D557110E8AC;
	Thu, 10 Feb 2022 17:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F5010E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644512669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yfg+rvc8vcVuTj7+GQ4UV9mGgjoAYvtiDa4kYWoYjJ8=;
 b=WMwMOzmdhkD9Y07iDpW9dFKOGk1lhVtOCwZdjqMgw1DHolseXsZrv3yWXvnBw+SLMmCf0F
 jZclJRP6fbhTMMQSyWrxXvXFSwNjYJgepoaxgBIFOwOinU/76Zedm3Gd5R9AP/w/cw3dsf
 cixVmM6cS/4zhrajTFESIwvzTqcY+SA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-kB72kxbeMfm3M57OjkWxgQ-1; Thu, 10 Feb 2022 12:04:25 -0500
X-MC-Unique: kB72kxbeMfm3M57OjkWxgQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ge15-20020a05621427cf00b00421df9f8f23so4371107qvb.17
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfg+rvc8vcVuTj7+GQ4UV9mGgjoAYvtiDa4kYWoYjJ8=;
 b=opp5qtEFR9T4OaPOLTTqIOK4iqJJF6rxRJ+pkeWIc5jKPeAVwDdxXpvFq5/oHbXvry
 dA3UNphDBUDNYxyRUc4v+gF90AVsfQugOT3ZBanugMfOKXEFFc7A6NtT1qGHUiA56F+d
 yNdlBBzmkIu4CLWmsFZIGb2FIHRX/l3m/QSHZxcTCDDoYJjWivb8cNRWFo14jcn/Kd7q
 ktamvzDQfwdkiKy34YILJVhhyYhuhH73qVl7Py0FWeGvtj/1/jvMmP2n8wh38LJxH6et
 qYzEaakAwNrhUPZhExT8oPiEpG/yQcuWOKpLYHf79KR76jxUMGIm97V9zpBg74aDWGlb
 AEuw==
X-Gm-Message-State: AOAM533fk3kKWZ3s6fwNylMpI0Rqy8nVG9x7FG0ngFnF14GC/ods6Rvf
 sHehnODC4r9/1+iSA9PA6mmuup7nOgUZpZfG87tzEK9e3xAvAOL4OcgjSqfxGCuiZ5Mm2Ks8I+C
 Tz50Xh5vHPRWigGUicFQb1jGASyir
X-Received: by 2002:a05:622a:488:: with SMTP id
 p8mr5619785qtx.97.1644512664764; 
 Thu, 10 Feb 2022 09:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6fO5DYKXU/juk8kup+dK1EWIDMNgxbwD2+eVcMOxOQtX4NtPMxUE/mv2fPNsQDd1zWg2wfQ==
X-Received: by 2002:a05:622a:488:: with SMTP id
 p8mr5619768qtx.97.1644512664592; 
 Thu, 10 Feb 2022 09:04:24 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id j11sm11156880qtj.74.2022.02.10.09.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:04:24 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 rajneesh.bhardwaj@amd.com, david.yatsin@amd.com
Subject: [PATCH] drm/amdkfd: fix loop error handling
Date: Thu, 10 Feb 2022 09:04:18 -0800
Message-Id: <20220210170418.2404807-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
kfd_chardev.c:2594:16: warning: The expression is an uninitialized value.
  The computed value will also be garbage
        while (ret && i--) {
                      ^~~

i is a loop variable and this block unwinds a problem in the loop.
When the error happens before the loop, this value is garbage.
Move the initialization of i to its decalaration.

Fixes: be072b06c739 ("drm/amdkfd: CRIU export BOs as prime dmabuf objects")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 636391c61cafb..4310ca07af130 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2374,7 +2374,7 @@ static int criu_restore_bos(struct kfd_process *p,
 	const bool criu_resume = true;
 	bool flush_tlbs = false;
 	int ret = 0, j = 0;
-	uint32_t i;
+	uint32_t i = 0;
 
 	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
 		return -EINVAL;
@@ -2410,7 +2410,7 @@ static int criu_restore_bos(struct kfd_process *p,
 	*priv_offset += args->num_bos * sizeof(*bo_privs);
 
 	/* Create and map new BOs */
-	for (i = 0; i < args->num_bos; i++) {
+	for (; i < args->num_bos; i++) {
 		struct kfd_criu_bo_bucket *bo_bucket;
 		struct kfd_criu_bo_priv_data *bo_priv;
 		struct kfd_dev *dev;
-- 
2.26.3

