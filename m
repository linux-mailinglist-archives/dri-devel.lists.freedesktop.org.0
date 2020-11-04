Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A652A641B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665DD6ECF3;
	Wed,  4 Nov 2020 12:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7783B6E120
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 11:23:44 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 13so17037849pfy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=iqkBaJQMLLSn3M5HmvPZvenF0ZnDsvHIodeI0SDkoT8=;
 b=i4duuCrk/C/kCdN+uiu8Xnb+j6jKczFmUUIPRXjAfuVWaZB2Gml9H9Ha69fjVptjYw
 DMK9FNY7Bkrth+tuQRbQeLvalByoN6jGboe2A4zJ+q5veX3xpobZMbgXN47gapnbD16i
 lC44L8z9qMiRs+XpGwu3OTtItGJzwmRgzrXS+QuL3CXaEtUg9R5c3u1lmtPkYIESywlg
 HDTqbJD/ZBGIPRSxZtFrT+R6btkLgUF6eoSKlLSj61xDwy8VEfFCns6eHgxHm9h6A7Yz
 96jZFy1JXOn/iF5NHyuadGS0TmBnMPgimmYFuLE9VF90z55yR2uGUzAkVfGNdBZ+Onpu
 4YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=iqkBaJQMLLSn3M5HmvPZvenF0ZnDsvHIodeI0SDkoT8=;
 b=IMFibJJNWzbv2cTQl1JkaT0cuwJJTRg1jIDti69d6I0QK0EnpMit3LHAyNvHJPQOT9
 N35u7sLx/rcCQRyOleZXGfOmk0oqFbU05dbh5GJF4jZ3lQcNXeMK0MTz89J9JqK6VZBm
 aeZyifmV95rwnW3hzSeJanRKdNpdwQXNjvkTvIRlQszDBTfaq05QuTMskPtzh41SSeyE
 SJt2vdDcBUhvAfHY1V9f6Hghg+woN/pKnKU64+buWQiRKqbwJP5AviOOvJN6Dt62esK3
 yXyW11lIXEKDahHSeliWAYN0IAHeTnFAgZ8ReNEUj8DWImy0ZN1Izcqe/g+ranY3aIpK
 jGJA==
X-Gm-Message-State: AOAM531ifLjnvHvL8WAELi+Dyg1N4xdKn3oZYrCJ1YZgb6P1acE8JmJf
 q6Cgzff6Pb7E/3qSh35nxl9h25VHvWA=
X-Google-Smtp-Source: ABdhPJyKmZjy9APbGyGtvptrvKgWNDj/kqACD/0WC+F/YjahNzBVhU+zKwToLUf548ioNlkmRcPEHw==
X-Received: by 2002:a17:90a:8c89:: with SMTP id
 b9mr4097017pjo.34.1604489024128; 
 Wed, 04 Nov 2020 03:23:44 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id n64sm2182055pfn.134.2020.11.04.03.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 03:23:43 -0800 (PST)
Date: Wed, 4 Nov 2020 16:53:38 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vgm: replace idr_init() by idr_init_base()
Message-ID: <20201104112338.GA29271@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 04 Nov 2020 12:19:32 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier. The new function
idr_init_base allows IDR to set the ID lookup from base 1. This avoids
all lookups that otherwise starts from 0 since 0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 17f32f550dd9..2902dc6e64fa 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -233,7 +233,7 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
 int vgem_fence_open(struct vgem_file *vfile)
 {
 	mutex_init(&vfile->fence_mutex);
-	idr_init(&vfile->fence_idr);
+	idr_init_base(&vfile->fence_idr, 1);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
