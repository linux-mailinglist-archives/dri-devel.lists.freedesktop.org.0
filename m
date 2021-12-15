Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2B47549A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 09:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B721110ED18;
	Wed, 15 Dec 2021 08:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223A110ED1A;
 Wed, 15 Dec 2021 08:52:35 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id t6so19391731qkg.1;
 Wed, 15 Dec 2021 00:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d3xqEFCnUeJ8vvB6oqGl3RWteLibojQLIPJLALa9AL4=;
 b=LWvCWYu5dd7SpqDfLhzfKe/gM68KLGz+a8UD4ROmRR+SiNgJaYC0CO+GKngxadcs+B
 jw7au6+Czw16h/I5TzQ59+Nhjegs38s7HrW6EGV2ePYGKmPPj/dVe2CpsVbGEI2JLc+d
 KbZG+3Lo+NdSqaOFyZXv59ka5U6J6QpALFB7fHX4OR2pn0mzNe8S8Y6EHZ7Mko9eDC7O
 YYgD+iPDbUfxJaKgozd6Osl2u+gsPGwNmtov25jPzMffqa6qQzv+h+qJtdIlPe10WNwV
 SRt3rKe6NB+OMgcd/b0vLs78iVPf63mrDLHlwM5YGE9mGEjEqerTd32oYqH/sr84Z/Da
 Q8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d3xqEFCnUeJ8vvB6oqGl3RWteLibojQLIPJLALa9AL4=;
 b=DW8oSB2JlORUdqLVkAnU88HAOghzyqHyOTfAjbtQHILD7D8ien4mj/Yw3XszKv76cE
 0WqdJlVXompx/1SB+mdMJWDCvlXExkZoQjC7QIDwcvgKD8FOXV18bQZWAZlnUv+5Sk0J
 /1pixP7ZrOw26eXaiJRtUkaeU9iWIalglgL52xUpFr7hEAOi1NPaqZmeByd8niWY/NtY
 TsZdorNjUqkW3iPLtPeHpP7Z9Uml8EuDZGdnP5u5qWiI2acn6I+lyG/YzsQsD2yH5z2i
 iyXtS7IvhD4dkNZkRPD9o/Oba6d/hJa9xU09fr0SSsIqeoT/4moBY+kerKYpNoLU4rTW
 polA==
X-Gm-Message-State: AOAM532guP92qx05gejl9vs+/+XpsSzezvg9Ovf3ibqPxI9wD5eg2XFX
 SM0pjsvAqfloEwV/AlizGvK0mT8CDdE=
X-Google-Smtp-Source: ABdhPJxbuYNNH89Hh5DonCAoPvklNGqdaYuC30FlbEHaKHj3JDfq8kkAx1hTE8+V67UMKVqj2+s/9w==
X-Received: by 2002:a05:620a:66e:: with SMTP id
 a14mr7842353qkh.496.1639558354245; 
 Wed, 15 Dec 2021 00:52:34 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id t15sm1039864qta.45.2021.12.15.00.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 00:52:33 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Felix.Kuehling@amd.com
Subject: [PATCH] drm/amdkfd: use max() and min() to make code cleaner
Date: Wed, 15 Dec 2021 08:52:26 +0000
Message-Id: <20211215085226.444116-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use max() and min() in order to make code cleaner.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7e92dcea4ce8..c6d3555b5be6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2254,8 +2254,8 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 	start = mni->interval_tree.start;
 	last = mni->interval_tree.last;
-	start = (start > range->start ? start : range->start) >> PAGE_SHIFT;
-	last = (last < (range->end - 1) ? last : range->end - 1) >> PAGE_SHIFT;
+	start = max(start, range->start) >> PAGE_SHIFT;
+	last = min(last, range->end - 1) >> PAGE_SHIFT;
 	pr_debug("[0x%lx 0x%lx] range[0x%lx 0x%lx] notifier[0x%lx 0x%lx] %d\n",
 		 start, last, range->start >> PAGE_SHIFT,
 		 (range->end - 1) >> PAGE_SHIFT,
-- 
2.25.1

