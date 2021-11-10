Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE2844C9FB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 21:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448DF6E51B;
	Wed, 10 Nov 2021 20:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3D36E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 20:03:45 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y1so3893609plk.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 12:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cIlvWeNZo6S7NB8/mVE36tUxBBajUlrl42axwAlyXyk=;
 b=KwEE6s88T5Lxa6y2mLMP72t9Qsi41kIX9JmLaSXXroYMsnObuMtwCe+PLOfO7tHUdE
 cN7rRy0u6CBJYsTUADZbOn7Ta90SFeW9C84dUsI8NAkq9vFaFclLfIL+vxmE6+sETH7h
 c4a8J8Oyi2HiO8PavbefuYkBE2AZ2Rpo21IgFc0vqa0EuJxTAv1EK7+8aXZgbcWtSEg+
 mxq31kv6Q9QVlv+2SUaMUjMCTpHRsew266socNmzguFApj+9eqr7n2NQOZdrf8GTMeN9
 Er2gfbkjwTzrAwJRDd7e1d+5ccB8OzG/c6j4biqVgde/BqxMIWNIo2kwO0GOvNj96d+a
 x78Q==
X-Gm-Message-State: AOAM530Q7U8VpKZB5qo/zgE5z58/7z281CyE6cVFPamQ5I7aHoAZ5qP5
 7jPOlAlsB3BUCbVCVinHZfI=
X-Google-Smtp-Source: ABdhPJxbf0ym4tQoEUXmUhiY1kni30w1bAq/gA3YYv9+uo4kA2qpDC0AcveRpv3V8lpBfX+icly3mw==
X-Received: by 2002:a17:90a:ce02:: with SMTP id
 f2mr1771441pju.77.1636574624742; 
 Wed, 10 Nov 2021 12:03:44 -0800 (PST)
Received: from sultan-box.localdomain ([199.116.118.235])
 by smtp.gmail.com with ESMTPSA id e7sm317936pgk.90.2021.11.10.12.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 12:03:44 -0800 (PST)
Date: Wed, 10 Nov 2021 12:03:40 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <YYwlnEQO0raDwS86@sultan-box.localdomain>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <YYuS1uNhxWOEX1Ci@phenom.ffwll.local>
 <87fss4wcgm.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fss4wcgm.fsf@jogness.linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Anton Vorontsov <anton@enomsg.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 11:13:37AM +0106, John Ogness wrote:
> Even after we introduce kthread printers, there will still be situations
> where direct printing is used: booting (before kthreads exist) and
> shutdown/suspend/crash situations, when the kthreads may not be
> active.

Although I'm unaware of any ongoing kthread printer work, I'm curious to know
how a kthread approach wouldn't employ a try_to_wake_up() from directly inside
printk(), since the try_to_wake_up() hit from inside the fbcon code is what
caused my deadlock.

Sultan
