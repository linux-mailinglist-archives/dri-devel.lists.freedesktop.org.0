Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D58D59E9
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD9214A750;
	Fri, 31 May 2024 05:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eYwC0mGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4491414A74E;
 Fri, 31 May 2024 05:37:18 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-6c2d04b0833so82817a12.2; 
 Thu, 30 May 2024 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717133837; x=1717738637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJufM3OWltI8mpwlNCJTQQKHrwOunQwLsFta6I0Ngzs=;
 b=eYwC0mGWWhyRz8B4a62sRyBwU1hM7TahCQzvUn3tUJfUvxyp/qGIhTfTUSkDFcHDoy
 Wr7dq3LKQ1A2jNJkXYGIlBoMqJlKncM8d4Wdir3m5IdmqC/xL+R0AmGYfr+AnoKvW67p
 E+vZ9r+96qpTtr52USt7JKdfQK+tIddNcsk/xpBtN/MjwmLd2v/TZwz0NSdlo1ajyJcA
 FvE6+pbVyPl55Iqm1IGBKZuMD/x/4/BbGBSSDgMU705fNnf2biiCdk47vf/dJnsegg58
 ftwvDDIppMXKbxERcMGuhzdGqhuhUYfd0Ur2xRc2nco6LO4UDCtdGoFj0wVqHJ4HjouD
 VqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717133837; x=1717738637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJufM3OWltI8mpwlNCJTQQKHrwOunQwLsFta6I0Ngzs=;
 b=mi7Cm6dwGjEL0YknDd3UqswEm5bMxMHph02rMQLxkNr9RPkVnDKWpT0V5/bkdoYKBQ
 2yDR4Kwee1mih/WEuCbGA+UwsAb4xzEmzecuEQeKXEvhQPoXFoiFMEmSc1tH1rvcCgtJ
 RXJDghd97L1GTzY0UU4nGeJFi2zFWEUN/KRQG+gcZVvzdI2qzmwV06Bt/Nqy9cCa7Etw
 /4qdzpLVnXS7GRY3XwkBxkPzYaxDl0EN/k7bPOy3QZXwfEmh45kv/AZushTaKNmzxz43
 ZmyNubHjTry/X0cDRbzZv2bPnWSVfJMa71lGxydCvX1zNozj1cEgrJgCrxaYa9RcOEfA
 FSUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDqzZBX6zeWxQLCGN5x9wzt4+vX0FVEiqM17lJf6uGdexcAFtj/+u+DqYDURmCDmAjxm3tzmgTgBaBL9/SgH3aX8Xm/2JgYpLHjQymsHgq
X-Gm-Message-State: AOJu0YyaAxmbImW3InrrtwhjSMDl3idafvO0Npaw1Z2C9RwlY6XDHphZ
 CtAtbOlTaqmranN8xvOMDJyAvVsN2mbnHFRNYM4UqLFyJ8uFIbqePVk+Cg==
X-Google-Smtp-Source: AGHT+IFBMaomj0TXwp+xtjmffEkMI5PzoWIzCbbgBBedH2imbGs3hJMYxPuDO+WC421BLo7Spt3uHQ==
X-Received: by 2002:a05:6a21:197:b0:1af:a5e8:d184 with SMTP id
 adf61e73a8af0-1b26f3668d1mr1097543637.5.1717133837237; 
 Thu, 30 May 2024 22:37:17 -0700 (PDT)
Received: from localhost (43.222.125.34.bc.googleusercontent.com.
 [34.125.222.43]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63232dcb6sm7417795ad.61.2024.05.30.22.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 22:37:16 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] kernel/resource: optimize find_next_iomem_res
Date: Thu, 30 May 2024 22:36:57 -0700
Message-ID: <20240531053704.2009827-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can skip children resources when the parent resource does not cover
the range.

This should help vmf_insert_* users on x86, such as several DRM drivers.
On my AMD Ryzen 5 7520C, when streaming data from cpu memory into amdgpu
bo, the throughput goes from 5.1GB/s to 6.6GB/s.  perf report says

  34.69%--__do_fault
  34.60%--amdgpu_gem_fault
  34.00%--ttm_bo_vm_fault_reserved
  32.95%--vmf_insert_pfn_prot
  25.89%--track_pfn_insert
  24.35%--lookup_memtype
  21.77%--pat_pagerange_is_ram
  20.80%--walk_system_ram_range
  17.42%--find_next_iomem_res

before this change, and

  26.67%--__do_fault
  26.57%--amdgpu_gem_fault
  25.83%--ttm_bo_vm_fault_reserved
  24.40%--vmf_insert_pfn_prot
  14.30%--track_pfn_insert
  12.20%--lookup_memtype
  9.34%--pat_pagerange_is_ram
  8.22%--walk_system_ram_range
  5.09%--find_next_iomem_res

after.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 kernel/resource.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index fcbca39dbc450..19b84b4f9a577 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -326,6 +326,7 @@ static int find_next_iomem_res(resource_size_t start, resource_size_t end,
 			       unsigned long flags, unsigned long desc,
 			       struct resource *res)
 {
+	bool skip_children = false;
 	struct resource *p;
 
 	if (!res)
@@ -336,7 +337,7 @@ static int find_next_iomem_res(resource_size_t start, resource_size_t end,
 
 	read_lock(&resource_lock);
 
-	for_each_resource(&iomem_resource, p, false) {
+	for_each_resource(&iomem_resource, p, skip_children) {
 		/* If we passed the resource we are looking for, stop */
 		if (p->start > end) {
 			p = NULL;
@@ -344,8 +345,11 @@ static int find_next_iomem_res(resource_size_t start, resource_size_t end,
 		}
 
 		/* Skip until we find a range that matches what we look for */
-		if (p->end < start)
+		if (p->end < start) {
+			skip_children = true;
 			continue;
+		}
+		skip_children = false;
 
 		if ((p->flags & flags) != flags)
 			continue;
-- 
2.45.1.288.g0e0cd299f1-goog

