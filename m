Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C36B3DAAA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A4710E391;
	Mon,  1 Sep 2025 07:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HgGUNA9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7AE10EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:55:35 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2490369145fso5611735ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454135; x=1757058935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GkZ2LL+fO6oH27E7YsqUKpWK9h0JvMFOl/W1FWHyGxk=;
 b=HgGUNA9JIPte8s7C3s97DG9tzTyC/xBeSz+JXK5+o4oEWSRRYEsMOtnlzzQvpDYNdw
 4h1FvdwwAmR92XWqKw2RdEPTeoihqOSlDlJdwPKG0v5NBhVV5U6vf5lQ4/z98H3eni9n
 iemcFuo5wKYkEpStTYIIJdCjqKSp4GwzbMrd2eS5QSwJFK+euxqFMmH9RkqzpEmLx0HG
 wwb/GlRFfCW5PRX47gG+2PUZVRqR2kq1shN0m6AUfmfCSJ7ZH+A+wgVJ+5OYNqbzCrm/
 SVB2ZuQmNMIFLROiUIRLOxfQkPd5j+EvgM3nfgk5BNxqRdxXYT7E4Jk743sEXv8uWnv5
 1HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454135; x=1757058935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GkZ2LL+fO6oH27E7YsqUKpWK9h0JvMFOl/W1FWHyGxk=;
 b=q6+xOrUUtKZ6jgFs77fmyyIoKeGLRlb2cnMLjqzWOCHbusoV9ofKx0J75PPGapDHvC
 ztLzjvQBEGf5QCwi3gL8XU363Lf7KGgiFdgE+5O1cR1XgOY/aHqF3sl7yyyLitDwEJS0
 evH8cFynLt8IucVCe+bpDaKPmqBxxD3WBfvZGgHCagnzaUXC1bYaXExV9eKBDRPAwOHd
 IEx6JNjz4aDhRTspz5DG/Ec7lSuBUh6NxlDpCn1AxpuEXVg/KWQf0yzD8DkYv/odrVES
 ibxCFOAS/wB/dl7MmsU/CP7fP0hNpTIdD2V6tJFEqfikpKg9falTz0NF+kGLJ0ycIv9S
 nmjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1OoCO1cUMZzfb1OSX5mBXcMHeX2dHEWP1gsKx3qMgEwP1xbwulRje6ewSgXRILEFI1qh8juCU6d4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyguOFL6iYMDz/NE6SqgM7NMhJt3Q/1Avmgt6haYZ6YcQQIxqW7
 xvY4DcN17216gDExeKyGhOvJ3Fgq2S3AWxo4WTP2fwjEvcqQn1CWRyF2
X-Gm-Gg: ASbGnct3GCPOTAnq6WnYicBpUx2ytRLpdwxS52Pwi+h+N73Afn7/2aYb0aVNigxKfr0
 R8YVQitBmXmD3nH2sglTp//DFOxs4VBPTd3IlGmMwWH97iZ9othzKDTj2qnSZ+AG59Ac9GuUTSK
 C446I022Rex9fKJhPKyxWVjF4c10rjC3OINXtBfFklwVvuebkkLRPgX+4nx/F+g5v0rw9f0B9ZD
 nohUCMJXyEgZzTEUB2qLApKXlkfO7KhA00UF560qsVqACoKE1quKx/vPdGBU4bVLuNaw4jNktTQ
 1sKVIth7Fuv5Tmz/WJVOQSFmolfPOSVDOmXe+43LfOxcVcIqtazCj9rGJhdjw2JBXq3odXYtGKZ
 HwZZFHOBILGLQoVSDlTNHo3ym1AxHJyNmFyzI
X-Google-Smtp-Source: AGHT+IHJ0etjvptegteXgkUWoFIILA9nIajrzCKr99WRD5OzNxzSggv2jyDezns1lof2dGSUjRUcTQ==
X-Received: by 2002:a17:903:4b07:b0:249:2297:c424 with SMTP id
 d9443c01a7336-2492297c777mr3315565ad.15.1756454134776; 
 Fri, 29 Aug 2025 00:55:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24903724ec8sm16944365ad.41.2025.08.29.00.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:55:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id EF6DE4444CA3; Fri, 29 Aug 2025 14:55:27 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DAMON <damon@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Block Devices <linux-block@vger.kernel.org>,
 Linux BPF <bpf@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux KASAN <kasan-dev@googlegroups.com>,
 Linux Devicetree <devicetree@vger.kernel.org>,
 Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Build System <linux-lbuild@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 tytso@mit.edu, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>,
 Andrew Lunn <andrew@lunn.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>,
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/14] Documentation: damon: reclaim: Convert "Free Page
 Reporting" citation link
Date: Fri, 29 Aug 2025 14:55:12 +0700
Message-ID: <20250829075524.45635-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=839; i=bagasdotme@gmail.com;
 h=from:subject; bh=br/gH56HVzhrfYYqrTP3c/xceN5BBvTsvI3pBYQ/yVo=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY14UOzeckV2lWTlnxluBwiWvpt1jF+xvT61/ejpwa
 tSzw60XO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjAR0x5GhlnvrvsFdd3e6TjZ
 g2FTa8uK3U48C+++2yu+oPH13XO8khKMDP0RbvPq2Hk2WQbMuFkV7P77fsRatst+E/e4qhe89eI
 LYAcA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

Use internal cross-reference for the citation link to Free Page
Reporting docs.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/mm/damon/reclaim.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index af05ae6170184f..92bb7cf1b5587a 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -298,4 +298,4 @@ granularity reclamation. ::
 
 .. [1] https://research.google/pubs/pub48551/
 .. [2] https://lwn.net/Articles/787611/
-.. [3] https://www.kernel.org/doc/html/latest/mm/free_page_reporting.html
+.. [3] Documentation/mm/free_page_reporting.rst
-- 
An old man doll... just what I always wanted! - Clara

