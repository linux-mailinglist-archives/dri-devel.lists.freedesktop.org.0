Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A84BDB53
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B499210E566;
	Mon, 21 Feb 2022 17:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DB210E581
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645465073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DzRKkl9MBsnLJO0MZvrmofSvJyauAO6DGXYWnBBejVM=;
 b=PqD7pXK6FMHbWWZJWGa/WzuXYQA6pBRxDlfRbWILa5qHCfIxGnMx5EIIw37SqxydpWRL7Q
 dc/tfLHSBL1qL7GbryZR9GDMrKV8Coo3Fk6ThJb59XisTlgRVxrRKo7oBhezSScCuJ6a3f
 xE4o9y7E2qhixlmTuK+r1X+1ok6KM20=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-sq9BJalpMsqQHw5vvQUuEg-1; Mon, 21 Feb 2022 12:37:51 -0500
X-MC-Unique: sq9BJalpMsqQHw5vvQUuEg-1
Received: by mail-qv1-f69.google.com with SMTP id
 cs16-20020ad44c50000000b0042bfd7b5158so17908924qvb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DzRKkl9MBsnLJO0MZvrmofSvJyauAO6DGXYWnBBejVM=;
 b=ZlWT+dpGhXNsHLMJhgAacf6W+pM0prslZ5DCtNFupFJG9n+/pf9wrroB1G1VWM5VmZ
 4ApHp6nLsbosF4paUyw4VDNwgdEpHNPhhVvcY5JUkKLgTHxvtD9F1qLSDPaR2YmUOYTg
 /Flzr0CpTAv2gMjqx7ujfBizRfhrtAA/XRYjgfcPeNeXnpRXhy2CKEA4P7HSk+OFZkfw
 J+NdqzzckF7vOTTJu2Myc5+T5biHdyVQAYXs5B4/DAN0/WNNCvp9ElwUJKldOEj//9Re
 /K9XpCnCpjgX01my7ssm8gPT8JV82JIIOBzXxw63KNSV/sbrLQsAGm1ubhHISAKgf/3U
 Ly/w==
X-Gm-Message-State: AOAM531Ria7PjQXfMYVbOwNvCrEywzWxDXSpO/c8dZQLLmuSEh9Y3pK+
 Lmy7WYIxYe6Lzk855DluIsmHDDeXSvAGFvC5BuZ1G5ySNKtYFF1+113CbK3X3exxrPZ9a2r6myk
 aR9wiai+KDojc036QqVasiT0SLTLr
X-Received: by 2002:a37:674c:0:b0:47b:8dc5:df77 with SMTP id
 b73-20020a37674c000000b0047b8dc5df77mr13055128qkc.95.1645465071237; 
 Mon, 21 Feb 2022 09:37:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXF5C5Kq2+dKAFlNYYC/4KY8Ajcg6ukvTAULE4uB/5fl5oE1UylGbMhdwn4F9QcBZp1i/H3Q==
X-Received: by 2002:a37:674c:0:b0:47b:8dc5:df77 with SMTP id
 b73-20020a37674c000000b0047b8dc5df77mr13055105qkc.95.1645465071015; 
 Mon, 21 Feb 2022 09:37:51 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id v15sm1895466qkl.37.2022.02.21.09.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:37:50 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, guchun.chen@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, luben.tuikov@amd.com
Subject: [PATCH] drm/amdgpu: fix printk format for size_t variable
Date: Mon, 21 Feb 2022 09:37:37 -0800
Message-Id: <20220221173737.3725760-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

On mips64 allyesconfig, there is this build break
amdgpu_discovery.c:671:35: error: format '%ld' expects
  argument of type 'long int', but argument 4 has
  type 'size_t' {aka 'unsigned int'}
  DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);

For size_t, use %zu.

Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 7c7e28fd912e..58238f67b1d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
 			    le16_to_cpu(ip->hw_id) != ii)
 				goto next_ip;
 
-			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
+			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
 
 			/* We have a hw_id match; register the hw
 			 * block if not yet registered.
-- 
2.26.3

