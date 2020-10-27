Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F86F29C7FF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD2B6EC25;
	Tue, 27 Oct 2020 19:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511606EC21
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:01:27 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w191so2408243oif.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/ppSbcOSIkyb0WLxSLtuLH+l8WQbDgVdPBCEGLhzkg=;
 b=ITgfknbVMZfp35lpmLI31j4Nz1iCLqIjRADmmwWUK5/lEwTGJCtZuIg7KxFWy7ItTQ
 hfI9rUKmuyCzK+NN6zramPdeJQr3T/y85wtC502Wh1aA+EVeb5zEhSA9pSEyllBQ0ubV
 93+c6QQRkdWNThoyRK6g0NvSsnUYPyNsOg5A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/ppSbcOSIkyb0WLxSLtuLH+l8WQbDgVdPBCEGLhzkg=;
 b=iO/1Kyl6T+HReg6kmNZLT+1XzBe1resMPgyFbhZMq+yzqOdmp42epEi4fY9nrvW+3K
 WYbH3N1aHVwLYkJel2ta0WR3CRq2S9EMDPyLcnbOgWoQ/wcxJ3IpHpZ2xdcZvq7AL9n9
 BbTuJiZ2/lBPawGE5lWYPmjkFe3hzopdizLjn8Aq/zLTPol5gbRkVfb/mCN16C5qIZJn
 INOYQnFmGLO2Cns2zd0hl9Q8PBayDTA6e6SGKsFr/av8QoxUVrAd0veYXYZCYN6vR8oL
 exN7cjYbzPJAF/LeZhCHnh6QH3VPalqRNs8PlVPxkABG44C1NrtAN0I+ARvojlz5QnT2
 p5mw==
X-Gm-Message-State: AOAM531FJmOqOO1++Cf3oYdN56onC6YhO2lo28HWpOkmBDfKFXdzEuNa
 t3vN1CKJF9eIGXMC9apHodRW0QOIEK/U2HJk8f4VEA==
X-Google-Smtp-Source: ABdhPJwHcWbTJCbJ7AAyjVib0AGCCVAs4xDrwxrSwOfpPtT8albuTTgqSli8X5JVplvyhTsqPY2DxlaYLA/ZcsBiLvA=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr2530848oia.14.1603825286633; 
 Tue, 27 Oct 2020 12:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-3-daniel.vetter@ffwll.ch>
 <20201027185100.GD12824@infradead.org>
In-Reply-To: <20201027185100.GD12824@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Oct 2020 20:01:15 +0100
Message-ID: <CAKMK7uERSRmJ+E03SWsXcjVEbg24pzbVcXf7dpCvcR1JvnTcnA@mail.gmail.com>
Subject: Re: [PATCH 03/65] mm: Track mmu notifiers in
 fs_reclaim_acquire/release
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian K??nig <christian.koenig@amd.com>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Qian Cai <cai@lca.pw>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Hellstr??m <thomas_os@shipmail.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 7:51 PM Christoph Hellwig <hch@infradead.org> wrote:
> Is there a list that has the cover letter and the whole series?
> I've only found fragments (and mostly the same fragments) while
> wading through my backlog in various list folders..

Typoed git send-email command that I only caught half-way through. I
tried to reply with apologies in a few spots, I guess I didn't cover
all the lists this spams :-/

The patch itself is still somewhere on my todo to respin, I want to
pep it up with some testcases since previous version was kinda badly
broken. Just didn't get around to that yet.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
