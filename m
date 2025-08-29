Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3326B3DA9E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D7E10E37E;
	Mon,  1 Sep 2025 07:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q0e4qwmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922BB10EB65
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:55:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-24664469fd9so16924885ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454146; x=1757058946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fK0hEDM5Yyao3a7xqBzpr49p9H5HB+om5vfXDIKLdeg=;
 b=Q0e4qwmNrxFjF1+pUEjVa90xzvgDnSkpRQaLZJRY7Uiv/BUkBgqerxesDyTN1ypRsI
 9if0BNIeH8GoGCZYQy8hEV+X00nYK/efrhmdbIoRW8g+0TMH9eoWukmpFWcWen6oTStn
 tS15S39t+y1wZQhCTHzJ/d529IHrQdkp5E+iz6FITPy3rqC9i79UdkSNu62GZ7NDtgq3
 C5+G0uVpZ1Rn5HeJx9yyzmFTZbRbOQZ19ZT3Axo9CQLVUf8bmq6IWDNhDPZcBOAqm4k5
 A2tLTCIHQUULlqR5p7/aAk+dRQ7wEILw1Kq/g02aM1bOuOqaFvErn32Fs/pNW8GM85/5
 feTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454146; x=1757058946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fK0hEDM5Yyao3a7xqBzpr49p9H5HB+om5vfXDIKLdeg=;
 b=Eg/qsftKURrQjQKkNKFtPe0ctsWzQlptmENEvJvq+R78Lq664dcheO4RvHkQGAil/m
 XM1jtBTnRkUyMs28qVoxjRbLMz5SUBljNHbxV9csKtj2ZdVEVMwCpHgnUXzjfgfwPgRW
 yP35itRHFclV+pck1469wRazsvd8Xx+SLJhJuJ+8Ix1BPHXDMwYqwmNmsleiiU4iPfX1
 V/psIsDAe+mf61F/MxJtiOMNkP/d45lp4Z6l65brIwNmlRZDEJHseH4rekt0TC5FbdWd
 h9gkJeSF1AVpjPIIArTOYZvq7HuXesAXkV/KC3iN2X6oEXgwuI426pbPo2YTBg6rdaGf
 wnIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwYtuYoHAcnGgpe3FAtijpT35Yw579EXsXK8im8iMf9BH+E3jiIodKn9BWB/PfoDdjBjkJLeWzY3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVMQ1MiIbcFip4gN8eR6YO/3DBQ2bYqU0S0v/WvAORU7AuiQCT
 SwZ8u7eso08ShaXpcYs8CfMfNiykd16duOZXCv4HN6xxDkigSyBaUfOV
X-Gm-Gg: ASbGnctzBhMLnBZaQJzKekZJyFv8pWmZG2IyY8kN0JvTCRUliJfcfSnSVcIgK7exFHn
 X+VqWooocRoIIYY5ACnOSXFn5QysMW0zog0xaT9S/UWssKSsYxY54OJZwdHAW6wD0cStHGoaBtS
 fVL6EABnUHnuEmHDGqgQ3MxB1csiVhazAIVr+3ft/xITUp11rUk/qvzJdwHYPv6+TwmkGcOtnyM
 OMwlqqs8goBPTosYfNxg2/6pBgnnnVEc9r+HFBj1ejkVA/bNI0QSGzv/eTOA05LEr2dg/xg7XnH
 7TL7SJI/vIHJHtAzAw40TzziTfZ5TJPM3wprd8cUIxNbe5Sf4Rr8iHm0R0yTrczYqHaiAaPDyaP
 x7hXZFjb4lV3eRH7ZbiGC9aYSgvXPdPBGY7n8
X-Google-Smtp-Source: AGHT+IHJbtOvLK7smFZ5Taldvs91dQKYlT3bJQAsV4fZ4iEcDvRKpIMHMCPIqq2aQ2G3ehFn7aA64Q==
X-Received: by 2002:a17:902:cf08:b0:248:a4e2:e6d6 with SMTP id
 d9443c01a7336-248a4f2333bmr133286365ad.39.1756454145980; 
 Fri, 29 Aug 2025 00:55:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da4784sm16792615ad.90.2025.08.29.00.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:55:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id C98394480991; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 09/14] Documentation: filesystems: Fix stale reference to
 device-mapper docs
Date: Fri, 29 Aug 2025 14:55:19 +0700
Message-ID: <20250829075524.45635-10-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=bagasdotme@gmail.com;
 h=from:subject; bh=Ip9RCWVx3N2eFboDnh1dVntKjUKs5RT6sbpEBdmz23c=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY16ybj++M2M+e9AK28XZP75VaZfxL/rvM//ttckLa
 3oE7/o/6yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEPq1l+Ke0Kqr32Tmn3/wy
 503l2Fb8+Tb1i0vpkb/b//3YUvkmUo6bkeGv6MSGx38SK429ymz0txt6/t/hdS/prR+npRZPk6W
 qGg8A
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

Commit 6cf2a73cb2bc42 ("docs: device-mapper: move it to the admin-guide")
moves device mapper docs to Documentation/admin-guide, but left
references (which happen to be external ones) behind, hence 404 when
clicking them.

Fix the references while also converting them to internal ones.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/fsverity.rst             | 11 +++++------
 Documentation/filesystems/ubifs-authentication.rst |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 412cf11e329852..54378a3926de7b 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -15,12 +15,11 @@ of read-only files.  Currently, it is supported by the ext4, f2fs, and
 btrfs filesystems.  Like fscrypt, not too much filesystem-specific
 code is needed to support fs-verity.
 
-fs-verity is similar to `dm-verity
-<https://www.kernel.org/doc/Documentation/admin-guide/device-mapper/verity.rst>`_
-but works on files rather than block devices.  On regular files on
-filesystems supporting fs-verity, userspace can execute an ioctl that
-causes the filesystem to build a Merkle tree for the file and persist
-it to a filesystem-specific location associated with the file.
+fs-verity is similar to :doc:`dm-verity
+</admin-guide/device-mapper/verity>` but works on files rather than block
+devices.  On regular files on filesystems supporting fs-verity, userspace can
+execute an ioctl that causes the filesystem to build a Merkle tree for the file
+and persist it to a filesystem-specific location associated with the file.
 
 After this, the file is made readonly, and all reads from the file are
 automatically verified against the file's Merkle tree.  Reads of any
diff --git a/Documentation/filesystems/ubifs-authentication.rst b/Documentation/filesystems/ubifs-authentication.rst
index 106bb9c056f611..9fcad59820915d 100644
--- a/Documentation/filesystems/ubifs-authentication.rst
+++ b/Documentation/filesystems/ubifs-authentication.rst
@@ -439,9 +439,9 @@ References
 
 [DMC-CBC-ATTACK]     https://www.jakoblell.com/blog/2013/12/22/practical-malleability-attack-against-cbc-encrypted-luks-partitions/
 
-[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/device-mapper/dm-integrity.rst
+[DM-INTEGRITY]       Documentation/admin-guide/device-mapper/dm-integrity.rst
 
-[DM-VERITY]          https://www.kernel.org/doc/Documentation/device-mapper/verity.rst
+[DM-VERITY]          Documentation/admin-guide/device-mapper/verity.rst
 
 [FSCRYPT-POLICY2]    https://lore.kernel.org/r/20171023214058.128121-1-ebiggers3@gmail.com/
 
-- 
An old man doll... just what I always wanted! - Clara

