Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB0572219
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 20:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED97A959DB;
	Tue, 12 Jul 2022 18:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AFC959D0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657648918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=GdDHIaArgqpYEafeRAOiB4jbfZxX2EX/FN5+Wol/qCtaK84bjS4e3JnYEyHuiP6tDvMF6D
 aaHxF7chluPNKOPcrpzVxxxrIgqey9DiBQ5IdnzP6evH/7B6MEQj5qkSaXoyfEGIoKy+04
 9Klss6aWrdgFsHjnTZt90nGIP4zI5To=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-N65Zy1X_Or-fqM87kSqL9g-1; Tue, 12 Jul 2022 14:01:57 -0400
X-MC-Unique: N65Zy1X_Or-fqM87kSqL9g-1
Received: by mail-ej1-f71.google.com with SMTP id
 sa13-20020a1709076d0d00b0072a8791298aso2595042ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 11:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=DVG8vMesQeJp1eEwx/yRBmgS7HHUsnpGxOWvdgNz8+6vTVBe7iCGKeYmWuQ8S+Tak5
 0DSzWDCUmNO8HBF1TL7tGAuTYfbaCBt9AisPxoR+Vml7qQn1CN1F+WXhkR6FjCihFln7
 rq7cyOsHKThK25O10G/FhitIA07LH/0E/wlRMb4GK+9xmdSQc+0RGeU6rcRqeJiicUfA
 OtoilWq7xzrOIB9JTRxcJ5BSELQR5xaPQ/ZA2EM87ygAYk0vBMKx2Bm7mcBO2gXDgyJH
 DEU7s9ZSRmYRAMoUkTGFtebqaggFJuhpEWzEC3EfjOYbed7SeattOyFjzCtpuyRmjVFy
 nKMg==
X-Gm-Message-State: AJIora9GMxocOJCJfK8nTcPNN3DD5o5PANP6zpRgw5zChN3IUvcWIVe3
 twoNHC5X8Vj13/EHn97vAaLkMW/PUZYG2Iy0d/Vxl+M6mWziycDQjBGXpY5ejBNYdsVDNIN8Q1D
 yGWlLbUiIbEz1Dtz6guTsm6CvQYb4
X-Received: by 2002:a05:6402:294c:b0:43a:91a9:a691 with SMTP id
 ed12-20020a056402294c00b0043a91a9a691mr33932216edb.182.1657648916548; 
 Tue, 12 Jul 2022 11:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uy/+eU65Fj+mAPs2WsLaFkz8F4pPt0qMmztKSV4dwMQQ3Oed1AnBOkX4uYV+DoG64f4Vn6wQ==
X-Received: by 2002:a05:6402:294c:b0:43a:91a9:a691 with SMTP id
 ed12-20020a056402294c00b0043a91a9a691mr33932193edb.182.1657648916399; 
 Tue, 12 Jul 2022 11:01:56 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b0072b1bb3cc08sm4028352ejb.120.2022.07.12.11.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 11:01:55 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH drm-misc-next v4 4/4] drm/todo: remove task to rename CMA
 helpers
Date: Tue, 12 Jul 2022 20:01:39 +0200
Message-Id: <20220712180139.1886590-5-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712180139.1886590-1-dakr@redhat.com>
References: <20220712180139.1886590-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both, GEM and FB, CMA helpers were renamed to "GEM DMA" and "FB DMA",
hence the task can be removed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/todo.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..fd5b3f2fb19e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -343,19 +343,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
 
 Level: Intermediate
 
-Rename CMA helpers to DMA helpers
----------------------------------
-
-CMA (standing for contiguous memory allocator) is really a bit an accident of
-what these were used for first, a much better name would be DMA helpers. In the
-text these should even be called coherent DMA memory helpers (so maybe CDM, but
-no one knows what that means) since underneath they just use dma_alloc_coherent.
-
-Contact: Laurent Pinchart, Daniel Vetter
-
-Level: Intermediate (mostly because it is a huge tasks without good partial
-milestones, not technically itself that challenging)
-
 connector register/unregister fixes
 -----------------------------------
 
-- 
2.36.1

