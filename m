Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA56B50B3A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6B110E828;
	Wed, 10 Sep 2025 02:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZthbpFbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C40910E828
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:43:55 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-24b2de2e427so44549435ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757472235; x=1758077035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKHUedwTpnE+6902OLKWJUrKeeyE0icmaP4M6h8VeIM=;
 b=ZthbpFbvM4tWWvoNzAbjn+VoK+a9rvxANEKLiK0GxolbucfbaMn7xerSGt2wHdafAZ
 0oNmRoqnbLfehHQa6QfcwJsZFEqbk6nLuOircwKXsj4mLLOsYBXxZkbOOSkVHj6psij/
 2kt8IZQKSpkD5WUnw6pjmoKn3qXl7CnULD14kYyzPkoo74V93Fk46ZG8jtXLUyBo6YSb
 A9VdAMk3a5t7T6kQZyr3rcgomeEd5aG44Y5/T/H0z8JDnlnglX5/DiEZMjAgjn1OVk8P
 xHV4vPEWhfINcnDSG1VBO9bn0hH/Nuc/8XhUtQenJliMuylaNfHq5xihqOyLCrHL3FfP
 kRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757472235; x=1758077035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKHUedwTpnE+6902OLKWJUrKeeyE0icmaP4M6h8VeIM=;
 b=GZ4pnEeqZh+zm2XIaY8zJIUnaXg91+D9FQtH47gTP50Q4G4JqjR6DgBvIkPpvnMdjd
 7QOR8alH5gdrvyfyI5LkY+XSgBjhGcprOWwoDlMKs8RkjI3EJ6+xjRfY37oSzwZQccz/
 g+6fqQjlsF8Mwi5Z6hdQ9Do8Bnzo82c63fex/C9GzdfcSqdEkfcbHVT2PR3J3gfzCFVQ
 unln3/xAbUsWXaEs3mdHwA3/xdqqrvJxeZYbshgxXbELjS+onZc5BtxPu2ewx0tx6Y67
 deaTc46XfGjW7uWDJWksvm1rRb3SnqDPhsJ27fcFljC9BN6bN34aoSl4lcHuAzmE9QkG
 yhRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5tPf81CBqk2nGcRqTHPqHnVGQ/4heGES2DhGGcsNpScnfOWvEk0AsBwjoVuKsMl6aO7qiSwvJGzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuYwiAhwkUb08dKii1js3XCrqDsiAyaysAluMjLrP8mJalkDCQ
 Y3vMYkGDW6zdShfKHPBM/6rS+OT+rROJhbFaJ1OWNFlu9le+J0Zq0fMC
X-Gm-Gg: ASbGncuq4gt2ao61CjLNnG3CsGbNB6LPaWoYl2KTfY6JWa50e95YNxvw9U6yq5alatl
 Vz8xFfgOGY3ba5JR2CdZwzmBQoEnxu8F9l31uvnrZCUq9dHfm8xIs7aYYex2l7x3BOn7tkicT7A
 bXUoOa459CW4uFw3kG0ie3nUcTC+iT4br+auTavOP7dGjAxydWDxN55ETI38NGH/GBpDpzrMlNY
 X3GT5yvEs2gjB3fB3iTcSV1eDHv8JHO8HK2VCNK+ntrGAqsOsHrLO+y4PcY/CKiA0pZg3+1GpjN
 37BQBjJ3EJQ52DWlmuzGdNZhCzzNEivH/uQAiySc1mtHrxxfIi8uzhg5g5cUsQBAADZCnd0tHhl
 b3K8kTiG3v8j8qeNuWYzorPzjjh98OYcPv+FV
X-Google-Smtp-Source: AGHT+IHbDjWZY3VztYJWV/FENnSrT7+pUTw9iPKJIW8vQLIXrlNVN5ahZX5GB9eL2BwlCwOB0bsRtA==
X-Received: by 2002:a17:902:fc50:b0:24b:640:ab6d with SMTP id
 d9443c01a7336-25172b4b335mr233139385ad.49.1757472234639; 
 Tue, 09 Sep 2025 19:43:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a27422ffdsm11441735ad.17.2025.09.09.19.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:43:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id E4226420A809; Wed, 10 Sep 2025 09:43:51 +0700 (WIB)
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
Subject: [PATCH v2 01/13] Documentation: hw-vuln: l1tf: Convert kernel docs
 external links
Date: Wed, 10 Sep 2025 09:43:16 +0700
Message-ID: <20250910024328.17911-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=bagasdotme@gmail.com;
 h=from:subject; bh=oQ/U51BIIgNGsRun+kwInz/tmig5xTqHruGeEvNRxQQ=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnig6a/JZLY81M41OfrJ5W/1jtyyro8lZM99fCflwN
 Zg5yrW3o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOplmZkWLE7pDLv7RVG0Wlf
 H5ewasZymzr2NV7tNPkiErzi6eK/vxgZzoS7uJzLvPvRJPIa/z7RCs5jTcdeb3Q8EmZgt2n66RO
 ZTAA=
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

Convert external links to kernel docs to use internal cross-references.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/hw-vuln/l1tf.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
index 3eeeb488d95527..60bfabbf0b6e2d 100644
--- a/Documentation/admin-guide/hw-vuln/l1tf.rst
+++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
@@ -239,9 +239,8 @@ Guest mitigation mechanisms
    scenarios.
 
    For further information about confining guests to a single or to a group
-   of cores consult the cpusets documentation:
-
-   https://www.kernel.org/doc/Documentation/admin-guide/cgroup-v1/cpusets.rst
+   of cores consult the :doc:`cgroup cpusets documentation
+   <../cgroup-v1/cpusets>`.
 
 .. _interrupt_isolation:
 
@@ -266,9 +265,7 @@ Guest mitigation mechanisms
 
    Interrupt affinity can be controlled by the administrator via the
    /proc/irq/$NR/smp_affinity[_list] files. Limited documentation is
-   available at:
-
-   https://www.kernel.org/doc/Documentation/core-api/irq/irq-affinity.rst
+   available at Documentation/core-api/irq/irq-affinity.rst.
 
 .. _smt_control:
 
-- 
An old man doll... just what I always wanted! - Clara

