Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6942DBD13
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7011689E3B;
	Wed, 16 Dec 2020 08:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A7E89B0C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 23:53:40 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id w3so21173328otp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uqhKWB+COb7J4nLUa9kt0YMVg4NJwXlGmC+K/vo4ZfQ=;
 b=ubLg8ItyDYFPqJktSEKH3nGYE65up5uazhqS9I+s76Pow5dZV4rnSLrN1JeAXG39kp
 niJJUkenbf0JwWqINmjn5R8wVYzq2fREcUAHCMKOshqquWtZNwRxpZEbhSAoPSuCcJCg
 nFpxoM9IRMIHtga+Nv4cq6vg4Cp1Qaj0qHhMY3g67IlQcC62nTi40daqk2WlfoJRCAxn
 uCgreHkFRpNNOnfALpM3+EPJzo7p0H4ijvswxK/6RyoqkQXm7n3DkvMCY5yJEJC2+SIf
 rzkBvBGV6zzhGw+j1iPrtOUOph7tG4GpukKA5GdzylKmV5Mv2IXwRKJrfBsyEsitJcAk
 jenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uqhKWB+COb7J4nLUa9kt0YMVg4NJwXlGmC+K/vo4ZfQ=;
 b=Mb7vn9KBBtEuHFvPfapnGNg9Jm0NPn5Vix3SOnK/njeUmE3mSo9Esmc9PVhTgpuqer
 CP/Auva8mvBBnNk888O/q33MkCxBK2+f/RL4JqCdYIR6iYrNdijQ55zTUU1Vmd5LOhIv
 898CWMxZXagDYWpDPMXOvk/TFWpM89C9GBGp8k9VWQLzy4gaz5GaXrattyRLiwH6Bxuw
 c35oNYcRB3DiwGAdzMMoC13ZqLeEeZ15yq5/nKbg8A//rNv7+f1l1XG/jbeD3/O/gkhj
 gn1Hqw4n1osg5BO5RZsmy3B9sacSIFfdQxwRjfGBAmQOAYu3G6hzuDPA5LRc8K9ZjE+Z
 B8bA==
X-Gm-Message-State: AOAM531WJZKNGUJQUd3aLz59k2MfuralOEH+MwwT23PiL83LsMo3EMtt
 joc8DTLj39YTnv3idiOTW5k=
X-Google-Smtp-Source: ABdhPJw7yGtGW+iN1w6tchLENRNZtU87psOBq50NXtp7tKwu0+eM41EhXJj0K8bT+ZTjjymoAM0qww==
X-Received: by 2002:a9d:6d08:: with SMTP id o8mr15786851otp.334.1608076416728; 
 Tue, 15 Dec 2020 15:53:36 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m81sm16202oib.37.2020.12.15.15.53.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Dec 2020 15:53:35 -0800 (PST)
Date: Tue, 15 Dec 2020 15:53:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v7 2/5] dma-buf: heaps: Move heap-helper logic into the
 cma_heap implementation
Message-ID: <20201215235334.GA227480@roeck-us.net>
References: <20201121235002.69945-1-john.stultz@linaro.org>
 <20201121235002.69945-3-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201121235002.69945-3-john.stultz@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 21, 2020 at 11:49:59PM +0000, John Stultz wrote:
> Since the heap-helpers logic ended up not being as generic as
> hoped, move the heap-helpers dma_buf_ops implementations into
> the cma_heap directly.
> 
> This will allow us to remove the heap_helpers code in a following
> patch.
> 

mips:allmodconfig:

drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_do_vmap':
drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'

Bisect log attached.

Guenter

---
# bad: [9317f948b0b188b8d2fded75957e6d42c460df1b] Add linux-next specific files for 20201215
# good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
git bisect start 'HEAD' 'v5.10'
# good: [8357e709304f1791b390c34f63cd00cb434a9ea9] Merge remote-tracking branch 'pm/linux-next'
git bisect good 8357e709304f1791b390c34f63cd00cb434a9ea9
# bad: [e43c4376b37c58a054444fe2f512aebfc7362306] Merge remote-tracking branch 'tomoyo/master'
git bisect bad e43c4376b37c58a054444fe2f512aebfc7362306
# good: [6f2d5cf9756dab190e79edd4ec098c81dca6743c] net: stmmac: simplify the return dwmac5_rxp_disable()
git bisect good 6f2d5cf9756dab190e79edd4ec098c81dca6743c
# bad: [fef5fe5f601c5826083b81837800b8b99570bfb0] Merge remote-tracking branch 'drm-misc/for-linux-next'
git bisect bad fef5fe5f601c5826083b81837800b8b99570bfb0
# good: [5bb0c4b5eb61d939fed0b27d11fb91fb85769c9a] ice, xsk: Move Rx allocation out of while-loop
git bisect good 5bb0c4b5eb61d939fed0b27d11fb91fb85769c9a
# good: [b54139eb968d982bfd5f451a8d143f3f6cdd82cf] Merge remote-tracking branch 'mtd/mtd/next'
git bisect good b54139eb968d982bfd5f451a8d143f3f6cdd82cf
# good: [f42a3d780d2ff7a122b089460f4bfbe402b4e27e] Merge remote-tracking branch 'amdgpu/drm-next'
git bisect good f42a3d780d2ff7a122b089460f4bfbe402b4e27e
# good: [3a9ec563a4ff770ae647f6ee539810f1866866c9] drm/i915/icl: Fix initing the DSI DSC power refcount during HW readout
git bisect good 3a9ec563a4ff770ae647f6ee539810f1866866c9
# bad: [2c3a1e49696fd05b52ec5eeb7c006ac32724c915] video: fbdev: lxfb_ops: Fix fall-through warnings for Clang
git bisect bad 2c3a1e49696fd05b52ec5eeb7c006ac32724c915
# good: [2ac5ef3b23629e9740000948c48f4141bacb5abb] drm: document drm_mode_get_connector
git bisect good 2ac5ef3b23629e9740000948c48f4141bacb5abb
# good: [2b6cb81b95d1e8abfb6d32cf194a5bd2992c315c] drm/meson: dw-hdmi: Enable the iahb clock early enough
git bisect good 2b6cb81b95d1e8abfb6d32cf194a5bd2992c315c
# bad: [4c68e499bb9d6d9ec3e18fcb2f68641abb22464a] dma-buf: heaps: Skip sync if not mapped
git bisect bad 4c68e499bb9d6d9ec3e18fcb2f68641abb22464a
# bad: [a5d2d29e24be8967ef78a1b1fb2292413e3b3df9] dma-buf: heaps: Move heap-helper logic into the cma_heap implementation
git bisect bad a5d2d29e24be8967ef78a1b1fb2292413e3b3df9
# good: [3812957587923ca325308ed9c4a5be5ca935e903] dma-buf: system_heap: Rework system heap to use sgtables instead of pagelists
git bisect good 3812957587923ca325308ed9c4a5be5ca935e903
# first bad commit: [a5d2d29e24be8967ef78a1b1fb2292413e3b3df9] dma-buf: heaps: Move heap-helper logic into the cma_heap implementation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
