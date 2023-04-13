Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28376E1223
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4D710E048;
	Thu, 13 Apr 2023 16:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225AA10E048;
 Thu, 13 Apr 2023 16:21:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74D6C63F63;
 Thu, 13 Apr 2023 16:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB825C433EF;
 Thu, 13 Apr 2023 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681402870;
 bh=DBYN28adC/1qkwY3HnC2KPIlKTz6xLHOhztUP4g1frU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=TFE9II5OCkhht3T7bC9JmPubNd6r5aVGMrm7E6s8pRGxhrRNDLgSp+6rAdEbP/+0E
 o7N7IpLgZ1FDA2kLxJ5wZZbUWrHCheF5HzdV6sO9a7ZydGrgEq7b/LwLAfDf3+V7QV
 VIBns9PRNgzF2q4NCHl+KBcYu7rihT7c65vmwxgS4EOlCCcdZOqgvd3CofVSJShAAn
 HrNK6V1XygYdKa8FMTPDJBucW8RhhhQmzh640f0rg+4KpGzheBDMAhZMh3mdnoF24I
 eMdwehmI/9dotrxxR6acjZYjcfwhba9gre2zjc+HzyAJZRJLqFt4TPsQLSYNFOYi/i
 xbl7N0rTaY2+w==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 6E39F15404B3; Thu, 13 Apr 2023 09:21:10 -0700 (PDT)
Date: Thu, 13 Apr 2023 09:21:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Subject: Re: [BUG?] INFO: rcu_sched detected expedited stalls on CPUs/tasks:
 { 0-.... } 3 jiffies s: 309 root: 0x1/.
Message-ID: <1384f15b-228f-4a6b-8ac3-d0437db8bc1c@paulmck-laptop>
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
 <87r0spcuvi.fsf@intel.com>
 <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
 <CALjTZvaf1cwcZc9O8g24SnZXsoQaWB97UVQW=g6M0coaudLr6w@mail.gmail.com>
 <2495408f-a644-4e56-aaca-e6915cbda179@paulmck-laptop>
 <CALjTZva=JHsckrBeHgJcd-_TDMgYgmZGcXavJ=GhPr7VQCOF5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALjTZva=JHsckrBeHgJcd-_TDMgYgmZGcXavJ=GhPr7VQCOF5g@mail.gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 04:32:32PM +0100, Rui Salvaterra wrote:
> Hi, Paul,
> 
> On Thu, 13 Apr 2023 at 15:43, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > My guess would be that you have CONFIG_RCU_EXP_CPU_STALL_TIMEOUT set to
> > some small non-zero number, for example, you might have set up a recent
> > Android .config or some such.  The default of zero would give you about
> > 21 seconds rather than the three jiffies that you are seeing.
> >
> > Could you please check your .config?
> 
> Well, this is embarrassing. I can't fathom why/how, but I had it set
> to 20, on this machine. That is, 20 millisseconds. I guess its a
> miracle I haven't seen *more* expedited RCU traces. Sorry for the
> noise, everyone.

Been there, done that!

And actually, it is kind of reassuring that the Linux kernel avoids
tens-of-milliseocnds latency blows in the common case on your system.

						Thanx, Paul
