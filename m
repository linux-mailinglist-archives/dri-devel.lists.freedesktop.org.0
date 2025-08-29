Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A7B3DA9F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DAD10E389;
	Mon,  1 Sep 2025 07:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBFHYsZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38DB10EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756469932; x=1788005932;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lmOaDJrWsALHNdIkFkPEn+1/tHhvy8ASz+0CpcTOxMQ=;
 b=nBFHYsZiR4JIQfBW2C07r10Tzqbw+7dnjZvy5SFejdWcvdj/u/zvAJhX
 H/IxgtnZvvx4PPqF7ustphlfl/PHeOFQQn97OX0mJy6QCM4aAzecROy0u
 mvJyNR7NoSJ1ryLS9PUmIyhDIdbQJULpv7Jt3pk8Qz6SVzTIZyL35ZCOQ
 2Eqa1723BObm+EBnTTNzenSaBOBlN3Gp3Vh9mKITuP9+P78P9y7P0ilaC
 0YRUfVq7jXwpkoJ2BE6YC/0RUcKsLLXGSQJ9Gnnh8UJFyeCeoLedbiAlI
 G2zi8d01a8cVC1GcfRPozxTroKRNTb9P7bKoNbnlqWAEB+eNCJ2Fu9XCV g==;
X-CSE-ConnectionGUID: if1wBF5wT9yWKtjkgksBvg==
X-CSE-MsgGUID: WL6XDoFuR6iDWGWOK5fwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58603806"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58603806"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 05:18:51 -0700
X-CSE-ConnectionGUID: FceyOGKfTMK8J/ArNXLz6w==
X-CSE-MsgGUID: nahg4MG6QSGDgmwgF/j0Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170753940"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 05:18:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux DAMON <damon@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Linux Power Management
 <linux-pm@vger.kernel.org>, Linux Block Devices
 <linux-block@vger.kernel.org>, Linux BPF <bpf@vger.kernel.org>, Linux
 Kernel Workflows <workflows@vger.kernel.org>, Linux KASAN
 <kasan-dev@googlegroups.com>, Linux Devicetree
 <devicetree@vger.kernel.org>, Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Kernel Build System
 <linux-lbuild@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy"
 <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
 Richard Weinberger <richard@nod.at>, Zhihao Cheng
 <chengzhihao1@huawei.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long
 <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David
 Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Andrew
 Lunn <andrew@lunn.ch>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>, The AWS Nitro
 Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, Jesper Dangaard
 Brouer <hawk@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Steve French
 <stfrench@microsoft.com>, Meetakshi Setiya <msetiya@microsoft.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH 00/14] Internalize www.kernel.org/doc cross-reference
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250829075524.45635-1-bagasdotme@gmail.com>
Date: Fri, 29 Aug 2025 15:18:20 +0300
Message-ID: <437912a24e94673c2355a2b7b50c3c4b6f68fcc6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 29 Aug 2025, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> Cross-references to other docs (so-called internal links) are typically
> done following Documentation/doc-guide/sphinx.rst: either simply
> write the target docs (preferred) or use :doc: or :ref: reST directives
> (for use-cases like having anchor text or cross-referencing sections).
> In some places, however, links to https://www.kernel.org/doc
> are used instead (outgoing, external links), owing inconsistency as
> these requires Internet connection only to see docs that otherwise
> can be accessed locally (after building with ``make htmldocs``).
>
> Convert such external links to internal links. Note that this does not
> cover docs.kernel.org links nor touching Documentation/tools (as
> docs containing external links are in manpages).

FWIW, I'd much prefer using :ref: on rst anchors (that automatically
pick the link text from the target heading) instead of manually adding
link texts and file references.

i.e.

.. _some_target:

Heading After Some Target
=========================

See :ref:`some_target`.

Will generate "See Heading After Some Target".


BR,
Jani.


-- 
Jani Nikula, Intel
