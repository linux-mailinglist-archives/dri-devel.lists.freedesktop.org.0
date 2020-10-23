Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61917297169
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 16:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFCA6E0C6;
	Fri, 23 Oct 2020 14:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF016E0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 14:37:13 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n11so1559308ota.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ue1eoYp/rV3X5fZ+14rS63RmMW1v9BsYmIiuPRkgMlc=;
 b=M8kF83YM7xkRfHNyf/imBorp00wSjhbgh/S8X7DXov96K6NtfkVZ7v9QVfIAfZA9H9
 O7EQwr6GuFK75XbpMbj/wQE2MrtKGKUaELIbUX3Dj3BYu3iF0wd3dYl4sruBBDTnyJgg
 Zx8zI5CS4WAbjTeKFiU1Htb5hwRJFgP2ypNP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ue1eoYp/rV3X5fZ+14rS63RmMW1v9BsYmIiuPRkgMlc=;
 b=Pju4kF43uqXWmjjsgqsncboEU247ekB1StNRoPozI2+yJzFhqvulO1Nx0t7mJSbtLc
 eIXebm54DpLowcJ1hOI1ejEIzp4NFvnH66dJ7nd1P2QQAfHRiaiwu/qONMnkE8uYcxqe
 DL7waPneyK8SbE5lTreg4FVdYXyXl76nh8B2bgJL2BrI68/4A4L+Z22/IWvhSK6hWfSD
 1krCNtnJ+e9rFXcNZp51KVyCraoX5gXYjffNVMhN6hgRogGda+QpbUY2Auclmgz5ykJy
 kV/xaoShG7CFSqXl30GpTty8BTkFrbzIDRqNh4Lr8VUi5vRI3CzsKpwilnsC/OT2hNVt
 UPRg==
X-Gm-Message-State: AOAM531Cu8uLhhE2I2vcX3Ip8WVEcWg4OFluOA3oC3xJR+YIeect2ct9
 eRmOVv5IKerL3zrx1Q3KjCA6aWn+a9PJ8pJ7aydh8A==
X-Google-Smtp-Source: ABdhPJyi58HmdEa7AIVzkzyqQTfTPkHR4zZzgTo7KlLhbs3gCVZsj5F1oZVA2pGhIrfdST5nhUdlVgXIJM7T0/Qt6U4=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr1951924otr.281.1603463832695; 
 Fri, 23 Oct 2020 07:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-4-daniel.vetter@ffwll.ch>
 <20201023141619.GC20115@casper.infradead.org>
In-Reply-To: <20201023141619.GC20115@casper.infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Oct 2020 16:37:01 +0200
Message-ID: <CAKMK7uESHHHzEC2U3xVKQEBZqS5xwQJeYFpwMz3b8OaoFEYcUQ@mail.gmail.com>
Subject: Re: [PATCH 04/65] mm: Extract might_alloc() debug check
To: Matthew Wilcox <willy@infradead.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Michel Lespinasse <walken@google.com>,
 Ingo Molnar <mingo@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Waiman Long <longman@redhat.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Qian Cai <cai@lca.pw>, Thomas Gleixner <tglx@linutronix.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 Randy Dunlap <rdunlap@infradead.org>, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 4:16 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Oct 23, 2020 at 02:21:15PM +0200, Daniel Vetter wrote:
> > Note that unlike fs_reclaim_acquire/release gfpflags_allow_blocking
> > does not consult the PF_MEMALLOC flags. But there is no flag
> > equivalent for GFP_NOWAIT, hence this check can't go wrong due to
> > memalloc_no*_save/restore contexts.
>
> I have a patch series that adds memalloc_nowait_save/restore.

tbh this was a typoed git send-email, but thanks for the heads-up,
I'll adjust the patch accordingly.

Cheers, Daniel

> https://lore.kernel.org/linux-mm/20200625113122.7540-7-willy@infradead.org/



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
