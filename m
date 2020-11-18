Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEB2B87A6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 23:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5176E4CA;
	Wed, 18 Nov 2020 22:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCF46E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 22:27:27 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EDF2246DC;
 Wed, 18 Nov 2020 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1605738447;
 bh=94UdQ2k5CQSg/1Sgfe2lKi2FCJuR7P7/YYX3gXoXjV4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bBMe49pWRvdeGVL+4JZmH932PP/E4wl9kdxyjoz/amhz+ik+Ae+SNEpmTxW0MfJMr
 1kD0vxhiYRiW+apqUA09XvjsRdznxKGOcQK0XzmnE6ICiZL2TQUGzm7vCPCL5UTfnv
 mk0vq1e0KkT5QUu0BYBa7amj3lDXscL4yWDKV7go=
Date: Wed, 18 Nov 2020 14:27:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: christian.koenig@amd.com
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
Message-Id: <20201118142725.aa4678810546c70520dd5d74@linux-foundation.org>
In-Reply-To: <e5a25173-ebea-d856-ed25-45437769f17f@gmail.com>
References: <20201106114806.46015-1-christian.koenig@amd.com>
 <20201106114806.46015-2-christian.koenig@amd.com>
 <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
 <e5a25173-ebea-d856-ed25-45437769f17f@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Nov 2020 11:57:44 +0100 Christian K=F6nig <ckoenig.leichtzumerke=
n@gmail.com> wrote:

> Am 06.11.20 um 23:48 schrieb Andrew Morton:
> > On Fri,  6 Nov 2020 12:48:05 +0100 "Christian K=F6nig" <ckoenig.leichtz=
umerken@gmail.com> wrote:
> >
> >> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> >> adds a workaround for a bug in mmap_region.
> >>
> >> As the comment states ->mmap() callback can change
> >> vma->vm_file and so we might call fput() on the wrong file.
> >>
> >> Revert the workaround and proper fix this in mmap_region.
> >>
> > Seems correct, best I can tell.  Presumably all ->mmap() instances will
> > correctly fput() to original file* if they're rewriting vma->vm_file.
> =

> Yes, exactly.
> =

> Patch #2 provides a helper to make sure that everybody gets the =

> get_file()/fput() correctly while updating vma->vm_file.
> =

> Can I add your acked-by to the patches and push them upstream through =

> drm-misc-next?

Please go ahead.

Acked-by: Andrew Morton <akpm@linux-foundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
