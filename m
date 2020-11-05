Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA672A9188
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC266EE39;
	Fri,  6 Nov 2020 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA16E2E6;
 Thu,  5 Nov 2020 17:36:55 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id m17so430174pjz.3;
 Thu, 05 Nov 2020 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=NKcLFiU6H4GCkdzhjrWYozH3+gc+OUwyZmQoL2qAyo4=;
 b=jI1WCZDJ6CthwcncnI2OsCn26dz8xinJlftWX3aG62O94VRWOdr6u3XNHojmtHVy0S
 1Qt6j0/CWQiEfjtJjpnGz2F+zzrnNx/DzA93SZkKLUONE4gYvUYTqiU8C7SKBCLVGyZK
 GH4ZDDqKAiKdpfPp4swZAGqK7nBJeSfCHYz3HaKxfC/iOsLOa9630qMv7Ew8sKoxd96G
 MCMODi19AYzXkpitAvtHk5TLN7eV/DeJlWARbgcwdv7pt1DShA9J4KRWYmYH/ABu00MK
 FS37X4SkIU5fSDeuoSLP5TdNtJlabrG2Yj9XoDdv4rJMwPyHr4vUroek/LeznmSr71z7
 Iozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=NKcLFiU6H4GCkdzhjrWYozH3+gc+OUwyZmQoL2qAyo4=;
 b=X75B7165L9HkSIefPHocF8isG1WNwT0pjEbI8vX9si4rQudlkdjMkW+Gdlupa72lfL
 Z+Ef1GjvhcgcoLO2le7JvT4elF4q+1XYaOOpvdNMkXD9pU0HbbsRdgbqj8T2B+WNsvbA
 rubonlHbA+5wD02f/FMuxYAanLj7rcT/sQV1Ns0IZ7obswZ9tYQnjutKSij0OYvZLDtc
 P8gQULdSVXbcebUAHDZo2J264VYESamY6W8YZN00jhJ1Of9P4nYWTrbJlkzNk+T6U6Cj
 53BhbSqyGJyKBnFOc0qQSmgQvfkLZ4oN1zMzLr83kKPcN9S2veDeChEbWSvMIVoRS2kL
 gzhg==
X-Gm-Message-State: AOAM533imKhf79iBgGOd03QBFklI7WBzDeVWy/VUL59jHI2pTb0tavGK
 rv2M52E7H6rdRN7jogmuxDo=
X-Google-Smtp-Source: ABdhPJwf33qw/yGX0h0BuGDoO5yxwO6nzn2tEG/Or9w+aOg3/nSsSG5F7fQP4eVquvLQ8O0/FWoc/g==
X-Received: by 2002:a17:902:b410:b029:d6:b42c:7af9 with SMTP id
 x16-20020a170902b410b02900d6b42c7af9mr3396359plr.21.1604597815142; 
 Thu, 05 Nov 2020 09:36:55 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id u5sm584940pgj.28.2020.11.05.09.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:36:54 -0800 (PST)
Date: Thu, 5 Nov 2020 23:06:46 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/vgem: replace idr_init() by idr_init_base()
Message-ID: <20201105173646.GA41732@localhost>
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
Cc: intel-gfx@lists.freedesktop.org, mh12gx2825@gmail.com
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
Changes since v1:
   - Changes suggested by Daniel Vetter:
     1. Correct typo in patch summary
     2. cc intel-gfx to get the patch through CI bot test

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
