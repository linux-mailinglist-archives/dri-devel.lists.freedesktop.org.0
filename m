Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD162726FF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45256E362;
	Mon, 21 Sep 2020 14:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732C6E362
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:28:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id b2so12409536qtp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oe0CZjrJ6zi/aJiPSPUN0Nejlr7TC/IFhiMAmlC+lh8=;
 b=WTihZJ9iYxFGsJglF1XEA7R8PkKVeSdLiSku0NxdQ8QcVoYV8a6lhVjKkMjbBPdpZZ
 n4f8TToug8alm9r7oqsyahL7nxpYac2L/y4ncvte3BeHlfIYaNWINrZ5jEeekeS0K/WG
 Mof4EGahfSAmBNfhKPyW2imMscRcTc20TYFgaLILS+W8pY/ow4ie6yHn81EyPQVwQ42e
 X/nVqDBb1hR4B+un46HCj/o5pdDIr00WxcVrUCY2XmLQAodDPfvDIoTpL0HgjKeyNQcw
 +akATxtq/3Ak+MX7uvpgTRKMID03hxFwK2hd1mldH/8Gh75qSVa9fkAhx9fMkZtnF1YG
 9zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=oe0CZjrJ6zi/aJiPSPUN0Nejlr7TC/IFhiMAmlC+lh8=;
 b=uTJ/kb8IQyuSuXpDXu/+9bOJJtIXeVtWFzePb25YYeMavEp8+ZvjivUf+gzahiuq+Z
 zmJB4JULMBu+VinnTQEQCNBiCZOKuJhRWO0TpvMh4h+YQL+cJesUsogYncqf08uvC0pR
 4QZ69UGP4hJTcUA1jTttMpoLTDdsz+zeJbuFQCgTCnxbTEaq3O8Z8NSf/uEatqoZ2oCY
 evqqY3n1I+9r4awBOMxFFE8Q1rKbUpHS+iWD67gk7YF/+5cshEHVqIrIULKldIvUzLAL
 53IiSs2S/U1KQIYq+7X0WmnpIYzMW07Qo5tjhKd91XgbR9vg2tBfn3cj5vVFRMaOdacb
 aKww==
X-Gm-Message-State: AOAM5322gyuCchjGkQhYA8Z3OV2XOS9AbuIOOvUc/5TT9KJhw7OA39Xn
 +Kcwe2ezG+5/UBhZlfQrS58=
X-Google-Smtp-Source: ABdhPJyIYYOF10xsV68170kw3MDKtnBDxIO7NLKB5vT7r3/UtaUa1QquQeO77oAn3R3HaoK3aSB9DA==
X-Received: by 2002:ac8:76d0:: with SMTP id q16mr34274105qtr.164.1600698514768; 
 Mon, 21 Sep 2020 07:28:34 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:54a6])
 by smtp.gmail.com with ESMTPSA id i18sm2417375qka.50.2020.09.21.07.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 07:28:33 -0700 (PDT)
Date: Mon, 21 Sep 2020 10:28:31 -0400
From: Tejun Heo <tj@kernel.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, timmurray@google.com
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200921142831.GA4268@mtj.duckdns.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921092154.GJ438822@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Sep 21, 2020 at 11:21:54AM +0200, Daniel Vetter wrote:
> The part I don't like about this is that it all feels rather hacked
> together, and if we add more stuff (or there's some different thing in the
> system that also needs rt scheduling) then it doesn't compose.
> 
> So question to rt/worker folks: What's the best way to let userspace set
> the scheduling mode and priorities of things the kernel does on its
> behalf? Surely we're not the first ones where if userspace runs with some
> rt priority it'll starve out the kernel workers that it needs. Hardcoding
> something behind a subsystem ioctl (which just means every time userspace
> changes what it does, we need a new such flag or mode) can't be the right
> thing.

Maybe not first but there haven't been many. The main benefit of workqueue
is that the users get to pool the worker threads automatically. I don't
think the existing workqueue design is something suitable for actual RT use
cases. Furthermore, there are inherent conflicts between sharing resources
and RT as this this patchset is already showing w/ needing per-crtc worker
thread. Maybe we can further abstract it if there are more use cases but for
now kthread_worker based implementation sounds about right to me.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
