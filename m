Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A9B3DA9B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FD310E37F;
	Mon,  1 Sep 2025 07:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gYbhmhob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6187910EB6A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:02:56 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7704799d798so1522392b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454576; x=1757059376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUuceR9E3vzJz5a/JHCoOJAb1uIOOWcnyWbxLYGhp7M=;
 b=gYbhmhobXmw34Ux/9BAFkKdr1LU8Og256dPZpAh5cGDy/x92t8iRybxb1FAQeOHFxD
 YRDLo/ojRidG3inSCQBBfty4E9UgPTmTJgSwx73uG5jlhQ0D9xT7NbKaIvB+eYvJw5Yw
 3I65wmnMyWwscOblCIoVurksOHejobO41JXj0LSlj6Av93Latv3phtily4kCSdwfwR21
 xHBTpt4oEwSc6WETrE/3stwjjMZuotAm/TwPqdoKp/rYFSCJb02kYGr7I4iR7AdaMu0E
 0rIkr04YT8veS1wxOAIQjLe31mi2ehNdl0/qGn/U2Zu+/Z+GjXvoH9iQc5k6tStGjI84
 GGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454576; x=1757059376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUuceR9E3vzJz5a/JHCoOJAb1uIOOWcnyWbxLYGhp7M=;
 b=NDG9Lj59pl/KF2c/cRktTSHbZVGHWMYSdqCOzzIg/n+8pQ+oGkol7xSY2w+rNZtAgE
 6p624C50JQwN64TGO0oKxNiMD/Z7opZ4FME7ZpbnhZhZdx9GLIKIob0shhNRHyO5OJ+k
 x3qJQj52tkzSd5WjGNzIaCEW6Vd+qUYAdQjSATufS9eu6yJkAvzfSFk5gGRH8mQfxNpi
 Cg41PcZq/rnUfxyszP+5BVl743DIUdH/Qrud+MpDgKdAslM9e7N7UOv95FrNhTtbeZTZ
 mOv92DpcxmO0zWAzKcAKmZfIP8NSy71DZzCifvRBZIe78a/fHTGAQ8866SLqc1UOFZgu
 1Igw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD5Var+BdpELG7+1sflnIeADRgIlK/B1T/rTX0eU1s5SPngmXsYAhwK3fKezkre9pNhv/i/NCAsP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwSB8h8gUjCQ7TeIPbanGF/YrNNq8l4k8GsIJXyIGCQBmKyZOE
 9nhdoBpwqiv1XJu8TiLqXbwaW43UclPmt4aV4f673sSu/qsGpToA73do
X-Gm-Gg: ASbGncuVr++EfWjCxSqCEGGjAv+LdqBn2/o4U+T8PuBkEJvQkhCLaBQnZyKgBVaB8wC
 rNrT9GUjVpLSWTrlxaoceyNmPscbmz+NNOoqV43iN9CIeG4QHbZC6qDq+U/InhBKR57pEwVebch
 NR4zxZLUhCGAsfPejJooUHBf1FC2B5cunJP/7743wUt+9kYdluARH5wmyxP/6jsdiiL7BK4zXXZ
 cGn4PcpEdEhJOhOW5yNXESRuigHGXFa/tXY1RSD22+PlRkuDeR6x0eeg3kXW9XzuDOgDRtlp/EM
 9vKG1gvmyuRSJWSbNsW8OSwaihFolHCuledc/q8i7ZvkgnCUaXucIOghp++U3cQCsWFLJOeYrV9
 EpKKKBT48mUmwrDzwUUUpSdX9jWfFHDoNL9qo
X-Google-Smtp-Source: AGHT+IFt0CgZnKjzhJ5g4aj0Cm28ZWwwe3q9IBbh2aQ/4X9BQsH63Txhma9tsRWuYD6j70bLTYHjgg==
X-Received: by 2002:a17:902:e890:b0:246:bcf4:c82d with SMTP id
 d9443c01a7336-246bcf4cc37mr269048275ad.52.1756454575739; 
 Fri, 29 Aug 2025 01:02:55 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249067de9f1sm16493345ad.151.2025.08.29.01.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 01:02:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B95C34480990; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 08/14] Documentation: gpu: Use internal link to kunit
Date: Fri, 29 Aug 2025 14:55:18 +0700
Message-ID: <20250829075524.45635-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=bagasdotme@gmail.com;
 h=from:subject; bh=lGvjj6RPPbr58GqrWqgYvJfKnQd0kE/Khje7rmfw55Q=;
 b=kA0DAAoW9rmJSVVRTqMByyZiAGixXOmjSTNEt/JFR6AhPDWfGCcGj/Np82/Az7wMJic3oIar2
 Ih1BAAWCgAdFiEEkmEOgsu6MhTQh61B9rmJSVVRTqMFAmixXOkACgkQ9rmJSVVRTqNRJAD+IU+J
 KWDSPb94prUVj+FntqxPO7boU221XL2jEkITc6cBAKhpWT1CuLYVAMm4rv4hGzdOOa9sljkO4cB
 hdLolzx8O
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

Use internal linking to kunit documentation.

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

