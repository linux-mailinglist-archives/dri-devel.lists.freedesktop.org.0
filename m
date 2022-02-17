Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8884BA48B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D548110EB35;
	Thu, 17 Feb 2022 15:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D061B10ED91
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645112335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CoTxwG5lqMogkG1tkhH6Op74mbfSGaKHCACVBM5sEqs=;
 b=i8zWxnN1EQrC4lpbglJ4scP44oGKStEg3l5HQbckAaRYJcLgiaA9Gov7IR/H8xciHBKm6x
 ceE3fNHDGH909nEm0xTDKQ/obWMVjgo8iENI0vidssqKn2mICn60uXqMs1SOsbG8FWPAiX
 j6TCMm5WFPosnwayi1KetGGhMRN7yWk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-7aQZWuLgMCmYYM93EiSQjQ-1; Thu, 17 Feb 2022 10:38:54 -0500
X-MC-Unique: 7aQZWuLgMCmYYM93EiSQjQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 h7-20020a9d5547000000b005ad0f5e4271so1550893oti.19
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CoTxwG5lqMogkG1tkhH6Op74mbfSGaKHCACVBM5sEqs=;
 b=AGxrlgI2fvaBnmXhLcurJYqTFkAy9woO2gxIKdnCTCMFSyNQODV9wz0I9gCNh6Xyct
 lucyYcGVbhvYs9YgBOO4bYvVyI7riA74PlA+sJhtFjWKmK+PMbJYCw+yTf5/961Wghry
 giP5wBRFuou6sgaZFEMcEpILDFNmuGEEwMbfp/xBNjM6F5x7AcbBRsMvGGZKrVtK50oF
 73klchb8RIDgQkUrFYVgKMl8rYeDBVPikIE1W5ocDHDSuFTpwLqWhcUlG4TR4GdOFMdp
 9drXO5Tw2P24IYe44ZnhGaJZ961mS4RatjkuckJCfWGNqyWY2iYJeng50hRP6uImeu+K
 3Z0g==
X-Gm-Message-State: AOAM531sphgL0TMd4T1Ns7xHk0jy0H8GOTXbXn/P/Rjd31rvNCP1MQL5
 Bnuhulzmj7yEGYRItXBMvicSfSZ5YJL42/xi3FdmfH7w0CedxOl5yKdYipWbWRE06NXhuyTXipQ
 +l6N6ZGb0HhhCFFgSqmJvcGfJabRQ
X-Received: by 2002:a05:6830:41:b0:5a0:93fa:161d with SMTP id
 d1-20020a056830004100b005a093fa161dmr1020922otp.88.1645112333710; 
 Thu, 17 Feb 2022 07:38:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNPtTeWpYlbfs2THVEoksmj7PsLvm2GLCm7n8pIk1AhH37AWo21W37FGBs4lG0Kd2SS1+XmQ==
X-Received: by 2002:a05:6830:41:b0:5a0:93fa:161d with SMTP id
 d1-20020a056830004100b005a093fa161dmr1020900otp.88.1645112333470; 
 Thu, 17 Feb 2022 07:38:53 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id q28sm2691306ots.76.2022.02.17.07.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 07:38:53 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, Hawking.Zhang@amd.com, john.clements@amd.com,
 tao.zhou1@amd.com, YiPeng.Chai@amd.com, luben.tuikov@amd.com,
 Stanley.Yang@amd.com, Dennis.Li@amd.com, mukul.joshi@amd.com,
 nirmoy.das@amd.com
Subject: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
Date: Thu, 17 Feb 2022 07:38:42 -0800
Message-Id: <20220217153842.3252424-1-trix@redhat.com>
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

Clang build fails with
amdgpu_ras.c:2416:7: error: variable 'ras_obj' is used uninitialized
  whenever 'if' condition is true
  if (adev->in_suspend || amdgpu_in_reset(adev)) {
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

amdgpu_ras.c:2453:6: note: uninitialized use occurs here
 if (ras_obj->ras_cb)
     ^~~~~~~

There is a logic error in the error handler's labels.
ex/ The sysfs: is the last goto label in the normal code but
is the middle of error handler.  Rework the error handler.

cleanup: is the first error, so it's handler should be last.

interrupt: is the second error, it's handler is next.  interrupt:
handles the failure of amdgpu_ras_interrupt_add_hander() by
calling amdgpu_ras_interrupt_remove_handler().  This is wrong,
remove() assumes the interrupt has been setup, not torn down by
add().  Change the goto label to cleanup.

sysfs is the last error, it's handler should be first.  sysfs:
handles the failure of amdgpu_ras_sysfs_create() by calling
amdgpu_ras_sysfs_remove().  But when the create() fails there
is nothing added so there is nothing to remove.  This error
handler is not needed. Remove the error handler and change
goto label to interrupt.

Fixes: b293e891b057 ("drm/amdgpu: add helper function to do common ras_late_init/fini (v3)")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index b5cd21cb6e58..c5c8a666110f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2432,12 +2432,12 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
 	if (ras_obj->ras_cb) {
 		r = amdgpu_ras_interrupt_add_handler(adev, ras_block);
 		if (r)
-			goto interrupt;
+			goto cleanup;
 	}
 
 	r = amdgpu_ras_sysfs_create(adev, ras_block);
 	if (r)
-		goto sysfs;
+		goto interrupt;
 
 	/* Those are the cached values at init.
 	 */
@@ -2447,12 +2447,11 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
 	}
 
 	return 0;
-cleanup:
-	amdgpu_ras_sysfs_remove(adev, ras_block);
-sysfs:
+
+interrupt:
 	if (ras_obj->ras_cb)
 		amdgpu_ras_interrupt_remove_handler(adev, ras_block);
-interrupt:
+cleanup:
 	amdgpu_ras_feature_enable(adev, ras_block, 0);
 	return r;
 }
-- 
2.26.3

