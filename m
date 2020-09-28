Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A2127BDAE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DAD89E36;
	Tue, 29 Sep 2020 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A206C89DC0;
 Mon, 28 Sep 2020 10:18:11 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80945763;
 Mon, 28 Sep 2020 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/cDJPA+uVkTExsxg1g0sjxHghPU=; b=cQtCvm
 ir5ZdM6+FYUD9nu/iMN6JHl039WOp3CjGv97mkA7B//1xGoUo4LHceBe20quyhiZ
 j6facUcGMe5ThikkqrYcju3xmNxkztLPV0MurUjojmkRXp1nDm4JSpTDk42JXVfO
 mRBTvCXFOY2qokfBcWkaPpPJEcmDu06CsYxKzeygL/3aUfM13p+4K9+39gqtqjtq
 zsByCtOp2INQztRuHZVM6U7uNF8y+Zh1iqB4Jmm0OASQIAfgJ0ozJzv3WyshT4Zb
 sQmNL/2jT1KwzN5nIkAM6XgU0ksKqBn2AHygvGTOFB6OdGs4ELzDh72A7lQZ765R
 X1FPBPzIyGEcR8Nw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6cd6121a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 28 Sep 2020 09:46:43 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id q5so654809ilj.1;
 Mon, 28 Sep 2020 03:18:10 -0700 (PDT)
X-Gm-Message-State: AOAM532ltypM22Lgd2SN/imdPq6+lYcmpgWWH2YNzYEqy84XbsYA9hZc
 xoXeSJAK7WiKBdV2SBLhLx0WDuVm9GBFvnDqzX4=
X-Google-Smtp-Source: ABdhPJxwCebYVRZYRiOo5Ycu/i+iis87iyV5mmfF9PYcRsC9zNKzgWrCiZDzI1BqWrOozXl//DLKVSXT/VozZAmU2m0=
X-Received: by 2002:a05:6e02:6d0:: with SMTP id
 p16mr491957ils.64.1601288289457; 
 Mon, 28 Sep 2020 03:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9odvKzyAG7HgzSE-1gLOfiU=HL1MB5w4z=AwOsjz9WJPA@mail.gmail.com>
 <CAHmME9qPo_MNrVioY=qgOVNxYBVY1_i_eep5wzP-7Akq5fH1Xg@mail.gmail.com>
In-Reply-To: <CAHmME9qPo_MNrVioY=qgOVNxYBVY1_i_eep5wzP-7Akq5fH1Xg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 28 Sep 2020 12:17:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9qBtUuOSEU3Cb9rL7SHaBAwk862VEPdmYcisnSHDERtvQ@mail.gmail.com>
Message-ID: <CAHmME9qBtUuOSEU3Cb9rL7SHaBAwk862VEPdmYcisnSHDERtvQ@mail.gmail.com>
Subject: Re: 5.9-rc7 null ptr deref in __i915_gem_userptr_get_pages_worker
To: Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Linux-MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alright, the failing code seems to be in mm:

        if (flags & FOLL_PIN)
                atomic_set(&current->mm->has_pinned, 1);

Apparently you can't rely on current->mm being valid in this context;
it's null here, hence the +0x64 for has_pinned's offset.

This was added by 008cfe4418b3 ("mm: Introduce mm_struct.has_pinned"),
which is new for rc7 indeed.

The crash goes away when changing that to:

        if ((flags & FOLL_PIN) && current->mm)
                atomic_set(&current->mm->has_pinned, 1);

But I haven't really evaluated whether or not that's racy or if I need
to take locks to do such a thing.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
