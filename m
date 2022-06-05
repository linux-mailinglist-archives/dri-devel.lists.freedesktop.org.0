Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31353DC91
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 17:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A610E6B4;
	Sun,  5 Jun 2022 15:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70D10E6B4
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 15:25:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id er5so15776665edb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBSo6LhPKNDFYlpKsrymkakMP0nVeotmS2LDUe++2Ag=;
 b=MI2W98/bl4fvsuc7EA8n3jW7RtyXsolzKl8iYKGjUKHxpV+xI4yWBh9si/SfGcnemX
 Wp8Z6Ka4sKIw3ARIJrGTE81BjutbjE8F98r+5LHsywIlLVbH8ZT9BpS2oa3MAZ3Rs2gu
 AdGWx4erG8ZpDjcF3eYxvJR82Nlg41YU9S044=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBSo6LhPKNDFYlpKsrymkakMP0nVeotmS2LDUe++2Ag=;
 b=7IKXbHjZQnWOxy6qL7U8AY7RdN6P0Ge2igAikTeHaX+AbtdK5VM0+LDb3N6zp62wFp
 6S63NAhPZ3lkRLbVU1PHbGfZEOgGKm9b+uo3ONrFPYoGBCk+cV81Ql0Y8jQTy4z/JRIQ
 GDKmjA2gRcQJNIGjOswz+nY5CjuLYshEA9N8OdFhmxTz0Pa6LACkO48GPTdV9MXA0xMg
 yt77qlZHAhrF7zUC5nYtJrru9u3vXbDHWDcJmS9u/nlYmMeHUEDaVc7T1pMNYH31RvR8
 cc5uVawqMoEhUCD6P+5LLRhTOlWuBCM4H5yDxqJfoHZ4PIuLCCKyARHK66Xn9iXQV9dW
 pGhQ==
X-Gm-Message-State: AOAM530dWfyxBFXRO39CkL5HKwcEJHYNQZW4m4qHARujwthQT1Ow5xlk
 UJ06izbZu3Mt1ET0eb3v8MMYtw==
X-Google-Smtp-Source: ABdhPJyz+DCsoFSlGZIktlTYtkVTK8pml1UNEzc+5GGMb5RBEfVAt3+lSGDPBsrviNR+kw3jH8t97w==
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id
 i20-20020a05640242d400b00412c26b0789mr21414271edc.232.1654442745494; 
 Sun, 05 Jun 2022 08:25:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056402125500b0042dddaa8af3sm7051499edw.37.2022.06.05.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:25:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] mm/page_alloc: use might_alloc()
Date: Sun,  5 Jun 2022 17:25:37 +0200
Message-Id: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

... instead of open codding it. Completely equivalent code, just
a notch more meaningful when reading.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 mm/page_alloc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2db95780e003..277774d170cb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5177,10 +5177,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
 			*alloc_flags |= ALLOC_CPUSET;
 	}
 
-	fs_reclaim_acquire(gfp_mask);
-	fs_reclaim_release(gfp_mask);
-
-	might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
+	might_alloc(gfp_mask);
 
 	if (should_fail_alloc_page(gfp_mask, order))
 		return false;
-- 
2.36.0

