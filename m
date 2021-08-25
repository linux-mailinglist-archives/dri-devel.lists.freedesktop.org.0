Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A43F6CFF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F996E0F2;
	Wed, 25 Aug 2021 01:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AB46E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 01:14:32 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id n126so31341158ybf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 18:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xYzcBCCmqFiTA/FsQcTLjxPn/gb6rPm3HzeOt3QB58=;
 b=b0RJwIVXYJJ3Bv1Z5rszRIcOw74vlJF0Wig0BFYl3I88/PQxWB7jI+8Hs1UAwu4dj1
 oC96iX2zqtnHx9KVZLJ7QKPA/i8vG1ZjbjU4ei4ffHOK7/Uc4OGOpZdH9jJrJmQoRJoT
 rRw3IwbGsQWJxJtv2tZ4QMDwodplNiNPzAkbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xYzcBCCmqFiTA/FsQcTLjxPn/gb6rPm3HzeOt3QB58=;
 b=di3uM7lZDxITSCbbzLeWSd96MSMFMyVGo4gXfpz2QdxifD/djRmqauaoP48AX2vhBs
 IoAPV9e38Yfe6+Q6nXWyktZAHcVAXAIkb32KtG6HQm7s5W8mSIxKH9omE7X/+k3FIZWU
 C8ZwcLD/74N3N89LgizaUeXtQtV2kLWGpf7JAw0Wx+bDICGwgvD/19+e5/gGpt9K0s3F
 LpdTVjFj+JAJBfpRGhvozCc4tnhMKXIn2Rl/83X5H63VwGle8bgEKjvPf+VSpERuwAm6
 RiBdY1mPQfC3zM2zs/MM1qv8H6hUHvRuRQL6pNNXfZfb466lboiIXswHF1U/eaizy5n7
 q+lg==
X-Gm-Message-State: AOAM530yuKA1I37jFfsgOalCb6u8fXKYzGlcPccvh87lMmQITrJNSRwD
 MoYb0JvJ0bg6qdrfexO/k7ppyzIjIfETwkYpnQeErQ==
X-Google-Smtp-Source: ABdhPJxnaKJtrPb6TMYZjsr0sNxWhPt4q+sfc95cVL2VggioIFmQtjcvwnULfLpT7vXgph++v64vZ1flb+5uuuvkCwk=
X-Received: by 2002:a25:21c5:: with SMTP id h188mr52216373ybh.23.1629854071534; 
 Tue, 24 Aug 2021 18:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210820162201.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
 <CAD=FV=W56FsUOzrRQ7Y5F4g7yBSXr-KJ45t32ghGSsNtFsNUMg@mail.gmail.com>
In-Reply-To: <CAD=FV=W56FsUOzrRQ7Y5F4g7yBSXr-KJ45t32ghGSsNtFsNUMg@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Tue, 24 Aug 2021 18:14:20 -0700
Message-ID: <CA+cxXhmugPkSNoXCrVTJdY9rq-vMP3AXrCKFxdMT9yhPVQhPaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Reorg the macros
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Philip Chen <philipchen@google.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

On Tue, Aug 24, 2021 at 3:37 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Aug 20, 2021 at 4:22 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > From: Philip Chen <philipchen@chromium.org>
> >
> > Reorg the macros as follows:
> > (1) Group the registers on the same page together.
> > (2) Group the register and its bit operation together while indenting
> > the macros of the bit operation with one space.
> >
> > Also fix a misnomer for the number of mipi data lanes.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > Signed-off-by: Philip Chen <philipchen@google.com>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
>
> This seems fine to me other than the slightly mixed up Signed-off-by
> lines. I think that the git config from wherever you ran "git
> send-email" had your @google.com address even if you authored the
> patch with your @chomium.org address. Once that's fixed then I'm happy
> to add my Reviewed-by and (unless someone objects) I'll plan to apply
> this patch to drm-misc-next.

Thank you.
I just posted v2 with the double sign-off lines fixed.
PTAL.

>
> -Doug
