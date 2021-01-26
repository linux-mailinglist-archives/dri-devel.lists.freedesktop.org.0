Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAAD3055B0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE826E5CF;
	Wed, 27 Jan 2021 08:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DA16E48B;
 Tue, 26 Jan 2021 15:17:51 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id b11so17039966ybj.9;
 Tue, 26 Jan 2021 07:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9FXFErP6A/gwSBw+rzAfUKjLz1z1fESxpPei8HXWfU=;
 b=GH0j9tL2/TMjt5QjQuLKCJgjT4nseRLBSLXF7a1TiYmjD0UJP2uq0/J2uLdvGTZ+Pz
 N3LgtGTGNbqoKznbjDG/3n8Y+6/RMNhloEoty7O9rWuVHmWCxN6kZEFQoGteSGwA6GQH
 K0fmbiki4tU+T7HVR2sR8kKNPEwyhjl2ZLbYJM3AeuR2lpE7Ka6DXF41kNhPXrFhgXwv
 geh9XIP9PDnLemGifeveh+VTpAdWNkCml7voww4Q4u4Fiy7muNV9i0pAMdPaqLBwtXe2
 xBqRL4eJ7aE0jRXcO0J7wUR/9R6WTZmv7MLHlP4zO3FNfQcY7VNY0HmXqnbwhRGHO0WB
 AZ7A==
X-Gm-Message-State: AOAM5308PUi1HxrH0F5V9mToyCi6wc4KLWf0JMjTB/Jzu+Fewk+0Pfnl
 GW2QxVc7+pPVEaG+FAlZavCuLqAIZgrH+wYkk94=
X-Google-Smtp-Source: ABdhPJzAgd63qyLJVImVip/7rjTH6ghSPCQZjYDK57bWxjJxanQIx3y+KXmR8ojrUJ+gKmZCuSxYMNsgd6+SxosGpi8=
X-Received: by 2002:a25:ade8:: with SMTP id d40mr9247170ybe.414.1611674270857; 
 Tue, 26 Jan 2021 07:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20210126150155.1617-1-kernel@esmil.dk>
 <161167397638.2943.18167940013400200979@build.alporthouse.com>
In-Reply-To: <161167397638.2943.18167940013400200979@build.alporthouse.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 26 Jan 2021 16:17:40 +0100
Message-ID: <CANBLGcyh_fENbRCp481An7YOjFOhXYRP48zkKhWbYoHrGfPo4w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/gt: use new tasklet API for execution list
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Jan 2021 at 16:13, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Emil Renner Berthing (2021-01-26 15:01:55)
> > This converts the driver to use the new tasklet API introduced in
> > commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >
> > ---
> > v2: Rebased on drm-intel-next
>
> Ta. Saves me having to do the fixup.
>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> Will be applied to drm-intel-gt-next which is scheduled for inclusion in
> 5.13. It should apply against the 5.12 merge window if there's a tree
> through which you want to migrate the tasklet API faster.

That's fine by me, thanks!

/Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
