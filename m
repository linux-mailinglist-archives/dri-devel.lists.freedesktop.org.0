Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EF56794D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0176618A3EF;
	Tue,  5 Jul 2022 21:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C4618A134
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657056444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EL5Y6xobY6nNfLFyUJpZNgTfVBKuW8H+SSOn+M8vu8=;
 b=QQLYrQOqPrF85STWEAvDTnWZztpHlueJcnv35jtWtJnbeiKk2tSBzQrpTA1Oc5dDSrCtn6
 OkQSI2+yklTCOtEq4X0hoPNWKUeErK/xJ/5sz6WFzRdTTIn1GUmDmV2DgvBHwJxJe7QnI5
 0OzY7aJG3coHPXKzirsT5Qc78Z3vwYg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-2ru_IbYeNouFPDmvgZM2pA-1; Tue, 05 Jul 2022 17:27:21 -0400
X-MC-Unique: 2ru_IbYeNouFPDmvgZM2pA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o11-20020a056402438b00b0043676efd75dso10271045edc.16
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EL5Y6xobY6nNfLFyUJpZNgTfVBKuW8H+SSOn+M8vu8=;
 b=lSF2zSLhs6fSZWI8FusZOA5kag/kvEx2ZEc457L4fUhf9aFRH/rFP1eA7V3hYLtBNc
 DgAmmCPmpi+GDzgBBhNs0++ZGpV/euqcG5/TxLsRl2JeqeGpr+9FY7V3jT/Ip88Eg4iC
 QP06XCUfwrCYFyMFfaWN4eOF5B21g41a9sROR/oi7auvM6ghQpg/ieBA94gxWkm65GPj
 43yWCeSJUiZLppFrYQf6M1gMjvMyJIuXPspIMO9NNxlP3bhIk1NMnz15Tr3SNqaXkeVg
 4wXsgNcVCsXCWPl1XuEweA1aKHOV+WCOhBZAQXdjyCe9B6Ljh5qFnx8JkG3aawP/zFcF
 XnpQ==
X-Gm-Message-State: AJIora+0edfMHHV0RpEgxBT5DKd0SWgh8Aclgb+lq3zO5UnwcZE2ApOF
 QIKP5VJhXKk13ASOdrgxcNgL9ugXgQYfDOzWFpUQGX+lUGw9PG/PvzCoZf/Y78YsZuw4t97A5Kv
 KvDm9V1AbpIJT9qf0S5376+W2rAOZ
X-Received: by 2002:a17:907:60cb:b0:726:a69a:c7a with SMTP id
 hv11-20020a17090760cb00b00726a69a0c7amr37053672ejc.156.1657056440086; 
 Tue, 05 Jul 2022 14:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzQJwVsCU8Fs0s93xgADFfs3aqJVtQWqMGOvtd3I2FLsQKPRShxC0aA0MP6NzMHQF/FsZ/Dg==
X-Received: by 2002:a17:907:60cb:b0:726:a69a:c7a with SMTP id
 hv11-20020a17090760cb00b00726a69a0c7amr37053656ejc.156.1657056439860; 
 Tue, 05 Jul 2022 14:27:19 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ez24-20020a056402451800b0043a3b90748asm6213319edb.26.2022.07.05.14.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:27:19 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch,
	laurent.pinchart@ideasonboard.com,
	airlied@linux.ie
Subject: [PATCH 3/3] drm/todo: remove task to rename CMA helpers
Date: Tue,  5 Jul 2022 23:26:13 +0200
Message-Id: <20220705212613.732039-4-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705212613.732039-1-dakr@redhat.com>
References: <20220705212613.732039-1-dakr@redhat.com>
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

