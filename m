Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385E3451E7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BFD6E5C0;
	Mon, 22 Mar 2021 21:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C4E6E5C0;
 Mon, 22 Mar 2021 21:40:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FC4B619AC;
 Mon, 22 Mar 2021 21:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616449204;
 bh=ZjEe7Re0RKu002ndI22T8BlfDJ+aY+HHY+t9XvQS7Q8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bJZCpZ5EEGZerp3UrSyvokIM6nH3GPNLIsyJMJB5nyc4Sgnjtzn+OMtjUL2ZBSie+
 Fi83eey5HsMSKc/9qaD2RuZEeUeUwoE2M6qwk7wrSCjkj4ws8OGv18z8EyYcukmWHT
 jM35+ir6/srZfSH78DCRwpRXtTCanNR0ouNRk+r0zZqC9uicwbh5Vl6qVN2J0nC7fg
 yAR8A/u0nDcj41ohiNdL688eDQ2opEHdctaDOmgytVvpFgfvzBz92vFYBp5Nn21+zL
 vtNIUbcaOAFjelvCYqZ6uXvufN0DecSq4tETddYi+zxgAsQXGrS7YO4xRruhTqWyYj
 CraMDT8xmXxbw==
Received: by mail-ot1-f41.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so17457943otn.10; 
 Mon, 22 Mar 2021 14:40:04 -0700 (PDT)
X-Gm-Message-State: AOAM532zauOn330rmstyJjRZDC6Zd1vYFft3xcNa3Uvo+gJF5uzye6PK
 a/uNspz6WkrmVDBGTvYxO/V/rEaSsBY1IsQgMR0=
X-Google-Smtp-Source: ABdhPJzNzw6/c6SVRTMWeDvzQfOYlqmnHJ7XZUtZKGXGAyd4E2bODGHMqyepsXMnLh1hlMatZvPmNE5xJdhqw6/8ZCE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr1561463otv.210.1616449203436;
 Mon, 22 Mar 2021 14:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
In-Reply-To: <20210322202958.GA1955909@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 22:39:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a10d8hgBiO5W=34oLqw8m22=Xi4C=MxVSY_fGnXZUJ3iA@mail.gmail.com>
Message-ID: <CAK8P3a10d8hgBiO5W=34oLqw8m22=Xi4C=MxVSY_fGnXZUJ3iA@mail.gmail.com>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
To: Ingo Molnar <mingo@kernel.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Borislav Petkov <bp@alien8.de>,
 Cgroups <cgroups@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Sebor <msebor@gcc.gnu.org>, Networking <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 9:29 PM Ingo Molnar <mingo@kernel.org> wrote:
> * Arnd Bergmann <arnd@kernel.org> wrote:
> > From: Arnd Bergmann <arnd@arndb.de>

> This is indeed rather ugly - and the other patch that removes a debug
> check seems counterproductive as well.
>
> Do we know how many genuine bugs -Wstringop-overread-warning has
> caught or is about to catch?
>
> I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
> until GCC-11 gets fixed?

See the [PATCH 0/11] message. The last two patches in the series are for
code that I suspect may be broken, the others are basically all false positives.

As gcc-11 is not released yet, I don't think we have to apply any of the
patches or disable the warning at the moment, but I posted all the patches
to get a better understanding on which of them should be addressed in
the kernel vs gcc.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
