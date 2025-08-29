Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C569CB3C4B5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79A810E213;
	Fri, 29 Aug 2025 22:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NpneGQ3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E98510E213
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 22:19:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BA72438B8;
 Fri, 29 Aug 2025 22:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D549C4CEF0;
 Fri, 29 Aug 2025 22:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756505962;
 bh=0bwPfbMyrek5L9hOu7GBREJXWyINw9aI7B0CsO+yy18=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NpneGQ3QoAZZMVPOqxAMTMsnXEod1MdR9ylvjRjnlUJ/5Mz3jdgYOeIgkfRKPhZ/U
 vShN87eLYGT8BEANkp63jXP/WsDTW3PU0xitnIZmnudm3QKOtQPPDMN6lDjVT1DMy6
 XFRyCvB6YJQmelc7Wn3BJtfB7gPtsENP28OUr9nZgR3Z3uJVJ4N4zjTqq2R/gAAsif
 WTFcvK4iQOHAl7e/mRAw01njvP6SR0PeP/vp9kcpLKktQGVHBqKVQ45BB3W4Cv3bfY
 SvtEaHF5gGrpETbJNljug4x3qCKcghxgOt/gZHQtCpaow0R9q2yCiFsgb9Uaue3SoT
 1eYuRWMtynFfw==
From: Mark Brown <broonie@kernel.org>
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
 Linux Sound <linux-sound@vger.kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
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
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 tytso@mit.edu, Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Andrew Lunn <andrew@lunn.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexandru Ciobotaru <alcioa@amazon.com>, 
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Steve French <stfrench@microsoft.com>, 
 Meetakshi Setiya <msetiya@microsoft.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Bart Van Assche <bvanassche@acm.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
Subject: Re: (subset) [PATCH 00/14] Internalize www.kernel.org/doc
 cross-reference
Message-Id: <175650594072.395832.3911302052314725751.b4-ty@kernel.org>
Date: Fri, 29 Aug 2025 23:19:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a
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

On Fri, 29 Aug 2025 14:55:10 +0700, Bagas Sanjaya wrote:
> Cross-references to other docs (so-called internal links) are typically
> done following Documentation/doc-guide/sphinx.rst: either simply
> write the target docs (preferred) or use :doc: or :ref: reST directives
> (for use-cases like having anchor text or cross-referencing sections).
> In some places, however, links to https://www.kernel.org/doc
> are used instead (outgoing, external links), owing inconsistency as
> these requires Internet connection only to see docs that otherwise
> can be accessed locally (after building with ``make htmldocs``).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[12/14] ASoC: doc: Internally link to Writing an ALSA Driver docs
        commit: f522da9ab56c96db8703b2ea0f09be7cdc3bffeb

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

