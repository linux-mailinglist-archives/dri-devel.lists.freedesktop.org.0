Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC94AC274D
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6700410E83B;
	Fri, 23 May 2025 16:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mbaObfXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABAF10E833
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:15:43 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-310cf8f7301so111084a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748016943; x=1748621743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6Ci3isxxhsp5k7AjuUnYW4WXxlffmz+Qa/1SXSaaPCI=;
 b=mbaObfXQsEa6TbtgkSDYkb2jRzFat2q6tvPEOkKQ2H86IvuAKz84I80B2afleJ1oE+
 nwTTsND7hJEK90CiSBG1ObHvSqJsxbdYbvyffn9XH/hrElqG2AyULvzZqj1MRTT9a4wG
 2MeovRhX7062XRU9yfIecMQJKCkwNBWyORCT/3TG3w/v01v05WrqEhyCl/De67AY9vaw
 jYT1M5Rjsr/u1YNyeM6rM53ORzkIpoJL94Nd9OCnbN2CgJQ5uL0pXR0PjTzB0kVC+wWG
 j0Pc1IgSM5x797tTIgxuWTJwtD7fwR18/fkhStLJI0tDFArZ3xpfMhoatA6I81jXGqth
 jGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016943; x=1748621743;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Ci3isxxhsp5k7AjuUnYW4WXxlffmz+Qa/1SXSaaPCI=;
 b=KU/9TfNks2KU9s4ikx9yLZrAdzQHm1A76zL3onmHv0WLiRDlSp2p84ny8Z3vTr7T/C
 1qlREcfwcSNzjMNNiOzKd7nsdSJwd9LOdtir9okBDYh+n0Zcufl85NWOBM5JKJ1tGNDX
 s3l5HK7PUzVV+H+RhJCgMCvNLwZy+1125nFbwq7yiG2GO8FFBYtmWvX4sYDNXJS/4C6F
 lxjDAF7EYr5VkJ1sS8PFB2LFgkgCkIgog8Zbm1L0oPfBGXzmdK6KNZS95pojcs9Vfb8o
 H+Bwj3v77Z56xOoa/L39Mdi/+OIi/xde7yws6ixM9wpsTPEZAZm9W5JWV9OtA6neoxXv
 sCtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+k8ZUEOwtqUKD2Xd/5CRfwL2PRmKkS3QksncJTK3cY4PsrzMhN811aAX2e8tP0nWwCkbtCj5/NGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ/Y+ml1mqqrZ7ou/oNXG7dcL5QzkHRZhdVR+nk0eQy6DTW80F
 aBYpvSRSkSnMlKr7pbjx3pv0lLGT5vRkUoLXsqqCsIipnaA5zedhR2EWxFc6Wg==
X-Gm-Gg: ASbGncvfxjCsxeVk7Ba2nZJt8A67A2QqlKkFPfpUh1/w9F8+UYhYFUnDDC0UtYW+iPa
 P+zcBikhvKlIyByPo4LmAeoyEh1QQMAscRCEDXFchTkvjRnjzzpAN/XhHA6Lyb9RiXZliUok09M
 oCrCaXCCLeR3qzOlMwOhtxoMBde58MNJxMxk5fJ8Qdf2UEFdz0kKUPD/psCA4pgtjEUepWGTqF4
 GWk1Q2lQWp1+4kJ2HMGz4LQKwTFKv9SWvSEv3zp94Z0lLhfBUZPrH7/LgnkyznLL7ENzbMNMg4M
 cSwkqvnHfaAfanPhJOkTso6IEdj029XuuKM7U7JQBUrG7owtqaLiROnCCy1TyKEgw713b7K+FAn
 JDZ7hMp0dqL7pQPjZ4e6GDu0s7c8W/Aq3UKanD4/w
X-Google-Smtp-Source: AGHT+IE8pcy7Z2wW7SrWmR8EeORXq3Lf3Mz2nUIbKMce/zPJlwY6YhtwhHMP/X+hsVmxnhhRfKeaCQ==
X-Received: by 2002:a17:90b:3889:b0:2ff:5267:e7da with SMTP id
 98e67ed59e1d1-3110ac9b71fmr132826a91.3.1748016943353; 
 Fri, 23 May 2025 09:15:43 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365d46ffsm7526565a91.25.2025.05.23.09.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:15:43 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v3 1/4] mm: Export vmf_insert_mixed_mkwrite()
Date: Fri, 23 May 2025 09:15:19 -0700
Message-Id: <20250523161522.409504-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250523161522.409504-1-mhklinux@outlook.com>
References: <20250523161522.409504-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Export vmf_insert_mixed_mkwrite() for use by fbdev deferred I/O code,
which can be built as a module.

Commit cd1e0dac3a3e ("mm: unexport vmf_insert_mixed_mkwrite") is
effectively reverted.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2:
* Exported as GPL symbol [Christoph Hellwig]

 mm/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memory.c b/mm/memory.c
index 5cb48f262ab0..58ba40a676c9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2688,6 +2688,7 @@ vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 {
 	return __vm_insert_mixed(vma, addr, pfn, true);
 }
+EXPORT_SYMBOL_GPL(vmf_insert_mixed_mkwrite);
 
 /*
  * maps a range of physical memory into the requested pages. the old
-- 
2.25.1

