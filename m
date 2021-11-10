Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B244C984
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDAF6E3DB;
	Wed, 10 Nov 2021 19:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280D16E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:50:35 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so2767330pja.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mo5YZKmHyRzCkm81yC0SP0wa5RXfdbdNjSOonoGLKIQ=;
 b=P4bdhnSwlgyliqjZC7rwREsfyKnssypIDCdWYrwsvj52jftM+085+bmkV6nCJzB6jI
 Iop94sCBGSYf0sbi86QddSXF4/NGi4kOs5jC1EWkBNJfawlfUu8fEOOcNvNOyjUZ9VcR
 f0RDlErTz8s1DRswdB0D9iY2x7wnbbkHE9tecRUyNND0L6/VEkCwHNseqZOJYDtUTitb
 3kGNJZEUfTtL5hgNEEVCIFn48PndZL2zftMwuVaQ++ifuZiDNGBbtOKetW4IsGzUif9g
 WFu+WWN3zuY/selrpyslIFZQwUyzZEwqePa8T3Rs/eS18BoB554Hf4h7qEA4irMRYrcB
 DjGg==
X-Gm-Message-State: AOAM530ONUdgqwFe5rn6BKxw+AJ1qp1bRWV2kEZZSUsATaxwykLg+gEZ
 +CI51BmGvm0s+Rj1da5WrCE=
X-Google-Smtp-Source: ABdhPJya2DgM3aSAJccMby5bM3ok2fVFwWCNM7NUIHMJrIAqOTjmGRXJZ72if4N5reehWnZR92vzSA==
X-Received: by 2002:a17:903:2344:b0:142:25b4:76c1 with SMTP id
 c4-20020a170903234400b0014225b476c1mr1798630plh.43.1636573834724; 
 Wed, 10 Nov 2021 11:50:34 -0800 (PST)
Received: from sultan-box.localdomain ([199.116.118.235])
 by smtp.gmail.com with ESMTPSA id ml24sm402251pjb.16.2021.11.10.11.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:50:34 -0800 (PST)
Date: Wed, 10 Nov 2021 11:50:30 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <YYwihj21abVmf9Ag@sultan-box.localdomain>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <CAKfTPtC_A-_sfQ+rm440oHwd2gUZ222FMwsi-JTkyLPc-x0qrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtC_A-_sfQ+rm440oHwd2gUZ222FMwsi-JTkyLPc-x0qrw@mail.gmail.com>
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
 Anton Vorontsov <anton@enomsg.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 10:00:35AM +0100, Vincent Guittot wrote:
> Is it the same SCHED_WARN_ON(rq->tmp_alone_branch !=
> &rq->leaf_cfs_rq_list); that generates the deadlock on v5.15 too ?
> 
> one remaining tmp_alone_branch warning has been fixed in v5.15 with
> 2630cde26711 ("sched/fair: Add ancestors of unthrottled undecayed cfs_rq")

I should clarify that I didn't actually reproduce the issue on v5.15; I just saw
that the call chain leading to the deadlock still existed in v5.15 after looking
through the code.

Failing the SCHED_WARN_ON(rq->tmp_alone_branch != &rq->leaf_cfs_rq_list); assert
is extremely rare in my experience, and I don't have a reproducer. It has only
happened once after months of heavy usage (with lots of reboots too, so not with
crazy high uptime).

Sultan
