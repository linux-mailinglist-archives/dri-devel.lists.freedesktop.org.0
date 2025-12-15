Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62DFCBD87B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396D710E447;
	Mon, 15 Dec 2025 11:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TRSr8CTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4737210E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:39:14 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7b7828bf7bcso3579495b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798754; x=1766403554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYIA++CxPIcYPKgHl3oGianXtJJpe/hDcX33067gP64=;
 b=TRSr8CTbzmMaAS7OqK3ZMz+7svguwHXYpz4B3tZM5HloG9Z8/vqUFPmjEneGTzoXHA
 pDjM4Tt9B1qehs8BSCAuoIE5ex7OgPNaUIrMk0h76d28AoOLyR1nhR8klG663VxomPu/
 +kpu0HGNWM5QIDueZpmC2+1eNxMXqcYwvYMlGTp1wO7Vtu6Y9wlcXC5Crb1u2MLjvLy3
 R28CSrLhAmqdfF5Ew43E/t2gkivQAGPQebwMVUlenSUmRVdm/ggvyEy8fnzzjuj3KJgc
 5/R6KRQCIfqtmM1A2yia2CIL4B3W++/zP9kE2NFnOohmUuuVpVx8ltO9Uf3InAI36+Mf
 8LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798754; x=1766403554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yYIA++CxPIcYPKgHl3oGianXtJJpe/hDcX33067gP64=;
 b=qnxTgt7pCo2fmM2tzrAZ6z4eq/BuKCm8fB57+TepoBhGzcIQn21x5qjD9IIGXfNlo6
 mhDW2lLoPWnbFSYcyX+l9hIoa/G7wpyTfABolhyMb5wnPX6pXDrmjgziEARicWYcGhzi
 TDYMsrHfaDAtGTfGWtUtRjzaxBrpBF+OW7JYfhQL4DpvVRZBwkBVcmoWOvhLIwMoYXUY
 xGqKRZqIkP6953BxqhTjo6wk41q3dTdOpCzQs7meUz05s22Vk6y301nPiVhFaHQhqUpu
 JY+gdbcM3poFDvTktg2iFnfvrM1MOqPOiaLvow3mFPMXkWWMEnZpGqx/2FOqKmalQ5K6
 4HeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUD6iECX0suTn3nUA/xQB4ktVxPe6bJ7Nt9+/Wm2G3cNhpqdKu4bjecARc+z01I3a1jB0v1ESKumQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3F3acjvbz0Fz3DJcZWee2+XgGEu+RhnljesoXiREnvFrdCWgY
 SQObXGa+gj2Haw9AGYhvJwsJziopKUf6JvVI9PFNm4NShEcZY9AJrQv+
X-Gm-Gg: AY/fxX56pxe1e09aHd+r2dG6eQbU+IKvJQ9WykEb0k1o9isgRYBG04atqfdXhz1xsen
 AF1q+APoH7/BlpiPIGBl1VXSsuRB6RTG5ROLIUQBpDppD7mtFxI+dhf3PocuPrkeXFnZ+B0k6ed
 F28tg2hEWfl61Cp4kdUXHCtLhq92+FTQ+F3GCxl7aLmZQLc9VcwCDCJxBvVhWZB8EK/3pYdbFBo
 ZOWL8rq3BG+16CNjStN9Py8NM/UD/4BtMDpMV5nL+vtXdKY7Rt7/dA5z97ntqo6IrwUmTZwkRQs
 TfKuMGzxXQvsCLsleZ3aV3SoKr+gCtOuXQHgBmgEPf/u9y/QPaKuWIAwv0oEfob1hELLk7SJza3
 kayypkKHeJ36MdTZEIfFkIW1hEHNPmIS23IegmlbwTzr0mGfuI193xozWBii28YpQeoe3sdjAkq
 UrTTFFu6CxrCY=
X-Google-Smtp-Source: AGHT+IHZqxApH7RH4SvWeJJw7f7kzbBWfG87+pyKENlTOJ0etjJH+97jX9IVf9ZouLQDPcaXmCZT+w==
X-Received: by 2002:a05:6a20:3d8b:b0:35e:11ff:45b4 with SMTP id
 adf61e73a8af0-369adfb3407mr9418258637.21.1765798753761; 
 Mon, 15 Dec 2025 03:39:13 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c26eb0f6bsm12221315a12.14.2025.12.15.03.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:39:12 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 70D25444B393; Mon, 15 Dec 2025 18:39:05 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org,
 kasan-dev@googlegroups.com,
 Linux Virtualization <virtualization@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, George Shen <george.shen@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, David Hildenbrand <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mateusz Guzik <mjguzik@gmail.com>, NeilBrown <neil@brown.name>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>,
 Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 04/14] mm: vmalloc: Fix up vrealloc_node_align() kernel-doc
 macro name
Date: Mon, 15 Dec 2025 18:38:52 +0700
Message-ID: <20251215113903.46555-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=bagasdotme@gmail.com;
 h=from:subject; bh=sT1prVB7LRNvf/W4XodTbc9bjm2B3700BxVWkrXUues=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4OyyibMaS/TcJdL00op76xZei7L2Pv7hFORU9uuV
 vT80n3YUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgInIP2BkeHzeo3teoLm8pE9N
 cXOPl0J5QO7s9Yesjvev3nrjTaKBPiND/5K7Lkx+c2t1WS5sWq6V/2tGhSPf8dA5nnLdX2fcuhb
 OBwA=
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
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ecbac900c35f9c..2c3db9fefeb7ab 100644
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

