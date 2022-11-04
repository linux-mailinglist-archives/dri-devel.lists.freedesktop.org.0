Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8661A293
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 21:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB3E10E81F;
	Fri,  4 Nov 2022 20:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE6F10E81F;
 Fri,  4 Nov 2022 20:42:54 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id n83so6355060oif.11;
 Fri, 04 Nov 2022 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=jQ4gXr1turouEQ95+x3UakyDrVi4g3dT0y7NpfH0qPs=;
 b=lSF8e6DLqbKKv+/YhmRhAK/T1efgb2O636TOXNjLfcC0viXP62NhHdxomxLJWtIe7d
 2JndYje5nsRNFlqIXElcBPkKCNEcFme9PlK3C7Q1VMpYaqUkgV/gQHQcIxtcw2fILMZW
 OKJ4E8wSXhLBL3J9S3NnNPs9rdwe6KKkDhBPqcY/XDJgpqSUigUMcqCvapDa55nrN05q
 GmtiLLrP+Y0lcIHCsefgW4EhiR9DSJnDXwmLBbW8A31Y89yswej4P9L3XtJNKO8bMaw7
 4czQwKTd2lx34+qzGmcV/Exm8IIRhuHeavJKESaaJd5m9cQQb9K2fLTxromO6yhuwk2D
 Ci4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQ4gXr1turouEQ95+x3UakyDrVi4g3dT0y7NpfH0qPs=;
 b=PP1QDRgkdZWKqEZso4Y3ZPiqp1jKjMhorh64SRc+NZp7XA/lEqb++DbyPEhUqLYzfj
 anMdYu9YyUQ+MalHNWc3k7BArRGRstyXNnUkPzc+OHEegwzf5hsqb+q7gJmbvxASUueE
 QJTL4KIy2QAlxGXWE4CrJnvyCOutGoMOwVPgkRx4H0iZ1VxfIUmP+6MvpuwH3FOjztbU
 X0Vd9DPKYPijuFnddEWKnPBV8N1GYUssH/zRXgBDx58tRkZN/89lpqb5Bo4h0FO/h75c
 Ir7aG57LkT4FBeAh5Bq2kSCWXGmi+zHoq62KcdVZZ0uMzZGgrM13+Ks8HF7M9mOcQVWo
 wFfA==
X-Gm-Message-State: ACrzQf3HsMkNkyWFQSM6DmDb0wnVpqq8mlCwI1tXMiXAVKfhaofe/5vX
 6hpfr4eMVQ4xO4/qHKwvZyk=
X-Google-Smtp-Source: AMsMyM6uhfbCXJb2q3AkwRuMO9Mjf9xHTKiSSXkljdTFDkgQ9gIWK1vZZlSecO9utfeB4MFPxnhffw==
X-Received: by 2002:a54:4587:0:b0:359:c737:b2e8 with SMTP id
 z7-20020a544587000000b00359c737b2e8mr20212921oib.234.1667594573223; 
 Fri, 04 Nov 2022 13:42:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056830204100b006619483182csm162608otp.18.2022.11.04.13.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 13:42:52 -0700 (PDT)
Date: Fri, 4 Nov 2022 13:42:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
Message-ID: <20221104204251.GB506794@roeck-us.net>
References: <20221104054053.431922658@goodmis.org>
 <20221104192232.GA2520396@roeck-us.net>
 <20221104154209.21b26782@rorschach.local.home>
 <20221104154355.578ab689@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104154355.578ab689@rorschach.local.home>
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

On Fri, Nov 04, 2022 at 04:38:34PM -0400, Steven Rostedt wrote:
> On Fri, 4 Nov 2022 15:42:09 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
[ ... ]
> 
> > drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
> > drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
> > drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
> > drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = ast2600_timer_shutdown;
> > drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = fttmr010_timer_shutdown;
> > drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.set_state_shutdown = fttmr010->timer_shutdown;
> > drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.tick_resume = fttmr010->timer_shutdown;
> 
> I won't touch structure fields though.
> 

Agreed, same here.

Guenter
