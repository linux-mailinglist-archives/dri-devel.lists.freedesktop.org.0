Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0E2A9186
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7558C6EE3D;
	Fri,  6 Nov 2020 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D686E28B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 20:21:41 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y7so1159609pfq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 12:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=u9q33gCTTRJK5AVG9DQojto+J/DJ69G/peuw5a12MEU=;
 b=rRRKymgTqnrT4EGa4W/y9zlMpHJgOt7VzD8NLdeDFlTi1xJ1qyU6CVmaPvapwd3lK0
 wK55ZySOhQsnHzqxa4I/JXLIgu0z1ql+qLYFrJm5W3pKfloiBFdV6xUoLw/Ajx1/ASiz
 aNuRSvY+u+x1s+rm27sFEkosNPdtl9579CKnqPxoeYX1MCgMi1uoAuQLgAy7R3Rd9zAD
 bR0iput7JbuyPR9Bg/1J1gUVZ59ZnNxlMGjFgpcZ5OxlOcu1PxqJQxEAdDx3zyZGso1L
 Tb0AsI7LqFOZaJeO/F0Q8nKfY/uu3MdUgicOakbO5OLh3ZLfE8XnnfxDp0iQOCDfPdvP
 4QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=u9q33gCTTRJK5AVG9DQojto+J/DJ69G/peuw5a12MEU=;
 b=KOG9U6hsJxfZCGm/edcRDwlpNd/kzwe3ySG7ZaTUqphO5boyyADib/CAp/bAgBOgL+
 WQgbKBzHi+gEg2Ma7V1Qkc/DkH06cNUZpQGvJsx3oJkR8s/8k+lpCDjzH3zOG9YdO+gj
 yvHilVVT2MULinBx3PEkXddWb3dHhxv1YU26PYQXavYqPjCEnIojWBoL1K5Z6s8UhFx+
 3Lfana+LzF6pd3VD1NfV3APFY8yA+iGVahv9ihhNcaY5fCFmKiMKP/ZOVTo7aQhDcNwV
 8hKIIWGqDvzWhEwote/l02DcSVEy9lrZoa60O6pRt1E5iJY73zJ3Fo9ARuq0GaDKGgEd
 0iKA==
X-Gm-Message-State: AOAM532iCQAlWk0mjFpIdJSdJujtzu76IRrtkWZ4UhUYefX9C8MKX6A4
 jaAKhqKe7i0syxfwN+eQJsA=
X-Google-Smtp-Source: ABdhPJwvL6uA2IU1FQBcROzyhlpu5THuY9mxHBMAuHSCl6H9CMydeGr72MtMdZfdisw4hYytRne2Rw==
X-Received: by 2002:aa7:8548:0:b029:164:769a:353 with SMTP id
 y8-20020aa785480000b0290164769a0353mr4328512pfn.45.1604607701254; 
 Thu, 05 Nov 2020 12:21:41 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id l7sm2970079pjg.29.2020.11.05.12.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 12:21:40 -0800 (PST)
Date: Fri, 6 Nov 2020 01:51:35 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/vc4: replace idr_init() by idr_init_base()
Message-ID: <20201105202135.GA145111@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: mh12gx2825@gmail.com, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier for this driver.
The idr_alloc for this driver uses VC4_PERFMONID_MIN as start value for
ID range and it is #defined to 1. The new function idr_init_base allows
IDR to set the ID lookup from base 1. This avoids all lookups that
otherwise starts from 0 since 0 is always unused / available.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Changes since v1:
   - Change suggested by Eric Anholt
     1. Use VC4_PERFMONID_MIN instead of magic number 1

 drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index f4aa75efd16b..18abc06335c1 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
 void vc4_perfmon_open_file(struct vc4_file *vc4file)
 {
 	mutex_init(&vc4file->perfmon.lock);
-	idr_init(&vc4file->perfmon.idr);
+	idr_init_base(&vc4file->perfmon.idr, VC4_PERFMONID_MIN);
 }
 
 static int vc4_perfmon_idr_del(int id, void *elem, void *data)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
