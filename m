Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD02CCE273
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86EA10EC3A;
	Fri, 19 Dec 2025 01:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbzrikNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3379E10EC3A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:40:24 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7881b67da53so10846557b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766108423; x=1766713223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWU/939i2tSCrFcjT+226pu70w6qgHLxJ5V3Gj7ooMY=;
 b=bbzrikNR1zpKbNhjhpsckzIGSJ1OSymWu+w5IpvV7WnUQjIZOtpETvagp2Lihc8Wst
 gwHBe6QJbTsmEjGJsdaJ+6qTcdGNYPe0lUylqZtAwRV5gCjbpTg9ahnAC2EYpVTrmtjT
 mXVdWw+tdnYfSqManS+c6di5/D8brLBeZ5AHAnXn1HdJT51tCQ+NBwb23E0xCXxdF+FR
 4quqfh2WOr5wGhaAftHsviKzlaabI6/AzaxioqCqxBN2oKv0a8dYj+W4LevMXiqwP5a/
 PBTn3hmn/7TTjJzSIPWgGs1f3mX+z0g753pRzu5GWKSJS0r4m5LrRZ1dbwzR/CqdSn7c
 en6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766108423; x=1766713223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zWU/939i2tSCrFcjT+226pu70w6qgHLxJ5V3Gj7ooMY=;
 b=OlG59cz9qtJSdWqSE79pzJFiQaZATHMA8FyJAWfTb9zhhdCyGG2fGOLAaQKTt5+dGa
 m//Zw2htSA0x+bmDw4ED7slxZF2yV1lvculotXmpv53a0WeNdSCeiW3diSBzrDXNOWnJ
 ZcxY/c8BhuVl6+Di+e6FM7llrkn0C+w/fAGKk7jSMqWe0GzFfLFOPMli+j3gr8qAcS0Q
 isS2WJ5kBJU+28sU8OkhtOclpG79YzQjnsI0jZUJgozb6/c7JxFCjrf9RhxeVsft3O1E
 IOjcexQfO81vP4y5zz4m+OCzWIOmIPAnBJJNW7XRS8TzJw8MBiidj8FZOXzSZTFZoMPN
 yo0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUef7U08btwXsbC5U6kQ6HHlU0dL3m8rOdhz/6pVilPS1ryAB/aNp3v4xYmKXQw7IGjvWBueDqCbPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx29x0GXKlozn+/6nN5Nz/pJlubmPBupiCQ2RX7Fg08YskjP2JS
 8QGhBBMUeH++uO5Tz2fQB/v8W2un0wfl58f7UvxrAdGmpFGPRdfU32aU
X-Gm-Gg: AY/fxX4zSwzsSkrdpBkKSdVAJS8Z/WWXyzLkx9HFctrMlixLntLwTn44lbxEaBCN2xw
 qORZFaFnq1pT+maNXNd9/DbELciFoPRxDkBMQ4zw66g61OwSq62BN2jU7ZLZl2dEf/bW4pOzuha
 GiqbcKnnlzzyt0PIXNXZM9hO71wviuPf1r1JeN/1+PoM7jmgRPNLRHSJiYenvWQQaju107Nz7yT
 0dVXPEp3JHtQJRthca0GzlRSUJZYEZlAp9jgG4FNszJi6IRnCspJtT1LnJdrOOtZUc6b4OdGbHe
 VG/8AIbLNWaAa6lOoa8764dYmPstQuFKogCp8qGuZvL8jMy3hHqP7DI9d4e5iyKkoxbSmmo6W1h
 XgDto18OeVN3oHs8zo3PiExVp00pc3CBjjKgGIrXzm1xl9iqSv5D0TXp4M6dEet8/KIK/5923D0
 ++Y9KeRhpLkTQ=
X-Google-Smtp-Source: AGHT+IGs2tukAAuVEYuoyvWSAIB55Pm8uLOrTuzGSfqj+LUZLTOqGV1IGLSl8HlgwDUbktyFC3gpDw==
X-Received: by 2002:a05:690e:2508:b0:644:60d9:7509 with SMTP id
 956f58d0204a3-6466a91f1abmr672663d50.89.1766108423013; 
 Thu, 18 Dec 2025 17:40:23 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a9219ecsm521431d50.13.2025.12.18.17.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id F36A8400AC5A; Fri, 19 Dec 2025 08:40:18 +0700 (WIB)
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
Subject: [PATCH mm-hotfixes 1/4] mm: Describe @flags parameter in
 memalloc_flags_save()
Date: Fri, 19 Dec 2025 08:40:04 +0700
Message-ID: <20251219014006.16328-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=eU57T2ZpTrhAT3InMTPZqCoWbG3clhbzONj6eMsT294=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxfNrogMCI4/WrDUaoO+3RymE3bV6Q+sNzRe2pcud
 Lf809ZTHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiInxTDf4cMXcuuCb+M7mxc
 JlueWqmSuHnp9SdZCbMLqzXbzJpYIhkZLuu3a+wR9BT+vXnhUY+bUZ9Zb5hPXcn0objE7/XDOj0
 HJgA=
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

WARNING: ./include/linux/sched/mm.h:332 function parameter 'flags' not described in 'memalloc_flags_save'

Describe @flags to fix it.

Fixes: 3f6d5e6a468d02 ("mm: introduce memalloc_flags_{save,restore}")
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/sched/mm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 0e1d73955fa511..95d0040df58413 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -325,6 +325,7 @@ static inline void might_alloc(gfp_t gfp_mask)
 
 /**
  * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
+ * @flags: Flags to add.
  *
  * This allows PF_* flags to be conveniently added, irrespective of current
  * value, and then the old version restored with memalloc_flags_restore().
-- 
An old man doll... just what I always wanted! - Clara

