Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AACBD87F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62D210E446;
	Mon, 15 Dec 2025 11:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVkUQoLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFC210E443
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:39:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7f216280242so956408b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798751; x=1766403551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6vVzDCLpyU2LgSSSdcXlxGJ4GVOIz+XeeVoTvfPkdk=;
 b=XVkUQoLAtHXRSc/GJeyMb6CAgOfXAky+uyjSyg00nCUZUlnmyeOm+HMUfbNsVr80IM
 AULGpLbYqhTrsYamiZkISyE7ucukXJXYT3iY/tRtpbAZkN/6O6utIeMUgxzsYjUN/Rn7
 BbOTavMvm4a4KYwrwB2zji+lvp7iXj25ES8tynt0wRec3fQ/BGV0JoJMrbUWJ2mv0wSI
 qjY4/EQxzvjsAMlgG+jKYDO7MPE5REA07y5fkmpLilZDu+sloLqgHXn7RVZ99RTDF8yJ
 Xw1MUmar10wvHUT9Fk0C6MRRppADiXziziioJwH65ZovI6KKQHeUyWa+Fp1zrWGBF+Fy
 zhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798751; x=1766403551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H6vVzDCLpyU2LgSSSdcXlxGJ4GVOIz+XeeVoTvfPkdk=;
 b=VTCMR5GQbYc3npq6LFkkUjR02yYo41MPp1ClWkSa6YmfpbJPQF8PYS7TITESvBOCbr
 hPUGY6JKF4CYiTjUqaXVvXdzDefO4fb7tQnYu2VNYTD7t2ZxNdsobUeDSlKHpJNA9ba8
 lGAdeVkTKW+0UaKpIVSfsz4W8kJaz1eUySCZxqgy6z93ZjpxhPVjSAf5C0MGB8FTuQ63
 BcwOzVzH5YATLQKstE4OspdHoSAFKeiDMhjx02MJVnZC7/P31aQEJtTogKRKD6+b4OoN
 dvd/88tPlki9YvSvmTDhApNi21XSjLK0odTWIdoHjO6ou6oz8vYZ3mAqPifeRdfrBCUB
 3mbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTZx5wujKbosmbd5phZXugi4CkyNOIX4ANqMK9UUubQbekuKCaehHByooxc2SJe+veOb0Jmg6Ch2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqtKVOZEF0vVLqne7BAsHRMDYcA5kuK2i4nD8D3JZfv3H/f0zq
 0hBqOFV1lCCDyF5ozo+0B1OJST1AwjLOBpQZCByK7hp4TIR3UBq3DJNs
X-Gm-Gg: AY/fxX5JXNDUOlQurBs7x8+xEIX93dYzt5iMA/jPsyRci92sitgpuAS+4SAdLzpHZk4
 d+MFr9Vhi3YwVW6M6FZjNp9no0av6aR15oWhlP9Kjd37Sv55hhKSrWguaeEgPm4sIw6HJIQCkJ8
 36ORMrNu9bko3pgTrB/F8DlLYLaHNfteUB9tR49cFNsYqWXc85UrAyjzMcsDYzfPKmvethyp12/
 i341k7RzFQdoeH4ZjzWmITHOsWNEKoK5ubw6KNImHqXOLM1hFVQ+VuABni2v3kn7hcIXiVuqWOj
 C4E4Jukc9ck4IeQp6tH9aQlMn/VPCZqS/M7MWYP9JtTJcXxkUxWcFo/b/v5/voDuMxjgSZJviem
 q90X7i8rDuqGurYpB8djjLiWBST9IE0YPyaklLvr058ayaf5F0ackPnSFNDOM2UgwiNVr72V2lO
 aBN7lFUC4LV1k=
X-Google-Smtp-Source: AGHT+IFlU3I+cKXX8C9kVGFzGiJyAz7/LTk2+tkj0Oiyk+q1A92AqVW93jQniiO/3heM3uCR/CKzzA==
X-Received: by 2002:a05:6a20:728e:b0:366:14b0:4b16 with SMTP id
 adf61e73a8af0-369aa740ecamr11005465637.33.1765798751132; 
 Mon, 15 Dec 2025 03:39:11 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9b3850csm133388085ad.17.2025.12.15.03.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:39:10 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 1D26D444B391; Mon, 15 Dec 2025 18:39:05 +0700 (WIB)
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
Subject: [PATCH 02/14] mm: Describe @flags parameter in memalloc_flags_save()
Date: Mon, 15 Dec 2025 18:38:50 +0700
Message-ID: <20251215113903.46555-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=bagasdotme@gmail.com;
 h=from:subject; bh=zaXx2zRxHwtjfsFTgY05kdIMv0UeQBx9b1FFiByYYYk=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4N0b+unPg8UXJx6+/+iP9I7pV1rdBYrPMm9NqGYl
 enCm2OnOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCR246MDN8qzkf5GvF8u6h8
 fK78A+u9Z2vjTS5MNJ2mcnT+/S07J0sxMvTNsLugLdEgeebaKl/Lt7ZFnv2pX8UvGPzINA+RNZw
 /gQsA
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

