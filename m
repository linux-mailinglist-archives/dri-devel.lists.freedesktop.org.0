Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCF671CD5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD91810E73E;
	Wed, 18 Jan 2023 13:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Wed, 18 Jan 2023 13:01:02 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BF110E73E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:01:02 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1674046861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvU5ktIQmVNE7PMEvHhaDxnSXDUDDxFR9HB1GTxmaWs=;
 b=zqvl7Bj+ZRP9DSrW/fabry1GJ6PA3Qs7F0wn8VIaO3nv79rgrCMrMlgJcMINIqL9TcAz6a
 P8bb+kjC3vFVYjKqtFTr2wq5LoUKf+cRMpTyTa6OFw1uIS842CRMYDilcYo5ld1kHwt+BM
 Lpk6hvrc0bUAVHQdFG+nNoPV7xV14/Z2zZ+AMPBkDEl1eQpu8xWhx5HxJckCd6It3gtwOp
 b00/Ba7HLqNcXFVoI9RBqA1XXiX/QSg0sLO/wio0GiDmh9tAQOgXOFfbfIrSWIknG7fvQG
 dVIxwGYgY4T9XvjdSg8nnQ1rNvaAiKcBKllNi8/QiKvD6BLG71Crj8WAdF07dQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1674046861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvU5ktIQmVNE7PMEvHhaDxnSXDUDDxFR9HB1GTxmaWs=;
 b=QXhl89bqfWvcYxf1pYaDR/+FRpRaGdsHvTHK92uTVq3RXeDDH1cKWqHk6Icb4ZDeglUhSq
 KVsyMn+ekUETd0DQ==
To: Byungchul Park <byungchul.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v7 03/23] dept: Add single event dependency tracker
 APIs
In-Reply-To: <1673235231-30302-4-git-send-email-byungchul.park@lge.com>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
 <1673235231-30302-4-git-send-email-byungchul.park@lge.com>
Date: Wed, 18 Jan 2023 14:01:01 +0100
Message-ID: <87tu0ohu9e.ffs@tglx>
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
Cc: kernel-team@lge.com, hamohammed.sa@gmail.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 melissa.srw@gmail.com, linux-mm@kvack.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, ngupta@vflare.org, johannes.berg@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, dan.j.williams@intel.com, vbabka@suse.cz,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 linux-ide@vger.kernel.org, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09 2023 at 12:33, Byungchul Park wrote:
> +/*
> + * sdt_might_sleep() and its family will be committed in __schedule()
> + * when it actually gets to __schedule(). Both dept_request_event() and
> + * dept_wait() will be performed on the commit.
> + */
> +
> +/*
> + * Use the code location as the class key if an explicit map is not used.
> + */
> +#define sdt_might_sleep_strong(m)					\
> +	do {								\
> +		struct dept_map *__m = m;				\
> +		static struct dept_key __key;				\
> +		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, true);\
> +	} while (0)
> +
> +/*
> + * Use the code location as the class key if an explicit map is not used.
> + */
> +#define sdt_might_sleep_weak(m)						\
> +	do {								\
> +		struct dept_map *__m = m;				\
> +		static struct dept_key __key;				\
> +		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, false);\
> +	} while (0)
> +
> +#define sdt_might_sleep_finish()	dept_clean_stage()
> +
> +#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
> +#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
> +#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)

None of the above comes with a proper documentation of the various
macros/functions. How should anyone aside of you understand what this is
about and how this should be used?

Thanks,

        tglx
