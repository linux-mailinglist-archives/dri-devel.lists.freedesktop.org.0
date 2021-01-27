Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73BF305605
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7852A6E7D0;
	Wed, 27 Jan 2021 08:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43746E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:44:16 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id h6so1388141oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 00:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mutFHLc1gkkZrR4Fer8oAQQ0VCNtXv8me5nxm8JFG6o=;
 b=BlaxW3dnRe2ZPJeJZmhXzGhi9JgwBOZo1EFtuJ2DJw+tSiegtpmxeCAV9U5jZktoNj
 QUDioAtZHA9GDRrCY1fIoymKKd6WP7vbl9JxZ29uWGVJUdCxCE3qwpEIC7+49f5Jmy/v
 LEVlk3E4bMSfItdyCUnucYFj8TyHlPvJ73xM1bkbTG4a6GkG+ArWrw4buu+qlFR12hkL
 GZ4HJDCiXMJH5lQ5uxvUhmq01EWIxphxHTkESoONnoaugE/HPBmJljnX81qtkIuiRLps
 RMuQ0XijZO6BfbIbDVKcux+w5Y4+jyPB/ybKlJJ1+t2wrhrBpEFAIFJCaE2SKGqC7K/Y
 R+Kg==
X-Gm-Message-State: AOAM533UInvaIpXqFdlFlhSkFRqqrwwYygNNA9vC7SRk0pMeNrHlXD5Y
 ywZ3DKqYpC+m6foFwjDvGJVEA9qH6S3Uq4Zq2VM=
X-Google-Smtp-Source: ABdhPJyRilKemvCJEv7600MUD7rrw3Vm6t3WWaVeIyKZk2WvWyk7vpQeeMYS1vDHeon2cuMn7KqlF1medC/JKjRyBlE=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2448439oiy.148.1611737056266; 
 Wed, 27 Jan 2021 00:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20210126182113.19892-1-david@redhat.com>
 <20210126182113.19892-2-david@redhat.com>
In-Reply-To: <20210126182113.19892-2-david@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jan 2021 09:44:05 +0100
Message-ID: <CAMuHMdVp=K6UpR_BfrJjiFEJgQt4nC7n35M8O+Wr2kSqfeERxQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] video: fbdev: acornfb: remove free_unused_pages()
To: David Hildenbrand <david@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 11:54 PM David Hildenbrand <david@redhat.com> wrote:
> This function is never used and it is one of the last remaining user of
> __free_reserved_page(). Let's just drop it.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Fixes: ffd29195ed720188 ("drivers/video/acornfb.c: remove dead code")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
