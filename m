Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F661A0C7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 20:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72C210E108;
	Fri,  4 Nov 2022 19:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE4D10E108;
 Fri,  4 Nov 2022 19:22:35 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r76so6124533oie.13;
 Fri, 04 Nov 2022 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=+CrrtBZaWaBIBfDEz9a9BacRZtXiPhURWnCTyiBknKU=;
 b=f7SabvhELt4tvu58wD/HGUQtx2q3c42bp4689l/poRMwjHONs2y+uJybLQ6btnBic8
 iSYK/T680hWQ8YubanyiQ/jk4TxtOOSgyzZyzTjBStaumbjkRAc3PTfrEP9z1ET4ppjL
 os0cjm+F8kyIi27l3gX1TCu+EYDnb6I6sC6rEheSVAEJvEJuF1rkSUHHVYhQ9PjtWNZC
 /KoHUhscmHo/jN1PCMTUxC8NT4KR3QukfsWt+gbIkumzBVh1p3Sny9bKzJeet5110tpk
 HzVFo5k5iKj3j88DvNf1ucVPdH/av+bU0vEDu76g9bGVlHfWhJDUhqHlYTifQBH3QuBi
 oWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CrrtBZaWaBIBfDEz9a9BacRZtXiPhURWnCTyiBknKU=;
 b=CQYYSu4DgxCjmGeZPC8bo4NPy7sBOJK7p3Daffs+y6pbRdUg9BYjvG51OVEuONLlb3
 ombWISgwDKaoSNdWqpOo769d7STZVL9BPivpC2YxSRTuSwiXKWNtTHIjrQ06GKX9wSYT
 ZeWeCtZ0EGPVWVjfq/Ail2jU0PqmcCadcnNNhSeXMk9bjtX/0QQEBnrEAG8x0RXw8Fqt
 pLZ0Tfb9xbJU6CQTphXdltx7EXnAgxRN2/nk+b45vO5ddo+CO7ptI7O3tSawjx1VQQwE
 NBrGndheX6Pyas1Adt1ibqyF3CFcS+Tf6xvF4dq4MZJx8OuOUGcxwyeGoM0RlldaFN6k
 zPBQ==
X-Gm-Message-State: ACrzQf0T5Ac3xtY3tzOpjhWpOwR8BXCHqS7SUh/k354fQkCB6sMTaJvd
 H/JEbRPLu5eZhnaWTYg7dy0=
X-Google-Smtp-Source: AMsMyM5j57nGJ6ihP9Jnolnn5vAnBZp3njFzbqkVuO45h5Gs91zBtM7qMBV3ZTA/jEfxwCmFGOBzYQ==
X-Received: by 2002:aca:2819:0:b0:359:f8a7:c88 with SMTP id
 25-20020aca2819000000b00359f8a70c88mr260428oix.278.1667589755023; 
 Fri, 04 Nov 2022 12:22:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n132-20020acabd8a000000b003547a3401e6sm1729901oif.43.2022.11.04.12.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 12:22:34 -0700 (PDT)
Date: Fri, 4 Nov 2022 12:22:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
Message-ID: <20221104192232.GA2520396@roeck-us.net>
References: <20221104054053.431922658@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104054053.431922658@goodmis.org>
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-leds@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, bridge@lists.linux-foundation.org,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org,
 cgroups@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 04, 2022 at 01:40:53AM -0400, Steven Rostedt wrote:
> 
> Back in April, I posted an RFC patch set to help mitigate a common issue
> where a timer gets armed just before it is freed, and when the timer
> goes off, it crashes in the timer code without any evidence of who the
> culprit was. I got side tracked and never finished up on that patch set.
> Since this type of crash is still our #1 crash we are seeing in the field,
> it has become a priority again to finish it.
> 
> This is v3 of that patch set. Thomas Gleixner posted an untested version
> that makes timer->function NULL as the flag that it is shutdown. I took that
> code, tested it (fixed it up), added more comments, and changed the
> name to timer_shutdown_sync(). I also converted it to use WARN_ON_ONCE()
> instead of just WARN_ON() as Linus asked for.
> 

Unfortunately the renaming caused some symbol conflicts.

Global definition: timer_shutdown

  File             Line
0 time.c            93 static inline void timer_shutdown(struct clock_event_device *evt)
1 arm_arch_timer.c 690 static __always_inline int timer_shutdown(const int access,
2 timer-fttmr010.c 105 int (*timer_shutdown)(struct clock_event_device *evt);
3 timer-sp804.c    158 static inline void timer_shutdown(struct clock_event_device *evt)
4 timer.h          239 static inline int timer_shutdown(struct timer_list *timer)

Guenter
