Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881C3FBF26
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 00:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE5A89826;
	Mon, 30 Aug 2021 22:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A300B89826
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 22:57:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so20449736otf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 15:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IgNtEcDZQYpnxUhKwK1Y64JNpR5yZnR8nDQ2CGL58ss=;
 b=cq/frymfoyMDYMU4NwfOEIJbI+86Ym6k982L2Gg29qFMcuwytNzKoFW5uKuZxAwMB6
 +rTaUPphEN8PH++qjPDr5h1rBDTSu2TbznbTvfNDEF2/DDjJUC/5ZuZ+KlC06YiHju9U
 sZBHCWceJN954nu7dFL/iiXuHQJqsv4WelZKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IgNtEcDZQYpnxUhKwK1Y64JNpR5yZnR8nDQ2CGL58ss=;
 b=oijtxX7GfieLtk6StoFuT+vbRwkoz5AWvenX/9H7WuKKQX2edmK5a6BI4vobam0Dy2
 Qc+/F0Ue7Lk/fBrqmAagEI3mGKclrmZ3dqb9zeZ+L2gP7A9fJosa9AaK7zOcD+vrr4M5
 E5FAa2r1s+rSXgyfzxm+P073bytLVUW9MtVjIQLm1BB8CmPQTyoDMT9TlZR5fPSSB5/A
 VsgXvfi2faTrYfq6YzE3U8SIJ9gW32hY0MP32/XdEKoeoz8PyUkInGOAoYSRSMM5Mz2R
 /+7cYshJDmwKPsfz9hXWaMgADgOydZ5GhAIZRqJsmtdVQy/xQH48YbWvj36u3Z2Qd5EO
 GSVw==
X-Gm-Message-State: AOAM533/ove6V6CDJtLR21imcLP7aO733BSINrf4Aw9mq1UR972HjW0M
 aelFpeH7ImDPh20p8mMsm8G/JAJ+Mt/zy+0qTw68lw==
X-Google-Smtp-Source: ABdhPJzWGruQtut3QHnZKFGkuKTglsrWiZnebtBcUTlvC7inrIoATQeXi+JwZJyauVTkRo6WLLX9dfZzAOkuTFyohVE=
X-Received: by 2002:a9d:123:: with SMTP id 32mr22328386otu.124.1630364258002; 
 Mon, 30 Aug 2021 15:57:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 15:57:37 -0700
MIME-Version: 1.0
In-Reply-To: <db5ae1c8d070509580218a501cfa9caaf3f029e1.camel@redhat.com>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
 <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
 <64049ef6c598910c1025e0e5802bb83e@codeaurora.org>
 <88b5fbe60c95bcdf42353bec9f8c48aefa864a31.camel@redhat.com>
 <f0fcfe7a73e87150a7a1f042269b76a3@codeaurora.org>
 <db5ae1c8d070509580218a501cfa9caaf3f029e1.camel@redhat.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 30 Aug 2021 15:57:37 -0700
Message-ID: <CAE-0n53vquphdhrzq6pyzsHf0_Ev95Mb3BjQ_ub_a8Cdfe5=Fw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
To: Lyude Paul <lyude@redhat.com>, khsieh@codeaurora.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, robdclark@gmail.com,
 sean@poorly.run, 
 abhinavk@codeaurora.org, aravindh@codeaurora.org, rsubbia@codeaurora.org, 
 rnayak@codeaurora.org, freedreno@lists.freedesktop.org, airlied@linux.ie, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lyude Paul (2021-08-30 09:58:01)
> On Mon, 2021-08-30 at 08:56 -0700, khsieh@codeaurora.org wrote:
> > On 2021-08-25 09:26, Lyude Paul wrote:
> > > The patch was pushed yes (was part of drm-misc-next-2021-07-29), seems
> > > like it
> > > just hasn't trickled down to linus's branch quite yet.
> >
> > Hi Stephen B,
> >
> > Would you mind back porting this patch to V5.10 branch?
> > It will have lots of helps for us to support display port MST case.
> > Thanks,

If the patch is tagged for stable then it will automatically be
backported to the 5.10 stable release, or at least attempted. If you
don't see it in the stable tree but it's in Linus' tree then you can
submit the patch directly to stable.  See
Documentation/process/stable-kernel-rules.rst for more info.

>
> I'm assuming you're talking to someone else? A little confused because I don't
> see a Stephen B in this thread

I assume it is me.
