Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABD671D13
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B055810E744;
	Wed, 18 Jan 2023 13:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3177310E742
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:08:49 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1674046774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ia5mcSSMCX645DNR37kXbpCtB0DOcgHMBUz20RFHfC4=;
 b=PgZLyda/qk+zlwhzR6idZiNhlWjQ9dhxCmeT4rrrl2GneTevgb/CsxE+hZPT77/XxN/D3C
 OdouussxQq3+fqW0hIcz/Ki25tMkMCvzzYDB8pBZcMQlLCpDT5VZb1pVYMSDA/j2hwWryO
 XALXhf/W98qKDyrndcj1X2VDtSU3suaEkQMvFPFJNRpd3rP5YqRNavHx/iRYRfI3oGDLj7
 Fyk2vEI66UfwY0KA5lZAxmspc7UiU9mKVU0asexmqh+7rGYFxRvu36Ar6cF1VNhzA334Kh
 j+N92wF2QwyoojycoKuUH4XjJ9yjXMXivJ1ePjsam5T0B2hbJpAWejPbykJQrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1674046774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ia5mcSSMCX645DNR37kXbpCtB0DOcgHMBUz20RFHfC4=;
 b=twkPO4xqcEqK9BdeHGZeT7P1XO2VXaNzoSGOiyD8GCiyvcCMbRNK/TsG05ivxP6PlVlbsI
 bMflMGBUtRJ91XBw==
To: Byungchul Park <byungchul.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v7 07/23] dept: Apply sdt_might_sleep_strong() to
 wait_for_completion()/complete()
In-Reply-To: <1673235231-30302-8-git-send-email-byungchul.park@lge.com>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
 <1673235231-30302-8-git-send-email-byungchul.park@lge.com>
Date: Wed, 18 Jan 2023 13:59:34 +0100
Message-ID: <87wn5khubt.ffs@tglx>
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
> Makes Dept able to track dependencies by
> wait_for_completion()/complete().
>
> In order to obtain the meaningful caller points, replace all the
> wait_for_completion*() declarations with macros in the header.

That's just wrong.

> -extern void wait_for_completion(struct completion *);
> +extern void raw_wait_for_completion(struct completion *);

> +#define wait_for_completion(x)					\
> +({								\
> +	sdt_might_sleep_strong(NULL);				\
> +	raw_wait_for_completion(x);				\
> +	sdt_might_sleep_finish();				\
> +})

The very same can be achieved with a proper annotation which does not
enforce THIS_IP but allows to use __builtin_return_address($N). That's
what everything else uses too.

Thanks,

        tglx
