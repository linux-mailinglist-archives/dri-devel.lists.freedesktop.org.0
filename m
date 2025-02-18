Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26294A3AC7A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2182B10E16D;
	Tue, 18 Feb 2025 23:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="REpdhcUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4249D10E157
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921334; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iUWcBqs6mNafZVIXiqFTo6A/liAIFzzS5QKQ23NUxyUOVaSXn7SrwzkRnqHEpyIJBXtggUuIulHAFjQJplNsThft+joniuucfxY3vREFKxzysDX50XZl0ubfk9EhL43adtkNM0UqnvCuLvbT0lgH0NHvWDJc5ZQLlVAgrT979oY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921334;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MT/z3CoYWH1GTvPLpRnh3YEX8M4rKQcUJDbxLPJnRwA=; 
 b=ida1JEdG3LBnNTURDnmmKjsB3Ei6L4/JI2/7DKXtravnSibGn1ohC/e+xHWSseigRjgEp1y4mL0lwO/8FIUjtuy2izbAOpxronf6OwrqFxie7D4sE0GGPE3LL0/Um8tj9D6g7XEihOa+YA2AmAg9hjvFgS+wojZXnjUTm1EOPsY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921334; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MT/z3CoYWH1GTvPLpRnh3YEX8M4rKQcUJDbxLPJnRwA=;
 b=REpdhcUjQJ6Xzte09GzdHaNMDd7WA50NPKA2bydQT4gU/B3lQ7RgiflO8S0O2Uu/
 RYOnuEh2E9TBz1B94m2G60jSf5dOXGErfkW0o7t8n/zV9XUaxAfhd5lyyPAQGlNLxzr
 b4vIV1rFwqcSzxX+W55Ni1p+nhMMW6RlzGue+Obw=
Received: by mx.zohomail.com with SMTPS id 1739921331681134.0055665173901;
 Tue, 18 Feb 2025 15:28:51 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Hugh Dickins <hughd@google.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-mm@kvack.org
Subject: [RFC PATCH 1/7] shmem: Introduce non-blocking allocation of shmem
 pages
Date: Tue, 18 Feb 2025 23:25:31 +0000
Message-ID: <20250218232552.3450939-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the future goal of preventing deadlocks with the shrinker when reclaiming
GEM-allocated memory, a variant of shmem_read_mapping_page_gfp() that does not
sleep when enough memory isn't available, therefore potentially triggering the
shrinker on same driver, is introduced.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/linux/shmem_fs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 0b273a7b9f01..5735728aeda2 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -167,6 +167,13 @@ static inline struct page *shmem_read_mapping_page(
 					mapping_gfp_mask(mapping));
 }
 
+static inline struct page *shmem_read_mapping_page_nonblocking(
+				struct address_space *mapping, pgoff_t index)
+{
+	return shmem_read_mapping_page_gfp(mapping, index,
+					mapping_gfp_mask(mapping) | GFP_NOWAIT);
+}
+
 static inline bool shmem_file(struct file *file)
 {
 	if (!IS_ENABLED(CONFIG_SHMEM))
-- 
2.47.1

