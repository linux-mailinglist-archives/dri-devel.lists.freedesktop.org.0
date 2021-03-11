Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E91338BDE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 12:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0496F5D4;
	Fri, 12 Mar 2021 11:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2F16F5D3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:52:13 +0000 (UTC)
Date: Thu, 11 Mar 2021 16:12:55 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/5] drm: Add and export function
 drm_gem_cma_mmap_noncoherent
To: Christoph Hellwig <hch@infradead.org>
Message-Id: <JPBTPQ.TL10VUKPUBL23@crapouillou.net>
In-Reply-To: <20210311123642.GA1741910@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-4-paul@crapouillou.net>
 <20210311122642.GB1739082@infradead.org>
 <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
 <20210311123642.GA1741910@infradead.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le jeu. 11 mars 2021 =E0 12:36, Christoph Hellwig <hch@infradead.org> a =

=E9crit :
> On Thu, Mar 11, 2021 at 12:32:27PM +0000, Paul Cercueil wrote:
>>  > dma_to_phys must not be used by drivers.
>>  >
>>  > I have a proper helper for this waiting for users:
>>  >
>>  > =

>> http://git.infradead.org/users/hch/misc.git/commitdiff/96a546e7229ec53aa=
dbdb7936d1e5e6cb5958952
>>  >
>>  > If you can confirm the helpers works for you I can try to still =

>> sneak
>>  > it to Linus for 5.12 to ease the merge pain.
>> =

>>  I can try. How do I get a page pointer from a dma_addr_t?
> =

> You don't - you get it from using virt_to_page on the pointer returned
> from dma_alloc_noncoherent.  That beind said to keep the API sane I
> should probably add a wrapper that does that for you.

I tested using:

ret =3D dma_mmap_pages(cma_obj->base.dev->dev,
                     vma, vma->vm_end - vma->vm_start,
                     virt_to_page(cma_obj->vaddr));

It works fine.

I think I can use remap_pfn_range() for now, and switch to your new API =

once it's available in drm-misc-next.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
