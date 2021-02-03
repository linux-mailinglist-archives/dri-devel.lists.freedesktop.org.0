Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28430D4EC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F516EA0C;
	Wed,  3 Feb 2021 08:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098FF6E25A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 02:26:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l12so22485254wry.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 18:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uc4Qty+5tEkUX3Oy4yRHsOTw3F10hKVAPg2EbH1/158=;
 b=RsYuDkkjXxaWE8kw/n+kzBzlYdKiQ17h3HXujdu00oj/DBl5tpK/+tbtqtVKSbg0aQ
 K84VvjMxpwhMsx9QCpdfEmalSWpry53eknjWVRW2ZtzszFvkGzuijhora5Zg0IN2hARc
 Q3e2sT6/kCvOu5hHd+6oMNslcg6fz/ukZdn2FY8IyekWHSUF3ILilPxAF7Du7kRomgjh
 mswhSMsTitGj64T88bkD4pR3RwXt96GMUQWWBeN9kJSeE4PLkcprxlugFDRXKHecP/ja
 SOnz509daLDVsJiZQM1E0gtyBcpH6wRBXbGA37hGcEUdrKdqqm74qYFIYAbGCsXlh5Dy
 Z1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uc4Qty+5tEkUX3Oy4yRHsOTw3F10hKVAPg2EbH1/158=;
 b=GQZ9IDtha+Q4YaXX6vHM5wKeXEOplyT5nyVUFrtfX7cwt/Hh2MhJEpm5alCHWKwTgD
 ksJ7zUoJ8wPar28mZON/Tn9jP6X8IomXWEb3jju1K8S6ERsx8AefP6nYQZLy+uxcsVeW
 c4/ku6g2FqpZP0SrLDcENdwxRo87PO5xSDdI7r9K5oe+9jTA7iehQafvMq9l9wqUq05w
 9v1R+x2X8uldVkDRlskKFB8PIgng1TmP3WNLhN4uH6gRBML3t7sCiv0dI4Qx5Ux4RN1O
 f8YbYIlpQhXRFsfDxsuuJV2yDFuanWC3rF5Xlx6y5vfQA/WPx7PacQEYA5R5FuY/rmxH
 zOhg==
X-Gm-Message-State: AOAM532MpMMH+tOn5W/zIgRtIHPpjVIgYLXoQ8Li7RvZUkc44ZsQH85d
 uJlo8N+pvPIgNINyc+kzhZBxKuzU5HXFND65GaghBw==
X-Google-Smtp-Source: ABdhPJy6fGFUBvfPcPkeOCTJpRJofvPTFjYyVYvrOMlWx5vJKlJpzyy3HdXZL3OGYGKpL/SuZw5CvuxZEEfSKXife4g=
X-Received: by 2002:a5d:453b:: with SMTP id j27mr930767wra.92.1612319193577;
 Tue, 02 Feb 2021 18:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
In-Reply-To: <20210203015553.GX308988@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Feb 2021 18:26:22 -0800
Message-ID: <CAJuCfpGUTBcEkdaF68hQhwRfHSgdv9+KF5MBZqA86rBYhzhFXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of
 an error
To: Matthew Wilcox <willy@infradead.org>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel-team <kernel-team@android.com>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>, Minchan Kim <minchan@kernel.org>,
 linux-mm <linux-mm@kvack.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 5:55 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > and get an indication of an error without panicing the kernel.
> > This will help identifying drivers that need to clear VM_PFNMAP before
> > using dmabuf system heap which is moving to use vm_insert_page.
>
> NACK.
>
> The system may not _panic_, but it is clearly now _broken_.  The device
> doesn't work, and so the system is useless.  You haven't really improved
> anything here.  Just bloated the kernel with yet another _ONCE variable
> that in a normal system will never ever ever be triggered.

We had a discussion in https://lore.kernel.org/patchwork/patch/1372409
about how some DRM drivers set up their VMAs with VM_PFNMAP before
mapping them. We want to use vm_insert_page instead of remap_pfn_range
in the dmabuf heaps so that this memory is visible in PSS. However if
a driver that sets VM_PFNMAP tries to use a dmabuf heap, it will step
into this BUG_ON. We wanted to catch and gradually fix such drivers
but without causing a panic in the process. I hope this clarifies the
reasons why I'm making this change and I'm open to other ideas if they
would address this issue in a better way.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
