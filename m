Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481BB50B57
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8D910E836;
	Wed, 10 Sep 2025 02:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bJVZdO7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7923710E831
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:44:08 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-772488c78bcso6176086b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757472248; x=1758077048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kNx/lgQaweLHCKpOd5HxLBg5NtnJ9f3nOi2hx/97zs=;
 b=bJVZdO7ITPA8Ophtsdk2pZq2274HQ1ib/Fzs9/fEHccBzn3fnAZygE/77GvHjlVFai
 cqwOZCDgvVEQTUW5aFBZA8xWZFVSgNVcfRk+zewiwdnxSx1qB1ptIOJGAivFJ0ZuJw3d
 9+grVocDeezYH6mMTpIIfVzTytXu3ruhgqlI9dWQiX95A1xI36LIGU+3IgZug/tZew0y
 qeEBqppUUT5H6jm3cagV1fOQveYp0XFC4gXq2GqQo1POpm/yhF/rfH7kU+dJIo+fly8v
 ql6hOFcTK+bD+bDreModjSvyDAtg4g11vxxDF3GebSf/KEbsMTtAh2uFge7ZTL9EN9P7
 Nlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757472248; x=1758077048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kNx/lgQaweLHCKpOd5HxLBg5NtnJ9f3nOi2hx/97zs=;
 b=oblFyxUy0HNmfztqmKN7gFUjuH72ehXAtubPQJn7z9adHe0zfM9iNx78C5zy/VSZ/h
 Kb5MG+PPfvE3Cwj1TGyT0oEduTxVSYmIUnTqM3DUHjiAffuThsi8ldlXkQP0u7cDn/Rc
 NzHHhtoFizlIEiZekoixtbrI6nM4ktVK/k0E6zfR0aRlMEyWYfouanhd3NtSrYo0IcSB
 5SrwifjodrUdQFuK6K7H9oSZdNy4kQ8VpcxSieiNg2ZYMeDEls+0VWE6Fot6sLU2cxRU
 h7zGY4hgaRl9pjphikQVDhbz4eLlAFPuVrH7cS2fT8w/uD0me7tqPVopRDmDv4lOsRVC
 w3Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIRf9q2wZs1t9KAbwv6F+nZwacjxCaRxJANbkZ9Ff1LQgyV3dyIufCCu5Y3u8mYwRCyigz/sunnco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjyCZXtHAxjs5Z5aQNpacp90jbQ5E8aChfxPZmlwubr1W1FVG9
 nd2B4z+8JBDuNBMgjAaY1XfBjRTeSw/Mcm5qn+/LIuM4fBTXPLwPCuI/
X-Gm-Gg: ASbGncsLZCfgqVa1TiKkA52U2wnnaCahdlE2VyYAvpnf+rbL5t9XBlGkPfWdftikALs
 5sgvAMlrv0nDIXpaxrvR2pVjPSpXUfU2BRQLdF/z2Apisxp/b8XjWbZHj/w8qy8y+W9xBSMsLp0
 CsObsDh21vb+bUdmBtw/go2wjU0itM2oqSo59whN+wXjqQrxXa4o+UU/EhtKzG0SGUnc9gUNAMu
 CxSabT8w1svjmSJQWvMm2GrBQy6SLRW2Tyi6AiDVPa1U/a42pJRTDzG8pEwdXyjNNGPHMEhJm0y
 RJi38RfRjEUbqFMNyvPwIL1z8M/edPzK57KfMlFGr89ClXqXTIf0ghuxxzI9TC5Yu8wU8MEGP5j
 MeP7H3mEipNkpKw/L5CETCF85RA==
X-Google-Smtp-Source: AGHT+IEyED1mSm10/nBWu/PDugDe2kHeGr2B1Dlm/0Mxg3VMmmsn8EtrKKBRn8Kt1DMp+jVk5SErrA==
X-Received: by 2002:a05:6a21:998d:b0:24e:e270:2f5d with SMTP id
 adf61e73a8af0-2534547a6fbmr21436774637.43.1757472247740; 
 Tue, 09 Sep 2025 19:44:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b548a6bbc9fsm1061117a12.43.2025.09.09.19.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:44:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 999D241BEA9D; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
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
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>,
 Andrew Lunn <andrew@lunn.ch>, Alexandru Ciobotaru <alcioa@amazon.com>,
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ranganath V N <vnranganath.20@gmail.com>,
 Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 07/13] Documentation: kasan: Use internal link to kunit
Date: Wed, 10 Sep 2025 09:43:22 +0700
Message-ID: <20250910024328.17911-8-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=bagasdotme@gmail.com;
 h=from:subject; bh=yEY9P3BA6E4kqaGTHyjuJlgmOOGj2m2ZOET4fPd8xcs=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnihdUeC/XH99x9zD0/p/z/9z+OvEiwfuXjriUbHJw
 5Al4fDvwo5SFgYxLgZZMUWWSYl8Tad3GYlcaF/rCDOHlQlkCAMXpwBMpGYSI8Phu5uLfVhjJryT
 C+XOkO/82KnH+HRZtlehgA+3hxWLXwPDX5ny7U3LZzLMPNBzWixMoIP59nkt/0fGhV4ZjM5rXH1
 d+AA=
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

Use internal linking to KUnit documentation.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/dev-tools/kasan.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 0a1418ab72fdfc..c0896d55c97af8 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -562,7 +562,5 @@ There are a few ways to run the KASAN tests.
    With ``CONFIG_KUNIT`` and ``CONFIG_KASAN_KUNIT_TEST`` built-in, it is also
    possible to use ``kunit_tool`` to see the results of KUnit tests in a more
    readable way. This will not print the KASAN reports of the tests that passed.
-   See `KUnit documentation <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
-   for more up-to-date information on ``kunit_tool``.
-
-.. _KUnit: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
+   See :doc:`KUnit documentation <kunit/index>` for more up-to-date information
+   on ``kunit_tool``.
-- 
An old man doll... just what I always wanted! - Clara

