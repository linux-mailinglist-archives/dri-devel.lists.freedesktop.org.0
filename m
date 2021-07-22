Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C13D2C66
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1344E6E98B;
	Thu, 22 Jul 2021 19:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D536E98B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:07:58 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 a4-20020a25f5040000b029054df41d5cceso8514476ybe.18
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Y+4Q1LkGSotu1XfmzHQ6ryO/eeqhw4mJ1FyIbndgjZg=;
 b=TqWxnT/Z73qrMHnDvvmdUmHFCBG2MowDGm9qbSkEGL5dCyrUWFCjRlmaCwPnwOV+vE
 felNomI4J14yW6cG4cK8/fe5EmLr6cUafKEfxaLZtrN+y4CuWRbV/1MgW8Oe6G1oUXYe
 U5/snPPITJfuRauEaIlN2IvmysFsXc4W/reebG3h71BcT4s14CNHFwziy8vhd3JaNZVt
 vSNZwIv97aznzS4Lk6SBEfxWNAH0IGp4XobMfkNcfnErx0N0/srvH32mvyN9DTsAGx3Z
 FmvNLWsFRkpdPxysCstLgzcENMdmM//CzmYiJbMaBjzRUoMw5jvq0sqmc91ET7vecjor
 H7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Y+4Q1LkGSotu1XfmzHQ6ryO/eeqhw4mJ1FyIbndgjZg=;
 b=pr9k9D80MM4L18m0SlUSx95dLmfQpZJsxBNfqyR8AfGWtMeTnUw3tOmW1N3KhYQbPE
 Ae7wvgfuTryKEDfilduYoDx63KWgOd1l3KOVV1+t2TyF5mrNS9oiBB1V+QGuHWmNpGVC
 f+IN3H6xkCH3vKYn5fmoRxHl5WMbIh1KALcQfPDx6UtWmpf/3Euy7kcjHPiodM5bbMbH
 npNCo7mjpOSS0eiPL2Uo7PF6S8kF4u4Drt+Vq0jcLWypBWEys5qgNzdWgcVpwKGbO1R0
 cIo9emH3A40E4ELFAw9xEvda+HtNLClkLbaAd2md1OKIjQYOIo4yABJxzJQrkO8EBTU7
 Jl1g==
X-Gm-Message-State: AOAM5309dc5VdAuWNLW0gx81u9dp7lTZ0ESsTk1QcA81nkSu2GRWSzWE
 VktQXT/n+BOPC02udORmPm5uX3XYsa4=
X-Google-Smtp-Source: ABdhPJyN1TtBAly+n7sAFHUMK7tG6nh3fqZuhlgbAzUczufLDXVA9cjmsxqDsLqVj7oNjCMvjWh3qW/7kdU=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:233e:4a37:d5d6:55d7])
 (user=hridya job=sendgmr) by 2002:a25:2589:: with SMTP id
 l131mr1337963ybl.451.1626980877695; 
 Thu, 22 Jul 2021 12:07:57 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:07:46 -0700
Message-Id: <20210722190747.1986614-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH] dma-buf: heaps: Set allocation limit for system heap
From: Hridya Valsaraju <hridya@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <john.stultz@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Hridya Valsaraju <hridya@google.com>, gregkh@linuxfoundation.org,
 kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch limits the size of total memory that can be requested in a
single allocation from the system heap. This would prevent a
buggy/malicious client from depleting system memory by requesting for an
extremely large allocation which might destabilize the system.

The limit is set to half the size of the device's total RAM which is the
same as what was set by the deprecated ION system heap.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index b7fbce66bcc0..099f5a8304b4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -371,6 +371,12 @@ static struct dma_buf *system_heap_do_allocate(struct dma_heap *heap,
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
+	if (len / PAGE_SIZE > totalram_pages() / 2) {
+		pr_err("pid %d requested too large an allocation(size %lu) from system heap\n",
+		       current->pid, len);
+		return ERR_PTR(ret);
+	}
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
-- 
2.32.0.432.gabb21c7263-goog

