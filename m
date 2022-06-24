Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313F5594A7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5788112C23;
	Fri, 24 Jun 2022 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB2F112C01;
 Fri, 24 Jun 2022 08:04:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c65so2327040edf.4;
 Fri, 24 Jun 2022 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SN2tXnkiXYHDkRcNluGEiWD+Zcie7EgTba4v+LS00Rw=;
 b=CjcSe9wc4EjfAkbjkiF8NJM6p2V4TBIzx/MVoQMmpgiPsjLyR+gRuRTFEYB3Ktsmj6
 uDAJoHxOnz8/QuPN6vTSy5gLwbvZIrxGeq6qoPabZTcRU6gXi4B9UgKRuVNDxdOuXcL1
 cxd/73iXXQR+fr9ZjFoDFmjR0cLQM1R0DIR2jGAJPqHq78r8H+21zwbEgz340DrDdfqf
 X5N2BIdOCyjdEdUdAOIQhfOYFDl6u7OALHxEmKZyWH8er7gOe7gpZJPRqEWHVjjT+Zda
 LFVWx/ojsAy6fLSK9XLReier7Yc/aQFSo1vJ6Ffb4pLtiw1aDQ3/hGk/ftltPnqcfrJN
 mArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SN2tXnkiXYHDkRcNluGEiWD+Zcie7EgTba4v+LS00Rw=;
 b=5Ll1rqaRGm/BqcPT412mRHi/Ul+Jvuv+QpezTWS6327qxyounJmaaHjSRsh25xldvO
 2MKm8zkxl91YUeFExgEgmy1jS3C+ULGKtUWXXtn8cKcxzQeWPiOMk6VavWD7JCopvurZ
 RhaOoo1sW0D3YZkNTN33DwFBGZnKcRyWQW0nGudtDcgatpdLyA8AZRSXav0wufw3OKER
 L+ITsZZ4O11rlsKjoMH77XKVLCtQnfCmtuDKfy/H+VcCIepUq6G562Rw9Ui4MLcufBey
 takSjBPWU8/9szDRlprI2P+jr6vB/SHwTulcKQyCsca/M/c8N07mkPIrTEodurLI1WJp
 /l5Q==
X-Gm-Message-State: AJIora/vqu+lroBz44Qis/YOJRvRVyAspEIS4z+QaeLyZAEfTTttAvWq
 9CcCNlnXlt6PFG7V1l73sNVOUUGLwi0=
X-Google-Smtp-Source: AGRyM1tBvj71cbsgZ5j4wXJcKfxDt7AmGXAvH0woqtRU4by1QVnuj6MIlbtq+6gf5TBsdwCsD9lmDQ==
X-Received: by 2002:aa7:d296:0:b0:435:7f33:38bc with SMTP id
 w22-20020aa7d296000000b004357f3338bcmr15804834edq.399.1656057893977; 
 Fri, 24 Jun 2022 01:04:53 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] dma-buf: provide file RSS for DMA-buf files
Date: Fri, 24 Jun 2022 10:04:35 +0200
Message-Id: <20220624080444.7619-6-christian.koenig@amd.com>
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

Just return the size of the DMA-buf in pages since pages allocated or
mapped through DMA-bufs are usually not accounted elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 630133284e2b..16162ec3538c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -494,6 +494,11 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	spin_unlock(&dmabuf->name_lock);
 }
 
+static long dma_buf_file_rss(struct file *file)
+{
+	return i_size_read(file_inode(file)) >> PAGE_SHIFT;
+}
+
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
 	.mmap		= dma_buf_mmap_internal,
@@ -502,6 +507,7 @@ static const struct file_operations dma_buf_fops = {
 	.unlocked_ioctl	= dma_buf_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.show_fdinfo	= dma_buf_show_fdinfo,
+	.file_rss	= dma_buf_file_rss,
 };
 
 /*
-- 
2.25.1

