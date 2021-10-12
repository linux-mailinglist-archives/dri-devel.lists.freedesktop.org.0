Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642D429B26
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 03:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347D6E5BD;
	Tue, 12 Oct 2021 01:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61E66E5BD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 01:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634003322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OE4BpcPUL/+4NL3fF1YxxjxaT7QzlRidmwL0xj0Wr5s=;
 b=XiU/H8A0gOjBjUljkTniEC/lPx2Y1bgZPyg63oTPI2TsBEI4ST9iaGtfgNSmcGRI/Igr04
 LfJaQvT+s6VtzhiybqJyR4Lk9gC5/yeDCBGhT8xelHOc6y47YpBm0/WmdexhGNnAQMub4n
 6By4JxEIq56ZLGWJNg2RUeMpYBc45Bs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-s-zlm5ZINJmOIzoTQeJjHg-1; Mon, 11 Oct 2021 21:48:36 -0400
X-MC-Unique: s-zlm5ZINJmOIzoTQeJjHg-1
Received: by mail-oo1-f69.google.com with SMTP id
 b19-20020a4a3413000000b002b6d6a9dff5so4689325ooa.14
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 18:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OE4BpcPUL/+4NL3fF1YxxjxaT7QzlRidmwL0xj0Wr5s=;
 b=WDS7ZAx3psX6XylvelZOHcvB87DjW294Qo4Y2UGFL5qOg7Dv3WgVVBxNJq4j9jwoGQ
 zcG3XchhQ5FurrDFNdTcakcWJ2HfGFpZjJ6IdaOuie7j1Q+PWPx5EcCv+zRnvp6gCGxb
 xW4wGsPbtzZvECF3LLDKnDa2QGsuQfqyuL3yLLCUjgdRRMf5+faSuVXnaMA51f5bXPZR
 9EGvV7DeOP0x7okAWGy9k2HXEUdxsm7NTLoDtWaI9zCOIIN7KAjSj6bRDZUoo7Hazrwn
 FI/kAKQdwqioLMs4NoGSci2/aTi/qQYOTapoai94t+JjLxEbwJ3JxfpBTfE4Z9myzlRw
 lU+A==
X-Gm-Message-State: AOAM530pWPbwN+J33fuh/Lq6D8bAC3WEv8jh7vgfz8/rFhhD/D9oQEda
 it7ykPWNDPYBH+7qh5dAeXwIfsTJ6tRvMHKkSYSM0InEJVODVr38m2kMZ7AfPPks/ff3VJmHP20
 6fPuNNQy4hWwNaX0ycWM58zcRBqTPLgKDl4xbV7CcoRbj
X-Received: by 2002:a9d:189:: with SMTP id e9mr23685533ote.243.1634003316180; 
 Mon, 11 Oct 2021 18:48:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0wjmU6qu0OKfix9B+u70tXguRr1Ws9yRlyrxW9wd6RRK26qY3EuemBKrlvcwkNxO1V6S7eHXRLoRLEwGkDBU=
X-Received: by 2002:a9d:189:: with SMTP id e9mr23685522ote.243.1634003315958; 
 Mon, 11 Oct 2021 18:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <0f7871be-9ca6-5ae4-3a40-5db9a8fb2365@amd.com>
 <a6d2d16c-173f-d49b-ec54-defd6be2bb0c@amd.com>
In-Reply-To: <a6d2d16c-173f-d49b-ec54-defd6be2bb0c@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 12 Oct 2021 11:48:24 +1000
Message-ID: <CAMwc25o9wSPd4PgS56j7GApcFYE=ZY9LHpiFvtE6RVgdQKzBFA@mail.gmail.com>
Subject: Re: BUG: KASAN: use-after-free in enqueue_timer+0x4f/0x1e0
To: Kim Phillips <kim.phillips@amd.com>
Cc: Ainux <ainux.wang@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 airlied <airlied@linux.ie>, "Vetter, Daniel" <daniel@ffwll.ch>,
 sterlingteng@gmail.com, 
 chenhuacai@kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Tue, Oct 12, 2021 at 2:07 AM Kim Phillips <kim.phillips@amd.com> wrote:
>
> Hi,
>
> On 10/5/21 1:10 PM, Kim Phillips wrote:
> > Hi, I occasionally see the below trace with Linus' master on an
> > AMD Milan system:
> >
> > [   25.657322] BUG: kernel NULL pointer dereference, address: 0000000000000000
> > [   25.665097] #PF: supervisor instruction fetch in kernel mode
> > [   25.671448] #PF: error_code(0x0010) - not-present page
> <snip>
> > That bisection led to this commit:
> >
> > commit aae74ff9caa8de9a45ae2e46068c417817392a26
> > Author: Ainux <ainux.wang@gmail.com>
> > Date:   Wed May 26 19:15:15 2021 +0800
> >      drm/ast: Add detect function support
> <snip>
> > I confirmed that if I revert it from v5.15-rc4 (after reverting
> > its dependent 572994bf18ff "drm/ast: Zero is missing in detect
> > function"), the problem goes away.
> >
> > Full .config, dmesg attached.
> >
> > I can test any possible fixes...
>
>
> Ping - if no fixes are in the works, can the offending commit(s)
> be reverted?

tzimmermann?

Dave.

