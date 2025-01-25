Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3BAA1C1B5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547E610EAA9;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYKCBpfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AC210EA79;
 Sat, 25 Jan 2025 06:47:37 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-844e6d1283aso105645439f.1; 
 Fri, 24 Jan 2025 22:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787657; x=1738392457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhCfYf7LWbGsDKgpZFGMa7Otj3zRUhvG+D/wYe+cSJI=;
 b=FYKCBpfpDQxmda3vyP+oWGCRbP3hL+Gkv8l9sE6G+f9t/BR9jVloQbEqj/BQBCs6Pb
 QCcsPl2SjwdFZzRg1Gh3yGBSvoKpuuGbXa6hUTpsh6Q+W3m95n40nk8FHWu5umPlDJh1
 j41jCgjgyhL8l54dmT70/B+/Cxf5SChZXn1awurE+rTEq4xfcVUNZ5lBmxq1cB4WzBk8
 jfbNYISeK/rogLhu0kmWOmw9QBUo/lJd+Zk1Z+Pq4gtjZaCqFFtdV8w2nHtv+oZlBzfN
 e46IDJIyzFsIeTAJJDFAuKfIE5EdNOA6+ouoJkQhln/OvVTicvSjZdw2aOPBwtqtD+fN
 YPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787657; x=1738392457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DhCfYf7LWbGsDKgpZFGMa7Otj3zRUhvG+D/wYe+cSJI=;
 b=mgMz6jekgZ9+wMDXPn61WLvSv6lduoOr6528Nhoyr84bgAtmNOENNxvEkT61l1R3NM
 nVgwnMBLIydfWEjFqNcc1DLTTpH2fdwof4QB8u2y0ufml4efhEmz4TMZE5EvGrjP2Hjd
 uJgUDs61inD6oozDQBZn8eERbEcv6sj8m/5U6E2pLCyw/OkAEXvIG1OdJAmdcwcqCrS7
 E1mZT7UuuKQc5DNMxDHFaEs4hjf//QLtgmhqoLJKpi4AJO5FcG6Es7BCHpb0q590/0k0
 ta+9lr2IyeqORJJKe3uCIys7aLv2GY8dKE8YOXOSp622PEtrbouqM+eXcK8DLXQrc8wc
 t7nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNE3M0qej1lSmDZlucjE29MIfgm7cifZWxkln5M48heaMAds0Mc0+sY000y2wRFFfUEia1fzn5hOu6@lists.freedesktop.org,
 AJvYcCWKKeyxrg5MCq9yUIhvfr6KP0YUCuSXkupwG5nxKNGW1DaHbyV/+F2xnKogWb1c2vMPaKB60HPw@lists.freedesktop.org,
 AJvYcCXbbPoAiiGY5HoFRVYxF1FWb+8D/bgEG7xIkn5L6E5y8rmy80fOTuCcFSCbIwOpM9HsJ6T7jGmrykYA@lists.freedesktop.org,
 AJvYcCXtHQIJ5KVrdlc8lkGEwnrrZgvGYm5n28ra7HcDMVGk3KHD2OS9pHAB2l9TPsmRpdvtPMw0MTzUD6QjBwrX7A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOTInv4PpUaoisY3yy0cf/6Aq7tXPsvn0oLTNKUpgEyxVtFaq6
 P1Kx2Rohj3NKYbHjbBe4A+s1tId218U7ofeIh3vSjjBHNTjJBEI/Z+44xQ==
X-Gm-Gg: ASbGncuKUJslrVxJbXCKB9fFPgdU2QTS45MhpJ3HBdco5BnHqmqYBoceqWuUcQ7Fx2e
 HdXEzy2wP20QTqIqWLLA4OiP64zQOChGK9ryoIQCZ80Y801j5Mui214MUW9Q1oV3qsWWB/oE8ri
 Q4019a2uLQ+USWlbFeGj9sEFguu0SK0UXyXumyaED9o3ScD5fqpjT0f8tyBJWD1h1D0oDebs2h9
 qGjWN9n4mNNZtEVcJAyHsAsC7CwK+sa3iRTr/CQFGftv0cJj+RKw2QmKdsSQJTsAxe8bFp0Wevi
 o69uyDRiQVqmFq0SwOUn1c+y5uMo/vzood/m8A==
X-Google-Smtp-Source: AGHT+IEOsWBfW6JMMeblHf07aDl8IvLJQ8Aif02FrLV5eXAYXXOlj7T/wgGUMmZxrrBFRXc4sTl7Ng==
X-Received: by 2002:a5e:c302:0:b0:841:99cb:776f with SMTP id
 ca18e2360f4ac-8521e350512mr486421539f.6.1737787657015; 
 Fri, 24 Jan 2025 22:47:37 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:36 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 56/63] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Fri, 24 Jan 2025 23:46:10 -0700
Message-ID: <20250125064619.8305-57-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index b19a062592b0..20ad48f3efd0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -279,6 +279,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.48.1

