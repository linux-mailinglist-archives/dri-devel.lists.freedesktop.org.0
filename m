Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BC18558E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 12:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAE26E149;
	Sat, 14 Mar 2020 11:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7C56E149;
 Sat, 14 Mar 2020 11:03:04 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b21so4912628edy.9;
 Sat, 14 Mar 2020 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HXvNDpxcelYwn8PoDas8bnx/K7bC0ycG2928PB68YGs=;
 b=HMg+8Lmt9yc6CZsDTwQ4OiCPaRg0d1bBQ0eUJvp4Lun4FlVhuppRe6/pPCkY0tDnxf
 9/v73KT0EPoWwqqP+PHekCIGhjaM/hcxU7GCkryRt/z1/Zp5GyscJW3/qK4DSUPWWJw+
 kor/OA6cCnHSVoXyV5becg3wIY1iV7E7GCdzl62588XVQ4nwg7oBN5S5+LmK3cVyTFHg
 5A4GsTHp4eKM5LBTMybMPJE7SlQzqIDrUYbok0qQU1sCF02mlcjgvRW29qbfZKh/vXmj
 DV4PmHHwYUnaUPn6UOheBW6iA8y2QcFQkwArc7ub0IudM04Nm18RnkOOClHt7XPjjqJt
 apsg==
X-Gm-Message-State: ANhLgQ2lEFRqxfUGu0FtQAcE4BmD/GamPthIYlWrIzR/BwmX0WsWp3q8
 EOkm5EqANq60xKnnPd05/HM=
X-Google-Smtp-Source: ADFU+vv8nT7z/vEu1bvfu6+AMeellIORI/K4LaHKfZcEsgQyhBKLzYnFTNlP0g88C9JmPdb6eGvarg==
X-Received: by 2002:a17:907:429c:: with SMTP id
 ny20mr14725961ejb.278.1584183783358; 
 Sat, 14 Mar 2020 04:03:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id 94sm2657013eda.7.2020.03.14.04.03.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 04:03:02 -0700 (PDT)
Date: Sat, 14 Mar 2020 12:02:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH v2 1/9] iomap: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200314110258.GA16135@kozik-lap>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219175007.13627-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, linux-alpha@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 06:49:59PM +0100, Krzysztof Kozlowski wrote:
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

This patch touches multipel file systems so no one is brave enough to
pick it up. However you are mentioned as maintainer of generic asm
headers so maybe you could apply it to arm-soc?

Best regards,
Krzysztof


> 
> ---
> 
> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,
> 3. Add Geert's review.
> 4. Add Arnd's review.
> ---
>  arch/alpha/include/asm/core_apecs.h   |  6 +--
>  arch/alpha/include/asm/core_cia.h     |  6 +--
>  arch/alpha/include/asm/core_lca.h     |  6 +--
>  arch/alpha/include/asm/core_marvel.h  |  4 +-
>  arch/alpha/include/asm/core_mcpcia.h  |  6 +--
>  arch/alpha/include/asm/core_t2.h      |  2 +-
>  arch/alpha/include/asm/io.h           | 12 ++---
>  arch/alpha/include/asm/io_trivial.h   | 16 +++---
>  arch/alpha/include/asm/jensen.h       |  2 +-
>  arch/alpha/include/asm/machvec.h      |  6 +--
>  arch/alpha/kernel/core_marvel.c       |  2 +-
>  arch/alpha/kernel/io.c                | 12 ++---
>  arch/parisc/include/asm/io.h          |  4 +-
>  arch/parisc/lib/iomap.c               | 72 +++++++++++++--------------
>  arch/powerpc/kernel/iomap.c           | 28 +++++------
>  arch/sh/kernel/iomap.c                | 22 ++++----
>  include/asm-generic/iomap.h           | 28 +++++------
>  include/linux/io-64-nonatomic-hi-lo.h |  4 +-
>  include/linux/io-64-nonatomic-lo-hi.h |  4 +-
>  lib/iomap.c                           | 30 +++++------
>  20 files changed, 136 insertions(+), 136 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
