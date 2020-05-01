Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECDE1C2416
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6276EDA9;
	Sat,  2 May 2020 08:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4536ECE7;
 Fri,  1 May 2020 21:55:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b79b7d6f;
 Fri, 1 May 2020 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=GBwk1frAmvPVyRR7LTO6C8+MPwQ=; b=FyD4yn
 lg5FFrDdIgRqTVyQvuCQd/D6b31eNZG4cR1WZKbuwF32UJbTtB/x2AqwZ5I5n4MV
 5bvz9LTBEX3Yen66cNtuT55VKbYvwcTzXuQpvbd41fhdtUs4mMCGVRmYaN1YDWeE
 xBBnnknz7WUQAzEcuPoYFdGYJ6+8NSNf++PFkb04Eic9CaXmVY8pCvBLDTwv2M9V
 AWBl8U4EuO2db51kl2qL2XJxVd96n/XO+gjoOFpMpgfki/kia3FL2GIZqbG7rKVJ
 P90laXF4vjMfMg/SEaqN7xWkk3sKhYTUqCkUgFYGMXmyqICkllPSbJqGJZbrT0pM
 1kjwQf1Dok2GOteQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 244e58b8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 1 May 2020 21:43:21 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id c2so6215221iow.7;
 Fri, 01 May 2020 14:55:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuafZxOzT6CHKqJTvcaU1o8fGs2u6DXnEt4h9ufUrGx36RXmPC7V
 VjFKHpsXaxf1HOvnJytlXcgKZeIhnC3bi5MUWBM=
X-Google-Smtp-Source: APiQypJtn0r3d2QBtiNDkHKo54/QKsvUWyvhMz7w+JkvaOeex9CkkeH4YNxWwVM/8W8LRE48ClMQgV+DndrosQN46FA=
X-Received: by 2002:a6b:7114:: with SMTP id q20mr5626475iog.79.1588370124889; 
 Fri, 01 May 2020 14:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200430221016.3866-1-Jason@zx2c4.com>
 <20200501180731.GA2485@infradead.org>
In-Reply-To: <20200501180731.GA2485@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 May 2020 15:55:14 -0600
X-Gmail-Original-Message-ID: <CAHmME9pDtoPOwMGZuFAyYyWpOs8cnVO8t3FeOTR+YTeKL6PETg@mail.gmail.com>
Message-ID: <CAHmME9pDtoPOwMGZuFAyYyWpOs8cnVO8t3FeOTR+YTeKL6PETg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: check to see if SIMD registers are available
 before using SIMD
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, stable <stable@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 12:07 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Apr 30, 2020 at 04:10:16PM -0600, Jason A. Donenfeld wrote:
> > Sometimes it's not okay to use SIMD registers, the conditions for which
> > have changed subtly from kernel release to kernel release. Usually the
> > pattern is to check for may_use_simd() and then fallback to using
> > something slower in the unlikely case SIMD registers aren't available.
> > So, this patch fixes up i915's accelerated memcpy routines to fallback
> > to boring memcpy if may_use_simd() is false.
>
> Err, why does i915 implements its own uncached memcpy instead of relying
> on core functionality to start with?

I was wondering the same. It sure does seem like this ought to be more
generalized functionality, with a name that represents the type of
transfer it's optimized for (wc or similar).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
