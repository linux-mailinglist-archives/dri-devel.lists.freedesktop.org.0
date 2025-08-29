Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF43B3DAB2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE26910E388;
	Mon,  1 Sep 2025 07:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3XZd6Tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FAB10EB6A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:03:00 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-24457fe9704so19526285ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 01:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454579; x=1757059379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AfZlK+2PpvnkbeUUWLESRnsPEd9fz1tduXIyE8HjWg=;
 b=O3XZd6Tv1kBP1RoP/i27361GtIU8MZ2ZWC2d3TF14C/KrRmEFv1ZyAnVSnNifOQf4n
 3f7zzC72IBrvhfqW4ji2AQ6w9DvE83RcK446+nMNZCi/4lhSqUU5Pduerf42MRoo+aop
 lUj+DN6+Qn7xWMFTHmi3klZTSx0SJNktnFISQ9HH1aG/duA79m5JvyxWCTablZks0VQ8
 nWaJBUmSxf00F/1gkXXD3MuIm/paZLyLrHH3BqrTcRdbIZXheZSxFOPbNDSlCE54FKt6
 92IHNAgDx0w1lK3UUaGekCNs3lnD0btEA2rzFym3S4Vyl7ej+gZwZoPFrV7FhYqxz6eJ
 ypcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454579; x=1757059379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AfZlK+2PpvnkbeUUWLESRnsPEd9fz1tduXIyE8HjWg=;
 b=m7TsgXnY8jHU2ZS5CCBJF2QUW0eL3edqp2DJl42Ia7ElBxjzmu1Hib31QKwyfe3ESa
 w+JE7oJis5kMuhutxdyuxezEd5jmhZw08is+/Va/fTeaW2M/96UaLxqPU1hhu2rNjMLo
 +1pK3EzSj1S6J6wJ3xxOX7nKc605sJ3RpiBGTInDucrsj2jyfWXRewUhNuHpR/XX5BOw
 nJhkYwpwmFD8jrxrUgpwT3+t1dGR6RbF5DGFI2XvKshuojBSrCAIflXqnvKuRHLQ3b1t
 4BGlLVtA9bwdzkjRrUeyf5CjN2mqlw7pzWNM6jQLbQmnJ0lURIkgdHLNcWYbNjcmyhTz
 5T1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCt2MXb77+OQS2urukcFG6VHy7rCSxGV789ytZ96bHLB7XA+s2Xx6SEDdNFBgrJ/2VL6Esu5f+b0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfVu4WSc76JatSd2YcxyFK29msCFSOg5Gy74DbW1dWr71EWXVP
 d9VJJvBaqRAAqkeiLAx/JtV98wZxmCSkvSpg+xwJRiUni87gdGrbzfG6
X-Gm-Gg: ASbGnctcY13w8k/DNlhjbIRsX68Lrl26hFil6KEFiF+qV3OFR+WP6si9X/5vn3aerrd
 5mZ6gCF24FBHNBeQYGe/4r6a/tiQv90m+EcLjtE+VR8yKpuS5aqX7y6jjNuh3mYxB3bjl28bcAm
 341rUlEBTnAaF+VV+28RsdBeLyy4hCoxxB6YkGhThcIxHiZTH8mx3x0L1LgE53y4lOUEXV/gSZj
 MBDQO29S/piPFopeTWpK9xLwhMVST9tr3mHmCH4wYl/CjWBAPJEMtc994oTZrJGAq34V2bHQLwy
 nUNor2CW7UEfV9VyUyZwJlPnpJh2aN2AiXSdJfZ+uoSsf43/DFdCSMZ98tRAO5rcYKrXLFSDn0J
 cAxz1Ab+uI3SdsZHGLiDr4pk/m0nU5ma7ZDW84pqnZ62eSVQ=
X-Google-Smtp-Source: AGHT+IEwoXGIzV8akza9wuHnzpdMDJjRSJFuE8pmXkEOlv9nwKY6YvijMOuiPPSYq1k0su7e61Abrw==
X-Received: by 2002:a17:903:acd:b0:248:cd0b:344d with SMTP id
 d9443c01a7336-248cd0b381emr78909285ad.9.1756454579374; 
 Fri, 29 Aug 2025 01:02:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24903702999sm17213525ad.3.2025.08.29.01.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 01:02:59 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 08D794489F50; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 11/14] Documentation: net: Convert external kernel networking
 docs
