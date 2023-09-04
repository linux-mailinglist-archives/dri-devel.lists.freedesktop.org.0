Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C50791B4C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C54A10E3A3;
	Mon,  4 Sep 2023 16:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C83D10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:16:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 04AA766072C1;
 Mon,  4 Sep 2023 17:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693844197;
 bh=T6L8CtsRWEJoEN/RWwRjuUquW+tFpUVmrqIKkdkzq8M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XUTuxU9+CKpilZZrjMSLX+ei12b9VMP9oo+Kac+rk8FCxZvp3SuJ/xiWgXKdZZBup
 iHWK8MokGJNRwEpg2TlD7W+n/IIBykUweJcxoGdWbYpEmS+2MVylBVn1LYll2bnsS9
 y1+s/HPyQmsfQX+2auF4rwwQFqE6TPlDuPndiOhqtIu2oYjZgsAXb5imo8JfW2ozM6
 pygjTzWc23p4OPNnr3Tfd4UVvxkud8Ma8pMMX3NYNixJCQiZ3nkUfowNJtKdDJiC3I
 xA/ltVHJF9Y/QimvQFc6QVgqrHMZuMCRulKP0lqHNCDDVc1QTeXJ2JO1rmKmOHH9Y8
 OK4CKAmqhVL2Q==
Date: Mon, 4 Sep 2023 18:16:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 02/15] drm/panthor: Add uAPI
Message-ID: <20230904181634.5871dfa3@collabora.com>
In-Reply-To: <6f49ff37-0c39-35b3-f78b-02b69a3dcbd0@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-3-boris.brezillon@collabora.com>
 <20230901181039.417c9753@collabora.com>
 <fe1bd580-2c3e-555a-0c1f-34a9ac4bdf9a@arm.com>
 <20230904112609.2e0466a5@collabora.com>
 <6f49ff37-0c39-35b3-f78b-02b69a3dcbd0@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Sep 2023 16:22:19 +0100
Steven Price <steven.price@arm.com> wrote:

> On 04/09/2023 10:26, Boris Brezillon wrote:
> > On Mon, 4 Sep 2023 08:42:08 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 01/09/2023 17:10, Boris Brezillon wrote:  
> >>> On Wed,  9 Aug 2023 18:53:15 +0200
> >>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>>     
> >>>> +/**
> >>>> + * DOC: MMIO regions exposed to userspace.
> >>>> + *
> >>>> + * .. c:macro:: DRM_PANTHOR_USER_MMIO_OFFSET
> >>>> + *
> >>>> + * File offset for all MMIO regions being exposed to userspace. Don't use
> >>>> + * this value directly, use DRM_PANTHOR_USER_<name>_OFFSET values instead.
> >>>> + *
> >>>> + * .. c:macro:: DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET
> >>>> + *
> >>>> + * File offset for the LATEST_FLUSH_ID register. The Userspace driver controls
> >>>> + * GPU cache flushling through CS instructions, but the flush reduction
> >>>> + * mechanism requires a flush_id. This flush_id could be queried with an
> >>>> + * ioctl, but Arm provides a well-isolated register page containing only this
> >>>> + * read-only register, so let's expose this page through a static mmap offset
> >>>> + * and allow direct mapping of this MMIO region so we can avoid the
> >>>> + * user <-> kernel round-trip.
> >>>> + */
> >>>> +#define DRM_PANTHOR_USER_MMIO_OFFSET		(0x1ull << 56)    
> >>>
> >>> I'm playing with a 32-bit kernel/userspace, and this is problematic,
> >>> because vm_pgoff is limited to 32-bit there, meaning we can only map up
> >>> to (1ull << (PAGE_SHIFT + 32)) - 1. Should we add a DEV_QUERY to let
> >>> userspace set the mmio range?    
> >>
> >> Hmm, I was rather hoping we could ignore 32 bit these days ;) But while
> >> I can't see why anyone would be running a 32 bit kernel, I guess 32 bit
> >> user space is likely to still be needed.  
> > 
> > Uh, I just hit a new problem with 32-bit kernels: the io-pgtable
> > interface (io_pgtable_ops) passes device VAs as unsigned longs, meaning
> > the GPU VA space is limited to 4G on a 32-bit build :-(. Robin, any
> > chance you could advise me on what to do here?
> > 
> > 1. assume this limitation is here for a good reason, and limit the GPU
> > VA space to 32-bits on 32-bit kernels
> > 
> > or
> > 
> > 2. update the interface to make iova an u64  
> 
> I'm not sure I can answer the question from a technical perspective,
> hopefully Robin will be able to.

Had a quick chat with Robin, and he's recommending going for #1 too.

> 
> But why do we care about 32-bit kernels on a platform which is new
> enough to have a CSF-GPU (and by extension a recent 64-bit CPU)?

Apparently the memory you save by switching to a 32-bit kernel matters
to some people. To clarify, the CPU is aarch64, but they want to use it
in 32-bit mode.

> 
> Given the other limitations present in a 32-bit kernel I'd be tempted to
> say '1' just for simplicity. Especially since apparently we've lived
> with this for panfrost which presumably has the same limitation (even
> though all Bifrost/Midgard GPUs have at least 33 bits of VA space).

Well, Panfrost is simpler in that you don't have this kernel VA range,
and, IIRC, we are using the old format that naturally limits the GPU VA
space to 4G.
