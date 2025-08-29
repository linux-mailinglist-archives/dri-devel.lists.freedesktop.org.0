Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD32B3DAA0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8510E38A;
	Mon,  1 Sep 2025 07:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f0xXRZGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37710EB69
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:55:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-327b3e24637so1031157a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454143; x=1757058943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNDvUkQSM5YXWXIzm38SWG/hRRo/bsx6SYKE7k7lSmY=;
 b=f0xXRZGdOpf737As81qgVXR2t5emEIlngBfRwmiK4m7d19pXaWpczn2HboJpUIREC3
 e6maEcn8UzJka1Jr2q0EesX7vB9e7wkltMwD6TaWI1Kpxw60hhkKVbfiIvVvZ72L2H08
 dcJO3doC0XZlGyf3KsF0/UKqGjrxe72wLbIQq/GQSph2hpUPknz5NzXpi8TjDyvg/QzV
 TQv7LU8Z3qNq4bwAVkTmwqw9ALAj5oIkHRk6WzZCk1p6FA19qtNkrOLAx/su7QauGUWB
 uWHWG+0xoRZ2IU0NHXXx4ELxjU7OESQtAOZPKB6Y4NubBxHipaALE30THY9HV7Mn0D8N
 n4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454143; x=1757058943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNDvUkQSM5YXWXIzm38SWG/hRRo/bsx6SYKE7k7lSmY=;
 b=t9LZp4pctJ3M2x4aS6LGDLW1F1Nbz1BHPXgzyBm3gq72E+9grBo6b6x8r9j6FEmqBM
 GoYChliNiU1MiM1kzDqKDnZtJBWusDeeG2Ri0ddvKP08LVTqXYQUtumnWexUaLOQmWE9
 hB9GGn4eR43PUCzf5E0M5LPhmLBubAF3l4wkFG2k1S6CNXXqfS+wLx/U4NA0KcBfR8Vd
 xFKQku/OCnvUwc6FOGtOD7EHeiypGdBvr6uzRkIQIbL7uUN/Teefn+G9tZIRK2Rg5JF1
 TSeorJ1GrTAK5F4pNcvD924eMiwStwvD/FIMrgC4HDauBbbIBVHd/vCJ3fne4LayNFjS
 e/og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAEFZsOACLhOKjeINaOkN0eoHExivrX8Twfd0c3N/WuxPJFYKNwipX5lUkr91FPgJHipkG960MDTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+fENURyvpmm3TLSvtJOIfx1ZE26IyrNfaPfayxskbiZ7QFVKa
 Zmz9i4qfRA3Akf+IGI8BmSpklsP50ZQbdn5qI2IGcXDvsYaQwjHvmmpA
X-Gm-Gg: ASbGncs9v/NufLosmKSLPhKqNk3wLD9qj4xL5jq5vQWNrn9I4eEVWHV0LpenZ3xKEbE
 vBEUMYngxJ6PDs7GEzxOeCwq2oYAhLme9BeT18ENqLG7MRAFyNzWF5u9iM6hLEaaI/sKhdPQBDJ
 M9eAQopS7VuKSY0obWWCwGImdNZCaEOnPHkdfTzkbo59IB2Qor2wJKlo6JyKop1ZkGLzEjBZ//f
 c50+NNPyuDEnlF/g0IfX+ZkmyhBP0Go1duA5BgKxivRQ/DTy4pENdAYqIRFYxqZWJ6lMWQBauiR
 0Fdaym/2HgV6ji1+cdGFvLU4gxzXyyfXmjRKshyiEcmqP3KJkj2Q/nDFKalZIXP3UAvMZHcyPWC
 m02QtOflZ7ysUrMmZhV/gUrUjSfPHqdKc+6Ry
X-Google-Smtp-Source: AGHT+IG3+4PiXre8myZJXbMXtIyGoT2Zo+1v7SoTFErR1CQFe7OBynTDKWH1/q0UIz7vCvtEP71Wtg==
X-Received: by 2002:a17:90b:4c02:b0:324:ece9:6afb with SMTP id
 98e67ed59e1d1-32515eadfb6mr30884939a91.3.1756454142399; 
 Fri, 29 Aug 2025 00:55:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276fcd48cesm7365898a91.19.2025.08.29.00.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:55:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 8D99044808FE; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 06/14] Documentation: bpf: Convert external kernel docs link
