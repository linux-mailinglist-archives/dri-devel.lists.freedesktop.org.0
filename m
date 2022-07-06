Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18512568891
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C0C112D24;
	Wed,  6 Jul 2022 12:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6580310FF50
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657111474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=UFhObAWNCq1TzepL3CHDZustLFwgn48zEa60Ur6C+2LhSy7S2i43IAkhe0UKRFn98Nwv1W
 rcOxeDA/A/EuxvVHUwqwme/UYRllvK6jE2WdyFooU/G5HaTH+ap3cKntNWN1mqIgYRMx5Y
 AOCY74covEqj55Mn2GclwIwLyjnAoHU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-USB1YCjOMeCg1BQGzHoLdQ-1; Wed, 06 Jul 2022 08:44:32 -0400
X-MC-Unique: USB1YCjOMeCg1BQGzHoLdQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a056402350700b00435bd1c4523so11552414edd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=Yx8t3c+ukU48ewNvsAEPWzU8G0vLY6/nq9iEUW2l2wdwJzPHSEWFeEssQCnS63yI5I
 N+jM7Xh9NCJkLAOHytNpRSA0Ki/f6RzsdCe6XbOncajG+t0Q0WPdhIkhtC2pCG5iXdCz
 TwQysRK1Hkp0dj1hg4wJG/0m5jIuntY0roU3kl+hnpaUJeufpIfjs1urL4CcYMVJwrxZ
 HXWNdxdVQldpezGM0CCJ0xnIuKV817NftXJ9xl4cjd1VO2qfC9zFPhfjXaur4i57RW/H
 hwKutJlYH6MF1Kg/UxxndkfaiqxKFLcMivRZzb5euie6ZhSJWyXSd4p+Gt4+IJZav36O
 98bA==
X-Gm-Message-State: AJIora/3Nd4ndZbWRs6fZag0/iwYaRUXhi3mH3on1pABFAl8OWxbV/i4
 xWOSXfCnNtY5eu1RLRKW1871KV+4hpZgreZJY9llfZsFZbYSfKCof06LG7ryAvNLDYRDuAtth2w
 P94ixJwtlIhW2uDcTF5gyiRPIxXq+
X-Received: by 2002:a05:6402:1658:b0:43a:91cd:2ffb with SMTP id
 s24-20020a056402165800b0043a91cd2ffbmr459590edx.277.1657111471409; 
 Wed, 06 Jul 2022 05:44:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sNbRQdcFT62rYEzaX/EvrotCf4gZzHWeg3W7E6zJXd3feLLSU75jqqitJZtUgKkWVymUsYfw==
X-Received: by 2002:a05:6402:1658:b0:43a:91cd:2ffb with SMTP id
 s24-20020a056402165800b0043a91cd2ffbmr459570edx.277.1657111471253; 
 Wed, 06 Jul 2022 05:44:31 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a170906489a00b00705f6dab05bsm17237433ejq.183.2022.07.06.05.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:44:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH v2 4/4] drm/todo: remove task to rename CMA helpers
Date: Wed,  6 Jul 2022 14:43:52 +0200
Message-Id: <20220706124352.874528-5-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706124352.874528-1-dakr@redhat.com>
References: <20220706124352.874528-1-dakr@redhat.com>
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

