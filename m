Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184983E068
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0E310FCA1;
	Fri, 26 Jan 2024 17:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jan 2024 17:37:18 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600D310FCA8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:37:18 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1706290203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y16NGcUWXAd/jpol4Aw++3XVEwkU5CL0GFzr1MU53XY=;
 b=bGdeKoUW9WdLqEtKEsxkWkPluiF27VXCxZSKAv3EF91of84hHPJu/t+7B9mlIfqDmwyhVQ
 5Wy0Ak8LYkBMFC536ObQrarSAFKXlxaX18tfj4mZezpiUfaQdkDMG9wQCtqs11xhoOwLv7
 pA8thEtSPHwm3lmTvJ07FPxtZYE52z+dy31Yz3fjNkM6LKIgSZ5nuds6Q52aKp/nVmBSyY
 +spk4CBBiK/sbO9HcOKfH2EIVtfT4fH6iY90wZoZZeksjxdCmGo7r0pBec73lzMMxFQhVc
 xpFa/bEbvEtI2gao8tw9CtiPgX/FYFPnpnN4YzjNzl3kjaWgFj/y/mmB8OSJKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1706290203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y16NGcUWXAd/jpol4Aw++3XVEwkU5CL0GFzr1MU53XY=;
 b=tuzagaiUxCjRffYVMgp6n3kaVE2tR+Ydl0coEnXTNFJKMgQQ2tLfSrtS+THdp+B8unTwvq
 SjL+Cz4iYZ9oxJBQ==
To: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 14/26] locking/lockdep, cpu/hotplus: Use a weaker
 annotation in AP thread
In-Reply-To: <20240124115938.80132-15-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
 <20240124115938.80132-15-byungchul@sk.com>
Date: Fri, 26 Jan 2024 18:30:02 +0100
Message-ID: <87il3ggfz9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, dan.j.williams@intel.com,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24 2024 at 20:59, Byungchul Park wrote:

Why is lockdep in the subsystem prefix here? You are changing the CPU
hotplug (not hotplus) code, right?

> cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
> introduced to make lockdep_assert_cpus_held() work in AP thread.
>
> However, the annotation is too strong for that purpose. We don't have to
> use more than try lock annotation for that.

This lacks a proper explanation why this is too strong.

> Furthermore, now that Dept was introduced, false positive alarms was
> reported by that. Replaced it with try lock annotation.

I still have zero idea what this is about.

Thanks,

        tglx
