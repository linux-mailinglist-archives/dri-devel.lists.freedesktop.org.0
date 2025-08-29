Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE52B3DA99
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D32A10E377;
	Mon,  1 Sep 2025 07:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D1ZNkg6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2BE10EB66
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:55:40 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b47052620a6so2119474a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454140; x=1757058940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+SUGCH8uEjWgwJ6PdsO74F0lOA4arnp0TuRWyoM63o=;
 b=D1ZNkg6VUHHfWVZKNwpEhdboUIJd+VgMj1Mc6zFXX4VRFfbfQ2jtwv/c6uEQXaCRWV
 TnxANbw0ZhVzkoC1h5TjkDWrqqT15ivdLonOeCN0CoLzWd09MX2AbIbdnIALZ3EC1Sfv
 pdvTJvBlbEM6wn2T/ollZpHmDImvsa6q7fp1O3K8QJtIqtXzGN4X1qxM17b5jeeY3zZ4
 HN6S4rLDPNHS4RYrJC9cI8yHvG59qxBT7We3AOoufpZ5XeGeU/kBi5UwXeTVfwCkhsyD
 d8u+QN7UuwMjGFqQa5rY2TBCd7cAGuT/alN3Nxe/ZZPANze8BcsmZYGoOHsf7igT2D+6
 Hqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454140; x=1757058940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+SUGCH8uEjWgwJ6PdsO74F0lOA4arnp0TuRWyoM63o=;
 b=KUkErk2rHgAITJgnIC6cKFoc42FKjB6baV6/aZyqReam2i7MW2N4ACUftNqAopAG9X
 gpLjTbmDpXte9cw4SL0LpKpS0BWPzoV389IrZwhfrFEh44E5iQVie8LzJ15f0Vwe5cGv
 xR5rb0GmpJGbXx387FaHAimnUHZYJXi2J268Cedx+2SLm7eO/v4kzHS+ubxLwSl5QE1z
 UYh29u77FUd7AwT1iTtb1mahH65BHm3k5iEmaR93V5jYe/JSzOZLQL21vSSdfHT1fbD8
 DSLCBl3fWOojAj2Tybj9eTKP7WLy7AXIez93JL+W6n64lYpSWIlFfExnCEJqFi1qUeXZ
 Erkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeltHcAQFZUbwn9nG8/2y0sBlXwK9Le8azmY9qk1J4cqpPlKshcQnTIRxsiAblrYOjEczRWgaqZxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydqZtVMfy5aI8IGk4rkDAAMW6cvziipp8VFSbvxqhuHi34VgQA
 BAlt90+Yg2JCQKkkYLrT0S3H04vRVxNEZXy4Q8668QqJSX2d56CO8CP1LD2vfjHrGIk=
X-Gm-Gg: ASbGncvTspkKHsa2ofbf/4lvGQK1nc1aS3xS0xkxVA9uGLHbBV5OP0vLD5gYFx5GnJ3
 xI0B6J5lWsdV2FCI28jZzSziDQCwA667bFWXoTFWuJs2LjjQBT2mHuPi0kNMazNI9S0MBSQrG6+
 nfONtW/IuS41Ju59qs46sZI6L0yoIfQyc6NWuAfkNCDmzKRBd3QFZX3CPjgURw+r37JLyj/zqPI
 XaZQTGc6rU1M6B8lN8ZIhTV7D4ZLBLWa66aESpukfGU64cWN0LMeO9F7q7UmC4Yfnagkro4kwWt
 iD9fOVLPUPNUshQF0tVWx40xDpEDMzRGQ2V829s3Rs8RwWHWqSwdF22G35wMSffyzYQ1vrPbUyl
 KSl3xnUygbBFy2KU9w11cL4wAAlk+hZ4RI7AC
X-Google-Smtp-Source: AGHT+IEUIbmp5KZdMZPn0c0CGQYstQ2DxLDepEvVflAGtJJLsQl7+Hp4DCT56TGBU1NzXfP4o4RcNw==
X-Received: by 2002:a17:902:d510:b0:249:11cc:2afc with SMTP id
 d9443c01a7336-24911cc303bmr18192475ad.7.1756454139741; 
 Fri, 29 Aug 2025 00:55:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24903704379sm17029615ad.29.2025.08.29.00.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:55:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 5F71C44808E5; Fri, 29 Aug 2025 14:55:27 +0700 (WIB)
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
Subject: [PATCH 04/14] Documentation: amd-pstate: Use internal link to
 kselftest
Date: Fri, 29 Aug 2025 14:55:14 +0700
Message-ID: <20250829075524.45635-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=bagasdotme@gmail.com;
 h=from:subject; bh=YCjSy3OR+PtbNsOx3d7dblyTwJjnDEtFBwBCle5X25g=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY14qPYlapHXxetwsqb0JS9jb7/0/73aj6M+zsn/7f
 7uJBK+t7ihlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEJPkZ/hloBmcs7pqXLvRo
 3uW3yzpsL08refrBOejE1FfXjopF7nZk+B9pJzZFXlK9u2zWB3XR7Keu63hWz99heLTAzXSF0Y1
 5YmwA
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

Convert kselftest docs link to internal cross-reference.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index e1771f2225d5f0..37082f2493a7c1 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -798,5 +798,4 @@ Reference
 .. [3] Processor Programming Reference (PPR) for AMD Family 19h Model 51h, Revision A1 Processors
        https://www.amd.com/system/files/TechDocs/56569-A1-PUB.zip
 
-.. [4] Linux Kernel Selftests,
-       https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
+.. [4] Documentation/dev-tools/kselftest.rst
-- 
An old man doll... just what I always wanted! - Clara

