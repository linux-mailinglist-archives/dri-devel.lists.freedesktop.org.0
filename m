Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E80750162
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381E410E138;
	Wed, 12 Jul 2023 08:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1162 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jul 2023 08:24:38 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BF10E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5TWVCjFGRExPcN05bVzne/2B6BKN45D6agRtviLb2cw=; b=ifUBNQvneXGD6J7waajKoLIn5D
 pG2U4BC29xw3bvWK+iSa+gOc5fps12nyXisO8GUjZ8wBkPcELGpNAi8PTuiQj86VL0sCdJPtz7/SJ
 xDuH43rN8cRQBY3ejlqYEvDoSWs/I9KWpHX7l4ReCDlLbCJaKIVUiQ9cJY3maD4eCUpWtv19dQc9v
 4jLvvZZcrFyGbrozGDxTtRXwc6xqFTZdD2LdxXi8stUAEqMLCPZuf/VMl13F1s0oHfVPzh5xGfpnq
 2A2xfm09toEHq4IIK/6YuxkSg15wVtz4ZkfBoKGkw+JRBLJPojBFi0ryZN9ICESH+dDlfa0WzYGH0
 ztv3GCvQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qJUqQ-00GTmW-3M; Wed, 12 Jul 2023 08:05:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BABA33001E7;
 Wed, 12 Jul 2023 10:05:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A1024243A2F82; Wed, 12 Jul 2023 10:05:04 +0200 (CEST)
Date: Wed, 12 Jul 2023 10:05:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 11:39:17AM -1000, Tejun Heo wrote:

> I wonder whether the right thing to do here is somehow scaling the threshold
> according to the relative processing power. It's difficult to come up with a
> threshold which works well across the latest & fastest and really tiny CPUs.
> I'll think about it some more but if you have some ideas, please feel free
> to suggest.

We could scale by BogoMIPS I suppose, it's a bogus measurement, as per
the name, but it does have some relation to how fast the machine is.
