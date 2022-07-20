Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C733B57BA86
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5498F7C9;
	Wed, 20 Jul 2022 15:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE418F6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658331339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=g2Zh89v0FzSkc7IaCUVbIgFsBHurPdxgBI/64Lc7N2oKTS+OWzk+0+MwWQLpvsP4LJw7C4
 FHoyf15Vqtqb9a3yw8ki1YqzuJRo/tv3PXm1+oDIkvQVzdDyR2KSLB6yyh2OcqPOrGkWxc
 v7p9WJihGBfVKN0nZcNuwAdc/3K5Y5g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-l4meAd6sPY2Yeqv0xHS48A-1; Wed, 20 Jul 2022 11:35:38 -0400
X-MC-Unique: l4meAd6sPY2Yeqv0xHS48A-1
Received: by mail-ed1-f72.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so12392903edd.17
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGUU8csqKmijlurVp5QMVe7bWGLLWRqgzi0YQOg1uuw=;
 b=ilyTMzBRNzXzZz7Yj1xN+a9r59kwBsTfn3SjBwJmmM37j7IgagAbh9Lh2hPrMBNLM9
 LXU9VsJb7Sf/RD+U3u73pfP9AwnDrwkGnihAlPyt9RMqbyW0ZBY4PsG8Dri3wfIIydTP
 3MT4F0lCztyt4S9NHTQFmdJadBnBEQBjSiM1gStI3Eo0FQ/fm1F0ybGYbOcVjGV0pBzn
 U/+8ur90Ha+3K1CFeF2SD2/gCQTfH1sABVS6C58yASXaQlQxVrHS9Oc+8JV5H2IaWjva
 VZgF7MW9OMPCJRH7b1XkmvRPExvbiRtrMCL7mtz4R6LVCVSYbTO2hGbNfaRCU8JpQr1X
 uPug==
X-Gm-Message-State: AJIora+nX4gn3nyu0b/BT2Iwm5OZy/wOxVV2UXnijTeI4UjoITsGXxFp
 FVWTIY0r0O5ImJieVhXFMC7BLLUXb4ejtEs3IiFB7nWT+foNv0lOYRDUVuxU2/lsngmgOHyd3Er
 U0jE4PZaaup9daNabeqAR9j8//BmP
X-Received: by 2002:a17:906:cc45:b0:72b:313b:f3ee with SMTP id
 mm5-20020a170906cc4500b0072b313bf3eemr34840123ejb.362.1658331336814; 
 Wed, 20 Jul 2022 08:35:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sY5G1nZetzS4UPMQm0eyWT397zECsjSO4tfdUAB3orTdb89qM+POvod/pD2euFrQggM69qFA==
X-Received: by 2002:a17:906:cc45:b0:72b:313b:f3ee with SMTP id
 mm5-20020a170906cc4500b0072b313bf3eemr34840107ejb.362.1658331336636; 
 Wed, 20 Jul 2022 08:35:36 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b007263713cfe9sm8110409ejh.169.2022.07.20.08.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:35:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v5 4/4] drm/todo: remove task to rename CMA
 helpers
Date: Wed, 20 Jul 2022 17:35:32 +0200
Message-Id: <20220720153532.527458-2-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153128.526876-1-dakr@redhat.com>
References: <20220720153128.526876-1-dakr@redhat.com>
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

