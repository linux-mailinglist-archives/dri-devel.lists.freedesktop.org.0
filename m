Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34F1923B2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 10:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC4A6E5CF;
	Wed, 25 Mar 2020 09:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9FF6E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 09:08:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m17so1839391wrw.11;
 Wed, 25 Mar 2020 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afugKYwAFd8RIjB02GefkanDSF4I40fGZACjXYFZuvM=;
 b=N8A3l0X0NYWYEhPlpQP/+iv/Y0Vene5U0OT2pZ8Y592F4PnmV4TPrBAuYTOXyW3w9O
 Sj2pD3Y+E4dN/71GlxXT7Ox4C9O9sX9HH8r4UKCPHefbeDz36/ll05FmBYWWvVZoNVYT
 65DCrSfJ7Sx7eyCbjn4yjhQw0oAV1htzqwj8a3HkWKlKN8bOSBsWacfeQ+I16Spf5tkY
 osgCMfOmu12YOlvPORg7J05FsbvWfBmny5xh1zfZeY7qF3UphPwQEA5PutNn19NfAMkX
 TusJn2c4GDwDF8VPgo2ZSqwJMWV6Mm2Mqk/zGFPSZ5RhwwtK4PLuieU9q2fW8jkG9+0L
 ugGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afugKYwAFd8RIjB02GefkanDSF4I40fGZACjXYFZuvM=;
 b=BjtyNsvzU0RWfv05H7heqNICAbP/nmgAW+jU06du26qmRUCzQA7bB0so+OFUz7xuJx
 VZSoem1E5z7Y+TpUflwGu7x8DjwR454J1SK/ibRoxi5kj6t6xT/dxhBYyTib+PoOXdeb
 sN5foQDymO7pM+xFtTuTdqADyMhU/zVcNGdAySOsiyrW9tgGMTpZIPKEZrdH2AswtMz/
 AlJjuAPB7sQ4VFNLf6kYthGxrF3TmDpc/2KwoPQ2ZMdAskuHKji6MNscSN/S+7jwexv4
 VaMifpPrq0wMwAp/ZvNOSteq0GeiYLCQIoWQhyJHCjWIF+GQvG8kMNiI/6mJzgu3cX+m
 2v1A==
X-Gm-Message-State: ANhLgQ3fhqB+CG0B6U+w8ISRzQgsGueB2+w8eUZvlha33Y9RHv0843lh
 HlXhx3TCN5QQNeH3Pg1FqyaILNAjl5g=
X-Google-Smtp-Source: ADFU+vtNxVoilqqyVG5ulxzKb1TzStqeHOA53Zlr5aY/seDzTHSCFa6Rzv9dSOnd4deF0AXX/BR+YA==
X-Received: by 2002:adf:ce0d:: with SMTP id p13mr2269121wrn.8.1585127319134;
 Wed, 25 Mar 2020 02:08:39 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id 127sm8565048wmd.38.2020.03.25.02.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 02:08:38 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/prime: use dma length macro when mapping sg
Date: Wed, 25 Mar 2020 09:07:39 +0000
Message-Id: <20200325090741.21957-2-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325090741.21957-1-bigbeeshane@gmail.com>
References: <20200325090741.21957-1-bigbeeshane@gmail.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, bigbeeshane@gmail.com,
 amd-gfx-request@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As dma_map_sg can reorganize scatter-gather lists in a
way that can cause some later segments to be empty we should
always use the sg_dma_len macro to fetch the actual length.

This could now be 0 and not need to be mapped to a page or
address array

Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..1de2cde2277c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -967,7 +967,7 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 
 	index = 0;
 	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
-		len = sg->length;
+		len = sg_dma_len(sg);
 		page = sg_page(sg);
 		addr = sg_dma_address(sg);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