Date: Fri, 29 Aug 2025 14:55:16 +0700
Message-ID: <20250829075524.45635-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2744; i=bagasdotme@gmail.com;
 h=from:subject; bh=IiAjp2UiG4E4i0m+2wynqH3PCAcCcaK0of1KdBtx1KU=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY162Whs7TnrT1LggM0BOd5LEqfAiXtc37zS3e5gl8
 vnwGP7sKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwES+TGNkWCZ94c28TXy5tQ2r
 bD/4zPoTU9D/g2m/U+vihV++Li1Y5MvI8PjMzk3qf6eEm+VfELaazHDuklKIXI/3z+ub9I0rLF5
 X8QIA
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

Convert links to other docs pages that use external links into
internal cross-references.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/bpf/bpf_iterators.rst | 3 +--
 Documentation/bpf/map_xskmap.rst    | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/bpf/bpf_iterators.rst b/Documentation/bpf/bpf_iterators.rst
index 189e3ec1c6c8e0..c8e68268fb3e76 100644
--- a/Documentation/bpf/bpf_iterators.rst
+++ b/Documentation/bpf/bpf_iterators.rst
@@ -123,8 +123,7 @@ which often takes time to publish upstream and release. The same is true for pop
 tools like `ss <https://man7.org/linux/man-pages/man8/ss.8.html>`_ where any
 additional information needs a kernel patch.
 
-To solve this problem, the `drgn
-<https://www.kernel.org/doc/html/latest/bpf/drgn.html>`_ tool is often used to
+To solve this problem, the :doc:`drgn <drgn>` tool is often used to
 dig out the kernel data with no kernel change. However, the main drawback for
 drgn is performance, as it cannot do pointer tracing inside the kernel. In
 addition, drgn cannot validate a pointer value and may read invalid data if the
diff --git a/Documentation/bpf/map_xskmap.rst b/Documentation/bpf/map_xskmap.rst
index dc143edd923393..58562e37c16a01 100644
--- a/Documentation/bpf/map_xskmap.rst
+++ b/Documentation/bpf/map_xskmap.rst
@@ -10,7 +10,7 @@ BPF_MAP_TYPE_XSKMAP
 
 The ``BPF_MAP_TYPE_XSKMAP`` is used as a backend map for XDP BPF helper
 call ``bpf_redirect_map()`` and ``XDP_REDIRECT`` action, like 'devmap' and 'cpumap'.
-This map type redirects raw XDP frames to `AF_XDP`_ sockets (XSKs), a new type of
+This map type redirects raw XDP frames to AF_XDP sockets (XSKs), a new type of
 address family in the kernel that allows redirection of frames from a driver to
 user space without having to traverse the full network stack. An AF_XDP socket
 binds to a single netdev queue. A mapping of XSKs to queues is shown below:
@@ -181,12 +181,11 @@ AF_XDP-forwarding programs in the `bpf-examples`_ directory in the `libxdp`_ rep
 For a detailed explanation of the AF_XDP interface please see:
 
 - `libxdp-readme`_.
-- `AF_XDP`_ kernel documentation.
+- Documentation/networking/af_xdp.rst.
 
 .. note::
     The most comprehensive resource for using XSKMAPs and AF_XDP is `libxdp`_.
 
 .. _libxdp: https://github.com/xdp-project/xdp-tools/tree/master/lib/libxdp
-.. _AF_XDP: https://www.kernel.org/doc/html/latest/networking/af_xdp.html
 .. _bpf-examples: https://github.com/xdp-project/bpf-examples
 .. _libxdp-readme: https://github.com/xdp-project/xdp-tools/tree/master/lib/libxdp#using-af_xdp-sockets
-- 
An old man doll... just what I always wanted! - Clara

