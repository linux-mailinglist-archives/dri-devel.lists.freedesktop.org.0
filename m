Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6232210A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 22:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E916E20F;
	Mon, 22 Feb 2021 21:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7D6E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 21:00:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E071330D;
 Mon, 22 Feb 2021 20:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E071330D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614027599; bh=uCB8Hgwaf+lNKimvvf9tQZlF3BSKiETK4qc1TCmNd18=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kaLWH++b7x3gCrgO2e97h3hLmlCS2bCHXpPcqHTC+hnEzOydtFi8uY/7v+2LWBasy
 pdgY7Fb64JtnogF65eqEMN3Mx+9pET01gn9DJcnVq35LXQbyUQjfQxXn1Ln8uBE7RY
 MAp1cqnosIyyk2i9je2TBYgWDQqONHmIcw/X6Sk4cGsFvyYVQ30FfIusZpAh8OrcZs
 PeF67BflaU6Ps8dy7N5z5gKebLYMe3sJdFfJZjYXM1quJJFlvFMJY7Nxddu58eO7aA
 48QwTHKExhb617tMl3FuQ95PbBD9Ez2Sl3KF1X1gLjpw19id92bgMjgF6XQdh42cQ7
 eJniFyeQRAmZA==
From: Jonathan Corbet <corbet@lwn.net>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: use KCFLAGS instead of EXTRA_CFLAGS to pass flags
 from command line
In-Reply-To: <20210221152524.197693-1-masahiroy@kernel.org>
References: <20210221152524.197693-1-masahiroy@kernel.org>
Date: Mon, 22 Feb 2021 13:59:58 -0700
Message-ID: <87h7m3lsxd.fsf@meer.lwn.net>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Harry Wei <harryxiyou@gmail.com>,
 dri-devel@lists.freedesktop.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Alex Shi <alex.shi@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Masahiro Yamada <masahiroy@kernel.org> writes:

> You should use KCFLAGS to pass additional compiler flags from the
> command line. Using EXTRA_CFLAGS is wrong.
>
> EXTRA_CFLAGS is supposed to specify flags applied only to the current
> Makefile (and now deprecated in favor of ccflags-y).
>
> It is still used in arch/mips/kvm/Makefile (and possibly in external
> modules too). Passing EXTRA_CFLAGS from the command line overwrites
> it and breaks the build.
>
> I also fixed drivers/gpu/drm/tilcdc/Makefile because commit 816175dd1fd7
> ("drivers/gpu/drm/tilcdc: Makefile, only -Werror when no -W* in
> EXTRA_CFLAGS") was based on the same misunderstanding.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Documentation/process/4.Coding.rst                            | 2 +-
>  Documentation/process/submit-checklist.rst                    | 2 +-
>  Documentation/translations/it_IT/process/4.Coding.rst         | 2 +-
>  Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_CN/process/4.Coding.rst         | 2 +-
>  drivers/gpu/drm/tilcdc/Makefile                               | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

I've applied this, fixing the conflict with submit-checklist.rst in the
process.

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
