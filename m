Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621BE5594A5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37A112C16;
	Fri, 24 Jun 2022 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D24F112699;
 Fri, 24 Jun 2022 08:04:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c13so2291698eds.10;
 Fri, 24 Jun 2022 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p1KsJJhvBthReekWVkDyI4HkkhGOTDE0uEXhDskma64=;
 b=KRem//CoENhA5H2UpmZZdJhIsNw+EqHDcRDSpekGpVdLUsKXbAGMuEpz4BJJr9Z87z
 IFYClc3R1wwPUygzstZ5aUNS6Wq5y0CfGSvfoDrVHkFbu0scIpPzWzMEq6eV8O7oB/AX
 FqDJRWt2Ipnk6y0r0VVTgjAU7cmOXdZEoJ0Qo2ZbG6rmkxKpX6vKZa5MuOPpSarFPIOI
 rvJt3BfdWDmWUzFnm2BJraq/RqKiudFoTZr0bvTI3SMqicR6ERRh4vwjGTYV2bCjY/8g
 Cs+cebdzqLUOjb0//Sl+P40ocJPd2A5kT/PXdXVI6tczXXpaQaD+aGMxYg5hyRLGbgEA
 pMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p1KsJJhvBthReekWVkDyI4HkkhGOTDE0uEXhDskma64=;
 b=PzrOxAbYOx7ifGZKC2wU8owkx8EhW+dPG/cDbcyWkRRxFYxDiulGqnSaBZmUI95/QD
 9QcyrIBEcX43dZyjallHfuvs3BG4C1Wy7hqLnPFjacVm9T/3vqA6WeoyIq6268XQeXs3
 q2yZfy5DbWizUAR73Tv8qZ8rcV/6m2H7toSj9OY6zOIpDADmKR+SonHs+KaM9olliKZ0
 vIxvY3wrvRfZZSQ1dibP5KfhxhIesNuDfKq7ROS5O97uPmlq3bbpfrV+zqh4x0PsVELb
 GIvHUx40dkqk4osB1HBoFRqQe8uaZNGHnCsfX4kA0u3APurfyU5lCn4ZHiHUhYTRcNTx
 qYCQ==
X-Gm-Message-State: AJIora9S0LhmZrbtTdM67OPGA8MAoKLEt4xWP1RzPLotfdc695LmunRn
 grKMZlt5ndg8WdcF7THOiB8WB8eTlhc=
X-Google-Smtp-Source: AGRyM1sHNTKfIbC1nDS/xDvZBcuQhpYMoeUWuMsHYIL5xwYmRCaeHIcH9pVKRTHXqSe2jlNLioeTeQ==
X-Received: by 2002:a05:6402:3807:b0:435:20fb:318d with SMTP id
 es7-20020a056402380700b0043520fb318dmr15936277edb.272.1656057892772; 
 Fri, 24 Jun 2022 01:04:52 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 04/14] mm: shmem: provide RSS for shmem files
Date: Fri, 24 Jun 2022 10:04:34 +0200
Message-Id: <20220624080444.7619-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mhocko@suse.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This gives the OOM killer an additional hint which processes are
referencing shmem files with potentially no other accounting for them.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 mm/shmem.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index a6f565308133..b068ac5ba4bf 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2209,6 +2209,21 @@ unsigned long shmem_get_unmapped_area(struct file *file,
 	return inflated_addr;
 }
 
+static long shmem_file_rss(struct file *file)
+{
+	struct inode *inode = file_inode(file);
+	unsigned long nrpages;
+
+	/* Only account shmem files which aren't part of any fs */
+	if (atomic_read(&inode->i_count) > 1)
+		return 0;
+
+	xa_lock(&file->f_mapping->i_pages);
+	nrpages = file->f_mapping->nrpages;
+	xa_unlock(&file->f_mapping->i_pages);
+	return nrpages;
+}
+
 #ifdef CONFIG_NUMA
 static int shmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
 {
@@ -3811,6 +3826,7 @@ EXPORT_SYMBOL(shmem_aops);
 static const struct file_operations shmem_file_operations = {
 	.mmap		= shmem_mmap,
 	.get_unmapped_area = shmem_get_unmapped_area,
+	.file_rss	= shmem_file_rss,
 #ifdef CONFIG_TMPFS
 	.llseek		= shmem_file_llseek,
 	.read_iter	= shmem_file_read_iter,
-- 
2.25.1

