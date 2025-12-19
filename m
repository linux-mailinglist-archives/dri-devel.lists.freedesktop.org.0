Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0ACCE276
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1824A10EC38;
	Fri, 19 Dec 2025 01:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HpT+Mb7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com
 [74.125.224.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E2810EC38
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:40:25 +0000 (UTC)
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-64306a32ed2so1114694d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766108424; x=1766713224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXujcQG4d4pSPfLnwY7QQ/B3L24bc/JbXH3UhT7rcLI=;
 b=HpT+Mb7CNGbbLJHt5NR3OByfgxZ2rhwngnhMhI9RWP43FaLlGzISPQVEP0Z0HlCGaa
 hzB/VKDxWEjN0DJgMX3YNTlgxPtl8+3npK75DFrov/2iSX1lVlZ0vsmM7U9TKoRYtXLC
 n4wjLqycuhT+QC5pziPZJPrjDlZYfbta8yJWpdY3hsjK0vemb5cCRbXIbo1YwK2EcDI1
 9LU58JvgyYMZ03C5oOE0lME7Ntkvy4mHMJ1p24eZu/CM7OsApDwEloXs6mON6fVW7Fhw
 UVkn1bxQ962XVXoaHVyh7Dty0IYLRR8LsRa7+72JhrEo5AiztgYByic6+Ot8V8grjgC+
 ZX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766108424; x=1766713224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lXujcQG4d4pSPfLnwY7QQ/B3L24bc/JbXH3UhT7rcLI=;
 b=TWFTybYlNpkCx45CfQIQ5QisXhlxFOfyUsXT2o58Nq03WbWisbMm8djNDls+jtQCkz
 nB5kPi4jaanHbUOBqAhrvyznBMZw1SLeKlx8BhS6/T07LP2FlSyyhSAcZGaVSoB8xfgr
 uA17MRTpCLpbEHHUKkN/94CIA4ggL2V45jtfY1v9cSD21RBBTipZH8Uz/s4EyTw5EXU2
 Vcpz94114eWkFOIrYugJQdGV5toG0gPYo1rfdttSdKRPp04wSjb5F9SwfK9AB1Btnd+s
 +cn7Zdb8eiaUDRbrWzw1d8jiMJBgiLaCHf1vfxQbFSvDPcieR3w8x5hexDvfIHDnX97A
 wBYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyAaQhbp2SX4lYJe+FxAg17kDIrLsrpq9xhrUr7nTzcW+9RecQeQ3rcWGLqSj+nQtOX9En+z4eTgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyytS4tc7KijHJW7KJjaPBeN5e6EFfyOQRNzKyWIikv2RjQDO+o
 eEQm/yydPdLHMLZ8q5CQF17GzgEHnuVZnC4loDTWbxNFxEt+o74JtJxq
X-Gm-Gg: AY/fxX7+CXSa82e/1gEipZfKHDPNZRhflkNTcK3mz6lgToQ0nCqEcRn86chIAwrEXPe
 M0MX201XvNZws7AwIF0zU1qEyMAIdODO81+T1QC47lBqAVyxGcKTkrYp8+kKLvWd1oLbdmr5M68
 vEZ8+1BLDea/QR5wkjsNqFE2rTAJ+RoO4vUwirxZ62T2b6B4hL+CTxCcqLNmUr5UwyDQhLId4T9
 mvssTcBgOggCNlhnD5xpKDkTyEPKIEtfeqiJYe4COwQagmb4ADSxhrp6iqtEK4G2tAalSNzYJXw
 zQM+wexKzvcookq8U+8bRzhyI8pXOxokQEHIBSVmLXS0P5DB9kHON4lNCyUVuHfBtQIHE8IwHNT
 s7dXrTe5W/9rpiEM7gYzHMPvYaEsOodk4RkM40fwCSbAWw54JFPQlCkiBO87xrKepdMJ+kYI1bk
 QBEyutxuf1evE=
X-Google-Smtp-Source: AGHT+IEkhnBkI2xTy6+krjkg4oy487XdWneFBVKVRcd59MnMtD1xOFax36K9/qEz+okpBApxnUzeXg==
X-Received: by 2002:a05:690e:4102:b0:646:5127:9cde with SMTP id
 956f58d0204a3-6466a8345d6mr1205460d50.14.1766108424525; 
 Thu, 18 Dec 2025 17:40:24 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a92d91esm515295d50.18.2025.12.18.17.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 5E2A74001B63; Fri, 19 Dec 2025 08:40:19 +0700 (WIB)
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
 George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH mm-hotfixes 4/4] mm,
 kfence: Describe @slab parameter in __kfence_obj_info()
Date: Fri, 19 Dec 2025 08:40:07 +0700
Message-ID: <20251219014006.16328-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=V7JnR2C4dn0LioMgl7WguO8w6hFl8CYJrTRxC+i2SGY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxc7T7vRwlFjGfXAJPPZEb6MmU3nPfJK+S1u/Pfr2
 nAoY83ujlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzExpSRYbVy1V+uKhNfl31d
 3tY/1yd5qPVxrz/kbjrv6KwU7VU7PzP8la6Z2vvv9mRZvSKz/YeLxOqYTjn7fuPIvP55y5Tuc40
 LOAA=
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

WARNING: ./include/linux/kfence.h:220 function parameter 'slab' not described in '__kfence_obj_info'

Fix it by describing @slab parameter.

Fixes: 2dfe63e61cc31e ("mm, kfence: support kmem_dump_obj() for KFENCE objects")
Acked-by: Marco Elver <elver@google.com>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/kfence.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kfence.h b/include/linux/kfence.h
index 0ad1ddbb8b996a..e5822f6e7f2794 100644
--- a/include/linux/kfence.h
+++ b/include/linux/kfence.h
@@ -211,6 +211,7 @@ struct kmem_obj_info;
  * __kfence_obj_info() - fill kmem_obj_info struct
  * @kpp: kmem_obj_info to be filled
  * @object: the object
+ * @slab: the slab
  *
  * Return:
  * * false - not a KFENCE object
-- 
An old man doll... just what I always wanted! - Clara

