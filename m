Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C099B8125
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 18:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D02410E8F9;
	Thu, 31 Oct 2024 17:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="E8a8972Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1406 seconds by postgrey-1.36 at gabe;
 Thu, 31 Oct 2024 17:25:38 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD9710E41D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Y4xQj4LTzRUb6k8q83bQHFdOmJxhlDsQ0EsOYpsUkYk=; b=E8a8972YeGazZOviobvyl1aKy0
 SdLewCT/1uHVFuozbDWhamizbykPXeYdnnbDpVpu0BU256FY0a5MKYWaggghGzOLTlp5mLqiSR0Ot
 mcnVNraZNV4s6oGzmqjxSt6uNcyuECUff+ae4WNaelT5zcc9waIb4gL56jCDYgo5BzAMlN2zPcupk
 SkVtwVx7h6XBjdO/hsorXwM+1nnuAr//By3gKEtopOBEinMZsuepTrSMb+q8zFl5qNQ0PGR/C1Tuq
 aWuuoKC6P46bweKjKk2sISaAJAvZRkOK7bHZJis8amdHPA+HIMcgIl1w0W49QD6npUTwjB+jbrzTY
 MiPRF0lg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t6YYe-00000009qHi-3YWC; Thu, 31 Oct 2024 17:02:04 +0000
Date: Thu, 31 Oct 2024 17:02:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Maxime Ripard <mripard@redhat.com>
Cc: metux <metux@gmx.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: Requirements to merge new heaps in the kernel
Message-ID: <20241031170204.GL1350452@ZenIV>
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
 <35deac48-4220-4889-833d-1b57b417e968@gmx.de>
 <20241031-bouncy-cute-shrimp-cd2530@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-bouncy-cute-shrimp-cd2530@houat>
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

On Thu, Oct 31, 2024 at 05:45:23PM +0100, Maxime Ripard wrote:
> On Wed, Oct 30, 2024 at 12:16:22PM +0100, metux wrote:
> > On 22.10.24 10:38, Maxime Ripard wrote:
> > > I'm still interested in merging a carve-out driver[1], since it seems to be
> > > in every vendor BSP and got asked again last week.
> > > 
> > > I remember from our discussion that for new heap types to be merged, we
> > > needed a kernel use-case. Looking back, I'm not entirely sure how one
> > > can provide that given that heaps are essentially facilities for
> > > user-space.
> > 
> > For those who didn't follow your work, could you please give a short
> > intro what's that all about ?
> > 
> > If I understand you correctly, you'd like the infrastructure of
> > kmalloc() et al for things / memory regions that aren't the usual heap,
> > right ?
> 
> No, not really. The discussion is about dma-buf heaps. They allow to
> allocate buffers suitable for DMA from userspace. It might or might not
> from the system memory, at the heap driver discretion.

I'm afraid you've misinterpreted that - our hexapedal friend had just
	* noticed that excessive crossposting can get it banned
	* got itself a new address
	* posted a solitary ping as the first test
	* followed that by testing the ability to cross-post (posting you'd
been replying to, contents on chatGPT level)
	* proceeded to use its shiny new address for more of the chorus
whinge exercise they'd been holding with several other similar fellows
(or sock puppets, for all I know).

Just ignore the wanker - it wasn't trying to get any information other
than "will the posting get through" anyway.
