Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D5B50B40
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7C10E82B;
	Wed, 10 Sep 2025 02:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rnyvg63K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD5B10E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:43:58 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so149118b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757472238; x=1758077038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJdcHxX57XebbZj4zrMMfWynAEuJyyuoNM4CHXO3dik=;
 b=Rnyvg63KULP1ENp2Da7T2zZI0Iqm8GnTi8bmy4KvVnuMEiqEwuPVeHBdSUehXoxyOU
 nNY6EGP36Oi47UARWKRQNRyfRIRk2Y0+a+6RbgKHWJ2cXzPRQUPbAa3uGkHF+oBB9gR9
 SVxKLYWbT7gJWgtjgWziPuwoVanwlmD7onAfeJ9HeliuDxSJsq0WmCxojWbDaqrnk7QH
 Z0aPCEpZ7+dGbxKx5NLH3TN8XLxFqf1/lpRYSNvVcaIqHcw5EBvCGAoPOkeXG25Ugdyc
 mmCtAGgntJCEpNrY1SosGGQ/M4TVtajCpr5zmrntRdQIDkF9UjlNEMt33cMW6U1Cs5Tw
 PnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757472238; x=1758077038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJdcHxX57XebbZj4zrMMfWynAEuJyyuoNM4CHXO3dik=;
 b=tIPJO3HmVbaZ8SiEkwAtW8X16e2eQZgjVKZHImntcakSK+KaeiT8JFxeOtad0hznjf
 o409X121VLgK+P8u1aZx2RhssZXJZSiDPGR4JQW68OZLnb7RtvGdcPgQwYo+InSo3PZ6
 bVIRs7y8iK8wAHeIXkofHtOLxih/TR0WXIm4Y4elOuD1qKnfUJvax/8VD81cdhmv8UEA
 BIUDtSR4Crd4IcTFI3SSvCDPbTGNRYiCRzJ/QgsUCWiWxt/i5Jh+GJEB7o5CAB2i7neD
 mc2J6lHYFfLFZUAJ74/vWxNVGyDtCspnt84hUuTW3Bc8KET4EndrVzNVZD/48iR68YWX
 3LCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYGvbBoUcF2JIdNWSeugrJ+GzHIL+2VPk88TIqiusB2mAt+RRf0gsGhqg6QoT0mY14DeVUWP4Zv8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoTGXQ3+WuamQyqmvPcZC3NCEmn9A1eYx2kXZf20CYLPlKiPSw
 0loAvRM85COrYq35M/3k1CykauGhvI+C9UppMiRXB/WhhOUHUpD6QjsA
X-Gm-Gg: ASbGnctodyi+4kYmDVAzIPsT6Sf81L5hSiNH8JSzqJ7L3AmRqYlIKlgFnz43Qlp0rlm
 1q0NSNzbYvDJmRqP4/d6+4hYUBxuqTi7tuXAs5jopv5F55RZl2aiGW/Hm3p7J/t/bXtjDVirxlK
 vOmyGeJ1vhFAWGJcLCXzEOGlfIq66qO4OnpJzzGc/WwHpOdm/WiMqbbLuShU1ENAOWn1NgcK1O1
 x9O3tysLlKzFGaqR2n4nTC7xJcC86cKY7qC1T23X1C8Oheo0GkrieFRyGypmlJdNib8Ry1OPABg
 NAmFqeJs3F9ETD6Up8lFGkQpKObnFAASiqlP7CfDGqF3ROcsgVfjD2yZPrunYv/BNK8Z3ipBW9y
 SrsEG6svsUtT0O0szD3WFvxJW7zH2BEpa7QUV
X-Google-Smtp-Source: AGHT+IHlW2FYAtqZ1nBeuiJ0erIdKTHM8TZOiaskQC50mFORCZ7qHar4U4e6n8dIjJOSKpsMSsisCg==
X-Received: by 2002:a05:6a00:945a:b0:770:4f37:bffb with SMTP id
 d2e1a72fcca58-7741bebe705mr21095803b3a.3.1757472238265; 
 Tue, 09 Sep 2025 19:43:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c73e0sm3425976b3a.73.2025.09.09.19.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:43:56 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 0C94B41FA3A4; Wed, 10 Sep 2025 09:43:51 +0700 (WIB)
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
Subject: [PATCH v2 02/13] Documentation: damon: reclaim: Convert "Free Page
 Reporting" citation link
Date: Wed, 10 Sep 2025 09:43:17 +0700
Message-ID: <20250910024328.17911-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=bagasdotme@gmail.com;
 h=from:subject; bh=TM7A3b/55JCgQfCA5kxK7YxN6xbvfSMV2ctBC+dU0+o=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnih2mgVe6tXtn33sQOG2JKN6npsV2+KuvrWb+KLwo
 YbPrZOKHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiIgi7D/1T1Zd+0q3NfXbSR
 WTM/c6Nt+dI0hVcvJi2QWSN+/Q/fJyVGhivi20SiX0RwBzyI4fPfm+rzyfPWB2YZV73+/5GK7JN
 5GAE=
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

Use internal cross-reference for the citation link to Free Page
Reporting docs.

Reviewed-by: SeongJae Park <sj@kernel.org>
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

