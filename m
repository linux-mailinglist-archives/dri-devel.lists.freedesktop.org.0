Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C3CBD893
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4065110E44B;
	Mon, 15 Dec 2025 11:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ic2VjzIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8404310E449
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:39:19 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7b9c17dd591so2678772b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798759; x=1766403559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhdWc9MI61x0CV5VCAtcSDjXy8TDKlNky9k0yGxBSF0=;
 b=ic2VjzIW/FTBXOIH1lJT6tIDxcEEQDRXGaxWso2juF/FjidQ/ILhx421ptxAiMQgUR
 e84bY12Bj+yNZ7P1muIkMXfx1ZbaxXfFTVaVF4bFrLCzCAAGPIUnHzDuYzY+I3W0eu3v
 alvlHuRso0r5UlOcvh2NaSz0aak7Mv09LsME+7927yuQxWhV5XSCYkBGc8KlRtzx4PbX
 wjoUni74uH7+gAhjb13XzhntMNxiG+FJ0MoAuEACUNHmuUmJzYUQFpfPfRlu51tpBxOo
 4vq4B4AL5ElUUsP7UIlysBKRDcFXaT2BHLeOpdwmN+7lEUc+FTzD0yFPBjacd+5pKCU3
 Qhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798759; x=1766403559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XhdWc9MI61x0CV5VCAtcSDjXy8TDKlNky9k0yGxBSF0=;
 b=W6Acge7MlS/NkMpImQXW5oLlbQh/CR8NYoCNffckIqqDB2wDeS6CM/s1oLcHbz63YP
 yieXoxN4mnLSRr1SB8x0vbQ2ZNv63fZ/Dy1E17X/F3gLRQyCsLaIcscXQxA3Ryip7RHw
 RuMNzDwNTyfMUHyvBA9B+k0BiYzdBAuwpMyRDv0C76rID0faPj6WL9HPDyLbOXEl57Vj
 Bf/MbrkHy0I7jbXweo/YKwWKtc40TKaKCJNz3dvAQqecDT4t1lVL8x8qT9Oc7YXWHqEY
 mtO2zTE29iqCUkzDZHc07V5w3ujQ6q8ThD0iK+4mS0r9M8rOaf90/Fa/FIl8+06dQdtx
 KUlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzlVyLWF01Wx6KsiRMSuLv7GaIFn+2y6SbWbD85oiu9JmxniK7Mhtm6UotPkxRs+7//XsUYmaWSK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywukloieh2FfmttI6V8SGtfHZDLvbWnje9TbLLwZqQ7s8zK1b4e
 Qq6DBU8iRNh+8R1qrCQTPDMNiO7iNysDbboBLvK031GaIIv1lJ/ahC+s
X-Gm-Gg: AY/fxX41wpcQhXp9DhiHeteJ8C9EwJycXDxqCWYCNntCKZSEysFVPEhMzuUQ8K+eAm5
 j99qx9TckNkXop2OiUfRxb86nqU0SygK8GvUHC2rx0xqpG5Iu53mGGBvv+A3isC3lNVUk7M8MlJ
 bb5y5sj2cRoMqNcqfsW59D7Yvb76fjNOxWlazqd9bPQEPk+GQWlJWv5M7RT9cXe3MfySkMOOaYu
 jax+/jyOgOAXDYeeDl0Wan9ClbXxNXTsudFd6MRjVoYB86DQrPKltoH7xTTs+O+2C1gGYE+J1At
 cOxGYHbN1I+sLc0IJSeRhArWcmcss24715tYllKq0nt4QnZBTJjMkUuXCm9vIhR3gjeBKfT/RBi
 gCsv8W0w+qYd3rE8bQCJXNNO3SEd9lXdhPvWKR748ek/p0UXW9Wnn5YD/Rf3lzdOH3w3CaEWQ4q
 Dw6mv55RAFq1E=
X-Google-Smtp-Source: AGHT+IEml9qI+VrrnmRfetIj/W3ZZs/y3fpGJeeY3YNSfL1Lp+Ud1G2wHo5sReKCb7zM9fF8T1soPQ==
X-Received: by 2002:a05:6a00:4211:b0:7e8:4587:e8c8 with SMTP id
 d2e1a72fcca58-7f669c8ea65mr9926386b3a.59.1765798758916; 
 Mon, 15 Dec 2025 03:39:18 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7f4c566c7cfsm12487742b3a.67.2025.12.15.03.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:39:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id BCD48444B396; Mon, 15 Dec 2025 18:39:06 +0700 (WIB)
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
Subject: [PATCH 07/14] fs: Describe @isnew parameter in ilookup5_nowait()
Date: Mon, 15 Dec 2025 18:38:55 +0700
Message-ID: <20251215113903.46555-8-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=bagasdotme@gmail.com;
 h=from:subject; bh=ZF9oIk+6VfTU18bKiromuOjnT5V3QoMoKRjEOTmh6aM=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4NPZboGqi8J0lGIEPx09J91+O5zYvcmVc9uCnNeq
 KyqY9/YUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIloczEyXFE5FS25V7U4nF3s
 wsyajN23tv7S0jlgc8jW4LrtPJ7fvYwMd203HZvEp7U3/4W850Q53mn2BsnZf49w2jwWklnFefM
 GBwA=
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

WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'

Describe the parameter.

Fixes: a27628f4363435 ("fs: rework I_NEW handling to operate without fences")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 fs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/inode.c b/fs/inode.c
index 521383223d8a45..2f4beda7bb8841 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1593,6 +1593,7 @@ EXPORT_SYMBOL(igrab);
  * @hashval:	hash value (usually inode number) to search for
  * @test:	callback used for comparisons between inodes
  * @data:	opaque data pointer to pass to @test
+ * @isnew:	whether the inode is new or not
  *
  * Search for the inode specified by @hashval and @data in the inode cache.
  * If the inode is in the cache, the inode is returned with an incremented
-- 
An old man doll... just what I always wanted! - Clara

