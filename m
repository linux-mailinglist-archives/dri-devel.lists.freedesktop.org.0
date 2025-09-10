Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1EB50B4D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253F510E831;
	Wed, 10 Sep 2025 02:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jjIBGLF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342DA10E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:44:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2570bf605b1so30274745ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757472248; x=1758077048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BATnrPttTGOeKRCCT0K3V4HzIU9KTE8stAVBRczt2LY=;
 b=jjIBGLF6hAqAbp/Y9XuPHWadQkCY4W2h68MCEsjmo3kOiDt9QiZO/bIQEtn1U6EoXz
 GhSb933gD0pRqhw5y+HIDZHDuA3XM3wziRSdHtMsePmOVFeMgXKTQYvVx8boPeRywNRD
 OvWyMAQegC5oeeFCaORGarJP3SdQmvEGENo8b+xLUIMsyR4QTUYBubh/6nKRiV0jI+AP
 P1JQZ8VXv/fcuE8ipvZWfgWlKmCUHXnrH5q8CzXRBkd5BwTeyLcySOkmkAHbw/dW0BGC
 3TN35ERboJl72Ey38HqpF8NAhaM7XfFhzTUuHlRtKZ3ifk6KPcLYSjB4N61HzoBU8+SR
 OYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757472248; x=1758077048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BATnrPttTGOeKRCCT0K3V4HzIU9KTE8stAVBRczt2LY=;
 b=S2PujhrQscGAMstQFRyUC+6S8qOZtR+UBfLFUeqWQL+g5xHrQTS3HVnu0btQMTXpoC
 j3QOmK+9iZ/T75r2psmeDl4gE6LeGkmpqjEqSdXcOOzncXJWp8iFJxp/bR35oW007BqO
 O6yeAL5CoEjGCpOZwIUtPXXJG/ty4tca5gfMQEilLuZlq2Gi2hILRCGeLAZ79AmFuDFX
 mRTHFMCKC+4QpVPwBRXZCNuM3n4mhYR/kAuVZ+pj0kf2ACS/Zn/hjv8cMLKXi/pTaezv
 k68dwwOsxSfE1LqQzddANtynBtSUuFu/t6EHcw0ieQ2inUt5zLGJYrEz0T9V8Kx/UBK6
 OH/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLDuYQH+Ipczrnfn/2UOZD2rFMXTiKrBw192VNWkCqWb5/h7ZkYwnTW4MTkB5qlKHn8Ns0I6egmbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlPt9IPueIB2ByElqjHmyOPO+khuwCsQcYJGqrTdr6io4b9Qnt
 kITUwoZ8XhoKf25X4NSYG0OdjzPkU0a5Fwuh88kD2iUUePMQnjRsK+A0
X-Gm-Gg: ASbGncvXn5UckXRHShgd+K1ZyNXSFWFDCiCKMOkpf2hFGcPWC1LDHz9DN9+QQp69yR9
 Ml6diLVozx6G24WPxii87jNhGLTGdupnAP1x5kHnYAF6rv2h21OOUJKr5WAXw2TMdFmCmW8A0Ut
 JYWz0oV8H1gPW2KJMzTcUbA2s4qq9KFhH0zN+vGKDRDJk/eQauTk5hH42CCYI583lyQ6Do0dr5P
 tCTzw/us6nbmX44CHXB5U9iluEchV+fFj2oj43tFAApmRm3aehOWFlYT2Lh8Jc2Jthfs0Rm8klW
 sGhnjaC2eNh/uPcoWC5WNXr1ALw06naVlgDX9fGEBOFa2PCrW1443UERRj7u3iB/uhEc78EUNTV
 3OR8p4I2SS5pCr1+mracurpWGuEJLMo9UhOa2
X-Google-Smtp-Source: AGHT+IFT6YbUc/m0qKUsx2gIlS1cyHwFE/YTWi5ShK7yx8zu8toS/bxgvdpLpOBm2BAA4mGAvmnSyA==
X-Received: by 2002:a17:902:d501:b0:24e:3cf2:2457 with SMTP id
 d9443c01a7336-2516e69aee6mr211563725ad.24.1757472247632; 
 Tue, 09 Sep 2025 19:44:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662ef781sm3491871b3a.90.2025.09.09.19.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:44:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id AD39841BEA9E; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
Subject: [PATCH v2 08/13] Documentation: gpu: Use internal link to kunit
Date: Wed, 10 Sep 2025 09:43:23 +0700
Message-ID: <20250910024328.17911-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=bagasdotme@gmail.com;
 h=from:subject; bh=WOOeaeuC9/RH4phIV+H+QiLxF/prahARBSHjeoa181M=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnijZrvnhN9eJ1+LvAp2zslcUft9O2uC6e1HKcd4J/
 rFLDLiudJSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiyg8Y/lmtiNJu8EtVbugK
 fub0kTH31Gy3pLdrgoTZz7qUXricksHI8GebzZaeM9lhFZ8KFVTdJ9stibqczP1vypfAmIZda2d
 1MwIA
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

Use internal linking to kunit documentation.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe950..efe9393f260ae2 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -655,9 +655,9 @@ Better Testing
 Add unit tests using the Kernel Unit Testing (KUnit) framework
 --------------------------------------------------------------
 
-The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
-provides a common framework for unit tests within the Linux kernel. Having a
-test suite would allow to identify regressions earlier.
+The :doc:`KUnit </dev-tools/kunit/index>` provides a common framework for unit
+tests within the Linux kernel. Having a test suite would allow to identify
+regressions earlier.
 
 A good candidate for the first unit tests are the format-conversion helpers in
 ``drm_format_helper.c``.
-- 
An old man doll... just what I always wanted! - Clara

