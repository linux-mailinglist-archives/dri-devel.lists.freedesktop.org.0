Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2504AF46E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED7810E45A;
	Wed,  9 Feb 2022 14:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D4010E506
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644418384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/VJVwJcabH5SXTn4ZvXEnmPqcRm07U+dAsv8ELCv4A=;
 b=ZUnUbGvowMVxiMUCtLP03qoHy6wxoZ6IRx0YRR+xyr6NIeQpVmtBtPFpKoTsynWVV0vJTA
 9e9RXqe3CQSeU/mCBx5aeNQfD0A3/Xxmtvu++orFB/63qZSNxQN1w+0FAyzHDXncRyROa/
 X8Z7M31HL3DsQeFNupNW4PNTO0Yp0rw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-HeQMLuGQMWaGAdmyDg8TuQ-1; Wed, 09 Feb 2022 09:53:03 -0500
X-MC-Unique: HeQMLuGQMWaGAdmyDg8TuQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 b18-20020a05620a089200b004e0e2f73f35so1531942qka.19
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/VJVwJcabH5SXTn4ZvXEnmPqcRm07U+dAsv8ELCv4A=;
 b=O+S0YtRfxk3s4ByHBd3+dSuE3I5kh7Dziz00UP0B6KQeY09fU8LGHmjDhXs3F2v0oc
 K7RNDU6T0u7eO4cxmaeGH5MXtKaaZ1S9SWq2gMmFWLpuKB9wn8bbwsXwRlPK76W1pyiW
 oL1HT2POHXWm8TzSx7RHIsdwvWWN55lv/lHlmy0qwmbnrdtw+IukbCLGWo91Mej+L34W
 jvRHjPEa5W+x5Kdmmbbi4D8UqNQC9aJuadEuanoeGcOst0LD8HYlLcIIsFG5zUWmF1Fn
 d44ROs5laN26U5QSPa/iR7wg/Z6anToAJBvKyP730wVmZefc0nVy++vOzeubUqYXKxC8
 hEKA==
X-Gm-Message-State: AOAM531R5ix9caF8cjIJVFhLs3iC8HcGB0FmzzDEdLYturDXybA0X1ID
 06oaH2m6myEnP+gOigZ9SQRf3xiZ2XXFVvKU0hZSaj7b5q60njOjzj/l/ws3CPnq/RrkLrjbtEk
 Z5s6h7YZ64ODCoWI9lSc4G4TPO689
X-Received: by 2002:a05:622a:87:: with SMTP id o7mr1562256qtw.38.1644418382988; 
 Wed, 09 Feb 2022 06:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5wcZMgzdbV24kPRKWlIzraNFqysXb9opnZC+c5gQEfuzVCDVwwO+VOEAL5ibZQMRfOE0JJw==
X-Received: by 2002:a05:622a:87:: with SMTP id o7mr1562236qtw.38.1644418382803; 
 Wed, 09 Feb 2022 06:53:02 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id bk19sm8421478qkb.125.2022.02.09.06.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:53:02 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 david.yatsin@amd.com, rajneesh.bhardwaj@amd.com
Subject: [PATCH] drm/amdkfd: fix freeing an unset pointer
Date: Wed,  9 Feb 2022 06:52:54 -0800
Message-Id: <20220209145254.2291158-1-trix@redhat.com>
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

clang static analysis reports this problem
kfd_chardev.c:2092:2: warning: 1st function call argument
  is an uninitialized value
        kvfree(bo_privs);
        ^~~~~~~~~~~~~~~~

When bo_buckets alloc fails, it jumps to an error handler
that frees the yet to be allocated bo_privs.  Because
bo_buckets is the first error, return directly.

Fixes: 5ccbb057c0a1 ("drm/amdkfd: CRIU Implement KFD checkpoint ioctl")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 64e3b4e3a7126..636391c61cafb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1982,10 +1982,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 	void *mem;
 
 	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
-	if (!bo_buckets) {
-		ret = -ENOMEM;
-		goto exit;
-	}
+	if (!bo_buckets)
+		return -ENOMEM;
 
 	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
 	if (!bo_privs) {
-- 
2.26.3

