Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077019B960B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 17:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3EE10E9E9;
	Fri,  1 Nov 2024 16:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Hd0ON5do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA8B10E9E9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SzEBSUiqX9q6QOwH+3lfpF0a+846J9p9dlVHwog/yj4=; b=Hd0ON5dofM+K8sGFGpSRovkF3c
 FpYVxRSX8UhzNY0CqbcP+N9S74zKJ2vyl75TGIaexlVAudkVi32l77OhZLN+3H5A/5IUAo/xZUQW4
 eXV4ypO5+apa0WBZJSGTeR8MJN+X45kCACF633xB4uJnmGCOZlafw+2wSn3yXxiyqQ/YnxAYuJsux
 E3h6yC+Xk2StrDO5W3tT3vmk/4sljHnMEGgIPSpzX/9ZYK4SnhaoOK5gwoB8PCoW2BABBcwS/8A8I
 Tef0giUQ9VqWFBKuSrsrAwtxOR2nCn/rmP/gGptZUZ2/Sf1EwRRpIuTwJChaa3wyMEIEcDN8ypOV0
 CTQDricw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t6uyX-000VPu-N0; Fri, 01 Nov 2024 17:58:18 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 5/5] mm: huge_memory: Use strscpy() instead of strcpy()
Date: Fri,  1 Nov 2024 13:54:09 -0300
Message-ID: <20241101165719.1074234-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101165719.1074234-2-mcanal@igalia.com>
References: <20241101165719.1074234-2-mcanal@igalia.com>
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

Replace strcpy() with strscpy() in mm/huge_memory.c

strcpy() has been deprecated because it is generally unsafe, so help to
eliminate it from the kernel source.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Lance Yang <ioworker0@gmail.com>
---
 mm/huge_memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a6edbd8c4f49..1ebe18ec4560 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -969,7 +969,7 @@ static int __init setup_thp_anon(char *str)
 
 	if (!str || strlen(str) + 1 > PAGE_SIZE)
 		goto err;
-	strcpy(str_dup, str);
+	strscpy(str_dup, str);
 
 	always = huge_anon_orders_always;
 	madvise = huge_anon_orders_madvise;
@@ -4167,7 +4167,7 @@ static ssize_t split_huge_pages_write(struct file *file, const char __user *buf,
 
 		tok = strsep(&buf, ",");
 		if (tok) {
-			strcpy(file_path, tok);
+			strscpy(file_path, tok);
 		} else {
 			ret = -EINVAL;
 			goto out;
-- 
2.46.2

