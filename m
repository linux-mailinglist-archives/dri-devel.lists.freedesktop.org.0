Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DAB3DAA5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13610E38F;
	Mon,  1 Sep 2025 07:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i7heKHiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C2110E029
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 20:46:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8645643FD7;
 Sat, 30 Aug 2025 20:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF130C4CEEB;
 Sat, 30 Aug 2025 20:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756586804;
 bh=N1RyWuUPncwemkQz+wtBxmmLRK1pbPwPhqaSXQEgACo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i7heKHiF1WEcWegbUMD1XKbmetMnNnCnljRU/sfGxpB5c3sZchsdHRdnTVLky717F
 dDeCNXpev8o9LRk1S9eXnS8o8kWvMacaFziEO6OdWtswKvTxZQ5pU4eCd2WUx5BQCO
 14bLFP5QVji02AMa5CJyqW/en6PTbHSnZ78vGj75ZZT/RVMFCiYHRoYXRol8qlqKgn
 3lrkJ1IYbZBkwoMZse44FP62uqEzr0WjQEZOzoSJLrIrlje9NRgPYVERWMHuVkMn2k
 2QurVWFt7IIr5AR3ahUSN1uV7FUBrHkmiXJe15aj9LzSrsbpHevBdir8lYlUv2SDdP
 83zxdoGwMwcyQ==
Date: Sat, 30 Aug 2025 22:46:22 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux
 Documentation <linux-doc@vger.kernel.org>, Linux DAMON
 <damon@lists.linux.dev>, Linux Memory Management List <linux-mm@kvack.org>,
 Linux Power Management <linux-pm@vger.kernel.org>, Linux Block Devices
 <linux-block@vger.kernel.org>, Linux BPF <bpf@vger.kernel.org>, Linux
 Kernel Workflows <workflows@vger.kernel.org>, Linux KASAN
 <kasan-dev@googlegroups.com>, Linux Devicetree
 <devicetree@vger.kernel.org>, Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Kernel Build System
 <linux-lbuild@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra
 <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Huang Rui
 <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
 Richard Weinberger <richard@nod.at>, Zhihao Cheng
 <chengzhihao1@huawei.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long
 <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon
 <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Andrew Lunn
 <andrew@lunn.ch>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>, The AWS Nitro
 Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steve French <stfrench@microsoft.com>, Meetakshi Setiya
 <msetiya@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche
 <bvanassche@acm.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 12/14] ASoC: doc: Internally link to Writing an ALSA
 Driver docs
Message-ID: <20250830224614.6a124f82@foz.lan>
In-Reply-To: <20250829075524.45635-13-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
 <20250829075524.45635-13-bagasdotme@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Fri, 29 Aug 2025 14:55:22 +0700
Bagas Sanjaya <bagasdotme@gmail.com> escreveu:

> ASoC codec and platform driver docs contain reference to writing ALSA
> driver docs, as an external link. Use :doc: directive for the job
> instead.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/sound/soc/codec.rst    | 4 ++--
>  Documentation/sound/soc/platform.rst | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/sound/soc/codec.rst b/Documentation/sound/soc/codec.rst
> index af973c4cac9309..b9d87a4f929b5d 100644
> --- a/Documentation/sound/soc/codec.rst
> +++ b/Documentation/sound/soc/codec.rst
> @@ -131,8 +131,8 @@ The codec driver also supports the following ALSA PCM operations:-
>  	int (*prepare)(struct snd_pcm_substream *);
>    };
>  
> -Please refer to the ALSA driver PCM documentation for details.
> -https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
> +Please refer to the :doc:`ALSA driver PCM documentation
> +<../kernel-api/writing-an-alsa-driver>` for details.
>  
>  
>  DAPM description
> diff --git a/Documentation/sound/soc/platform.rst b/Documentation/sound/soc/platform.rst
> index 7036630eaf016c..bd21d0a4dd9b0b 100644
> --- a/Documentation/sound/soc/platform.rst
> +++ b/Documentation/sound/soc/platform.rst
> @@ -45,8 +45,8 @@ snd_soc_component_driver:-
>  	...
>    };
>  
> -Please refer to the ALSA driver documentation for details of audio DMA.
> -https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
> +Please refer to the :doc:`ALSA driver documentation
> +<../kernel-api/writing-an-alsa-driver>` for details of audio DMA.

Don't use relative paths for :doc:. They don't work well, specially
when one uses SPHINXDIRS.

The best is o use Documentation/kernel-api/writing-an-alsa-driver.rst
and let automarkup figure it out. As we have a checker, broken
references generate warnings at build time.

Regards,
Mauro
