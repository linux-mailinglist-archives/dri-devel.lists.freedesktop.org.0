Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577283DF6F9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 23:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4136E05C;
	Tue,  3 Aug 2021 21:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6350F6E05C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 21:39:56 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id b133so967525ybg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eH7F2c4Hn9egywDlY45TqR5QW7h6BJhJpVKajFn/Dvg=;
 b=frGpZAuU0TNGycNOUwSntnWTwUNXJjKhM/djmFxpOw4RLjxj4ZIMH/kWc6KmsJtmzd
 5DZZF1XvLkwEjfV0d1g/+qd7fYu4p3IcXqxRh2+j2cEJmx1zwJZD59Hk+1HpT49HtK7X
 Uqge3z5MMAj3GqdriP0bGY+4uxvfDwPHI/8AUaTv/dYUqCfItsy4CzgGG4YcVxQ2W+3k
 8yFws8bfEWrZyIXSyrNOM13JM5LbYjDmUdpWEgK5q3XHMwmDZUH16Fn3Lcmdkk1kJ+tR
 5f+ICl8eIJ74PX6+7FzayWfSiwsOc3t/1lDkBGqzyqADZbXQ5H4FBtmOqjk757mpLOmy
 DCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eH7F2c4Hn9egywDlY45TqR5QW7h6BJhJpVKajFn/Dvg=;
 b=Owh7LnxiEMw3b5AwSRS8RWKaobYopwTWtOBtx04pisg4M+OKUhJsHnFQwPtCO3Dn0p
 3rdzV5cIpRvJMk/g+CN6JqZyoBxYvw83WAiv6/w2ODkfa7O1ZyjoTn/qhB6Etlh0nul4
 OsyzNKTqFHM2Grgf9FxzYqbeYn7Z91wC9/GncGF18RiMXXOsx8kK8DDqIIrQly2QvKeJ
 IHX3y1QJnW1hjTLrmzzVA5YIrach7WGo2HdxDGsbyzG2BIj3p/Un6YAH6sjU+X9J9dla
 0s8ODXJRQUS84ROTrE7k/eTECUueqNupgdeEaHMmnZ690ZVvxpBzajrv4e2w8+TDsl7q
 kCvw==
X-Gm-Message-State: AOAM532A3IST9JRder4uhr0vVNtqePWZ3Sold38FCcVqaDH9BllowrdO
 T1YEcoQcRYAq04Ly+SSwUMb/W0WKzMjKIA+n3OEEkw==
X-Google-Smtp-Source: ABdhPJynfd6Tp5fx5X/8PoqmW8udIcLQViQbJXvKzToG91Bonke+UV5rO2Ua9gr8hn4ZJodP/4n3mFpQcnCzz5bXHoo=
X-Received: by 2002:a25:cac7:: with SMTP id
 a190mr14975276ybg.290.1628026795438; 
 Tue, 03 Aug 2021 14:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com>
 <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
In-Reply-To: <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Tue, 3 Aug 2021 14:39:19 -0700
Message-ID: <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To: John Stultz <john.stultz@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com> wrote:
> > This patch limits the size of total memory that can be requested in a
> > single allocation from the system heap. This would prevent a
> > buggy/malicious client from depleting system memory by requesting for an
> > extremely large allocation which might destabilize the system.
> >
> > The limit is set to half the size of the device's total RAM which is the
> > same as what was set by the deprecated ION system heap.
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
>
> Seems sane to me, unless folks have better suggestions for allocation limits.
>
> Reviewed-by: John Stultz <john.stultz@linaro.org>

Thank you for taking a look John!

Regards,
Hridya

>
> thanks
> -john
