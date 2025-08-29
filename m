Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C03B3DAB0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA38B10E38C;
	Mon,  1 Sep 2025 07:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JMF5AKJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2E710EB6A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:02:59 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-772301f8ae2so226899b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454579; x=1757059379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ji3KkW3qUsiM430Q8CaZBzXxSVywrfxa2oAywWyFSjA=;
 b=JMF5AKJZ9nLJigLtGnpGf7HlCX8LlGo2839r6NRIl4Rp5s26RaqQ3IaaJSa0nsMGg0
 e0yDTCTSca+YNhQIwW6pA5Mapa5LSH0/E88197d2a085XNHKEGRQpDb2HD8HRhtB06Rc
 WeleVml86/5MdEMJlHsRExjes/dQ7PDpmaD2SDO45cRsAVVdaUDg7j8VpqxdoFp6s47h
 v3q3WD057HTZidDZT0zEwkArgA5b8dJTFiQRfLzRZGZWmYwTKi3/ePc9MCMVm5OrW5YR
 +RNURMsu5aCqVB00e32bCcQG3yEUNy+UBsbarOj4r6o7/PAVBYe6hvLUXQDO0Js09hUZ
 JRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454579; x=1757059379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ji3KkW3qUsiM430Q8CaZBzXxSVywrfxa2oAywWyFSjA=;
 b=ppG3tybegwLXQrRDOXjLPhBmaMbKXSGVdocDzJWyuHNSAnmq6X5nwzVihavyMmYhTU
 YOkXXu6orkrlA2GacgtW/eLE0bKsE+H5lhTZ8e77DwnK69OTJf2Q5yyn+sQ7uoD/sG+Z
 Jvie8iwzgxqZQefpM/8cqJh426aVBUNKAOGwW9TxJIhLSFOX5dfh/8iiQfFejVTgMJEr
 Zt6dySdwhFZnPOSIynh+xi4Tg+AZxIt77hq3Xlp6HY3t9PV9B5xOuoiWWUqnHbQim25f
 tKpgWx8b1gcsBvYOOV13Sv/hqTjYRZuV11CdVtvAbbGBT95UwDfGawjcWz9g1pEThD0P
 8f7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhQxmIBc8GG68mex/TmY8jVbqZpNiXFHXr7G1epxEeV8DzrHAfKDGjP4fkwga83vevNCxO8+P3oes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywmrzpIFMaihOLrSLsFFtlZQcHUY97YysFYWiOeHL0XrW9nutU
 5TYbWrWE3C4+uCnRoTijZRKZXfOwurzdY79W2gaNe6wtdQugOh0affHy
X-Gm-Gg: ASbGncvsAVA3EI1dTIhmxbXC/Ndk0VwXHJXLloNEVzZW1LN5dJli5x7+xU0Mo86MQl9
 2TdVmJiKWgNSH6ortIOFpbPjoPXKdJqOCdWX/B2fPHRe36Dp0BBYW0bdwwnAB1vXqYWCBzB3any
 TIc3WZQX5LFjBhMsFL/qnzPwjFg5Q4YSiqMbIS/arNyurg9zbRH6oJ15sdYF4V84M3dK6pT8gm0
 pMaCvUNtqfJlrUjPMOSG4MCcZwLx8hGzS5zgzZON+zPKlxzNdKYjGYsoapzdbN/WOFCytpm2ENE
 TjDWxzOLBthVg7DAd9tvL7+eYgFyzUegQMqFy7u7XusCNcm1V/u+ziX6UEHMs1au/dy5GQbxoXP
 BommsTsBCdR9k5MCsokbdOwTyDIkrcVH/MaJufGdp/rjcuR4=
X-Google-Smtp-Source: AGHT+IG4XzsUhVmrn4fJ8v1PNDsbGNCghgUfxDPbkeqpUjvEg9N6RxHWj66Wbdw1AdmD0ATs4dsvZw==
X-Received: by 2002:a05:6a20:3ca8:b0:240:750:58f with SMTP id
 adf61e73a8af0-24340d91edcmr35447322637.30.1756454578938; 
 Fri, 29 Aug 2025 01:02:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4cd0e1c0besm1461992a12.24.2025.08.29.01.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 01:02:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 1E9654489F51; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 12/14] ASoC: doc: Internally link to Writing an ALSA Driver
 docs
Date: Fri, 29 Aug 2025 14:55:22 +0700
Message-ID: <20250829075524.45635-13-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684; i=bagasdotme@gmail.com;
 h=from:subject; bh=QIAPxg2EoM7XBiBH/OfCd9SfIrsCdhbBl57WJdF7gOo=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY14FftK8Ic/EqPdDdzlDXfSrtOCCiCo1tq0af6f2T
 rxS2nS/o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABP5M42RYQe/RHjLfYX8tv8L
 9vQt6eKUm/OnRm/3gUlFq/44pi2Xf8HI0BjxjsH0R+yFD+urVrRxaVu1SiT8M9vxwkWu7L/ecZP
 DfAA=
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

ASoC codec and platform driver docs contain reference to writing ALSA
driver docs, as an external link. Use :doc: directive for the job
instead.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/sound/soc/codec.rst    | 4 ++--
 Documentation/sound/soc/platform.rst | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/soc/codec.rst b/Documentation/sound/soc/codec.rst
index af973c4cac9309..b9d87a4f929b5d 100644
--- a/Documentation/sound/soc/codec.rst
+++ b/Documentation/sound/soc/codec.rst
@@ -131,8 +131,8 @@ The codec driver also supports the following ALSA PCM operations:-
 	int (*prepare)(struct snd_pcm_substream *);
   };
 
-Please refer to the ALSA driver PCM documentation for details.
-https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
+Please refer to the :doc:`ALSA driver PCM documentation
+<../kernel-api/writing-an-alsa-driver>` for details.
 
 
 DAPM description
diff --git a/Documentation/sound/soc/platform.rst b/Documentation/sound/soc/platform.rst
index 7036630eaf016c..bd21d0a4dd9b0b 100644
--- a/Documentation/sound/soc/platform.rst
+++ b/Documentation/sound/soc/platform.rst
@@ -45,8 +45,8 @@ snd_soc_component_driver:-
 	...
   };
 
-Please refer to the ALSA driver documentation for details of audio DMA.
-https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
+Please refer to the :doc:`ALSA driver documentation
+<../kernel-api/writing-an-alsa-driver>` for details of audio DMA.
 
 An example DMA driver is soc/pxa/pxa2xx-pcm.c
 
-- 
An old man doll... just what I always wanted! - Clara

