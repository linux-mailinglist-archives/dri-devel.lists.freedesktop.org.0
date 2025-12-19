Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C6CCE28B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0D910EC40;
	Fri, 19 Dec 2025 01:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cf3GS4WB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5A10EC38
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:40:25 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-78c4aa7af99so13708897b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766108425; x=1766713225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzPw2N/ioM2S0JlkpKSATVvxATE7Ky1v1N7KaRK6I20=;
 b=cf3GS4WBisDBxnH2lfKayhZ9qBQUlsvICYrmYIvfCQ7SbqkLIwlB3MLlPg3TV6cPrb
 yEXL+UqqikEe32uZ0oxouvQ+onD8QdLC1565Hk6brbiaonY4DkgzOV7/0+SWMIGnEZgU
 nRTbY0PERvwpI4rRWskn8NfaAhBFez75DfzDda/NUjIQl+UjgBoOWTYng09g5BC13DBT
 6JQdCsSpeAZC1QYx1Luc0KC/GoWe2/lryVADZAlUoF1AH7ILlkEzUfHF5jQSD6VHBXtF
 fm1Xj3sqcycXpOV5RReYiczdesDDZtpv5kzB3vFa1kXV8MVxsWpKIK3u7VWfJt0C0fBM
 ZUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766108425; x=1766713225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hzPw2N/ioM2S0JlkpKSATVvxATE7Ky1v1N7KaRK6I20=;
 b=k00ZgwekT2Kpv9weiSNnuv+W6Aw+Icw3oxNfgzZ88pKaRI9lPNsL2leYzqD2neW5jt
 2ZFLx7C1JLfgqIC0fJ4rKYkuLxrh11DUsNWGB3rzTnswXx8K35xoasgfEMRXgj1oYAKu
 CGs/2JUm9q1gqX/aOW0gc3BLn5RiviYRvKgk2WNnuBgWN00tMK1xPat1TFvJjuyGMtJg
 ewtRdrAOHTd6gJFJI4juvHAWXFVvOD7M/HYrUF76pU6TPwCr2w8bTPCiFM5LaYn6oIao
 gJ3fj0qCHMjvAXyUCZztqQj5c7TSr/sRsRo5JINXwO38x352nMICSqJPLBzNJr9oFzZo
 p8AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC60LWxAuizeX8n8U2qpSc4hgJdKp4aMmVcfdIP+s9bM/WVdbwxPQPhcpnFM1S9kToBtOghcx89Nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygL5ETeA4pTwr+nikQXoD8h4BoSHgWigJ21ezuqmPOEWx2zZLQ
 Bdt9rn4uHMcw26xS4VZMNC/883twJWGpOh96Uyy33TF+9bwAyIJxldfi
X-Gm-Gg: AY/fxX64xKMayS5l4oPS468h+EFBZZSQ1a8+ZrYXeA1x21mBlp8UVheW8MuSGBdGN5v
 kUB/jafr0+hsB6Xf53tSMV4M+p0OZQ3swiZL5zh3jq4spvy2K4FiUU96/MEPFPi6ENQGY0V3gNx
 HhRASJwKHjXGkl8IJiaX070MTtN/bPbjj7mQXXS60IP8S8wa/ttaJA12AHe2U67G9WxL7Ii9jUz
 9v9QPJXGNiRvIEn0k8bh7THR9JYlkqoOm9Kw+lrRPZsaFVSXe7/4b1Zl209KZMtr4L8SkMFSFFg
 EdXEcG9ORK6/08yHsk+fSc8c9b9F+jZs7/e6AXK/h/mbDqbjMamuBilgnZt5W8G5vqy5ONQgaw/
 2iViv9Ebmfv6o4YAHAp+atPPZGJwwbCHjGbfxDmK1ofCkFQLjYuLEHa9l+eo436pggjtv1/XIKG
 HoJpIteiCIDx0=
X-Google-Smtp-Source: AGHT+IFlzEyRZbzDwokD8f3jVoeX8J+z1/v2Ahkwq9baLdKstEVjn+R/Ae3XQyq/3bI8aWngyy6zUg==
X-Received: by 2002:a05:690c:6e88:b0:786:581d:d517 with SMTP id
 00721157ae682-78fb418761amr10808607b3.49.1766108424964; 
 Thu, 18 Dec 2025 17:40:24 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb452c471sm4223507b3.45.2025.12.18.17.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 407C14001B60; Fri, 19 Dec 2025 08:40:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Media <linux-media@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Max Kellermann <max.kellermann@ionos.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mao Zhu <zhumao001@208suo.com>, Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH mm-hotfixes 3/4] mm: vmalloc: Fix up vrealloc_node_align()
 kernel-doc macro name
Date: Fri, 19 Dec 2025 08:40:06 +0700
Message-ID: <20251219014006.16328-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=JzTmiFxxFP9ywosc1/PrB927sw9juQIkycc1i5dnVic=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxfL7flauWn9i8K7y1seKHYf4ElsWpntmn/F9BrHv
 cQt816Ld5SyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAifK2MDMtfy/t1mpS0fxQR
 Vz2l/DJPToqR86pIu8aK58c8u5SkOBgZbmtlrrPwncQzddJ0tvgj37ke9Pd/PJjntXapaWfqfVl
 rVgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Sphinx reports kernel-doc warning:

WARNING: ./mm/vmalloc.c:4284 expecting prototype for vrealloc_node_align_noprof(). Prototype was for vrealloc_node_align() instead

Fix the macro name in vrealloc_node_align_noprof() kernel-doc comment.

Fixes: 4c5d3365882dbb ("mm/vmalloc: allow to set node and align in vrealloc")
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 41dd01e8430c54..628f96e83b1187 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4248,7 +4248,7 @@ void *vzalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vzalloc_node_noprof);
 
 /**
- * vrealloc_node_align_noprof - reallocate virtually contiguous memory; contents
+ * vrealloc_node_align - reallocate virtually contiguous memory; contents
  * remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
-- 
An old man doll... just what I always wanted! - Clara

