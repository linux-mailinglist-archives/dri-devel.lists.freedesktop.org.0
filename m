Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBA31C887
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 11:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4F889A0F;
	Tue, 16 Feb 2021 10:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DB489A0F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=XZQnqYULb/gl4wKI0dnM+AVrQ2LyQklzX1J3h5QDRII=; b=TPdPeYYTIHFKdHhMA6FBieZUR1
 56rbc/Q+FobY51DRosYrVPsDsPUKaKfVkfCJSIwJXKCZQ77xp479j3hu7yH8woN7IGjBt7Hk2vioi
 xeV71s19Hq9mFL4YECb49KzYcMpPQcR0hPDmezYW4qgzpG3NWHU9a8/ksFxp3+vSjK6mUjegvrn1y
 11FJp3d04ADNvoLcMqdIV/30/2poIIQwsF8TXl8sr01svS4u4xiDxrI+POR0z27yhi9qbFAUI5kMM
 /ymHv9eU/yUjU8bIh1l2hXoaydgNF5q1MMOw3ycZ5k6l8KumXn86c74ODr2VBJTX7JcaFDWsY2WCL
 UiDNQB5Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lBxM2-00GjfB-Sq; Tue, 16 Feb 2021 10:13:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3F0DF3011E6;
 Tue, 16 Feb 2021 11:13:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1A8112058B522; Tue, 16 Feb 2021 11:13:14 +0100 (CET)
Date: Tue, 16 Feb 2021 11:13:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mingo@redhat.com, will@kernel.org, apw@canonical.com,
 joe@perches.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mutex: nuke mutex_trylock_recursive
Message-ID: <YCuaup4u1ZE6crE0@hirez.programming.kicks-ass.net>
References: <20210216082146.69286-1-christian.koenig@amd.com>
 <YCuQXAllh91JEZ+Y@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCuQXAllh91JEZ+Y@phenom.ffwll.local>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 10:29:00AM +0100, Daniel Vetter wrote:
> On Tue, Feb 16, 2021 at 09:21:46AM +0100, Christian K=F6nig wrote:
> > The last user went away in the 5.11 cycle.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> Nice.
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> I think would be good to still stuff this into 5.12 before someone
> resurrects this zombie.

Already done:

  https://lkml.kernel.org/r/161296556531.23325.10473355259841906876.tip-bot=
2@tip-bot2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