Date: Fri, 29 Aug 2025 14:55:21 +0700
Message-ID: <20250829075524.45635-12-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099; i=bagasdotme@gmail.com;
 h=from:subject; bh=eMX/Qh24hdl/D8upWlphNzasCNRD/YCgXxsSIbz5MxY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY16d1mKOz99m1qX25ldgn5beybqta3f6vFwaVK3P9
 qU9Ts6io5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABP5Y8vIsLj5nquL3YaGH+H5
 K1M/GSvVfagoWJf+Wf//FmmeVbsWnGJk2HnZqfzd057r3t1TvvSsKTBp/5q8NJD5d+PrUJ8N/JZ
 PmQE=
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

Convert cross-references to kernel networking docs that use external
links into internal ones.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../device_drivers/can/ctu/ctucanfd-driver.rst       |  3 +--
 .../device_drivers/ethernet/amazon/ena.rst           |  4 ++--
 Documentation/networking/ethtool-netlink.rst         |  3 +--
 Documentation/networking/snmp_counter.rst            | 12 +++++-------
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst b/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst
index 1661d13174d5b8..4f9f36414333fd 100644
--- a/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst
+++ b/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst
@@ -40,8 +40,7 @@ About SocketCAN
 SocketCAN is a standard common interface for CAN devices in the Linux
 kernel. As the name suggests, the bus is accessed via sockets, similarly
 to common network devices. The reasoning behind this is in depth
-described in `Linux SocketCAN <https://www.kernel.org/doc/html/latest/networking/can.html>`_.
-In short, it offers a
+described in Documentation/networking/can.rst. In short, it offers a
 natural way to implement and work with higher layer protocols over CAN,
 in the same way as, e.g., UDP/IP over Ethernet.
 
diff --git a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
index 14784a0a6a8a10..b7b314de857b01 100644
--- a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
+++ b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
@@ -366,9 +366,9 @@ RSS
 
 DEVLINK SUPPORT
 ===============
-.. _`devlink`: https://www.kernel.org/doc/html/latest/networking/devlink/index.html
 
-`devlink`_ supports reloading the driver and initiating re-negotiation with the ENA device
+:doc:`devlink </networking/devlink/index>` supports reloading the driver and
+initiating re-negotiation with the ENA device
 
 .. code-block:: shell
 
diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index ab20c644af2485..3445b575cb5d39 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1100,8 +1100,7 @@ This feature is mainly of interest for specific USB devices which does not cope
 well with frequent small-sized URBs transmissions.
 
 ``ETHTOOL_A_COALESCE_RX_PROFILE`` and ``ETHTOOL_A_COALESCE_TX_PROFILE`` refer
-to DIM parameters, see `Generic Network Dynamic Interrupt Moderation (Net DIM)
-<https://www.kernel.org/doc/Documentation/networking/net_dim.rst>`_.
+to DIM parameters, see Documentation/networking/net_dim.rst.
 
 COALESCE_SET
 ============
diff --git a/Documentation/networking/snmp_counter.rst b/Documentation/networking/snmp_counter.rst
index ff1e6a8ffe2164..c51d6ca9eff2c7 100644
--- a/Documentation/networking/snmp_counter.rst
+++ b/Documentation/networking/snmp_counter.rst
@@ -782,13 +782,11 @@ TCP ACK skip
 ============
 In some scenarios, kernel would avoid sending duplicate ACKs too
 frequently. Please find more details in the tcp_invalid_ratelimit
-section of the `sysctl document`_. When kernel decides to skip an ACK
-due to tcp_invalid_ratelimit, kernel would update one of below
-counters to indicate the ACK is skipped in which scenario. The ACK
-would only be skipped if the received packet is either a SYN packet or
-it has no data.
-
-.. _sysctl document: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.rst
+section of the Documentation/networking/ip-sysctl.rst. When kernel
+decides to skip an ACK due to tcp_invalid_ratelimit, kernel would
+update one of below counters to indicate the ACK is skipped in
+which scenario. The ACK would only be skipped if the received
+packet is either a SYN packet or it has no data.
 
 * TcpExtTCPACKSkippedSynRecv
 
-- 
An old man doll... just what I always wanted! - Clara

