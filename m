Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF245C346
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 14:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F426E935;
	Wed, 24 Nov 2021 13:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CE26E935
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 13:33:49 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so4232871otv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 05:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=091FqIUggUob/ZEgOD1UGmSVx8eqHMlVt+VyvTQhn6A=;
 b=O31vNprS3Gz06BJk3VF69HCIE/jSj0Xt2Xo048gepj56MMLfwyutaMYZL+B3RYmWPo
 7jT0KaRHr+ejnOPouk3muSAqV/XaM+tzzmtRUGvhz+z2GKjEFORyHdrYrZ6mrK1O5+ys
 av6nqgPkA9YZKradllIVzml/3PWZ5d9oVbUMdO0f4gHHCJKoTOs/x3IUQc7HnE1NMKpt
 qQ3+685ht+RlmV7PW93ozJdGQ3iqE4dWcRNgF+lD22ly/MQC0Y+rF1HKAPKWcgXT4yQq
 CrXzvU9o49+VitpC9mnA+7dlRQmsKWnUrYzC3YqXbr2MbjjNWHW2zGZ89UvgTXVbMDem
 ZtcQ==
X-Gm-Message-State: AOAM533nNP3XYXnQ/w1vJVDCT8bk08209e4RGIYSf8BLx7S2NBisNuCC
 RzljUaLhHObMTgPA0WtAQHOW5mdA7/bn3pCEE3c=
X-Google-Smtp-Source: ABdhPJzQoNI/Fsb1RYaYMIo8ITBU8mCa/gSsaWPVLoUcuICuMNXnffh1kRK/Zt6rxw8a35LfxbFQ+4vJZ0v59kljSMQ=
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr13170421otu.254.1637760829265; 
 Wed, 24 Nov 2021 05:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-13-keescook@chromium.org>
 <CAJZ5v0iS3qMgdab1S-NzGfeLLXV=S6p5Qx8AaqJ50rsUngS=LA@mail.gmail.com>
 <c5d1ee1f3b59bf18591a164c185650c77ec8aba7.camel@linux.intel.com>
In-Reply-To: <c5d1ee1f3b59bf18591a164c185650c77ec8aba7.camel@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Nov 2021 14:33:38 +0100
Message-ID: <CAJZ5v0i61F9SpwfER8o5J_Kf=J9dJUv-qd+bG9hcL42X2eMRtw@mail.gmail.com>
Subject: Re: [PATCH v2 12/63] thermal: intel: int340x_thermal: Use
 struct_group() for memcpy() region
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-staging@lists.linux.dev,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Amit Kucheria <amitk@kernel.org>,
 "open list:NETWORKING DRIVERS \(WIRELESS\)" <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 12:53 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Tue, 2021-11-23 at 14:19 +0100, Rafael J. Wysocki wrote:
> > On Wed, Aug 18, 2021 at 8:08 AM Kees Cook <keescook@chromium.org>
> > wrote:
> > >
> > > In preparation for FORTIFY_SOURCE performing compile-time and run-
> > > time
> > > field bounds checking for memcpy(), avoid intentionally writing
> > > across
> > > neighboring fields.
> > >
> > > Use struct_group() in struct art around members weight, and ac[0-
> > > 9]_max,
> > > so they can be referenced together. This will allow memcpy() and
> > > sizeof()
> > > to more easily reason about sizes, improve readability, and avoid
> > > future
> > > warnings about writing beyond the end of weight.
> > >
> > > "pahole" shows no size nor member offset changes to struct art.
> > > "objdump -d" shows no meaningful object code changes (i.e. only
> > > source
> > > line number induced differences).
> > >
> > > Cc: Zhang Rui <rui.zhang@intel.com>
> > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Amit Kucheria <amitk@kernel.org>
> > > Cc: linux-pm@vger.kernel.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Rui, Srinivas, any comments here?
> Looks good.
> Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied as 5.17 material, thank you!
